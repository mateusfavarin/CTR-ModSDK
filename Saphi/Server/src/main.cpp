#include "server.h"

#include "logger.h"
#include <fmtlog.h>

int main(int argc, char* argv[])
{
	Logger::LogInit();

	if (argc != 2)
	{
		loge("Server arguments missing: [port]");
		return -1;
	}

	std::istringstream ss(argv[1]);
	int x;
	if (!(ss >> x) || !ss.eof()) { return 0; }
	Server server(static_cast<uint16_t>(x));
	logi("Attempting to start server on port {0}", x);
	if (!server.Init())
	{
		loge("Server::Init() failed!");
		return -1;
	}
	logi("Server started. Server now running.");
#ifdef _DEBUG
	server.Run();
#else
	try { server.Run(); }
	catch (...)
	{ loge("server.Run() threw something..."); }
#endif
	//server.Run() is a while (true) {}, so this should never be reached currently
	logi("End of main() reached, server closing...");
	server.Close();
	return 0;
}