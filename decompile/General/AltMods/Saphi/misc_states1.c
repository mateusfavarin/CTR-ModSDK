#include "global.h"
#include <common.h>

extern char* countryNames[];

void PrintCharacterStats()
{
	char message[32];
	int slot;
	int i;
	int color;

	//uint16_t x = 0x70, y = 0x84;
	//SetMenuPosition(&x, &y, NULL, NULL);

	DecalFont_DrawLine(
		countryNames[octr->serverId],
		0x10, 0x10, FONT_SMALL, 0);

	char* roomName = "ROOM x";
	roomName[5] = octr->serverRoom + ((octr->serverRoom <= 8) ? ('1') : ('A' - 9));

	DecalFont_DrawLine(
		roomName,
		0x10, 0x18, FONT_SMALL, 0);

	int numDead = 0;
	for (i = 0; i < octr->NumDrivers; i++)
		if (octr->nameBuffer[i][0] == 0)
			numDead++;

	int posX;
	int boolEndOfRace = !octr->boolPlanetLEV;

	posX = 0x130 - 0x20 * boolEndOfRace;
	sprintf(message, "Players: %d/8", (octr->NumDrivers - numDead));
	DecalFont_DrawLine(message, posX, 0x58, FONT_SMALL, 0);

	int h = 0;

	// UI-test
	// octr->NumDrivers = 8;

	for (i = 0; i < octr->NumDrivers; i++)
	{
		// convert client index to local index
		if (i == octr->DriverID) slot = 0;
		if (i < octr->DriverID) slot = i + 1;
		if (i > octr->DriverID) slot = i;

		char* str = octr->nameBuffer[slot];

		// UI-test
		// str[0] = 'A';

		if (str[0] == 0) continue;

		// 0x19 - red
		// 0x1A - green
		int color =
			octr->boolClientSelectedCharacters[i] ?
			PLAYER_GREEN : PLAYER_RED;

		int posY = 0x60 + h;
		h += 8;

		posX = 0x130 - 0x20 * boolEndOfRace;
		sprintf(message, "%s:", str);
		DecalFont_DrawLine(message, posX, posY, FONT_SMALL, color);

		if (octr->CurrState < LOBBY_CHARACTER_PICK)
			continue;

		char* characterName =
			sdata->lngStrings[
				data.MetaDataCharacters[
					data.characterIDs[slot]
				].name_LNG_short];

		posX = 0x1AC - 0x20 * boolEndOfRace;
		DecalFont_DrawLine(characterName, posX, posY, FONT_SMALL, color);
	}

	posX = 0x138 - 0x20 * boolEndOfRace;
	int posY = 0xb8 - 0xC * boolEndOfRace;
	DecalFont_DrawLine("Return to main menu", posX, posY, FONT_SMALL, 0);
	DecalFont_DrawLine("During Race or Lobby", posX - 0x8, posY + 0x8, FONT_SMALL, 0);
	DecalFont_DrawLine("With the Select Button", posX - 0x18, posY + 0x10, FONT_SMALL, RED);
}

void OnRaceEnd()
{
	struct Driver** drivers = sdata->gGT->drivers;
	//bool foundRacer = false;
	for (int driverID = 1; driverID < ROOM_MAX_NUM_PLAYERS; driverID++)
	{
		/* Undo wheel ghostify */
		drivers[driverID]->wheelSprites = ICONGROUP_GETICONS(sdata->gGT->iconGroup[0]);

		//I think this code is trying to find a player who has not finished the race to spectate.
		//it doesn't seem to always work. If you try to re-enable this functionality, keep in mind
		//it relates to endOfRaceUI.c
		//if (!foundRacer && octr->nameBuffer[driverID][0] && !checkpointTracker[driverID].raceFinished)
		//{
		//	sdata->gGT->cameraDC[0].driverToFollow = drivers[driverID];
		//	foundRacer = true;
		//}
	}
}

void Ghostify()
{
	//struct Turbo* turboObj;
	//struct Thread* fireThread;
	//struct GameTracker* gGT = sdata->gGT;
	//struct Icon** ptrIconArray;
	//struct Instance* inst;

	for (int driverID = 1; driverID < ROOM_MAX_NUM_PLAYERS; driverID++)
	{
		sdata->gGT->drivers[driverID]->wheelSprites = ICONGROUP_GETICONS(sdata->gGT->iconGroup[0xC]);
		struct Instance* inst = sdata->gGT->drivers[driverID]->instSelf;
		if (!inst) { continue; }
		inst->flags |= 0x60000;
		inst->alphaScale = 0xA00;
	}
}