#pragma once

#include <string>

class Client
{
public:
	void Init();
	void Run();
	void CloseDuck();

private:
	template<typename T> inline T ReadRAMData(size_t addr);
	template<typename T> inline void WriteRAMData(const T& var, size_t addr);
	void SpawnDuck();
	void ResetState();

public:
	float m_fx = 1.0f;
	float m_music = 1.0f;
	float m_voice = 1.0f;
	bool m_stereo = true;
	bool m_vibration = false;
	bool m_active = false;
	bool m_reset = false;
	int m_duckPid = 0;
	void* m_duckHandle = nullptr;
	const void* m_duckRAM = nullptr;
	std::string m_duckCommand;
};

extern Client g_client;