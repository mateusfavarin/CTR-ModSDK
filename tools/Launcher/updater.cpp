#include "updater.h"
#include "requests.h"
#include "dataManager.h"
#include "patch.h"
#include "io.h"

#include <CRC.h>
#include <fstream>
#include <filesystem>

Updater::Updater()
{
  g_dataManager.BindData(&m_updated, DataType::BOOL, "Updated");
  g_dataManager.BindData(&m_hasDuckstation, DataType::BOOL, "Duck");
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
      /* All NTSC-U BIOS CRC32: https://github.com/brad-lin/FreePSXBoot?tab=readme-ov-file#downloads */
      const std::vector<uint32_t> biosChecksums = { 0x55847d8c, 0xaff00f2f, 0x37157331, 0x8d8cb7e4, 0x502224b6, 0x6a0e22a0, 0x171bdcec };
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
      if (currVersion != version || !std::filesystem::exists(GetPatchedGamePath(currVersion)))
      {
        m_updateAvailable = true;
        m_versionAvailable = version;
        return true;
      }
      return false;
    }
  );
}

void Updater::Update(std::string& status, std::string& currVersion, const std::string& gamePath, const std::string& biosPath)
{
  StartRoutine(
    [this, &status, &currVersion, &gamePath, &biosPath]
    {
      std::string version;
      bool copyIni = false;
      if (!m_hasDuckstation)
      {
        status = "Downloading Duckstation...";
        std::filesystem::create_directory(g_duckFolder);
        const std::string duckArchive = "duckstation.zip";
        if (!Requests::DownloadFile("github.com", "/stenzek/duckstation/releases/download/preview/duckstation-windows-x64-release.zip", g_duckFolder + duckArchive))
        {
          status = "Error: could not download Duckstation.";
          return false;
        }
        status = "Decompressing Duckstation...";
        if (!IO::DecompressFiles(g_duckFolder, duckArchive))
        {
          status = "Error: could not decompress Duckstation.";
          return false;
        }
        status = "Installing custom settings...";
        const std::string g_biosFolder = g_duckFolder + "bios/";
        std::filesystem::create_directory(g_biosFolder);
        std::string biosName;
        for (int i = static_cast<int>(biosPath.size()) - 1; i >= 0; i--)
        {
          if (biosPath[i] == '/' || biosPath[i] == '\\')
          {
            biosName = biosPath.substr(i + 1);
            break;
          }
        }
        std::filesystem::copy_file(biosPath, g_biosFolder + biosName);
        const std::string duckPortable = g_duckFolder + "portable.txt";
        std::ofstream portableFile(duckPortable.c_str());
        portableFile.close();
        m_hasDuckstation = true;
        copyIni = true;
      }
      status = "Checking for new updates...";
      if (m_updateAvailable || Requests::CheckUpdates(version))
      {
        if (m_updateAvailable || version != currVersion || !std::filesystem::exists(GetPatchedGamePath(currVersion)))
        {
          m_versionAvailable = m_updateAvailable ? m_versionAvailable : version;
          std::string path = g_dataFolder + m_versionAvailable + "/";
          if (Requests::DownloadUpdates(path, status) && Patch::NewVersion(path, gamePath, status))
          {
            if (copyIni) { std::filesystem::copy_file(GetIniPath_Version(m_versionAvailable), GetIniPath_Duck()); }
            m_updated = true;
            m_updateAvailable = false;
            currVersion = m_versionAvailable;
            status = "Update completed.";
            return true;
          }
        }
        else { status = "Already on the latest patch"; }
      }
      else { status = "Error: could not establish connection"; }
      return false;
    }
  );
}

const std::string Updater::GetVersionAvailableStatus()
{
  return "Update available! v" + m_versionAvailable;
}

void Updater::StartRoutine(const std::function<bool(void)>& func, RoutineStatus* const ret)
{
  KillRoutines();
  m_routineMutex.lock();
  m_routineCount++;
  unsigned index = m_routineIndex++;
  m_asyncRefs[index] = std::async(std::launch::async, [this, func, ret, index]
    {
      if (ret) { *ret = RoutineStatus::RUNNING; }
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
