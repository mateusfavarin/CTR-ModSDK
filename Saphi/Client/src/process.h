#pragma once

#include <string>
#include <cstdint>

#define INVALID_PID -1

namespace Process
{
	void HandleSigbus();
	std::tuple<int, void*> New(const std::string& command);
	uint8_t* GetEmuRAM(const std::string& mapName, size_t size);
	bool Kill(int pid);
	bool Kill(void* duckProc);
}

extern bool g_busError;