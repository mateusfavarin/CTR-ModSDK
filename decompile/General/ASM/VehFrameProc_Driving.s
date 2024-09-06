.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel VehFrameProc_Driving
/* 48D98 8005B178 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 48D9C 8005B17C 2400B3AF */  sw         $s3, 0x24($sp)
/* 48DA0 8005B180 2198A000 */  addu       $s3, $a1, $zero
/* 48DA4 8005B184 2000B2AF */  sw         $s2, 0x20($sp)
/* 48DA8 8005B188 2800BFAF */  sw         $ra, 0x28($sp)
/* 48DAC 8005B18C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 48DB0 8005B190 1800B0AF */  sw         $s0, 0x18($sp)
/* 48DB4 8005B194 1800628E */  lw         $v0, 0x18($s3)
/* 48DB8 8005B198 3400918C */  lw         $s1, 0x34($a0)
/* 48DBC 8005B19C 1E004014 */  bnez       $v0, .L8005B218
/* 48DC0 8005B1A0 21900000 */   addu      $s2, $zero, $zero
/* 48DC4 8005B1A4 76036392 */  lbu        $v1, 0x376($s3)
/* 48DC8 8005B1A8 0A000224 */  addiu      $v0, $zero, 0xA
/* 48DCC 8005B1AC 1A006210 */  beq        $v1, $v0, .L8005B218
/* 48DD0 8005B1B0 00000000 */   nop
/* 48DD4 8005B1B4 9E036286 */  lh         $v0, 0x39E($s3)
/* 48DD8 8005B1B8 00000000 */  nop
/* 48DDC 8005B1BC 04004104 */  bgez       $v0, .L8005B1D0
/* 48DE0 8005B1C0 00000000 */   nop
/* 48DE4 8005B1C4 8E036286 */  lh         $v0, 0x38E($s3)
/* 48DE8 8005B1C8 00000000 */  nop
/* 48DEC 8005B1CC 01005228 */  slti       $s2, $v0, 0x1
.L8005B1D0:
/* 48DF0 8005B1D0 90036286 */  lh         $v0, 0x390($s3)
/* 48DF4 8005B1D4 00000000 */  nop
/* 48DF8 8005B1D8 01064228 */  slti       $v0, $v0, 0x601
/* 48DFC 8005B1DC 05004010 */  beqz       $v0, .L8005B1F4
/* 48E00 8005B1E0 03000224 */   addiu     $v0, $zero, 0x3
/* 48E04 8005B1E4 52002392 */  lbu        $v1, 0x52($s1)
/* 48E08 8005B1E8 00000000 */  nop
/* 48E0C 8005B1EC 0A006214 */  bne        $v1, $v0, .L8005B218
/* 48E10 8005B1F0 00000000 */   nop
.L8005B1F4:
/* 48E14 8005B1F4 D802628E */  lw         $v0, 0x2D8($s3)
/* 48E18 8005B1F8 D002638E */  lw         $v1, 0x2D0($s3)
/* 48E1C 8005B1FC 00000000 */  nop
/* 48E20 8005B200 23104300 */  subu       $v0, $v0, $v1
/* 48E24 8005B204 00800334 */  ori        $v1, $zero, 0x8000
/* 48E28 8005B208 2A186200 */  slt        $v1, $v1, $v0
/* 48E2C 8005B20C 02006010 */  beqz       $v1, .L8005B218
/* 48E30 8005B210 00000000 */   nop
/* 48E34 8005B214 03001224 */  addiu      $s2, $zero, 0x3
.L8005B218:
/* 48E38 8005B218 52002592 */  lbu        $a1, 0x52($s1)
/* 48E3C 8005B21C 3D6C010C */  jal        DECOMP_VehFrameInst_GetNumAnimFrames
/* 48E40 8005B220 21202002 */   addu      $a0, $s1, $zero
/* 48E44 8005B224 21804000 */  addu       $s0, $v0, $zero
/* 48E48 8005B228 B200001A */  blez       $s0, .L8005B4F4
/* 48E4C 8005B22C 00000000 */   nop
/* 48E50 8005B230 52002592 */  lbu        $a1, 0x52($s1)
/* 48E54 8005B234 00000000 */  nop
/* 48E58 8005B238 77004516 */  bne        $s2, $a1, .L8005B418
/* 48E5C 8005B23C 02000224 */   addiu     $v0, $zero, 0x2
.L8005B240:
/* 48E60 8005B240 05004012 */  beqz       $s2, .L8005B258
/* 48E64 8005B244 03000224 */   addiu     $v0, $zero, 0x3
/* 48E68 8005B248 52004212 */  beq        $s2, $v0, .L8005B394
/* 48E6C 8005B24C 01000524 */   addiu     $a1, $zero, 0x1
/* 48E70 8005B250 016D0108 */  j          .L8005B404
/* 48E74 8005B254 FFFF0626 */   addiu     $a2, $s0, -0x1
.L8005B258:
/* 48E78 8005B258 1800628E */  lw         $v0, 0x18($s3)
/* 48E7C 8005B25C 00000000 */  nop
/* 48E80 8005B260 03004010 */  beqz       $v0, .L8005B270
/* 48E84 8005B264 00000000 */   nop
/* 48E88 8005B268 E16C0108 */  j          .L8005B384
/* 48E8C 8005B26C 43801000 */   sra       $s0, $s0, 1
.L8005B270:
/* 48E90 8005B270 02046296 */  lhu        $v0, 0x402($s3)
/* 48E94 8005B274 00000000 */  nop
/* 48E98 8005B278 00240200 */  sll        $a0, $v0, 16
/* 48E9C 8005B27C 03140400 */  sra        $v0, $a0, 16
/* 48EA0 8005B280 2A004010 */  beqz       $v0, .L8005B32C
/* 48EA4 8005B284 E0014228 */   slti      $v0, $v0, 0x1E0
/* 48EA8 8005B288 28004010 */  beqz       $v0, .L8005B32C
/* 48EAC 8005B28C 6666033C */   lui       $v1, (0x66666667 >> 16)
/* 48EB0 8005B290 67666334 */  ori        $v1, $v1, (0x66666667 & 0xFFFF)
/* 48EB4 8005B294 43150400 */  sra        $v0, $a0, 21
/* 48EB8 8005B298 00140200 */  sll        $v0, $v0, 16
/* 48EBC 8005B29C 032C0200 */  sra        $a1, $v0, 16
/* 48EC0 8005B2A0 1800A300 */  mult       $a1, $v1
/* 48EC4 8005B2A4 21200000 */  addu       $a0, $zero, $zero
/* 48EC8 8005B2A8 C3170200 */  sra        $v0, $v0, 31
/* 48ECC 8005B2AC 0980063C */  lui        $a2, %hi(D_80089974)
/* 48ED0 8005B2B0 10400000 */  mfhi       $t0
/* 48ED4 8005B2B4 43180800 */  sra        $v1, $t0, 1
/* 48ED8 8005B2B8 23186200 */  subu       $v1, $v1, $v0
/* 48EDC 8005B2BC 80100300 */  sll        $v0, $v1, 2
/* 48EE0 8005B2C0 21104300 */  addu       $v0, $v0, $v1
/* 48EE4 8005B2C4 2328A200 */  subu       $a1, $a1, $v0
/* 48EE8 8005B2C8 002C0500 */  sll        $a1, $a1, 16
/* 48EEC 8005B2CC 832B0500 */  sra        $a1, $a1, 14
/* 48EF0 8005B2D0 F8FFA524 */  addiu      $a1, $a1, -0x8
/* 48EF4 8005B2D4 43101000 */  sra        $v0, $s0, 1
/* 48EF8 8005B2D8 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 48EFC 8005B2DC ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 48F00 8005B2E0 2180A200 */  addu       $s0, $a1, $v0
/* 48F04 8005B2E4 540030A6 */  sh         $s0, 0x54($s1)
/* 48F08 8005B2E8 1821658C */  lw         $a1, 0x2118($v1)
/* 48F0C 8005B2EC C200010C */  jal        Particle_Init
/* 48F10 8005B2F0 7499C624 */   addiu     $a2, $a2, %lo(D_80089974)
/* 48F14 8005B2F4 21184000 */  addu       $v1, $v0, $zero
/* 48F18 8005B2F8 23006010 */  beqz       $v1, .L8005B388
/* 48F1C 8005B2FC 01000524 */   addiu     $a1, $zero, 0x1
/* 48F20 8005B300 1C00628E */  lw         $v0, 0x1C($s3)
/* 48F24 8005B304 00000000 */  nop
/* 48F28 8005B308 50004290 */  lbu        $v0, 0x50($v0)
/* 48F2C 8005B30C 00000000 */  nop
/* 48F30 8005B310 180062A0 */  sb         $v0, 0x18($v1)
/* 48F34 8005B314 1C00628E */  lw         $v0, 0x1C($s3)
/* 48F38 8005B318 00000000 */  nop
/* 48F3C 8005B31C 200062AC */  sw         $v0, 0x20($v1)
/* 48F40 8005B320 4A006292 */  lbu        $v0, 0x4A($s3)
/* 48F44 8005B324 E26C0108 */  j          .L8005B388
/* 48F48 8005B328 190062A0 */   sb        $v0, 0x19($v1)
.L8005B32C:
/* 48F4C 8005B32C C802628E */  lw         $v0, 0x2C8($s3)
/* 48F50 8005B330 00000000 */  nop
/* 48F54 8005B334 08004230 */  andi       $v0, $v0, 0x8
/* 48F58 8005B338 08004010 */  beqz       $v0, .L8005B35C
/* 48F5C 8005B33C C0FF0524 */   addiu     $a1, $zero, -0x40
/* 48F60 8005B340 40000624 */  addiu      $a2, $zero, 0x40
/* 48F64 8005B344 21380000 */  addu       $a3, $zero, $zero
/* 48F68 8005B348 C0006486 */  lh         $a0, 0xC0($s3)
/* 48F6C 8005B34C FFFF0226 */  addiu      $v0, $s0, -0x1
/* 48F70 8005B350 1000A2AF */  sw         $v0, 0x10($sp)
/* 48F74 8005B354 DE6C0108 */  j          .L8005B378
/* 48F78 8005B358 23200400 */   negu      $a0, $a0
.L8005B35C:
/* 48F7C 8005B35C 21380000 */  addu       $a3, $zero, $zero
/* 48F80 8005B360 4B006482 */  lb         $a0, 0x4B($s3)
/* 48F84 8005B364 3A046692 */  lbu        $a2, 0x43A($s3)
/* 48F88 8005B368 FFFF0226 */  addiu      $v0, $s0, -0x1
/* 48F8C 8005B36C 1000A2AF */  sw         $v0, 0x10($sp)
/* 48F90 8005B370 23200400 */  negu       $a0, $a0
/* 48F94 8005B374 23280600 */  negu       $a1, $a2
.L8005B378:
/* 48F98 8005B378 E763010C */  jal        DECOMP_VehCalc_MapToRange
/* 48F9C 8005B37C 00000000 */   nop
/* 48FA0 8005B380 21804000 */  addu       $s0, $v0, $zero
.L8005B384:
/* 48FA4 8005B384 01000524 */  addiu      $a1, $zero, 0x1
.L8005B388:
/* 48FA8 8005B388 54002486 */  lh         $a0, 0x54($s1)
/* 48FAC 8005B38C 026D0108 */  j          .L8005B408
/* 48FB0 8005B390 21300002 */   addu      $a2, $s0, $zero
.L8005B394:
/* 48FB4 8005B394 54002486 */  lh         $a0, 0x54($s1)
/* 48FB8 8005B398 D563010C */  jal        DECOMP_VehCalc_InterpBySpeed
/* 48FBC 8005B39C FFFF0626 */   addiu     $a2, $s0, -0x1
/* 48FC0 8005B3A0 540022A6 */  sh         $v0, 0x54($s1)
/* 48FC4 8005B3A4 76036392 */  lbu        $v1, 0x376($s3)
/* 48FC8 8005B3A8 05000224 */  addiu      $v0, $zero, 0x5
/* 48FCC 8005B3AC 51006210 */  beq        $v1, $v0, .L8005B4F4
/* 48FD0 8005B3B0 0880023C */   lui       $v0, %hi(D_80086E84)
/* 48FD4 8005B3B4 4A006392 */  lbu        $v1, 0x4A($s3)
/* 48FD8 8005B3B8 846E4224 */  addiu      $v0, $v0, %lo(D_80086E84)
/* 48FDC 8005B3BC 40180300 */  sll        $v1, $v1, 1
/* 48FE0 8005B3C0 21186200 */  addu       $v1, $v1, $v0
/* 48FE4 8005B3C4 00006384 */  lh         $v1, 0x0($v1)
/* 48FE8 8005B3C8 0D000224 */  addiu      $v0, $zero, 0xD
/* 48FEC 8005B3CC 02006214 */  bne        $v1, $v0, .L8005B3D8
/* 48FF0 8005B3D0 0E000224 */   addiu     $v0, $zero, 0xE
/* 48FF4 8005B3D4 03000324 */  addiu      $v1, $zero, 0x3
.L8005B3D8:
/* 48FF8 8005B3D8 02006214 */  bne        $v1, $v0, .L8005B3E4
/* 48FFC 8005B3DC 0F000224 */   addiu     $v0, $zero, 0xF
/* 49000 8005B3E0 21180000 */  addu       $v1, $zero, $zero
.L8005B3E4:
/* 49004 8005B3E4 03006214 */  bne        $v1, $v0, .L8005B3F4
/* 49008 8005B3E8 07006224 */   addiu     $v0, $v1, 0x7
/* 4900C 8005B3EC 21180000 */  addu       $v1, $zero, $zero
/* 49010 8005B3F0 07006224 */  addiu      $v0, $v1, 0x7
.L8005B3F4:
/* 49014 8005B3F4 4C0062A2 */  sb         $v0, 0x4C($s3)
/* 49018 8005B3F8 54002292 */  lbu        $v0, 0x54($s1)
/* 4901C 8005B3FC 3D6D0108 */  j          .L8005B4F4
/* 49020 8005B400 4D0062A2 */   sb        $v0, 0x4D($s3)
.L8005B404:
/* 49024 8005B404 54002486 */  lh         $a0, 0x54($s1)
.L8005B408:
/* 49028 8005B408 D563010C */  jal        DECOMP_VehCalc_InterpBySpeed
/* 4902C 8005B40C 00000000 */   nop
/* 49030 8005B410 3D6D0108 */  j          .L8005B4F4
/* 49034 8005B414 540022A6 */   sh        $v0, 0x54($s1)
.L8005B418:
/* 49038 8005B418 0500A214 */  bne        $a1, $v0, .L8005B430
/* 4903C 8005B41C 2120A000 */   addu      $a0, $a1, $zero
/* 49040 8005B420 3D6C010C */  jal        DECOMP_VehFrameInst_GetNumAnimFrames
/* 49044 8005B424 21202002 */   addu      $a0, $s1, $zero
/* 49048 8005B428 0F6D0108 */  j          .L8005B43C
/* 4904C 8005B42C FFFF5024 */   addiu     $s0, $v0, -0x1
.L8005B430:
/* 49050 8005B430 316C010C */  jal        DECOMP_VehFrameInst_GetStartFrame
/* 49054 8005B434 21280002 */   addu      $a1, $s0, $zero
/* 49058 8005B438 21804000 */  addu       $s0, $v0, $zero
.L8005B43C:
/* 4905C 8005B43C 54002286 */  lh         $v0, 0x54($s1)
/* 49060 8005B440 00000000 */  nop
/* 49064 8005B444 0D005014 */  bne        $v0, $s0, .L8005B47C
/* 49068 8005B448 21202002 */   addu      $a0, $s1, $zero
/* 4906C 8005B44C 3D6C010C */  jal        DECOMP_VehFrameInst_GetNumAnimFrames
/* 49070 8005B450 21284002 */   addu      $a1, $s2, $zero
/* 49074 8005B454 21804000 */  addu       $s0, $v0, $zero
/* 49078 8005B458 2600001A */  blez       $s0, .L8005B4F4
/* 4907C 8005B45C 21204002 */   addu      $a0, $s2, $zero
/* 49080 8005B460 21280002 */  addu       $a1, $s0, $zero
/* 49084 8005B464 316C010C */  jal        DECOMP_VehFrameInst_GetStartFrame
/* 49088 8005B468 520032A2 */   sb        $s2, 0x52($s1)
/* 4908C 8005B46C 540022A6 */  sh         $v0, 0x54($s1)
/* 49090 8005B470 4C0060A2 */  sb         $zero, 0x4C($s3)
/* 49094 8005B474 906C0108 */  j          .L8005B240
/* 49098 8005B478 4D0060A2 */   sb        $zero, 0x4D($s3)
.L8005B47C:
/* 4909C 8005B47C 52002392 */  lbu        $v1, 0x52($s1)
/* 490A0 8005B480 00000000 */  nop
/* 490A4 8005B484 05006010 */  beqz       $v1, .L8005B49C
/* 490A8 8005B488 02000224 */   addiu     $v0, $zero, 0x2
/* 490AC 8005B48C 05006210 */  beq        $v1, $v0, .L8005B4A4
/* 490B0 8005B490 02000524 */   addiu     $a1, $zero, 0x2
/* 490B4 8005B494 2C6D0108 */  j          .L8005B4B0
/* 490B8 8005B498 00000000 */   nop
.L8005B49C:
/* 490BC 8005B49C 2C6D0108 */  j          .L8005B4B0
/* 490C0 8005B4A0 06000524 */   addiu     $a1, $zero, 0x6
.L8005B4A4:
/* 490C4 8005B4A4 54002292 */  lbu        $v0, 0x54($s1)
/* 490C8 8005B4A8 01000524 */  addiu      $a1, $zero, 0x1
/* 490CC 8005B4AC 4D0062A2 */  sb         $v0, 0x4D($s3)
.L8005B4B0:
/* 490D0 8005B4B0 54002486 */  lh         $a0, 0x54($s1)
/* 490D4 8005B4B4 D563010C */  jal        DECOMP_VehCalc_InterpBySpeed
/* 490D8 8005B4B8 21300002 */   addu      $a2, $s0, $zero
/* 490DC 8005B4BC 52002392 */  lbu        $v1, 0x52($s1)
/* 490E0 8005B4C0 00000000 */  nop
/* 490E4 8005B4C4 FEFF6324 */  addiu      $v1, $v1, -0x2
/* 490E8 8005B4C8 0200632C */  sltiu      $v1, $v1, 0x2
/* 490EC 8005B4CC 09006010 */  beqz       $v1, .L8005B4F4
/* 490F0 8005B4D0 540022A6 */   sh        $v0, 0x54($s1)
/* 490F4 8005B4D4 54002292 */  lbu        $v0, 0x54($s1)
/* 490F8 8005B4D8 00000000 */  nop
/* 490FC 8005B4DC 4D0062A2 */  sb         $v0, 0x4D($s3)
/* 49100 8005B4E0 FF004230 */  andi       $v0, $v0, 0xFF
/* 49104 8005B4E4 03004014 */  bnez       $v0, .L8005B4F4
/* 49108 8005B4E8 00000000 */   nop
/* 4910C 8005B4EC 4C0060A2 */  sb         $zero, 0x4C($s3)
/* 49110 8005B4F0 4D0060A2 */  sb         $zero, 0x4D($s3)
.L8005B4F4:
/* 49114 8005B4F4 2800BF8F */  lw         $ra, 0x28($sp)
/* 49118 8005B4F8 2400B38F */  lw         $s3, 0x24($sp)
/* 4911C 8005B4FC 2000B28F */  lw         $s2, 0x20($sp)
/* 49120 8005B500 1C00B18F */  lw         $s1, 0x1C($sp)
/* 49124 8005B504 1800B08F */  lw         $s0, 0x18($sp)
/* 49128 8005B508 0800E003 */  jr         $ra
/* 4912C 8005B50C 3000BD27 */   addiu     $sp, $sp, 0x30
.size VehFrameProc_Driving, . - VehFrameProc_Driving
