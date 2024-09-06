#include <common.h>
#include "global.h"

extern struct RectMenu menu;

void StatePS1_Launch_Boot()
{
	static const char s_errBoot[] = "Error: failed booting Saphi";
	static const char s_errServer[] = "Error: failed connecting to the server";
	const char* msg = octr->bootedSaphi ? s_errServer : s_errBoot;
	DECOMP_DecalFont_DrawLine(msg, 0x100, 0xA8, FONT_SMALL, JUSTIFY_CENTER | ORANGE);
}

extern char* countryNames[ELEMENTS_PER_PAGE];
bool initString = true;
char* s_onlineGameModes[NUM_SERVER_PAGES] = {
	"Items",
	"Itemless",
	"Icy/STP"
};
void StatePS1_Launch_PickServer()
{
	if (initString)
	{
		strcpy(sdata->lngStrings[0x4e], "Saphi");
		initString = false;
	}
	MenuWrites_serverId();

	// If already picked
	if(MenuFinished() == 1) { initString = true; return; }

	UpdateMenu();
	NewPage_serverId();
}

void StatePS1_Launch_WaitServer()
{
	sdata->ptrActiveMenu = 0;
	DECOMP_DecalFont_DrawLine("Trying to connect to the server...", 0x100, 0xA8, FONT_SMALL, JUSTIFY_CENTER | ORANGE);
}

void ResetPsxGlobals()
{
	// unlock everything (0,1,2,3,4,5)
	for(int i = 0; i < 6; i++)
		sdata->advProgress.rewards[i] = 0xffffffff;

	// 8mb RAM expansion, for emulators that support it.
	// Needed for 3 or more players on Adv Hub
	sdata->mempack[0].lastFreeByte = 0x807ff800;
	sdata->mempack[0].endOfAllocator = 0x807ff800;

	sdata->ptrActiveMenu = 0;

	// keep running till the client gets a result,
	// DriverID is set to -1 on windows-side before this.

	for(int i = 0; i < ROOM_MAX_NUM_PLAYERS; i++)
	{
		data.characterIDs[i] = 0;
		octr->boolClientSelectedCharacters[i] = 0;
	}
}

// should rename to EnterRoom
void StatePS1_Launch_PickRoom()
{
	MenuWrites_ServerRoom();

	static int currGamemodePage = -1;

	// If already picked
	if(MenuFinished() == 1)
	{
		switch (currGamemodePage)
		{
			case ONLINE_MODE_ITEMS:
				octr->onlineGameModifiers = MODIFIER_ITEMS;
				break;
			case ONLINE_MODE_ITEMLESS:
				octr->onlineGameModifiers = MODIFIER_NONE;
				break;
			case ONLINE_MODE_ICY_STP:
				octr->onlineGameModifiers = MODIFIER_ICY | MODIFIER_STP;
				break;
		}
		currGamemodePage = -1;
		ResetPsxGlobals();
		return;
	}

	if (octr->PageNumber != currGamemodePage)
	{
		currGamemodePage = octr->PageNumber;
		strcpy(sdata->lngStrings[0x4e], s_onlineGameModes[octr->PageNumber]);
	}

	UpdateMenu();
	NewPage_ServerRoom();

	int serverTotal = 0;
	for(int i = 0; i < SERVER_NUM_ROOMS; i++) { serverTotal += octr->roomClientCount[i]; }

	char* text = "Server Total: 000";
	text[14] = '0' + ((serverTotal / 100) % 10);
	text[15] = '0' + ((serverTotal / 10) % 10);
	text[16] = '0' + (serverTotal % 10);

	DECOMP_DecalFont_DrawLine(text, menu.posX_curr, 0xb8, FONT_SMALL,JUSTIFY_CENTER|PAPU_YELLOW);
}

void StatePS1_Launch_Error()
{
	int expectedVer = max(max(octr->ver_psx, octr->ver_pc), octr->ver_server);
	if (octr->ver_psx < expectedVer) { DECOMP_DecalFont_DrawLine("Please update your game.", 0x100, 0x98-2, FONT_SMALL, JUSTIFY_CENTER); }
	if (octr->ver_pc < expectedVer) { DECOMP_DecalFont_DrawLine("Please update your launcher.", 0x100, 0xA0-2, FONT_SMALL, JUSTIFY_CENTER); }
	if (octr->ver_server < expectedVer) { DECOMP_DecalFont_DrawLine("Server unavailable.", 0x100, 0xA8-2, FONT_SMALL, JUSTIFY_CENTER); }
	sdata->ptrActiveMenu = 0;
}

