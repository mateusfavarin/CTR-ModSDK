.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel INSTANCE_LevDelayedLInBs
/* 1EAF4 80030ED4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1EAF8 80030ED8 1800B2AF */  sw         $s2, 0x18($sp)
/* 1EAFC 80030EDC 2190A000 */  addu       $s2, $a1, $zero
/* 1EB00 80030EE0 1400B1AF */  sw         $s1, 0x14($sp)
/* 1EB04 80030EE4 21880000 */  addu       $s1, $zero, $zero
/* 1EB08 80030EE8 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 1EB0C 80030EEC 1400401A */  blez       $s2, .L80030F40
/* 1EB10 80030EF0 1000B0AF */   sw        $s0, 0x10($sp)
/* 1EB14 80030EF4 2C009024 */  addiu      $s0, $a0, 0x2C
.L80030EF8:
/* 1EB18 80030EF8 E4FF028E */  lw         $v0, -0x1C($s0)
/* 1EB1C 80030EFC 00000000 */  nop
/* 1EB20 80030F00 10004484 */  lh         $a0, 0x10($v0)
/* 1EB24 80030F04 2574000C */  jal        DECOMP_COLL_LevModelMeta
/* 1EB28 80030F08 00000000 */   nop
/* 1EB2C 80030F0C 08004010 */  beqz       $v0, .L80030F30
/* 1EB30 80030F10 00000000 */   nop
/* 1EB34 80030F14 0400428C */  lw         $v0, 0x4($v0)
/* 1EB38 80030F18 00000000 */  nop
/* 1EB3C 80030F1C 04004010 */  beqz       $v0, .L80030F30
/* 1EB40 80030F20 00000000 */   nop
/* 1EB44 80030F24 0000048E */  lw         $a0, 0x0($s0)
/* 1EB48 80030F28 09F84000 */  jalr       $v0
/* 1EB4C 80030F2C 00000000 */   nop
.L80030F30:
/* 1EB50 80030F30 01003126 */  addiu      $s1, $s1, 0x1
/* 1EB54 80030F34 2A103202 */  slt        $v0, $s1, $s2
/* 1EB58 80030F38 EFFF4014 */  bnez       $v0, .L80030EF8
/* 1EB5C 80030F3C 40001026 */   addiu     $s0, $s0, 0x40
.L80030F40:
/* 1EB60 80030F40 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 1EB64 80030F44 1800B28F */  lw         $s2, 0x18($sp)
/* 1EB68 80030F48 1400B18F */  lw         $s1, 0x14($sp)
/* 1EB6C 80030F4C 1000B08F */  lw         $s0, 0x10($sp)
/* 1EB70 80030F50 0800E003 */  jr         $ra
/* 1EB74 80030F54 2000BD27 */   addiu     $sp, $sp, 0x20
.size INSTANCE_LevDelayedLInBs, . - INSTANCE_LevDelayedLInBs
