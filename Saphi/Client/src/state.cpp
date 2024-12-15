#include "state.h"
#include "psx.h"
#include "data.h"
#include <fmtlog.h>

#include <string>

static inline constexpr CG_Message Message(ClientMessageType type = ClientMessageType::CG_NONE, bool reliable = true)
{
	CG_Message msg = {.type = static_cast<uint8_t>(type), .reliable = reliable};
	switch (type)
	{
	case ClientMessageType::CG_JOINROOM:
		msg.room.type = static_cast<uint8_t>(type);
		break;
	case ClientMessageType::CG_NAME:
		msg.name.type = static_cast<uint8_t>(type);
		break;
	case ClientMessageType::CG_TRACK:
		msg.track.type = static_cast<uint8_t>(type);
		break;
	case ClientMessageType::CG_CHARACTER:
		msg.character.type = static_cast<uint8_t>(type);
		break;
	case ClientMessageType::CG_KART:
		msg.kart.type = static_cast<uint8_t>(type);
		break;
	case ClientMessageType::CG_WEAPON:
		msg.weapon.type = static_cast<uint8_t>(type);
		break;
	case ClientMessageType::CG_ENDRACE:
		msg.endRace.type = static_cast<uint8_t>(type);
		break;
	default:
		break;
	}
	return msg;
}

const CG_Message State::Launch_Boot(OnlineCTR& octr)
{
	CG_Message msg = Message();
	octr.CurrState = ClientState::LAUNCH_PICK_SERVER;
	octr.bootedSaphi = true;
	return msg;
}

static std::string hostName;
const CG_Message State::Launch_PickServer(OnlineCTR& octr)
{
	CG_Message msg = Message();
	const int32_t levelID = g_psx.Read<int32_t>(ADDR_gGT + 0x1a10);
	if (levelID != OCTR_MENU_LEVEL || !octr.boolJoiningServer) { return msg; }

	uint16_t port = 0;
	octr.boolJoiningServer = false;
	switch (octr.serverId)
	{
	case 0:
		hostName = "eu1.projectsaphi.com";
		port = 25565;
		break;
	case 1:
		hostName = "na1.projectsaphi.com";
		port = 65001;
		break;
	case 2:
		hostName = "as1.projectsaphi.com";
		port = 25565;
		break;
	case 7:
		hostName = "beta.projectsaphi.com";
		port = 25565;
		break;
	default:
		return msg;
	}

	msg.type = ClientMessageType::CG_CONNECT;
	msg.server.hostName = hostName.c_str();
	msg.server.port = port;
	return msg;
}

const CG_Message State::Launch_PickRoom(OnlineCTR& octr)
{
	if (!octr.boolSelectedRoom) { return Message(); }

	CG_Message msg = Message(ClientMessageType::CG_JOINROOM);
	msg.room.room = octr.serverRoom;
	return msg;
}

const CG_Message State::Launch_Error(OnlineCTR& octr)
{
	CG_Message msg = Message();
	return msg;
}

const CG_Message State::Lobby_AssignRole(OnlineCTR& octr)
{
	CG_Message msg = Message(ClientMessageType::CG_NAME);
	memcpy(&msg.name.name[0], g_gameData.m_username.data(), g_gameData.m_username.size());
	if (octr.boolSelectedLevel) { octr.CurrState = ClientState::LOBBY_CHARACTER_PICK; }
	else { octr.DriverID == 0 ? octr.CurrState = ClientState::LOBBY_HOST_MODIFIERS_PICK : octr.CurrState = ClientState::LOBBY_GUEST_TRACK_WAIT; }
	return msg;
}

const CG_Message State::Lobby_HostModifiersPick(OnlineCTR& octr)
{
	if (!octr.boolSelectedModifiers) { return Message(); }

	CG_Message msg = Message(ClientMessageType::CG_MODIFIERS);
	msg.modifiers.onlineGameModifiers = octr.onlineGameModifiers;
	octr.CurrState = ClientState::LOBBY_HOST_TRACK_PICK;
	return msg;
}

const CG_Message State::Lobby_HostTrackPick(OnlineCTR& octr)
{
	if (!octr.boolSelectedLap) { return Message(); }

	CG_Message msg = Message(ClientMessageType::CG_TRACK);
	msg.track.trackID = octr.levelID;
	msg.track.lapCount = octr.lapCount;
	g_psx.Read<int8_t>(ADDR_gGT + 0x1d33) = static_cast<uint8_t>(msg.track.lapCount);
	octr.CurrState = ClientState::LOBBY_CHARACTER_PICK;
	return msg;
}

