#pragma once

#include "updater.h"
#include "dataManager.h"

#include <imgui.h>
#include <string>
#include <vector>

class UI
{
public:
	UI();
	void Render(int width, int height);

private:
	void IconText(const std::string& str, IconType iconType);
	bool SelectFile(std::string& str, const std::string& label, const std::vector<std::string>& ext, const std::vector<std::string>& filters, const std::string& tip);
	bool SelectFolder(std::string& str, const std::string& label, const std::string& tip);

private:
	Updater m_updater;
	bool m_validBiosChecksum = false;
	bool m_validGameChecksum = false;
	std::string m_version = "None";
	std::string m_biosPath;
	std::string m_gamePath;
	std::string m_username;
	std::string m_status;
	IconType m_statusIcon;
	/* Game Settings */
	float m_fx = 1.0f;
	float m_music = 1.0f;
	float m_voice = 1.0f;
	bool m_stereo = true;
	bool m_vibration = false;
	/* Advanced Settings */
	bool m_skipChecksum = false;
};