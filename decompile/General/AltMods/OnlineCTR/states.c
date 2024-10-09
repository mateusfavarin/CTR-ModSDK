#include <common.h>
#include "global.h"

#pragma region Globals
char* countryNames[ELEMENTS_PER_PAGE] =
{
	"Europe",
	"America",
	"Asia",
	"-",
	"-",
	"-",
	"-",
	"Beta"
};

char* lapMenuEntries[ELEMENTS_PER_PAGE] =
{
	"3",
	"5",
	"7",
	"CUSTOM",
	"-",
	"-",
	"-",
	"-"
};

char* customLapMenuEntries[ELEMENTS_PER_PAGE] =
{
	"+100",
	"+10",
	"+1",
	"-1",
	"-10",
	"-100",
	"CONFIRM",
	"-"
};

char* roomMenuEntries[ELEMENTS_PER_PAGE] =
{
	"ROOM 1 - x/8",
	"ROOM 2 - x/8",
	"ROOM 3 - x/8",
	"ROOM 4 - x/8",
	"ROOM 5 - x/8",
	"ROOM 6 - x/8",
	"ROOM 7 - x/8",
	"ROOM 8 - x/8"
};

RECT drawTimeRECT =
{
	.x = 0xffec,
	.y = 0x46 - 3,
	.w = 0x228,
	.h = 0
};
#pragma endregion

#pragma region Function Forward Decls
void PrintCharacterStats(); //currently in misc_states1.c
static void PrintRecvTrack();
static void ResetPsxGlobals();
void Ghostify(); //currently in misc_states3.c
void OnRaceEnd(); //currently in misc_states2.c
void OnRaceInit(); //currently in misc_states3.c
#pragma endregion

#pragma region PS1 States
#pragma region Launch_Boot
void StatePS1_Launch_Boot()
{
	static const char s_errBoot[] = "Error: failed booting Saphi";
	static const char s_errServer[] = "Error: failed connecting to the server";
	const char* msg = octr->bootedSaphi ? s_errServer : s_errBoot;
	DECOMP_DecalFont_DrawLine(msg, 0x100, 0xA8, FONT_SMALL, JUSTIFY_CENTER | ORANGE);
}
#pragma endregion

#pragma region Launch_PickServer
void StatePS1_Launch_PickServer()
{
	//static bool otd_PickServer = true;
	//if (otd_PickServer)
	//{
	//	otd_PickServer = false;
	//	//set the menu title name
	//}

	strcpy(sdata->lngStrings[0x4e], "Saphi");
	//show the menu
	SetMenuShow(true);
	//set the draw function
	void Draw_Launch_PickServer(uint8_t);
	SetMenuContents(Draw_Launch_PickServer, 1, false);
	uint8_t state, row, pageNumber;
	MenuTick(&state, &row, &pageNumber);
	if (state & MENUSTATE_PRESSED_CROSS)
	{
		//set otd to true for next time.
		//otd_PickServer = true;
		//disable the menu.
		//printf("Launch_PickServer hide menu\n");
		SetMenuShow(false);
		//graduate to next state
		octr->serverId = row + (pageNumber * ELEMENTS_PER_PAGE); //parens bit should always be 0 (currently)
		octr->boolJoiningServer = true;
	}
}

void Draw_Launch_PickServer(uint8_t pageNumber)
{
	//set the menu position
	uint16_t x = 0x198, y = 0x84;
	SetMenuPosition(&x, &y, NULL, NULL);
	//set the selectable rows
	for (int i = 0; i < ELEMENTS_PER_PAGE; i++)
	{
		SetRowSelectable(i, !(i > 2 && i < ELEMENTS_PER_PAGE - 1));
	}
	//set menu contents
	for (int i = 0; i < ELEMENTS_PER_PAGE; i++)
		SetRowString(i, countryNames[i]);
}
#pragma endregion

#pragma region Launch_WaitServer
void StatePS1_Launch_WaitServer()
{
	DECOMP_DecalFont_DrawLine("Trying to connect to the server...", 0x100, 0xA8, FONT_SMALL, JUSTIFY_CENTER | ORANGE);
}
#pragma endregion