const CG_Message State::Lobby_GuestTrackWait(OnlineCTR& octr)
{
	CG_Message msg = Message();
	return msg;
}

const CG_Message State::Lobby_CharacterPick(OnlineCTR& octr)
{
	if (!octr.boolClientSelectedCharacters[octr.DriverID]) { return Message(); }

	CG_Message msg = Message(ClientMessageType::CG_CHARACTER);
	const uint8_t charID = g_psx.Read<uint8_t>(ADDR_CHARACTER);
	msg.character.characterID = charID;
	octr.CurrState = ClientState::LOBBY_WAIT_FOR_LOADING;
	return msg;
}

const CG_Message State::Lobby_WaitForLoading(OnlineCTR& octr)
{
	CG_Message msg = Message();
	return msg;
}

static bool sentStartRace = false;
const CG_Message State::Lobby_Loading(OnlineCTR& octr)
{
	CG_Message msg = Message();
	sentStartRace = false;
	return msg;
}

static const CG_Message Game_RaceData(OnlineCTR& octr)
{
	if (octr.Shoot[0].boolNow)
	{
		CG_Message msg = Message(ClientMessageType::CG_WEAPON);
		msg.weapon.weapon = octr.Shoot[0].Weapon;
		msg.weapon.juiced = octr.Shoot[0].boolJuiced;
		msg.weapon.flags = octr.Shoot[0].flags;
		octr.Shoot[0].boolNow = false;
		return msg;
	}

	const psxptr_t driver = g_psx.Read<psxptr_t>(ADDR_DRIVERS);
	const Vec3 pos = g_psx.Read<Vec3>(driver + 0x2d4);
	const uint16_t angle = g_psx.Read<uint16_t>(driver + 0x39a);
	const uint8_t wumpaCount = g_psx.Read<uint8_t>(driver + 0x30);
	const uint16_t reserves = g_psx.Read<uint16_t>(driver + 0x3e2);
	const uint32_t btnsHeld = g_psx.Read<uint32_t>(ADDR_GAMEPAD + offsetof(Gamepad, buttonsHeldCurrFrame));

	CG_Message msg = Message(ClientMessageType::CG_KART, false);
	int8_t btns = (btnsHeld & ~(BTN_CIRCLE | BTN_L2_one)) & 0xFF;
	if (btnsHeld & BTN_R1) { btns |= BTN_CIRCLE; }
	if (btnsHeld & BTN_L1) { btns |= BTN_L2_one; }
	msg.kart.buttonsHeld = btns;
	msg.kart.angle = angle;
	msg.kart.wumpa = wumpaCount;
	msg.kart.boolReserves = reserves > 0;
	Vec3 encodedPos = pos / 256;
	msg.kart.posX = encodedPos.x & 0xFFFF;
	msg.kart.posY = encodedPos.y & 0xFFFF;
	msg.kart.posZ = encodedPos.z & 0xFFFF;
	return msg;
}

const CG_Message State::Game_WaitForRace(OnlineCTR& octr)
{
	const uint32_t gameMode = g_psx.Read<uint32_t>(ADDR_gGT + 0x0);
	if (!sentStartRace && !(gameMode & GameMode::CAMERA_FLY_IN))
	{
		CG_Message msg = Message(ClientMessageType::CG_STARTRACE);
		sentStartRace = true;
		return msg;
	}
	return Game_RaceData(octr);
}

const CG_Message State::Game_Race(OnlineCTR& octr)
{
	CG_Message msg = Game_RaceData(octr);
	return msg;
}

const CG_Message State::Game_EndRace(OnlineCTR& octr)
{
	const psxptr_t driver = g_psx.Read<psxptr_t>(ADDR_DRIVERS);
	const int32_t courseTime = g_psx.Read<int32_t>(driver + 0x514);
	const int32_t lapTime = g_psx.Read<int32_t>(driver + 0x63c);

	const uint8_t numDriversEnded = octr.numDriversEnded;
	octr.raceStats[numDriversEnded].slot = 0;
	octr.raceStats[numDriversEnded].finalTime = courseTime;
	octr.raceStats[numDriversEnded].bestLap = lapTime;
	octr.numDriversEnded++;
	octr.CurrState = ClientState::GAME_SPECTATE;

	CG_Message msg = Message(ClientMessageType::CG_ENDRACE);
	msg.endRace.courseTime = courseTime;
	msg.endRace.lapTime = lapTime;
	return msg;
}

const CG_Message State::Game_Spectate(OnlineCTR& octr)
{
	CG_Message msg = Message();
	return msg;
}
