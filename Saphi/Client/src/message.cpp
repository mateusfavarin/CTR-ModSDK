#include "message.h"
#include "psx.h"
#include "data.h"

static void PlayerHoldSquare(int slot)
{
  Gamepad& gamepad = g_psx.Read<Gamepad>(ADDR_GAMEPAD + sizeof(Gamepad) * slot);
  gamepad.buttonsHeldCurrFrame = Buttons::BTN_SQUARE_one;
  gamepad.buttonsTapped = 0;
  gamepad.buttonsReleased = 0;
  gamepad.buttonsHeldPrevFrame = Buttons::BTN_SQUARE_one;
}

void Message::Rooms(const SG_Message& message, OnlineCTR& octr)
{
  const SG_MessageRooms& msg = message.rooms;
  octr.ver_pc = VERSION_CLIENT;
  octr.ver_server = msg.version;

  if (msg.version != VERSION_CLIENT || octr.ver_psx != VERSION_CLIENT)
  {
    octr.CurrState = ClientState::LAUNCH_ERROR;
    return;
  }

  octr.hasSelectedServer = false;
  octr.numRooms = msg.numRooms;
  for (unsigned char i = 0; i < msg.numRooms; i++)
  {
    octr.roomClientCount[i] = msg.roomClientCount[i];
    octr.roomLocked[i] = msg.roomLocked[i];
  }
}

void Message::NewClient(const SG_Message& message, OnlineCTR& octr)
{
  const SG_MessageClientStatus& msg = message.clientStatus;
  octr.DriverID = msg.clientID;
  octr.NumDrivers = msg.numClientsTotal;
  if (msg.trackSelected) { octr.levelID = msg.trackId; }
  octr.boolSelectedLevel = msg.trackSelected;
  octr.boolSelectedLap = false;
  octr.lapID = 0;
  octr.levelID = 0;
  octr.boolSelectedCharacter = 0;
  octr.numDriversEnded = 0;
  RESET_ARR(octr.boolClientSelectedCharacters);
  RESET_ARR(octr.nameBuffer);
  RESET_ARR(octr.raceStats);
  memcpy(&octr.nameBuffer[0], g_gameData.m_username.data(), g_gameData.m_username.size());

  uint32_t& cheats = g_psx.Read<uint32_t>(ADDR_CHEATS);
  cheats &= ~(Cheats::CHEAT_ALL);
  octr.CurrState = ClientState::LOBBY_ASSIGN_ROLE;
}

void Message::UpdateID(const SG_Message& message, OnlineCTR& octr)
{
  const SG_MessageClientID msg = message.id;
  octr.DriverID = msg.newID;
  ClientState state = static_cast<ClientState>(octr.CurrState);
  if (msg.newID == ID_HOST && state == ClientState::LOBBY_GUEST_TRACK_WAIT)
  {
    octr.CurrState = ClientState::LOBBY_HOST_TRACK_PICK;
  }
}

void Message::Name(const SG_Message& message, OnlineCTR& octr)
{
  const SG_MessageName msg = message.name;
  const uint8_t driverID = octr.DriverID;
  if (msg.clientID == driverID) { return; }

  octr.NumDrivers = msg.numClientsTotal;
  int slot = msg.clientID < driverID ? msg.clientID + 1 : msg.clientID;
  strncpy(octr.nameBuffer[slot], msg.name, sizeof(msg.name));

  if (msg.name[0] == 0) { PlayerHoldSquare(slot); }
}

void Message::Track(const SG_Message& message, OnlineCTR& octr)
{
  const SG_MessageTrack msg = message.track;
  g_psx.Read<int8_t>(ADDR_gGT + 0x1d33) = static_cast<uint8_t>(msg.lapCount);
  octr.levelID = msg.trackID;
  octr.CurrState = ClientState::LOBBY_CHARACTER_PICK;
}

