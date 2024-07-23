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
  g_dataManager.BindData(&m_skipChecksum, DataType::BOOL, "SkipChecksum");
  g_dataManager.BindData(&m_stereo, DataType::BOOL, "Stereo");
  g_dataManager.BindData(&m_vibration, DataType::BOOL, "Vibration");
  g_dataManager.BindData(&m_fx, DataType::FLOAT, "FXVolume");
  g_dataManager.BindData(&m_music, DataType::FLOAT, "MusicVolume");
  g_dataManager.BindData(&m_voice, DataType::FLOAT, "VoiceVolume");
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

  ImGui::Text(("Version: " + m_version).c_str());

  ImGui::InputText("##Username", &m_username, ImGuiInputTextFlags_CallbackCharFilter, FilterUsernameChar);
  ImGui::SameLine();
  IconText("Username", m_username.empty() ? IconType::FAIL : IconType::SUCCESS);
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

  bool correctSettings = m_skipChecksum ? (m_validBiosChecksum && validGamePath) : (m_validBiosChecksum && m_validGameChecksum);

  if (ImGui::TreeNode("Game Settings"))
  {
    ImGui::SliderFloat("FX", &m_fx, 0.0f, 1.0f, "%.2f");
    ImGui::SliderFloat("Music", &m_music, 0.0f, 1.0f, "%.2f");
    ImGui::SliderFloat("Voice", &m_voice, 0.0f, 1.0f, "%.2f");
    if (ImGui::RadioButton("Stereo", m_stereo)) { m_stereo = true; }
    ImGui::SameLine();
    if (ImGui::RadioButton("Mono", !m_stereo)) { m_stereo = false; }
    ImGui::Checkbox("Vibration", &m_vibration);
    ImGui::TreePop();
  }

  if (ImGui::TreeNode("Advanced Settings"))
  {
    ImGui::Checkbox("Skip game checksum", &m_skipChecksum);
    ImGui::SetItemTooltip("Ignore the game checksum while applying the xdelta patch.\nThis may result in patching errors.");
    ImGui::TreePop();
  }

  if (m_status.empty())
  {
    if (biosRoutineStatus == RoutineStatus::RUNNING) { ImGui::Text("Calculating BIOS checksum..."); }
    if (biosRoutineStatus == RoutineStatus::NONE && m_validBiosChecksum) { IconText("PS1 BIOS.", IconType::SUCCESS); }
    if (biosRoutineStatus == RoutineStatus::NONE && !m_validBiosChecksum) { IconText("Invalid PS1 bios file.", IconType::FAIL); }
    if (gameRoutineStatus == RoutineStatus::RUNNING) { ImGui::Text("Calculating game checksum..."); }
    if (gameRoutineStatus == RoutineStatus::NONE && m_validGameChecksum) { IconText("NTSC-U CTR.", IconType::SUCCESS); }
    if (m_skipChecksum && gameRoutineStatus == RoutineStatus::NONE && !m_validGameChecksum) { IconText("Using a modified version of NTSC-U CTR.\nThis may result in patching errors.", IconType::WARNING); }
    if (!m_skipChecksum && gameRoutineStatus == RoutineStatus::NONE && !m_validGameChecksum) { IconText("Invalid NTSC-U CTR game file.", IconType::FAIL); }
    if (m_updater.HasUpdateAvailable()) { IconText(m_updater.GetVersionAvailable(), IconType::WARNING); }
  }
  else { ImGui::Text(m_status.c_str()); }

  bool launchDisabled = m_updater.IsBusy() || !m_updater.HasValidUpdate() || !correctSettings;
  ImGui::BeginDisabled(launchDisabled);
  if (ImGui::Button("Launch Game"))
  {
    const std::string s_clientPath = GetClientPath(m_version);
    const std::string s_patchedPath = GetPatchedGamePath(m_version);
    if (!std::filesystem::exists(s_clientPath)) { m_status = "Error: could not find " + s_clientPath; }
    else if (!std::filesystem::exists(s_patchedPath)) { m_status = "Error: could not find " + s_patchedPath; }
    else
    {
      g_dataManager.SaveData();
      const std::string duckCommand = "start /b \"\" \"" + g_duckExecutable + "\" \"" + s_patchedPath + "\"";
      std::system(duckCommand.c_str());
      const std::string clientCommand = "start /b \"\" \"" + std::filesystem::current_path().string() + "/" + GetClientPath(m_version) + "\" " + m_username;
      std::system(clientCommand.c_str());
    }
  }
  if (launchDisabled) { ImGui::SetItemTooltip("Update the game and make sure\nall settings are correct."); }
  ImGui::EndDisabled();
  ImGui::SameLine();
  bool updateDisabled = m_updater.IsBusy() || !correctSettings;
  ImGui::BeginDisabled(updateDisabled);
  if (ImGui::Button("Update")) { m_updater.Update(m_status, m_version, m_gamePath, m_biosPath); }
  if (updateDisabled) { ImGui::SetItemTooltip("Provide a correct nickname, bios file\nand game file before updating."); }
  ImGui::EndDisabled();

  ImGui::End();
}

void UI::IconText(const std::string& str, IconType iconType)
{
  const ImVec4 redColor    = {247.0f / 255.0f, 44.0f / 255.0f, 37.0f / 255.0f, 1.0f};
  const ImVec4 yellowColor = {255.0f / 255.0f, 197.0f / 255.0f, 0.0f / 58.0f, 1.0f};
  const ImVec4 greenColor  = {99.0f / 255.0f, 193.0f / 255.0f, 70.0f / 255.0f, 1.0f};
  const ImVec4 whiteColor  = {1.0f, 1.0f, 1.0f, 1.0f};

  switch (iconType)
  {
  case IconType::FAIL:
    ImGui::PushStyleColor(ImGuiCol_Text, redColor);
    ImGui::Text(ICON_FA_CIRCLE_XMARK);
    break;
  case IconType::WARNING:
    ImGui::PushStyleColor(ImGuiCol_Text, yellowColor);
    ImGui::Text(ICON_FA_TRIANGLE_EXCLAMATION);
    break;
  case IconType::SUCCESS:
    ImGui::PushStyleColor(ImGuiCol_Text, greenColor);
    ImGui::Text(ICON_FA_CIRCLE_CHECK);
    break;
  default:
    ImGui::PushStyleColor(ImGuiCol_Text, whiteColor);
    break;
  }
  ImGui::PopStyleColor();
  ImGui::SameLine();
  ImGui::Text(str.c_str());
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
      return false;
    };

  ImGui::InputText(("##" + label).c_str(), &str);
  ImGui::SameLine();
  IconType icon = checkValidPath() ? IconType::SUCCESS : IconType::FAIL;
  IconText(label, icon);
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
  ImGui::InputText(("##" + label).c_str(), &str);
  ImGui::SameLine();
  IconType icon = validPath ? IconType::SUCCESS : IconType::FAIL;
  IconText(label, icon);
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
