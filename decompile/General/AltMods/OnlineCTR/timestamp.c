#include "global.h"
#include <common.h>

void PrintTimeStamp()
{
	int boolEndOfRace = !octr->boolPlanetLEV;

	int posX = 56 + 0xC * boolEndOfRace;
	int posY = 198 - 0xC * boolEndOfRace;
	DECOMP_DecalFont_DrawLine(__TIME__, posX, posY, FONT_SMALL, DARK_RED);
	DECOMP_DecalFont_DrawLine(__DATE__, posX, posY + 8, FONT_SMALL, DARK_RED);
}