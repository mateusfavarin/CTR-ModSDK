.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel Level_AmbientSound
/* 1C804 8002EBE4 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 1C808 8002EBE8 ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 1C80C 8002EBEC 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 1C810 8002EBF0 6C00BFAF */  sw         $ra, 0x6C($sp)
/* 1C814 8002EBF4 6800BEAF */  sw         $fp, 0x68($sp)
/* 1C818 8002EBF8 6400B7AF */  sw         $s7, 0x64($sp)
/* 1C81C 8002EBFC 6000B6AF */  sw         $s6, 0x60($sp)
/* 1C820 8002EC00 5C00B5AF */  sw         $s5, 0x5C($sp)
/* 1C824 8002EC04 5800B4AF */  sw         $s4, 0x58($sp)
/* 1C828 8002EC08 5400B3AF */  sw         $s3, 0x54($sp)
/* 1C82C 8002EC0C 5000B2AF */  sw         $s2, 0x50($sp)
/* 1C830 8002EC10 4C00B1AF */  sw         $s1, 0x4C($sp)
/* 1C834 8002EC14 4800B0AF */  sw         $s0, 0x48($sp)
/* 1C838 8002EC18 101A6B8C */  lw         $t3, 0x1A10($v1)
/* 1C83C 8002EC1C 00000000 */  nop
/* 1C840 8002EC20 1900622D */  sltiu      $v0, $t3, 0x19
/* 1C844 8002EC24 3000ABAF */  sw         $t3, 0x30($sp)
/* 1C848 8002EC28 60016B8C */  lw         $t3, 0x160($v1)
/* 1C84C 8002EC2C 1F014010 */  beqz       $v0, .L8002F0AC
/* 1C850 8002EC30 2800ABAF */   sw        $t3, 0x28($sp)
/* 1C854 8002EC34 A81C6290 */  lbu        $v0, 0x1CA8($v1)
/* 1C858 8002EC38 00000000 */  nop
/* 1C85C 8002EC3C 0300422C */  sltiu      $v0, $v0, 0x3
/* 1C860 8002EC40 1A014010 */  beqz       $v0, .L8002F0AC
/* 1C864 8002EC44 06000224 */   addiu     $v0, $zero, 0x6
/* 1C868 8002EC48 3000AB8F */  lw         $t3, 0x30($sp)
/* 1C86C 8002EC4C 00000000 */  nop
/* 1C870 8002EC50 05006211 */  beq        $t3, $v0, .L8002EC68
/* 1C874 8002EC54 08000224 */   addiu     $v0, $zero, 0x8
/* 1C878 8002EC58 3F006211 */  beq        $t3, $v0, .L8002ED58
/* 1C87C 8002EC5C 21980000 */   addu      $s3, $zero, $zero
/* 1C880 8002EC60 8BBB0008 */  j          .L8002EE2C
/* 1C884 8002EC64 FF7F053C */   lui       $a1, (0x7FFFFFFF >> 16)
.L8002EC68:
/* 1C888 8002EC68 21280000 */  addu       $a1, $zero, $zero
/* 1C88C 8002EC6C 2180A000 */  addu       $s0, $a1, $zero
/* 1C890 8002EC70 A81C6290 */  lbu        $v0, 0x1CA8($v1)
/* 1C894 8002EC74 00000000 */  nop
/* 1C898 8002EC78 21004010 */  beqz       $v0, .L8002ED00
/* 1C89C 8002EC7C 2198A000 */   addu      $s3, $a1, $zero
/* 1C8A0 8002EC80 01000A24 */  addiu      $t2, $zero, 0x1
/* 1C8A4 8002EC84 0B000924 */  addiu      $t1, $zero, 0xB
/* 1C8A8 8002EC88 FFFF0824 */  addiu      $t0, $zero, -0x1
/* 1C8AC 8002EC8C 87000724 */  addiu      $a3, $zero, 0x87
/* 1C8B0 8002EC90 21304000 */  addu       $a2, $v0, $zero
/* 1C8B4 8002EC94 21206000 */  addu       $a0, $v1, $zero
.L8002EC98:
/* 1C8B8 8002EC98 EC24838C */  lw         $v1, 0x24EC($a0)
/* 1C8BC 8002EC9C 00000000 */  nop
/* 1C8C0 8002ECA0 C2006290 */  lbu        $v0, 0xC2($v1)
/* 1C8C4 8002ECA4 00000000 */  nop
/* 1C8C8 8002ECA8 02004014 */  bnez       $v0, .L8002ECB4
/* 1C8CC 8002ECAC 00000000 */   nop
/* 1C8D0 8002ECB0 01000524 */  addiu      $a1, $zero, 0x1
.L8002ECB4:
/* 1C8D4 8002ECB4 02004A14 */  bne        $v0, $t2, .L8002ECC0
/* 1C8D8 8002ECB8 00000000 */   nop
/* 1C8DC 8002ECBC 01000524 */  addiu      $a1, $zero, 0x1
.L8002ECC0:
/* 1C8E0 8002ECC0 02004914 */  bne        $v0, $t1, .L8002ECCC
/* 1C8E4 8002ECC4 00000000 */   nop
/* 1C8E8 8002ECC8 01000524 */  addiu      $a1, $zero, 0x1
.L8002ECCC:
/* 1C8EC 8002ECCC 5C03628C */  lw         $v0, 0x35C($v1)
/* 1C8F0 8002ECD0 00000000 */  nop
/* 1C8F4 8002ECD4 34004284 */  lh         $v0, 0x34($v0)
/* 1C8F8 8002ECD8 00000000 */  nop
/* 1C8FC 8002ECDC 04004810 */  beq        $v0, $t0, .L8002ECF0
/* 1C900 8002ECE0 00000000 */   nop
/* 1C904 8002ECE4 02004714 */  bne        $v0, $a3, .L8002ECF0
/* 1C908 8002ECE8 00000000 */   nop
/* 1C90C 8002ECEC 01001024 */  addiu      $s0, $zero, 0x1
.L8002ECF0:
/* 1C910 8002ECF0 01007326 */  addiu      $s3, $s3, 0x1
/* 1C914 8002ECF4 2A106602 */  slt        $v0, $s3, $a2
/* 1C918 8002ECF8 E7FF4014 */  bnez       $v0, .L8002EC98
/* 1C91C 8002ECFC 04008424 */   addiu     $a0, $a0, 0x4
.L8002ED00:
/* 1C920 8002ED00 0800A010 */  beqz       $a1, .L8002ED24
/* 1C924 8002ED04 FF000224 */   addiu     $v0, $zero, 0xFF
/* 1C928 8002ED08 1000A2AF */  sw         $v0, 0x10($sp)
/* 1C92C 8002ED0C 0980043C */  lui        $a0, %hi(D_800962C4)
/* 1C930 8002ED10 C4628424 */  addiu      $a0, $a0, %lo(D_800962C4)
/* 1C934 8002ED14 86000524 */  addiu      $a1, $zero, 0x86
/* 1C938 8002ED18 06000624 */  addiu      $a2, $zero, 0x6
/* 1C93C 8002ED1C AEBA000C */  jal        Level_RandomFX
/* 1C940 8002ED20 5A000724 */   addiu     $a3, $zero, 0x5A
.L8002ED24:
/* 1C944 8002ED24 05000012 */  beqz       $s0, .L8002ED3C
/* 1C948 8002ED28 0980043C */   lui       $a0, %hi(D_800962D4)
/* 1C94C 8002ED2C D4628424 */  addiu      $a0, $a0, %lo(D_800962D4)
/* 1C950 8002ED30 87000524 */  addiu      $a1, $zero, 0x87
/* 1C954 8002ED34 52BB0008 */  j          .L8002ED48
/* 1C958 8002ED38 FF000624 */   addiu     $a2, $zero, 0xFF
.L8002ED3C:
/* 1C95C 8002ED3C D4628424 */  addiu      $a0, $a0, %lo(D_800962D4)
/* 1C960 8002ED40 87000524 */  addiu      $a1, $zero, 0x87
/* 1C964 8002ED44 21300000 */  addu       $a2, $zero, $zero
.L8002ED48:
/* 1C968 8002ED48 91BA000C */  jal        Level_SoundLoopFade
/* 1C96C 8002ED4C 08000724 */   addiu     $a3, $zero, 0x8
/* 1C970 8002ED50 2BBC0008 */  j          .L8002F0AC
/* 1C974 8002ED54 00000000 */   nop
.L8002ED58:
/* 1C978 8002ED58 21280000 */  addu       $a1, $zero, $zero
/* 1C97C 8002ED5C 2180A000 */  addu       $s0, $a1, $zero
/* 1C980 8002ED60 A81C6290 */  lbu        $v0, 0x1CA8($v1)
/* 1C984 8002ED64 00000000 */  nop
/* 1C988 8002ED68 18004010 */  beqz       $v0, .L8002EDCC
/* 1C98C 8002ED6C 2198A000 */   addu      $s3, $a1, $zero
/* 1C990 8002ED70 FFFF0924 */  addiu      $t1, $zero, -0x1
/* 1C994 8002ED74 88000824 */  addiu      $t0, $zero, 0x88
/* 1C998 8002ED78 8B000724 */  addiu      $a3, $zero, 0x8B
/* 1C99C 8002ED7C 21304000 */  addu       $a2, $v0, $zero
/* 1C9A0 8002ED80 21206000 */  addu       $a0, $v1, $zero
.L8002ED84:
/* 1C9A4 8002ED84 EC24838C */  lw         $v1, 0x24EC($a0)
/* 1C9A8 8002ED88 00000000 */  nop
/* 1C9AC 8002ED8C 5C03628C */  lw         $v0, 0x35C($v1)
/* 1C9B0 8002ED90 00000000 */  nop
/* 1C9B4 8002ED94 34004284 */  lh         $v0, 0x34($v0)
/* 1C9B8 8002ED98 00000000 */  nop
/* 1C9BC 8002ED9C 07004910 */  beq        $v0, $t1, .L8002EDBC
/* 1C9C0 8002EDA0 00000000 */   nop
/* 1C9C4 8002EDA4 02004814 */  bne        $v0, $t0, .L8002EDB0
/* 1C9C8 8002EDA8 00000000 */   nop
/* 1C9CC 8002EDAC 01000524 */  addiu      $a1, $zero, 0x1
.L8002EDB0:
/* 1C9D0 8002EDB0 02004714 */  bne        $v0, $a3, .L8002EDBC
/* 1C9D4 8002EDB4 00000000 */   nop
/* 1C9D8 8002EDB8 01001024 */  addiu      $s0, $zero, 0x1
.L8002EDBC:
/* 1C9DC 8002EDBC 01007326 */  addiu      $s3, $s3, 0x1
/* 1C9E0 8002EDC0 2A106602 */  slt        $v0, $s3, $a2
/* 1C9E4 8002EDC4 EFFF4014 */  bnez       $v0, .L8002ED84
/* 1C9E8 8002EDC8 04008424 */   addiu     $a0, $a0, 0x4
.L8002EDCC:
/* 1C9EC 8002EDCC 0500A010 */  beqz       $a1, .L8002EDE4
/* 1C9F0 8002EDD0 0980043C */   lui       $a0, %hi(D_800962C4)
/* 1C9F4 8002EDD4 C4628424 */  addiu      $a0, $a0, %lo(D_800962C4)
/* 1C9F8 8002EDD8 88000524 */  addiu      $a1, $zero, 0x88
/* 1C9FC 8002EDDC 7CBB0008 */  j          .L8002EDF0
/* 1CA00 8002EDE0 FF000624 */   addiu     $a2, $zero, 0xFF
.L8002EDE4:
/* 1CA04 8002EDE4 C4628424 */  addiu      $a0, $a0, %lo(D_800962C4)
/* 1CA08 8002EDE8 88000524 */  addiu      $a1, $zero, 0x88
/* 1CA0C 8002EDEC 21300000 */  addu       $a2, $zero, $zero
.L8002EDF0:
/* 1CA10 8002EDF0 91BA000C */  jal        Level_SoundLoopFade
/* 1CA14 8002EDF4 08000724 */   addiu     $a3, $zero, 0x8
/* 1CA18 8002EDF8 05000012 */  beqz       $s0, .L8002EE10
/* 1CA1C 8002EDFC 0980043C */   lui       $a0, %hi(D_800962D4)
/* 1CA20 8002EE00 D4628424 */  addiu      $a0, $a0, %lo(D_800962D4)
/* 1CA24 8002EE04 8B000524 */  addiu      $a1, $zero, 0x8B
/* 1CA28 8002EE08 87BB0008 */  j          .L8002EE1C
/* 1CA2C 8002EE0C FF000624 */   addiu     $a2, $zero, 0xFF
.L8002EE10:
/* 1CA30 8002EE10 D4628424 */  addiu      $a0, $a0, %lo(D_800962D4)
/* 1CA34 8002EE14 8B000524 */  addiu      $a1, $zero, 0x8B
/* 1CA38 8002EE18 21300000 */  addu       $a2, $zero, $zero
.L8002EE1C:
/* 1CA3C 8002EE1C 91BA000C */  jal        Level_SoundLoopFade
/* 1CA40 8002EE20 04000724 */   addiu     $a3, $zero, 0x4
/* 1CA44 8002EE24 2BBC0008 */  j          .L8002F0AC
/* 1CA48 8002EE28 00000000 */   nop
.L8002EE2C:
/* 1CA4C 8002EE2C FFFFA534 */  ori        $a1, $a1, (0x7FFFFFFF & 0xFFFF)
/* 1CA50 8002EE30 FFFF0624 */  addiu      $a2, $zero, -0x1
/* 1CA54 8002EE34 2000A427 */  addiu      $a0, $sp, 0x20
/* 1CA58 8002EE38 1800A327 */  addiu      $v1, $sp, 0x18
.L8002EE3C:
/* 1CA5C 8002EE3C 000065AC */  sw         $a1, 0x0($v1)
/* 1CA60 8002EE40 000086AC */  sw         $a2, 0x0($a0)
/* 1CA64 8002EE44 04008424 */  addiu      $a0, $a0, 0x4
/* 1CA68 8002EE48 01007326 */  addiu      $s3, $s3, 0x1
/* 1CA6C 8002EE4C 0200622A */  slti       $v0, $s3, 0x2
/* 1CA70 8002EE50 FAFF4014 */  bnez       $v0, .L8002EE3C
/* 1CA74 8002EE54 04006324 */   addiu     $v1, $v1, 0x4
/* 1CA78 8002EE58 21980000 */  addu       $s3, $zero, $zero
/* 1CA7C 8002EE5C 2000AB27 */  addiu      $t3, $sp, 0x20
/* 1CA80 8002EE60 3400ABAF */  sw         $t3, 0x34($sp)
/* 1CA84 8002EE64 1800AB27 */  addiu      $t3, $sp, 0x18
/* 1CA88 8002EE68 3800ABAF */  sw         $t3, 0x38($sp)
/* 1CA8C 8002EE6C 3C00A0AF */  sw         $zero, 0x3C($sp)
.L8002EE70:
/* 1CA90 8002EE70 3000AB8F */  lw         $t3, 0x30($sp)
/* 1CA94 8002EE74 00000000 */  nop
/* 1CA98 8002EE78 40100B00 */  sll        $v0, $t3, 1
/* 1CA9C 8002EE7C 21106202 */  addu       $v0, $s3, $v0
/* 1CAA0 8002EE80 08800B3C */  lui        $t3, %hi(D_8008398C)
/* 1CAA4 8002EE84 8C396B25 */  addiu      $t3, $t3, %lo(D_8008398C)
/* 1CAA8 8002EE88 21104B00 */  addu       $v0, $v0, $t3
/* 1CAAC 8002EE8C 00004290 */  lbu        $v0, 0x0($v0)
/* 1CAB0 8002EE90 00000000 */  nop
/* 1CAB4 8002EE94 7C004010 */  beqz       $v0, .L8002F088
/* 1CAB8 8002EE98 2C00A2AF */   sw        $v0, 0x2C($sp)
/* 1CABC 8002EE9C 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 1CAC0 8002EEA0 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 1CAC4 8002EEA4 00000000 */  nop
/* 1CAC8 8002EEA8 6001428C */  lw         $v0, 0x160($v0)
/* 1CACC 8002EEAC 00000000 */  nop
/* 1CAD0 8002EEB0 3801428C */  lw         $v0, 0x138($v0)
/* 1CAD4 8002EEB4 05007726 */  addiu      $s7, $s3, 0x5
/* 1CAD8 8002EEB8 2A10E202 */  slt        $v0, $s7, $v0
/* 1CADC 8002EEBC 6D004010 */  beqz       $v0, .L8002F074
/* 1CAE0 8002EEC0 C0181700 */   sll       $v1, $s7, 3
/* 1CAE4 8002EEC4 2800AB8F */  lw         $t3, 0x28($sp)
/* 1CAE8 8002EEC8 00000000 */  nop
/* 1CAEC 8002EECC 3C01628D */  lw         $v0, 0x13C($t3)
/* 1CAF0 8002EED0 00000000 */  nop
/* 1CAF4 8002EED4 21304300 */  addu       $a2, $v0, $v1
/* 1CAF8 8002EED8 0000C38C */  lw         $v1, 0x0($a2)
/* 1CAFC 8002EEDC 00000000 */  nop
/* 1CB00 8002EEE0 0A006228 */  slti       $v0, $v1, 0xA
/* 1CB04 8002EEE4 63004010 */  beqz       $v0, .L8002F074
/* 1CB08 8002EEE8 00000000 */   nop
/* 1CB0C 8002EEEC 2F006018 */  blez       $v1, .L8002EFAC
/* 1CB10 8002EEF0 21900000 */   addu      $s2, $zero, $zero
/* 1CB14 8002EEF4 21A04002 */  addu       $s4, $s2, $zero
/* 1CB18 8002EEF8 3C00A78F */  lw         $a3, 0x3C($sp)
/* 1CB1C 8002EEFC 3800B58F */  lw         $s5, 0x38($sp)
.L8002EF00:
/* 1CB20 8002EF00 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 1CB24 8002EF04 ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 1CB28 8002EF08 00000000 */  nop
/* 1CB2C 8002EF0C A81C8290 */  lbu        $v0, 0x1CA8($a0)
/* 1CB30 8002EF10 00000000 */  nop
/* 1CB34 8002EF14 20004010 */  beqz       $v0, .L8002EF98
/* 1CB38 8002EF18 21800000 */   addu      $s0, $zero, $zero
/* 1CB3C 8002EF1C 21F08002 */  addu       $fp, $s4, $zero
/* 1CB40 8002EF20 3400AB8F */  lw         $t3, 0x34($sp)
/* 1CB44 8002EF24 68011124 */  addiu      $s1, $zero, 0x168
/* 1CB48 8002EF28 21B06701 */  addu       $s6, $t3, $a3
.L8002EF2C:
/* 1CB4C 8002EF2C 2800AB8F */  lw         $t3, 0x28($sp)
/* 1CB50 8002EF30 00000000 */  nop
/* 1CB54 8002EF34 3C01638D */  lw         $v1, 0x13C($t3)
/* 1CB58 8002EF38 C0101700 */  sll        $v0, $s7, 3
/* 1CB5C 8002EF3C 21104300 */  addu       $v0, $v0, $v1
/* 1CB60 8002EF40 0400458C */  lw         $a1, 0x4($v0)
/* 1CB64 8002EF44 21209100 */  addu       $a0, $a0, $s1
/* 1CB68 8002EF48 4000A6AF */  sw         $a2, 0x40($sp)
/* 1CB6C 8002EF4C 4400A7AF */  sw         $a3, 0x44($sp)
/* 1CB70 8002EF50 EFB9000C */  jal        GTE_GetSquaredDistance
/* 1CB74 8002EF54 2128BE00 */   addu      $a1, $a1, $fp
/* 1CB78 8002EF58 0000A38E */  lw         $v1, 0x0($s5)
/* 1CB7C 8002EF5C 4000A68F */  lw         $a2, 0x40($sp)
/* 1CB80 8002EF60 4400A78F */  lw         $a3, 0x44($sp)
/* 1CB84 8002EF64 2A184300 */  slt        $v1, $v0, $v1
/* 1CB88 8002EF68 03006010 */  beqz       $v1, .L8002EF78
/* 1CB8C 8002EF6C 00000000 */   nop
/* 1CB90 8002EF70 0000A2AE */  sw         $v0, 0x0($s5)
/* 1CB94 8002EF74 0000D2AE */  sw         $s2, 0x0($s6)
.L8002EF78:
/* 1CB98 8002EF78 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 1CB9C 8002EF7C ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 1CBA0 8002EF80 00000000 */  nop
/* 1CBA4 8002EF84 A81C8290 */  lbu        $v0, 0x1CA8($a0)
/* 1CBA8 8002EF88 01001026 */  addiu      $s0, $s0, 0x1
/* 1CBAC 8002EF8C 2A100202 */  slt        $v0, $s0, $v0
/* 1CBB0 8002EF90 E6FF4014 */  bnez       $v0, .L8002EF2C
/* 1CBB4 8002EF94 10013126 */   addiu     $s1, $s1, 0x110
.L8002EF98:
/* 1CBB8 8002EF98 0000C28C */  lw         $v0, 0x0($a2)
/* 1CBBC 8002EF9C 01005226 */  addiu      $s2, $s2, 0x1
/* 1CBC0 8002EFA0 2A104202 */  slt        $v0, $s2, $v0
/* 1CBC4 8002EFA4 D6FF4014 */  bnez       $v0, .L8002EF00
/* 1CBC8 8002EFA8 06009426 */   addiu     $s4, $s4, 0x6
.L8002EFAC:
/* 1CBCC 8002EFAC 3800AB8F */  lw         $t3, 0x38($sp)
/* 1CBD0 8002EFB0 00000000 */  nop
/* 1CBD4 8002EFB4 0000648D */  lw         $a0, 0x0($t3)
/* 1CBD8 8002EFB8 86B1010C */  jal        SquareRoot0_stub
/* 1CBDC 8002EFBC 00000000 */   nop
/* 1CBE0 8002EFC0 14006016 */  bnez       $s3, .L8002F014
/* 1CBE4 8002EFC4 21304000 */   addu      $a2, $v0, $zero
/* 1CBE8 8002EFC8 3000AB8F */  lw         $t3, 0x30($sp)
/* 1CBEC 8002EFCC 09000224 */  addiu      $v0, $zero, 0x9
/* 1CBF0 8002EFD0 0B006215 */  bne        $t3, $v0, .L8002F000
/* 1CBF4 8002EFD4 0980043C */   lui       $a0, %hi(D_800962D0)
/* 1CBF8 8002EFD8 2120C000 */  addu       $a0, $a2, $zero
/* 1CBFC 8002EFDC 2C010524 */  addiu      $a1, $zero, 0x12C
/* 1CC00 8002EFE0 70170624 */  addiu      $a2, $zero, 0x1770
/* 1CC04 8002EFE4 FF000724 */  addiu      $a3, $zero, 0xFF
/* 1CC08 8002EFE8 E763010C */  jal        DECOMP_VehCalc_MapToRange
/* 1CC0C 8002EFEC 1000A0AF */   sw        $zero, 0x10($sp)
/* 1CC10 8002EFF0 0980043C */  lui        $a0, %hi(D_800962C4)
/* 1CC14 8002EFF4 C4628424 */  addiu      $a0, $a0, %lo(D_800962C4)
/* 1CC18 8002EFF8 12BC0008 */  j          .L8002F048
/* 1CC1C 8002EFFC 86000524 */   addiu     $a1, $zero, 0x86
.L8002F000:
/* 1CC20 8002F000 2C00A58F */  lw         $a1, 0x2C($sp)
/* 1CC24 8002F004 13BA000C */  jal        CalculateVolumeFromDistance
/* 1CC28 8002F008 D0628424 */   addiu     $a0, $a0, %lo(D_800962D0)
/* 1CC2C 8002F00C 22BC0008 */  j          .L8002F088
/* 1CC30 8002F010 00000000 */   nop
.L8002F014:
/* 1CC34 8002F014 3000AB8F */  lw         $t3, 0x30($sp)
/* 1CC38 8002F018 03000224 */  addiu      $v0, $zero, 0x3
/* 1CC3C 8002F01C 10006215 */  bne        $t3, $v0, .L8002F060
/* 1CC40 8002F020 0980043C */   lui       $a0, %hi(D_800962E0)
/* 1CC44 8002F024 2120C000 */  addu       $a0, $a2, $zero
/* 1CC48 8002F028 2C010524 */  addiu      $a1, $zero, 0x12C
/* 1CC4C 8002F02C 70170624 */  addiu      $a2, $zero, 0x1770
/* 1CC50 8002F030 FF000724 */  addiu      $a3, $zero, 0xFF
/* 1CC54 8002F034 E763010C */  jal        DECOMP_VehCalc_MapToRange
/* 1CC58 8002F038 1000A0AF */   sw        $zero, 0x10($sp)
/* 1CC5C 8002F03C 0980043C */  lui        $a0, %hi(D_800962D4)
/* 1CC60 8002F040 D4628424 */  addiu      $a0, $a0, %lo(D_800962D4)
/* 1CC64 8002F044 85000524 */  addiu      $a1, $zero, 0x85
.L8002F048:
/* 1CC68 8002F048 06000624 */  addiu      $a2, $zero, 0x6
/* 1CC6C 8002F04C 5A000724 */  addiu      $a3, $zero, 0x5A
/* 1CC70 8002F050 AEBA000C */  jal        Level_RandomFX
/* 1CC74 8002F054 1000A2AF */   sw        $v0, 0x10($sp)
/* 1CC78 8002F058 22BC0008 */  j          .L8002F088
/* 1CC7C 8002F05C 00000000 */   nop
.L8002F060:
/* 1CC80 8002F060 2C00A58F */  lw         $a1, 0x2C($sp)
/* 1CC84 8002F064 13BA000C */  jal        CalculateVolumeFromDistance
/* 1CC88 8002F068 E0628424 */   addiu     $a0, $a0, %lo(D_800962E0)
/* 1CC8C 8002F06C 22BC0008 */  j          .L8002F088
/* 1CC90 8002F070 00000000 */   nop
.L8002F074:
/* 1CC94 8002F074 C408828F */  lw         $v0, 0x8C4($gp) /* Failed to symbolize address 0x000008C4 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 1CC98 8002F078 00000000 */  nop
/* 1CC9C 8002F07C 02004014 */  bnez       $v0, .L8002F088
/* 1CCA0 8002F080 01000224 */   addiu     $v0, $zero, 0x1
/* 1CCA4 8002F084 C40882AF */  sw         $v0, 0x8C4($gp) /* Failed to symbolize address 0x000008C4 for %gp_rel. Make sure this address is within the recognized valid address space */
.L8002F088:
/* 1CCA8 8002F088 3800AB8F */  lw         $t3, 0x38($sp)
/* 1CCAC 8002F08C 01007326 */  addiu      $s3, $s3, 0x1
/* 1CCB0 8002F090 04006B25 */  addiu      $t3, $t3, 0x4
/* 1CCB4 8002F094 3800ABAF */  sw         $t3, 0x38($sp)
/* 1CCB8 8002F098 3C00AB8F */  lw         $t3, 0x3C($sp)
/* 1CCBC 8002F09C 0200622A */  slti       $v0, $s3, 0x2
/* 1CCC0 8002F0A0 04006B25 */  addiu      $t3, $t3, 0x4
/* 1CCC4 8002F0A4 72FF4014 */  bnez       $v0, .L8002EE70
/* 1CCC8 8002F0A8 3C00ABAF */   sw        $t3, 0x3C($sp)
.L8002F0AC:
/* 1CCCC 8002F0AC 6C00BF8F */  lw         $ra, 0x6C($sp)
/* 1CCD0 8002F0B0 6800BE8F */  lw         $fp, 0x68($sp)
/* 1CCD4 8002F0B4 6400B78F */  lw         $s7, 0x64($sp)
/* 1CCD8 8002F0B8 6000B68F */  lw         $s6, 0x60($sp)
/* 1CCDC 8002F0BC 5C00B58F */  lw         $s5, 0x5C($sp)
/* 1CCE0 8002F0C0 5800B48F */  lw         $s4, 0x58($sp)
/* 1CCE4 8002F0C4 5400B38F */  lw         $s3, 0x54($sp)
/* 1CCE8 8002F0C8 5000B28F */  lw         $s2, 0x50($sp)
/* 1CCEC 8002F0CC 4C00B18F */  lw         $s1, 0x4C($sp)
/* 1CCF0 8002F0D0 4800B08F */  lw         $s0, 0x48($sp)
/* 1CCF4 8002F0D4 0800E003 */  jr         $ra
/* 1CCF8 8002F0D8 7000BD27 */   addiu     $sp, $sp, 0x70
.size Level_AmbientSound, . - Level_AmbientSound
