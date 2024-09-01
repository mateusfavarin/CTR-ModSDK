//if you change this file, you should also change logger.cpp in the Saphi Client project

#ifndef LOGGER_GUARD
#define LOGGER_GUARD

#include "logger.h"
#include "stdarg.h"
#include <iostream>
#include <syncstream>
#include <sstream>
#include <thread>
#include <chrono>
#include <string>
#include <mutex>

namespace Logger
{
	static void LogInternal(const char* const, va_list); //forward decl

	void PrintBanner()
	{
		Log("   ___                         _       __           ___   \n"
			"  F __\".   ___ _    _ ___     FJ___    LJ         ,\"___\". \n"
			" J (___|  F __` L  J '__ J   J  __ `.     ______  FJ---L] \n"
			" J\\___ \\ | |--| |  | |--| |  | |--| |  FJ|______|J |   LJ \n"
			".--___) \\F L__J J  F L__J J  F L  J J J  L______J| \\___--.\n"
			"J\\______J\\____,__LJ  _____/LJ__L  J__LJ__L       J\\_____/F\n"
			" J______FJ____,__F|_J_____F |__L  J__||__|        J_____F \n"
			"                  L_J                                     \n"
			"Saphi Client (Launcher)\nBuild %s (%s)\n\n", __DATE__, __TIME__);
	}

	void LogVerbose(const char* const _Format, ...)
	{
#if defined(LOGGING_VERBOSE)
		va_list _ArgList;
		va_start(_ArgList, _Format);
		LogInternal(_Format, _ArgList);
		va_end(_ArgList);
#endif
	}

	void Log(const char* const _Format, ...)
	{
		va_list _ArgList;
		va_start(_ArgList, _Format);
		LogInternal(_Format, _ArgList);
		va_end(_ArgList);
	}

	static void LogInternal(const char* const _Format, va_list valist)
	{ //optionally, also print to a text file.
		static std::stringstream sstream{};
		static std::mutex mutex{};
		static std::thread flush{ []()
		{
			while (true)
			{
				{
					std::lock_guard<std::mutex> lock{mutex};
					//write to all desired locations (e.g., stdout, a log file...)
					std::cout << sstream.str();
					//clear
					sstream.str(std::string{});
				} //unlock the lock, then wait one second
				std::this_thread::sleep_for(std::chrono::milliseconds(1000));
			}
		} };

		std::lock_guard<std::mutex> lock{ mutex };
		//the reason this is c-esq (ew) is because va_list leans into C.
		//to do CPP instead, we'd need to make a std::format wrapper,
		//which requires messing around with internal types (bad)
		int bufSize = vsnprintf(NULL, 0, _Format, valist) + 1; //room for nullterm
		char* buf = (char*)malloc(bufSize);
		if (buf != nullptr) //fixes warning
			buf[bufSize - 1] = '\0'; //nullterm
		vsnprintf(buf, bufSize, _Format, valist);
		sstream << buf;
		sstream.flush();
		free(buf);
	}
}
#endif //LOGGER_GUARD