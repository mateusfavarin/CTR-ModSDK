.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel Voiceline_EmptyFunc
/* 1AEC8 8002D2A8 0800E003 */  jr         $ra
/* 1AECC 8002D2AC 00000000 */   nop
.size Voiceline_EmptyFunc, . - Voiceline_EmptyFunc
