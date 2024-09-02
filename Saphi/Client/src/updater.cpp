#include "updater.h"
#include "requests.h"
#include "patch.h"
#include "io.h"
#include "languages.h"

#include <CRC.h>
#include <fstream>
#include <filesystem>
#include <format>

Updater::Updater()
{
  g_dataManager.BindData(&m_updated, DataType::BOOL, "Updated");
  g_dataManager.BindData(&m_hasDuck, DataType::BOOL, "Duck");
  g_dataManager.BindData(&m_hasRedux, DataType::BOOL, "Redux");
  g_dataManager.BindData(&m_deleteOldVersions, DataType::BOOL, "DeleteOldVersions");
}

bool Updater::HasValidUpdate()
{
  return m_updated;
}

bool Updater::IsBusy()
{
  m_routineMutex.lock();
  bool ret = m_routineCount > 0;
  m_routineMutex.unlock();
	return ret;
}

bool Updater::HasUpdateAvailable()
{
  return m_updateAvailable;
}

void Updater::IsValidBios(RoutineStatus& ret, const std::string& path)
{
  StartRoutine(
    [&path]
    {
      /* All NTSC-U BIOS CRC32: https://github.com/brad-lin/FreePSXBoot?tab=readme-ov-file#downloads
        openbios.bin and openbios-fastboot.bin */
      const std::vector<uint32_t> biosChecksums = { 0x55847d8c, 0xaff00f2f, 0x37157331, 0x8d8cb7e4, 0x502224b6, 0x6a0e22a0, 0x171bdcec, 0x68363af6, 0x6f86246d };
      std::vector<char> v;
      IO::ReadBinaryFile(v, path);
      uint32_t fileChecksum = CRC::Calculate(v.data(), v.size(), CRC::CRC_32());
      for (uint32_t checksum : biosChecksums)
      {
        if (checksum == fileChecksum) { return true; }
      }
      return false;
    },
    &ret
  );
}

void Updater::IsValidGame(RoutineStatus& ret, const std::string& path)
{
  StartRoutine(
    [&path]
    {
      const uint32_t gameChecksum = 0x9A742438;
      std::vector<char> v;
      IO::ReadBinaryFile(v, path);
      if (CRC::Calculate(v.data(), v.size(), CRC::CRC_32()) == gameChecksum) { return true; }
      return false;
    },
    &ret
  );
}

void Updater::CheckForUpdates(const std::string& currVersion)
{
  StartRoutine(
    [this, &currVersion]
    {
      std::string version;
      Requests::CheckUpdates(version);
      const std::string patchedGame = GetPatchedGamePath(currVersion);
      if (currVersion != version || !std::filesystem::exists(std::u8string(patchedGame.begin(), patchedGame.end())))
      {
        m_updateAvailable = true;
        m_versionAvailable = version;
        return true;
      }
      return false;
    }
  );
}

