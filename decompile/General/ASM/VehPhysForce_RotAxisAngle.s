.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel VehPhysForce_RotAxisAngle
/* 4D4BC 8005F89C F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 4D4C0 8005F8A0 21C0A000 */  addu       $t8, $a1, $zero
/* 4D4C4 8005F8A4 0800B0AF */  sw         $s0, 0x8($sp)
/* 4D4C8 8005F8A8 00000297 */  lhu        $v0, 0x0($t8)
/* 4D4CC 8005F8AC 21788000 */  addu       $t7, $a0, $zero
/* 4D4D0 8005F8B0 0200E2A5 */  sh         $v0, 0x2($t7)
/* 4D4D4 8005F8B4 00140200 */  sll        $v0, $v0, 16
/* 4D4D8 8005F8B8 02000397 */  lhu        $v1, 0x2($t8)
/* 4D4DC 8005F8BC 035C0200 */  sra        $t3, $v0, 16
/* 4D4E0 8005F8C0 0800E3A5 */  sh         $v1, 0x8($t7)
/* 4D4E4 8005F8C4 001C0300 */  sll        $v1, $v1, 16
/* 4D4E8 8005F8C8 032C0300 */  sra        $a1, $v1, 16
/* 4D4EC 8005F8CC 0880033C */  lui        $v1, %hi(D_800845A0)
/* 4D4F0 8005F8D0 04000497 */  lhu        $a0, 0x4($t8)
/* 4D4F4 8005F8D4 A0456324 */  addiu      $v1, $v1, %lo(D_800845A0)
/* 4D4F8 8005F8D8 00140400 */  sll        $v0, $a0, 16
/* 4D4FC 8005F8DC 03540200 */  sra        $t2, $v0, 16
/* 4D500 8005F8E0 FF03C230 */  andi       $v0, $a2, 0x3FF
/* 4D504 8005F8E4 80100200 */  sll        $v0, $v0, 2
/* 4D508 8005F8E8 21104300 */  addu       $v0, $v0, $v1
/* 4D50C 8005F8EC 0E00E4A5 */  sh         $a0, 0xE($t7)
/* 4D510 8005F8F0 0000478C */  lw         $a3, 0x0($v0)
/* 4D514 8005F8F4 0004C230 */  andi       $v0, $a2, 0x400
/* 4D518 8005F8F8 07004010 */  beqz       $v0, .L8005F918
/* 4D51C 8005F8FC 00140700 */   sll       $v0, $a3, 16
/* 4D520 8005F900 03440200 */  sra        $t0, $v0, 16
/* 4D524 8005F904 0008C230 */  andi       $v0, $a2, 0x800
/* 4D528 8005F908 09004014 */  bnez       $v0, .L8005F930
/* 4D52C 8005F90C 033C0700 */   sra       $a3, $a3, 16
/* 4D530 8005F910 4D7E0108 */  j          .L8005F934
/* 4D534 8005F914 23400800 */   negu      $t0, $t0
.L8005F918:
/* 4D538 8005F918 03440700 */  sra        $t0, $a3, 16
/* 4D53C 8005F91C 003C0700 */  sll        $a3, $a3, 16
/* 4D540 8005F920 0008C230 */  andi       $v0, $a2, 0x800
/* 4D544 8005F924 03004010 */  beqz       $v0, .L8005F934
/* 4D548 8005F928 033C0700 */   sra       $a3, $a3, 16
/* 4D54C 8005F92C 23400800 */  negu       $t0, $t0
.L8005F930:
/* 4D550 8005F930 23380700 */  negu       $a3, $a3
.L8005F934:
/* 4D554 8005F934 18006B01 */  mult       $t3, $t3
/* 4D558 8005F938 12600000 */  mflo       $t4
/* 4D55C 8005F93C 00000000 */  nop
/* 4D560 8005F940 00000000 */  nop
/* 4D564 8005F944 18004A01 */  mult       $t2, $t2
/* 4D568 8005F948 12200000 */  mflo       $a0
/* 4D56C 8005F94C 00000000 */  nop
/* 4D570 8005F950 00000000 */  nop
/* 4D574 8005F954 1800E500 */  mult       $a3, $a1
/* 4D578 8005F958 12800000 */  mflo       $s0
/* 4D57C 8005F95C 00000000 */  nop
/* 4D580 8005F960 00000000 */  nop
/* 4D584 8005F964 18000501 */  mult       $t0, $a1
/* 4D588 8005F968 12180000 */  mflo       $v1
/* 4D58C 8005F96C 23100A00 */  negu       $v0, $t2
/* 4D590 8005F970 00000000 */  nop
/* 4D594 8005F974 18006201 */  mult       $t3, $v0
/* 4D598 8005F978 21308401 */  addu       $a2, $t4, $a0
/* 4D59C 8005F97C 036B1000 */  sra        $t5, $s0, 12
/* 4D5A0 8005F980 03730300 */  sra        $t6, $v1, 12
/* 4D5A4 8005F984 12480000 */  mflo       $t1
/* 4D5A8 8005F988 00F08648 */  mtc2       $a2, $30 /* handwritten instruction */
/* 4D5AC 8005F98C 00000000 */  nop
/* 4D5B0 8005F990 00000000 */  nop
/* 4D5B4 8005F994 00F80348 */  mfc2       $v1, $31 /* handwritten instruction */
/* 4D5B8 8005F998 1100C014 */  bnez       $a2, .L8005F9E0
/* 4D5BC 8005F99C 14000224 */   addiu     $v0, $zero, 0x14
/* 4D5C0 8005F9A0 1800EB00 */  mult       $a3, $t3
/* 4D5C4 8005F9A4 12100000 */  mflo       $v0
/* 4D5C8 8005F9A8 00000000 */  nop
/* 4D5CC 8005F9AC 00000000 */  nop
/* 4D5D0 8005F9B0 18000A01 */  mult       $t0, $t2
/* 4D5D4 8005F9B4 12180000 */  mflo       $v1
/* 4D5D8 8005F9B8 21104300 */  addu       $v0, $v0, $v1
/* 4D5DC 8005F9BC 23100200 */  negu       $v0, $v0
/* 4D5E0 8005F9C0 02000387 */  lh         $v1, 0x2($t8)
/* 4D5E4 8005F9C4 00000000 */  nop
/* 4D5E8 8005F9C8 02006104 */  bgez       $v1, .L8005F9D4
/* 4D5EC 8005F9CC 032B0200 */   sra       $a1, $v0, 12
/* 4D5F0 8005F9D0 23680D00 */  negu       $t5, $t5
.L8005F9D4:
/* 4D5F4 8005F9D4 2158A001 */  addu       $t3, $t5, $zero
/* 4D5F8 8005F9D8 B57E0108 */  j          .L8005FAD4
/* 4D5FC 8005F9DC 2150C001 */   addu      $t2, $t6, $zero
.L8005F9E0:
/* 4D600 8005F9E0 23184300 */  subu       $v1, $v0, $v1
/* 4D604 8005F9E4 05006018 */  blez       $v1, .L8005F9FC
/* 4D608 8005F9E8 00000000 */   nop
/* 4D60C 8005F9EC 07606C00 */  srav       $t4, $t4, $v1
/* 4D610 8005F9F0 07206400 */  srav       $a0, $a0, $v1
/* 4D614 8005F9F4 07486900 */  srav       $t1, $t1, $v1
/* 4D618 8005F9F8 07306600 */  srav       $a2, $a2, $v1
.L8005F9FC:
/* 4D61C 8005F9FC 2318ED00 */  subu       $v1, $a3, $t5
/* 4D620 8005FA00 18006400 */  mult       $v1, $a0
/* 4D624 8005FA04 12200000 */  mflo       $a0
/* 4D628 8005FA08 23100E01 */  subu       $v0, $t0, $t6
/* 4D62C 8005FA0C 00000000 */  nop
/* 4D630 8005FA10 18004900 */  mult       $v0, $t1
/* 4D634 8005FA14 12800000 */  mflo       $s0
/* 4D638 8005FA18 21209000 */  addu       $a0, $a0, $s0
/* 4D63C 8005FA1C 00000000 */  nop
/* 4D640 8005FA20 1A008600 */  div        $zero, $a0, $a2
/* 4D644 8005FA24 0200C014 */  bnez       $a2, .L8005FA30
/* 4D648 8005FA28 00000000 */   nop
/* 4D64C 8005FA2C 0D000700 */  break      7
.L8005FA30:
/* 4D650 8005FA30 FFFF0124 */  addiu      $at, $zero, -0x1
/* 4D654 8005FA34 0400C114 */  bne        $a2, $at, .L8005FA48
/* 4D658 8005FA38 0080013C */   lui       $at, (0x80000000 >> 16)
/* 4D65C 8005FA3C 02008114 */  bne        $a0, $at, .L8005FA48
/* 4D660 8005FA40 00000000 */   nop
/* 4D664 8005FA44 0D000600 */  break      6
.L8005FA48:
/* 4D668 8005FA48 12200000 */  mflo       $a0
/* 4D66C 8005FA4C 00000000 */  nop
/* 4D670 8005FA50 00000000 */  nop
/* 4D674 8005FA54 18006900 */  mult       $v1, $t1
/* 4D678 8005FA58 12180000 */  mflo       $v1
/* 4D67C 8005FA5C 00000000 */  nop
/* 4D680 8005FA60 00000000 */  nop
/* 4D684 8005FA64 18004C00 */  mult       $v0, $t4
/* 4D688 8005FA68 12100000 */  mflo       $v0
/* 4D68C 8005FA6C 21186200 */  addu       $v1, $v1, $v0
/* 4D690 8005FA70 00000000 */  nop
/* 4D694 8005FA74 1A006600 */  div        $zero, $v1, $a2
/* 4D698 8005FA78 0200C014 */  bnez       $a2, .L8005FA84
/* 4D69C 8005FA7C 00000000 */   nop
/* 4D6A0 8005FA80 0D000700 */  break      7
.L8005FA84:
/* 4D6A4 8005FA84 FFFF0124 */  addiu      $at, $zero, -0x1
/* 4D6A8 8005FA88 0400C114 */  bne        $a2, $at, .L8005FA9C
/* 4D6AC 8005FA8C 0080013C */   lui       $at, (0x80000000 >> 16)
/* 4D6B0 8005FA90 02006114 */  bne        $v1, $at, .L8005FA9C
/* 4D6B4 8005FA94 00000000 */   nop
/* 4D6B8 8005FA98 0D000600 */  break      6
.L8005FA9C:
/* 4D6BC 8005FA9C 12180000 */  mflo       $v1
/* 4D6C0 8005FAA0 00000000 */  nop
/* 4D6C4 8005FAA4 00000000 */  nop
/* 4D6C8 8005FAA8 1800EB00 */  mult       $a3, $t3
/* 4D6CC 8005FAAC 12100000 */  mflo       $v0
/* 4D6D0 8005FAB0 00000000 */  nop
/* 4D6D4 8005FAB4 00000000 */  nop
/* 4D6D8 8005FAB8 18000A01 */  mult       $t0, $t2
/* 4D6DC 8005FABC 2158A401 */  addu       $t3, $t5, $a0
/* 4D6E0 8005FAC0 12380000 */  mflo       $a3
/* 4D6E4 8005FAC4 21104700 */  addu       $v0, $v0, $a3
/* 4D6E8 8005FAC8 23100200 */  negu       $v0, $v0
/* 4D6EC 8005FACC 032B0200 */  sra        $a1, $v0, 12
/* 4D6F0 8005FAD0 2150C301 */  addu       $t2, $t6, $v1
.L8005FAD4:
/* 4D6F4 8005FAD4 0000ABA7 */  sh         $t3, 0x0($sp)
/* 4D6F8 8005FAD8 0400EBA5 */  sh         $t3, 0x4($t7)
/* 4D6FC 8005FADC 0200A5A7 */  sh         $a1, 0x2($sp)
/* 4D700 8005FAE0 0A00E5A5 */  sh         $a1, 0xA($t7)
/* 4D704 8005FAE4 0400AAA7 */  sh         $t2, 0x4($sp)
/* 4D708 8005FAE8 1000EAA5 */  sh         $t2, 0x10($t7)
/* 4D70C 8005FAEC 00000C87 */  lh         $t4, 0x0($t8)
/* 4D710 8005FAF0 02000D87 */  lh         $t5, 0x2($t8)
/* 4D714 8005FAF4 0000CC48 */  ctc2       $t4, $0 /* handwritten instruction */
/* 4D718 8005FAF8 04000E87 */  lh         $t6, 0x4($t8)
/* 4D71C 8005FAFC 0010CD48 */  ctc2       $t5, $2 /* handwritten instruction */
/* 4D720 8005FB00 0020CE48 */  ctc2       $t6, $4 /* handwritten instruction */
/* 4D724 8005FB04 0000AC87 */  lh         $t4, 0x0($sp)
/* 4D728 8005FB08 0200AD87 */  lh         $t5, 0x2($sp)
/* 4D72C 8005FB0C 0400AE87 */  lh         $t6, 0x4($sp)
/* 4D730 8005FB10 00488C48 */  mtc2       $t4, $9 /* handwritten instruction */
/* 4D734 8005FB14 00508D48 */  mtc2       $t5, $10 /* handwritten instruction */
/* 4D738 8005FB18 00588E48 */  mtc2       $t6, $11 /* handwritten instruction */
/* 4D73C 8005FB1C 00000000 */  nop
/* 4D740 8005FB20 00000000 */  nop
/* 4D744 8005FB24 0C00784B */  OP         1
/* 4D748 8005FB28 00C80C48 */  mfc2       $t4, $25 /* handwritten instruction */
/* 4D74C 8005FB2C 00D00D48 */  mfc2       $t5, $26 /* handwritten instruction */
/* 4D750 8005FB30 00D80E48 */  mfc2       $t6, $27 /* handwritten instruction */
/* 4D754 8005FB34 0000ECA5 */  sh         $t4, 0x0($t7)
/* 4D758 8005FB38 0600EDA5 */  sh         $t5, 0x6($t7)
/* 4D75C 8005FB3C 0C00EEA5 */  sh         $t6, 0xC($t7)
/* 4D760 8005FB40 0800B08F */  lw         $s0, 0x8($sp)
/* 4D764 8005FB44 0800E003 */  jr         $ra
/* 4D768 8005FB48 1000BD27 */   addiu     $sp, $sp, 0x10
.size VehPhysForce_RotAxisAngle, . - VehPhysForce_RotAxisAngle
