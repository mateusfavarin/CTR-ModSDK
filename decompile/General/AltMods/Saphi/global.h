#ifndef SAPHI_GLOBAL_H
#define SAPHI_GLOBAL_H

#define OCTR_MENU_LEVEL 0x26 /*INTRO_OXIDE*/

#define VERSION_GAME   1
#define VERSION_CLIENT 1
#define VERSION_SERVER 1
//#define ONLINE_BETA_MODE

#include <stdint.h>
#ifndef CLIENT_SERVER
	#include <common.h>
#endif

#define STATIC_ASSERT2 static_assert

#define ELEMENTS_PER_PAGE 8 // any menu item
#define NUM_TRACK_PAGES 3
#define NUM_CHARACTER_PAGES 2

#define NUM_SERVERS 2
#define NUM_SERVER_PAGES 3
#define ROOMS_PER_PAGE ELEMENTS_PER_PAGE
#define SERVER_NUM_ROOMS (NUM_SERVER_PAGES * ROOMS_PER_PAGE)
#define SERVER_NULL_ROOM 255
#define ROOM_MAX_NUM_PLAYERS 8

#ifdef USE_60FPS
#define DISCONNECT_AT_UNSYNCED_FRAMES   120
#else
#define DISCONNECT_AT_UNSYNCED_FRAMES   60
#endif

#define NAME_LEN 9
#define ID_WAIT_ASSIGNMENT 0xFF
#define ID_HOST 0

#define MAX_LAPS 7
#define CPS_PER_LAP 2

typedef uint32_t psxptr_t;

enum ClientState
{
	DISCONNECTED = -1,
	LAUNCH_BOOT = 0,
	LAUNCH_PICK_SERVER,
	LAUNCH_WAIT_SERVER,
	LAUNCH_PICK_ROOM,
	LAUNCH_ERROR,
	LOBBY_ASSIGN_ROLE,
	LOBBY_HOST_MODIFIERS_PICK,
	LOBBY_HOST_TRACK_PICK,
	LOBBY_GUEST_TRACK_WAIT,
	LOBBY_CHARACTER_PICK,
	LOBBY_WAIT_FOR_LOADING,
	LOBBY_LOADING,
	GAME_WAIT_FOR_RACE,
	GAME_RACE,
	GAME_END_RACE,
	GAME_SPECTATE,
	NUM_STATES_FUNCS
};

enum EngineTypes
{
	VANILLA = 0,
	BALANCED,
	SPEED,
	TURN,
	ACCEL
};

//NOTICE: currently "MODIFIER_MIRROR"'s functionality is enabled, but this is a substantial byte budget hit.
//to disable it, comment the '#include "Saphi/zMirrorMode.c"' at the top of Mods1.c, and comment the
//"&& 0" from the "#if defined(USE_SAPHI) && 0" at the bottom of MainFrame_RenderFrame.c

/* Bit flags */
enum OnlineGameModifiers
{
	MODIFIER_NONE        = 0,
	MODIFIER_ITEMS       = (1 << 0), //items are enabled
	MODIFIER_ICY         = (1 << 1), //all terrain is considered ice
	MODIFIER_STP         = (1 << 2), //all turbo pads are stp
	MODIFIER_MIRROR      = (1 << 3), //gameplay & visuals is mirrored horizontally (every left turn is now a right turn & vice versa)
	MODIFIER_RETROFUELED = (1 << 4), //does not include STP by default
	MODIFIER_DEMOCAM     = (1 << 5), //camera system is the same as the demo system
	MODIFIER_CATCHUP     = (1 << 6), //wumpa and/or boost is more effective in last place vs first
	//MODIFIER_PRIVATE     = (1 << 7), //private room w/ passcode
};

enum OnlineGameModeList
{
	ONLINE_MODE_ITEMS = 0,
	ONLINE_MODE_ITEMLESS = 1,
	ONLINE_MODE_MASHUP = 2,
};

enum MenuState
{
	MENUSTATE_NONE              = 0, //nothing substantial happened this frame.
	MENUSTATE_PRESSED_CROSS     = (1 << 0),
	MENUSTATE_PRESSED_TRIANGLE  = (1 << 1),
};

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
	int32_t ver_psx;
	int32_t ver_pc;
	int32_t ver_server;
	int32_t CurrState; //offsetof = 12
	uint8_t CountPressX;
	uint8_t NumDrivers;
	uint8_t DriverID;
	uint8_t boolSelectedLap;
	uint8_t boolSelectedLevel;
	uint8_t levelID;
	uint8_t IsBootedPS1;
	uint8_t bootedSaphi;
	uint8_t boolSelectedCharacter;
	uint8_t numRooms;
	uint8_t numDriversEnded;
	uint8_t serverId;
	uint8_t serverRoom;
	uint8_t boolJoiningServer;
	uint8_t boolSelectedRoom;
	uint8_t boolPlanetLEV;
	uint32_t onlineGameModifiers; //offsetof = 32
	uint8_t boolSelectedModifiers;
	uint8_t windowsClientSync;
	uint8_t lastWindowsClientSync;
	uint8_t desiredFPS;
	uint8_t raceOver;
	uint16_t lapCount;
	uint16_t dnfTimer;
	int32_t frames_unsynced;

	uint8_t roomClientCount[SERVER_NUM_ROOMS];
	uint8_t roomLocked[SERVER_NUM_ROOMS];
	uint8_t boolClientSelectedCharacters[ROOM_MAX_NUM_PLAYERS];
	uint8_t perPlayerEngineType[ROOM_MAX_NUM_PLAYERS];
	char nameBuffer[ROOM_MAX_NUM_PLAYERS][NAME_LEN + 1]; //+1 for nullterm
	RaceStats raceStats[ROOM_MAX_NUM_PLAYERS];

	// slot[0] is for game to tell client to send
	// slot[1+] is for client to tell game to shoot
	struct
	{
		uint8_t boolJuiced;
		uint8_t Weapon;
		uint8_t flags;
		uint8_t boolNow;
	} Shoot[ROOM_MAX_NUM_PLAYERS];
};

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

