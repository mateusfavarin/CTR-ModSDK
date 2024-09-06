.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel SelectProfile_ThTick
/* 35A1C 80047DFC C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 35A20 80047E00 3000BFAF */  sw         $ra, 0x30($sp)
/* 35A24 80047E04 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 35A28 80047E08 2800B4AF */  sw         $s4, 0x28($sp)
/* 35A2C 80047E0C 2400B3AF */  sw         $s3, 0x24($sp)
/* 35A30 80047E10 2000B2AF */  sw         $s2, 0x20($sp)
/* 35A34 80047E14 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 35A38 80047E18 1800B0AF */  sw         $s0, 0x18($sp)
/* 35A3C 80047E1C 3000828C */  lw         $v0, 0x30($a0)
/* 35A40 80047E20 21A00000 */  addu       $s4, $zero, $zero
/* 35A44 80047E24 0400538C */  lw         $s3, 0x4($v0)
/* 35A48 80047E28 0880023C */  lui        $v0, %hi(D_80085C64)
/* 35A4C 80047E2C 645C5524 */  addiu      $s5, $v0, %lo(D_80085C64)
/* 35A50 80047E30 04007226 */  addiu      $s2, $s3, 0x4
.L80047E34:
/* 35A54 80047E34 5555033C */  lui        $v1, (0x55555556 >> 16)
/* 35A58 80047E38 56556334 */  ori        $v1, $v1, (0x55555556 & 0xFFFF)
/* 35A5C 80047E3C 00141400 */  sll        $v0, $s4, 16
/* 35A60 80047E40 038C0200 */  sra        $s1, $v0, 16
/* 35A64 80047E44 18002302 */  mult       $s1, $v1
/* 35A68 80047E48 C3170200 */  sra        $v0, $v0, 31
/* 35A6C 80047E4C 10380000 */  mfhi       $a3
/* 35A70 80047E50 2310E200 */  subu       $v0, $a3, $v0
/* 35A74 80047E54 40800200 */  sll        $s0, $v0, 1
/* 35A78 80047E58 21800202 */  addu       $s0, $s0, $v0
/* 35A7C 80047E5C 23803002 */  subu       $s0, $s1, $s0
/* 35A80 80047E60 00841000 */  sll        $s0, $s0, 16
/* 35A84 80047E64 03841000 */  sra        $s0, $s0, 16
/* 35A88 80047E68 40181000 */  sll        $v1, $s0, 1
/* 35A8C 80047E6C 0980023C */  lui        $v0, %hi(D_8008D47C)
/* 35A90 80047E70 7CD44224 */  addiu      $v0, $v0, %lo(D_8008D47C)
/* 35A94 80047E74 21186200 */  addu       $v1, $v1, $v0
/* 35A98 80047E78 02004296 */  lhu        $v0, 0x2($s2)
/* 35A9C 80047E7C 00006394 */  lhu        $v1, 0x0($v1)
/* 35AA0 80047E80 00000000 */  nop
/* 35AA4 80047E84 21104300 */  addu       $v0, $v0, $v1
/* 35AA8 80047E88 020042A6 */  sh         $v0, 0x2($s2)
/* 35AAC 80047E8C 0000648E */  lw         $a0, 0x0($s3)
/* 35AB0 80047E90 21284002 */  addu       $a1, $s2, $zero
/* 35AB4 80047E94 A9B0010C */  jal        ConvertRotToMatrix
/* 35AB8 80047E98 30008424 */   addiu     $a0, $a0, 0x30
/* 35ABC 80047E9C 01000224 */  addiu      $v0, $zero, 0x1
/* 35AC0 80047EA0 10000212 */  beq        $s0, $v0, .L80047EE4
/* 35AC4 80047EA4 C0101100 */   sll       $v0, $s1, 3
/* 35AC8 80047EA8 23105100 */  subu       $v0, $v0, $s1
/* 35ACC 80047EAC 40100200 */  sll        $v0, $v0, 1
/* 35AD0 80047EB0 21105500 */  addu       $v0, $v0, $s5
/* 35AD4 80047EB4 04004394 */  lhu        $v1, 0x4($v0)
/* 35AD8 80047EB8 00000000 */  nop
/* 35ADC 80047EBC 1000A3A7 */  sh         $v1, 0x10($sp)
/* 35AE0 80047EC0 06004394 */  lhu        $v1, 0x6($v0)
/* 35AE4 80047EC4 00000000 */  nop
/* 35AE8 80047EC8 1200A3A7 */  sh         $v1, 0x12($sp)
/* 35AEC 80047ECC 08004294 */  lhu        $v0, 0x8($v0)
/* 35AF0 80047ED0 21284002 */  addu       $a1, $s2, $zero
/* 35AF4 80047ED4 1400A2A7 */  sh         $v0, 0x14($sp)
/* 35AF8 80047ED8 0000648E */  lw         $a0, 0x0($s3)
/* 35AFC 80047EDC 075D010C */  jal        Vector_SpecLightSpin3D
/* 35B00 80047EE0 1000A627 */   addiu     $a2, $sp, 0x10
.L80047EE4:
/* 35B04 80047EE4 01009426 */  addiu      $s4, $s4, 0x1
/* 35B08 80047EE8 0C005226 */  addiu      $s2, $s2, 0xC
/* 35B0C 80047EEC FFFF8232 */  andi       $v0, $s4, 0xFFFF
/* 35B10 80047EF0 0C00422C */  sltiu      $v0, $v0, 0xC
/* 35B14 80047EF4 CFFF4014 */  bnez       $v0, .L80047E34
/* 35B18 80047EF8 0C007326 */   addiu     $s3, $s3, 0xC
/* 35B1C 80047EFC 3000BF8F */  lw         $ra, 0x30($sp)
/* 35B20 80047F00 2C00B58F */  lw         $s5, 0x2C($sp)
/* 35B24 80047F04 2800B48F */  lw         $s4, 0x28($sp)
/* 35B28 80047F08 2400B38F */  lw         $s3, 0x24($sp)
/* 35B2C 80047F0C 2000B28F */  lw         $s2, 0x20($sp)
/* 35B30 80047F10 1C00B18F */  lw         $s1, 0x1C($sp)
/* 35B34 80047F14 1800B08F */  lw         $s0, 0x18($sp)
/* 35B38 80047F18 0800E003 */  jr         $ra
/* 35B3C 80047F1C 3800BD27 */   addiu     $sp, $sp, 0x38
.size SelectProfile_ThTick, . - SelectProfile_ThTick
