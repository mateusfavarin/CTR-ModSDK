#pragma once

#include <OnlineCTR/global.h>

namespace State
{
	void Launch_Boot(OnlineCTR& octr);
	void Launch_PickServer(OnlineCTR& octr);
	void Launch_PickRoom(OnlineCTR& octr);
	void Launch_Error(OnlineCTR& octr);
	void Lobby_AssignRole(OnlineCTR& octr);
	void Lobby_HostTrackPick(OnlineCTR& octr);
	void Lobby_GuestTrackWait(OnlineCTR& octr);
	void Lobby_CharacterPick(OnlineCTR& octr);
	void Lobby_WaitForLoading(OnlineCTR& octr);
	void Lobby_Loading(OnlineCTR& octr);
	void Game_WaitForRace(OnlineCTR& octr);
	void Game_Race(OnlineCTR& octr);
	void Game_EndRace(OnlineCTR& octr);
}