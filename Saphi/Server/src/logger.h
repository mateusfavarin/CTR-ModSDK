#pragma once

#include <fmtlog.h>
#include <filesystem>
#include <iostream>
#include <string_view>
#include "../../General/AltMods/Saphi/global.h"

namespace Logger
{
	constexpr const char* logFileName = "log.txt";
	constexpr const char* oldLogFileName = "old-log.txt";
	constexpr const char* crashLogFileName = "crash-log.txt";

	//do not call this function, used internally.
	void LogCallback(int64_t ns, fmtlog::LogLevel level, fmt::string_view location,
		    size_t basePos, fmt::string_view threadName, fmt::string_view msg, size_t bodyPos,
			size_t logFilePos)
	{
		//since the logfile is set to the log file and not stdout, we use this callback
		//to print to stdout.

		//printf("%s\n", msg.begin());
		//std::string str{ msg.begin(), msg.end() };
		std::string_view str{ msg.begin(), msg.size() };
		std::cout << str << std::endl;
	}

	void LogInit()
	{
		fmtlog::setLogLevel(fmtlog::LogLevel::DBG);
		fmtlog::setThreadName("main");
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
		cb = LogCallback;
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
			"Saphi Server (Version {0})\nBuild {1} ({2})", VERSION_SERVER, __DATE__, __TIME__);
		fmtlog::startPollingThread(1000); //idk the unit of time, ...milliseconds?
	}

	void RenameLogAsCrash()
	{
		fmtlog::stopPollingThread();
		if (std::filesystem::exists(crashLogFileName))
		{
			try
			{
				std::filesystem::remove(crashLogFileName);
			}
			catch (...)
			{
				loge("Old crash log file exists, and yet could not delete it");
				//
			}
		}
		fmtlog::closeLogFile();
		std::filesystem::rename(logFileName, crashLogFileName);
		fmtlog::setLogFile(crashLogFileName);
		fmtlog::startPollingThread(1000);
	}
}
