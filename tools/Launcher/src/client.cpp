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

  const uint32_t& btnHeld = g_psx.Read<uint32_t>(ADDR_GAMEPAD + offsetof(Gamepad, buttonsHeldCurrFrame));
  if (btnHeld & Buttons::BTN_SELECT)
  {
    octr.CurrState = ClientState::DISCONNECTED;
    m_net.DisconnectServer();
  }

  if (octr.CurrState != ClientState::DISCONNECTED) { m_funcs[static_cast<ClientState>(octr.CurrState)](octr); }

  while (true)
  {
    SG_Message msg = m_net.Recv();
    ServerMessageType type = static_cast<ServerMessageType>(msg.type);
    if (type == ServerMessageType::SG_EOF) { break; }
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
    There's a race condition from Duckstation and the launcher
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
