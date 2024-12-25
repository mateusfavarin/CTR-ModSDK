#include <common.h>
#if defined(USE_SAPHI)
#include "../AltMods/Saphi/global.h"
#endif

void DECOMP_VehBirth_EngineAudio_AllPlayers(void)
{
  struct Thread* th;
  struct GameTracker* gGT;
  gGT = sdata->gGT;

  for(
		th = gGT->threadBuckets[PLAYER].thread;
		th != 0;
		th = th->siblingThread
	)
  {
	struct Driver* d = th->object;
	
	#if defined(USE_SAPHI)
	d = gGT->drivers[0];
	#endif
	
    u_char driverID = d->driverID;

	int engine;
	#if defined(USE_SAPHI)
	//also see VehBirth_SetConsts.c
	uint8_t et = octr->perPlayerEngineType[octr->DriverID];
	if (et == 0)
		engine = data.MetaDataCharacters[data.characterIDs[driverID]].engineID;
	else
		engine = et - 1;
	#else
	//vanilla behavior
	engine = data.MetaDataCharacters[data.characterIDs[driverID]].engineID;
	#endif

	#ifndef REBUILD_PS1
    EngineAudio_InitOnce((engine * 4) + driverID, 0x8080);
	#endif

	#if defined(USE_SAPHI)
	return;
	#endif
  }
}
