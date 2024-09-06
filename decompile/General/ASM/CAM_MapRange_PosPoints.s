.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel CAM_MapRange_PosPoints
/* 8E74 8001B254 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8E78 8001B258 2000B0AF */  sw         $s0, 0x20($sp)
/* 8E7C 8001B25C 21808000 */  addu       $s0, $a0, $zero
/* 8E80 8001B260 2800BFAF */  sw         $ra, 0x28($sp)
/* 8E84 8001B264 2400B1AF */  sw         $s1, 0x24($sp)
/* 8E88 8001B268 00000296 */  lhu        $v0, 0x0($s0)
/* 8E8C 8001B26C 0000A394 */  lhu        $v1, 0x0($a1)
/* 8E90 8001B270 00000000 */  nop
/* 8E94 8001B274 23104300 */  subu       $v0, $v0, $v1
/* 8E98 8001B278 1000A2A7 */  sh         $v0, 0x10($sp)
/* 8E9C 8001B27C 02000296 */  lhu        $v0, 0x2($s0)
/* 8EA0 8001B280 0200A394 */  lhu        $v1, 0x2($a1)
/* 8EA4 8001B284 2188C000 */  addu       $s1, $a2, $zero
/* 8EA8 8001B288 23104300 */  subu       $v0, $v0, $v1
/* 8EAC 8001B28C 1200A2A7 */  sh         $v0, 0x12($sp)
/* 8EB0 8001B290 04000296 */  lhu        $v0, 0x4($s0)
/* 8EB4 8001B294 0400A394 */  lhu        $v1, 0x4($a1)
/* 8EB8 8001B298 1000A427 */  addiu      $a0, $sp, 0x10
/* 8EBC 8001B29C 23104300 */  subu       $v0, $v0, $v1
/* 8EC0 8001B2A0 DEF4000C */  jal        MATH_VectorNormalize
/* 8EC4 8001B2A4 1400A2A7 */   sh        $v0, 0x14($sp)
/* 8EC8 8001B2A8 00002296 */  lhu        $v0, 0x0($s1)
/* 8ECC 8001B2AC 00000396 */  lhu        $v1, 0x0($s0)
/* 8ED0 8001B2B0 00000000 */  nop
/* 8ED4 8001B2B4 23104300 */  subu       $v0, $v0, $v1
/* 8ED8 8001B2B8 1800A2A7 */  sh         $v0, 0x18($sp)
/* 8EDC 8001B2BC 02002296 */  lhu        $v0, 0x2($s1)
/* 8EE0 8001B2C0 02000396 */  lhu        $v1, 0x2($s0)
/* 8EE4 8001B2C4 00000000 */  nop
/* 8EE8 8001B2C8 23104300 */  subu       $v0, $v0, $v1
/* 8EEC 8001B2CC 1A00A2A7 */  sh         $v0, 0x1A($sp)
/* 8EF0 8001B2D0 04002296 */  lhu        $v0, 0x4($s1)
/* 8EF4 8001B2D4 04000396 */  lhu        $v1, 0x4($s0)
/* 8EF8 8001B2D8 00000000 */  nop
/* 8EFC 8001B2DC 23104300 */  subu       $v0, $v0, $v1
/* 8F00 8001B2E0 1800A327 */  addiu      $v1, $sp, 0x18
/* 8F04 8001B2E4 1C00A2A7 */  sh         $v0, 0x1C($sp)
/* 8F08 8001B2E8 1000A227 */  addiu      $v0, $sp, 0x10
/* 8F0C 8001B2EC 00004C8C */  lw         $t4, 0x0($v0)
/* 8F10 8001B2F0 04004D84 */  lh         $t5, 0x4($v0)
/* 8F14 8001B2F4 0000CC48 */  ctc2       $t4, $0 /* handwritten instruction */
/* 8F18 8001B2F8 0008CD48 */  ctc2       $t5, $1 /* handwritten instruction */
/* 8F1C 8001B2FC 00006C8C */  lw         $t4, 0x0($v1)
/* 8F20 8001B300 04006D84 */  lh         $t5, 0x4($v1)
/* 8F24 8001B304 00008C48 */  mtc2       $t4, $0 /* handwritten instruction */
/* 8F28 8001B308 00088D48 */  mtc2       $t5, $1 /* handwritten instruction */
/* 8F2C 8001B30C 00000000 */  nop
/* 8F30 8001B310 00000000 */  nop
/* 8F34 8001B314 1260404A */  MVMVA      0, 0, 0, 3, 0
/* 8F38 8001B318 00C80248 */  mfc2       $v0, $25 /* handwritten instruction */
/* 8F3C 8001B31C 2800BF8F */  lw         $ra, 0x28($sp)
/* 8F40 8001B320 2400B18F */  lw         $s1, 0x24($sp)
/* 8F44 8001B324 2000B08F */  lw         $s0, 0x20($sp)
/* 8F48 8001B328 03130200 */  sra        $v0, $v0, 12
/* 8F4C 8001B32C 0800E003 */  jr         $ra
/* 8F50 8001B330 3000BD27 */   addiu     $sp, $sp, 0x30
.size CAM_MapRange_PosPoints, . - CAM_MapRange_PosPoints
