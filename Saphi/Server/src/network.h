#pragma once

#include <enet/enet.h>
#include <OnlineCTR/global.h>

static constexpr enet_uint8 SERVER_COMM_CHANNEL = 0;

class Network
{
public:
	Network(enet_uint16 port) : m_port(port) {};
	bool Init();
	void Close();
	const CG_Message Recv();
	void Send(const SG_Message& message, const void* peer, bool reliable = true) const;

private:
	enet_uint16 m_port;
	ENetHost* m_server = nullptr;
};