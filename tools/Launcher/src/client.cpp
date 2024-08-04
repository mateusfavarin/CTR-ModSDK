#include "client.h"
#include "dataManager.h"

#ifdef _WIN32
#include <Windows.h>

static int Fork(const std::string& command)
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
    return -1;
  }
  CloseHandle(pi.hProcess);
  CloseHandle(pi.hThread);
  return static_cast<int>(pi.dwProcessId);
}

static bool Kill(int pid)
{
  HANDLE hProcess = OpenProcess(PROCESS_TERMINATE, FALSE, static_cast<DWORD>(pid));
  bool ret = true;
  if (!TerminateProcess(hProcess, 0)) { ret = false; }
  CloseHandle(hProcess);
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
  }
  if (!m_active) { return; }

}

void Client::SpawnDuck()
{
  if (m_duckPid != 0) { Kill(m_duckPid); }
  int pid = Fork(m_duckCommand);
  if (pid == -1) { return; }
  m_duckPid = pid;
  m_reset = false;
  m_active = true;
}

void Client::ResetState()
{
}
