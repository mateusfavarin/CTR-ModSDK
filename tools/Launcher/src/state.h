#pragma once

#include <OnlineCTR/global.h>

namespace State
{
	const CG_Message Launch_Boot(OnlineCTR& octr);
	const CG_Message Launch_PickServer(OnlineCTR& octr);
	const CG_Message Launch_PickRoom(OnlineCTR& octr);
	const CG_Message Launch_Error(OnlineCTR& octr);
	const CG_Message Lobby_AssignRole(OnlineCTR& octr);
	const CG_Message Lobby_HostTrackPick(OnlineCTR& octr);
	const CG_Message Lobby_GuestTrackWait(OnlineCTR& octr);
	const CG_Message Lobby_CharacterPick(OnlineCTR& octr);
	const CG_Message Lobby_WaitForLoading(OnlineCTR& octr);
	const CG_Message Lobby_Loading(OnlineCTR& octr);
	const CG_Message Game_WaitForRace(OnlineCTR& octr);
	const CG_Message Game_Race(OnlineCTR& octr);
	const CG_Message Game_EndRace(OnlineCTR& octr);
	const CG_Message Game_Spectate(OnlineCTR& octr);
}