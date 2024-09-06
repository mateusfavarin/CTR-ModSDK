.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel MATH_FastSqrt
/* 2AE34 8003D214 21380000 */  addu       $a3, $zero, $zero
/* 2AE38 8003D218 2118E000 */  addu       $v1, $a3, $zero
/* 2AE3C 8003D21C 43280500 */  sra        $a1, $a1, 1
/* 2AE40 8003D220 0F00A524 */  addiu      $a1, $a1, 0xF
.L8003D224:
/* 2AE44 8003D224 80180300 */  sll        $v1, $v1, 2
/* 2AE48 8003D228 82170400 */  srl        $v0, $a0, 30
/* 2AE4C 8003D22C 25186200 */  or         $v1, $v1, $v0
/* 2AE50 8003D230 40380700 */  sll        $a3, $a3, 1
/* 2AE54 8003D234 40100700 */  sll        $v0, $a3, 1
/* 2AE58 8003D238 01004624 */  addiu      $a2, $v0, 0x1
/* 2AE5C 8003D23C 2B106600 */  sltu       $v0, $v1, $a2
/* 2AE60 8003D240 03004014 */  bnez       $v0, .L8003D250
/* 2AE64 8003D244 80200400 */   sll       $a0, $a0, 2
/* 2AE68 8003D248 23186600 */  subu       $v1, $v1, $a2
/* 2AE6C 8003D24C 0100E724 */  addiu      $a3, $a3, 0x1
.L8003D250:
/* 2AE70 8003D250 2110A000 */  addu       $v0, $a1, $zero
/* 2AE74 8003D254 F3FF4014 */  bnez       $v0, .L8003D224
/* 2AE78 8003D258 FFFFA524 */   addiu     $a1, $a1, -0x1
/* 2AE7C 8003D25C 0800E003 */  jr         $ra
/* 2AE80 8003D260 2110E000 */   addu      $v0, $a3, $zero
.size MATH_FastSqrt, . - MATH_FastSqrt
