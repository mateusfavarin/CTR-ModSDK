#pragma once

#include <string>

namespace Process
{
	std::tuple<int, void*> New(const std::string& command);
	uint8_t* GetDuckRAM(const std::string& mapName, size_t size);
	bool Kill(int pid);
	bool Kill(void* duckProc);
}