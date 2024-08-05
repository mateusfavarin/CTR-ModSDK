#include "client.h"
#include "dataManager.h"
#include "process.h"

Client g_client;

void Client::Init()
{
  g_dataManager.BindData(&m_stereo, DataType::BOOL, "Stereo");
  g_dataManager.BindData(&m_vibration, DataType::BOOL, "Vibration");
  g_dataManager.BindData(&m_fx, DataType::FLOAT, "FXVolume");
  g_dataManager.BindData(&m_music, DataType::FLOAT, "MusicVolume");
  g_dataManager.BindData(&m_voice, DataType::FLOAT, "VoiceVolume");
  enet_initialize();
}

void Client::Run()
{
  if (m_reset)
  {
    SpawnDuck();
    m_reset = false;
  }
  if (m_getDuckRAM)
  {
    const size_t PSX_RAM_SIZE = 0x800000;
    m_duckRAM = Process::GetDuckRAM("duckstation_" + std::to_string(m_duckPid), PSX_RAM_SIZE);
    if (m_duckRAM == nullptr) { return; }
    m_getDuckRAM = false;
    m_active = true;
  }
  if (!m_active) { return; }

  int32_t gameTimer;
  if (!m_validMmap)
  {
    try { gameTimer = GetRAMData<int32_t>(ADDR_gGT + 0x1cf8); }
    catch (...) { m_getDuckRAM = true; return; }
    m_validMmap = true;
  }
  else { gameTimer = GetRAMData<int32_t>(ADDR_gGT + 0x1cf8); }
  OnlineCTR& octr = GetRAMData<OnlineCTR>(ADDR_OCTR);
  if (!octr.IsBootedPS1 || gameTimer == m_currGameTimer) { return; } /* Waiting for the next frame */

  m_currGameTimer = gameTimer;
  octr.windowsClientSync++;

  if (octr.CurrState != ClientState::DISCONNECTED) { m_funcs[static_cast<ClientState>(octr.CurrState)](octr); }
}

void Client::Close()
{
  CloseDuck();
  enet_deinitialize();
}

template<typename T>
inline T& Client::GetRAMData(size_t addr)
{
  return *reinterpret_cast<T*>(&m_duckRAM[addr & 0xFFFFFF]);
}

void Client::SpawnDuck()
{
  CloseDuck();
  auto proc = Process::New(m_duckCommand);
  int pid = std::get<int>(proc);
  void* handle = std::get<void*>(proc);
  if (pid == -1) { return; }
  m_duckPid = pid;
  m_duckHandle = handle;
  m_getDuckRAM = true;
  m_validMmap = false;
}

void Client::CloseDuck()
{
  if (m_duckHandle != nullptr) { Process::Kill(m_duckHandle); } /* Windows only */
  else if (m_duckPid != 0) { Process::Kill(m_duckPid); } /* Linux only */
}

void Client::State_Launch_Boot(OnlineCTR& octr)
{
  octr.CurrState = ClientState::LAUNCH_PICK_SERVER;
}

void Client::State_Launch_PickServer(OnlineCTR& octr)
{
}

void Client::State_Launch_PickRoom(OnlineCTR& octr)
{
}

void Client::State_Launch_Error(OnlineCTR& octr)
{
}

void Client::State_Lobby_AssignRole(OnlineCTR& octr)
{
}

void Client::State_Lobby_HostTrackPick(OnlineCTR& octr)
{
}

void Client::State_Lobby_GuestTrackWait(OnlineCTR& octr)
{
}

void Client::State_Lobby_CharacterPick(OnlineCTR& octr)
{
}

void Client::State_Lobby_WaitForLoading(OnlineCTR& octr)
{
}

void Client::State_Lobby_Loading(OnlineCTR& octr)
{
}

void Client::State_Game_WaitForRace(OnlineCTR& octr)
{
}

void Client::State_Game_Race(OnlineCTR& octr)
{
}

void Client::State_Game_EndRace(OnlineCTR& octr)
{
}