void Updater::Update(std::string& status, IconType& statusIcon, std::string& currVersion, const std::string& gamePath, const std::string& biosPath)
{
  StartRoutine(
    [this, &status, &statusIcon, &currVersion, &gamePath, &biosPath]
    {
      std::string version;
      bool copyIni = false;
      auto updateStatus = [&status, &statusIcon](const std::string& message, IconType icon)
        {
          status = g_lang[message];
          statusIcon = icon;
        };
#if defined(_WIN32) && defined(__linux__)
#error What the hell how is this linux and windows at the same time?
#endif
#ifdef _DEBUG //REDUX
      bool& hasEmulator = m_hasRedux;
      const std::string emuTarget = "Redux";
      const std::string& emuFolder = g_reduxFolder;
      const std::string& emuDlFolder = g_reduxDlFolder;
      #if defined(_WIN32) //windows
      const std::string emuArchive = "redux.zip";
      const std::string emuPath = "/storage/assets/7dd/cb6/4a1/f58bfc1074666c68830644e824d684af4e62f6a0fd18805071d275b/pcsx-redux-nightly-19496.20240830.2-x64.zip";
      const std::string domain = "distrib.app";
      #elif defined(__linux__) //linux (non macos, non BSD)
        #error not yet supported
      #else
        #error Unrecognized platform
      #endif
#else //DUCKSTATION
      //platform independent
      bool& hasEmulator = m_hasDuck;
      const std::string emuTarget = "Duckstation";
      const std::string& emuFolder = g_duckFolder;
      const std::string& emuDlFolder = g_duckDlFolder;
      #if defined(_WIN32) //windows
      const std::string emuArchive = "duckstation.zip";
      const std::string emuPath = "/stenzek/duckstation/releases/download/latest/duckstation-windows-x64-release.zip";
      const std::string domain = "github.com";
      #elif defined(__linux__) //linux (non macos, non BSD)
      const std::string emuArchive = "DuckStation-x64.AppImage";
      const std::string emuPath = "/stenzek/duckstation/releases/download/latest/DuckStation-x64.AppImage";
      const std::string domain = "github.com";
      #else
        #error Unrecognized platform
      #endif
#endif
      if (!hasEmulator)
      {
        const std::filesystem::path u8emuFolder = std::u8string(emuFolder.begin(), emuFolder.end());
        updateStatus(std::format("Downloading {}...", emuTarget), IconType::RUNNING);
        if (!std::filesystem::is_directory(u8emuFolder)) { std::filesystem::create_directory(u8emuFolder); }
        if (emuFolder != emuDlFolder)
        {
          const std::filesystem::path u8emuDlFolder = std::u8string(emuDlFolder.begin(), emuDlFolder.end());
          if (!std::filesystem::is_directory(u8emuDlFolder)) { std::filesystem::create_directory(u8emuDlFolder); }
        }
        if (!Requests::DownloadFile(domain, emuPath, emuDlFolder + emuArchive))
        {
          updateStatus(std::format("Error: could not download {}.", emuTarget), IconType::FAIL);
          return false;
        }
#ifdef _WIN32 //.AppImage doesn't need to be decompressed (this should only be run on windows).
        updateStatus(std::format("Decompressing {}...", emuTarget), IconType::RUNNING);
        if (!IO::DecompressFiles(emuFolder, emuArchive))
        {
          updateStatus(std::format("Error: could not decompress {}.", emuTarget), IconType::FAIL);
          return false;
        }
#endif
        updateStatus("Installing Saphi settings...", IconType::RUNNING);
        const std::string g_biosFolder = emuFolder + "bios/";
        const std::filesystem::path u8biosPath = std::u8string(g_biosFolder.begin(), g_biosFolder.end());
        if (!std::filesystem::is_directory(u8biosPath)) { std::filesystem::create_directory(u8biosPath); }
        std::string biosName;
        for (int i = static_cast<int>(biosPath.size()) - 1; i >= 0; i--)
        {
          if (biosPath[i] == '/' || biosPath[i] == '\\')
          {
            biosName = biosPath.substr(i + 1);
            break;
          }
        }
        const std::string concatBios = g_biosFolder + biosName;
        const std::filesystem::path u8concatBios = std::u8string(concatBios.begin(), concatBios.end());
        if (!std::filesystem::exists(u8concatBios)) { std::filesystem::copy_file(std::u8string(biosPath.begin(), biosPath.end()), u8concatBios); }
        const std::string emuPortable = emuFolder + "portable.txt";
        std::ofstream portableFile(emuPortable.c_str());
        portableFile.close();
        hasEmulator = true;
        copyIni = true;
      }
      updateStatus("Checking for new updates...", IconType::RUNNING);
      if (m_updateAvailable || Requests::CheckUpdates(version))
      {
        const std::string prevPatchedGame = GetPatchedGamePath(currVersion);
        const std::filesystem::path prevPatchedGamePath = std::u8string(prevPatchedGame.begin(), prevPatchedGame.end());
        if (m_updateAvailable || version != currVersion || !std::filesystem::exists(prevPatchedGamePath))
        {
          m_versionAvailable = m_updateAvailable ? m_versionAvailable : version;
          std::string path = g_dataFolder + m_versionAvailable + "/";
          if (Requests::DownloadUpdates(path, m_versionAvailable, status, statusIcon) && Patch::PatchGame(path, gamePath, status, statusIcon))
          {
            if (copyIni || !m_updated)
            {
              const std::string iniVersion = GetIniPath_Version(m_versionAvailable);
#if !defined(_DEBUG) //dont do this for redux.
              const std::string iniDuck = GetIniPath_Duck();
              const std::filesystem::path u8iniDuck = std::u8string(iniDuck.begin(), iniDuck.end());
              if (!std::filesystem::exists(u8iniDuck)) { std::filesystem::copy_file(std::u8string(iniVersion.begin(), iniVersion.end()), u8iniDuck); }
#endif
            }
            m_updated = true;
            m_updateAvailable = false;
            currVersion = m_versionAvailable;
            if (m_deleteOldVersions && std::filesystem::exists(prevPatchedGamePath) && GetPatchedGamePath(currVersion) != prevPatchedGame)
            {
              std::filesystem::remove(prevPatchedGamePath);
            }
            updateStatus("Update completed.", IconType::SUCCESS);
            return true;
          }
        }
        else
        {
          if (Patch::PatchGame(g_dataFolder + currVersion + "/", gamePath, status, statusIcon))
          { updateStatus("Successfully patched the game.", IconType::SUCCESS); }
        }
      }
      else { updateStatus("Error: could not establish connection to projectsaphi.com", IconType::FAIL); }
      return false;
    }
  );
}

const std::string Updater::GetVersionAvailable()
{
  return g_lang["Update available"] + "! " + m_versionAvailable;
}

void Updater::StartRoutine(const std::function<bool(void)>& func, RoutineStatus* const ret)
{
  KillRoutines();
  m_routineMutex.lock();
  m_routineCount++;
  unsigned index = m_routineIndex++;
  if (ret) { *ret = RoutineStatus::RUNNING; }
  m_asyncRefs[index] = std::async(std::launch::async, [this, func, ret, index]
    {
      bool result = func();
      if (ret) { *ret = result ? RoutineStatus::RET_TRUE : RoutineStatus::RET_FALSE; }
      m_routineMutex.lock();
      m_routineCount--;
      m_routineMutex.unlock();
    }
  );
  m_routineMutex.unlock();
}

void Updater::KillRoutines()
{
  m_routineMutex.lock();
  if (m_routineCount == 0 && !m_asyncRefs.empty()) { m_asyncRefs.clear(); }
  m_routineMutex.unlock();
}
