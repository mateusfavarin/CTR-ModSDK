#include "data.h"

#include <fstream>
#include <filesystem>

const std::string g_dataFolder = "data/";
const std::string g_openBiosPath = g_dataFolder + "openbios-fastboot.bin";
#ifdef _DEBUG
	const std::string g_reduxDlFolder = g_dataFolder + "redux/";
	#ifdef _WIN32
		const std::string g_reduxFolder = g_dataFolder + "redux/";
		const std::string g_reduxExecutable = g_reduxDlFolder + "pcsx-redux.exe";
	#else
		const std::string g_reduxFolder = getenv("HOME") + std::string("/.local/share/redux/");;
		const std::string g_reduxExecutable = g_reduxDlFolder + "PCSX-Redux-HEAD-x86_64.AppImage";
	#endif //TODO: linux support if redux supports linux idk
#else
	const std::string g_duckDlFolder = g_dataFolder + "duckstation/";
	#ifdef _WIN32
		const std::string g_duckFolder = g_dataFolder + "duckstation/";
		const std::string g_duckExecutable = g_duckDlFolder + "duckstation-qt-x64-ReleaseLTCG.exe";
	#else
		const std::string g_duckFolder = getenv("HOME") + std::string("/.local/share/duckstation/");
		const std::string g_duckExecutable = g_duckDlFolder + "DuckStation-x64.AppImage";
	#endif
#endif
const std::string g_patchString = "saphi.xdelta";
const std::string g_configString = "settings.ini";

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

#ifndef _DEBUG
const std::string GetIniPath_Duck()
{
	return g_duckFolder + "settings.ini";
}
#endif

DataManager g_dataManager;

DataManager::DataManager()
{
	const std::filesystem::path u8dataFolder = std::u8string(g_dataFolder.begin(), g_dataFolder.end());
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

GameData g_gameData;

GameData::GameData()
{
	g_dataManager.BindData(&m_stereo, DataType::BOOL, "Stereo");
	g_dataManager.BindData(&m_vibration, DataType::BOOL, "Vibration");
	g_dataManager.BindData(&m_boostCounter, DataType::BOOL, "BoostCounter");
	g_dataManager.BindData(&m_fx, DataType::FLOAT, "FXVolume");
	g_dataManager.BindData(&m_music, DataType::FLOAT, "MusicVolume");
	g_dataManager.BindData(&m_voice, DataType::FLOAT, "VoiceVolume");
}