#pragma region Launch_PickRoom
void StatePS1_Launch_PickRoom()
{
	//static bool otd_PickRoom = true;
	//if (otd_PickRoom)
	//{
	//	otd_PickRoom = false;
	//	//set the menu title name
	//	//strcpy(sdata->lngStrings[0x4e], "Saphi");
	//}
	
	//show the menu
	SetMenuShow(true);
	//set the draw function
	void Draw_Launch_PickRoom(uint8_t);
	SetMenuContents(Draw_Launch_PickRoom, NUM_SERVER_PAGES, true);
	//octr->onlineGameModifiers = MODIFIER_MIRROR;

	int serverTotal = 0;
	for (int i = 0; i < SERVER_NUM_ROOMS; i++) { serverTotal += octr->roomClientCount[i]; }

	//sprintf?
	char* text = "Server Total: 000";
	text[14] = '0' + ((serverTotal / 100) % 10);
	text[15] = '0' + ((serverTotal / 10) % 10);
	text[16] = '0' + (serverTotal % 10);

	DecalFont_DrawLine(text, menu.posX_curr, 0xb8, FONT_SMALL, JUSTIFY_CENTER | PAPU_YELLOW);

	uint8_t state, row, pageNumber;
	MenuTick(&state, &row, &pageNumber);
	if (state & MENUSTATE_PRESSED_CROSS)
	{
		//after picking the room, need to ResetPsxGlobals()
		ResetPsxGlobals();
		//set otd to true for next time.
		//otd_PickRoom = true;
		//disable the menu.
		//printf("Launch_PickRoom hide menu\n");
		SetMenuShow(false);
		//graduate to next state
		octr->serverRoom = row + (pageNumber * ELEMENTS_PER_PAGE);
		octr->boolSelectedRoom = true;
	}
}

void Draw_Launch_PickRoom(uint8_t pageNumber)
{
	//set the menu position
	uint16_t x = 0x198, y = 0x84;
	SetMenuPosition(&x, &y, NULL, NULL);
	//set menu contents
	for (int i = 0; i < ELEMENTS_PER_PAGE; i++)
	{
		SetRowString(i, roomMenuEntries[i]);
		uint16_t roomNumber = i + (pageNumber * ELEMENTS_PER_PAGE);
		//roomNumber = roomNumber <= 9
		roomMenuEntries[i][5] = roomNumber + ((roomNumber <= 8) ? ('1') : ('A' - 9));
		roomMenuEntries[i][9] = '0' + (octr->roomClientCount[(pageNumber * ELEMENTS_PER_PAGE) + i]);
		if (roomNumber >= SERVER_NUM_ROOMS)
		{
			roomMenuEntries[i][0] = '-';
			roomMenuEntries[i][1] = '\0';
			SetRowSelectable(i, false);
		}
		else
		{
			roomMenuEntries[i][0] = 'R';
			roomMenuEntries[i][1] = 'O';
			SetRowSelectable(i, !octr->roomLocked[roomNumber]);
		}
	}
}
#pragma endregion

#pragma region Launch_Error
void StatePS1_Launch_Error()
{
	int expectedVer = max(max(octr->ver_psx, octr->ver_pc), octr->ver_server);
	if (octr->ver_psx < expectedVer) { DECOMP_DecalFont_DrawLine("Please update your game.", 0x100, 0x98 - 2, FONT_SMALL, JUSTIFY_CENTER); }
	if (octr->ver_pc < expectedVer) { DECOMP_DecalFont_DrawLine("Please update your launcher.", 0x100, 0xA0 - 2, FONT_SMALL, JUSTIFY_CENTER); }
	if (octr->ver_server < expectedVer) { DECOMP_DecalFont_DrawLine("Server unavailable.", 0x100, 0xA8 - 2, FONT_SMALL, JUSTIFY_CENTER); }
	//printf("Launch_Error hide menu\n");
	SetMenuShow(false);
}
#pragma endregion

#pragma region Lobby_AssignRole
void StatePS1_Lobby_AssignRole()
{
	//do nothing
}
#pragma endregion

