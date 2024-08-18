#ifndef ONLINE_GLOBAL_H
#define ONLINE_GLOBAL_H

#define VERSION_GAME   1
#define VERSION_CLIENT 1
#define VERSION_SERVER 1
//#define ONLINE_BETA_MODE

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
	int slot;
	int finalTime;
	int bestLap;
} RaceStats;

// This can be 0x400 (1024) bytes max:
// 0x8000C000 at 0x8000C400
struct OnlineCTR
{
	// 0x0
	int CurrState;

	// 0x4
	char PageNumber; // allow negative
	unsigned char CountPressX;
	unsigned char NumDrivers;
	unsigned char DriverID;

	// 0x8
	unsigned char boolSelectedLap;
	unsigned char boolSelectedLevel;
	unsigned char lapID;
	unsigned char levelID;

	// 0xC
	unsigned char IsBootedPS1;
	unsigned char boolSelectedCharacter;
	unsigned char numRooms;
	unsigned char numDriversEnded;

	// 0x10
	unsigned char serverCountry;
	unsigned char serverRoom;
	unsigned char hasConnectedServer;
	unsigned char hasSelectedServer;

	// 0x14
	unsigned char boolPlanetLEV;
	unsigned char boolClientBusy;
	unsigned char special;
	char padding;

	// 0x18
	char roomClientCount[SERVER_NUM_ROOMS];

	// 0x28
	// determines if client and
	// emulator are still connected
	char windowsClientSync;

	// 0x30
	char boolClientSelectedCharacters[MAX_NUM_PLAYERS];

	// 0x38
	char nameBuffer[MAX_NUM_PLAYERS][NAME_LEN + 1]; //+1 for nullterm

	RaceStats raceStats[MAX_NUM_PLAYERS];

	int ver_psx;
	int ver_pc;
	int ver_server;

	// slot[0] is for game to tell client to send
	// slot[1+] is for client to tell game to shoot
	struct
	{
		unsigned char boolJuiced;
		unsigned char Weapon;
		unsigned char flags;
		unsigned char boolNow;
	} Shoot[MAX_NUM_PLAYERS];

    // Frames that the client didn't update
    int frames_unsynced;

    // Last windowsClientSync counter
	char lastWindowsClientSync;

	char desiredFPS;

#ifdef PINE_DEBUG
	int stateChangeCounter;
#endif
};

STATIC_ASSERT2(sizeof(struct OnlineCTR) <= 0x400, "Size of OnlineCTR must be lte 1kb");

#define MAX_LAPS 7
#define CPS_PER_LAP 2

typedef struct TotalTime
{
	int hours;
	int minutes;
	int seconds;
	int miliseconds;
} TotalTime;

void ElapsedTimeToTotalTime(TotalTime * totalTime, int elapsedTime);

typedef struct CheckpointTracker
{
	int timer;
	unsigned short currCheckpoint;
	unsigned char raceFinished;
	unsigned char drawFlags;
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
	// 15 types, 15 bytes max
	unsigned char type : 4;

	// Left over from TCP prototype, not needed anymore.
	// In new UDP system, some packets have recycled this
	unsigned char padding : 4;
};

struct SG_MessageRooms
{
	// 15 types, 15 bytes max
	unsigned char type : 4;
	unsigned char padding : 4;
	unsigned char numRooms;
	unsigned short version;
	unsigned char roomClientCount[SERVER_NUM_ROOMS];
};

// sent to each user when someone connects
struct SG_MessageClientStatus
{
	// 15 types, 15 bytes max
	unsigned char type : 4;

	// 1-15 for client
	unsigned char clientID : 4;

	// 1-15
	unsigned char numClientsTotal : 4;

	// special event
	unsigned char special : 4;
};

// get name from any client
struct SG_MessageName
{
	// 15 types, 15 bytes max
	unsigned char type : 4;
	unsigned char padding : 4;

	// index 0 - 7
	unsigned char clientID : 4;
	unsigned char numClientsTotal : 4;

	char name[NAME_LEN + 1];
};

