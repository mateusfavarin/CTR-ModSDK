.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_80046A90
/* 346B0 80046A90 21308000 */  addu       $a2, $a0, $zero
/* 346B4 80046A94 0A80033C */  lui        $v1, %hi(D_8009AA30)
/* 346B8 80046A98 00240400 */  sll        $a0, $a0, 16
/* 346BC 80046A9C 03240400 */  sra        $a0, $a0, 16
/* 346C0 80046AA0 08000224 */  addiu      $v0, $zero, 0x8
/* 346C4 80046AA4 06008214 */  bne        $a0, $v0, .L80046AC0
/* 346C8 80046AA8 30AA6524 */   addiu     $a1, $v1, %lo(D_8009AA30)
/* 346CC 80046AAC 30AA628C */  lw         $v0, %lo(D_8009AA30)($v1)
/* 346D0 80046AB0 00000000 */  nop
/* 346D4 80046AB4 06004230 */  andi       $v0, $v0, 0x6
/* 346D8 80046AB8 16004014 */  bnez       $v0, .L80046B14
/* 346DC 80046ABC 01000224 */   addiu     $v0, $zero, 0x1
.L80046AC0:
/* 346E0 80046AC0 0000A28C */  lw         $v0, 0x0($a1)
/* 346E4 80046AC4 00000000 */  nop
/* 346E8 80046AC8 06004230 */  andi       $v0, $v0, 0x6
/* 346EC 80046ACC 0F004014 */  bnez       $v0, .L80046B0C
/* 346F0 80046AD0 21200000 */   addu      $a0, $zero, $zero
/* 346F4 80046AD4 0E00A384 */  lh         $v1, 0xE($a1)
/* 346F8 80046AD8 1200A284 */  lh         $v0, 0x12($a1)
/* 346FC 80046ADC 00000000 */  nop
/* 34700 80046AE0 0A006214 */  bne        $v1, $v0, .L80046B0C
/* 34704 80046AE4 00000000 */   nop
/* 34708 80046AE8 1000A384 */  lh         $v1, 0x10($a1)
/* 3470C 80046AEC 1400A284 */  lh         $v0, 0x14($a1)
/* 34710 80046AF0 00000000 */  nop
/* 34714 80046AF4 05006214 */  bne        $v1, $v0, .L80046B0C
/* 34718 80046AF8 00140600 */   sll       $v0, $a2, 16
/* 3471C 80046AFC 0400A384 */  lh         $v1, 0x4($a1)
/* 34720 80046B00 03140200 */  sra        $v0, $v0, 16
/* 34724 80046B04 26186200 */  xor        $v1, $v1, $v0
/* 34728 80046B08 0100642C */  sltiu      $a0, $v1, 0x1
.L80046B0C:
/* 3472C 80046B0C 0800E003 */  jr         $ra
/* 34730 80046B10 21108000 */   addu      $v0, $a0, $zero
.L80046B14:
/* 34734 80046B14 0800E003 */  jr         $ra
/* 34738 80046B18 00000000 */   nop
.size func_80046A90, . - func_80046A90
