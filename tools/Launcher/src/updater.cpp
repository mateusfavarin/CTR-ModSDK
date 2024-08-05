#include "updater.h"
#include "requests.h"
#include "patch.h"
#include "io.h"
#include "languages.h"

#include <CRC.h>
#include <fstream>
#include <filesystem>

Updater::Updater()
{
  g_dataManager.BindData(&m_updated, DataType::BOOL, "Updated");
  g_dataManager.BindData(&m_hasDuckstation, DataType::BOOL, "Duck");
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
      if (!m_hasDuckstation)
      {
        updateStatus("Downloading Duckstation...", IconType::RUNNING);
        const std::filesystem::path u8duckFolder = std::u8string(g_duckFolder.begin(), g_duckFolder.end());
        if (!std::filesystem::is_directory(u8duckFolder)) { std::filesystem::create_directory(u8duckFolder); }
        if (g_duckFolder != g_duckDlFolder) 
        { 
          const std::filesystem::path u8duckDlFolder = std::u8string(g_duckDlFolder.begin(), g_duckDlFolder.end());
          if (!std::filesystem::is_directory(u8duckDlFolder)) { std::filesystem::create_directory(u8duckDlFolder); }
        }
#ifdef _WIN32
        const std::string duckArchive = "duckstation.zip";
        const std::string duckPath = "/stenzek/duckstation/releases/download/preview/duckstation-windows-x64-release.zip";
#else
        const std::string duckArchive = "DuckStation-x64.AppImage";
        const std::string duckPath = "/stenzek/duckstation/releases/download/preview/DuckStation-x64.AppImage";
#endif
        if (!Requests::DownloadFile("github.com", duckPath, g_duckDlFolder + duckArchive))
        {
          updateStatus("Error: could not download Duckstation.", IconType::FAIL);
          return false;
        }
#ifdef _WIN32
        updateStatus("Decompressing Duckstation...", IconType::RUNNING);
        if (!IO::DecompressFiles(g_duckFolder, duckArchive))
        {
          updateStatus("Error: could not decompress Duckstation.", IconType::FAIL);
          return false;
        }
#endif
        updateStatus("Installing OnlineCTR settings...", IconType::RUNNING);
        const std::string g_biosFolder = g_duckFolder + "bios/";
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
        const std::string duckPortable = g_duckFolder + "portable.txt";
        std::ofstream portableFile(duckPortable.c_str());
        portableFile.close();
        m_hasDuckstation = true;
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
          if (Requests::DownloadUpdates(path, status, statusIcon) && Patch::PatchGame(path, gamePath, status, statusIcon))
          {
            if (copyIni || !m_updated)
            {
              const std::string iniVersion = GetIniPath_Version(m_versionAvailable);
              const std::string iniDuck = GetIniPath_Duck();
              const std::filesystem::path u8iniDuck = std::u8string(iniDuck.begin(), iniDuck.end());
              if (!std::filesystem::exists(u8iniDuck)) { std::filesystem::copy_file(std::u8string(iniVersion.begin(), iniVersion.end()), u8iniDuck); }
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
      else { updateStatus("Error: could not establish connection to online-ctr.com", IconType::FAIL); }
      return false;
    }
  );
}

const std::string Updater::GetVersionAvailable()
{
  return g_lang["Update available"] + "! v" + m_versionAvailable;
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
