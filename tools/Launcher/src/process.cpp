#include "process.h"

#ifdef _WIN32
#include <Windows.h>

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
    return {-1, nullptr};
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
#include "dataManager.h"

#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <tuple>
#include <thread>

std::tuple<int, void*> Process::New(const std::string& command)
{
    pid_t pid = fork();
    if (pid == -1) { return {-1, nullptr}; } 
    else if (pid == 0) 
    {
      execl("/bin/sh", "sh", "-c", ("chmod +x " + g_duckExecutable + " && ./" + command).c_str(), (char*) NULL);
      _exit(EXIT_FAILURE); // exec should not return, exit if it fails
    }
    return {pid, nullptr};
}

uint8_t* Process::GetDuckRAM(const std::string& mapName, size_t size)
{
    std::this_thread::sleep_for(std::chrono::seconds(5));
    std::string map;
    bool foundMap = false;
    for (const auto& entry : std::filesystem::directory_iterator("/dev/shm/"))
    {
      map = entry.path().string();
      if (map.find("duckstation") != std::string::npos)
      {
        size_t i = map.size() - 1;
        while (map[i--] != '/') {}
        map = map.substr(i + 2);
        foundMap = true;
        break;
      }
    }
    if (!foundMap) { return nullptr; }
    int fd = shm_open(map.c_str(), O_RDWR, 0600);
    if (fd == -1) { return nullptr; }
    void* addr = mmap(nullptr, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    close(fd);
    if (addr == MAP_FAILED) { return nullptr; }
    return static_cast<uint8_t*>(addr);
}

bool Process::Kill(int pid) { return kill(pid, SIGTERM) == 0; }

bool Process::Kill(void* duckProc) { return false; } /* Windows only */
#endif