void StatePS1_Lobby_AssignRole()
{
}

void StatePS1_Lobby_HostTrackPick()
{
	MenuWrites_Tracks();

	// If already picked
	if(MenuFinished() == 1)
	{
		// do this without adding to enum,
		// cause that means changing PS1/PC
		void FakeState_Lobby_HostLapPick();
		FakeState_Lobby_HostLapPick();
		return;
	}

	PrintCharacterStats();

	UpdateMenu();
	NewPage_Tracks();
}

unsigned char lapID;
unsigned char boolSelectedLap = 0;
void FakeState_Lobby_HostLapPick()
{
	MenuWrites_Laps();

	// If already picked
	if(MenuFinished() == 1)
	{
		octr->lapCount = lapID * 2 + 1;
		octr->boolSelectedLap = 1;
		boolSelectedLap = 0;
		return;
	}

	PrintCharacterStats();

	UpdateMenu();
	NewPage_Laps();
}

void StatePS1_Lobby_GuestTrackWait()
{
	PrintCharacterStats();

	// close menu
	sdata->ptrActiveMenu = 0;

	DECOMP_DecalFont_DrawLine(
		"waiting for host",
		menu.posX_curr,0xA8,FONT_SMALL,JUSTIFY_CENTER|ORANGE);

	DECOMP_DecalFont_DrawLine(
		"to pick the track",
		menu.posX_curr,0xB0,FONT_SMALL,JUSTIFY_CENTER|ORANGE);
}

void StatePS1_Lobby_CharacterPick()
{
	MenuWrites_Characters();

	// If already picked
	if(MenuFinished() == 1) return;

	PrintCharacterStats();
	PrintRecvTrack();

	UpdateMenu();
	NewPage_Characters();

	// get menu
	struct RectMenu* b = sdata->ptrActiveMenu;

	if(b != 0)
	{
		// update real-time
		data.characterIDs[0] = (ELEMENTS_PER_PAGE * octr->PageNumber) + b->rowSelected;
	}
}

void StatePS1_Lobby_WaitForLoading()
{
	PrintCharacterStats();
	PrintRecvTrack();

	// waiting for all charactesr
	DECOMP_DecalFont_DrawLine(
		"Hope you win!",
		menu.posX_curr,menu.posY_curr,
		FONT_SMALL,JUSTIFY_CENTER|ORANGE);
}

static bool initRace = true;
static bool endRace = true;

void StatePS1_Lobby_Loading()
{
	initRace = true;
	endRace = true;
	PrintCharacterStats();
	PrintRecvTrack();

	DECOMP_DecalFont_DrawLine(
		"LOADING...",
		menu.posX_curr,menu.posY_curr,
		FONT_SMALL,JUSTIFY_CENTER|ORANGE);

	// variable reuse, wait a few frames,
	// so screen updates with green names
	octr->CountPressX++;
	if(octr->CountPressX < FPS_DOUBLE(15)) return;

	// stop music,
	// stop "most FX", let menu FX ring
	Music_Stop();
	DECOMP_howl_StopAudio(1,1,0);
	sdata->unkAudioState = 0;

	struct GameTracker* gGT = sdata->gGT;

	// for battle tracks
	gGT->gameMode1 = LOADING | BATTLE_MODE;

	if(
		(octr->levelID <= TURBO_TRACK) ||
		(octr->levelID >= GEM_STONE_VALLEY)
	  )
	{
		// for all other tracks
		gGT->gameMode1 = LOADING | ARCADE_MODE;
	}

	// instant load
	//sdata->Loading.stage = 0;

	// load with flag animation
	DECOMP_MainRaceTrack_RequestLoad(octr->levelID);

	// dont kill thread,
	// it will die when loading screen covers screen
}

RECT drawTimeRECT =
{
	.x = 0xffec,
	.y = 0x46 - 3,
	.w = 0x228,
	.h = 0
};

static void Ghostify()
{
	struct Turbo *turboObj;
	struct Thread *fireThread;
	struct GameTracker *gGT = sdata->gGT;
	struct Icon **ptrIconArray;
	struct Instance *inst;

	if (octr->onlineGameModifiers & MODIFIER_ITEMS) { return; }

	for (int driverID = 1; driverID < ROOM_MAX_NUM_PLAYERS; driverID++)
	{
		gGT->drivers[driverID]->wheelSprites = ICONGROUP_GETICONS(gGT->iconGroup[0xC]);
		inst = gGT->drivers[driverID]->instSelf;
		if (!inst) { continue; }
		inst->flags |= 0x60000;
		inst->alphaScale = 0xA00;
	}
}

