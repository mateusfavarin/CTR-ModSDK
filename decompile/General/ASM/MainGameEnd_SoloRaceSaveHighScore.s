.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel MainGameEnd_SoloRaceSaveHighScore
/* 27ED4 8003A2B4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 27ED8 8003A2B8 4003828F */  lw         $v0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 27EDC 8003A2BC 1800BFAF */  sw         $ra, 0x18($sp)
/* 27EE0 8003A2C0 1400B1AF */  sw         $s1, 0x14($sp)
/* 27EE4 8003A2C4 1000B0AF */  sw         $s0, 0x10($sp)
/* 27EE8 8003A2C8 EC24518C */  lw         $s1, 0x24EC($v0)
/* 27EEC 8003A2CC EAE7000C */  jal        MainGameEnd_SoloRaceGetReward
/* 27EF0 8003A2D0 21200000 */   addu      $a0, $zero, $zero
/* 27EF4 8003A2D4 4003848F */  lw         $a0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 27EF8 8003A2D8 00000000 */  nop
/* 27EFC 8003A2DC 441D838C */  lw         $v1, 0x1D44($a0)
/* 27F00 8003A2E0 0100053C */  lui        $a1, (0x10000 >> 16)
/* 27F04 8003A2E4 24106500 */  and        $v0, $v1, $a1
/* 27F08 8003A2E8 3F004014 */  bnez       $v0, .L8003A3E8
/* 27F0C 8003A2EC 25106500 */   or        $v0, $v1, $a1
/* 27F10 8003A2F0 441D82AC */  sw         $v0, 0x1D44($a0)
/* 27F14 8003A2F4 0004033C */  lui        $v1, (0x4000000 >> 16)
/* 27F18 8003A2F8 24104300 */  and        $v0, $v0, $v1
/* 27F1C 8003A2FC 14004010 */  beqz       $v0, .L8003A350
/* 27F20 8003A300 0880033C */   lui       $v1, %hi(D_80086E84)
/* 27F24 8003A304 0980073C */  lui        $a3, %hi(D_8008D738)
/* 27F28 8003A308 38D7E78C */  lw         $a3, %lo(D_8008D738)($a3)
/* 27F2C 8003A30C 3C1D828C */  lw         $v0, 0x1D3C($a0)
/* 27F30 8003A310 00000000 */  nop
/* 27F34 8003A314 0000E2AC */  sw         $v0, 0x0($a3)
/* 27F38 8003A318 4A002292 */  lbu        $v0, 0x4A($s1)
/* 27F3C 8003A31C 846E6324 */  addiu      $v1, $v1, %lo(D_80086E84)
/* 27F40 8003A320 40100200 */  sll        $v0, $v0, 1
/* 27F44 8003A324 21104300 */  addu       $v0, $v0, $v1
/* 27F48 8003A328 00004294 */  lhu        $v0, 0x0($v0)
/* 27F4C 8003A32C 11000624 */  addiu      $a2, $zero, 0x11
/* 27F50 8003A330 0400E0A0 */  sb         $zero, 0x4($a3)
/* 27F54 8003A334 0980043C */  lui        $a0, %hi(D_8008D738)
/* 27F58 8003A338 38D7848C */  lw         $a0, %lo(D_8008D738)($a0)
/* 27F5C 8003A33C 4003858F */  lw         $a1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 27F60 8003A340 04008424 */  addiu      $a0, $a0, 0x4
/* 27F64 8003A344 541DA524 */  addiu      $a1, $a1, 0x1D54
/* 27F68 8003A348 8EDF010C */  jal        memmove
/* 27F6C 8003A34C 1600E2A4 */   sh        $v0, 0x16($a3)
.L8003A350:
/* 27F70 8003A350 4003828F */  lw         $v0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 27F74 8003A354 00000000 */  nop
/* 27F78 8003A358 491D4480 */  lb         $a0, 0x1D49($v0)
/* 27F7C 8003A35C 00000000 */  nop
/* 27F80 8003A360 21008004 */  bltz       $a0, .L8003A3E8
/* 27F84 8003A364 40100400 */   sll       $v0, $a0, 1
/* 27F88 8003A368 21104400 */  addu       $v0, $v0, $a0
/* 27F8C 8003A36C C0100200 */  sll        $v0, $v0, 3
/* 27F90 8003A370 0980033C */  lui        $v1, %hi(D_8008D738)
/* 27F94 8003A374 38D7638C */  lw         $v1, %lo(D_8008D738)($v1)
/* 27F98 8003A378 18004224 */  addiu      $v0, $v0, 0x18
/* 27F9C 8003A37C 21806200 */  addu       $s0, $v1, $v0
/* 27FA0 8003A380 21188000 */  addu       $v1, $a0, $zero
/* 27FA4 8003A384 04006228 */  slti       $v0, $v1, 0x4
/* 27FA8 8003A388 08004010 */  beqz       $v0, .L8003A3AC
/* 27FAC 8003A38C 18000426 */   addiu     $a0, $s0, 0x18
/* 27FB0 8003A390 21280002 */  addu       $a1, $s0, $zero
/* 27FB4 8003A394 04000224 */  addiu      $v0, $zero, 0x4
/* 27FB8 8003A398 23104300 */  subu       $v0, $v0, $v1
/* 27FBC 8003A39C 40300200 */  sll        $a2, $v0, 1
/* 27FC0 8003A3A0 2130C200 */  addu       $a2, $a2, $v0
/* 27FC4 8003A3A4 8EDF010C */  jal        memmove
/* 27FC8 8003A3A8 C0300600 */   sll       $a2, $a2, 3
.L8003A3AC:
/* 27FCC 8003A3AC 1405228E */  lw         $v0, 0x514($s1)
/* 27FD0 8003A3B0 0880033C */  lui        $v1, %hi(D_80086E84)
/* 27FD4 8003A3B4 000002AE */  sw         $v0, 0x0($s0)
/* 27FD8 8003A3B8 4A002292 */  lbu        $v0, 0x4A($s1)
/* 27FDC 8003A3BC 846E6324 */  addiu      $v1, $v1, %lo(D_80086E84)
/* 27FE0 8003A3C0 40100200 */  sll        $v0, $v0, 1
/* 27FE4 8003A3C4 21104300 */  addu       $v0, $v0, $v1
/* 27FE8 8003A3C8 00004294 */  lhu        $v0, 0x0($v0)
/* 27FEC 8003A3CC 04000426 */  addiu      $a0, $s0, 0x4
/* 27FF0 8003A3D0 040000A2 */  sb         $zero, 0x4($s0)
/* 27FF4 8003A3D4 4003858F */  lw         $a1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 27FF8 8003A3D8 11000624 */  addiu      $a2, $zero, 0x11
/* 27FFC 8003A3DC 541DA524 */  addiu      $a1, $a1, 0x1D54
/* 28000 8003A3E0 8EDF010C */  jal        memmove
/* 28004 8003A3E4 160002A6 */   sh        $v0, 0x16($s0)
.L8003A3E8:
/* 28008 8003A3E8 1800BF8F */  lw         $ra, 0x18($sp)
/* 2800C 8003A3EC 1400B18F */  lw         $s1, 0x14($sp)
/* 28010 8003A3F0 1000B08F */  lw         $s0, 0x10($sp)
/* 28014 8003A3F4 0800E003 */  jr         $ra
/* 28018 8003A3F8 2000BD27 */   addiu     $sp, $sp, 0x20
.size MainGameEnd_SoloRaceSaveHighScore, . - MainGameEnd_SoloRaceSaveHighScore
