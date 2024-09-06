.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel VehPhysProc_SlamWall_Update
/* 51718 80063AF8 0800E003 */  jr         $ra
/* 5171C 80063AFC 00000000 */   nop
.size VehPhysProc_SlamWall_Update, . - VehPhysProc_SlamWall_Update
