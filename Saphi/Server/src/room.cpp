#include "room.h"
#include <fmtlog.h>

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
	case ServerMessageType::SG_MODIFIERS:
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
	case ServerMessageType::SG_DNFTIMER:
		msg.dnf.type = static_cast<uint8_t>(type);
		break;
	case ServerMessageType::SG_ENDRACE:
		msg.endRace.type = static_cast<uint8_t>(type);
		break;
	default:
		break;
	}
	return msg;
}

MessageAction Room::InterpretMessage(const CG_Message& message, const void* peer, const Network& net)
{
	const ClientMessageType type = static_cast<const ClientMessageType>(message.type);
	if (type == ClientMessageType::CG_JOINROOM)
	{
		if (IsRoomLocked() || m_clients.contains(peer)) { return MessageAction::FAIL; }
		Client client = {};
		client.nextId = static_cast<uint8_t>(m_clients.size());
		client.peer = peer;
		m_clients.insert({ peer, client });
	}
	if (!m_clients.contains(peer) || !m_msgFunc.contains(type)) { return MessageAction::FAIL; }
	return m_msgFunc[type](message, net, m_clients[peer]);
}

void Room::OnState(const Network& net)
{
	m_stateFunc[m_state](net);
}

void Room::Broadcast(const Network& net, const SG_Message& message, bool reliable)
{
	for (auto& [key, value] : m_clients) { net.Send(message, value.peer, reliable); }
}

void Room::Broadcast(const Network& net, const SG_Message& message, const exception_map& exceptionMap, bool reliable)
{
	for (auto& [key, value] : m_clients)
	{
		if (exceptionMap.contains(value.peer)) { continue; }
		net.Send(message, value.peer, reliable);
	}
}

void Room::CheckClientState(OnlineState state, const Network& net, const SG_Message& message)
{
	for (auto& [key, value] : m_clients)
	{
		if (value.state != state) { return; }
	}
	m_state = state;
	if (message.type != ServerMessageType::SG_EOF) { Broadcast(net, message); }
}

void Room::ResetControlVariables()
{
	m_state = OnlineState::LOBBY;
	m_trackSelected = false;
	m_dnfTimerActive = false;
	m_onlineGameModifiers = 0;
}

MessageAction Room::NewRoom(const CG_Message message, const Network& net, Client& client)
{
	logd("Room::NewRoom() [{0}]", client.name);
	SG_Message msg = Message(ServerMessageType::SG_NEWCLIENT);
	client.id = client.nextId;
	client.idleFrameCount = 0;
	msg.clientStatus.clientID = client.id;
	msg.clientStatus.numClientsTotal = static_cast<uint8_t>(m_clients.size());
	msg.clientStatus.trackSelected = m_trackSelected;
	msg.clientStatus.trackId = m_trackId;
	msg.clientStatus.lapCount = m_lapCount;
	net.Send(msg, client.peer);
	return MessageAction::CONNECT;
}

MessageAction Room::Disconnect(const CG_Message message, const Network& net, Client& client)
{
	logd("Room::Disconnect() client disconnecting... [{0}]", client.name);
	net.DisconnectPeer(client.peer);
	uint8_t numClients = static_cast<uint8_t>(m_clients.size());
	bool updatedNames = false;
	for (auto&[key, value] : m_clients)
	{
		if (value.id > client.id)
		{
			value.nextId--;
			if (m_state == OnlineState::LOBBY || m_state == OnlineState::RACE_READY)
			{
				updatedNames = true;
				value.id = value.nextId;
				SG_Message msgSelf = Message(ServerMessageType::SG_UPDATEID);
				msgSelf.id.newID = value.id;
				net.Send(msgSelf, value.peer);

				SG_Message msg = Message(ServerMessageType::SG_NAME);
				msg.name.clientID = value.id;
				msg.name.numClientsTotal = numClients;
				strncpy(msg.name.name, value.name.c_str(), sizeof(msg.name.name));
				exception_map exceptions = { value.peer };
				Broadcast(net, msg, exceptions);
			}
		}
	}
	SG_Message msgDisconnect = Message(ServerMessageType::SG_NAME);
	msgDisconnect.name.clientID = updatedNames ? numClients - 1 : client.id;
	msgDisconnect.name.numClientsTotal = numClients;
	msgDisconnect.name.name[0] = '\0';
	exception_map exceptionSelf = { client.peer };
	Broadcast(net, msgDisconnect, exceptionSelf);
	m_clients.erase(client.peer);
	if (m_clients.empty()) { ResetControlVariables(); }
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
		SG_Message msg = Message(ServerMessageType::SG_EOF);
		CheckClientState(OnlineState::RACE_END, net, msg);
	}
	return MessageAction::DISCONNECT;
}

