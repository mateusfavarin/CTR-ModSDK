#pragma once

#include <enet/enet.h>
#include <Saphi/global.h>

#include <string>
#include <unordered_map>

static constexpr enet_uint8 SERVER_COMM_CHANNEL = 0;

class Network
{
public:
	void Init();
	void Close();
	bool ConnectServer(const char* hostName, enet_uint16 port);
	void DisconnectServer();
	bool Send(const CG_Message msg);
	const SG_Message Recv();

private:
	ENetHost* m_client;
	ENetPeer* m_server;
	std::unordered_map<ClientMessageType, bool> m_sendLock = {
		{ ClientMessageType::CG_JOINROOM, false },
	};
	std::unordered_map<ServerMessageType, ClientMessageType> m_unlockKey = { /* Message received unlocks the lock */
		{ ServerMessageType::SG_ROOMS, ClientMessageType::CG_JOINROOM },
	};
};