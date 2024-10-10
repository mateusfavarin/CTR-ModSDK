#include "global.h"
#include <common.h>

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

extern unsigned int checkpointTimes[(MAX_LAPS * CPS_PER_LAP) + 1];
void OnRaceInit()
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