// get track, assigned by host
struct SG_MessageTrack
{
	// 15 types, 15 bytes max
	unsigned char type : 4;
	unsigned char padding : 4;

	unsigned char trackID : 5;
	unsigned char lapID : 3;
};

// assign character,
struct SG_MessageCharacter
{
	// 15 types, 15 bytes max
	unsigned char type : 4;

	// index 0 - 7
	// boolSelected 0/1
	// character 0 - 15
	unsigned char clientID : 3;
	unsigned char boolSelected : 1;
	unsigned char characterID : 4;

	// can be used for Engine type, or more characters
	unsigned char padding : 4;
};

struct SG_MessageKart
{
	// byte[0]

	// 15 types, 15 bytes max
	unsigned char type : 4;

	// does not include fire level yet
	unsigned char wumpa : 3;
	unsigned char boolReserves : 1;

	// byte[1-2]

	unsigned char clientID : 3;

	// bit-compressed driver->0x39A
	unsigned char kartRot1 : 5;
	unsigned char kartRot2;

	// byte[3]

	unsigned char buttonHold;

	// byte[4-12]

	short posX;
	short posY;
	short posZ;

	// 10 bytes
};

struct SG_MessageWeapon
{
	// 15 types, 15 bytes max
	unsigned char type : 4;

	// driver who used weapon
	unsigned char clientID : 3;
	unsigned char juiced : 1;

	// 0-15
	unsigned char weapon : 4;
	unsigned char flags : 2;
	unsigned char padding : 2;
};

struct SG_MessageEndRace
{
	// 15 types, 15 bytes max
	unsigned char type : 4;
	unsigned char clientID : 4;
	int courseTime;
	int lapTime;
};

struct SG_Message
{
	unsigned char type;
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

	// lobby
	CG_NAME,
	CG_TRACK,
	CG_CHARACTER,

	CG_STARTRACE,
	CG_RACEDATA,
	CG_WEAPON,
	CG_ENDRACE,

	CG_COUNT
};

// sent to each user when someone connects
struct CG_Header
{
	// 15 types, 15 bytes max
	unsigned char type : 4;

	// Left over from TCP prototype, not needed anymore.
	// In new UDP system, some packets have recycled this
	unsigned char padding : 4;
};

struct CG_MessageRoom
{
	// 15 types, 15 bytes max
	unsigned char type : 4;
	unsigned char padding : 4;

	unsigned char room;
};

struct CG_MessageName
{
	// 15 types, 15 bytes max
	unsigned char type : 4;
	unsigned char padding : 4;

	char name[NAME_LEN + 1];
};

// get track, assigned by host
struct CG_MessageTrack
{
	// 15 types, 15 bytes max
	unsigned char type : 4;
	unsigned char padding : 4;

	unsigned char trackID : 5;
	unsigned char lapID : 3;
};

// character message
struct CG_MessageCharacter
{
	// 15 types, 15 bytes max
	unsigned char type : 4;

	// character 0 - 15
	// Selected 0/1
	unsigned char characterID : 4;
	unsigned char boolSelected : 1;

	// can be used for Engine type, or more characters
	unsigned char padding : 7;
};

struct CG_EverythingKart
{
	// byte[0]

	// 15 types, 15 bytes max
	unsigned char type : 4;

	// does not include fire level yet
	unsigned char wumpa : 3;
	unsigned char boolReserves : 1;

	// bit-compressed driver->0x39A
	unsigned char kartRot1;
	unsigned char kartRot2;

	// byte[3]

	unsigned char buttonHold;

	// byte[4-12]

	short posX;
	short posY;
	short posZ;

	// 10 bytes
};

struct CG_MessageWeapon
{
	// 15 types, 15 bytes max
	unsigned char type : 4;

	// can be used for desired target
	unsigned char juiced : 1;
	unsigned char padding : 1;
	unsigned char flags : 2;

	// 0-15
	unsigned char weapon : 4;

	unsigned char padding2 : 4;
};

struct CG_MessageEndRace
{
	// 15 types, 15 bytes max
	unsigned char type : 4;
	unsigned char padding : 4;
	int courseTime;
	int lapTime;
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