#pragma once

#include <enet/enet.h>
#include <OnlineCTR/global.h>
#include <string>
#include <unordered_map>
#include <functional>

static constexpr size_t ADDR_OCTR = 0x8000C000;
static constexpr size_t ADDR_gGT = 0x80096b20;

class Client
{
public:
	void Init();
	void Run();
	void Close();

private:
	template<typename T> inline T& GetRAMData(size_t addr);
	void SpawnDuck();
	void CloseDuck();
	void State_Launch_Boot(OnlineCTR& octr);
	void State_Launch_PickServer(OnlineCTR& octr);
	void State_Launch_PickRoom(OnlineCTR& octr);
	void State_Launch_Error(OnlineCTR& octr);
	void State_Lobby_AssignRole(OnlineCTR& octr);
	void State_Lobby_HostTrackPick(OnlineCTR& octr);
	void State_Lobby_GuestTrackWait(OnlineCTR& octr);
	void State_Lobby_CharacterPick(OnlineCTR& octr);
	void State_Lobby_WaitForLoading(OnlineCTR& octr);
	void State_Lobby_Loading(OnlineCTR& octr);
	void State_Game_WaitForRace(OnlineCTR& octr);
	void State_Game_Race(OnlineCTR& octr);
	void State_Game_EndRace(OnlineCTR& octr);

public:
	float m_fx = 1.0f;
	float m_music = 1.0f;
	float m_voice = 1.0f;
	bool m_stereo = true;
	bool m_vibration = false;
	bool m_reset = false;
	std::string m_duckCommand;

private:
	bool m_active = false;
	bool m_getDuckRAM = false;
	int m_duckPid = 0;
	void* m_duckHandle = nullptr;
	uint8_t* m_duckRAM = nullptr;
	std::unordered_map<ClientState, std::function<void(OnlineCTR&)>> m_funcs = {
		{ ClientState::LAUNCH_BOOT, std::bind(&Client::State_Launch_Boot, this, std::placeholders::_1) },
		{ ClientState::LAUNCH_PICK_SERVER, std::bind(&Client::State_Launch_PickServer, this, std::placeholders::_1) },
		{ ClientState::LAUNCH_PICK_ROOM, std::bind(&Client::State_Launch_PickRoom, this, std::placeholders::_1) },
		{ ClientState::LAUNCH_ERROR, std::bind(&Client::State_Launch_Error, this, std::placeholders::_1) },
		{ ClientState::LOBBY_ASSIGN_ROLE, std::bind(&Client::State_Lobby_AssignRole, this, std::placeholders::_1) },
		{ ClientState::LOBBY_HOST_TRACK_PICK, std::bind(&Client::State_Lobby_HostTrackPick, this, std::placeholders::_1) },
		{ ClientState::LOBBY_GUEST_TRACK_WAIT, std::bind(&Client::State_Lobby_GuestTrackWait, this, std::placeholders::_1) },
		{ ClientState::LOBBY_CHARACTER_PICK, std::bind(&Client::State_Lobby_CharacterPick, this, std::placeholders::_1) },
		{ ClientState::LOBBY_WAIT_FOR_LOADING, std::bind(&Client::State_Lobby_WaitForLoading, this, std::placeholders::_1) },
		{ ClientState::LOBBY_LOADING, std::bind(&Client::State_Lobby_Loading, this, std::placeholders::_1) },
		{ ClientState::GAME_WAIT_FOR_RACE, std::bind(&Client::State_Game_WaitForRace, this, std::placeholders::_1) },
		{ ClientState::GAME_RACE, std::bind(&Client::State_Game_Race, this, std::placeholders::_1) },
		{ ClientState::GAME_END_RACE, std::bind(&Client::State_Game_EndRace, this, std::placeholders::_1) },
	};

	/* Game variables */
	int32_t m_currGameTimer = 0;
};

extern Client g_client;