.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel VehTurbo_ProcessBucket
/* 56EA4 80069284 38008010 */  beqz       $a0, .L80069368
/* 56EA8 80069288 BFFF0A24 */   addiu     $t2, $zero, -0x41
/* 56EAC 8006928C 09800B3C */  lui        $t3, %hi(D_8008D2AC)
/* 56EB0 80069290 ACD26B8D */  lw         $t3, %lo(D_8008D2AC)($t3)
.L80069294:
/* 56EB4 80069294 3000828C */  lw         $v0, 0x30($a0)
/* 56EB8 80069298 3400858C */  lw         $a1, 0x34($a0)
/* 56EBC 8006929C 0000468C */  lw         $a2, 0x0($v0)
/* 56EC0 800692A0 0400428C */  lw         $v0, 0x4($v0)
/* 56EC4 800692A4 A81C6391 */  lbu        $v1, 0x1CA8($t3)
/* 56EC8 800692A8 1C00428C */  lw         $v0, 0x1C($v0)
/* 56ECC 800692AC 2A006010 */  beqz       $v1, .L80069358
/* 56ED0 800692B0 21400000 */   addu      $t0, $zero, $zero
/* 56ED4 800692B4 0980093C */  lui        $t1, %hi(D_8008D2AC)
/* 56ED8 800692B8 ACD2298D */  lw         $t1, %lo(D_8008D2AC)($t1)
/* 56EDC 800692BC 2138A000 */  addu       $a3, $a1, $zero
/* 56EE0 800692C0 21284000 */  addu       $a1, $v0, $zero
.L800692C4:
/* 56EE4 800692C4 B800A38C */  lw         $v1, 0xB8($a1)
/* 56EE8 800692C8 00000000 */  nop
/* 56EEC 800692CC 00016230 */  andi       $v0, $v1, 0x100
/* 56EF0 800692D0 1A004014 */  bnez       $v0, .L8006933C
/* 56EF4 800692D4 25186A00 */   or        $v1, $v1, $t2
/* 56EF8 800692D8 B800C28C */  lw         $v0, 0xB8($a2)
/* 56EFC 800692DC 00000000 */  nop
/* 56F00 800692E0 24104300 */  and        $v0, $v0, $v1
/* 56F04 800692E4 B800C2AC */  sw         $v0, 0xB8($a2)
/* 56F08 800692E8 B800A28C */  lw         $v0, 0xB8($a1)
/* 56F0C 800692EC B800E38C */  lw         $v1, 0xB8($a3)
/* 56F10 800692F0 25104A00 */  or         $v0, $v0, $t2
/* 56F14 800692F4 24186200 */  and        $v1, $v1, $v0
/* 56F18 800692F8 B800E3AC */  sw         $v1, 0xB8($a3)
/* 56F1C 800692FC E400A28C */  lw         $v0, 0xE4($a1)
/* 56F20 80069300 00000000 */  nop
/* 56F24 80069304 E400E2AC */  sw         $v0, 0xE4($a3)
/* 56F28 80069308 E400C2AC */  sw         $v0, 0xE4($a2)
/* 56F2C 8006930C E800A28C */  lw         $v0, 0xE8($a1)
/* 56F30 80069310 00000000 */  nop
/* 56F34 80069314 E800E2AC */  sw         $v0, 0xE8($a3)
/* 56F38 80069318 E800C2AC */  sw         $v0, 0xE8($a2)
/* 56F3C 8006931C DC00A294 */  lhu        $v0, 0xDC($a1)
/* 56F40 80069320 00000000 */  nop
/* 56F44 80069324 DC00E2A4 */  sh         $v0, 0xDC($a3)
/* 56F48 80069328 DC00C2A4 */  sh         $v0, 0xDC($a2)
/* 56F4C 8006932C DE00A294 */  lhu        $v0, 0xDE($a1)
/* 56F50 80069330 00000000 */  nop
/* 56F54 80069334 DE00E2A4 */  sh         $v0, 0xDE($a3)
/* 56F58 80069338 DE00C2A4 */  sh         $v0, 0xDE($a2)
.L8006933C:
/* 56F5C 8006933C 8800E724 */  addiu      $a3, $a3, 0x88
/* 56F60 80069340 8800C624 */  addiu      $a2, $a2, 0x88
/* 56F64 80069344 A81C2291 */  lbu        $v0, 0x1CA8($t1)
/* 56F68 80069348 01000825 */  addiu      $t0, $t0, 0x1
/* 56F6C 8006934C 2A100201 */  slt        $v0, $t0, $v0
/* 56F70 80069350 DCFF4014 */  bnez       $v0, .L800692C4
/* 56F74 80069354 8800A524 */   addiu     $a1, $a1, 0x88
.L80069358:
/* 56F78 80069358 1000848C */  lw         $a0, 0x10($a0)
/* 56F7C 8006935C 00000000 */  nop
/* 56F80 80069360 CCFF8014 */  bnez       $a0, .L80069294
/* 56F84 80069364 00000000 */   nop
.L80069368:
/* 56F88 80069368 0800E003 */  jr         $ra
/* 56F8C 8006936C 00000000 */   nop
.size VehTurbo_ProcessBucket, . - VehTurbo_ProcessBucket
