.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel CAM_StartLine_FlyIn_FixY
/* 6AE0 80018EC0 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 6AE4 80018EC4 3000B2AF */  sw         $s2, 0x30($sp)
/* 6AE8 80018EC8 21908000 */  addu       $s2, $a0, $zero
/* 6AEC 80018ECC 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 6AF0 80018ED0 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 6AF4 80018ED4 0980033C */  lui        $v1, %hi(D_8008DB1C)
/* 6AF8 80018ED8 3400BFAF */  sw         $ra, 0x34($sp)
/* 6AFC 80018EDC 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 6B00 80018EE0 2800B0AF */  sw         $s0, 0x28($sp)
/* 6B04 80018EE4 6001428C */  lw         $v0, 0x160($v0)
/* 6B08 80018EE8 1CDB6324 */  addiu      $v1, $v1, %lo(D_8008DB1C)
/* 6B0C 80018EEC 0000448C */  lw         $a0, 0x0($v0)
/* 6B10 80018EF0 00300224 */  addiu      $v0, $zero, 0x3000
/* 6B14 80018EF4 240062AC */  sw         $v0, 0x24($v1)
/* 6B18 80018EF8 02000224 */  addiu      $v0, $zero, 0x2
/* 6B1C 80018EFC 280060AC */  sw         $zero, 0x28($v1)
/* 6B20 80018F00 220062A4 */  sh         $v0, 0x22($v1)
/* 6B24 80018F04 2C0064AC */  sw         $a0, 0x2C($v1)
/* 6B28 80018F08 00004296 */  lhu        $v0, 0x0($s2)
/* 6B2C 80018F0C 00000000 */  nop
/* 6B30 80018F10 1000A2A7 */  sh         $v0, 0x10($sp)
/* 6B34 80018F14 02004296 */  lhu        $v0, 0x2($s2)
/* 6B38 80018F18 21880000 */  addu       $s1, $zero, $zero
/* 6B3C 80018F1C 1200A2A7 */  sh         $v0, 0x12($sp)
/* 6B40 80018F20 04004296 */  lhu        $v0, 0x4($s2)
/* 6B44 80018F24 21806000 */  addu       $s0, $v1, $zero
/* 6B48 80018F28 1400A2A7 */  sh         $v0, 0x14($sp)
/* 6B4C 80018F2C 001C1100 */  sll        $v1, $s1, 16
.L80018F30:
/* 6B50 80018F30 83190300 */  sra        $v1, $v1, 6
/* 6B54 80018F34 00046224 */  addiu      $v0, $v1, 0x400
/* 6B58 80018F38 00FF6324 */  addiu      $v1, $v1, -0x100
/* 6B5C 80018F3C 21380000 */  addu       $a3, $zero, $zero
/* 6B60 80018F40 1000A697 */  lhu        $a2, 0x10($sp)
/* 6B64 80018F44 1200A497 */  lhu        $a0, 0x12($sp)
/* 6B68 80018F48 1400A597 */  lhu        $a1, 0x14($sp)
/* 6B6C 80018F4C 23108200 */  subu       $v0, $a0, $v0
/* 6B70 80018F50 23208300 */  subu       $a0, $a0, $v1
/* 6B74 80018F54 2200A4A7 */  sh         $a0, 0x22($sp)
/* 6B78 80018F58 1800A427 */  addiu      $a0, $sp, 0x18
/* 6B7C 80018F5C 1C00A5A7 */  sh         $a1, 0x1C($sp)
/* 6B80 80018F60 2400A5A7 */  sh         $a1, 0x24($sp)
/* 6B84 80018F64 2000A527 */  addiu      $a1, $sp, 0x20
/* 6B88 80018F68 1800A6A7 */  sh         $a2, 0x18($sp)
/* 6B8C 80018F6C 2000A6A7 */  sh         $a2, 0x20($sp)
/* 6B90 80018F70 21300002 */  addu       $a2, $s0, $zero
/* 6B94 80018F74 C37A000C */  jal        COLL_SearchTree_FindQuadblock_Touching
/* 6B98 80018F78 1A00A2A7 */   sh        $v0, 0x1A($sp)
/* 6B9C 80018F7C 3E000286 */  lh         $v0, 0x3E($s0)
/* 6BA0 80018F80 00000000 */  nop
/* 6BA4 80018F84 08004010 */  beqz       $v0, .L80018FA8
/* 6BA8 80018F88 01002226 */   addiu     $v0, $s1, 0x1
/* 6BAC 80018F8C 1C000296 */  lhu        $v0, 0x1C($s0)
/* 6BB0 80018F90 1E000396 */  lhu        $v1, 0x1E($s0)
/* 6BB4 80018F94 20000496 */  lhu        $a0, 0x20($s0)
/* 6BB8 80018F98 1000A2A7 */  sh         $v0, 0x10($sp)
/* 6BBC 80018F9C 1200A3A7 */  sh         $v1, 0x12($sp)
/* 6BC0 80018FA0 F0630008 */  j          .L80018FC0
/* 6BC4 80018FA4 1400A4A7 */   sh        $a0, 0x14($sp)
.L80018FA8:
/* 6BC8 80018FA8 21884000 */  addu       $s1, $v0, $zero
/* 6BCC 80018FAC 00140200 */  sll        $v0, $v0, 16
/* 6BD0 80018FB0 03140200 */  sra        $v0, $v0, 16
/* 6BD4 80018FB4 08004228 */  slti       $v0, $v0, 0x8
/* 6BD8 80018FB8 DDFF4014 */  bnez       $v0, .L80018F30
/* 6BDC 80018FBC 001C1100 */   sll       $v1, $s1, 16
.L80018FC0:
/* 6BE0 80018FC0 1200A297 */  lhu        $v0, 0x12($sp)
/* 6BE4 80018FC4 00000000 */  nop
/* 6BE8 80018FC8 020042A6 */  sh         $v0, 0x2($s2)
/* 6BEC 80018FCC 0980023C */  lui        $v0, %hi(D_8008DB1C)
/* 6BF0 80018FD0 3400BF8F */  lw         $ra, 0x34($sp)
/* 6BF4 80018FD4 3000B28F */  lw         $s2, 0x30($sp)
/* 6BF8 80018FD8 2C00B18F */  lw         $s1, 0x2C($sp)
/* 6BFC 80018FDC 2800B08F */  lw         $s0, 0x28($sp)
/* 6C00 80018FE0 1CDB4224 */  addiu      $v0, $v0, %lo(D_8008DB1C)
/* 6C04 80018FE4 0800E003 */  jr         $ra
/* 6C08 80018FE8 3800BD27 */   addiu     $sp, $sp, 0x38
.size CAM_StartLine_FlyIn_FixY, . - CAM_StartLine_FlyIn_FixY
