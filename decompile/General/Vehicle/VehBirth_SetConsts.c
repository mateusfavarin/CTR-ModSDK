#include <common.h>
#if defined(USE_SAPHI)
#include "../AltMods/Saphi/global.h"
#endif

void DECOMP_VehBirth_SetConsts(struct Driver* driver)
{
	u_int metaPhysSize;
	u_int i;
	struct MetaPhys* metaPhys;
	u_char* d;

	d = (u_char*)driver;

	int engineID;
	#if defined(USE_SAPHI)
	//also see VehBirth_EngineAudio_AllPlayers.c
	uint8_t et = octr->perPlayerEngineType[octr->DriverID];
	if (et == 0)
		engineID = data.MetaDataCharacters[data.characterIDs[driver->driverID]].engineID;
	else
		engineID = et - 1;
	#else
	//vanilla behavior
	engineID = data.MetaDataCharacters[data.characterIDs[driver->driverID]].engineID;
	#endif

	for(i = 0; i < 65; i++)
	{
		metaPhys = &data.metaPhys[i];

		metaPhysSize = metaPhys->size;

		void* src = &metaPhys->value[engineID];
		void* dst = &d[metaPhys->offset];

		if (metaPhysSize == 1)
		{
			*(char*)dst = *(char*)src;
			continue;
		}

		if (metaPhysSize == 2)
		{
			*(short*)dst = *(short*)src;
			continue;
		}

		*(int*)dst = *(int*)src;
	}

	return;
}