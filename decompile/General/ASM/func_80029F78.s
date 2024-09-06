.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_80029F78
/* 17B98 80029F78 0800E003 */  jr         $ra
/* 17B9C 80029F7C 00000000 */   nop
.size func_80029F78, . - func_80029F78