MessageAction Room::Name(const CG_Message message, const Network& net, Client& client)
{
	SG_Message msg = Message(ServerMessageType::SG_NAME);
	msg.name.numClientsTotal = static_cast<uint8_t>(GetPlayerCount());
	msg.name.clientID = client.id;
	client.name = std::string(message.name.name);
	logd("Room::Name() client joined, name being broadcast... [{0}]", client.name);
	strncpy(msg.name.name, message.name.name, sizeof(msg.name.name));
	exception_map exceptions = { client.peer };
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
	return MessageAction::NONE;
}

MessageAction Room::Modifiers(const CG_Message message, const Network& net, Client& client)
{
	SG_Message msg = Message(ServerMessageType::SG_MODIFIERS);
	m_onlineGameModifiers = message.modifiers.onlineGameModifiers;
	msg.modifiers.onlineGameModifiers = m_onlineGameModifiers;
	logd("Room::Modifiers() modifiers broadcasted = [{0}]", m_onlineGameModifiers);
	exception_map exceptions = { client.peer };
	Broadcast(net, msg, exceptions);
	return MessageAction::NONE;
}

MessageAction Room::Track(const CG_Message message, const Network& net, Client& client)
{
	SG_Message msg = Message(ServerMessageType::SG_TRACK);
	m_trackId = message.track.trackID;
	m_lapCount = message.track.lapCount;
	logd("Room::Track() track selected... [{0}]", m_trackId);
	m_trackSelected = true;
	msg.track.trackID = m_trackId;
	msg.track.lapCount = m_lapCount;
	exception_map exceptions = { client.peer };
	Broadcast(net, msg, exceptions);
	return MessageAction::NONE;
}

MessageAction Room::Character(const CG_Message message, const Network& net, Client& client)
{
	SG_Message msg = Message(ServerMessageType::SG_CHARACTER);
	msg.character.characterID = message.character.characterID;
	logd("Room::Character() player [{0}] selected character [{1}]", client.name, message.character.characterID);
	msg.character.clientID = client.id;
	exception_map exceptions = { client.peer };
	Broadcast(net, msg, exceptions);
	client.state = OnlineState::RACE_READY;
	SG_Message msgLoad = Message(ServerMessageType::SG_STARTLOADING);
	CheckClientState(OnlineState::RACE_READY, net, msgLoad);
	return MessageAction::NONE;
}

MessageAction Room::StartRace(const CG_Message message, const Network& net, Client& client)
{
	client.state = OnlineState::RACE;
	logd("Room::StartRace() race starting for client [{0}]", client.name);
	SG_Message msg = Message(ServerMessageType::SG_STARTRACE);
	CheckClientState(OnlineState::RACE, net, msg);
	return MessageAction::NONE;
}

MessageAction Room::Kart(const CG_Message message, const Network& net, Client& client)
{
	SG_Message msg = Message(ServerMessageType::SG_KART);
	msg.kart.angle = message.kart.angle;
	msg.kart.boolReserves = message.kart.boolReserves;
	msg.kart.buttonHold = message.kart.buttonsHeld;
	if (message.kart.buttonsHeld == 0)
	{
		if (client.idleFrameCount++ > IDLE_THRESHOLD)
		{
			logd("Room::Kart() {0} idled out (DNF)", client.name);
			return Disconnect(message, net, client);
		}
	}
	else { client.idleFrameCount = 0; }
	msg.kart.clientID = client.id;
	msg.kart.posX = message.kart.posX;
	msg.kart.posY = message.kart.posY;
	msg.kart.posZ = message.kart.posZ;
	msg.kart.wumpa = message.kart.wumpa;
	exception_map exceptions = { client.peer };
	Broadcast(net, msg, exceptions, false);
	return MessageAction::NONE;
}

