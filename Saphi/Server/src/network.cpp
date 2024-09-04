#include "network.h"

bool Network::Init()
{
  if (enet_initialize() != 0) { return false; }

  ENetAddress addr = {};
  addr.host = ENET_HOST_ANY;
  addr.port = m_port;
  m_server = enet_host_create(&addr, SERVER_NUM_ROOMS * ROOM_MAX_NUM_PLAYERS * 2, 2, 0, 0);
  if (m_server == nullptr) { return false; }
  return true;
}

void Network::Close()
{
  enet_deinitialize();
}

const CG_Message Network::Recv()
{
  CG_Message msg = {};
  ENetEvent event;
  msg.type = ClientMessageType::CG_NONE;
  msg.peer = nullptr;

  if (enet_host_service(m_server, &event, 1) > 0)
  {
    CG_Header* header;
    switch (event.type)
    {
    case ENET_EVENT_TYPE_RECEIVE:
      header = reinterpret_cast<CG_Header*>(event.packet->data);
      msg.type = header->type;
      msg.peer = static_cast<void*>(event.peer);
      switch (msg.type)
      {
      case ClientMessageType::CG_JOINROOM:
        msg.room = *reinterpret_cast<CG_MessageRoom*>(event.packet->data);
        break;
      case ClientMessageType::CG_NAME:
        msg.name = *reinterpret_cast<CG_MessageName*>(event.packet->data);
        break;
      case ClientMessageType::CG_TRACK:
        msg.track = *reinterpret_cast<CG_MessageTrack*>(event.packet->data);
        break;
      case ClientMessageType::CG_CHARACTER:
        msg.character = *reinterpret_cast<CG_MessageCharacter*>(event.packet->data);
        break;
      case ClientMessageType::CG_KART:
        msg.kart = *reinterpret_cast<CG_MessageKart*>(event.packet->data);
        break;
      case ClientMessageType::CG_WEAPON:
        msg.weapon = *reinterpret_cast<CG_MessageWeapon*>(event.packet->data);
        break;
      case ClientMessageType::CG_ENDRACE:
        msg.endRace = *reinterpret_cast<CG_MessageEndRace*>(event.packet->data);
        break;
      }
      break;
    case ENET_EVENT_TYPE_CONNECT:
      msg.type = ClientMessageType::CG_CONNECT;
      msg.peer = static_cast<void*>(event.peer);
      enet_peer_timeout(event.peer, 1000000, 1000000, 1000);
      break;
    case ENET_EVENT_TYPE_DISCONNECT:
      msg.type = ClientMessageType::CG_DISCONNECT;
      msg.peer = static_cast<void*>(event.peer);
      break;
    default:
      msg.type = ClientMessageType::CG_NONE;
      msg.peer = nullptr;
      break;
    }
    enet_packet_destroy(event.packet);
  }
  return msg;
}

void Network::Send(const SG_Message& message, const void* peer, bool reliable) const
{
  ServerMessageType type = static_cast<ServerMessageType>(message.type);

  const void* data = nullptr;
  size_t size = 0;
  switch (type)
  {
  case ServerMessageType::SG_ROOMS:
    data = static_cast<const void*>(&message.rooms);
    size = sizeof(SG_MessageRooms);
    break;
  case ServerMessageType::SG_NEWCLIENT:
    data = static_cast<const void*>(&message.clientStatus);
    size = sizeof(SG_MessageNewClient);
    break;
  case ServerMessageType::SG_UPDATEID:
    data = static_cast<const void*>(&message.id);
    size = sizeof(SG_MessageClientID);
    break;
  case ServerMessageType::SG_NAME:
    data = static_cast<const void*>(&message.name);
    size = sizeof(SG_MessageName);
    break;
  case ServerMessageType::SG_TRACK:
    data = static_cast<const void*>(&message.track);
    size = sizeof(SG_MessageTrack);
    break;
  case ServerMessageType::SG_CHARACTER:
    data = static_cast<const void*>(&message.character);
    size = sizeof(SG_MessageCharacter);
    break;
  case ServerMessageType::SG_KART:
    data = static_cast<const void*>(&message.kart);
    size = sizeof(SG_MessageKart);
    break;
  case ServerMessageType::SG_WEAPON:
    data = static_cast<const void*>(&message.weapon);
    size = sizeof(SG_MessageWeapon);
    break;
  case ServerMessageType::SG_DNFTIMER:
    data = static_cast<const void*>(&message.dnf);
    size = sizeof(SG_MessageDNFTimer);
    break;
  case ServerMessageType::SG_ENDRACE:
    data = static_cast<const void*>(&message.endRace);
    size = sizeof(SG_MessageEndRace);
    break;
  default:
    data = static_cast<const void*>(&message.type);
    size = sizeof(uint8_t);
    break;
  }
  if (data == nullptr) { return; }
  ENetPacket* packet = enet_packet_create(data, size, reliable ? ENET_PACKET_FLAG_RELIABLE : ENET_PACKET_FLAG_UNSEQUENCED);
  ENetPeer* netPeer = const_cast<ENetPeer*>(static_cast<const ENetPeer*>(peer));
  if (!packet || !netPeer || netPeer->state != ENET_PEER_STATE_CONNECTED) { return; }
  enet_peer_send(netPeer, SERVER_COMM_CHANNEL, packet);
}

void Network::DisconnectPeer(const void* peer) const
{
  ENetPeer* netPeer = const_cast<ENetPeer*>(static_cast<const ENetPeer*>(peer));
  enet_peer_disconnect_now(netPeer, 0);
}
