#include "room.h"

#include <chrono>
#include <cstring>

static inline constexpr SG_Message Message(ServerMessageType type = ServerMessageType::SG_EOF)
{
	SG_Message msg = {};
	msg.type = static_cast<uint8_t>(type);
	switch (type)
	{
	case ServerMessageType::SG_NEWCLIENT:
		msg.clientStatus.type = static_cast<uint8_t>(type);
		break;
	case ServerMessageType::SG_UPDATEID:
		msg.id.type = static_cast<uint8_t>(type);
		break;
	case ServerMessageType::SG_NAME:
		msg.id.type = static_cast<uint8_t>(type);
		break;
	case ServerMessageType::SG_TRACK:
		msg.track.type = static_cast<uint8_t>(type);
		break;
	case ServerMessageType::SG_CHARACTER:
		msg.character.type = static_cast<uint8_t>(type);
		break;
	case ServerMessageType::SG_KART:
		msg.kart.type = static_cast<uint8_t>(type);
		break;
	case ServerMessageType::SG_WEAPON:
		msg.weapon.type = static_cast<uint8_t>(type);
		break;
	case ServerMessageType::SG_ENDRACE:
		msg.endRace.type = static_cast<uint8_t>(type);
		break;
	default:
		break;
	}
	return msg;
}

bool Room::InterpretMessage(const CG_Message& message, const void* peer, const Network& net)
{
	const ClientMessageType type = static_cast<const ClientMessageType>(message.type);
	if (type == ClientMessageType::CG_JOINROOM)
	{
		if (IsRoomLocked() || m_clients.contains(peer)) { return false; }
		Client client = {};
		client.id = static_cast<uint8_t>(m_clients.size());
		client.peer = peer;
		m_clients.insert({ peer, client });
	}
	if (!m_clients.contains(peer) || !m_msgFunc.contains(type)) { return false; }
	return m_msgFunc[type](message, net, m_clients[peer]);
}

void Room::OnState(const Network& net)
{
	static bool startClock = true;
	static std::chrono::high_resolution_clock::time_point start;
	static std::chrono::high_resolution_clock::time_point end;

	if (m_state != OnlineState::RACE_END) { return; }

	if (startClock)
	{
		startClock = false;
		start = std::chrono::high_resolution_clock::now();
		return;
	}

	end = std::chrono::high_resolution_clock::now();
	std::chrono::seconds timeElapsed = std::chrono::duration_cast<std::chrono::seconds>(end - start);
	if (timeElapsed.count() < 5) { return; }

	m_state = OnlineState::LOBBY;
	m_trackSelected = false;
	startClock = true;
	for (auto& [key, value] : m_clients)
	{
		SG_Message msg = Message(ServerMessageType::SG_NEWCLIENT);
		msg.clientStatus.clientID = value.id;
		msg.clientStatus.numClientsTotal = static_cast<uint8_t>(m_clients.size());
		net.Send(msg, value.peer);
	}
}

void Room::Broadcast(const Network& net, const SG_Message& message, bool reliable)
{
	for (auto& [key, value] : m_clients) { net.Send(message, value.peer, reliable); }
}

void Room::Broadcast(const Network & net, const SG_Message& message, const exception_map& exceptionMap, bool reliable)
{
	for (auto& [key, value] : m_clients)
	{
		if (exceptionMap.contains(value.peer)) { continue; }
		net.Send(message, value.peer, reliable);
	}
}

void Room::CheckClientState(OnlineState state, const Network& net, const SG_Message& message, bool broadcast)
{
	for (auto& [key, value] : m_clients)
	{
		if (value.state != state) { return; }
	}
	m_state = state;
	if (broadcast) { Broadcast(net, message); }
}

bool Room::NewRoom(const CG_Message message, const Network& net, Client& client)
{
	SG_Message msg = Message(ServerMessageType::SG_NEWCLIENT);
	msg.clientStatus.clientID = client.id;
	msg.clientStatus.numClientsTotal = static_cast<uint8_t>(m_clients.size());
	msg.clientStatus.trackSelected = m_trackSelected;
	msg.clientStatus.trackId = m_trackId;
	net.Send(msg, client.peer);
	return true;
}

bool Room::Connect(const CG_Message message, const Network& net, Client& client)
{
	return true;
}