extern unsigned int checkpointTimes[(MAX_LAPS * CPS_PER_LAP) + 1];

static void OnRaceInit()
{
	for (int i = 0; i < ROOM_MAX_NUM_PLAYERS; i++)
	{
		checkpointTracker[i].currCheckpoint = 0;
		checkpointTracker[i].timer = 0;
		checkpointTracker[i].raceFinished = 0;
	}
	for (int i = 0; i < MAX_LAPS * CPS_PER_LAP; i++)
	{
		checkpointTimes[i] = 0;
	}
	sdata->gGT->drivers[0]->bestLapTime = HOURS(10);
}

void StatePS1_Game_WaitForRace()
{
	struct GameTracker* gGT = sdata->gGT;
	if (initRace)
	{
		OnRaceInit();
		initRace = false;
	}

	gGT->trafficLightsTimer = 0xf40;
	Ghostify();

	if((gGT->gameMode1 & START_OF_RACE) != 0)
		return;

	// Copy from DrawUnpluggedMsg
	int posY;
	int i;

	posY = 0x46;
	drawTimeRECT.h = 0;

	DECOMP_DecalFont_DrawLine(
		"WAITING FOR PLAYERS...",
		0x100, posY + drawTimeRECT.h,
		FONT_SMALL, (JUSTIFY_CENTER | ORANGE));

	// add for each line
	drawTimeRECT.h += 8;

	// add 3 pixels above, 3 pixels bellow
	drawTimeRECT.h += 6;

	DECOMP_RECTMENU_DrawInnerRect(
		&drawTimeRECT, 1, gGT->backBuffer->otMem.startPlusFour);

	for(i = 0; i < 8; i++)
	{
		octr->Shoot[i].boolNow = 0;
	}
}

// not really "Start", it's the trafficLights,
// and entire duration of race, should rename
void StatePS1_Game_Race()
{
	int i;
	static unsigned msCount = 0;
	static unsigned frameCounter = 0;

	Ghostify();

	for(i = 1; i < ROOM_MAX_NUM_PLAYERS; i++)
	{
		if(octr->Shoot[i].boolNow != 0)
		{
			int weapon;
			struct Driver* d = sdata->gGT->drivers[i];
			octr->Shoot[i].boolNow = 0;
			if(octr->Shoot[i].boolJuiced) { d->numWumpas = 10; }

			d->heldItemID = octr->Shoot[i].Weapon;
			weapon = d->heldItemID;

			// Missiles and Bombs share code,
			// Change Bomb1x, Bomb3x, Missile3x, to Missile1x
			if ((weapon == 1) || (weapon == 10) || (weapon == 11)) { weapon = 2; }
			DECOMP_VehPickupItem_ShootNow(d, weapon, octr->Shoot[i].flags);
		}
	}

	if (octr->dnfTimer > 0)
	{
		msCount += sdata->gGT->elapsedTimeMS;
		if (msCount >= SECONDS(1))
		{
			msCount -= SECONDS(1);
			octr->dnfTimer--;
		}

		char s_dnfNumber[10];
		char s_dnf[] = "DNF";
		int color = RED;
		if (octr->dnfTimer < 6) { color = frameCounter++ & FPS_DOUBLE(1) ? RED : WHITE; }
		sprintf(s_dnfNumber, "%u", octr->dnfTimer);
		DECOMP_DecalFont_DrawLine(s_dnfNumber, 192, 10, FONT_BIG, JUSTIFY_CENTER | color);
		DECOMP_DecalFont_DrawLine(s_dnf, 192, 10 + data.font_charPixHeight[FONT_BIG], FONT_SMALL, JUSTIFY_CENTER | color);
	}
	else { msCount = 0; }
}

void StatePS1_Game_EndRace()
{

}

static void OnRaceEnd()
{
	struct Driver ** drivers = sdata->gGT->drivers;
	bool foundRacer = false;
	for (int driverID = 1; driverID < ROOM_MAX_NUM_PLAYERS; driverID++)
	{
		/* Undo wheel ghostify */
		drivers[driverID]->wheelSprites = ICONGROUP_GETICONS(sdata->gGT->iconGroup[0]);

		if (!foundRacer && octr->nameBuffer[driverID][0] && !checkpointTracker[driverID].raceFinished)
		{
			sdata->gGT->cameraDC[0].driverToFollow = drivers[driverID];
			foundRacer = true;
		}
	}
}

void StatePS1_Game_Spectate()
{
	if (endRace)
	{
		OnRaceEnd();
		endRace = false;
	}
}