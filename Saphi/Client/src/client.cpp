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
  if (btnHeld & Buttons::BTN_SELECT)
  {
    octr.CurrState = ClientState::DISCONNECTED;
    m_net.DisconnectServer();
  }

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
    if (type == ServerMessageType::SG_EOF) { break; }
    if (!m_recvFuncs.contains(type)) { continue; }
    m_recvFuncs[type](msg, octr);
  }
  octr.windowsClientSync++;
}

void Client::Close()
{
  CloseDuck();
  m_net.Close();
}

void Client::StartEmulation()
{
  if (g_gameData.m_reset)
  {
    SpawnDuck();
    g_gameData.m_reset = false;
  }
  if (m_getDuckRAM)
  {
    const size_t PSX_RAM_SIZE = 0x800000;
    uint8_t* ram = Process::GetDuckRAM("duckstation_" + std::to_string(m_duckPid), PSX_RAM_SIZE);
    if (ram == nullptr) { return; }
    g_psx.SetRam(ram);
    m_getDuckRAM = false;
    m_active = true;
  }
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
    m_getDuckRAM = true; // Try to get another pointer to shmem
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

void Client::SpawnDuck()
{
  CloseDuck();
  auto proc = Process::New(g_gameData.m_duckCommand);
  int pid = std::get<int>(proc);
  void* handle = std::get<void*>(proc);
  if (pid == INVALID_PID) { return; }
  m_duckPid = pid;
  m_duckHandle = handle;
  m_getDuckRAM = true;
}

void Client::CloseDuck()
{
  if (m_duckHandle != nullptr) { Process::Kill(m_duckHandle); } /* Windows only */
  else if (m_duckPid != 0) { Process::Kill(m_duckPid); } /* Linux only */
}
