#include <common.h>

void DECOMP_LOAD_Robots1P(int characterID)
{
	#if defined(USE_SAPHI)
	return;
	#endif
	
	int newCharacterID = 0;
	for(int i = 1; i < 8; i++, newCharacterID++)
	{
		if(newCharacterID == characterID)
			newCharacterID++;
		
		data.characterIDs[i] = newCharacterID;
	}
}