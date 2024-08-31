#include "server.h"
#include "logger.h"

#include <sstream>

int main(int argc, char* argv[])
{
	if (argc != 2) 
	{
		Logger::Log("Server arguments missing: [port]\n");
		return -1; 
	}

	std::istringstream ss(argv[1]);
	int x;
	if (!(ss >> x) || !ss.eof()) { return 0; }
	Server server(static_cast<uint16_t>(x));
	Logger::PrintBanner();
	Logger::Log("Attempting to start server on port %d\n", x);
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
	//server.Run() is a while (true) {}, so this should never be reached currently
	Logger::Log("End of main() reached, server closing...\n");
	server.Close();
	return 0;
}