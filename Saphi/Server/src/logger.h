//if you change this file, you should also change logger.h in the Saphi Client project

namespace Logger
{
	void PrintBanner();
	void Log(const char* const _Format, ...);
	void LogVerbose(const char* const _Format, ...);
}

#ifdef _DEBUG
#define LOGGING_VERBOSE //comment out to disable.
#endif