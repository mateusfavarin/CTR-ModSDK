.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel COLL_Instance
/* ACE4 8001D0C4 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* ACE8 8001D0C8 1000B0AF */  sw         $s0, 0x10($sp)
/* ACEC 8001D0CC 2400B5AF */  sw         $s5, 0x24($sp)
/* ACF0 8001D0D0 21A8A000 */  addu       $s5, $a1, $zero
/* ACF4 8001D0D4 3000BFAF */  sw         $ra, 0x30($sp)
/* ACF8 8001D0D8 2C00B7AF */  sw         $s7, 0x2C($sp)
/* ACFC 8001D0DC 2800B6AF */  sw         $s6, 0x28($sp)
/* AD00 8001D0E0 2000B4AF */  sw         $s4, 0x20($sp)
/* AD04 8001D0E4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* AD08 8001D0E8 1800B2AF */  sw         $s2, 0x18($sp)
/* AD0C 8001D0EC 1400B1AF */  sw         $s1, 0x14($sp)
/* AD10 8001D0F0 0100A392 */  lbu        $v1, 0x1($s5)
/* AD14 8001D0F4 04000224 */  addiu      $v0, $zero, 0x4
/* AD18 8001D0F8 05006214 */  bne        $v1, $v0, .L8001D110
/* AD1C 8001D0FC 21808000 */   addu      $s0, $a0, $zero
/* AD20 8001D100 42000296 */  lhu        $v0, 0x42($s0)
/* AD24 8001D104 480015AE */  sw         $s5, 0x48($s0)
/* AD28 8001D108 01004224 */  addiu      $v0, $v0, 0x1
/* AD2C 8001D10C 420002A6 */  sh         $v0, 0x42($s0)
.L8001D110:
/* AD30 8001D110 22000296 */  lhu        $v0, 0x22($s0)
/* AD34 8001D114 00000000 */  nop
/* AD38 8001D118 40004230 */  andi       $v0, $v0, 0x40
/* AD3C 8001D11C 12004010 */  beqz       $v0, .L8001D168
/* AD40 8001D120 00100224 */   addiu     $v0, $zero, 0x1000
/* AD44 8001D124 10000496 */  lhu        $a0, 0x10($s0)
/* AD48 8001D128 12000596 */  lhu        $a1, 0x12($s0)
/* AD4C 8001D12C 14000696 */  lhu        $a2, 0x14($s0)
/* AD50 8001D130 42000396 */  lhu        $v1, 0x42($s0)
/* AD54 8001D134 720002A6 */  sh         $v0, 0x72($s0)
/* AD58 8001D138 06000224 */  addiu      $v0, $zero, 0x6
/* AD5C 8001D13C 700000A6 */  sh         $zero, 0x70($s0)
/* AD60 8001D140 740000A6 */  sh         $zero, 0x74($s0)
/* AD64 8001D144 7E0002A2 */  sb         $v0, 0x7E($s0)
/* AD68 8001D148 840000AE */  sw         $zero, 0x84($s0)
/* AD6C 8001D14C 480015AE */  sw         $s5, 0x48($s0)
/* AD70 8001D150 01006324 */  addiu      $v1, $v1, 0x1
/* AD74 8001D154 1C0004A6 */  sh         $a0, 0x1C($s0)
/* AD78 8001D158 1E0005A6 */  sh         $a1, 0x1E($s0)
/* AD7C 8001D15C 200006A6 */  sh         $a2, 0x20($s0)
/* AD80 8001D160 79750008 */  j          .L8001D5E4
/* AD84 8001D164 420003A6 */   sh        $v1, 0x42($s0)
.L8001D168:
/* AD88 8001D168 00000486 */  lh         $a0, 0x0($s0)
/* AD8C 8001D16C 10000286 */  lh         $v0, 0x10($s0)
/* AD90 8001D170 04000586 */  lh         $a1, 0x4($s0)
/* AD94 8001D174 14000386 */  lh         $v1, 0x14($s0)
/* AD98 8001D178 C80100AE */  sw         $zero, 0x1C8($s0)
/* AD9C 8001D17C 23208200 */  subu       $a0, $a0, $v0
/* ADA0 8001D180 2328A300 */  subu       $a1, $a1, $v1
/* ADA4 8001D184 C40104AE */  sw         $a0, 0x1C4($s0)
/* ADA8 8001D188 CC0105AE */  sw         $a1, 0x1CC($s0)
/* ADAC 8001D18C 1000A386 */  lh         $v1, 0x10($s5)
/* ADB0 8001D190 D40100AE */  sw         $zero, 0x1D4($s0)
/* ADB4 8001D194 23686200 */  subu       $t5, $v1, $v0
/* ADB8 8001D198 D0010DAE */  sw         $t5, 0x1D0($s0)
/* ADBC 8001D19C 1400A386 */  lh         $v1, 0x14($s5)
/* ADC0 8001D1A0 14000286 */  lh         $v0, 0x14($s0)
/* ADC4 8001D1A4 21580000 */  addu       $t3, $zero, $zero
/* ADC8 8001D1A8 23706200 */  subu       $t6, $v1, $v0
/* ADCC 8001D1AC D8010EAE */  sw         $t6, 0x1D8($s0)
/* ADD0 8001D1B0 0000A292 */  lbu        $v0, 0x0($s5)
/* ADD4 8001D1B4 00000000 */  nop
/* ADD8 8001D1B8 40004230 */  andi       $v0, $v0, 0x40
/* ADDC 8001D1BC 0A004010 */  beqz       $v0, .L8001D1E8
/* ADE0 8001D1C0 21606001 */   addu      $t4, $t3, $zero
/* ADE4 8001D1C4 02000386 */  lh         $v1, 0x2($s0)
/* ADE8 8001D1C8 12000286 */  lh         $v0, 0x12($s0)
/* ADEC 8001D1CC 00000000 */  nop
/* ADF0 8001D1D0 23586200 */  subu       $t3, $v1, $v0
/* ADF4 8001D1D4 C8010BAE */  sw         $t3, 0x1C8($s0)
/* ADF8 8001D1D8 1200A386 */  lh         $v1, 0x12($s5)
/* ADFC 8001D1DC 00000000 */  nop
/* AE00 8001D1E0 23606200 */  subu       $t4, $v1, $v0
/* AE04 8001D1E4 D4010CAE */  sw         $t4, 0x1D4($s0)
.L8001D1E8:
/* AE08 8001D1E8 FFFF8330 */  andi       $v1, $a0, 0xFFFF
/* AE0C 8001D1EC 00140B00 */  sll        $v0, $t3, 16
/* AE10 8001D1F0 25386200 */  or         $a3, $v1, $v0
/* AE14 8001D1F4 FFFFA330 */  andi       $v1, $a1, 0xFFFF
/* AE18 8001D1F8 00140D00 */  sll        $v0, $t5, 16
/* AE1C 8001D1FC 25406200 */  or         $t0, $v1, $v0
/* AE20 8001D200 FFFF8331 */  andi       $v1, $t4, 0xFFFF
/* AE24 8001D204 00140E00 */  sll        $v0, $t6, 16
/* AE28 8001D208 25306200 */  or         $a2, $v1, $v0
/* AE2C 8001D20C 0000C748 */  ctc2       $a3, $0 /* handwritten instruction */
/* AE30 8001D210 0008C848 */  ctc2       $t0, $1 /* handwritten instruction */
/* AE34 8001D214 0010C648 */  ctc2       $a2, $2 /* handwritten instruction */
/* AE38 8001D218 00008748 */  mtc2       $a3, $0 /* handwritten instruction */
/* AE3C 8001D21C 00088548 */  mtc2       $a1, $1 /* handwritten instruction */
/* AE40 8001D220 00000000 */  nop
/* AE44 8001D224 00000000 */  nop
/* AE48 8001D228 1260404A */  MVMVA      0, 0, 0, 3, 0
/* AE4C 8001D22C 00C80A48 */  mfc2       $t2, $25 /* handwritten instruction */
/* AE50 8001D230 00D00348 */  mfc2       $v1, $26 /* handwritten instruction */
/* AE54 8001D234 AC010AAE */  sw         $t2, 0x1AC($s0)
/* AE58 8001D238 EA006018 */  blez       $v1, .L8001D5E4
/* AE5C 8001D23C B00103AE */   sw        $v1, 0x1B0($s0)
/* AE60 8001D240 00F08348 */  mtc2       $v1, $30 /* handwritten instruction */
/* AE64 8001D244 00000000 */  nop
/* AE68 8001D248 00000000 */  nop
/* AE6C 8001D24C 00F80748 */  mfc2       $a3, $31 /* handwritten instruction */
/* AE70 8001D250 00000000 */  nop
/* AE74 8001D254 FEFFE724 */  addiu      $a3, $a3, -0x2
/* AE78 8001D258 0300E104 */  bgez       $a3, .L8001D268
/* AE7C 8001D25C 0D00E228 */   slti      $v0, $a3, 0xD
/* AE80 8001D260 21380000 */  addu       $a3, $zero, $zero
/* AE84 8001D264 0D00E228 */  slti       $v0, $a3, 0xD
.L8001D268:
/* AE88 8001D268 02004014 */  bnez       $v0, .L8001D274
/* AE8C 8001D26C 0C000224 */   addiu     $v0, $zero, 0xC
/* AE90 8001D270 0C000724 */  addiu      $a3, $zero, 0xC
.L8001D274:
/* AE94 8001D274 23104700 */  subu       $v0, $v0, $a3
/* AE98 8001D278 07404A00 */  srav       $t0, $t2, $v0
/* AE9C 8001D27C D9000005 */  bltz       $t0, .L8001D5E4
/* AEA0 8001D280 0438E300 */   sllv      $a3, $v1, $a3
/* AEA4 8001D284 0C000011 */  beqz       $t0, .L8001D2B8
/* AEA8 8001D288 21480000 */   addu      $t1, $zero, $zero
/* AEAC 8001D28C 1A00E800 */  div        $zero, $a3, $t0
/* AEB0 8001D290 02000015 */  bnez       $t0, .L8001D29C
/* AEB4 8001D294 00000000 */   nop
/* AEB8 8001D298 0D000700 */  break      7
.L8001D29C:
/* AEBC 8001D29C FFFF0124 */  addiu      $at, $zero, -0x1
/* AEC0 8001D2A0 04000115 */  bne        $t0, $at, .L8001D2B4
/* AEC4 8001D2A4 0080013C */   lui       $at, (0x80000000 >> 16)
/* AEC8 8001D2A8 0200E114 */  bne        $a3, $at, .L8001D2B4
/* AECC 8001D2AC 00000000 */   nop
/* AED0 8001D2B0 0D000600 */  break      6
.L8001D2B4:
/* AED4 8001D2B4 12480000 */  mflo       $t1
.L8001D2B8:
/* AED8 8001D2B8 00000000 */  nop
/* AEDC 8001D2BC 00000000 */  nop
/* AEE0 8001D2C0 18002401 */  mult       $t1, $a0
/* AEE4 8001D2C4 B40109AE */  sw         $t1, 0x1B4($s0)
/* AEE8 8001D2C8 0000A292 */  lbu        $v0, 0x0($s5)
/* AEEC 8001D2CC 21300000 */  addu       $a2, $zero, $zero
/* AEF0 8001D2D0 40004230 */  andi       $v0, $v0, 0x40
/* AEF4 8001D2D4 12780000 */  mflo       $t7
/* AEF8 8001D2D8 04004010 */  beqz       $v0, .L8001D2EC
/* AEFC 8001D2DC 03430F00 */   sra       $t0, $t7, 12
/* AF00 8001D2E0 18002B01 */  mult       $t1, $t3
/* AF04 8001D2E4 12780000 */  mflo       $t7
/* AF08 8001D2E8 03330F00 */  sra        $a2, $t7, 12
.L8001D2EC:
/* AF0C 8001D2EC 00000000 */  nop
/* AF10 8001D2F0 18002501 */  mult       $t1, $a1
/* AF14 8001D2F4 23180D01 */  subu       $v1, $t0, $t5
/* AF18 8001D2F8 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* AF1C 8001D2FC 2310CC00 */  subu       $v0, $a2, $t4
/* AF20 8001D300 00140200 */  sll        $v0, $v0, 16
/* AF24 8001D304 25386200 */  or         $a3, $v1, $v0
/* AF28 8001D308 DC0108AE */  sw         $t0, 0x1DC($s0)
/* AF2C 8001D30C E00106AE */  sw         $a2, 0x1E0($s0)
/* AF30 8001D310 12880000 */  mflo       $s1
/* AF34 8001D314 03131100 */  sra        $v0, $s1, 12
/* AF38 8001D318 23404E00 */  subu       $t0, $v0, $t6
/* AF3C 8001D31C E40102AE */  sw         $v0, 0x1E4($s0)
/* AF40 8001D320 0000C748 */  ctc2       $a3, $0 /* handwritten instruction */
/* AF44 8001D324 0008C848 */  ctc2       $t0, $1 /* handwritten instruction */
/* AF48 8001D328 00008748 */  mtc2       $a3, $0 /* handwritten instruction */
/* AF4C 8001D32C 00088848 */  mtc2       $t0, $1 /* handwritten instruction */
/* AF50 8001D330 00000000 */  nop
/* AF54 8001D334 00000000 */  nop
/* AF58 8001D338 1260404A */  MVMVA      0, 0, 0, 3, 0
/* AF5C 8001D33C 06000386 */  lh         $v1, 0x6($s0)
/* AF60 8001D340 1600A286 */  lh         $v0, 0x16($s5)
/* AF64 8001D344 00000000 */  nop
/* AF68 8001D348 21306200 */  addu       $a2, $v1, $v0
/* AF6C 8001D34C 1800C600 */  mult       $a2, $a2
/* AF70 8001D350 12300000 */  mflo       $a2
/* AF74 8001D354 00C80848 */  mfc2       $t0, $25 /* handwritten instruction */
/* AF78 8001D358 B80106AE */  sw         $a2, 0x1B8($s0)
/* AF7C 8001D35C 2330C800 */  subu       $a2, $a2, $t0
/* AF80 8001D360 A000C004 */  bltz       $a2, .L8001D5E4
/* AF84 8001D364 BC0108AE */   sw        $t0, 0x1BC($s0)
/* AF88 8001D368 1100C010 */  beqz       $a2, .L8001D3B0
/* AF8C 8001D36C 00000000 */   nop
/* AF90 8001D370 0E004011 */  beqz       $t2, .L8001D3AC
/* AF94 8001D374 00130600 */   sll       $v0, $a2, 12
/* AF98 8001D378 1A004A00 */  div        $zero, $v0, $t2
/* AF9C 8001D37C 02004015 */  bnez       $t2, .L8001D388
/* AFA0 8001D380 00000000 */   nop
/* AFA4 8001D384 0D000700 */  break      7
.L8001D388:
/* AFA8 8001D388 FFFF0124 */  addiu      $at, $zero, -0x1
/* AFAC 8001D38C 04004115 */  bne        $t2, $at, .L8001D3A0
/* AFB0 8001D390 0080013C */   lui       $at, (0x80000000 >> 16)
/* AFB4 8001D394 02004114 */  bne        $v0, $at, .L8001D3A0
/* AFB8 8001D398 00000000 */   nop
/* AFBC 8001D39C 0D000600 */  break      6
.L8001D3A0:
/* AFC0 8001D3A0 12100000 */  mflo       $v0
/* AFC4 8001D3A4 00000000 */  nop
/* AFC8 8001D3A8 23482201 */  subu       $t1, $t1, $v0
.L8001D3AC:
/* AFCC 8001D3AC C00109AE */  sw         $t1, 0x1C0($s0)
.L8001D3B0:
/* AFD0 8001D3B0 8400028E */  lw         $v0, 0x84($s0)
/* AFD4 8001D3B4 00000000 */  nop
/* AFD8 8001D3B8 2A104900 */  slt        $v0, $v0, $t1
/* AFDC 8001D3BC 89004014 */  bnez       $v0, .L8001D5E4
/* AFE0 8001D3C0 21B00000 */   addu      $s6, $zero, $zero
/* AFE4 8001D3C4 21A0C002 */  addu       $s4, $s6, $zero
/* AFE8 8001D3C8 0E002019 */  blez       $t1, .L8001D404
/* AFEC 8001D3CC 21B8C002 */   addu      $s7, $s6, $zero
/* AFF0 8001D3D0 18008900 */  mult       $a0, $t1
/* AFF4 8001D3D4 12300000 */  mflo       $a2
/* AFF8 8001D3D8 00000000 */  nop
/* AFFC 8001D3DC 00000000 */  nop
/* B000 8001D3E0 18006901 */  mult       $t3, $t1
/* B004 8001D3E4 12100000 */  mflo       $v0
/* B008 8001D3E8 00000000 */  nop
/* B00C 8001D3EC 00000000 */  nop
/* B010 8001D3F0 1800A900 */  mult       $a1, $t1
/* B014 8001D3F4 03B30600 */  sra        $s6, $a2, 12
/* B018 8001D3F8 03A30200 */  sra        $s4, $v0, 12
/* B01C 8001D3FC 12180000 */  mflo       $v1
/* B020 8001D400 03BB0300 */  sra        $s7, $v1, 12
.L8001D404:
/* B024 8001D404 0000A292 */  lbu        $v0, 0x0($s5)
/* B028 8001D408 00000000 */  nop
/* B02C 8001D40C 20004230 */  andi       $v0, $v0, 0x20
/* B030 8001D410 0C004010 */  beqz       $v0, .L8001D444
/* B034 8001D414 00000000 */   nop
/* B038 8001D418 1200A386 */  lh         $v1, 0x12($s5)
/* B03C 8001D41C 00000000 */  nop
/* B040 8001D420 2A108302 */  slt        $v0, $s4, $v1
/* B044 8001D424 07004010 */  beqz       $v0, .L8001D444
/* B048 8001D428 00000000 */   nop
/* B04C 8001D42C 0200A286 */  lh         $v0, 0x2($s5)
/* B050 8001D430 00000000 */  nop
/* B054 8001D434 21106200 */  addu       $v0, $v1, $v0
/* B058 8001D438 2A105400 */  slt        $v0, $v0, $s4
/* B05C 8001D43C 69004014 */  bnez       $v0, .L8001D5E4
/* B060 8001D440 00000000 */   nop
.L8001D444:
/* B064 8001D444 42000296 */  lhu        $v0, 0x42($s0)
/* B068 8001D448 480015AE */  sw         $s5, 0x48($s0)
/* B06C 8001D44C 840009AE */  sw         $t1, 0x84($s0)
/* B070 8001D450 01004224 */  addiu      $v0, $v0, 0x1
/* B074 8001D454 420002A6 */  sh         $v0, 0x42($s0)
/* B078 8001D458 2398CD02 */  subu       $s3, $s6, $t5
/* B07C 8001D45C E80116AE */  sw         $s6, 0x1E8($s0)
/* B080 8001D460 EC0114AE */  sw         $s4, 0x1EC($s0)
/* B084 8001D464 F00117AE */  sw         $s7, 0x1F0($s0)
/* B088 8001D468 0000A292 */  lbu        $v0, 0x0($s5)
/* B08C 8001D46C 00000000 */  nop
/* B090 8001D470 40004230 */  andi       $v0, $v0, 0x40
/* B094 8001D474 02004010 */  beqz       $v0, .L8001D480
/* B098 8001D478 21900000 */   addu      $s2, $zero, $zero
/* B09C 8001D47C 23908C02 */  subu       $s2, $s4, $t4
.L8001D480:
/* B0A0 8001D480 2388EE02 */  subu       $s1, $s7, $t6
/* B0A4 8001D484 FFFF6332 */  andi       $v1, $s3, 0xFFFF
/* B0A8 8001D488 00141200 */  sll        $v0, $s2, 16
/* B0AC 8001D48C 25386200 */  or         $a3, $v1, $v0
/* B0B0 8001D490 0000C748 */  ctc2       $a3, $0 /* handwritten instruction */
/* B0B4 8001D494 0008D148 */  ctc2       $s1, $1 /* handwritten instruction */
/* B0B8 8001D498 00008748 */  mtc2       $a3, $0 /* handwritten instruction */
/* B0BC 8001D49C 00089148 */  mtc2       $s1, $1 /* handwritten instruction */
/* B0C0 8001D4A0 00000000 */  nop
/* B0C4 8001D4A4 00000000 */  nop
/* B0C8 8001D4A8 1260404A */  MVMVA      0, 0, 0, 3, 0
/* B0CC 8001D4AC 00C80448 */  mfc2       $a0, $25 /* handwritten instruction */
/* B0D0 8001D4B0 86B1010C */  jal        SquareRoot0_stub
/* B0D4 8001D4B4 00000000 */   nop
/* B0D8 8001D4B8 0001033C */  lui        $v1, (0x1000000 >> 16)
/* B0DC 8001D4BC 1A006200 */  div        $zero, $v1, $v0
/* B0E0 8001D4C0 02004014 */  bnez       $v0, .L8001D4CC
/* B0E4 8001D4C4 00000000 */   nop
/* B0E8 8001D4C8 0D000700 */  break      7
.L8001D4CC:
/* B0EC 8001D4CC FFFF0124 */  addiu      $at, $zero, -0x1
/* B0F0 8001D4D0 04004114 */  bne        $v0, $at, .L8001D4E4
/* B0F4 8001D4D4 0080013C */   lui       $at, (0x80000000 >> 16)
/* B0F8 8001D4D8 02006114 */  bne        $v1, $at, .L8001D4E4
/* B0FC 8001D4DC 00000000 */   nop
/* B100 8001D4E0 0D000600 */  break      6
.L8001D4E4:
/* B104 8001D4E4 12300000 */  mflo       $a2
/* B108 8001D4E8 00000000 */  nop
/* B10C 8001D4EC 00000000 */  nop
/* B110 8001D4F0 18006602 */  mult       $s3, $a2
/* B114 8001D4F4 12380000 */  mflo       $a3
/* B118 8001D4F8 00000000 */  nop
/* B11C 8001D4FC 00000000 */  nop
/* B120 8001D500 18004602 */  mult       $s2, $a2
/* B124 8001D504 12100000 */  mflo       $v0
/* B128 8001D508 00000000 */  nop
/* B12C 8001D50C 00000000 */  nop
/* B130 8001D510 18002602 */  mult       $s1, $a2
/* B134 8001D514 039B0700 */  sra        $s3, $a3, 12
/* B138 8001D518 F40113AE */  sw         $s3, 0x1F4($s0)
/* B13C 8001D51C 03930200 */  sra        $s2, $v0, 12
/* B140 8001D520 F80112AE */  sw         $s2, 0x1F8($s0)
/* B144 8001D524 12180000 */  mflo       $v1
/* B148 8001D528 038B0300 */  sra        $s1, $v1, 12
/* B14C 8001D52C FC0111AE */  sw         $s1, 0x1FC($s0)
/* B150 8001D530 1600A686 */  lh         $a2, 0x16($s5)
/* B154 8001D534 00000000 */  nop
/* B158 8001D538 18006602 */  mult       $s3, $a2
/* B15C 8001D53C 12200000 */  mflo       $a0
/* B160 8001D540 00000000 */  nop
/* B164 8001D544 00000000 */  nop
/* B168 8001D548 18004602 */  mult       $s2, $a2
/* B16C 8001D54C 10000296 */  lhu        $v0, 0x10($s0)
/* B170 8001D550 12000396 */  lhu        $v1, 0x12($s0)
/* B174 8001D554 21105600 */  addu       $v0, $v0, $s6
/* B178 8001D558 1C0002A6 */  sh         $v0, 0x1C($s0)
/* B17C 8001D55C 14000296 */  lhu        $v0, 0x14($s0)
/* B180 8001D560 12280000 */  mflo       $a1
/* B184 8001D564 700013A6 */  sh         $s3, 0x70($s0)
/* B188 8001D568 720012A6 */  sh         $s2, 0x72($s0)
/* B18C 8001D56C 18002602 */  mult       $s1, $a2
/* B190 8001D570 740011A6 */  sh         $s1, 0x74($s0)
/* B194 8001D574 21187400 */  addu       $v1, $v1, $s4
/* B198 8001D578 21105700 */  addu       $v0, $v0, $s7
/* B19C 8001D57C 200002A6 */  sh         $v0, 0x20($s0)
/* B1A0 8001D580 06000224 */  addiu      $v0, $zero, 0x6
/* B1A4 8001D584 1E0003A6 */  sh         $v1, 0x1E($s0)
/* B1A8 8001D588 7E0002A2 */  sb         $v0, 0x7E($s0)
/* B1AC 8001D58C 031B0400 */  sra        $v1, $a0, 12
/* B1B0 8001D590 000203AE */  sw         $v1, 0x200($s0)
/* B1B4 8001D594 03230500 */  sra        $a0, $a1, 12
/* B1B8 8001D598 040204AE */  sw         $a0, 0x204($s0)
/* B1BC 8001D59C 12300000 */  mflo       $a2
/* B1C0 8001D5A0 032B0600 */  sra        $a1, $a2, 12
/* B1C4 8001D5A4 080205AE */  sw         $a1, 0x208($s0)
/* B1C8 8001D5A8 1000A296 */  lhu        $v0, 0x10($s5)
/* B1CC 8001D5AC 00000000 */  nop
/* B1D0 8001D5B0 21104300 */  addu       $v0, $v0, $v1
/* B1D4 8001D5B4 780002A6 */  sh         $v0, 0x78($s0)
/* B1D8 8001D5B8 680002A6 */  sh         $v0, 0x68($s0)
/* B1DC 8001D5BC 1200A296 */  lhu        $v0, 0x12($s5)
/* B1E0 8001D5C0 00000000 */  nop
/* B1E4 8001D5C4 21104400 */  addu       $v0, $v0, $a0
/* B1E8 8001D5C8 7A0002A6 */  sh         $v0, 0x7A($s0)
/* B1EC 8001D5CC 6A0002A6 */  sh         $v0, 0x6A($s0)
/* B1F0 8001D5D0 1400A296 */  lhu        $v0, 0x14($s5)
/* B1F4 8001D5D4 00000000 */  nop
/* B1F8 8001D5D8 21104500 */  addu       $v0, $v0, $a1
/* B1FC 8001D5DC 7C0002A6 */  sh         $v0, 0x7C($s0)
/* B200 8001D5E0 6C0002A6 */  sh         $v0, 0x6C($s0)
.L8001D5E4:
/* B204 8001D5E4 3000BF8F */  lw         $ra, 0x30($sp)
/* B208 8001D5E8 2C00B78F */  lw         $s7, 0x2C($sp)
/* B20C 8001D5EC 2800B68F */  lw         $s6, 0x28($sp)
/* B210 8001D5F0 2400B58F */  lw         $s5, 0x24($sp)
/* B214 8001D5F4 2000B48F */  lw         $s4, 0x20($sp)
/* B218 8001D5F8 1C00B38F */  lw         $s3, 0x1C($sp)
/* B21C 8001D5FC 1800B28F */  lw         $s2, 0x18($sp)
/* B220 8001D600 1400B18F */  lw         $s1, 0x14($sp)
/* B224 8001D604 1000B08F */  lw         $s0, 0x10($sp)
/* B228 8001D608 0800E003 */  jr         $ra
/* B22C 8001D60C 3800BD27 */   addiu     $sp, $sp, 0x38
.size COLL_Instance, . - COLL_Instance
