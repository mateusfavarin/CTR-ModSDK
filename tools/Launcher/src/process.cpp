#include "process.h"

bool g_busError = false;

static void HandleBusError(int signum)
{
  g_busError = true;
}

#ifdef _WIN32
#include <Windows.h>

void Process::HandleSigbus() {} /* Linux only */

std::tuple<int, void*> Process::New(const std::string& command)
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
    return {INVALID_PID, nullptr};
  }
  CloseHandle(pi.hThread);
  return {pi.dwProcessId, pi.hProcess};
}

uint8_t* Process::GetDuckRAM(const std::string& mapName, size_t size)
{
  std::wstring wideMapName = std::wstring(mapName.begin(), mapName.end());
  HANDLE hFile = OpenFileMapping(FILE_MAP_READ | FILE_MAP_WRITE, FALSE, const_cast<wchar_t*>(wideMapName.c_str()));
  if (!hFile) { return nullptr; }
  return static_cast<uint8_t*>(MapViewOfFile(hFile, FILE_MAP_READ | FILE_MAP_WRITE, 0, 0, size));
}

bool Process::Kill(int pid) { return false; } /* Linux implementation only */

bool Process::Kill(void* duckProc)
{
  bool ret = true;
  if (!TerminateProcess(duckProc, 0)) { ret = false; }
  CloseHandle(duckProc);
  return ret;
}
#else /* Linux */
#include "data.h"

#include <signal.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <tuple>
#include <fstream>

void Process::HandleSigbus()
{
  struct sigaction sa;
  sa.sa_handler = HandleBusError;
  sa.sa_flags = 0;
  sigemptyset(&sa.sa_mask);
  sigaction(SIGBUS, &sa, NULL);
}

std::tuple<int, void*> Process::New(const std::string& command)
{
  pid_t pid = fork();
  if (pid == INVALID_PID) { return {INVALID_PID, nullptr}; }
  else if (pid == 0)
  {
    chmod(g_duckExecutable.c_str(), 0777);
    execl("/bin/sh", "sh", "-c", ("./" + command).c_str(), (char*) NULL);
    _exit(EXIT_FAILURE); // exec should not return, exit if it fails
  }

  /*
    Duckstation PID works in mysteryous ways,
    with two y's for extra crying effect.
  */
  const std::string parentPID = std::to_string(pid);
  bool foundPID = false;
  while (!foundPID)
  {
    for (const auto& entry : std::filesystem::directory_iterator("/dev/shm/"))
    {
      const std::string map = entry.path().string();
      static const std::string duckTag = "duckstation_";
      const size_t matchPos = map.find(duckTag);
      if (matchPos != std::string::npos)
      {
        pid = stoi(map.substr(matchPos + duckTag.size()));
        foundPID = true;
        break;
      }
    }
  }
  return {pid, nullptr};
}

uint8_t* Process::GetDuckRAM(const std::string& mapName, size_t size)
{
  int fd = shm_open(mapName.c_str(), O_RDWR, 0600);
  if (fd == -1) { return nullptr; }
  void* addr = mmap(nullptr, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
  close(fd);
  if (addr == MAP_FAILED) { return nullptr; }
  return static_cast<uint8_t*>(addr);
}

bool Process::Kill(int pid) { return kill(pid, SIGTERM) == 0; }

bool Process::Kill(void* duckProc) { return false; } /* Windows only */
#endif