#pragma once

#include "network.h"
#include "room.h"

#include <unordered_map>
#include <chrono>

class Server
{
public:
	Server(enet_uint16 port) : m_net(port) { m_rooms.resize(SERVER_NUM_ROOMS); };
	bool Init();
	void Run();
	void Close();

private:
	void SendInfoRooms(const void* peer);

private:
	Network m_net;
	std::vector<Room> m_rooms;
	std::unordered_map<const void*, bool> m_orfanClients;
	std::unordered_map<const void*, unsigned> m_clientRoomMap;
};