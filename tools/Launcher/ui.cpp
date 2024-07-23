#include "ui.h"
#include "dataManager.h"
#include "IconsFontAwesome6.h"

#include <misc/cpp/imgui_stdlib.h>
#include <portable-file-dialogs.h>
#include <filesystem>
#include <cstdlib>

UI::UI()
{
  g_dataManager.BindData(&m_validBiosChecksum, DataType::BOOL, "BiosChecksum");
  g_dataManager.BindData(&m_validGameChecksum, DataType::BOOL, "GameChecksum");
  g_dataManager.BindData(&m_biosPath, DataType::STRING, "BiosPath");
  g_dataManager.BindData(&m_gamePath, DataType::STRING, "GamePath");
  g_dataManager.BindData(&m_version, DataType::STRING, "GameVersion");
  g_dataManager.BindData(&m_username, DataType::STRING, "Username");
  m_updater.CheckForUpdates(m_version);
}

static int FilterUsernameChar(ImGuiInputTextCallbackData* data)
{
  if (data->EventChar >= 'a' && data->EventChar <= 'z') { return 0; }
  if (data->EventChar >= 'A' && data->EventChar <= 'Z') { return 0; }
  if (data->EventChar >= '0' && data->EventChar <= '9') { return 0; }
  return 1;
}

void UI::Render(int width, int height)
{
  ImGui::SetNextWindowPos(ImVec2(.0f, .0f), ImGuiCond_Always);
  ImGui::SetNextWindowSize(ImVec2(static_cast<float>(width), static_cast<float>(height)), ImGuiCond_Always);
  ImGui::Begin("Main", nullptr, ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoMove | ImGuiWindowFlags_NoCollapse | ImGuiWindowFlags_NoTitleBar);

  std::string icon = m_username.empty() ? ICON_FA_CIRCLE_XMARK : ICON_FA_CIRCLE_CHECK;
  ImGui::InputText(("Username  " + icon).c_str(), &m_username, ImGuiInputTextFlags_CallbackCharFilter, FilterUsernameChar);
  if (m_username.size() > 9) { m_username = m_username.substr(0, 9); }

  auto CheckFile = [](RoutineStatus& routineStatus, bool runCheck, bool& result, std::string& currStr, std::string& lastStr, const std::function<void(RoutineStatus&, const std::string&)>& func)
    {
      if (routineStatus == RoutineStatus::NONE)
      {
        if (runCheck && currStr != lastStr)
        {
          func(routineStatus, currStr);
          lastStr = currStr;
        }
      }
      else if (routineStatus != RoutineStatus::RUNNING)
      {
        if (routineStatus == RoutineStatus::RET_TRUE)
        {
          result = true;
        }
        else if (routineStatus == RoutineStatus::RET_FALSE)
        {
          result = false;
        }
        routineStatus = RoutineStatus::NONE;
      }
    };

  static std::string biosRead = m_validBiosChecksum ? m_biosPath : std::string();
  static RoutineStatus biosRoutineStatus = RoutineStatus::NONE;
  bool validBiosPath = SelectFile(m_biosPath, "Bios Path   ", {".bin"}, {"PSX Bios File", "*.bin"}, "Path to a PS1 NTSC-U bios.");
  CheckFile(biosRoutineStatus, validBiosPath, m_validBiosChecksum, m_biosPath, biosRead, [this](RoutineStatus& routineStatus, const std::string& path) { m_updater.IsValidBios(routineStatus, path); });

  static std::string gameRead = m_validGameChecksum ? m_gamePath : std::string();
  static RoutineStatus gameRoutineStatus = RoutineStatus::NONE;
  bool validGamePath = SelectFile(m_gamePath, "Game Path", {".bin", ".img", ".iso"}, {"Game Files", "*.bin *.img *.iso"}, "Path to the clean NTSC-U version of CTR");
  CheckFile(gameRoutineStatus, validGamePath, m_validGameChecksum, m_gamePath, gameRead, [this](RoutineStatus& routineStatus, const std::string& path) { m_updater.IsValidGame(routineStatus, path); });

  bool correctSettings = m_validBiosChecksum && validGamePath;
  ImGui::Text(("Version: " + m_version).c_str());

  ImGui::BeginDisabled(m_updater.IsBusy() || !m_updater.HasValidUpdate() || !correctSettings);
  if (ImGui::Button("Launch Game"))
  {
    const std::string s_clientPath = GetClientPath(m_version);
    const std::string s_patchedPath = GetPatchedGamePath(m_version);
    if (!std::filesystem::exists(s_clientPath)) { m_status = "Error: could not find " + s_clientPath; }
    else if (!std::filesystem::exists(s_patchedPath)) { m_status = "Error: could not find " + s_patchedPath; }
    else
    {
      g_dataManager.SaveData();
      const std::string duckCommand = "start /b \"\" \"" + g_duckExecutable + "\" \"" + s_patchedPath + "\" &";
      std::system(duckCommand.c_str());
      const std::string clientCommand = "start /b \"\" \"" + std::filesystem::current_path().string() + "/" + GetClientPath(m_version) + "\" " + m_username + " &";
      std::system(clientCommand.c_str());
    }
  }
  ImGui::EndDisabled();
  ImGui::SameLine();
  ImGui::BeginDisabled(m_updater.IsBusy() || !correctSettings);
  if (ImGui::Button("Update")) { m_updater.Update(m_status, m_version, m_gamePath, m_biosPath); }
  ImGui::EndDisabled();

  std::string statusMessage = m_status;
  AppendStatusMessage(biosRoutineStatus == RoutineStatus::RUNNING, statusMessage, "Calculating BIOS checksum...");
  AppendStatusMessage(biosRoutineStatus == RoutineStatus::NONE && m_validBiosChecksum, statusMessage, "PS1 BIOS: ok.");
  AppendStatusMessage(biosRoutineStatus == RoutineStatus::NONE && !m_validBiosChecksum, statusMessage, "Error: invalid PS1 bios file.");
  AppendStatusMessage(gameRoutineStatus == RoutineStatus::RUNNING, statusMessage, "Calculating game checksum...");
  AppendStatusMessage(gameRoutineStatus == RoutineStatus::NONE && m_validGameChecksum, statusMessage, "NTSC-U CTR: ok.");
  AppendStatusMessage(gameRoutineStatus == RoutineStatus::NONE && !m_validGameChecksum, statusMessage, "Warning: you may be using a modified version of NTSC-U CTR.");
  AppendStatusMessage(m_updater.HasUpdateAvailable(), statusMessage, m_updater.GetVersionAvailableStatus());
  if (!statusMessage.empty()) { ImGui::Text(statusMessage.c_str()); }

  ImGui::End();
}

