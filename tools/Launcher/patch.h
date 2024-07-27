#pragma once

#include "dataManager.h"

#include <string>

namespace Patch
{
	bool NewVersion(const std::string& path, const std::string& gamePath, std::string& status, IconType& statusIcon);
}