#pragma region Lobby_HostTrackPick
void StatePS1_Lobby_HostTrackPick()
{
	//0 = choose track
	//1 = choose laps
	//2 = choose custom laps
	static char step = 0;
	//static bool otd_HostTrackPick = true;
	//if (otd_HostTrackPick)
	//{
	//	otd_HostTrackPick = false;
	//	//set the menu title name
	//	//strcpy(sdata->lngStrings[0x4e], "Saphi");
	//}

	//show the menu
	SetMenuShow(true);
	switch (step)
	{
		case 0: //track
		{
			//set the draw function to track pick
			void Draw_Lobby_HostTrackPick(uint8_t);
			SetMenuContents(Draw_Lobby_HostTrackPick, NUM_TRACK_PAGES, true);
		}
		break;
		case 1: //laps
		{
			//set the draw function to laps pick
			void Draw_Lobby_HostTrackPick_Laps(uint8_t);
			SetMenuContents(Draw_Lobby_HostTrackPick_Laps, 1, false);
		}
		break;
		case 2: //custom laps
		{
			void Draw_Lobby_HostTrackPick_CustomLaps(uint8_t);
			SetMenuContents(Draw_Lobby_HostTrackPick_CustomLaps, 1, false);
		}
		break;
	}

	PrintCharacterStats();

	uint8_t state, row, pageNumber;
	MenuTick(&state, &row, &pageNumber);
	if (state & MENUSTATE_PRESSED_CROSS)
	{
		switch (step)
		{
			case 0: //track
			{
				octr->levelID = row + (pageNumber * ELEMENTS_PER_PAGE);
				octr->boolSelectedLevel = true;
				step = 1; //go to choose laps
			}
			break;
			case 1: //laps
			{
				if (row <= 2) //3 5 7
				{
					int lapCount = (row * 2) + 3;
					octr->lapCount = lapCount;
					octr->boolSelectedLap = true;
					SetMenuShow(false);
					step = 0; //reset state for next time.
				}
				else //if row == 3
				{
					step = 2; //go to custom laps
					strcpy(sdata->lngStrings[0x4e], "1"); //custom lap label (starts at 1 lap)
				}
			}
			break;
			case 2: //custom laps
			{
				static int16_t rolling = 1;
				if (row == 6)
				{
					octr->lapCount = rolling;
					octr->boolSelectedLap = true;
					SetMenuShow(false);
					rolling = 1;
					step = 0; //reset state for next time.
					strcpy(sdata->lngStrings[0x4e], "Saphi");
				}
				else
				{
					switch (row)
					{
						case 0:
							rolling += 100;
							break;
						case 1:
							rolling += 10;
							break;
						case 2:
							rolling += 1;
							break;
						case 3:
							rolling -= 1;
							break;
						case 4:
							rolling -= 10;
							break;
						case 5:
							rolling -= 100;
							break;
					}
					rolling = ((rolling < 1) ? 1 : rolling);
					rolling = ((rolling > 254) ? 254 : rolling);
					//rolling = max(0, rolling);
					//rolling = min(254, rolling);
					char lapCountTitleBuf[5];//9999+nullterm (5 chars)
					sprintf(lapCountTitleBuf, "%d", rolling);
					lapCountTitleBuf[4] = '\0'; //no overrun pls.
					strcpy(sdata->lngStrings[0x4e], lapCountTitleBuf); //set the title
				}
			}
			break;
		}
	}
}

void Draw_Lobby_HostTrackPick(uint8_t pageNumber)
{
	//set the menu position
	uint16_t x = 0x70, y = 0x84;
	SetMenuPosition(&x, &y, NULL, NULL);
	//set menu contents
	for (int i = 0; i < ELEMENTS_PER_PAGE; i++)
	{
		int levelId = i + (ELEMENTS_PER_PAGE * pageNumber);
		if (levelId > TURBO_TRACK)
		{
			SetRowSelectable(i, false);
			SetRowString(i, "-");
		}
		else
		{
			SetRowSelectable(i, true);
			SetRowInternalString(i, data.metaDataLEV[levelId].name_LNG);
		}
	}
}

void Draw_Lobby_HostTrackPick_Laps(uint8_t pageNumber)
{
	//set menu contents
	for (int i = 0; i < ELEMENTS_PER_PAGE; i++)
	{
		SetRowString(i, lapMenuEntries[i]);
		SetRowSelectable(i, true);
	}
	for (int i = 4; i < 8; i++)
	{
		SetRowSelectable(i, false);
	}
}

void Draw_Lobby_HostTrackPick_CustomLaps(uint8_t pageNumber)
{
	//set menu contents
	for (int i = 0; i < ELEMENTS_PER_PAGE; i++)
	{
		SetRowString(i, customLapMenuEntries[i]);
		SetRowSelectable(i, true);
	}
	SetRowSelectable(7, false);
}
#pragma endregion

#pragma region Lobby_GuestTrackWait
void StatePS1_Lobby_GuestTrackWait()
{
	PrintCharacterStats();

	//printf("Lobby_GuestTrackWait hide menu\n");
	SetMenuShow(false);

	DECOMP_DecalFont_DrawLine(
		"waiting for host",
		menu.posX_curr, 0xA8, FONT_SMALL, JUSTIFY_CENTER | ORANGE);

	DECOMP_DecalFont_DrawLine(
		"to pick the track",
		menu.posX_curr, 0xB0, FONT_SMALL, JUSTIFY_CENTER | ORANGE);
}
#pragma endregion

