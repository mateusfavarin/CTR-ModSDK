#include "server.h"

int main(int argc, char* argv[])
{
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