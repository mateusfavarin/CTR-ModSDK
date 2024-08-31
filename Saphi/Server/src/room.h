#pragma once

#include "network.h"

#include <vector>
#include <string>
#include <unordered_map>
#include <functional>
#include <chrono>

#include <OnlineCTR/global.h>

#define BIND_MSG(type, func) { type, std::bind(&Room::func, this, std::placeholders::_1, std::placeholders::_2, std::placeholders::_3) }
#define BIND_STATE(type, func) { type, std::bind(&Room::func, this, std::placeholders::_1) }

static constexpr unsigned FPS = 30;
static constexpr unsigned IDLE_THRESHOLD = FPS * 20;
static constexpr long long DNF_THRESHOLD_LAP = 10; // std::chrono::seconds

enum class OnlineState
{
	LOBBY,
	RACE_READY,
	RACE,
	RACE_END
};

enum class MessageAction
{
	NONE,
	FAIL,
	CONNECT,
	DISCONNECT,
};

typedef std::unordered_map<const void*, bool> exception_map;

struct Client
{
	std::string name;
	const void* peer;
	uint8_t id;
	uint8_t nextId;
	OnlineState state;
	unsigned idleFrameCount;
};

class Room
{
public:
	MessageAction InterpretMessage(const CG_Message& message, const void* peer, const Network& net);
	void OnState(const Network& net);
	inline size_t GetPlayerCount() const { return m_clients.size(); };
	inline bool IsRoomLocked() const { return m_state != OnlineState::LOBBY || m_clients.size() == ROOM_MAX_NUM_PLAYERS; };

private:
	void Broadcast(const Network& net, const SG_Message& message, bool reliable = true);
	void Broadcast(const Network& net, const SG_Message& message, const exception_map& exceptionMap, bool reliable = true);
	void CheckClientState(OnlineState state, const Network& net, const SG_Message& message);
	void ResetControlVariables();
	/* Message Functions */
	MessageAction NewRoom(const CG_Message message, const Network& net, Client& client);
	MessageAction Connect(const CG_Message message, const Network& net, Client& client);
	MessageAction Disconnect(const CG_Message message, const Network& net, Client& client);
	MessageAction Name(const CG_Message message, const Network& net, Client& client);
	MessageAction Track(const CG_Message message, const Network& net, Client& client);
	MessageAction Character(const CG_Message message, const Network& net, Client& client);
	MessageAction StartRace(const CG_Message message, const Network& net, Client& client);
	MessageAction Kart(const CG_Message message, const Network& net, Client& client);
	MessageAction Weapon(const CG_Message message, const Network& net, Client& client);
	MessageAction EndRace(const CG_Message message, const Network& net, Client& client);
	/* State Functions */
	void Lobby(const Network& net);
	void RaceReady(const Network& net);
	void Race(const Network& net);
	void RaceEnd(const Network& net);

private:
	std::chrono::high_resolution_clock::time_point m_dnfTimerStart;
	bool m_dnfTimerActive = false;
	uint16_t m_lapCount = 0;
	uint8_t m_trackId = 0;
	bool m_trackSelected = false;
	OnlineState m_state = OnlineState::LOBBY;
	std::unordered_map<const void*, Client> m_clients;
	std::unordered_map<ClientMessageType, std::function<MessageAction(const CG_Message, const Network& net, Client&)>> m_msgFunc = {
		BIND_MSG(ClientMessageType::CG_JOINROOM, NewRoom),
		BIND_MSG(ClientMessageType::CG_CONNECT, Connect),
		BIND_MSG(ClientMessageType::CG_DISCONNECT, Disconnect),
		BIND_MSG(ClientMessageType::CG_NAME, Name),
		BIND_MSG(ClientMessageType::CG_TRACK, Track),
		BIND_MSG(ClientMessageType::CG_CHARACTER, Character),
		BIND_MSG(ClientMessageType::CG_STARTRACE, StartRace),
		BIND_MSG(ClientMessageType::CG_KART, Kart),
		BIND_MSG(ClientMessageType::CG_WEAPON, Weapon),
		BIND_MSG(ClientMessageType::CG_ENDRACE, EndRace),
	};
	std::unordered_map<OnlineState, std::function<void(const Network& net)>> m_stateFunc = {
		BIND_STATE(OnlineState::LOBBY, Lobby),
		BIND_STATE(OnlineState::RACE_READY, RaceReady),
		BIND_STATE(OnlineState::RACE, Race),
		BIND_STATE(OnlineState::RACE_END, RaceEnd),
	};
};