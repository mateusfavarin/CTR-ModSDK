#include "server.h"

bool Server::Init()
{
  return m_net.Init();
}

void Server::Run()
{
  while (true)
  {
    while (true)
    {
      const CG_Message msg = m_net.Recv();
      const ClientMessageType type = static_cast<const ClientMessageType>(msg.type);
      if (type == ClientMessageType::CG_NONE) { break; }
      bool joinRoom = type == ClientMessageType::CG_JOINROOM;
      if (!m_clientRoomMap.contains(msg.peer) && !joinRoom)
      {
        if (type == ClientMessageType::CG_CONNECT)
        {
          m_orfanClients.insert({ msg.peer, true });
          SendInfoRooms(msg.peer);
        }
        continue;
      }
      unsigned roomID = joinRoom ? msg.room.room : m_clientRoomMap[msg.peer];
      MessageAction action = m_rooms[roomID].InterpretMessage(msg, msg.peer, m_net);
      bool broadcastRoomInfo = false;
      switch (action)
      {
      case MessageAction::CONNECT:
        m_orfanClients.erase(msg.peer);
        m_clientRoomMap.insert({ msg.peer, roomID });
        broadcastRoomInfo = true;
        break;
      case MessageAction::DISCONNECT:
        m_orfanClients.erase(msg.peer);
        m_clientRoomMap.erase(msg.peer);
        broadcastRoomInfo = true;
        break;
      default:
        break;
      }
      if (broadcastRoomInfo)
      {
        for (auto& [key, value] : m_orfanClients) { SendInfoRooms(key); }
      }
    }
    for (Room& room : m_rooms) { room.OnState(m_net); }
  }
}

void Server::Close()
{
  m_net.Close();
}

void Server::SendInfoRooms(const void* peer)
{
  SG_Message msg = {};
  msg.type = ServerMessageType::SG_ROOMS;
  msg.rooms.type = ServerMessageType::SG_ROOMS;
  msg.rooms.version = VERSION_SERVER;
  msg.rooms.numRooms = static_cast<uint8_t>(m_rooms.size());
  size_t i = 0;
  for (const Room& room : m_rooms)
  {
    msg.rooms.roomClientCount[i] = static_cast<uint8_t>(room.GetPlayerCount());
    msg.rooms.roomLocked[i] = room.IsRoomLocked();
    i++;
  }
  m_net.Send(msg, peer);
}
