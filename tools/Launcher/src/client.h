#pragma once

#include "network.h"
#include "state.h"
#include "message.h"

#include <OnlineCTR/global.h>
#include <string>
#include <unordered_map>
#include <functional>

#define BIND_STATE(state, func) { state, std::bind(&func, std::placeholders::_1) }
#define BIND_RECV(state, func) { state, std::bind(&func, std::placeholders::_1, std::placeholders::_2) }

class Client
{
public:
	void Init();
	void Run();
	void Close();

private:
	void StartEmulation();
	bool CheckSigbusError();
	bool NextFrameReady(OnlineCTR& octr);
	void SpawnDuck();
	void CloseDuck();

private:
	Network m_net;
	bool m_active = false;
	bool m_getDuckRAM = false;
	int m_duckPid = 0;
	void* m_duckHandle = nullptr;
	std::unordered_map<ClientState, std::function<void(OnlineCTR&)>> m_funcs = {
		BIND_STATE(ClientState::LAUNCH_BOOT,			State::Launch_Boot),
		BIND_STATE(ClientState::LAUNCH_PICK_SERVER,		State::Launch_PickServer),
		BIND_STATE(ClientState::LAUNCH_PICK_ROOM,		State::Launch_PickRoom),
		BIND_STATE(ClientState::LAUNCH_ERROR,			State::Launch_Error),
		BIND_STATE(ClientState::LOBBY_ASSIGN_ROLE,		State::Lobby_AssignRole),
		BIND_STATE(ClientState::LOBBY_HOST_TRACK_PICK,	State::Lobby_HostTrackPick),
		BIND_STATE(ClientState::LOBBY_GUEST_TRACK_WAIT, State::Lobby_GuestTrackWait),
		BIND_STATE(ClientState::LOBBY_CHARACTER_PICK,	State::Lobby_CharacterPick),
		BIND_STATE(ClientState::LOBBY_WAIT_FOR_LOADING, State::Lobby_WaitForLoading),
		BIND_STATE(ClientState::LOBBY_LOADING,			State::Lobby_Loading),
		BIND_STATE(ClientState::GAME_WAIT_FOR_RACE,		State::Game_WaitForRace),
		BIND_STATE(ClientState::GAME_RACE,				State::Game_Race),
		BIND_STATE(ClientState::GAME_END_RACE,			State::Game_EndRace),
	};
	std::unordered_map<ServerMessageType, std::function<void(const SG_Message&, OnlineCTR&)>> m_recvFuncs = {
		BIND_RECV(ServerMessageType::SG_ROOMS, Message::Rooms),
		BIND_RECV(ServerMessageType::SG_NEWCLIENT, Message::NewClient),
	};

	/* Game variables */
	int32_t m_currGameTimer = 0;
};

extern Client g_client;