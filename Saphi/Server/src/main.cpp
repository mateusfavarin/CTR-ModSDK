#include "server.h"
#include "logger.h"

int main(int argc, char* argv[])
{
	Logger::PrintBanner();
	enet_uint16 port = 64002;
	Server server{ port };
	Logger::Log("Attempting to start server on port %u\n", port);
	if (!server.Init())
	{
		Logger::Log("Server::Init() failed!\n");
		return -1;
	}
	Logger::Log("Server started. Server now running.\n");
#ifdef _DEBUG
	server.Run();
#else
	try { server.Run(); }
	catch (...) {}
#endif
	Logger::Log("End of main() reached, server closing...\n");
	server.Close();
	return 0;
}