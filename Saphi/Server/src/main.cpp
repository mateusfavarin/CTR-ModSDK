#include "server.h"

#include <sstream>

int main(int argc, char* argv[])
{
	if (argc != 2) { return 0; }

	std::istringstream ss(argv[1]);
	int x;
	if (!(ss >> x) || !ss.eof()) { return 0; }
	Server server(static_cast<uint16_t>(x));
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