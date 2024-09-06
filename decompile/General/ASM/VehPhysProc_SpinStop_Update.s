.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel VehPhysProc_SpinStop_Update
/* 51F0C 800642EC 0800E003 */  jr         $ra
/* 51F10 800642F0 00000000 */   nop
.size VehPhysProc_SpinStop_Update, . - VehPhysProc_SpinStop_Update
