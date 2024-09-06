.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_80058C44
/* 46864 80058C44 0800E003 */  jr         $ra
/* 46868 80058C48 00000000 */   nop
.size func_80058C44, . - func_80058C44
