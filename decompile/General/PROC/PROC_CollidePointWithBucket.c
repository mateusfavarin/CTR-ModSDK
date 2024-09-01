#include <common.h>

#ifdef USE_ONLINE
void Online_CollidePointWithBucket(struct Thread* th, short* vec3_pos);
#endif

void DECOMP_PROC_CollidePointWithBucket(struct Thread* th, short* vec3_pos)
{
#ifdef USE_ONLINE
	Online_CollidePointWithBucket(th, vec3_pos);
#else
	while(th != 0)
	{
		DECOMP_PROC_CollidePointWithSelf(th, vec3_pos);

		// next
		th = th->siblingThread;
	}
#endif
}