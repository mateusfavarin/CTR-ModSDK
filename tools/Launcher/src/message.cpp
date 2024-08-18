#include "message.h"
#include "psx.h"
#include "data.h"

void Message::Rooms(const SG_Message& message, OnlineCTR& octr)
{
  const SG_MessageRooms& msg = message.rooms;
  octr.ver_pc = VERSION_CLIENT;
  octr.ver_server = msg.version;

  if (octr.ver_server != VERSION_CLIENT || octr.ver_psx != VERSION_CLIENT)
  {
    octr.CurrState = ClientState::LAUNCH_ERROR;
    return;
  }

  octr.hasSelectedServer = false;
  octr.numRooms = msg.numRooms;
  for (unsigned char i = 0; i < octr.numRooms; i++)
  {
    octr.roomClientCount[i] = msg.roomClientCount[i];
  }
}

void Message::NewClient(const SG_Message& message, OnlineCTR& octr)
{
  const SG_MessageClientStatus& msg = message.clientStatus;
  octr.DriverID = msg.clientID;
  octr.NumDrivers = msg.numClientsTotal;
  octr.boolSelectedLap = false;
  octr.boolSelectedLevel = false;
  octr.lapID = 0;
  octr.levelID = 0;
  octr.boolSelectedCharacter = 0;
  octr.numDriversEnded = 0;
  RESET_ARR(octr.boolClientSelectedCharacters);
  RESET_ARR(octr.nameBuffer);
  RESET_ARR(octr.raceStats);
  memcpy(&octr.nameBuffer[0], g_gameData.m_username.data(), g_gameData.m_username.size());

  CG_MessageName msgSend;
  msgSend.type = ClientMessageType::CG_NAME;
  memcpy(&msgSend.name[0], g_gameData.m_username.data(), g_gameData.m_username.size());

  uint32_t& cheats = g_psx.Read<uint32_t>(ADDR_CHEATS);
  cheats &= ~(Cheats::CHEAT_ALL);
  octr.CurrState = ClientState::LOBBY_ASSIGN_ROLE;
}
