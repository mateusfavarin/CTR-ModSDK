//these make it not compile?
//#include <common.h>
#include "global.h"

void (*funcs[NUM_STATES_FUNCS]) () =
{
	StatePS1_Launch_Boot,
	StatePS1_Launch_PickServer,
	StatePS1_Launch_WaitServer,
	StatePS1_Launch_PickRoom,
	StatePS1_Launch_Error,
	StatePS1_Lobby_AssignRole,
	StatePS1_Lobby_HostTrackPick,
	StatePS1_Lobby_GuestTrackWait,
	StatePS1_Lobby_CharacterPick,
	StatePS1_Lobby_WaitForLoading,
	StatePS1_Lobby_Loading,
	StatePS1_Game_WaitForRace,
	StatePS1_Game_Race,
	StatePS1_Game_EndRace,
	StatePS1_Game_Spectate
};

RECT endRaceRECT =
{
	.x = 8,
	.y = 8,
	.w = 0x200-0x20,
	.h = 0xc8,
};

void ThreadFunc(struct Thread* t)
{
	int isIdle = 0;

	struct GameTracker* gGT = sdata->gGT;
	octr->boolPlanetLEV = gGT->levelID == 0x26;

	if(octr->boolPlanetLEV)
	{
		*(int*)0x800ae54c = 0x3e00008;
		*(int*)0x800ae550 = 0;

        // freecam mode
        gGT->cameraDC[0].cameraMode = 3;

        // disable all HUD flags
        gGT->hudFlags = 0;

		struct PushBuffer* pb = &gGT->pushBuffer[0];

		pb->pos[0] = 0x3D;
		pb->pos[1] = 0xF8;
		pb->pos[2] = 0xF879;

		pb->rot[0] = 0x841;
		pb->rot[1] = 0x77c;
		pb->rot[2] = 0xff5;
	}

	// If windowsClientSync hasn't been updated, it means it is idle/gone/lagging
	if(octr->windowsClientSync == octr->lastWindowsClientSync){
		isIdle = 1; // the counter is the same as last, start unsync procedure
	} else {
		octr->lastWindowsClientSync = octr->windowsClientSync; // client did update, change last counter
	}

    // count frames that the client didn't update the game
    if(isIdle==1 && octr->CurrState > LAUNCH_BOOT){
        octr->frames_unsynced++;
    } else {
        octr->frames_unsynced = 0;
    }

	//this debug info courtesy of ClaudioBo
#ifdef PINE_DEBUG
	static unsigned frameCounter = 0;
	char frames_unsynced_str[12];
	sprintf(frames_unsynced_str, "%d", octr->frames_unsynced);

	if (octr->frames_unsynced >= 80) {
		int color = frameCounter++ & FPS_DOUBLE(1) ? RED : WHITE;
		char final_str[20];
		sprintf(final_str, "WTF!!: %s/120", frames_unsynced_str);
		DECOMP_DecalFont_DrawLine(final_str, 0x100, 200, FONT_BIG, JUSTIFY_CENTER | color);
	}
	else if (octr->frames_unsynced >= 60) {
		DECOMP_DecalFont_DrawLine(frames_unsynced_str, 0x100, 200, FONT_BIG, JUSTIFY_CENTER | CORTEX_RED);
	}
	else if (octr->frames_unsynced >= 40) {
		DECOMP_DecalFont_DrawLine(frames_unsynced_str, 0x100, 200, FONT_BIG, JUSTIFY_CENTER | ROO_ORANGE);
	}
	else if (octr->frames_unsynced >= 20) {
		DECOMP_DecalFont_DrawLine(frames_unsynced_str, 0x100, 200, FONT_BIG, JUSTIFY_CENTER | PAPU_YELLOW);
	}
	else {
		DECOMP_DecalFont_DrawLine(frames_unsynced_str, 0x100, 200, FONT_BIG, JUSTIFY_CENTER | WHITE);
	}
#endif

	// close if client didn't update the game in DISCONNECT_AT_UNSYNCED_FRAMES
	int boolCloseClient = (octr->frames_unsynced > DISCONNECT_AT_UNSYNCED_FRAMES);

	// if client closed, or server disconnected
	if(boolCloseClient || octr->CurrState == DISCONNECTED)
	{
		sdata->ptrActiveMenu = 0;

		if(octr->boolPlanetLEV)
		{
			octr->CurrState = boolCloseClient ? LAUNCH_BOOT : LAUNCH_PICK_SERVER;
			octr->boolJoiningServer = 0;
			octr->boolSelectedRoom = 0;
			return;
		}

		// calls memset on OnlineCTR struct
		octr_entryHook();

		octr->CurrState = boolCloseClient ? LAUNCH_BOOT : LAUNCH_PICK_SERVER;

		// stop music,
		// stop "most FX", let menu FX ring
		Music_Stop();
		DECOMP_howl_StopAudio(1,1,0);
		sdata->unkAudioState = 0;

		// load next level
		//sdata->gGT->gameMode1 = LOADING;
		//sdata->Loading.stage = 0;

		// load with flag animation
		DECOMP_MainRaceTrack_RequestLoad(0x26);

		// kill thread,
		// dont execute again until game loads
		t->flags |= 0x800;
		return;
	}

	// gameplay
	if (octr->CurrState >= GAME_WAIT_FOR_RACE)
	{
		void DrawOverheadNames();
		DrawOverheadNames();
	}

	if (octr->CurrState >= 0)
		funcs[octr->CurrState]();

	// not gameplay, must draw LAST
	if (octr->CurrState <= LOBBY_WAIT_FOR_LOADING)
	{
		void PrintTimeStamp();
		PrintTimeStamp();

		// if not viewing planet
		if(!octr->boolPlanetLEV)
		{
			struct RectMenu* m = sdata->ptrActiveMenu;

			// draw menu now because it is drawn
			// later, which puts it behind our background
			if(m != 0)
			{
				// clear width, then get width
				int width = 0;
				DECOMP_RECTMENU_GetWidth(m, &width, 1);
				DECOMP_RECTMENU_DrawSelf(m, 0, 0, (int)width);
			}
			DECOMP_RECTMENU_DrawInnerRect(&endRaceRECT, 0, gGT->backBuffer->otMem.startPlusFour);
		}
	}
}