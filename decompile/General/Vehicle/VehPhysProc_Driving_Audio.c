#include <common.h>

void DECOMP_VehPhysProc_Driving_Audio(struct Thread* t, struct Driver* d)
{
#if defined(USE_SAPHI)
	if(d->driverID != 0)
		return;
#endif
	
#ifndef REBUILD_PS1
	EngineSound_Player(d);
#endif
}