#include "state.h"

void State::Launch_Boot(OnlineCTR& octr)
{
	octr.CurrState = ClientState::LAUNCH_PICK_SERVER;
}

void State::Launch_PickServer(OnlineCTR& octr)
{
}

void State::Launch_PickRoom(OnlineCTR& octr)
{
}

void State::Launch_Error(OnlineCTR& octr)
{
}

void State::Lobby_AssignRole(OnlineCTR& octr)
{
}

void State::Lobby_HostTrackPick(OnlineCTR& octr)
{
}

void State::Lobby_GuestTrackWait(OnlineCTR& octr)
{
}

void State::Lobby_CharacterPick(OnlineCTR& octr)
{
}

void State::Lobby_WaitForLoading(OnlineCTR& octr)
{
}

void State::Lobby_Loading(OnlineCTR& octr)
{
}

void State::Game_WaitForRace(OnlineCTR& octr)
{
}

void State::Game_Race(OnlineCTR& octr)
{
}

void State::Game_EndRace(OnlineCTR& octr)
{
}
