#include "global.h"
#include <common.h>

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