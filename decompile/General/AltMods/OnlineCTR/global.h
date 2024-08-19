#ifndef ONLINE_GLOBAL_H
#define ONLINE_GLOBAL_H

#define OCTR_MENU_LEVEL 0x26

#define VERSION_GAME   1
#define VERSION_CLIENT 1
#define VERSION_SERVER 1
//#define ONLINE_BETA_MODE

#include <stdint.h>
#ifndef CLIENT_SERVER
	#include <common.h>
#endif

#define STATIC_ASSERT2 static_assert

//#define true				1
//#define false				0

#define DONT_SHOW_NAME		            0
#define SHOW_NAME			            1
#define DEFAULT_IP			            "127.0.0.1" // the default IP address we want to use for private lobbies
#define IP_ADDRESS_SIZE		            16 // assuming IPv4 (which is "xxx.xxx.xxx.xxx" + '\0')
#define PORT_SIZE			            6 // the port number as a string (0-65535 + '\0')

#define SERVER_NUM_ROOMS 16
 // 2 seconds to be very tolerant on client
#ifdef USE_60FPS
#define DISCONNECT_AT_UNSYNCED_FRAMES   120
#else
#define DISCONNECT_AT_UNSYNCED_FRAMES   60
#endif

enum ClientState
{
	DISCONNECTED = -1,
	LAUNCH_BOOT = 0,
	LAUNCH_PICK_SERVER,
	LAUNCH_PICK_ROOM,
	LAUNCH_ERROR,
	LOBBY_ASSIGN_ROLE,
	LOBBY_HOST_TRACK_PICK,
	LOBBY_GUEST_TRACK_WAIT,
	LOBBY_CHARACTER_PICK,
	LOBBY_WAIT_FOR_LOADING,
	LOBBY_LOADING,
	GAME_WAIT_FOR_RACE,
	GAME_RACE,
	GAME_END_RACE,
	NUM_STATES_FUNCS
};

#define NAME_LEN 9
#define MAX_NUM_PLAYERS 8

typedef struct RaceStats
{
	int32_t slot;
	int32_t finalTime;
	int32_t bestLap;
} RaceStats;

// This can be 0x400 (1024) bytes max:
// 0x8000C000 at 0x8000C400
struct OnlineCTR
{
	// 0x0
	int32_t CurrState;

	// 0x4
	int8_t PageNumber; // allow negative
	uint8_t CountPressX;
	uint8_t NumDrivers;
	uint8_t DriverID;

	// 0x8
	uint8_t boolSelectedLap;
	uint8_t boolSelectedLevel;
	uint8_t lapID;
	uint8_t levelID;

	// 0xC
	uint8_t IsBootedPS1;
	uint8_t boolSelectedCharacter;
	uint8_t numRooms;
	uint8_t numDriversEnded;

	// 0x10
	uint8_t serverId;
	uint8_t serverRoom;
	uint8_t hasConnectedServer;
	uint8_t hasSelectedServer;

	// 0x14
	uint8_t boolPlanetLEV;
	uint8_t boolClientBusy;
	uint8_t special;
	int8_t windowsClientSync;

	uint8_t roomClientCount[SERVER_NUM_ROOMS];
	uint8_t boolClientSelectedCharacters[MAX_NUM_PLAYERS];
	char nameBuffer[MAX_NUM_PLAYERS][NAME_LEN + 1]; //+1 for nullterm
	RaceStats raceStats[MAX_NUM_PLAYERS];
	int32_t ver_psx;
	int32_t ver_pc;
	int32_t ver_server;

	// slot[0] is for game to tell client to send
	// slot[1+] is for client to tell game to shoot
	struct
	{
		uint8_t boolJuiced;
		uint8_t Weapon;
		uint8_t flags;
		uint8_t boolNow;
	} Shoot[MAX_NUM_PLAYERS];

    // Frames that the client didn't update
    int32_t frames_unsynced;

    // Last windowsClientSync counter
	int8_t lastWindowsClientSync;
	int8_t desiredFPS;

#ifdef PINE_DEBUG
	int32_t stateChangeCounter;
#endif
};

STATIC_ASSERT2(sizeof(struct OnlineCTR) <= 0x400, "Size of OnlineCTR must be lte 1kb");

#define MAX_LAPS 7
#define CPS_PER_LAP 2

typedef struct TotalTime
{
	int32_t hours;
	int32_t minutes;
	int32_t seconds;
	int32_t miliseconds;
} TotalTime;

void ElapsedTimeToTotalTime(TotalTime * totalTime, int elapsedTime);

typedef struct CheckpointTracker
{
	int32_t timer;
	uint16_t currCheckpoint;
	uint8_t raceFinished;
	uint8_t drawFlags;
	char displayTime[10];
} CheckpointTracker;

extern CheckpointTracker checkpointTracker[MAX_NUM_PLAYERS];

void EndOfRace_Camera();
void EndOfRace_Icons();

#ifdef CLIENT_SERVER

enum ServerMessageType
{
	SG_ROOMS, // connection
	SG_NEWCLIENT, // assign to room
	SG_NAME, // lobby
	SG_TRACK,
	SG_CHARACTER,
	SG_STARTLOADING,
	SG_STARTRACE,
	SG_RACEDATA,
	SG_WEAPON,
	SG_ENDRACE,
	SG_SERVERCLOSED,
	SG_DISCONNECT,
	SG_COUNT,
	SG_EOF = 0xFF
};

// variety of opcodes (start load / start race)
struct SG_Header
{
	uint8_t type;
};

