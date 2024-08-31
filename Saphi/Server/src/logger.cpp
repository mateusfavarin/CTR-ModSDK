#include "logger.h"
#include "stdarg.h"
#include "stdio.h"
#ifndef LOGGER_GUARD
#define LOGGER_GUARD

void printBanner()
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

void log(const char* const _Format, ...)
{
	va_list _ArgList;
	va_start(_ArgList, _Format);
	vprintf(_Format, _ArgList);
	va_end(_ArgList);
}
#endif //LOGGER_GUARD