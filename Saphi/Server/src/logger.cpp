#include "logger.h"
#include "stdarg.h"
#include "stdio.h"
#ifndef LOGGER_GUARD
#define LOGGER_GUARD

namespace Logger
{
	void PrintBanner()
	{
		printf("   ___                         _       __ \n");
		printf("  F __\".   ___ _    _ ___     FJ___    LJ \n");
		printf(" J (___|  F __` L  J '__ J   J  __ `.     \n");
		printf(" J\\___ \\ | |--| |  | |--| |  | |--| |  FJ \n");
		printf(".--___) \\F L__J J  F L__J J  F L  J J J  L\n");
		printf("J\\______J\\____,__LJ  _____/LJ__L  J__LJ__L\n");
		printf(" J______FJ____,__F|_J_____F |__L  J__||__|\n");
		printf("                  L_J                     \n");
		printf("Saphi Server\nBuild %s (%s)\n\n", __DATE__, __TIME__);
	}

	void LogVerbose(const char* const _Format, ...)
	{
#if defined(_DEBUG) && defined(LOGGING_VERBOSE)
		va_list _ArgList;
		va_start(_ArgList, _Format);
		Log(_Format, _ArgList);
		va_end(_ArgList);
#endif
	}

	void Log(const char* const _Format, ...)
	{
#ifdef _DEBUG
		va_list _ArgList;
		va_start(_ArgList, _Format);
		vprintf(_Format, _ArgList);
		va_end(_ArgList);
#endif
	}
}
#endif //LOGGER_GUARD