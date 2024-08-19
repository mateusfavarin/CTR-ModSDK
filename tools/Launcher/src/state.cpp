#include "state.h"
#include "psx.h"

#include <string>

static inline CG_Message Message()
{
	CG_Message msg = { .type = ClientMessageType::CG_NONE, .reliable = 1 };
	return msg;
}

static inline CG_Message Message(ClientMessageType type, bool reliable = true)
{
	CG_Message msg = {.type = static_cast<uint8_t>(type), .reliable = reliable};
	return msg;
}

const CG_Message State::Launch_Boot(OnlineCTR& octr)
{
	CG_Message msg = Message();
	octr.CurrState = ClientState::LAUNCH_PICK_SERVER;
	return msg;
}

static std::string hostName;
const CG_Message State::Launch_PickServer(OnlineCTR& octr)
{
	CG_Message msg = Message();
	int32_t levelID = g_psx.Read<int32_t>(ADDR_gGT + 0x1a10);
	int32_t loadingStatus = g_psx.Read<int32_t>(ADDR_LOADING);
	if (levelID != OCTR_MENU_LEVEL || loadingStatus == -1) { return msg; }

	octr.boolClientBusy = true;
	switch (octr.serverId)
	{
	case 0:
		hostName = "test.projectsaphi.com";
		break;

	default:
		return msg;
	}

	msg.type = ClientMessageType::CG_CONNECT;
	msg.hostName = hostName.c_str();
	return msg;
}

const CG_Message State::Launch_PickRoom(OnlineCTR& octr)
{
	CG_Message msg;
	return msg;
}

const CG_Message State::Launch_Error(OnlineCTR& octr)
{
	CG_Message msg;
	return msg;
}

const CG_Message State::Lobby_AssignRole(OnlineCTR& octr)
{
	CG_Message msg;
	return msg;
}

const CG_Message State::Lobby_HostTrackPick(OnlineCTR& octr)
{
	CG_Message msg;
	return msg;
}

const CG_Message State::Lobby_GuestTrackWait(OnlineCTR& octr)
{
	CG_Message msg;
	return msg;
}

const CG_Message State::Lobby_CharacterPick(OnlineCTR& octr)
{
	CG_Message msg;
	return msg;
}

const CG_Message State::Lobby_WaitForLoading(OnlineCTR& octr)
{
	CG_Message msg;
	return msg;
}

const CG_Message State::Lobby_Loading(OnlineCTR& octr)
{
	CG_Message msg;
	return msg;
}

const CG_Message State::Game_WaitForRace(OnlineCTR& octr)
{
	CG_Message msg;
	return msg;
}

const CG_Message State::Game_Race(OnlineCTR& octr)
{
	CG_Message msg;
	return msg;
}

const CG_Message State::Game_EndRace(OnlineCTR& octr)
{
	CG_Message msg;
	return msg;
}