#pragma region Lobby_CharacterPick
void StatePS1_Lobby_CharacterPick()
{
	//static bool otd_CharacterPick = true;
	//if (otd_CharacterPick)
	//{
	//	otd_CharacterPick = false;
	//	//set the menu title name
	//	//strcpy(sdata->lngStrings[0x4e], "Saphi");
	//}
	
	//show the menu
	//printf("Lobby_CharacterPick show menu\n");
	SetMenuShow(true);
	//set the draw function
	void Draw_Lobby_CharacterPick(uint8_t);
	SetMenuContents(Draw_Lobby_CharacterPick, NUM_CHARACTER_PAGES, true);

	PrintCharacterStats();
	PrintRecvTrack();

	uint8_t state, row, pageNumber;
	MenuTick(&state, &row, &pageNumber);
	if (state & MENUSTATE_PRESSED_CROSS)
	{
		//set otd to true for next time.
		//otd_CharacterPick = true;
		//disable the menu.
		//printf("Lobby_CharacterPick hide menu\n");
		SetMenuShow(false);
		//graduate to next state
		data.characterIDs[0] = row + (pageNumber * ELEMENTS_PER_PAGE);
		octr->boolClientSelectedCharacters[octr->DriverID] = true;
	}
}

void Draw_Lobby_CharacterPick(uint8_t pageNumber)
{
	//set the menu position
	uint16_t x = 0x70, y = 0x84;
	SetMenuPosition(&x, &y, NULL, NULL);
	//set menu contents
	for (int i = 0; i < ELEMENTS_PER_PAGE; i++)
	{
		if (i < NUM_CHARACTER_PAGES * ELEMENTS_PER_PAGE)
		{
			SetRowSelectable(i, true);
			SetRowInternalString(i, data.MetaDataCharacters[i + (ELEMENTS_PER_PAGE * pageNumber)].name_LNG_long);
		}
		else
		{
			SetRowSelectable(i, false);
			SetRowString(i, "-");
		}
	}
}
#pragma endregion

#pragma region Lobby_WaitForLoading
void StatePS1_Lobby_WaitForLoading()
{
	PrintCharacterStats();
	PrintRecvTrack();

	// waiting for all characters
	DECOMP_DecalFont_DrawLine(
		"Hope you win!",
		menu.posX_curr, menu.posY_curr,
		FONT_SMALL, JUSTIFY_CENTER | ORANGE);
}
#pragma endregion

#pragma region Lobby_Loading
static bool otd_initRace = true;
static bool otd_endRace = true;

void StatePS1_Lobby_Loading()
{
	otd_initRace = true;
	otd_endRace = true;

	PrintCharacterStats();
	PrintRecvTrack();

	DECOMP_DecalFont_DrawLine(
		"LOADING...",
		menu.posX_curr, menu.posY_curr,
		FONT_SMALL, JUSTIFY_CENTER | ORANGE);

	// variable reuse, wait a few frames,
	// so screen updates with green names

	//saphi bug: I think in the original client, this value
	//was zeroed by the client upon entering this state, but
	//I don't think it is in saphi.
	octr->CountPressX++;
	if (octr->CountPressX < FPS_DOUBLE(15)) return;

	// stop music,
	// stop "most FX", let menu FX ring
	Music_Stop();
	howl_StopAudio(1, 1, 0);
	sdata->unkAudioState = 0;

	struct GameTracker* gGT = sdata->gGT;

	// for battle tracks
	gGT->gameMode1 = LOADING | BATTLE_MODE;

	if (
		(octr->levelID <= TURBO_TRACK) ||
		(octr->levelID >= GEM_STONE_VALLEY)
		)
	{
		// for all other tracks
		if ((octr->onlineGameModifiers & MODIFIER_ITEMS))
			gGT->gameMode1 = LOADING | ARCADE_MODE; //spawn boxes if items are on
		else
			gGT->gameMode1 = LOADING | TIME_TRIAL; //otherwise time trial mode (itemless)
	}

	// instant load
	//sdata->Loading.stage = 0;

	// load with flag animation
	DECOMP_MainRaceTrack_RequestLoad(octr->levelID);

	// dont kill thread,
	// it will die when loading screen covers screen
}
#pragma endregion

#pragma region Game_WaitForRace
void StatePS1_Game_WaitForRace()
{
	struct GameTracker* gGT = sdata->gGT;
	if (otd_initRace) //FIX ME
	{
		OnRaceInit();
		otd_initRace = false;
	}

	gGT->trafficLightsTimer = 0xf40;

	if ((octr->onlineGameModifiers & MODIFIER_ITEMS) == 0)
		Ghostify();

	if ((gGT->gameMode1 & START_OF_RACE) != 0)
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

	for (i = 0; i < 8; i++)
	{
		octr->Shoot[i].boolNow = 0;
	}
}
#pragma endregion

