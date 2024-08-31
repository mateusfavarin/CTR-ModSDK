#include "client.h"
#include "data.h"
#include "process.h"
#include "psx.h"

Client g_client;

void Client::Init()
{
  m_net.Init();
  Process::HandleSigbus();
}

void Client::Run()
{
  StartEmulation();
  if (!m_active) { return; }

  OnlineCTR& octr = g_psx.Read<OnlineCTR>(ADDR_OCTR);
  if (CheckSigbusError() || !NextFrameReady(octr)) { return; }

  ChangeGameOptions();
  const uint32_t& btnHeld = g_psx.Read<uint32_t>(ADDR_GAMEPAD + offsetof(Gamepad, buttonsHeldCurrFrame));
  if (btnHeld & Buttons::BTN_SELECT) { Disconnect(octr); }

  if (octr.CurrState != ClientState::DISCONNECTED)
  {
    ClientState state = static_cast<ClientState>(octr.CurrState);
    const CG_Message msg = m_stateFuncs[state](octr);
    if (msg.type == ClientMessageType::CG_CONNECT)
    {
      if (m_net.ConnectServer(msg.hostName))
      {
        octr.DriverID = ID_WAIT_ASSIGNMENT;
        octr.CurrState = ClientState::LAUNCH_PICK_ROOM;
      }
      octr.boolClientBusy = false;
    }
    else
    {
      m_net.Send(msg);
    }
  }

  while (true)
  {
    const SG_Message msg = m_net.Recv();
    const ServerMessageType type = static_cast<const ServerMessageType>(msg.type);
    if (type == ServerMessageType::SG_DISCONNECT) { Disconnect(octr); continue; }
    if (type == ServerMessageType::SG_EOF) { break; }
    if (!m_recvFuncs.contains(type)) { continue; }
    m_recvFuncs[type](msg, octr);
  }
  octr.windowsClientSync++;
}

void Client::Close()
{
  CloseEmu();
  m_net.Close();
}

void Client::StartEmulation()
{
  if (g_gameData.m_reset)
  {
    SpawnEmu();
    g_gameData.m_reset = false;
  }
  if (m_getEmuRAM)
  {
    const size_t PSX_RAM_SIZE = 0x800000;
#ifdef _DEBUG // = redux
    uint8_t* ram = Process::GetEmuRAM("pcsx-redux-wram-" + std::to_string(m_emuPid), PSX_RAM_SIZE);
#else //_RELEASE = duckstation
    uint8_t* ram = Process::GetEmuRAM("duckstation_" + std::to_string(m_emuPid), PSX_RAM_SIZE);
#endif
    if (ram == nullptr) { return; }
    g_psx.SetRam(ram);
    m_getEmuRAM = false;
    m_active = true;
  }
}

void Client::Disconnect(OnlineCTR& octr)
{
  octr.CurrState = ClientState::DISCONNECTED;
  m_net.DisconnectServer();
}

bool Client::CheckSigbusError()
{
  /*
    There's a race condition from Duckstation and the client
    when reading from the shared memory map. Duckstation may
    provide an incomplete mapping, so we gotta hook the SIGBUS
    and wait until we get no more errors from the first read.
  */
  if (g_busError)
  {
    g_busError = false;
    m_getEmuRAM = true; // Try to get another pointer to shmem
    return true;
  }
  return false;
}

bool Client::NextFrameReady(OnlineCTR& octr)
{
  const int32_t gameTimer = g_psx.Read<int32_t>(ADDR_gGT + 0x1cf8);
  if (!octr.IsBootedPS1 || gameTimer == m_currGameTimer) { return false; }
  m_currGameTimer = gameTimer;
  return true;
}

void Client::ChangeGameOptions()
{
  const uint32_t gameMode = g_psx.Read<uint32_t>(ADDR_gGT + 0x0);
  g_psx.Read<uint32_t>(ADDR_FX) = static_cast<uint32_t>(g_gameData.m_fx * 255.0f);
  g_psx.Read<uint32_t>(ADDR_MUSIC) = static_cast<uint32_t>(g_gameData.m_music * 255.0f);
  g_psx.Read<uint32_t>(ADDR_VOICE) = static_cast<uint32_t>(g_gameData.m_voice * 255.0f);
  g_psx.Read<uint32_t>(ADDR_STEREO) = g_gameData.m_stereo;
  g_psx.Read<uint32_t>(ADDR_gGT + 0x0) = g_gameData.m_vibration ? gameMode & ~(GameMode::VIBRATION_P1) : gameMode | GameMode::VIBRATION_P1;
}

void Client::SpawnEmu()
{
  CloseEmu();
#ifdef _DEBUG
  auto proc = Process::New(g_gameData.m_reduxCommand);
#else
  auto proc = Process::New(g_gameData.m_duckCommand);
#endif
  int pid = std::get<int>(proc);
  void* handle = std::get<void*>(proc);
  if (pid == INVALID_PID) { return; }
  m_emuPid = pid;
  m_emuHandle = handle;
  m_getEmuRAM = true;
}

void Client::CloseEmu()
{
  if (m_emuHandle != nullptr) { Process::Kill(m_emuHandle); } /* Windows only */
  else if (m_emuPid != 0) { Process::Kill(m_emuPid); } /* Linux only */
}
