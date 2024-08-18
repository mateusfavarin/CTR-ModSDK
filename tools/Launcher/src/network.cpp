#include "network.h"

void Network::Init()
{
	enet_initialize();
}

void Network::Close()
{
	enet_deinitialize();
}

void Network::ConnectServer()
{
}

void Network::DisconnectServer()
{
	enet_peer_disconnect_now(m_server, 0);
	m_server = nullptr;
}

bool Network::Send(const void* data, size_t size, bool reliable)
{
	ENetPacket* packet = enet_packet_create(data, size, reliable ? ENET_PACKET_FLAG_RELIABLE : ENET_PACKET_FLAG_UNSEQUENCED);
	if (!packet || !m_server) { return false; }
	return enet_peer_send(m_server, SERVER_COMM_CHANNEL, packet) == 0;
}

SG_Message Network::Recv()
{
	SG_Message msg;
	ENetEvent event;

	if (!m_client)
	{
		msg.type = ServerMessageType::SG_EOF;
		return msg;
	}

	while (enet_host_service(m_client, &event, 0) > 0)
	{
		SG_Header* header = reinterpret_cast<SG_Header*>(event.packet->data);
		msg.type = header->type;
		switch (event.type)
		{
			case ENET_EVENT_TYPE_RECEIVE:
				switch (msg.type)
				{
					case ServerMessageType::SG_ROOMS:
						msg.rooms = *reinterpret_cast<SG_MessageRooms*>(event.packet->data);
						break;
					case ServerMessageType::SG_NEWCLIENT:
						msg.clientStatus = *reinterpret_cast<SG_MessageClientStatus*>(event.packet->data);
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
					case ServerMessageType::SG_RACEDATA:
						msg.kart = *reinterpret_cast<SG_MessageKart*>(event.packet->data);
						break;
					case ServerMessageType::SG_WEAPON:
						msg.weapon = *reinterpret_cast<SG_MessageWeapon*>(event.packet->data);
						break;
					case ServerMessageType::SG_ENDRACE:
						msg.endRace = *reinterpret_cast<SG_MessageEndRace*>(event.packet->data);
						break;
					default:
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
