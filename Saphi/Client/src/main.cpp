#include "app.h"

#ifdef _WIN32
#include <Windows.h>
#endif

int main(int argc, char* argv[])
{
#if defined(_WIN32)
	HWND window = GetConsoleWindow();
	//gotta do this nonsense, because if we use the window fetched above
	//for ShowWindow(SW_HIDE), it just minimizes it instead of hides it.
	SetForegroundWindow(window);
	window = GetForegroundWindow();
	//actually hide the window.
#if defined(_DEBUG)
	ShowWindow(window, SW_SHOW); //show on debug builds
#else
	ShowWindow(window, SW_HIDE); //hide on release builds
#endif
#elif defined(__linux__)
	//TODO: hide console window on linux.
#endif
  App app;
  app.Init();
#ifdef _DEBUG
  app.Run();
#else
  try { app.Run(); }
  catch (...) {}
#endif
  app.Close();
  return 0;
}
