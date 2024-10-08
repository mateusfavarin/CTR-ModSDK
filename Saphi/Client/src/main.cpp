#include "app.h"
#include "logger.h"

#ifdef _WIN32
#include <Windows.h>
#endif

int main(int argc, char* argv[])
{
	Logger::LogInit();
#if !defined(_DEBUG) //release
  //only hide the console window on release builds.
	#if defined(_WIN32)
		HWND window = GetConsoleWindow();
		//gotta do this nonsense, because if we use the window fetched above
		//for ShowWindow(SW_HIDE), it just minimizes it instead of hides it.
		SetForegroundWindow(window);
		window = GetForegroundWindow();
		//actually hide the window.
		ShowWindow(window, SW_HIDE);
	#elif defined(__linux__)
		//TODO: hide console window on linux.
	#endif
#else
  //debug
#endif

  App app;
  app.Init();
#ifdef _DEBUG
  app.Run();
#else
  try { app.Run(); }
	catch (...) { Logger::RenameLogAsCrash(); }
#endif
  app.Close();
  return 0;
}
