.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel MATH_MatrixMul
/* 2B080 8003D460 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2B084 8003D464 1000B0AF */  sw         $s0, 0x10($sp)
/* 2B088 8003D468 21808000 */  addu       $s0, $a0, $zero
/* 2B08C 8003D46C 1800B2AF */  sw         $s2, 0x18($sp)
/* 2B090 8003D470 2190A000 */  addu       $s2, $a1, $zero
/* 2B094 8003D474 1400B1AF */  sw         $s1, 0x14($sp)
/* 2B098 8003D478 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 2B09C 8003D47C ECB0010C */  jal        MatrixRotate
/* 2B0A0 8003D480 2188C000 */   addu      $s1, $a2, $zero
/* 2B0A4 8003D484 14002426 */  addiu      $a0, $s1, 0x14
/* 2B0A8 8003D488 BCB1010C */  jal        ApplyMatrixLV_stub
/* 2B0AC 8003D48C 14000526 */   addiu     $a1, $s0, 0x14
/* 2B0B0 8003D490 1400028E */  lw         $v0, 0x14($s0)
/* 2B0B4 8003D494 1400438E */  lw         $v1, 0x14($s2)
/* 2B0B8 8003D498 00000000 */  nop
/* 2B0BC 8003D49C 21104300 */  addu       $v0, $v0, $v1
/* 2B0C0 8003D4A0 140002AE */  sw         $v0, 0x14($s0)
/* 2B0C4 8003D4A4 1800028E */  lw         $v0, 0x18($s0)
/* 2B0C8 8003D4A8 1800438E */  lw         $v1, 0x18($s2)
/* 2B0CC 8003D4AC 00000000 */  nop
/* 2B0D0 8003D4B0 21104300 */  addu       $v0, $v0, $v1
/* 2B0D4 8003D4B4 180002AE */  sw         $v0, 0x18($s0)
/* 2B0D8 8003D4B8 1C00028E */  lw         $v0, 0x1C($s0)
/* 2B0DC 8003D4BC 1C00438E */  lw         $v1, 0x1C($s2)
/* 2B0E0 8003D4C0 00000000 */  nop
/* 2B0E4 8003D4C4 21104300 */  addu       $v0, $v0, $v1
/* 2B0E8 8003D4C8 1C0002AE */  sw         $v0, 0x1C($s0)
/* 2B0EC 8003D4CC 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 2B0F0 8003D4D0 1800B28F */  lw         $s2, 0x18($sp)
/* 2B0F4 8003D4D4 1400B18F */  lw         $s1, 0x14($sp)
/* 2B0F8 8003D4D8 1000B08F */  lw         $s0, 0x10($sp)
/* 2B0FC 8003D4DC 0800E003 */  jr         $ra
/* 2B100 8003D4E0 2000BD27 */   addiu     $sp, $sp, 0x20
.size MATH_MatrixMul, . - MATH_MatrixMul
