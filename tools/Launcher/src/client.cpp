#include "client.h"
#include "dataManager.h"

#ifdef _WIN32
#include <Windows.h>

static std::tuple<int, void*> Fork(const std::string& command)
{
  STARTUPINFO si;
  PROCESS_INFORMATION pi;

  ZeroMemory(&si, sizeof(si));
  si.cb = sizeof(si);
  ZeroMemory(&pi, sizeof(pi));

  std::wstring cmd = std::wstring(command.begin(), command.end());
  if (!CreateProcess(
    NULL,                               // No module name (use command line)
    const_cast<wchar_t*>(cmd.c_str()),  // Command line
    NULL,                               // Process handle not inheritable
    NULL,                               // Thread handle not inheritable
    FALSE,                              // Set handle inheritance to FALSE
    0,                                  // No creation flags
    NULL,                               // Use parent's environment block
    NULL,                               // Use parent's starting directory
    &si,                                // Pointer to STARTUPINFO structure
    &pi))                               // Pointer to PROCESS_INFORMATION structure
  {
    return {-1, nullptr};
  }
  CloseHandle(pi.hThread);
  return {pi.dwProcessId, pi.hProcess};
}

static const void* GetDuckRAM(const std::string& mapName, size_t size)
{
  std::wstring wideMapName = std::wstring(mapName.begin(), mapName.end());
  HANDLE hFile = OpenFileMapping(FILE_MAP_READ | FILE_MAP_WRITE, FALSE, const_cast<wchar_t*>(wideMapName.c_str()));
  if (!hFile) { return nullptr; }
  return MapViewOfFile(hFile, FILE_MAP_READ | FILE_MAP_WRITE, 0, 0, size);
}

static void Kill(int pid) {} /* Linux implementation only */

static bool Kill(void* duckProc)
{
  bool ret = true;
  if (!TerminateProcess(duckProc, 0)) { ret = false; }
  CloseHandle(duckProc);
  return ret;
}
#else

#endif

Client g_client;

void Client::Init()
{
  g_dataManager.BindData(&m_stereo, DataType::BOOL, "Stereo");
  g_dataManager.BindData(&m_vibration, DataType::BOOL, "Vibration");
  g_dataManager.BindData(&m_fx, DataType::FLOAT, "FXVolume");
  g_dataManager.BindData(&m_music, DataType::FLOAT, "MusicVolume");
  g_dataManager.BindData(&m_voice, DataType::FLOAT, "VoiceVolume");
}

void Client::Run()
{
  if (m_reset)
  {
    SpawnDuck();
    ResetState();
    m_reset = false;
  }
  if (!m_active) { return; }

}

void Client::CloseDuck()
{
  if (m_duckHandle != nullptr) { Kill(m_duckHandle); } /* Windows only */
  else if (m_duckPid != 0) { Kill(m_duckPid); } /* Linux only */
}

template<typename T>
inline T Client::ReadRAMData(size_t addr)
{
  return m_duckRAM[addr];
}

template<typename T>
inline void Client::WriteRAMData(const T& var, size_t addr)
{
  m_duckRAM[addr] = var;
}

void Client::SpawnDuck()
{
  const size_t PSX_RAM_SIZE = 0x800000;
  CloseDuck();
  auto proc = Fork(m_duckCommand);
  int pid = std::get<int>(proc);
  void* handle = std::get<void*>(proc);
  if (pid == -1) { return; }
  m_duckPid = pid;
  m_duckHandle = handle;
  m_duckRAM = GetDuckRAM("duckstation_" + std::to_string(m_duckPid), PSX_RAM_SIZE);
  if (m_duckRAM == nullptr) { return; }
  m_active = true;
}

void Client::ResetState()
{
}
