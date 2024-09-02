#include "network.h"

void Network::Init()
{
	enet_initialize();
}

void Network::Close()
{
	enet_deinitialize();
}

bool Network::ConnectServer(const char* hostName, enet_uint16 port)
{
	ENetAddress addr = {};
	enet_address_set_host(&addr, hostName);
	addr.port = port;

	m_client = enet_host_create(nullptr, 1, 2, 0, 0);
	if (m_client == nullptr) { return false; }
	if (m_server) { DisconnectServer(); }
	m_server = enet_host_connect(m_client, &addr, 2, 0);
	if (m_server == nullptr) { return false; }

	ENetEvent event;
	if (enet_host_service(m_client, &event, 3000) <= 0 || event.type != ENET_EVENT_TYPE_CONNECT) { return false; }

	enet_peer_timeout(m_server, 1000000, 1000000, 1000);
	return true;
}

void Network::DisconnectServer()
{
	for (const auto&[key, value] : m_sendLock) { m_sendLock[key] = false; }
	if (m_server == nullptr) { return; }
	enet_peer_disconnect_now(m_server, 0);
	m_server = nullptr;
}

bool Network::Send(const CG_Message msg)
{
	ClientMessageType type = static_cast<ClientMessageType>(msg.type);
	if (type == ClientMessageType::CG_NONE) { return true; }

	if (m_sendLock.contains(type))
	{
		if (m_sendLock[type]) { return false; }
		m_sendLock[type] = true;
	}

	const void* data = nullptr;
	size_t size = 0;
	switch (type)
	{
		case CG_JOINROOM:
			data = static_cast<const void*>(&msg.room);
			size = sizeof(CG_MessageRoom);
			break;
		case CG_NAME:
			data = static_cast<const void*>(&msg.name);
			size = sizeof(CG_MessageName);
			break;
		case CG_TRACK:
			data = static_cast<const void*>(&msg.track);
			size = sizeof(CG_MessageTrack);
			break;
		case CG_CHARACTER:
			data = static_cast<const void*>(&msg.character);
			size = sizeof(CG_MessageCharacter);
			break;
		case CG_KART:
			data = static_cast<const void*>(&msg.kart);
			size = sizeof(CG_MessageKart);
			break;
		case CG_WEAPON:
			data = static_cast<const void*>(&msg.weapon);
			size = sizeof(CG_MessageWeapon);
			break;
		case CG_ENDRACE:
			data = static_cast<const void*>(&msg.endRace);
			size = sizeof(CG_MessageEndRace);
			break;
		default:
			data = static_cast<const void*>(&msg.type);
			size = sizeof(uint8_t);
			break;
	}
	if (data == nullptr) { return true; }
	ENetPacket* packet = enet_packet_create(data, size, msg.reliable ? ENET_PACKET_FLAG_RELIABLE : ENET_PACKET_FLAG_UNSEQUENCED);
	if (!packet || !m_server) { return false; }
	return enet_peer_send(m_server, SERVER_COMM_CHANNEL, packet) == 0;
}

const SG_Message Network::Recv()
{
	SG_Message msg = {};
	ENetEvent event;

	if (!m_client)
	{
		msg.type = ServerMessageType::SG_EOF;
		return msg;
	}

	while (enet_host_service(m_client, &event, 0) > 0)
	{
		SG_Header* header;
		ServerMessageType type;
		switch (event.type)
		{
			case ENET_EVENT_TYPE_RECEIVE:
				header = reinterpret_cast<SG_Header*>(event.packet->data);
				msg.type = header->type;
				type = static_cast<ServerMessageType>(msg.type);
				if (m_unlockKey.contains(type)) { m_sendLock[m_unlockKey[type]] = false; }
				switch (msg.type)
				{
					case ServerMessageType::SG_ROOMS:
						msg.rooms = *reinterpret_cast<SG_MessageRooms*>(event.packet->data);
						break;
					case ServerMessageType::SG_NEWCLIENT:
						msg.clientStatus = *reinterpret_cast<SG_MessageNewClient*>(event.packet->data);
						break;
					case ServerMessageType::SG_UPDATEID:
						msg.id = *reinterpret_cast<SG_MessageClientID*>(event.packet->data);
						break;
					case ServerMessageType::SG_NAME:
						msg.name = *reinterpret_cast<SG_MessageName*>(event.packet->data);
						break;
					case ServerMessageType::SG_TRACK:
						msg.track = *reinterpret_cast<SG_MessageTrack*>(event.packet->data);
						break;
					case ServerMessageType::SG_CHARACTER:
						msg.character = *reinterpret_cast<SG_MessageCharacter*>(event.packet->data);
						break;
					case ServerMessageType::SG_STARTLOADING:
						break;
					case ServerMessageType::SG_STARTRACE:
						break;
					case ServerMessageType::SG_KART:
						msg.kart = *reinterpret_cast<SG_MessageKart*>(event.packet->data);
						break;
					case ServerMessageType::SG_WEAPON:
						msg.weapon = *reinterpret_cast<SG_MessageWeapon*>(event.packet->data);
						break;
					case ServerMessageType::SG_DNFTIMER:
						msg.dnf = *reinterpret_cast<SG_MessageDNFTimer*>(event.packet->data);
						break;
					case ServerMessageType::SG_ENDRACE:
						msg.endRace = *reinterpret_cast<SG_MessageEndRace*>(event.packet->data);
						break;
					case ServerMessageType::SG_FORCEENDRACE:
						break;
					case ServerMessageType::SG_RACEOVER:
						break;
					default:
						msg.type = ServerMessageType::SG_EOF;
						break;
				}
				enet_packet_destroy(event.packet);
				return msg;

			case ENET_EVENT_TYPE_DISCONNECT:
				msg.type = ServerMessageType::SG_DISCONNECT;
				enet_packet_destroy(event.packet);
				return msg;

			default:
				enet_packet_destroy(event.packet);
				break;
		}
	}
	msg.type = ServerMessageType::SG_EOF;
	return msg;
}
