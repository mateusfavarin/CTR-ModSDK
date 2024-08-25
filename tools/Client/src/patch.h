#pragma once

#include "data.h"

#include <string>

namespace Patch
{
	bool PatchGame(const std::string& path, const std::string& gamePath, std::string& status, IconType& statusIcon);
}