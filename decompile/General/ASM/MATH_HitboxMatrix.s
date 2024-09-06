.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel MATH_HitboxMatrix
/* 2AE84 8003D264 FFFF073C */  lui        $a3, (0xFFFF0000 >> 16)
/* 2AE88 8003D268 0000A68C */  lw         $a2, 0x0($a1)
/* 2AE8C 8003D26C 0400A88C */  lw         $t0, 0x4($a1)
/* 2AE90 8003D270 0C00A38C */  lw         $v1, 0xC($a1)
/* 2AE94 8003D274 FFFFCA30 */  andi       $t2, $a2, 0xFFFF
/* 2AE98 8003D278 24100701 */  and        $v0, $t0, $a3
/* 2AE9C 8003D27C 25504201 */  or         $t2, $t2, $v0
/* 2AEA0 8003D280 FFFF6930 */  andi       $t1, $v1, 0xFFFF
/* 2AEA4 8003D284 2430C700 */  and        $a2, $a2, $a3
/* 2AEA8 8003D288 25482601 */  or         $t1, $t1, $a2
/* 2AEAC 8003D28C 24186700 */  and        $v1, $v1, $a3
/* 2AEB0 8003D290 0800A28C */  lw         $v0, 0x8($a1)
/* 2AEB4 8003D294 FFFF0831 */  andi       $t0, $t0, 0xFFFF
/* 2AEB8 8003D298 FFFF4630 */  andi       $a2, $v0, 0xFFFF
/* 2AEBC 8003D29C 2530C300 */  or         $a2, $a2, $v1
/* 2AEC0 8003D2A0 24104700 */  and        $v0, $v0, $a3
/* 2AEC4 8003D2A4 25400201 */  or         $t0, $t0, $v0
/* 2AEC8 8003D2A8 1000A784 */  lh         $a3, 0x10($a1)
/* 2AECC 8003D2AC 0000CA48 */  ctc2       $t2, $0 /* handwritten instruction */
/* 2AED0 8003D2B0 0008C948 */  ctc2       $t1, $1 /* handwritten instruction */
/* 2AED4 8003D2B4 0010C648 */  ctc2       $a2, $2 /* handwritten instruction */
/* 2AED8 8003D2B8 0018C848 */  ctc2       $t0, $3 /* handwritten instruction */
/* 2AEDC 8003D2BC 0020C748 */  ctc2       $a3, $4 /* handwritten instruction */
/* 2AEE0 8003D2C0 1400A28C */  lw         $v0, 0x14($a1)
/* 2AEE4 8003D2C4 1800A38C */  lw         $v1, 0x18($a1)
/* 2AEE8 8003D2C8 23100200 */  negu       $v0, $v0
/* 2AEEC 8003D2CC FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 2AEF0 8003D2D0 23180300 */  negu       $v1, $v1
/* 2AEF4 8003D2D4 001C0300 */  sll        $v1, $v1, 16
/* 2AEF8 8003D2D8 25104300 */  or         $v0, $v0, $v1
/* 2AEFC 8003D2DC 00008248 */  mtc2       $v0, $0 /* handwritten instruction */
/* 2AF00 8003D2E0 1C00A28C */  lw         $v0, 0x1C($a1)
/* 2AF04 8003D2E4 00000000 */  nop
/* 2AF08 8003D2E8 23100200 */  negu       $v0, $v0
/* 2AF0C 8003D2EC 00088248 */  mtc2       $v0, $1 /* handwritten instruction */
/* 2AF10 8003D2F0 00000000 */  nop
/* 2AF14 8003D2F4 00000000 */  nop
/* 2AF18 8003D2F8 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 2AF1C 8003D2FC 00008AAC */  sw         $t2, 0x0($a0)
/* 2AF20 8003D300 040089AC */  sw         $t1, 0x4($a0)
/* 2AF24 8003D304 080086AC */  sw         $a2, 0x8($a0)
/* 2AF28 8003D308 0C0088AC */  sw         $t0, 0xC($a0)
/* 2AF2C 8003D30C 100087A4 */  sh         $a3, 0x10($a0)
/* 2AF30 8003D310 14008424 */  addiu      $a0, $a0, 0x14
/* 2AF34 8003D314 000099E8 */  swc2       $25, 0x0($a0)
/* 2AF38 8003D318 04009AE8 */  swc2       $26, 0x4($a0) /* handwritten instruction */
/* 2AF3C 8003D31C 08009BE8 */  swc2       $27, 0x8($a0) /* handwritten instruction */
/* 2AF40 8003D320 0800E003 */  jr         $ra
/* 2AF44 8003D324 00000000 */   nop
.size MATH_HitboxMatrix, . - MATH_HitboxMatrix