extern CheckpointTracker checkpointTracker[ROOM_MAX_NUM_PLAYERS];

void EndOfRace_Camera();
void EndOfRace_Icons();

#ifdef CLIENT_SERVER

//SG_ packets = servers send to clients

enum ServerMessageType
{
	SG_ROOMS, // connection
	SG_NEWCLIENT, // assign to room
	SG_UPDATEID,
	SG_NAME, // lobby
	SG_MODIFIERS,
	SG_TRACK,
	SG_CHARACTER,
	SG_STARTLOADING,
	SG_STARTRACE,
	SG_KART,
	SG_WEAPON,
	SG_DNFTIMER,
	SG_ENDRACE,
	SG_DISCONNECT,
	SG_FORCEENDRACE,
	SG_RACEOVER,
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
	uint8_t roomLocked[SERVER_NUM_ROOMS];
};

// sent to each user when someone connects
struct SG_MessageNewClient
{
	uint8_t type;
	uint8_t clientID;
	uint8_t numClientsTotal;
	uint8_t trackSelected;
	uint8_t trackId;
	uint16_t lapCount;
	uint32_t onlineGameModifiers;
};

struct SG_MessageClientID
{
	uint8_t type;
	uint8_t newID;
};

// get name from any client
struct SG_MessageName
{
	uint8_t type;
	uint8_t clientID;
	uint8_t numClientsTotal;
	char name[NAME_LEN + 1];
};

struct SG_MessageModifiers
{
	uint8_t type;
	uint32_t onlineGameModifiers;
};

// get track, assigned by host
struct SG_MessageTrack
{
	uint8_t type;
	uint8_t trackID;
	uint16_t lapCount;
};

// assign character,
struct SG_MessageCharacter
{
	uint8_t type;
	uint8_t clientID;
	uint8_t characterID;
	uint8_t engineType;
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
	uint16_t angle;
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

struct SG_MessageDNFTimer
{
	uint8_t type;
	uint16_t timer;
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
		struct SG_MessageNewClient clientStatus;	// SG_NEWCLIENT
		struct SG_MessageClientID id;				// SG_UPDATEID
		struct SG_MessageName name;					// SG_NAME
		struct SG_MessageModifiers modifiers;       // SG_MODIFIERS
		struct SG_MessageTrack track;				// SG_TRACK
		struct SG_MessageCharacter character;		// SG_CHARACTER
		struct SG_MessageKart kart;					// SG_KART
		struct SG_MessageWeapon weapon;				// SG_WEAPON
		struct SG_MessageDNFTimer dnf;				// SG_DNFTIMER
		struct SG_MessageEndRace endRace;			// SG_ENDRACE
	};
};

//CG_ packets = clients send to servers

enum ClientMessageType
{
	CG_JOINROOM,
	CG_MODIFIERS,
	CG_NAME,
	CG_TRACK,
	CG_CHARACTER,
	CG_STARTRACE,
	CG_KART,
	CG_WEAPON,
	CG_ENDRACE,
	CG_COUNT,
	CG_DISCONNECT = 253,
	CG_CONNECT = 254,
	CG_NONE = 255
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

struct CG_MessageModifiers
{
	uint8_t type;
	uint32_t onlineGameModifiers;
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
	uint16_t lapCount;
};

// character message
struct CG_MessageCharacter
{
	uint8_t type;
	uint8_t characterID;
	uint8_t engineType;
};

struct CG_MessageKart
{
	uint8_t type;

	// does not include fire level yet
	uint8_t wumpa		 : 4;
	uint8_t boolReserves : 1;
	uint8_t padding		 : 3;
	uint16_t angle;
	uint8_t buttonsHeld;
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

struct ServerInfo
{
	const char* hostName;
	uint16_t port;
};

struct CG_Message
{
	uint8_t type;
	uint8_t reliable;
	void* peer;
	union
	{
		struct CG_MessageRoom room;		          // CG_JOINROOM
		struct CG_MessageModifiers modifiers;     // CG_MODIFIERS
		struct CG_MessageName name;		          // CG_NAME
		struct CG_MessageTrack track;		      // CG_TRACK
		struct CG_MessageCharacter character;     // CG_CHARACTER
		struct CG_MessageKart kart;		          // CG_KART
		struct CG_MessageWeapon weapon;	          // CG_WEAPON
		struct CG_MessageEndRace endRace;	      // CG_ENDRACE
		ServerInfo server;			              // CG_CONNECT
	};
};

#endif

#ifndef CLIENT_SERVER
	static struct OnlineCTR* octr = (struct OnlineCTR*)0x8000C000;

	// my functions
	void StatePS1_Launch_Boot();
	void StatePS1_Launch_PickServer();
	void StatePS1_Launch_WaitServer();
	void StatePS1_Launch_PickRoom();
	void StatePS1_Launch_Error();
	void StatePS1_Lobby_AssignRole();
	void StatePS1_Lobby_HostModifiersPick();
	void StatePS1_Lobby_HostTrackPick();
	void StatePS1_Lobby_GuestTrackWait();
	void StatePS1_Lobby_CharacterPick();
	void StatePS1_Lobby_WaitForLoading();
	void StatePS1_Lobby_Loading();
	void StatePS1_Game_WaitForRace();
	void StatePS1_Game_Race();
	void StatePS1_Game_Spectate();
	void StatePS1_Game_EndRace();
#endif

#endif