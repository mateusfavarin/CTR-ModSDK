#include "ui.h"
#include "languages.h"
#include "client.h"
#include "IconsFontAwesome6.h"

#include <imgui_internal.h>
#include <misc/cpp/imgui_stdlib.h>
#include <portable-file-dialogs.h>
#include <filesystem>

UI::UI()
{
  g_dataManager.BindData(&m_validBiosChecksum, DataType::BOOL, "BiosChecksum");
  g_dataManager.BindData(&m_validGameChecksum, DataType::BOOL, "GameChecksum");
  g_dataManager.BindData(&m_skipChecksum, DataType::BOOL, "SkipChecksum");
  g_dataManager.BindData(&m_biosPath, DataType::STRING, "BiosPath");
  if (m_biosPath.empty())
  {
    m_biosPath = std::filesystem::current_path().string() + "/" + g_openBiosPath;
#ifdef _WIN32
    std::replace(m_biosPath.begin(), m_biosPath.end(), '/', '\\');
#endif
    m_validBiosChecksum = true;
  }
  g_dataManager.BindData(&m_gamePath, DataType::STRING, "GamePath");
  g_dataManager.BindData(&m_version, DataType::STRING, "GameVersion");
  g_dataManager.BindData(&g_gameData.m_username, DataType::STRING, "Username");
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

  const std::string versionStr = g_lang["Saphi Version"] + ": " + m_version;
  ImGui::Text(versionStr.c_str());
  ImGui::SameLine();
  ImGui::ItemSize(ImVec2(385.0f - ImGui::CalcTextSize(versionStr.c_str()).x, 0));
  ImGui::SameLine();
  ImGui::Text((g_lang["Language"] + ":").c_str());
  ImGui::SameLine();
  if (ImGui::BeginCombo("##lang", g_lang.m_langs[g_lang.m_langIndex].c_str(), ImGuiComboFlags_WidthFitPreview))
  {
    for (size_t i = 0; i < g_lang.m_langs.size(); i++)
    {
      bool selected = i == g_lang.m_langIndex;
      if (ImGui::Selectable(g_lang.m_langs[i].c_str(), selected)) { g_lang.m_langIndex = i; }
      if (selected) { ImGui::SetItemDefaultFocus(); }
    }
    ImGui::EndCombo();
  }

  ImGui::InputText("##Username", &g_gameData.m_username, ImGuiInputTextFlags_CallbackCharFilter, FilterUsernameChar);
  ImGui::SameLine();
  ImGui::ItemSize(ImVec2(20.0f, 0));
  ImGui::SameLine();
  IconText(g_lang["Username"], g_gameData.m_username.empty() ? IconType::FAIL : IconType::SUCCESS);
  if (g_gameData.m_username.size() > 9) { g_gameData.m_username = g_gameData.m_username.substr(0, 9); }

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

  static std::string gameRead = m_validGameChecksum ? m_gamePath : std::string();
  static RoutineStatus gameRoutineStatus = RoutineStatus::NONE;
  bool validGamePath = SelectFile(m_gamePath, g_lang["Game File"], {".bin", ".img", ".iso"}, {"Game Files", "*.bin *.img *.iso"}, g_lang["Path to the original NTSC-U CTR."]);
  CheckFile(gameRoutineStatus, validGamePath, m_validGameChecksum, m_gamePath, gameRead, [this](RoutineStatus& routineStatus, const std::string& path) { m_updater.IsValidGame(routineStatus, path); });

  if (ImGui::TreeNode(g_lang["Game Settings"].c_str()))
  {
    ImGui::SliderFloat("FX", &g_gameData.m_fx, 0.0f, 1.0f, "%.2f");
    ImGui::SliderFloat(g_lang["Music"].c_str(), &g_gameData.m_music, 0.0f, 1.0f, "%.2f");
    ImGui::SliderFloat(g_lang["Voice"].c_str(), &g_gameData.m_voice, 0.0f, 1.0f, "%.2f");
    ImGui::Text(g_lang["Audio:"].c_str());
    ImGui::SameLine();
    if (ImGui::RadioButton("Stereo", g_gameData.m_stereo)) { g_gameData.m_stereo = true; }
    ImGui::SameLine();
    if (ImGui::RadioButton("Mono", !g_gameData.m_stereo)) { g_gameData.m_stereo = false; }
    ImGui::Checkbox(g_lang["Vibration"].c_str(), &g_gameData.m_vibration);
    ImGui::TreePop();
  }

  static RoutineStatus biosRoutineStatus = RoutineStatus::NONE;
  if (ImGui::TreeNode(g_lang["Advanced Settings"].c_str()))
  {
    ImGui::Checkbox(g_lang["Skip game checksum"].c_str(), &m_skipChecksum);
    ImGui::SetItemTooltip(g_lang["Ignore the game checksum while applying the xdelta patch.\nThis may result in patching errors."].c_str());
    ImGui::Checkbox(g_lang["Delete old versions"].c_str(), &m_updater.m_deleteOldVersions);
    ImGui::SetItemTooltip(g_lang["Automatically deletes the patched file\nfor obsolete versions during new updates."].c_str());
    static std::string biosRead = m_validBiosChecksum ? m_biosPath : std::string();
    bool validBiosPath = SelectFile(m_biosPath, g_lang["Bios File"], {".bin"}, {"PSX Bios File", "*.bin"}, g_lang["Path to a PS1 NTSC-U bios."]);
    CheckFile(biosRoutineStatus, validBiosPath, m_validBiosChecksum, m_biosPath, biosRead, [this](RoutineStatus& routineStatus, const std::string& path) { m_updater.IsValidBios(routineStatus, path); });
    ImGui::TreePop();
  }

  bool correctSettings = m_skipChecksum ? (m_validBiosChecksum && validGamePath) : (m_validBiosChecksum && m_validGameChecksum);
  ImGui::SeparatorText(g_lang["Information"].c_str());

  if (biosRoutineStatus == RoutineStatus::RUNNING) { IconText(g_lang["Calculating BIOS checksum..."], IconType::RUNNING); }
  if (biosRoutineStatus == RoutineStatus::NONE && m_validBiosChecksum) { IconText("PS1 BIOS " + g_lang["detected"], IconType::SUCCESS); }
  if (biosRoutineStatus == RoutineStatus::NONE && !m_validBiosChecksum) { IconText(g_lang["Invalid PS1 bios file"], IconType::FAIL); }
  if (gameRoutineStatus == RoutineStatus::RUNNING) { IconText(g_lang["Calculating game checksum..."], IconType::RUNNING); }
  if (gameRoutineStatus == RoutineStatus::NONE && m_validGameChecksum) { IconText("NTSC-U CTR " + g_lang["detected"], IconType::SUCCESS); }
  if (m_skipChecksum && gameRoutineStatus == RoutineStatus::NONE && !m_validGameChecksum) { IconText(g_lang["Invalid ROM or modified version of NTSC-U CTR detected\nThis may result in patching errors"], IconType::WARNING); }
  if (!m_skipChecksum && gameRoutineStatus == RoutineStatus::NONE && !m_validGameChecksum) { IconText(g_lang["Game path does not match with an original NTSC-U CTR game file"], IconType::FAIL); }
  if (m_updater.HasUpdateAvailable()) { IconText(m_updater.GetVersionAvailable(), IconType::WARNING); }
  if (!m_status.empty()) { IconText(g_lang[m_status], m_statusIcon); }

  ImGui::Separator();

  bool launchDisabled = m_updater.IsBusy() || !m_updater.HasValidUpdate() || !correctSettings;
  ImGui::BeginDisabled(launchDisabled);
  if (ImGui::Button(g_lang["Launch Game"].c_str()))
  {
    const std::string s_patchedPath = GetPatchedGamePath(m_version);
    if (!std::filesystem::exists(std::u8string(s_patchedPath.begin(), s_patchedPath.end())))
    {
      m_status = g_lang["Error: could not find"] + " " + s_patchedPath;
      m_statusIcon = IconType::FAIL;
    }
    else
    {
      g_dataManager.SaveData();
#ifdef _DEBUG
#ifdef USE_DECOMPILE_BUILD
      g_gameData.m_reduxCommand = "\"" + g_reduxExecutable + "\" -run -no-kiosk -interpreter -debugger -8mb -iso \"../../build/ctr-u_decompile.bin\"";
#else
      g_gameData.m_reduxCommand = "\"" + g_reduxExecutable + "\" -run -no-kiosk -interpreter -debugger -8mb -iso \"" + s_patchedPath + "\"";
#endif
#else
      g_gameData.m_duckCommand = "\"" + g_duckExecutable + "\" \"" + s_patchedPath + "\"";
#endif
      g_gameData.m_reset = true;
    }
  }
  if (launchDisabled) { ImGui::SetItemTooltip(g_lang["Update the game and make sure\nall settings are correct."].c_str()); }
  ImGui::EndDisabled();
  ImGui::SameLine();
  bool updateDisabled = m_updater.IsBusy() || !correctSettings;
  ImGui::BeginDisabled(updateDisabled);
  if (ImGui::Button(g_lang["Update"].c_str())) { m_updater.Update(m_status, m_statusIcon, m_version, m_gamePath, m_biosPath); }
  if (updateDisabled) { ImGui::SetItemTooltip(g_lang["Provide a correct nickname, bios file\nand game file before updating."].c_str()); }
  ImGui::EndDisabled();

  ImGui::End();
}