void UI::AppendStatusMessage(bool cond, std::string& statusMessage, const std::string& message)
{
  if (cond) { statusMessage += statusMessage.empty() ? message : "\n" + message; }
}

bool UI::SelectFile(std::string& str, const std::string& label, const std::vector<std::string>& ext, const std::vector<std::string>& filters, const std::string& tip)
{

  std::string lowercaseStr;
  for (char c : str)
  {
    if (c <= 'Z' && c >= 'A') { c = c - ('Z' - 'z'); };
    lowercaseStr += c;
  }

  auto checkValidPath = [&]
    {
      if (std::filesystem::exists(str))
      {
        for (const std::string& s : ext)
        {
          if (lowercaseStr.ends_with(s)) { return true; }
        }
      }
    };
  std::string icon = checkValidPath() ? ICON_FA_CIRCLE_CHECK : ICON_FA_CIRCLE_XMARK;
  ImGui::InputText((label + " " + icon).c_str(), &str);
  if (!tip.empty()) { ImGui::SetItemTooltip(tip.c_str()); }
  ImGui::SameLine();
  if (ImGui::Button(("...##" + label).c_str()))
  {
    auto selection = pfd::open_file(label, str, filters).result();
    if (selection.empty()) { return false; }
    str = selection.front();
  }
  return checkValidPath();
}

bool UI::SelectFolder(std::string& str, const std::string& label, const std::string& tip)
{
  bool validPath = std::filesystem::is_directory(str);
  std::string icon = validPath ? ICON_FA_CIRCLE_CHECK : ICON_FA_CIRCLE_XMARK;
  ImGui::InputText((label + " " + icon).c_str(), &str);
  if (!tip.empty()) { ImGui::SetItemTooltip(tip.c_str()); }
  ImGui::SameLine();
  if (ImGui::Button(("...##" + label).c_str()))
  {
    auto selection = pfd::select_folder(label).result();
    if (selection.empty()) { return false; }
    str = selection;
  }
  return validPath;
}