#pragma region Game_Race
void StatePS1_Game_Race()
{
	int i;
	static unsigned msCount = 0;
	static unsigned frameCounter = 0;

	if ((octr->onlineGameModifiers & MODIFIER_ITEMS) == 0)
		Ghostify();
	short* camMode = (short*)(0x80098028); //same address used in OnlineCTR, todo: change this to be the actual variable.
	//afaik, this only needs to be done *once*, when the race starts, not every frame.
	if ((octr->onlineGameModifiers & MODIFIER_DEMOCAM))
		*camMode = 0x20; //0x20 = demo cam mode
	else
		*camMode = 0;

	if (octr->onlineGameModifiers & MODIFIER_ITEMS)
		for (i = 1; i < ROOM_MAX_NUM_PLAYERS; i++)
		{
			if (octr->Shoot[i].boolNow != 0)
			{
				int weapon;
				struct Driver* d = sdata->gGT->drivers[i];
				octr->Shoot[i].boolNow = 0;
				if (octr->Shoot[i].boolJuiced) { d->numWumpas = 10; }

				d->heldItemID = octr->Shoot[i].Weapon;
				weapon = d->heldItemID;

				// Missiles and Bombs share code,
				// Change Bomb1x, Bomb3x, Missile3x, to Missile1x
				if ((weapon == 1) || (weapon == 10) || (weapon == 11)) { weapon = 2; }
				if (weapon == 14)
				{ //not a weapon, honk your horn
					//printf("Weapon packet honk!\n");
					DECOMP_OtherFX_Play(88, 1); //fire rocket sound (temporary)
				}
				else
					DECOMP_VehPickupItem_ShootNow(d, weapon, octr->Shoot[i].flags); //shoot weapon
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
		DecalFont_DrawLine(s_dnfNumber, 192, 10, FONT_BIG, JUSTIFY_CENTER | color);
		DecalFont_DrawLine(s_dnf, 192, 10 + data.font_charPixHeight[FONT_BIG], FONT_SMALL, JUSTIFY_CENTER | color);
	}
	else { msCount = 0; }
}
#pragma endregion

#pragma region Game_EndRace
void StatePS1_Game_EndRace()
{
	//empty
}
#pragma endregion

#pragma region Game_Spectate
void StatePS1_Game_Spectate()
{
	if (otd_endRace)
	{
		OnRaceEnd();
		otd_endRace = false;
	}
}
#pragma endregion
#pragma endregion

#pragma region Misc Util
static void PrintRecvTrack()
{
	static char* onlineLapString = "Laps: 000";
	char message[32];

	sprintf(message, "Track: %s",
		sdata->lngStrings
		[
			data.metaDataLEV[octr->levelID].name_LNG
		]
	);

	int boolEndOfRace = !octr->boolPlanetLEV;

	int posX = 0x118 - 0x20 * boolEndOfRace;

	int numLaps = sdata->gGT->numLaps;
	onlineLapString[6] = '0' + ((numLaps / 100) % 10);
	onlineLapString[7] = '0' + ((numLaps / 10) % 10);
	onlineLapString[8] = '0' + (numLaps % 10);

	DecalFont_DrawLine(message, posX, 0x38, FONT_SMALL, PAPU_YELLOW);
	DecalFont_DrawLine(onlineLapString, posX + 2, 0x40, FONT_SMALL, PAPU_YELLOW);
}

static void ResetPsxGlobals()
{
	//this function is called at the end of StatePS1_Launch_PickRoom,
	//I think most of the things this function does only needs to be
	//done ONCE during the lifetime of the program.

	// unlock everything (0,1,2,3,4,5)
	for (int i = 0; i < 6; i++)
		sdata->advProgress.rewards[i] = 0xffffffff;

	// 8mb RAM expansion, for emulators that support it.
	// Needed for 3 or more players on Adv Hub
	sdata->mempack[0].lastFreeByte = 0x807ff800;
	sdata->mempack[0].endOfAllocator = 0x807ff800;

	//SetMenuShow(false);

	// keep running till the client gets a result,
	// DriverID is set to -1 on windows-side before this.

	for (int i = 0; i < ROOM_MAX_NUM_PLAYERS; i++)
	{
		data.characterIDs[i] = 0;
		octr->boolClientSelectedCharacters[i] = 0;
	}
}
#pragma endregion