bool Room::Disconnect(const CG_Message message, const Network& net, Client& client)
{
	uint8_t numClients = static_cast<uint8_t>(m_clients.size());
	for (auto&[key, value] : m_clients)
	{
		if (value.id > client.id)
		{
			value.id--;
			SG_Message msgSelf = Message(ServerMessageType::SG_UPDATEID);
			msgSelf.id.newID = value.id;
			net.Send(msgSelf, value.peer);

			SG_Message msg = Message(ServerMessageType::SG_NAME);
			msg.name.clientID = value.id;
			msg.name.numClientsTotal = numClients;
			strncpy(msg.name.name, value.name.c_str(), sizeof(msg.name.name));
			exception_map exceptions = { { value.peer, true } };
			Broadcast(net, msg, exceptions);
		}
	}
	SG_Message msgDisconnect = Message(ServerMessageType::SG_NAME);
	msgDisconnect.name.clientID = numClients - 1;
	msgDisconnect.name.numClientsTotal = numClients;
	msgDisconnect.name.name[0] = '\0';
	exception_map exceptionSelf = { { client.peer, true } };
	Broadcast(net, msgDisconnect, exceptionSelf);
	m_clients.erase(client.peer);
	if (m_clients.empty()) { m_state = OnlineState::LOBBY; m_trackSelected = false; }
	else if (m_state == OnlineState::LOBBY)
	{
		SG_Message msg = Message(ServerMessageType::SG_STARTLOADING);
		CheckClientState(OnlineState::RACE_READY, net, msg);
	}
	else if (m_state == OnlineState::RACE_READY)
	{
		SG_Message msg = Message(ServerMessageType::SG_STARTRACE);
		CheckClientState(OnlineState::RACE, net, msg);
	}
	else if (m_state == OnlineState::RACE)
	{
		SG_Message msg = Message(ServerMessageType::SG_NEWCLIENT);
		CheckClientState(OnlineState::RACE_END, net, msg, false);
	}
	return true;
}

bool Room::Name(const CG_Message message, const Network& net, Client& client)
{
	SG_Message msg = Message(ServerMessageType::SG_NAME);
	msg.name.numClientsTotal = static_cast<uint8_t>(GetPlayerCount());
	msg.name.clientID = client.id;
	client.name = std::string(message.name.name);
	strncpy(msg.name.name, message.name.name, sizeof(msg.name.name));
	exception_map exceptions = { { client.peer, true } };
	Broadcast(net, msg, exceptions);
	for (auto&[key, value] : m_clients)
	{
		if (value.peer == client.peer) { continue; }
		SG_Message peerName = Message(ServerMessageType::SG_NAME);
		peerName.name.clientID = value.id;
		peerName.name.numClientsTotal = static_cast<uint8_t>(GetPlayerCount());
		strncpy(peerName.name.name, value.name.c_str(), sizeof(peerName.name.name));
		net.Send(peerName, client.peer);
	}
	return true;
}

bool Room::Track(const CG_Message message, const Network& net, Client& client)
{
	SG_Message msg = Message(ServerMessageType::SG_TRACK);
	m_trackId = message.track.trackID;
	m_trackSelected = true;
	msg.track.trackID = message.track.trackID;
	msg.track.lapCount = message.track.lapCount;
	exception_map exceptions = { { client.peer, true } };
	Broadcast(net, msg, exceptions);
	return true;
}

bool Room::Character(const CG_Message message, const Network& net, Client& client)
{
	SG_Message msg = Message(ServerMessageType::SG_CHARACTER);
	msg.character.characterID = message.character.characterID;
	msg.character.clientID = client.id;
	exception_map exceptions = { { client.peer, true } };
	Broadcast(net, msg, exceptions);
	client.state = OnlineState::RACE_READY;
	SG_Message msgLoad = Message(ServerMessageType::SG_STARTLOADING);
	CheckClientState(OnlineState::RACE_READY, net, msgLoad);
	return true;
}

bool Room::StartRace(const CG_Message message, const Network& net, Client& client)
{
	client.state = OnlineState::RACE;
	SG_Message msg = Message(ServerMessageType::SG_STARTRACE);
	CheckClientState(OnlineState::RACE, net, msg);
	return true;
}

bool Room::Kart(const CG_Message message, const Network& net, Client& client)
{
	SG_Message msg = Message(ServerMessageType::SG_KART);
	msg.kart.angle = message.kart.angle;
	msg.kart.boolReserves = message.kart.boolReserves;
	msg.kart.buttonHold = message.kart.buttonsHeld;
	msg.kart.clientID = client.id;
	msg.kart.posX = message.kart.posX;
	msg.kart.posY = message.kart.posY;
	msg.kart.posZ = message.kart.posZ;
	msg.kart.wumpa = message.kart.wumpa;
	exception_map exceptions = { { client.peer, true } };
	Broadcast(net, msg, exceptions, false);
	return true;
}

bool Room::Weapon(const CG_Message message, const Network& net, Client& client)
{
	SG_Message msg = Message(ServerMessageType::SG_WEAPON);
	msg.weapon.clientID = client.id;
	msg.weapon.flags = message.weapon.flags;
	msg.weapon.juiced = message.weapon.juiced;
	msg.weapon.weapon = message.weapon.weapon;
	exception_map exceptions = { { client.peer, true } };
	Broadcast(net, msg, exceptions, false);
	return true;
}

bool Room::EndRace(const CG_Message message, const Network& net, Client& client)
{
	SG_Message msg = Message(ServerMessageType::SG_ENDRACE);
	client.state = OnlineState::RACE_END;
	msg.endRace.clientID = client.id;
	msg.endRace.courseTime = message.endRace.courseTime;
	msg.endRace.lapTime = message.endRace.lapTime;
	exception_map exceptions = { { client.peer, true } };
	Broadcast(net, msg, exceptions, false);
	SG_Message msgEndRace = Message(ServerMessageType::SG_NEWCLIENT);
	CheckClientState(OnlineState::RACE_END, net, msgEndRace, false);
	return true;
}