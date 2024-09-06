.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel BOTS_EmptyFunc
/* 180 80012560 0800E003 */  jr         $ra
/* 184 80012564 00000000 */   nop
.size BOTS_EmptyFunc, . - BOTS_EmptyFunc
