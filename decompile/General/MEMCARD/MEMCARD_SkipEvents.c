#include <common.h>
// tests all events until no events left for both cards
void DECOMP_MEMCARD_SkipEvents(void)

{
    // Non infinite, bot functions have timeouts
    while ((DECOMP_MEMCARD_GetNextSwEvent() != 7) && (DECOMP_MEMCARD_GetNextHwEvent() != 7))
        ;
}
