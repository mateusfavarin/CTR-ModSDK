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