MessageAction Room::Weapon(const CG_Message message, const Network& net, Client& client)
{
	SG_Message msg = Message(ServerMessageType::SG_WEAPON);
	msg.weapon.clientID = client.id;
	msg.weapon.flags = message.weapon.flags;
	msg.weapon.juiced = message.weapon.juiced;
	msg.weapon.weapon = message.weapon.weapon;
	logd("Room::Weapon() {0} used weapon {1}", client.name, message.weapon.weapon);
	exception_map exceptions = { client.peer };
	Broadcast(net, msg, exceptions);
	return MessageAction::NONE;
}

MessageAction Room::EndRace(const CG_Message message, const Network& net, Client& client)
{
	if (!m_dnfTimerActive)
	{
		SG_Message msgDnfTimer = Message(ServerMessageType::SG_DNFTIMER);
		msgDnfTimer.dnf.timer = static_cast<uint16_t>(DNF_THRESHOLD_LAP * static_cast<long long>(m_lapCount));
		exception_map dnfExceptions = { client.peer };
		Broadcast(net, msgDnfTimer, dnfExceptions);
		m_dnfTimerActive = true;
		m_dnfTimerStart = std::chrono::high_resolution_clock::now();
	}

	SG_Message msg = Message(ServerMessageType::SG_ENDRACE);
	client.state = OnlineState::RACE_END;
	logd("Room::EndRace() race ended for player... [{0}]", client.name);
	msg.endRace.clientID = client.id;
	msg.endRace.courseTime = message.endRace.courseTime;
	msg.endRace.lapTime = message.endRace.lapTime;
	exception_map exceptions = { client.peer };
	Broadcast(net, msg, exceptions);
	SG_Message msgEndRace = Message(ServerMessageType::SG_EOF);
	CheckClientState(OnlineState::RACE_END, net, msgEndRace);
	return MessageAction::NONE;
}

void Room::Lobby(const Network& net)
{
}

void Room::RaceReady(const Network& net)
{
}

void Room::Race(const Network& net)
{
	if (!m_dnfTimerActive) { return; }

	std::chrono::high_resolution_clock::time_point end = std::chrono::high_resolution_clock::now();
	std::chrono::seconds timeElapsed = std::chrono::duration_cast<std::chrono::seconds>(end - m_dnfTimerStart);
	if (timeElapsed.count() < DNF_THRESHOLD_LAP * static_cast<long long>(m_lapCount)) { return; }

	SG_Message forceEndRace = Message(ServerMessageType::SG_FORCEENDRACE);
	exception_map exceptions = {};
	for (auto& [key, value] : m_clients)
	{
		if (value.state != OnlineState::RACE) { exceptions.insert(value.peer); }
		else { value.state = OnlineState::RACE_END; }
	}
	Broadcast(net, forceEndRace, exceptions);

	SG_Message msgEndRace = Message(ServerMessageType::SG_EOF);
	CheckClientState(OnlineState::RACE_END, net, msgEndRace);
}

void Room::RaceEnd(const Network& net)
{
	static bool startClock = true;
	static std::chrono::high_resolution_clock::time_point start;

	if (startClock)
	{
		SG_Message msgRaceOver = Message(ServerMessageType::SG_RACEOVER);
		Broadcast(net, msgRaceOver);
		startClock = false;
		start = std::chrono::high_resolution_clock::now();
		return;
	}

	std::chrono::high_resolution_clock::time_point end = std::chrono::high_resolution_clock::now();
	std::chrono::seconds timeElapsed = std::chrono::duration_cast<std::chrono::seconds>(end - start);
	if (timeElapsed.count() < RACE_OVER_TIMEOUT) { return; }

	ResetControlVariables();
	startClock = true;
	for (auto& [key, value] : m_clients)
	{
		SG_Message msg = Message(ServerMessageType::SG_NEWCLIENT);
		value.id = value.nextId;
		msg.clientStatus.clientID = value.id;
		msg.clientStatus.numClientsTotal = static_cast<uint8_t>(m_clients.size());
		net.Send(msg, value.peer);
	}
}
