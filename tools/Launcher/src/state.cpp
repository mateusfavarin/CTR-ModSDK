#include "state.h"

const CG_Message State::Launch_Boot(OnlineCTR& octr)
{
	CG_Message msg;
	octr.CurrState = ClientState::LAUNCH_PICK_SERVER;
	msg.type = ClientMessageType::CG_NONE;
	return msg;
}

const CG_Message State::Launch_PickServer(OnlineCTR& octr)
{
	CG_Message msg;
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