void UI::IconText(const std::string& str, IconType iconType)
{
  const ImVec4 redColor    = {247.0f / 255.0f, 44.0f / 255.0f, 37.0f / 255.0f, 1.0f};
  const ImVec4 yellowColor = {255.0f / 255.0f, 197.0f / 255.0f, 0.0f / 58.0f, 1.0f};
  const ImVec4 greenColor  = {99.0f / 255.0f, 193.0f / 255.0f, 70.0f / 255.0f, 1.0f};
  const ImVec4 blueColor   = {63.0f / 255.0f, 136.0f / 255.0f, 197.0f / 255.0f, 1.0f};
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
  case IconType::RUNNING:
    ImGui::PushStyleColor(ImGuiCol_Text, blueColor);
    ImGui::Text(ICON_FA_CIRCLE_INFO);
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
      if (std::filesystem::exists(std::u8string(str.begin(), str.end())))
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
  if (ImGui::Button(("...##" + label).c_str()))
  {
    auto selection = pfd::open_file(label, str, filters).result();
    if (selection.empty()) { return false; }
    str = selection.front();
  }
  ImGui::SameLine();
  bool validPath = checkValidPath();
  IconType icon = validPath ? IconType::SUCCESS : IconType::FAIL;
  IconText(label, icon);
  if (!tip.empty()) { ImGui::SetItemTooltip(tip.c_str()); }
  return validPath;
}

bool UI::SelectFolder(std::string& str, const std::string& label, const std::string& tip)
{
  bool validPath = std::filesystem::is_directory(std::u8string(str.begin(), str.end()));
  ImGui::InputText(("##" + label).c_str(), &str);
  ImGui::SameLine();
  if (ImGui::Button(("...##" + label).c_str()))
  {
    auto selection = pfd::select_folder(label).result();
    if (selection.empty()) { return false; }
    str = selection;
  }
  ImGui::SameLine();
  IconType icon = validPath ? IconType::SUCCESS : IconType::FAIL;
  IconText(label, icon);
  if (!tip.empty()) { ImGui::SetItemTooltip(tip.c_str()); }
  return validPath;
}
