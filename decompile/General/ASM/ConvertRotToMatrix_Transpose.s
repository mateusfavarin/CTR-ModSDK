.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel ConvertRotToMatrix_Transpose
/* 59F98 8006C378 801F013C */  lui        $at, (0x1F80002C >> 16)
/* 59F9C 8006C37C 000030AC */  sw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 59FA0 8006C380 040031AC */  sw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 59FA4 8006C384 080032AC */  sw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 59FA8 8006C388 0C0033AC */  sw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 59FAC 8006C38C 100034AC */  sw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 59FB0 8006C390 2C003FAC */  sw         $ra, (0x1F80002C & 0xFFFF)($at)
/* 59FB4 8006C394 0000B384 */  lh         $s3, 0x0($a1)
/* 59FB8 8006C398 0400B084 */  lh         $s0, 0x4($a1)
/* 59FBC 8006C39C 0200B484 */  lh         $s4, 0x2($a1)
/* 59FC0 8006C3A0 22981300 */  neg        $s3, $s3 /* handwritten instruction */
/* 59FC4 8006C3A4 22801000 */  neg        $s0, $s0 /* handwritten instruction */
/* 59FC8 8006C3A8 93FF0104 */  bgez       $zero, .L8006C1F8
/* 59FCC 8006C3AC 22A01400 */   neg       $s4, $s4 /* handwritten instruction */
.size ConvertRotToMatrix_Transpose, . - ConvertRotToMatrix_Transpose