void Message::Character(const SG_Message& message, OnlineCTR& octr)
{
  const SG_MessageCharacter msg = message.character;
  const uint8_t driverID = octr.DriverID;
  if (msg.clientID == driverID) { return; }

  int slot = msg.clientID < driverID ? msg.clientID + 1 : msg.clientID;
  g_psx.Read<int16_t>(ADDR_CHARACTER + sizeof(int16_t) * slot) = msg.characterID;
  octr.boolClientSelectedCharacters[msg.clientID] = true;
}

void Message::StartLoading(const SG_Message& message, OnlineCTR& octr)
{
  octr.CurrState = ClientState::LOBBY_LOADING;
}

void Message::StartRace(const SG_Message& message, OnlineCTR& octr)
{
  octr.CurrState = ClientState::GAME_RACE;
}

void Message::Kart(const SG_Message& message, OnlineCTR& octr)
{
  const SG_MessageKart msg = message.kart;
  const uint8_t driverID = octr.DriverID;
  if (msg.clientID == driverID) { return; }

  int slot = msg.clientID < driverID ? msg.clientID + 1 : msg.clientID;
  Gamepad& gamepad = g_psx.Read<Gamepad>(ADDR_GAMEPAD + sizeof(Gamepad) * slot);
  const psxptr_t driver = g_psx.Read<psxptr_t>(ADDR_DRIVERS + sizeof(psxptr_t) * slot);

  static std::vector<uint32_t> buttonsPrev(ROOM_MAX_NUM_PLAYERS);
  uint32_t btnHeld = msg.buttonHold & ~(Buttons::BTN_CIRCLE | Buttons::BTN_L2_one);
  if (msg.buttonHold & Buttons::BTN_CIRCLE) { btnHeld |= Buttons::BTN_R1; }
  if (msg.buttonHold & Buttons::BTN_L2_one) { btnHeld |= Buttons::BTN_L1; }
  uint32_t btnPrev = buttonsPrev[slot];
  uint32_t btnTapped = ~btnPrev & btnHeld;
  uint32_t btnReleased = btnPrev & ~btnHeld;
  buttonsPrev[slot] = btnHeld;

  gamepad.buttonsHeldCurrFrame = btnHeld;
  gamepad.buttonsHeldPrevFrame = btnPrev;
  gamepad.buttonsTapped = btnTapped;
  gamepad.buttonsReleased = btnReleased;

  Vec3& pos = g_psx.Read<Vec3>(driver + 0x2d4);
  pos.x = msg.posX * 256;
  pos.y = msg.posY * 256;
  pos.z = msg.posZ * 256;

  g_psx.Read<uint16_t>(driver + 0x39a) = msg.angle;
  g_psx.Read<uint8_t>(driver + 0x30) = msg.wumpa;
  g_psx.Read<uint16_t>(driver + 0x3E2) = msg.boolReserves ? 1000 : 0;
}

void Message::Weapon(const SG_Message& message, OnlineCTR& octr)
{
  const SG_MessageWeapon msg = message.weapon;
  const uint8_t driverID = octr.DriverID;
  if (msg.clientID == driverID) { return; }

  int slot = msg.clientID < driverID ? msg.clientID + 1 : msg.clientID;
  octr.Shoot[slot].boolNow = true;
  octr.Shoot[slot].Weapon = msg.weapon;
  octr.Shoot[slot].boolJuiced = msg.juiced;
  octr.Shoot[slot].flags = msg.flags;
}

void Message::EndRace(const SG_Message& message, OnlineCTR& octr)
{
  const SG_MessageEndRace msg = message.endRace;
  const uint8_t driverID = octr.DriverID;
  if (msg.clientID == driverID) { return; }

  int slot = msg.clientID < driverID ? msg.clientID + 1 : msg.clientID;
  PlayerHoldSquare(slot);
  const uint8_t numDriversEnded = octr.numDriversEnded;
  octr.raceStats[numDriversEnded].slot = slot;
  octr.raceStats[numDriversEnded].finalTime = msg.courseTime;
  octr.raceStats[numDriversEnded].bestLap = msg.lapTime;
  octr.numDriversEnded++;
}
