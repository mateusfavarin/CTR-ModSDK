#pragma once

#include <string>

#define INVALID_PID -1

namespace Process
{
	void HandleSigbus();
	std::tuple<int, void*> New(const std::string& command);
	uint8_t* GetDuckRAM(const std::string& mapName, size_t size);
	bool Kill(int pid);
	bool Kill(void* duckProc);
}

extern bool g_busError;