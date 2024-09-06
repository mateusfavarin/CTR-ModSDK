.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel GTE_GetSquaredLength
/* 1C278 8002E658 000089C8 */  lwc2       $9, 0x0($a0)
/* 1C27C 8002E65C 04008224 */  addiu      $v0, $a0, 0x4
/* 1C280 8002E660 00004AC8 */  lwc2       $10, 0x0($v0)
/* 1C284 8002E664 08008424 */  addiu      $a0, $a0, 0x8
/* 1C288 8002E668 00008BC8 */  lwc2       $11, 0x0($a0)
/* 1C28C 8002E66C 00000000 */  nop
/* 1C290 8002E670 00000000 */  nop
/* 1C294 8002E674 2804A04A */  SQR        0
/* 1C298 8002E678 00C80248 */  mfc2       $v0, $25 /* handwritten instruction */
/* 1C29C 8002E67C 00D00348 */  mfc2       $v1, $26 /* handwritten instruction */
/* 1C2A0 8002E680 00D80448 */  mfc2       $a0, $27 /* handwritten instruction */
/* 1C2A4 8002E684 21104300 */  addu       $v0, $v0, $v1
/* 1C2A8 8002E688 0800E003 */  jr         $ra
/* 1C2AC 8002E68C 21104400 */   addu      $v0, $v0, $a0
.size GTE_GetSquaredLength, . - GTE_GetSquaredLength
