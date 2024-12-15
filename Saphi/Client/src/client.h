#pragma once

#include "network.h"
#include "state.h"
#include "message.h"

#include <Saphi/global.h>
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
	void Disconnect(OnlineCTR& octr);
	bool CheckSigbusError();
	bool NextFrameReady(OnlineCTR& octr);
	void ChangeGameOptions();
	void SpawnEmu();
	void CloseEmu();

private:
	Network m_net;
	bool m_active = false;
	bool m_getEmuRAM = false;
	int m_emuPid = 0;
	void* m_emuHandle = nullptr;
	std::unordered_map<ClientState, std::function<const CG_Message(OnlineCTR&)>> m_stateFuncs = {
		BIND_STATE(ClientState::LAUNCH_BOOT,			   State::Launch_Boot),
		BIND_STATE(ClientState::LAUNCH_PICK_SERVER,		   State::Launch_PickServer),
		BIND_STATE(ClientState::LAUNCH_PICK_ROOM,		   State::Launch_PickRoom),
		BIND_STATE(ClientState::LAUNCH_ERROR,			   State::Launch_Error),
		BIND_STATE(ClientState::LOBBY_ASSIGN_ROLE,		   State::Lobby_AssignRole),
		BIND_STATE(ClientState::LOBBY_HOST_MODIFIERS_PICK, State::Lobby_HostModifiersPick),
		BIND_STATE(ClientState::LOBBY_HOST_TRACK_PICK,	   State::Lobby_HostTrackPick),
		BIND_STATE(ClientState::LOBBY_GUEST_TRACK_WAIT,    State::Lobby_GuestTrackWait),
		BIND_STATE(ClientState::LOBBY_CHARACTER_PICK,	   State::Lobby_CharacterPick),
		BIND_STATE(ClientState::LOBBY_WAIT_FOR_LOADING,    State::Lobby_WaitForLoading),
		BIND_STATE(ClientState::LOBBY_LOADING,			   State::Lobby_Loading),
		BIND_STATE(ClientState::GAME_WAIT_FOR_RACE,		   State::Game_WaitForRace),
		BIND_STATE(ClientState::GAME_RACE,				   State::Game_Race),
		BIND_STATE(ClientState::GAME_END_RACE,			   State::Game_EndRace),
		BIND_STATE(ClientState::GAME_SPECTATE,             State::Game_Spectate),
	};
	std::unordered_map<ServerMessageType, std::function<void(const SG_Message&, OnlineCTR&)>> m_recvFuncs = {
		BIND_RECV(ServerMessageType::SG_ROOMS,		  Message::Rooms),
		BIND_RECV(ServerMessageType::SG_NEWCLIENT,	  Message::NewClient),
		BIND_RECV(ServerMessageType::SG_UPDATEID,	  Message::UpdateID),
		BIND_RECV(ServerMessageType::SG_NAME,		  Message::Name),
		BIND_RECV(ServerMessageType::SG_MODIFIERS,    Message::Modifiers),
		BIND_RECV(ServerMessageType::SG_TRACK,		  Message::Track),
		BIND_RECV(ServerMessageType::SG_CHARACTER,	  Message::Character),
		BIND_RECV(ServerMessageType::SG_STARTLOADING, Message::StartLoading),
		BIND_RECV(ServerMessageType::SG_STARTRACE,    Message::StartRace),
		BIND_RECV(ServerMessageType::SG_KART,		  Message::Kart),
		BIND_RECV(ServerMessageType::SG_WEAPON,		  Message::Weapon),
		BIND_RECV(ServerMessageType::SG_DNFTIMER,	  Message::DNFTimer),
		BIND_RECV(ServerMessageType::SG_ENDRACE,	  Message::EndRace),
		BIND_RECV(ServerMessageType::SG_FORCEENDRACE, Message::ForceEndRace),
		BIND_RECV(ServerMessageType::SG_RACEOVER,	  Message::RaceOver),
	};

	/* Game variables */
	int32_t m_currGameTimer = 0;
};

extern Client g_client;