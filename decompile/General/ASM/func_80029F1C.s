.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_80029F1C
/* 17B3C 80029F1C 0800E003 */  jr         $ra
/* 17B40 80029F20 00000000 */   nop
.size func_80029F1C, . - func_80029F1C
