#include "dataManager.h"

#include <fstream>
#include <filesystem>

const std::string g_dataFolder = "data/";
const std::string g_openBiosPath = g_dataFolder + "openbios-fastboot.bin";
const std::string g_duckFolder = g_dataFolder + "duckstation/";
#ifdef _WIN32
const std::string g_duckExecutable = g_duckFolder + "duckstation-qt-x64-ReleaseLTCG.exe";
#else
const std::string g_duckExecutable = g_duckFolder + "DuckStation-x64.AppImage";
#endif
const std::string g_patchString = "ctr-u_Online30.xdelta";
const std::string g_configString = "SCUS-94426.ini";

std::string GetPathWithoutExtension(const std::string& path)
{
	int pos = 0;
	for (int i = static_cast<int>(path.size()) - 1; i >= 0; i--)
	{
		if (path[i] == '.')
		{
			pos = i;
			break;
		}
	}
	return path.substr(0, pos);
}

const std::string GetPatchedGamePath(const std::string& version)
{
	std::string s_patch = g_dataFolder + version + "/" + g_patchString;
	return GetPathWithoutExtension(s_patch) + ".bin";
}

const std::string GetIniPath_Version(const std::string& version)
{
	return g_dataFolder + version + "/" + g_configString;
}

const std::string GetIniPath_Duck()
{
	return g_duckFolder + "settings.ini";
}

DataManager g_dataManager;

DataManager::DataManager()
{
	std::filesystem::path u8dataFolder = std::u8string(g_dataFolder.begin(), g_dataFolder.end());
	if (!std::filesystem::is_directory(u8dataFolder)) { std::filesystem::create_directory(u8dataFolder); }
	if (std::filesystem::exists(std::u8string(m_path.begin(), m_path.end()))) { m_json = json::parse(std::ifstream(m_path)); }
}

void DataManager::BindData(void* data, DataType dataType, const std::string& id)
{
	if (m_json.contains(id))
	{
		switch (dataType)
		{
		case DataType::STRING:
			*static_cast<std::string*>(data) = m_json[id];
			break;
		case DataType::BOOL:
			*static_cast<bool*>(data) = m_json[id];
			break;
		case DataType::FLOAT:
			*static_cast<float*>(data) = m_json[id];
			break;
		case DataType::SIZE_T:
			*static_cast<size_t*>(data) = m_json[id];
			break;
		}
	}
	m_dataMap[id] = {data, dataType};
}

void DataManager::SaveData()
{
	for (const auto&[key, value] : m_dataMap)
	{
		void* pData = std::get<void*>(value);
		switch (std::get<DataType>(value))
		{
		case DataType::STRING:
			m_json[key] = *(static_cast<std::string*>(pData));
			break;
		case DataType::BOOL:
			m_json[key] = *(static_cast<bool*>(pData));
			break;
		case DataType::FLOAT:
			m_json[key] = *(static_cast<float*>(pData));
			break;
		case DataType::SIZE_T:
			m_json[key] = *(static_cast<size_t*>(pData));
			break;
		}
	}
	std::ofstream file(m_path);
	file << std::setw(4) << m_json << std::endl;
}
