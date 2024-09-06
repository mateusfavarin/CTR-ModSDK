.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel Vector_SpecLightSpin3D
/* 4503C 8005741C 78FFBD27 */  addiu      $sp, $sp, -0x88
/* 45040 80057420 6800B2AF */  sw         $s2, 0x68($sp)
/* 45044 80057424 21908000 */  addu       $s2, $a0, $zero
/* 45048 80057428 1000A427 */  addiu      $a0, $sp, 0x10
/* 4504C 8005742C 7C00B7AF */  sw         $s7, 0x7C($sp)
/* 45050 80057430 21B8C000 */  addu       $s7, $a2, $zero
/* 45054 80057434 8000BFAF */  sw         $ra, 0x80($sp)
/* 45058 80057438 7800B6AF */  sw         $s6, 0x78($sp)
/* 4505C 8005743C 7400B5AF */  sw         $s5, 0x74($sp)
/* 45060 80057440 7000B4AF */  sw         $s4, 0x70($sp)
/* 45064 80057444 6C00B3AF */  sw         $s3, 0x6C($sp)
/* 45068 80057448 6400B1AF */  sw         $s1, 0x64($sp)
/* 4506C 8005744C DEB0010C */  jal        ConvertRotToMatrix_Transpose
/* 45070 80057450 6000B0AF */   sw        $s0, 0x60($sp)
/* 45074 80057454 0980053C */  lui        $a1, %hi(D_8008D2AC)
/* 45078 80057458 ACD2A58C */  lw         $a1, %lo(D_8008D2AC)($a1)
/* 4507C 8005745C 00000000 */  nop
/* 45080 80057460 A81CA290 */  lbu        $v0, 0x1CA8($a1)
/* 45084 80057464 00000000 */  nop
/* 45088 80057468 88004010 */  beqz       $v0, .L8005768C
/* 4508C 8005746C 21880000 */   addu      $s1, $zero, $zero
/* 45090 80057470 1000B627 */  addiu      $s6, $sp, 0x10
/* 45094 80057474 5000B527 */  addiu      $s5, $sp, 0x50
/* 45098 80057478 21804002 */  addu       $s0, $s2, $zero
/* 4509C 8005747C 68011424 */  addiu      $s4, $zero, 0x168
/* 450A0 80057480 21982002 */  addu       $s3, $s1, $zero
.L80057484:
/* 450A4 80057484 2128B400 */  addu       $a1, $a1, $s4
/* 450A8 80057488 2110B300 */  addu       $v0, $a1, $s3
/* 450AC 8005748C 68004224 */  addiu      $v0, $v0, 0x68
/* 450B0 80057490 00004C8C */  lw         $t4, 0x0($v0)
/* 450B4 80057494 04004D8C */  lw         $t5, 0x4($v0)
/* 450B8 80057498 0040CC48 */  ctc2       $t4, $8 /* handwritten instruction */
/* 450BC 8005749C 0048CD48 */  ctc2       $t5, $9 /* handwritten instruction */
/* 450C0 800574A0 08004C8C */  lw         $t4, 0x8($v0)
/* 450C4 800574A4 0C004D8C */  lw         $t5, 0xC($v0)
/* 450C8 800574A8 10004E8C */  lw         $t6, 0x10($v0)
/* 450CC 800574AC 0050CC48 */  ctc2       $t4, $10 /* handwritten instruction */
/* 450D0 800574B0 0058CD48 */  ctc2       $t5, $11 /* handwritten instruction */
/* 450D4 800574B4 0060CE48 */  ctc2       $t6, $12 /* handwritten instruction */
/* 450D8 800574B8 0000E0CA */  lwc2       $0, 0x0($s7)
/* 450DC 800574BC 0400E1CA */  lwc2       $1, 0x4($s7)
/* 450E0 800574C0 00000000 */  nop
/* 450E4 800574C4 00000000 */  nop
/* 450E8 800574C8 12604A4A */  MVMVA      1, 1, 0, 3, 0
/* 450EC 800574CC 00C80748 */  mfc2       $a3, $25 /* handwritten instruction */
/* 450F0 800574D0 00000000 */  nop
/* 450F4 800574D4 3000A7AF */  sw         $a3, 0x30($sp)
/* 450F8 800574D8 00D00748 */  mfc2       $a3, $26 /* handwritten instruction */
/* 450FC 800574DC 00000000 */  nop
/* 45100 800574E0 3400A7AF */  sw         $a3, 0x34($sp)
/* 45104 800574E4 00D80748 */  mfc2       $a3, $27 /* handwritten instruction */
/* 45108 800574E8 3000A297 */  lhu        $v0, 0x30($sp)
/* 4510C 800574EC 3400A397 */  lhu        $v1, 0x34($sp)
/* 45110 800574F0 3800A7AF */  sw         $a3, 0x38($sp)
/* 45114 800574F4 3800A497 */  lhu        $a0, 0x38($sp)
/* 45118 800574F8 5800A2A7 */  sh         $v0, 0x58($sp)
/* 4511C 800574FC 5A00A3A7 */  sh         $v1, 0x5A($sp)
/* 45120 80057500 5C00A4A7 */  sh         $a0, 0x5C($sp)
/* 45124 80057504 0000CC8E */  lw         $t4, 0x0($s6)
/* 45128 80057508 0400CD8E */  lw         $t5, 0x4($s6)
/* 4512C 8005750C 0040CC48 */  ctc2       $t4, $8 /* handwritten instruction */
/* 45130 80057510 0048CD48 */  ctc2       $t5, $9 /* handwritten instruction */
/* 45134 80057514 0800CC8E */  lw         $t4, 0x8($s6)
/* 45138 80057518 0C00CD8E */  lw         $t5, 0xC($s6)
/* 4513C 8005751C 1000CE8E */  lw         $t6, 0x10($s6)
/* 45140 80057520 0050CC48 */  ctc2       $t4, $10 /* handwritten instruction */
/* 45144 80057524 0058CD48 */  ctc2       $t5, $11 /* handwritten instruction */
/* 45148 80057528 0060CE48 */  ctc2       $t6, $12 /* handwritten instruction */
/* 4514C 8005752C 5800A227 */  addiu      $v0, $sp, 0x58
/* 45150 80057530 000040C8 */  lwc2       $0, 0x0($v0)
/* 45154 80057534 040041C8 */  lwc2       $1, 0x4($v0)
/* 45158 80057538 00000000 */  nop
/* 4515C 8005753C 00000000 */  nop
/* 45160 80057540 12604A4A */  MVMVA      1, 1, 0, 3, 0
/* 45164 80057544 00C80748 */  mfc2       $a3, $25 /* handwritten instruction */
/* 45168 80057548 00000000 */  nop
/* 4516C 8005754C 3000A7AF */  sw         $a3, 0x30($sp)
/* 45170 80057550 00D00748 */  mfc2       $a3, $26 /* handwritten instruction */
/* 45174 80057554 00000000 */  nop
/* 45178 80057558 3400A7AF */  sw         $a3, 0x34($sp)
/* 4517C 8005755C 00D80748 */  mfc2       $a3, $27 /* handwritten instruction */
/* 45180 80057560 3000A293 */  lbu        $v0, 0x30($sp)
/* 45184 80057564 3800A7AF */  sw         $a3, 0x38($sp)
/* 45188 80057568 530042A2 */  sb         $v0, 0x53($s2)
/* 4518C 8005756C 3800A297 */  lhu        $v0, 0x38($sp)
/* 45190 80057570 00000000 */  nop
/* 45194 80057574 580042AE */  sw         $v0, 0x58($s2)
/* 45198 80057578 44004296 */  lhu        $v0, 0x44($s2)
/* 4519C 8005757C 0000A394 */  lhu        $v1, 0x0($a1)
/* 451A0 80057580 00000000 */  nop
/* 451A4 80057584 23104300 */  subu       $v0, $v0, $v1
/* 451A8 80057588 5000A2A7 */  sh         $v0, 0x50($sp)
/* 451AC 8005758C 48004296 */  lhu        $v0, 0x48($s2)
/* 451B0 80057590 0200A394 */  lhu        $v1, 0x2($a1)
/* 451B4 80057594 00000000 */  nop
/* 451B8 80057598 23104300 */  subu       $v0, $v0, $v1
/* 451BC 8005759C 5200A2A7 */  sh         $v0, 0x52($sp)
/* 451C0 800575A0 4C004296 */  lhu        $v0, 0x4C($s2)
/* 451C4 800575A4 0400A394 */  lhu        $v1, 0x4($a1)
/* 451C8 800575A8 2120A002 */  addu       $a0, $s5, $zero
/* 451CC 800575AC 23104300 */  subu       $v0, $v0, $v1
/* 451D0 800575B0 DEF4000C */  jal        MATH_VectorNormalize
/* 451D4 800575B4 5400A2A7 */   sh        $v0, 0x54($sp)
/* 451D8 800575B8 0000CC8E */  lw         $t4, 0x0($s6)
/* 451DC 800575BC 0400CD8E */  lw         $t5, 0x4($s6)
/* 451E0 800575C0 0040CC48 */  ctc2       $t4, $8 /* handwritten instruction */
/* 451E4 800575C4 0048CD48 */  ctc2       $t5, $9 /* handwritten instruction */
/* 451E8 800575C8 0800CC8E */  lw         $t4, 0x8($s6)
/* 451EC 800575CC 0C00CD8E */  lw         $t5, 0xC($s6)
/* 451F0 800575D0 1000CE8E */  lw         $t6, 0x10($s6)
/* 451F4 800575D4 0050CC48 */  ctc2       $t4, $10 /* handwritten instruction */
/* 451F8 800575D8 0058CD48 */  ctc2       $t5, $11 /* handwritten instruction */
/* 451FC 800575DC 0060CE48 */  ctc2       $t6, $12 /* handwritten instruction */
/* 45200 800575E0 0000A0CA */  lwc2       $0, 0x0($s5)
/* 45204 800575E4 0400A1CA */  lwc2       $1, 0x4($s5)
/* 45208 800575E8 00000000 */  nop
/* 4520C 800575EC 00000000 */  nop
/* 45210 800575F0 12604A4A */  MVMVA      1, 1, 0, 3, 0
/* 45214 800575F4 00C80748 */  mfc2       $a3, $25 /* handwritten instruction */
/* 45218 800575F8 00000000 */  nop
/* 4521C 800575FC 4000A7AF */  sw         $a3, 0x40($sp)
/* 45220 80057600 00D00748 */  mfc2       $a3, $26 /* handwritten instruction */
/* 45224 80057604 00000000 */  nop
/* 45228 80057608 4400A7AF */  sw         $a3, 0x44($sp)
/* 4522C 8005760C 00D80748 */  mfc2       $a3, $27 /* handwritten instruction */
/* 45230 80057610 3000A297 */  lhu        $v0, 0x30($sp)
/* 45234 80057614 4000A397 */  lhu        $v1, 0x40($sp)
/* 45238 80057618 4400A597 */  lhu        $a1, 0x44($sp)
/* 4523C 8005761C 2120A002 */  addu       $a0, $s5, $zero
/* 45240 80057620 4800A7AF */  sw         $a3, 0x48($sp)
/* 45244 80057624 4800A697 */  lhu        $a2, 0x48($sp)
/* 45248 80057628 21104300 */  addu       $v0, $v0, $v1
/* 4524C 8005762C 5000A2A7 */  sh         $v0, 0x50($sp)
/* 45250 80057630 3400A297 */  lhu        $v0, 0x34($sp)
/* 45254 80057634 3800A397 */  lhu        $v1, 0x38($sp)
/* 45258 80057638 21104500 */  addu       $v0, $v0, $a1
/* 4525C 8005763C 21186600 */  addu       $v1, $v1, $a2
/* 45260 80057640 5200A2A7 */  sh         $v0, 0x52($sp)
/* 45264 80057644 DEF4000C */  jal        MATH_VectorNormalize
/* 45268 80057648 5400A3A7 */   sh        $v1, 0x54($sp)
/* 4526C 8005764C 0980053C */  lui        $a1, %hi(D_8008D2AC)
/* 45270 80057650 ACD2A58C */  lw         $a1, %lo(D_8008D2AC)($a1)
/* 45274 80057654 5000A297 */  lhu        $v0, 0x50($sp)
/* 45278 80057658 10019426 */  addiu      $s4, $s4, 0x110
/* 4527C 8005765C F40002A6 */  sh         $v0, 0xF4($s0)
/* 45280 80057660 5200A297 */  lhu        $v0, 0x52($sp)
/* 45284 80057664 10017326 */  addiu      $s3, $s3, 0x110
/* 45288 80057668 F60002A6 */  sh         $v0, 0xF6($s0)
/* 4528C 8005766C 5400A297 */  lhu        $v0, 0x54($sp)
/* 45290 80057670 01003126 */  addiu      $s1, $s1, 0x1
/* 45294 80057674 F80002A6 */  sh         $v0, 0xF8($s0)
/* 45298 80057678 A81CA290 */  lbu        $v0, 0x1CA8($a1)
/* 4529C 8005767C 00000000 */  nop
/* 452A0 80057680 2A102202 */  slt        $v0, $s1, $v0
/* 452A4 80057684 7FFF4014 */  bnez       $v0, .L80057484
/* 452A8 80057688 88001026 */   addiu     $s0, $s0, 0x88
.L8005768C:
/* 452AC 8005768C 8000BF8F */  lw         $ra, 0x80($sp)
/* 452B0 80057690 7C00B78F */  lw         $s7, 0x7C($sp)
/* 452B4 80057694 7800B68F */  lw         $s6, 0x78($sp)
/* 452B8 80057698 7400B58F */  lw         $s5, 0x74($sp)
/* 452BC 8005769C 7000B48F */  lw         $s4, 0x70($sp)
/* 452C0 800576A0 6C00B38F */  lw         $s3, 0x6C($sp)
/* 452C4 800576A4 6800B28F */  lw         $s2, 0x68($sp)
/* 452C8 800576A8 6400B18F */  lw         $s1, 0x64($sp)
/* 452CC 800576AC 6000B08F */  lw         $s0, 0x60($sp)
/* 452D0 800576B0 0800E003 */  jr         $ra
/* 452D4 800576B4 8800BD27 */   addiu     $sp, $sp, 0x88
.size Vector_SpecLightSpin3D, . - Vector_SpecLightSpin3D
