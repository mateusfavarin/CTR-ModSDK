#include "server.h"

#include <fmtlog.h>
#include <filesystem>
#include <iostream>

static void LogInit();

int main(int argc, char* argv[])
{
	LogInit();

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
	catch (...) {}
#endif
	//server.Run() is a while (true) {}, so this should never be reached currently
	logi("End of main() reached, server closing...");
	server.Close();
	return 0;
}

static void LogInit()
{
	fmtlog::setLogLevel(fmtlog::LogLevel::DBG);
	fmtlog::setThreadName("main");
	constexpr const char* logFileName = "log.txt", * oldLogFileName = "old-log.txt";
	//change this to allow variable amounts of saved old log files?
	//e.g., old-log-1.txt, old-log-2.txt, old-log-3.txt ...
	if (std::filesystem::exists(oldLogFileName))
	{
		try
		{
			std::filesystem::remove(oldLogFileName);
		}
		catch (...)
		{
			logw("Old log file exists, and yet could not delete it");
		}
	}
	if (std::filesystem::exists(logFileName))
	{
		try
		{
			std::filesystem::rename(logFileName, oldLogFileName);
		}
		catch (...)
		{
			logw("Previous log file exists, and yet could not rename it to old-log.txt");
		}
	}
	void (*cb)(int64_t ns, fmtlog::LogLevel level, fmt::string_view location, size_t basePos,
		fmt::string_view threadName, fmt::string_view msg, size_t bodyPos,
		size_t logFilePos);
	cb = [](int64_t ns, fmtlog::LogLevel level, fmt::string_view location, size_t basePos,
		fmt::string_view threadName, fmt::string_view msg, size_t bodyPos,
		size_t logFilePos)
		{
			//printf("%s\n", msg.begin());
			std::cout << msg.begin() << std::endl;
		};
#ifdef _DEBUG
	fmtlog::setLogLevel(fmtlog::LogLevel::DBG); //includes all logs
	fmtlog::setLogCB(cb, fmtlog::DBG);
#else
	fmtlog::setLogLevel(fmtlog::LogLevel::WRN); //does not include "DBG" or "INF"
	fmtlog::setLogCB(cb, fmtlog::WRN);
#endif
	//you can set a log file *OR* the FILE* for stdout, not both.
	fmtlog::setLogFile(logFileName);
	logi("\n   ___                         _       __           ___   \n"
		"  F __\".   ___ _    _ ___     FJ___    LJ          F __\". \n"
		" J (___|  F __` L  J '__ J   J  __ `.     ______  J (___| \n"
		" J\\___ \\ | |--| |  | |--| |  | |--| |  FJ|______| J\\___ \\ \n"
		".--___) \\F L__J J  F L__J J  F L  J J J  L______J.--___) \\\n"
		"J\\______J\\____,__LJ  _____/LJ__L  J__LJ__L       J\\______J\n"
		" J______FJ____,__F|_J_____F |__L  J__||__|        J______F\n"
		"                  L_J                                     \n"
		"Saphi Server\nBuild {0} ({1})", __DATE__, __TIME__);
	fmtlog::startPollingThread(1000000); //idk the unit of time, ...seconds?
}