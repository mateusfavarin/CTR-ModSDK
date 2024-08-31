#include "server.h"
#include "logger.h"

int main(int argc, char* argv[])
{
	Logger::PrintBanner();
	Server server(64002);
	if (!server.Init()) { return 0; }
#ifdef _DEBUG
	server.Run();
#else
	try { server.Run(); }
	catch (...) {}
#endif
	server.Close();
	return 0;
}