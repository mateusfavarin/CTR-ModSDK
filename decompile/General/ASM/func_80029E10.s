.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_80029E10
/* 17A30 80029E10 0800E003 */  jr         $ra
/* 17A34 80029E14 00000000 */   nop
.size func_80029E10, . - func_80029E10
