#pragma once

#include "data.h"

#include <string>

namespace Requests
{
	bool DownloadFile(const std::string& domain, const std::string& sitePath, const std::string& filePath);
	bool CheckUpdates(std::string& version);
	bool DownloadUpdates(const std::string& path, const std::string& version, std::string& status, IconType& statusIcon);
}