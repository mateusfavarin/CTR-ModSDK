namespace Logger
{
	void PrintBanner();
	void Log(const char* const _Format, ...);
	void LogVerbose(const char* const _Format, ...);
}

#ifdef _DEBUG
#define LOGGING_VERBOSE //comment out to disable.
#endif