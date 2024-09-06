.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel RefreshCard_GetNumGhostsTotal
/* 34E44 80047224 0A80023C */  lui        $v0, %hi(D_8009AA5C)
/* 34E48 80047228 0800E003 */  jr         $ra
/* 34E4C 8004722C 5CAA40A4 */   sh        $zero, %lo(D_8009AA5C)($v0)
.size RefreshCard_GetNumGhostsTotal, . - RefreshCard_GetNumGhostsTotal
