void printBanner();
void log(const char* const _Format, ...);
void logVerbose(const char* const _Format, ...);

#ifdef _DEBUG
#define LOGGING_VERBOSE //comment out to disable.
#endif