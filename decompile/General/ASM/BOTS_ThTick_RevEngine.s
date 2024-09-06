.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel BOTS_ThTick_RevEngine
/* 134C 8001372C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1350 80013730 1400B1AF */  sw         $s1, 0x14($sp)
/* 1354 80013734 21888000 */  addu       $s1, $a0, $zero
/* 1358 80013738 1800BFAF */  sw         $ra, 0x18($sp)
/* 135C 8001373C 1000B0AF */  sw         $s0, 0x10($sp)
/* 1360 80013740 3000308E */  lw         $s0, 0x30($s1)
/* 1364 80013744 00000000 */  nop
/* 1368 80013748 D802038E */  lw         $v1, 0x2D8($s0)
/* 136C 8001374C F405028E */  lw         $v0, 0x5F4($s0)
/* 1370 80013750 2006048E */  lw         $a0, 0x620($s0)
/* 1374 80013754 2A104300 */  slt        $v0, $v0, $v1
/* 1378 80013758 13004014 */  bnez       $v0, .L800137A8
/* 137C 8001375C 00000000 */   nop
/* 1380 80013760 06008010 */  beqz       $a0, .L8001377C
/* 1384 80013764 00100224 */   addiu     $v0, $zero, 0x1000
/* 1388 80013768 04008394 */  lhu        $v1, 0x4($a0)
/* 138C 8001376C 120082A4 */  sh         $v0, 0x12($a0)
/* 1390 80013770 060080A4 */  sh         $zero, 0x6($a0)
/* 1394 80013774 FEFF6330 */  andi       $v1, $v1, 0xFFFE
/* 1398 80013778 040083A4 */  sh         $v1, 0x4($a0)
.L8001377C:
/* 139C 8001377C 21202002 */  addu       $a0, $s1, $zero
/* 13A0 80013780 0180053C */  lui        $a1, %hi(BOTS_ThTick_Drive)
/* 13A4 80013784 183CA524 */  addiu      $a1, $a1, %lo(BOTS_ThTick_Drive)
/* 13A8 80013788 04000224 */  addiu      $v0, $zero, 0x4
/* 13AC 8001378C 200600AE */  sw         $zero, 0x620($s0)
/* 13B0 80013790 760302A2 */  sb         $v0, 0x376($s0)
/* 13B4 80013794 0C0000A6 */  sh         $zero, 0xC($s0)
/* 13B8 80013798 BBC5010C */  jal        ThTick_SetAndExec
/* 13BC 8001379C 040400A6 */   sh        $zero, 0x404($s0)
/* 13C0 800137A0 094E0008 */  j          .L80013824
/* 13C4 800137A4 00000000 */   nop
.L800137A8:
/* 13C8 800137A8 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 13CC 800137AC ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 13D0 800137B0 00000000 */  nop
/* 13D4 800137B4 041D428C */  lw         $v0, 0x1D04($v0)
/* 13D8 800137B8 00000000 */  nop
/* 13DC 800137BC 40120200 */  sll        $v0, $v0, 9
/* 13E0 800137C0 43110200 */  sra        $v0, $v0, 5
/* 13E4 800137C4 23106200 */  subu       $v0, $v1, $v0
/* 13E8 800137C8 0D008010 */  beqz       $a0, .L80013800
/* 13EC 800137CC D80202AE */   sw        $v0, 0x2D8($s0)
/* 13F0 800137D0 D402028E */  lw         $v0, 0x2D4($s0)
/* 13F4 800137D4 00000000 */  nop
/* 13F8 800137D8 03120200 */  sra        $v0, $v0, 8
/* 13FC 800137DC 0C0082A4 */  sh         $v0, 0xC($a0)
/* 1400 800137E0 D802028E */  lw         $v0, 0x2D8($s0)
/* 1404 800137E4 00000000 */  nop
/* 1408 800137E8 03120200 */  sra        $v0, $v0, 8
/* 140C 800137EC 0E0082A4 */  sh         $v0, 0xE($a0)
/* 1410 800137F0 DC02028E */  lw         $v0, 0x2DC($s0)
/* 1414 800137F4 00000000 */  nop
/* 1418 800137F8 03120200 */  sra        $v0, $v0, 8
/* 141C 800137FC 100082A4 */  sh         $v0, 0x10($a0)
.L80013800:
/* 1420 80013800 21202002 */  addu       $a0, $s1, $zero
/* 1424 80013804 8D7B010C */  jal        VehPhysForce_TranslateMatrix
/* 1428 80013808 21280002 */   addu      $a1, $s0, $zero
/* 142C 8001380C 21202002 */  addu       $a0, $s1, $zero
/* 1430 80013810 5E6C010C */  jal        VehFrameProc_Driving
/* 1434 80013814 21280002 */   addu      $a1, $s0, $zero
/* 1438 80013818 21202002 */  addu       $a0, $s1, $zero
/* 143C 8001381C 8666010C */  jal        VehEmitter_DriverMain
/* 1440 80013820 21280002 */   addu      $a1, $s0, $zero
.L80013824:
/* 1444 80013824 1800BF8F */  lw         $ra, 0x18($sp)
/* 1448 80013828 1400B18F */  lw         $s1, 0x14($sp)
/* 144C 8001382C 1000B08F */  lw         $s0, 0x10($sp)
/* 1450 80013830 0800E003 */  jr         $ra
/* 1454 80013834 2000BD27 */   addiu     $sp, $sp, 0x20
.size BOTS_ThTick_RevEngine, . - BOTS_ThTick_RevEngine