struct SG_MessageRooms
{
	uint8_t type;
	uint8_t numRooms;
	uint16_t version;
	uint8_t roomClientCount[SERVER_NUM_ROOMS];
};

// sent to each user when someone connects
struct SG_MessageClientStatus
{
	uint8_t type;
	uint8_t clientID;
	uint8_t numClientsTotal;
};

// get name from any client
struct SG_MessageName
{
	uint8_t type;
	uint8_t clientID;
	uint8_t numClientsTotal;
	char name[NAME_LEN + 1];
};

// get track, assigned by host
struct SG_MessageTrack
{
	uint8_t type;
	uint8_t trackID;
	uint8_t lapID;
};

// assign character,
struct SG_MessageCharacter
{
	uint8_t type;
	uint8_t clientID;
	uint8_t boolSelected;
	uint8_t characterID;
};

struct SG_MessageKart
{
	uint8_t type;

	// does not include fire level yet
	uint8_t wumpa		 : 3;
	uint8_t boolReserves : 1;
	uint8_t clientID     : 3;
	uint8_t padding      : 1;

	// bit-compressed driver->0x39A
	uint8_t kartRot1;
	uint8_t kartRot2;
	uint8_t buttonHold;

	int16_t posX;
	int16_t posY;
	int16_t posZ;
};

struct SG_MessageWeapon
{
	uint8_t type;
	uint8_t clientID; // driver who used weapon

	uint8_t weapon  : 4;
	uint8_t flags   : 2;
	uint8_t juiced  : 1;
	uint8_t padding : 1;
};

struct SG_MessageEndRace
{
	uint8_t type;
	uint8_t clientID;
	int32_t courseTime;
	int32_t lapTime;
};

struct SG_Message
{
	uint8_t type;
	union
	{
		struct SG_MessageRooms rooms;				// SG_ROOMS
		struct SG_MessageClientStatus clientStatus; // SG_NEWCLIENT
		struct SG_MessageName name;					// SG_NAME
		struct SG_MessageTrack track;				// SG_TRACK
		struct SG_MessageCharacter character;		// SG_CHARACTER
		struct SG_MessageKart kart;					// SG_RACEDATA
		struct SG_MessageWeapon weapon;				// SG_WEAPON
		struct SG_MessageEndRace endRace;			// SG_ENDRACE
	};
};

enum ClientMessageType
{
	CG_JOINROOM,
	CG_NAME,
	CG_TRACK,
	CG_CHARACTER,
	CG_STARTRACE,
	CG_KART,
	CG_WEAPON,
	CG_ENDRACE,
	CG_COUNT,
	CG_CONNECT = 0xFE,
	CG_NONE = 0xFF
};

// sent to each user when someone connects
struct CG_Header
{
	uint8_t type;
};

struct CG_MessageRoom
{
	uint8_t type;
	uint8_t room;
};

struct CG_MessageName
{
	uint8_t type;
	char name[NAME_LEN + 1];
};

// get track, assigned by host
struct CG_MessageTrack
{
	uint8_t type;
	uint8_t trackID;
	uint8_t lapID;
};

// character message
struct CG_MessageCharacter
{
	uint8_t type;
	uint8_t characterID;
	uint8_t boolSelected;
};

struct CG_MessageKart
{
	uint8_t type;

	// does not include fire level yet
	uint8_t wumpa		 : 3;
	uint8_t boolReserves : 1;
	uint8_t padding		 : 4;
	// bit-compressed driver->0x39A
	uint8_t kartRot1;
	uint8_t kartRot2;
	uint8_t buttonHold;
	int16_t posX;
	int16_t posY;
	int16_t posZ;
};

struct CG_MessageWeapon
{
	uint8_t type;

	// can be used for desired target
	uint8_t juiced  : 1;
	uint8_t flags   : 2;
	uint8_t weapon  : 4;
	uint8_t padding : 1;
};

struct CG_MessageEndRace
{
	uint8_t type;
	int32_t courseTime;
	int32_t lapTime;
};

struct CG_Message
{
	uint8_t type;
	uint8_t reliable;
	union
	{
		CG_MessageRoom room;		   // CG_JOINROOM
		CG_MessageName name;		   // CG_NAME
		CG_MessageTrack track;		   // CG_TRACK
		CG_MessageCharacter character; // CG_CHARACTER
		CG_MessageKart kart;		   // CG_KART
		CG_MessageWeapon weapon;	   // CG_WEAPON
		CG_MessageEndRace endRace;	   // CG_ENDRACE
		const char* hostName;		   // CG_CONNECT
	};
};

#define DRIVER_COURSE_OFFSET 0x514
#define DRIVER_BESTLAP_OFFSET 0x63c
#endif

#ifndef CLIENT_SERVER
	static struct OnlineCTR* octr = (struct OnlineCTR*)0x8000C000;

	// my functions
	void StatePS1_Launch_Boot();
	void StatePS1_Launch_PickServer();
	void StatePS1_Launch_PickRoom();
	void StatePS1_Launch_Error();
	void StatePS1_Lobby_AssignRole();
	void StatePS1_Lobby_HostTrackPick();
	void StatePS1_Lobby_GuestTrackWait();
	void StatePS1_Lobby_CharacterPick();
	void StatePS1_Lobby_WaitForLoading();
	void StatePS1_Lobby_Loading();
	void StatePS1_Game_WaitForRace();
	void StatePS1_Game_Race();
	void StatePS1_Game_EndRace();
#endif

#endif