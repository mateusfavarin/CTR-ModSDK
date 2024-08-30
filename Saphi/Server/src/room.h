#pragma once

#include "network.h"

#include <vector>
#include <string>
#include <unordered_map>
#include <functional>

#include <OnlineCTR/global.h>

#define BIND_MSG(type, func) { type, std::bind(&Room::func, this, std::placeholders::_1, std::placeholders::_2, std::placeholders::_3) }

enum class OnlineState
{
	LOBBY,
	RACE_READY,
	RACE,
	RACE_END
};

typedef std::unordered_map<const void*, bool> exception_map;

struct Client
{
	std::string name;
	const void* peer;
	uint8_t id;
	OnlineState state;
};

class Room
{
public:
	bool InterpretMessage(const CG_Message& message, const void* peer, const Network& net);
	void OnState(const Network& net);
	inline size_t GetPlayerCount() const;
	inline bool IsRoomLocked() const;

private:
	void Broadcast(const Network& net, const SG_Message& message, bool reliable = true);
	void Broadcast(const Network& net, const SG_Message& message, const exception_map& exceptionMap, bool reliable = true);
	void CheckClientState(OnlineState state, const Network& net, const SG_Message& message, bool broadcast = true);
	bool NewRoom(const CG_Message message, const Network& net, Client& client);
	bool Connect(const CG_Message message, const Network& net, Client& client);
	bool Disconnect(const CG_Message message, const Network& net, Client& client);
	bool Name(const CG_Message message, const Network& net, Client& client);
	bool Track(const CG_Message message, const Network& net, Client& client);
	bool Character(const CG_Message message, const Network& net, Client& client);
	bool StartRace(const CG_Message message, const Network& net, Client& client);
	bool Kart(const CG_Message message, const Network& net, Client& client);
	bool Weapon(const CG_Message message, const Network& net, Client& client);
	bool EndRace(const CG_Message message, const Network& net, Client& client);

private:
	OnlineState m_state = OnlineState::LOBBY;
	std::unordered_map<const void*, Client> m_clients;
	std::unordered_map<ClientMessageType, std::function<bool(const CG_Message, const Network& net, Client&)>> m_msgFunc = {
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
};