.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel MATH_VectorLength
/* 2AF48 8003D328 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2AF4C 8003D32C 1000BFAF */  sw         $ra, 0x10($sp)
/* 2AF50 8003D330 00008C8C */  lw         $t4, 0x0($a0)
/* 2AF54 8003D334 04008D84 */  lh         $t5, 0x4($a0)
/* 2AF58 8003D338 0000CC48 */  ctc2       $t4, $0 /* handwritten instruction */
/* 2AF5C 8003D33C 0008CD48 */  ctc2       $t5, $1 /* handwritten instruction */
/* 2AF60 8003D340 00008C8C */  lw         $t4, 0x0($a0)
/* 2AF64 8003D344 04008D84 */  lh         $t5, 0x4($a0)
/* 2AF68 8003D348 00008C48 */  mtc2       $t4, $0 /* handwritten instruction */
/* 2AF6C 8003D34C 00088D48 */  mtc2       $t5, $1 /* handwritten instruction */
/* 2AF70 8003D350 00000000 */  nop
/* 2AF74 8003D354 00000000 */  nop
/* 2AF78 8003D358 1260404A */  MVMVA      0, 0, 0, 3, 0
/* 2AF7C 8003D35C 00C80448 */  mfc2       $a0, $25 /* handwritten instruction */
/* 2AF80 8003D360 86B1010C */  jal        SquareRoot0_stub
/* 2AF84 8003D364 00000000 */   nop
/* 2AF88 8003D368 1000BF8F */  lw         $ra, 0x10($sp)
/* 2AF8C 8003D36C 00000000 */  nop
/* 2AF90 8003D370 0800E003 */  jr         $ra
/* 2AF94 8003D374 1800BD27 */   addiu     $sp, $sp, 0x18
.size MATH_VectorLength, . - MATH_VectorLength
