#pragma once

#include <enet/enet.h>
#include <OnlineCTR/global.h>

static constexpr enet_uint8 SERVER_COMM_CHANNEL = 0;

class Network
{
public:
	void Init();
	void Close();
	void ConnectServer();
	void DisconnectServer();
	bool Send(const void* data, size_t size, bool reliable);
	SG_Message Recv();

private:
	ENetHost* m_client;
	ENetPeer* m_server;
};