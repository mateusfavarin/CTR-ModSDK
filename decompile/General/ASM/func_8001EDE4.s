.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel func_8001EDE4
/* CA04 8001EDE4 0000AB84 */  lh         $t3, 0x0($a1)
/* CA08 8001EDE8 0200AC84 */  lh         $t4, 0x2($a1)
/* CA0C 8001EDEC 0400AD84 */  lh         $t5, 0x4($a1)
/* CA10 8001EDF0 0000CE84 */  lh         $t6, 0x0($a2)
/* CA14 8001EDF4 0200CF84 */  lh         $t7, 0x2($a2)
/* CA18 8001EDF8 0400D884 */  lh         $t8, 0x4($a2)
/* CA1C 8001EDFC 0000E184 */  lh         $at, 0x0($a3)
/* CA20 8001EE00 0200E284 */  lh         $v0, 0x2($a3)
/* CA24 8001EE04 0400F984 */  lh         $t9, 0x4($a3)
/* CA28 8001EE08 2370CB01 */  subu       $t6, $t6, $t3
/* CA2C 8001EE0C 2378EC01 */  subu       $t7, $t7, $t4
/* CA30 8001EE10 23C00D03 */  subu       $t8, $t8, $t5
/* CA34 8001EE14 23082B00 */  subu       $at, $at, $t3
/* CA38 8001EE18 23104C00 */  subu       $v0, $v0, $t4
/* CA3C 8001EE1C 23C82D03 */  subu       $t9, $t9, $t5
/* CA40 8001EE20 FFFFC331 */  andi       $v1, $t6, 0xFFFF
/* CA44 8001EE24 00440F00 */  sll        $t0, $t7, 16
/* CA48 8001EE28 25186800 */  or         $v1, $v1, $t0
/* CA4C 8001EE2C FFFF0833 */  andi       $t0, $t8, 0xFFFF
/* CA50 8001EE30 004C0100 */  sll        $t1, $at, 16
/* CA54 8001EE34 25400901 */  or         $t0, $t0, $t1
/* CA58 8001EE38 FFFF4930 */  andi       $t1, $v0, 0xFFFF
/* CA5C 8001EE3C 00541900 */  sll        $t2, $t9, 16
/* CA60 8001EE40 25482A01 */  or         $t1, $t1, $t2
/* CA64 8001EE44 0000C348 */  ctc2       $v1, $0 /* handwritten instruction */
/* CA68 8001EE48 0008C848 */  ctc2       $t0, $1 /* handwritten instruction */
/* CA6C 8001EE4C 0010C948 */  ctc2       $t1, $2 /* handwritten instruction */
/* CA70 8001EE50 00008348 */  mtc2       $v1, $0 /* handwritten instruction */
/* CA74 8001EE54 00089848 */  mtc2       $t8, $1 /* handwritten instruction */
/* CA78 8001EE58 00000000 */  nop
/* CA7C 8001EE5C 00000000 */  nop
/* CA80 8001EE60 1260404A */  MVMVA      0, 0, 0, 3, 0
/* CA84 8001EE64 00D00348 */  mfc2       $v1, $26 /* handwritten instruction */
/* CA88 8001EE68 00C80848 */  mfc2       $t0, $25 /* handwritten instruction */
/* CA8C 8001EE6C 00F08348 */  mtc2       $v1, $30 /* handwritten instruction */
/* CA90 8001EE70 00000000 */  nop
/* CA94 8001EE74 00000000 */  nop
/* CA98 8001EE78 00F80948 */  mfc2       $t1, $31 /* handwritten instruction */
/* CA9C 8001EE7C 00000000 */  nop
/* CAA0 8001EE80 FEFF2925 */  addiu      $t1, $t1, -0x2
/* CAA4 8001EE84 03002105 */  bgez       $t1, .L8001EE94
/* CAA8 8001EE88 F4FF2A25 */   addiu     $t2, $t1, -0xC
/* CAAC 8001EE8C 04000104 */  bgez       $zero, .L8001EEA0
/* CAB0 8001EE90 00000924 */   addiu     $t1, $zero, 0x0
.L8001EE94:
/* CAB4 8001EE94 02004019 */  blez       $t2, .L8001EEA0
/* CAB8 8001EE98 00000000 */   nop
/* CABC 8001EE9C 0C000924 */  addiu      $t1, $zero, 0xC
.L8001EEA0:
/* CAC0 8001EEA0 04182301 */  sllv       $v1, $v1, $t1
/* CAC4 8001EEA4 F4FF2925 */  addiu      $t1, $t1, -0xC
/* CAC8 8001EEA8 02002105 */  bgez       $t1, .L8001EEB4
/* CACC 8001EEAC 22500900 */   neg       $t2, $t1 /* handwritten instruction */
/* CAD0 8001EEB0 07404801 */  srav       $t0, $t0, $t2
.L8001EEB4:
/* CAD4 8001EEB4 08000011 */  beqz       $t0, .L8001EED8
/* CAD8 8001EEB8 00000924 */   addiu     $t1, $zero, 0x0
/* CADC 8001EEBC 1A006800 */  div        $zero, $v1, $t0
/* CAE0 8001EEC0 12500000 */  mflo       $t2
/* CAE4 8001EEC4 04004005 */  bltz       $t2, .L8001EED8
/* CAE8 8001EEC8 00F04325 */   addiu     $v1, $t2, -0x1000
/* CAEC 8001EECC 02006018 */  blez       $v1, .L8001EED8
/* CAF0 8001EED0 21484001 */   addu      $t1, $t2, $zero
/* CAF4 8001EED4 00100924 */  addiu      $t1, $zero, 0x1000
.L8001EED8:
/* CAF8 8001EED8 00408948 */  mtc2       $t1, $8 /* handwritten instruction */
/* CAFC 8001EEDC 00C88B48 */  mtc2       $t3, $25 /* handwritten instruction */
/* CB00 8001EEE0 00D08C48 */  mtc2       $t4, $26 /* handwritten instruction */
/* CB04 8001EEE4 00D88D48 */  mtc2       $t5, $27 /* handwritten instruction */
/* CB08 8001EEE8 00488E48 */  mtc2       $t6, $9 /* handwritten instruction */
/* CB0C 8001EEEC 00508F48 */  mtc2       $t7, $10 /* handwritten instruction */
/* CB10 8001EEF0 00589848 */  mtc2       $t8, $11 /* handwritten instruction */
/* CB14 8001EEF4 00000000 */  nop
/* CB18 8001EEF8 00000000 */  nop
/* CB1C 8001EEFC 3E00A84B */  GPL        1
/* CB20 8001EF00 00C80E48 */  mfc2       $t6, $25 /* handwritten instruction */
/* CB24 8001EF04 00D00F48 */  mfc2       $t7, $26 /* handwritten instruction */
/* CB28 8001EF08 00D81848 */  mfc2       $t8, $27 /* handwritten instruction */
/* CB2C 8001EF0C 00008EA4 */  sh         $t6, 0x0($a0)
/* CB30 8001EF10 02008FA4 */  sh         $t7, 0x2($a0)
/* CB34 8001EF14 0800E003 */  jr         $ra
/* CB38 8001EF18 040098A4 */   sh        $t8, 0x4($a0)
.size func_8001EDE4, . - func_8001EDE4
