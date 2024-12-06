#include <common.h>

void DECOMP_PROC_CollidePointWithBucket(struct Thread* th, short* vec3_pos)
{
#if defined(USE_SAPHI)
	void Online_CollidePointWithBucket(struct Thread* th, short* vec3_pos);
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