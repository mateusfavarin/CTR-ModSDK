.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel Vector_SpecLightSpin2D
/* 44EF0 800572D0 98FFBD27 */  addiu      $sp, $sp, -0x68
/* 44EF4 800572D4 5C00B1AF */  sw         $s1, 0x5C($sp)
/* 44EF8 800572D8 21888000 */  addu       $s1, $a0, $zero
/* 44EFC 800572DC 1000A427 */  addiu      $a0, $sp, 0x10
/* 44F00 800572E0 5800B0AF */  sw         $s0, 0x58($sp)
/* 44F04 800572E4 6000BFAF */  sw         $ra, 0x60($sp)
/* 44F08 800572E8 DEB0010C */  jal        ConvertRotToMatrix_Transpose
/* 44F0C 800572EC 2180C000 */   addu      $s0, $a2, $zero
/* 44F10 800572F0 000000CA */  lwc2       $0, 0x0($s0)
/* 44F14 800572F4 040001CA */  lwc2       $1, 0x4($s0)
/* 44F18 800572F8 00000000 */  nop
/* 44F1C 800572FC 00000000 */  nop
/* 44F20 80057300 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 44F24 80057304 00C80748 */  mfc2       $a3, $25 /* handwritten instruction */
/* 44F28 80057308 00000000 */  nop
/* 44F2C 8005730C 3000A7AF */  sw         $a3, 0x30($sp)
/* 44F30 80057310 00D00748 */  mfc2       $a3, $26 /* handwritten instruction */
/* 44F34 80057314 00000000 */  nop
/* 44F38 80057318 3400A7AF */  sw         $a3, 0x34($sp)
/* 44F3C 8005731C 00D80748 */  mfc2       $a3, $27 /* handwritten instruction */
/* 44F40 80057320 3000A293 */  lbu        $v0, 0x30($sp)
/* 44F44 80057324 3800A7AF */  sw         $a3, 0x38($sp)
/* 44F48 80057328 530022A2 */  sb         $v0, 0x53($s1)
/* 44F4C 8005732C 3800A28F */  lw         $v0, 0x38($sp)
/* 44F50 80057330 5000A427 */  addiu      $a0, $sp, 0x50
/* 44F54 80057334 580022AE */  sw         $v0, 0x58($s1)
/* 44F58 80057338 00100224 */  addiu      $v0, $zero, 0x1000
/* 44F5C 8005733C 5000A0A7 */  sh         $zero, 0x50($sp)
/* 44F60 80057340 5200A0A7 */  sh         $zero, 0x52($sp)
/* 44F64 80057344 5400A2A7 */  sh         $v0, 0x54($sp)
/* 44F68 80057348 000080C8 */  lwc2       $0, 0x0($a0)
/* 44F6C 8005734C 040081C8 */  lwc2       $1, 0x4($a0)
/* 44F70 80057350 00000000 */  nop
/* 44F74 80057354 00000000 */  nop
/* 44F78 80057358 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 44F7C 8005735C 00C80748 */  mfc2       $a3, $25 /* handwritten instruction */
/* 44F80 80057360 00000000 */  nop
/* 44F84 80057364 4000A7AF */  sw         $a3, 0x40($sp)
/* 44F88 80057368 00D00748 */  mfc2       $a3, $26 /* handwritten instruction */
/* 44F8C 8005736C 00000000 */  nop
/* 44F90 80057370 4400A7AF */  sw         $a3, 0x44($sp)
/* 44F94 80057374 00D80748 */  mfc2       $a3, $27 /* handwritten instruction */
/* 44F98 80057378 3000A297 */  lhu        $v0, 0x30($sp)
/* 44F9C 8005737C 4000A397 */  lhu        $v1, 0x40($sp)
/* 44FA0 80057380 4400A597 */  lhu        $a1, 0x44($sp)
/* 44FA4 80057384 4800A7AF */  sw         $a3, 0x48($sp)
/* 44FA8 80057388 4800A697 */  lhu        $a2, 0x48($sp)
/* 44FAC 8005738C 21104300 */  addu       $v0, $v0, $v1
/* 44FB0 80057390 5000A2A7 */  sh         $v0, 0x50($sp)
/* 44FB4 80057394 3400A297 */  lhu        $v0, 0x34($sp)
/* 44FB8 80057398 3800A397 */  lhu        $v1, 0x38($sp)
/* 44FBC 8005739C 21104500 */  addu       $v0, $v0, $a1
/* 44FC0 800573A0 21186600 */  addu       $v1, $v1, $a2
/* 44FC4 800573A4 5200A2A7 */  sh         $v0, 0x52($sp)
/* 44FC8 800573A8 DEF4000C */  jal        MATH_VectorNormalize
/* 44FCC 800573AC 5400A3A7 */   sh        $v1, 0x54($sp)
/* 44FD0 800573B0 0980053C */  lui        $a1, %hi(D_8008D2AC)
/* 44FD4 800573B4 ACD2A58C */  lw         $a1, %lo(D_8008D2AC)($a1)
/* 44FD8 800573B8 00000000 */  nop
/* 44FDC 800573BC A81CA290 */  lbu        $v0, 0x1CA8($a1)
/* 44FE0 800573C0 00000000 */  nop
/* 44FE4 800573C4 10004010 */  beqz       $v0, .L80057408
/* 44FE8 800573C8 21180000 */   addu      $v1, $zero, $zero
/* 44FEC 800573CC 21202002 */  addu       $a0, $s1, $zero
.L800573D0:
/* 44FF0 800573D0 5000A297 */  lhu        $v0, 0x50($sp)
/* 44FF4 800573D4 00000000 */  nop
/* 44FF8 800573D8 F40082A4 */  sh         $v0, 0xF4($a0)
/* 44FFC 800573DC 5200A297 */  lhu        $v0, 0x52($sp)
/* 45000 800573E0 00000000 */  nop
/* 45004 800573E4 F60082A4 */  sh         $v0, 0xF6($a0)
/* 45008 800573E8 5400A297 */  lhu        $v0, 0x54($sp)
/* 4500C 800573EC 01006324 */  addiu      $v1, $v1, 0x1
/* 45010 800573F0 F80082A4 */  sh         $v0, 0xF8($a0)
/* 45014 800573F4 A81CA290 */  lbu        $v0, 0x1CA8($a1)
/* 45018 800573F8 00000000 */  nop
/* 4501C 800573FC 2A106200 */  slt        $v0, $v1, $v0
/* 45020 80057400 F3FF4014 */  bnez       $v0, .L800573D0
/* 45024 80057404 88008424 */   addiu     $a0, $a0, 0x88
.L80057408:
/* 45028 80057408 6000BF8F */  lw         $ra, 0x60($sp)
/* 4502C 8005740C 5C00B18F */  lw         $s1, 0x5C($sp)
/* 45030 80057410 5800B08F */  lw         $s0, 0x58($sp)
/* 45034 80057414 0800E003 */  jr         $ra
/* 45038 80057418 6800BD27 */   addiu     $sp, $sp, 0x68
.size Vector_SpecLightSpin2D, . - Vector_SpecLightSpin2D
