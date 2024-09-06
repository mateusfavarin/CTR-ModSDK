.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel COLL_Scrub
/* E878 80020C58 A8FFBD27 */  addiu      $sp, $sp, -0x58
/* E87C 80020C5C 4400B5AF */  sw         $s5, 0x44($sp)
/* E880 80020C60 21A8C000 */  addu       $s5, $a2, $zero
/* E884 80020C64 5400BFAF */  sw         $ra, 0x54($sp)
/* E888 80020C68 5000BEAF */  sw         $fp, 0x50($sp)
/* E88C 80020C6C 4C00B7AF */  sw         $s7, 0x4C($sp)
/* E890 80020C70 4800B6AF */  sw         $s6, 0x48($sp)
/* E894 80020C74 4000B4AF */  sw         $s4, 0x40($sp)
/* E898 80020C78 3C00B3AF */  sw         $s3, 0x3C($sp)
/* E89C 80020C7C 3800B2AF */  sw         $s2, 0x38($sp)
/* E8A0 80020C80 3400B1AF */  sw         $s1, 0x34($sp)
/* E8A4 80020C84 3000B0AF */  sw         $s0, 0x30($sp)
/* E8A8 80020C88 5C00A5AF */  sw         $a1, 0x5C($sp)
/* E8AC 80020C8C 6400A7AF */  sw         $a3, 0x64($sp)
/* E8B0 80020C90 7000A296 */  lhu        $v0, 0x70($s5)
/* E8B4 80020C94 6800B48F */  lw         $s4, 0x68($sp)
/* E8B8 80020C98 1000A2A7 */  sh         $v0, 0x10($sp)
/* E8BC 80020C9C 7200A296 */  lhu        $v0, 0x72($s5)
/* E8C0 80020CA0 00000000 */  nop
/* E8C4 80020CA4 1200A2A7 */  sh         $v0, 0x12($sp)
/* E8C8 80020CA8 7400A296 */  lhu        $v0, 0x74($s5)
/* E8CC 80020CAC 21908000 */  addu       $s2, $a0, $zero
/* E8D0 80020CB0 1400A2A7 */  sh         $v0, 0x14($sp)
/* E8D4 80020CB4 0A044286 */  lh         $v0, 0x40A($s2)
/* E8D8 80020CB8 00000000 */  nop
/* E8DC 80020CBC 6F004010 */  beqz       $v0, .L80020E7C
/* E8E0 80020CC0 00000000 */   nop
/* E8E4 80020CC4 3E00A286 */  lh         $v0, 0x3E($s5)
/* E8E8 80020CC8 00000000 */  nop
/* E8EC 80020CCC 6B004010 */  beqz       $v0, .L80020E7C
/* E8F0 80020CD0 00000000 */   nop
/* E8F4 80020CD4 8000A48E */  lw         $a0, 0x80($s5)
/* E8F8 80020CD8 00000000 */  nop
/* E8FC 80020CDC 12008294 */  lhu        $v0, 0x12($a0)
/* E900 80020CE0 00000000 */  nop
/* E904 80020CE4 00104230 */  andi       $v0, $v0, 0x1000
/* E908 80020CE8 64004010 */  beqz       $v0, .L80020E7C
/* E90C 80020CEC 06000224 */   addiu     $v0, $zero, 0x6
/* E910 80020CF0 7E00A392 */  lbu        $v1, 0x7E($s5)
/* E914 80020CF4 00000000 */  nop
/* E918 80020CF8 60006210 */  beq        $v1, $v0, .L80020E7C
/* E91C 80020CFC 00000000 */   nop
/* E920 80020D00 5003428E */  lw         $v0, 0x350($s2)
/* E924 80020D04 00000000 */  nop
/* E928 80020D08 5C008210 */  beq        $a0, $v0, .L80020E7C
/* E92C 80020D0C 00000000 */   nop
/* E930 80020D10 8E034286 */  lh         $v0, 0x38E($s2)
/* E934 80020D14 00000000 */  nop
/* E938 80020D18 02004104 */  bgez       $v0, .L80020D24
/* E93C 80020D1C 00000000 */   nop
/* E940 80020D20 23100200 */  negu       $v0, $v0
.L80020D24:
/* E944 80020D24 00034228 */  slti       $v0, $v0, 0x300
/* E948 80020D28 54004010 */  beqz       $v0, .L80020E7C
/* E94C 80020D2C 00000000 */   nop
/* E950 80020D30 90034286 */  lh         $v0, 0x390($s2)
/* E954 80020D34 00000000 */  nop
/* E958 80020D38 02004104 */  bgez       $v0, .L80020D44
/* E95C 80020D3C 00000000 */   nop
/* E960 80020D40 23100200 */  negu       $v0, $v0
.L80020D44:
/* E964 80020D44 00034228 */  slti       $v0, $v0, 0x300
/* E968 80020D48 4C004010 */  beqz       $v0, .L80020E7C
/* E96C 80020D4C 00000000 */   nop
/* E970 80020D50 9E034286 */  lh         $v0, 0x39E($s2)
/* E974 80020D54 00000000 */  nop
/* E978 80020D58 48004014 */  bnez       $v0, .L80020E7C
/* E97C 80020D5C 00000000 */   nop
/* E980 80020D60 D402428E */  lw         $v0, 0x2D4($s2)
/* E984 80020D64 6800A386 */  lh         $v1, 0x68($s5)
/* E988 80020D68 03120200 */  sra        $v0, $v0, 8
/* E98C 80020D6C 23884300 */  subu       $s1, $v0, $v1
/* E990 80020D70 DC02428E */  lw         $v0, 0x2DC($s2)
/* E994 80020D74 6C00A386 */  lh         $v1, 0x6C($s5)
/* E998 80020D78 03120200 */  sra        $v0, $v0, 8
/* E99C 80020D7C 23984300 */  subu       $s3, $v0, $v1
/* E9A0 80020D80 D802428E */  lw         $v0, 0x2D8($s2)
/* E9A4 80020D84 6A00A386 */  lh         $v1, 0x6A($s5)
/* E9A8 80020D88 03120200 */  sra        $v0, $v0, 8
/* E9AC 80020D8C 23804300 */  subu       $s0, $v0, $v1
/* E9B0 80020D90 25103002 */  or         $v0, $s1, $s0
/* E9B4 80020D94 25105300 */  or         $v0, $v0, $s3
/* E9B8 80020D98 38004010 */  beqz       $v0, .L80020E7C
/* E9BC 80020D9C 18003102 */   mult      $s1, $s1
/* E9C0 80020DA0 12180000 */  mflo       $v1
/* E9C4 80020DA4 00000000 */  nop
/* E9C8 80020DA8 00000000 */  nop
/* E9CC 80020DAC 18001002 */  mult       $s0, $s0
/* E9D0 80020DB0 12480000 */  mflo       $t1
/* E9D4 80020DB4 00000000 */  nop
/* E9D8 80020DB8 00000000 */  nop
/* E9DC 80020DBC 18007302 */  mult       $s3, $s3
/* E9E0 80020DC0 21280000 */  addu       $a1, $zero, $zero
/* E9E4 80020DC4 21206900 */  addu       $a0, $v1, $t1
/* E9E8 80020DC8 12100000 */  mflo       $v0
/* E9EC 80020DCC 1C64010C */  jal        VehCalc_FastSqrt
/* E9F0 80020DD0 21208200 */   addu      $a0, $a0, $v0
/* E9F4 80020DD4 21284000 */  addu       $a1, $v0, $zero
/* E9F8 80020DD8 00231100 */  sll        $a0, $s1, 12
/* E9FC 80020DDC 1A008500 */  div        $zero, $a0, $a1
/* EA00 80020DE0 0200A014 */  bnez       $a1, .L80020DEC
/* EA04 80020DE4 00000000 */   nop
/* EA08 80020DE8 0D000700 */  break      7
.L80020DEC:
/* EA0C 80020DEC FFFF0124 */  addiu      $at, $zero, -0x1
/* EA10 80020DF0 0400A114 */  bne        $a1, $at, .L80020E04
/* EA14 80020DF4 0080013C */   lui       $at, (0x80000000 >> 16)
/* EA18 80020DF8 02008114 */  bne        $a0, $at, .L80020E04
/* EA1C 80020DFC 00000000 */   nop
/* EA20 80020E00 0D000600 */  break      6
.L80020E04:
/* EA24 80020E04 12200000 */  mflo       $a0
/* EA28 80020E08 001B1000 */  sll        $v1, $s0, 12
/* EA2C 80020E0C 00000000 */  nop
/* EA30 80020E10 1A006500 */  div        $zero, $v1, $a1
/* EA34 80020E14 0200A014 */  bnez       $a1, .L80020E20
/* EA38 80020E18 00000000 */   nop
/* EA3C 80020E1C 0D000700 */  break      7
.L80020E20:
/* EA40 80020E20 FFFF0124 */  addiu      $at, $zero, -0x1
/* EA44 80020E24 0400A114 */  bne        $a1, $at, .L80020E38
/* EA48 80020E28 0080013C */   lui       $at, (0x80000000 >> 16)
/* EA4C 80020E2C 02006114 */  bne        $v1, $at, .L80020E38
/* EA50 80020E30 00000000 */   nop
/* EA54 80020E34 0D000600 */  break      6
.L80020E38:
/* EA58 80020E38 12180000 */  mflo       $v1
/* EA5C 80020E3C 00131300 */  sll        $v0, $s3, 12
/* EA60 80020E40 00000000 */  nop
/* EA64 80020E44 1A004500 */  div        $zero, $v0, $a1
/* EA68 80020E48 0200A014 */  bnez       $a1, .L80020E54
/* EA6C 80020E4C 00000000 */   nop
/* EA70 80020E50 0D000700 */  break      7
.L80020E54:
/* EA74 80020E54 FFFF0124 */  addiu      $at, $zero, -0x1
/* EA78 80020E58 0400A114 */  bne        $a1, $at, .L80020E6C
/* EA7C 80020E5C 0080013C */   lui       $at, (0x80000000 >> 16)
/* EA80 80020E60 02004114 */  bne        $v0, $at, .L80020E6C
/* EA84 80020E64 00000000 */   nop
/* EA88 80020E68 0D000600 */  break      6
.L80020E6C:
/* EA8C 80020E6C 12100000 */  mflo       $v0
/* EA90 80020E70 1000A4A7 */  sh         $a0, 0x10($sp)
/* EA94 80020E74 1200A3A7 */  sh         $v1, 0x12($sp)
/* EA98 80020E78 1400A2A7 */  sh         $v0, 0x14($sp)
.L80020E7C:
/* EA9C 80020E7C 0000828E */  lw         $v0, 0x0($s4)
/* EAA0 80020E80 1000A387 */  lh         $v1, 0x10($sp)
/* EAA4 80020E84 C3100200 */  sra        $v0, $v0, 3
/* EAA8 80020E88 18004300 */  mult       $v0, $v1
/* EAAC 80020E8C 0400828E */  lw         $v0, 0x4($s4)
/* EAB0 80020E90 12800000 */  mflo       $s0
/* EAB4 80020E94 1200A387 */  lh         $v1, 0x12($sp)
/* EAB8 80020E98 C3100200 */  sra        $v0, $v0, 3
/* EABC 80020E9C 18004300 */  mult       $v0, $v1
/* EAC0 80020EA0 0800828E */  lw         $v0, 0x8($s4)
/* EAC4 80020EA4 12200000 */  mflo       $a0
/* EAC8 80020EA8 1400A387 */  lh         $v1, 0x14($sp)
/* EACC 80020EAC C3100200 */  sra        $v0, $v0, 3
/* EAD0 80020EB0 18004300 */  mult       $v0, $v1
/* EAD4 80020EB4 21800402 */  addu       $s0, $s0, $a0
/* EAD8 80020EB8 12180000 */  mflo       $v1
/* EADC 80020EBC 21800302 */  addu       $s0, $s0, $v1
/* EAE0 80020EC0 43821000 */  sra        $s0, $s0, 9
/* EAE4 80020EC4 00F6022A */  slti       $v0, $s0, -0xA00
/* EAE8 80020EC8 05004010 */  beqz       $v0, .L80020EE0
/* EAEC 80020ECC 00000000 */   nop
/* EAF0 80020ED0 C802428E */  lw         $v0, 0x2C8($s2)
/* EAF4 80020ED4 00000000 */  nop
/* EAF8 80020ED8 80004234 */  ori        $v0, $v0, 0x80
/* EAFC 80020EDC C80242AE */  sw         $v0, 0x2C8($s2)
.L80020EE0:
/* EB00 80020EE0 0E00A286 */  lh         $v0, 0xE($s5)
/* EB04 80020EE4 00000000 */  nop
/* EB08 80020EE8 23800202 */  subu       $s0, $s0, $v0
/* EB0C 80020EEC 78010106 */  bgez       $s0, .L800214D0
/* EB10 80020EF0 21100000 */   addu      $v0, $zero, $zero
/* EB14 80020EF4 6400A88F */  lw         $t0, 0x64($sp)
/* EB18 80020EF8 00000000 */  nop
/* EB1C 80020EFC 04001E8D */  lw         $fp, 0x4($t0)
/* EB20 80020F00 00000000 */  nop
/* EB24 80020F04 0400C233 */  andi       $v0, $fp, 0x4
/* EB28 80020F08 06004014 */  bnez       $v0, .L80020F24
/* EB2C 80020F0C 0800C233 */   andi      $v0, $fp, 0x8
/* EB30 80020F10 C802428E */  lw         $v0, 0x2C8($s2)
/* EB34 80020F14 00000000 */  nop
/* EB38 80020F18 00204234 */  ori        $v0, $v0, 0x2000
/* EB3C 80020F1C C80242AE */  sw         $v0, 0x2C8($s2)
/* EB40 80020F20 0800C233 */  andi       $v0, $fp, 0x8
.L80020F24:
/* EB44 80020F24 03004014 */  bnez       $v0, .L80020F34
/* EB48 80020F28 00000000 */   nop
/* EB4C 80020F2C E20340A6 */  sh         $zero, 0x3E2($s2)
/* EB50 80020F30 DE0340A6 */  sh         $zero, 0x3DE($s2)
.L80020F34:
/* EB54 80020F34 6400A88F */  lw         $t0, 0x64($sp)
/* EB58 80020F38 FE034286 */  lh         $v0, 0x3FE($s2)
/* EB5C 80020F3C 0800038D */  lw         $v1, 0x8($t0)
/* EB60 80020F40 04004010 */  beqz       $v0, .L80020F54
/* EB64 80020F44 0300023C */   lui       $v0, (0x3E7FF >> 16)
/* EB68 80020F48 8A034286 */  lh         $v0, 0x38A($s2)
/* EB6C 80020F4C D7830008 */  j          .L80020F5C
/* EB70 80020F50 2A104300 */   slt       $v0, $v0, $v1
.L80020F54:
/* EB74 80020F54 FFE74234 */  ori        $v0, $v0, (0x3E7FF & 0xFFFF)
/* EB78 80020F58 2A104300 */  slt        $v0, $v0, $v1
.L80020F5C:
/* EB7C 80020F5C 0B004014 */  bnez       $v0, .L80020F8C
/* EB80 80020F60 0100C233 */   andi      $v0, $fp, 0x1
/* EB84 80020F64 F0000224 */  addiu      $v0, $zero, 0xF0
/* EB88 80020F68 FE0342A6 */  sh         $v0, 0x3FE($s2)
/* EB8C 80020F6C 8A0343A6 */  sh         $v1, 0x38A($s2)
/* EB90 80020F70 6800A28E */  lw         $v0, 0x68($s5)
/* EB94 80020F74 00000000 */  nop
/* EB98 80020F78 840342AE */  sw         $v0, 0x384($s2)
/* EB9C 80020F7C 6C00A296 */  lhu        $v0, 0x6C($s5)
/* EBA0 80020F80 00000000 */  nop
/* EBA4 80020F84 880342A6 */  sh         $v0, 0x388($s2)
/* EBA8 80020F88 0100C233 */  andi       $v0, $fp, 0x1
.L80020F8C:
/* EBAC 80020F8C 50014010 */  beqz       $v0, .L800214D0
/* EBB0 80020F90 21100000 */   addu      $v0, $zero, $zero
/* EBB4 80020F94 1000A287 */  lh         $v0, 0x10($sp)
/* EBB8 80020F98 00000000 */  nop
/* EBBC 80020F9C 18000202 */  mult       $s0, $v0
/* EBC0 80020FA0 12200000 */  mflo       $a0
/* EBC4 80020FA4 1200A287 */  lh         $v0, 0x12($sp)
/* EBC8 80020FA8 00000000 */  nop
/* EBCC 80020FAC 18000202 */  mult       $s0, $v0
/* EBD0 80020FB0 12480000 */  mflo       $t1
/* EBD4 80020FB4 1400A287 */  lh         $v0, 0x14($sp)
/* EBD8 80020FB8 00000000 */  nop
/* EBDC 80020FBC 18000202 */  mult       $s0, $v0
/* EBE0 80020FC0 6400A88F */  lw         $t0, 0x64($sp)
/* EBE4 80020FC4 2800A0AF */  sw         $zero, 0x28($sp)
/* EBE8 80020FC8 03B30400 */  sra        $s6, $a0, 12
/* EBEC 80020FCC 032B0900 */  sra        $a1, $t1, 12
/* EBF0 80020FD0 0C00028D */  lw         $v0, 0xC($t0)
/* EBF4 80020FD4 12180000 */  mflo       $v1
/* EBF8 80020FD8 11004010 */  beqz       $v0, .L80021020
/* EBFC 80020FDC 03BB0300 */   sra       $s7, $v1, 12
/* EC00 80020FE0 0000828E */  lw         $v0, 0x0($s4)
/* EC04 80020FE4 00000000 */  nop
/* EC08 80020FE8 18004200 */  mult       $v0, $v0
/* EC0C 80020FEC 12200000 */  mflo       $a0
/* EC10 80020FF0 0400828E */  lw         $v0, 0x4($s4)
/* EC14 80020FF4 00000000 */  nop
/* EC18 80020FF8 18004200 */  mult       $v0, $v0
/* EC1C 80020FFC 12180000 */  mflo       $v1
/* EC20 80021000 0800828E */  lw         $v0, 0x8($s4)
/* EC24 80021004 00000000 */  nop
/* EC28 80021008 18004200 */  mult       $v0, $v0
/* EC2C 8002100C 21108300 */  addu       $v0, $a0, $v1
/* EC30 80021010 12480000 */  mflo       $t1
/* EC34 80021014 21104900 */  addu       $v0, $v0, $t1
/* EC38 80021018 C3130200 */  sra        $v0, $v0, 15
/* EC3C 8002101C 2800A2AF */  sw         $v0, 0x28($sp)
.L80021020:
/* EC40 80021020 0000918E */  lw         $s1, 0x0($s4)
/* EC44 80021024 0800938E */  lw         $s3, 0x8($s4)
/* EC48 80021028 23103602 */  subu       $v0, $s1, $s6
/* EC4C 8002102C 21186002 */  addu       $v1, $s3, $zero
/* EC50 80021030 000082AE */  sw         $v0, 0x0($s4)
/* EC54 80021034 0400828E */  lw         $v0, 0x4($s4)
/* EC58 80021038 23187700 */  subu       $v1, $v1, $s7
/* EC5C 8002103C 080083AE */  sw         $v1, 0x8($s4)
/* EC60 80021040 001C0500 */  sll        $v1, $a1, 16
/* EC64 80021044 23104500 */  subu       $v0, $v0, $a1
/* EC68 80021048 040082AE */  sw         $v0, 0x4($s4)
/* EC6C 8002104C FFFFC232 */  andi       $v0, $s6, 0xFFFF
/* EC70 80021050 25104300 */  or         $v0, $v0, $v1
/* EC74 80021054 00008248 */  mtc2       $v0, $0 /* handwritten instruction */
/* EC78 80021058 00089748 */  mtc2       $s7, $1 /* handwritten instruction */
/* EC7C 8002105C 00000000 */  nop
/* EC80 80021060 00000000 */  nop
/* EC84 80021064 12604A4A */  MVMVA      1, 1, 0, 3, 0
/* EC88 80021068 00C81648 */  mfc2       $s6, $25 /* handwritten instruction */
/* EC8C 8002106C 00D00548 */  mfc2       $a1, $26 /* handwritten instruction */
/* EC90 80021070 00D81748 */  mfc2       $s7, $27 /* handwritten instruction */
/* EC94 80021074 3E00A286 */  lh         $v0, 0x3E($s5)
/* EC98 80021078 00000000 */  nop
/* EC9C 8002107C 9A004010 */  beqz       $v0, .L800212E8
/* ECA0 80021080 0200C233 */   andi      $v0, $fp, 0x2
/* ECA4 80021084 2200A296 */  lhu        $v0, 0x22($s5)
/* ECA8 80021088 00000000 */  nop
/* ECAC 8002108C 10004230 */  andi       $v0, $v0, 0x10
/* ECB0 80021090 95004014 */  bnez       $v0, .L800212E8
/* ECB4 80021094 0200C233 */   andi      $v0, $fp, 0x2
/* ECB8 80021098 CC02428E */  lw         $v0, 0x2CC($s2)
/* ECBC 8002109C 00000000 */  nop
/* ECC0 800210A0 01004230 */  andi       $v0, $v0, 0x1
/* ECC4 800210A4 90004014 */  bnez       $v0, .L800212E8
/* ECC8 800210A8 0200C233 */   andi      $v0, $fp, 0x2
/* ECCC 800210AC 8000A28E */  lw         $v0, 0x80($s5)
/* ECD0 800210B0 00000000 */  nop
/* ECD4 800210B4 12004294 */  lhu        $v0, 0x12($v0)
/* ECD8 800210B8 00000000 */  nop
/* ECDC 800210BC 00104230 */  andi       $v0, $v0, 0x1000
/* ECE0 800210C0 88004010 */  beqz       $v0, .L800212E4
/* ECE4 800210C4 1800A327 */   addiu     $v1, $sp, 0x18
/* ECE8 800210C8 1800B1AF */  sw         $s1, 0x18($sp)
/* ECEC 800210CC 1C00A0AF */  sw         $zero, 0x1C($sp)
/* ECF0 800210D0 2000B3AF */  sw         $s3, 0x20($sp)
/* ECF4 800210D4 08006BC8 */  lwc2       $11, 0x8($v1)
/* ECF8 800210D8 000069C8 */  lwc2       $9, 0x0($v1)
/* ECFC 800210DC 04006AC8 */  lwc2       $10, 0x4($v1)
/* ED00 800210E0 1000A227 */  addiu      $v0, $sp, 0x10
/* ED04 800210E4 00004C84 */  lh         $t4, 0x0($v0)
/* ED08 800210E8 02004D84 */  lh         $t5, 0x2($v0)
/* ED0C 800210EC 0000CC48 */  ctc2       $t4, $0 /* handwritten instruction */
/* ED10 800210F0 04004E84 */  lh         $t6, 0x4($v0)
/* ED14 800210F4 0010CD48 */  ctc2       $t5, $2 /* handwritten instruction */
/* ED18 800210F8 0020CE48 */  ctc2       $t6, $4 /* handwritten instruction */
/* ED1C 800210FC 00000000 */  nop
/* ED20 80021100 00000000 */  nop
/* ED24 80021104 0C00784B */  OP         1
/* ED28 80021108 00004C48 */  cfc2       $t4, $0 /* handwritten instruction */
/* ED2C 8002110C 00104D48 */  cfc2       $t5, $2 /* handwritten instruction */
/* ED30 80021110 00204E48 */  cfc2       $t6, $4 /* handwritten instruction */
/* ED34 80021114 00488C48 */  mtc2       $t4, $9 /* handwritten instruction */
/* ED38 80021118 00508D48 */  mtc2       $t5, $10 /* handwritten instruction */
/* ED3C 8002111C 00588E48 */  mtc2       $t6, $11 /* handwritten instruction */
/* ED40 80021120 00C80C48 */  mfc2       $t4, $25 /* handwritten instruction */
/* ED44 80021124 00D00D48 */  mfc2       $t5, $26 /* handwritten instruction */
/* ED48 80021128 00D80E48 */  mfc2       $t6, $27 /* handwritten instruction */
/* ED4C 8002112C 0000CC48 */  ctc2       $t4, $0 /* handwritten instruction */
/* ED50 80021130 0010CD48 */  ctc2       $t5, $2 /* handwritten instruction */
/* ED54 80021134 0020CE48 */  ctc2       $t6, $4 /* handwritten instruction */
/* ED58 80021138 00000000 */  nop
/* ED5C 8002113C 00000000 */  nop
/* ED60 80021140 0C00784B */  OP         1
/* ED64 80021144 000079E8 */  swc2       $25, 0x0($v1)
/* ED68 80021148 04007AE8 */  swc2       $26, 0x4($v1) /* handwritten instruction */
/* ED6C 8002114C 08007BE8 */  swc2       $27, 0x8($v1) /* handwritten instruction */
/* ED70 80021150 1800A28F */  lw         $v0, 0x18($sp)
/* ED74 80021154 00000000 */  nop
/* ED78 80021158 18004200 */  mult       $v0, $v0
/* ED7C 8002115C 12200000 */  mflo       $a0
/* ED80 80021160 1C00A28F */  lw         $v0, 0x1C($sp)
/* ED84 80021164 00000000 */  nop
/* ED88 80021168 18004200 */  mult       $v0, $v0
/* ED8C 8002116C 12180000 */  mflo       $v1
/* ED90 80021170 2000A28F */  lw         $v0, 0x20($sp)
/* ED94 80021174 00000000 */  nop
/* ED98 80021178 18004200 */  mult       $v0, $v0
/* ED9C 8002117C 10000524 */  addiu      $a1, $zero, 0x10
/* EDA0 80021180 21208300 */  addu       $a0, $a0, $v1
/* EDA4 80021184 12480000 */  mflo       $t1
/* EDA8 80021188 1C64010C */  jal        VehCalc_FastSqrt
/* EDAC 8002118C 21208900 */   addu      $a0, $a0, $t1
/* EDB0 80021190 022A0200 */  srl        $a1, $v0, 8
/* EDB4 80021194 8E034486 */  lh         $a0, 0x38E($s2)
/* EDB8 80021198 5300A010 */  beqz       $a1, .L800212E8
/* EDBC 8002119C 0200C233 */   andi      $v0, $fp, 0x2
/* EDC0 800211A0 51008018 */  blez       $a0, .L800212E8
/* EDC4 800211A4 00000000 */   nop
/* EDC8 800211A8 2200A296 */  lhu        $v0, 0x22($s5)
/* EDCC 800211AC 00000000 */  nop
/* EDD0 800211B0 10004234 */  ori        $v0, $v0, 0x10
/* EDD4 800211B4 2200A2A6 */  sh         $v0, 0x22($s5)
/* EDD8 800211B8 1800A28F */  lw         $v0, 0x18($sp)
/* EDDC 800211BC 00000000 */  nop
/* EDE0 800211C0 18004400 */  mult       $v0, $a0
/* EDE4 800211C4 12180000 */  mflo       $v1
/* EDE8 800211C8 00000000 */  nop
/* EDEC 800211CC 00000000 */  nop
/* EDF0 800211D0 1A006500 */  div        $zero, $v1, $a1
/* EDF4 800211D4 0200A014 */  bnez       $a1, .L800211E0
/* EDF8 800211D8 00000000 */   nop
/* EDFC 800211DC 0D000700 */  break      7
.L800211E0:
/* EE00 800211E0 FFFF0124 */  addiu      $at, $zero, -0x1
/* EE04 800211E4 0400A114 */  bne        $a1, $at, .L800211F8
/* EE08 800211E8 0080013C */   lui       $at, (0x80000000 >> 16)
/* EE0C 800211EC 02006114 */  bne        $v1, $at, .L800211F8
/* EE10 800211F0 00000000 */   nop
/* EE14 800211F4 0D000600 */  break      6
.L800211F8:
/* EE18 800211F8 12100000 */  mflo       $v0
/* EE1C 800211FC 00000000 */  nop
/* EE20 80021200 000082AE */  sw         $v0, 0x0($s4)
/* EE24 80021204 1C00A28F */  lw         $v0, 0x1C($sp)
/* EE28 80021208 00000000 */  nop
/* EE2C 8002120C 18004400 */  mult       $v0, $a0
/* EE30 80021210 12180000 */  mflo       $v1
/* EE34 80021214 00000000 */  nop
/* EE38 80021218 00000000 */  nop
/* EE3C 8002121C 1A006500 */  div        $zero, $v1, $a1
/* EE40 80021220 0200A014 */  bnez       $a1, .L8002122C
/* EE44 80021224 00000000 */   nop
/* EE48 80021228 0D000700 */  break      7
.L8002122C:
/* EE4C 8002122C FFFF0124 */  addiu      $at, $zero, -0x1
/* EE50 80021230 0400A114 */  bne        $a1, $at, .L80021244
/* EE54 80021234 0080013C */   lui       $at, (0x80000000 >> 16)
/* EE58 80021238 02006114 */  bne        $v1, $at, .L80021244
/* EE5C 8002123C 00000000 */   nop
/* EE60 80021240 0D000600 */  break      6
.L80021244:
/* EE64 80021244 12100000 */  mflo       $v0
/* EE68 80021248 00000000 */  nop
/* EE6C 8002124C 040082AE */  sw         $v0, 0x4($s4)
/* EE70 80021250 2000A28F */  lw         $v0, 0x20($sp)
/* EE74 80021254 00000000 */  nop
/* EE78 80021258 18004400 */  mult       $v0, $a0
/* EE7C 8002125C 12180000 */  mflo       $v1
/* EE80 80021260 00000000 */  nop
/* EE84 80021264 00000000 */  nop
/* EE88 80021268 1A006500 */  div        $zero, $v1, $a1
/* EE8C 8002126C 0200A014 */  bnez       $a1, .L80021278
/* EE90 80021270 00000000 */   nop
/* EE94 80021274 0D000700 */  break      7
.L80021278:
/* EE98 80021278 FFFF0124 */  addiu      $at, $zero, -0x1
/* EE9C 8002127C 0400A114 */  bne        $a1, $at, .L80021290
/* EEA0 80021280 0080013C */   lui       $at, (0x80000000 >> 16)
/* EEA4 80021284 02006114 */  bne        $v1, $at, .L80021290
/* EEA8 80021288 00000000 */   nop
/* EEAC 8002128C 0D000600 */  break      6
.L80021290:
/* EEB0 80021290 12100000 */  mflo       $v0
/* EEB4 80021294 00000000 */  nop
/* EEB8 80021298 080082AE */  sw         $v0, 0x8($s4)
/* EEBC 8002129C 1000A297 */  lhu        $v0, 0x10($sp)
/* EEC0 800212A0 0000838E */  lw         $v1, 0x0($s4)
/* EEC4 800212A4 00140200 */  sll        $v0, $v0, 16
/* EEC8 800212A8 43140200 */  sra        $v0, $v0, 17
/* EECC 800212AC 23186200 */  subu       $v1, $v1, $v0
/* EED0 800212B0 000083AE */  sw         $v1, 0x0($s4)
/* EED4 800212B4 1200A297 */  lhu        $v0, 0x12($sp)
/* EED8 800212B8 0400838E */  lw         $v1, 0x4($s4)
/* EEDC 800212BC 00140200 */  sll        $v0, $v0, 16
/* EEE0 800212C0 43140200 */  sra        $v0, $v0, 17
/* EEE4 800212C4 23186200 */  subu       $v1, $v1, $v0
/* EEE8 800212C8 040083AE */  sw         $v1, 0x4($s4)
/* EEEC 800212CC 1400A297 */  lhu        $v0, 0x14($sp)
/* EEF0 800212D0 0800838E */  lw         $v1, 0x8($s4)
/* EEF4 800212D4 00140200 */  sll        $v0, $v0, 16
/* EEF8 800212D8 43140200 */  sra        $v0, $v0, 17
/* EEFC 800212DC 23186200 */  subu       $v1, $v1, $v0
/* EF00 800212E0 080083AE */  sw         $v1, 0x8($s4)
.L800212E4:
/* EF04 800212E4 0200C233 */  andi       $v0, $fp, 0x2
.L800212E8:
/* EF08 800212E8 78004010 */  beqz       $v0, .L800214CC
/* EF0C 800212EC 01EC022A */   slti      $v0, $s0, -0x13FF
/* EF10 800212F0 76004010 */  beqz       $v0, .L800214CC
/* EF14 800212F4 1800D602 */   mult      $s6, $s6
/* EF18 800212F8 12100000 */  mflo       $v0
/* EF1C 800212FC 00000000 */  nop
/* EF20 80021300 00000000 */  nop
/* EF24 80021304 1800F702 */  mult       $s7, $s7
/* EF28 80021308 12180000 */  mflo       $v1
/* EF2C 8002130C 21884300 */  addu       $s1, $v0, $v1
/* EF30 80021310 9001023C */  lui        $v0, (0x1900000 >> 16)
/* EF34 80021314 2A105100 */  slt        $v0, $v0, $s1
/* EF38 80021318 6C004010 */  beqz       $v0, .L800214CC
/* EF3C 8002131C 05000224 */   addiu     $v0, $zero, 0x5
/* EF40 80021320 76034392 */  lbu        $v1, 0x376($s2)
/* EF44 80021324 00000000 */  nop
/* EF48 80021328 0A006210 */  beq        $v1, $v0, .L80021354
/* EF4C 8002132C 00000000 */   nop
/* EF50 80021330 4B004282 */  lb         $v0, 0x4B($s2)
/* EF54 80021334 00000000 */  nop
/* EF58 80021338 03004018 */  blez       $v0, .L80021348
/* EF5C 8002133C 21204002 */   addu      $a0, $s2, $zero
/* EF60 80021340 D3840008 */  j          .L8002134C
/* EF64 80021344 2F000524 */   addiu     $a1, $zero, 0x2F
.L80021348:
/* EF68 80021348 1F000524 */  addiu      $a1, $zero, 0x1F
.L8002134C:
/* EF6C 8002134C E898000C */  jal        DECOMP_GAMEPAD_JogCon1
/* EF70 80021350 60000624 */   addiu     $a2, $zero, 0x60
.L80021354:
/* EF74 80021354 6400A88F */  lw         $t0, 0x64($sp)
/* EF78 80021358 00000000 */  nop
/* EF7C 8002135C 0C00048D */  lw         $a0, 0xC($t0)
/* EF80 80021360 00000000 */  nop
/* EF84 80021364 1E008010 */  beqz       $a0, .L800213E0
/* EF88 80021368 0880023C */   lui       $v0, %hi(D_800845A0)
/* EF8C 8002136C A0454224 */  addiu      $v0, $v0, %lo(D_800845A0)
/* EF90 80021370 FF038330 */  andi       $v1, $a0, 0x3FF
/* EF94 80021374 80180300 */  sll        $v1, $v1, 2
/* EF98 80021378 21186200 */  addu       $v1, $v1, $v0
/* EF9C 8002137C 0000658C */  lw         $a1, 0x0($v1)
/* EFA0 80021380 00048230 */  andi       $v0, $a0, 0x400
/* EFA4 80021384 02004014 */  bnez       $v0, .L80021390
/* EFA8 80021388 00088230 */   andi      $v0, $a0, 0x800
/* EFAC 8002138C 002C0500 */  sll        $a1, $a1, 16
.L80021390:
/* EFB0 80021390 02004010 */  beqz       $v0, .L8002139C
/* EFB4 80021394 032C0500 */   sra       $a1, $a1, 16
/* EFB8 80021398 23280500 */  negu       $a1, $a1
.L8002139C:
/* EFBC 8002139C 2800A88F */  lw         $t0, 0x28($sp)
/* EFC0 800213A0 00000000 */  nop
/* EFC4 800213A4 18000501 */  mult       $t0, $a1
/* EFC8 800213A8 12480000 */  mflo       $t1
/* EFCC 800213AC 00000000 */  nop
/* EFD0 800213B0 00000000 */  nop
/* EFD4 800213B4 18001002 */  mult       $s0, $s0
/* EFD8 800213B8 12180000 */  mflo       $v1
/* EFDC 800213BC 03130900 */  sra        $v0, $t1, 12
/* EFE0 800213C0 00000000 */  nop
/* EFE4 800213C4 18004500 */  mult       $v0, $a1
/* EFE8 800213C8 C31B0300 */  sra        $v1, $v1, 15
/* EFEC 800213CC 12480000 */  mflo       $t1
/* EFF0 800213D0 03130900 */  sra        $v0, $t1, 12
/* EFF4 800213D4 2A104300 */  slt        $v0, $v0, $v1
/* EFF8 800213D8 3D004010 */  beqz       $v0, .L800214D0
/* EFFC 800213DC 01000224 */   addiu     $v0, $zero, 0x1
.L800213E0:
/* F000 800213E0 76034392 */  lbu        $v1, 0x376($s2)
/* F004 800213E4 05000224 */  addiu      $v0, $zero, 0x5
/* F008 800213E8 38006210 */  beq        $v1, $v0, .L800214CC
/* F00C 800213EC 9001023C */   lui       $v0, (0x1900000 >> 16)
/* F010 800213F0 2A105100 */  slt        $v0, $v0, $s1
/* F014 800213F4 35004010 */  beqz       $v0, .L800214CC
/* F018 800213F8 FF00063C */   lui       $a2, (0xFF8080 >> 16)
/* F01C 800213FC C802428E */  lw         $v0, 0x2C8($s2)
/* F020 80021400 0100033C */  lui        $v1, (0x10000 >> 16)
/* F024 80021404 24104300 */  and        $v0, $v0, $v1
/* F028 80021408 03004010 */  beqz       $v0, .L80021418
/* F02C 8002140C 8080C634 */   ori       $a2, $a2, (0xFF8080 & 0xFFFF)
/* F030 80021410 FF01063C */  lui        $a2, (0x1FF8080 >> 16)
/* F034 80021414 8080C634 */  ori        $a2, $a2, (0x1FF8080 & 0xFFFF)
.L80021418:
/* F038 80021418 06000424 */  addiu      $a0, $zero, 0x6
/* F03C 8002141C 34A1000C */  jal        DECOMP_OtherFX_Play_LowLevel
/* F040 80021420 01000524 */   addiu     $a1, $zero, 0x1
/* F044 80021424 06000424 */  addiu      $a0, $zero, 0x6
/* F048 80021428 0880023C */  lui        $v0, %hi(D_80086E84)
/* F04C 8002142C 4A004392 */  lbu        $v1, 0x4A($s2)
/* F050 80021430 846E4224 */  addiu      $v0, $v0, %lo(D_80086E84)
/* F054 80021434 40180300 */  sll        $v1, $v1, 1
/* F058 80021438 21186200 */  addu       $v1, $v1, $v0
/* F05C 8002143C 00006584 */  lh         $a1, 0x0($v1)
/* F060 80021440 FAB2000C */  jal        Voiceline_RequestPlay
/* F064 80021444 10000624 */   addiu     $a2, $zero, 0x10
/* F068 80021448 21204002 */  addu       $a0, $s2, $zero
/* F06C 8002144C 08000524 */  addiu      $a1, $zero, 0x8
/* F070 80021450 1099000C */  jal        DECOMP_GAMEPAD_ShockFreq
/* F074 80021454 21300000 */   addu      $a2, $zero, $zero
/* F078 80021458 21204002 */  addu       $a0, $s2, $zero
/* F07C 8002145C 08000524 */  addiu      $a1, $zero, 0x8
/* F080 80021460 3099000C */  jal        DECOMP_GAMEPAD_ShockForce1
/* F084 80021464 7F000624 */   addiu     $a2, $zero, 0x7F
/* F088 80021468 76034292 */  lbu        $v0, 0x376($s2)
/* F08C 8002146C 02000624 */  addiu      $a2, $zero, 0x2
/* F090 80021470 0A004614 */  bne        $v0, $a2, .L8002149C
/* F094 80021474 00000000 */   nop
/* F098 80021478 C6034496 */  lhu        $a0, 0x3C6($s2)
/* F09C 8002147C 9A034296 */  lhu        $v0, 0x39A($s2)
/* F0A0 80021480 F2024396 */  lhu        $v1, 0x2F2($s2)
/* F0A4 80021484 21288000 */  addu       $a1, $a0, $zero
/* F0A8 80021488 21104400 */  addu       $v0, $v0, $a0
/* F0AC 8002148C 23186500 */  subu       $v1, $v1, $a1
/* F0B0 80021490 C60340A6 */  sh         $zero, 0x3C6($s2)
/* F0B4 80021494 9A0342A6 */  sh         $v0, 0x39A($s2)
/* F0B8 80021498 F20243A6 */  sh         $v1, 0x2F2($s2)
.L8002149C:
/* F0BC 8002149C 1C00428E */  lw         $v0, 0x1C($s2)
/* F0C0 800214A0 5C00A48F */  lw         $a0, 0x5C($sp)
/* F0C4 800214A4 520046A0 */  sb         $a2, 0x52($v0)
/* F0C8 800214A8 1C00428E */  lw         $v0, 0x1C($s2)
/* F0CC 800214AC 21284002 */  addu       $a1, $s2, $zero
/* F0D0 800214B0 540040A4 */  sh         $zero, 0x54($v0)
/* F0D4 800214B4 04000224 */  addiu      $v0, $zero, 0x4
/* F0D8 800214B8 4C00A2A0 */  sb         $v0, 0x4C($a1)
/* F0DC 800214BC F58E010C */  jal        DECOMP_VehPhysProc_SlamWall_Init
/* F0E0 800214C0 4D00A0A0 */   sb        $zero, 0x4D($a1)
/* F0E4 800214C4 34850008 */  j          .L800214D0
/* F0E8 800214C8 02000224 */   addiu     $v0, $zero, 0x2
.L800214CC:
/* F0EC 800214CC 01000224 */  addiu      $v0, $zero, 0x1
.L800214D0:
/* F0F0 800214D0 5400BF8F */  lw         $ra, 0x54($sp)
/* F0F4 800214D4 5000BE8F */  lw         $fp, 0x50($sp)
/* F0F8 800214D8 4C00B78F */  lw         $s7, 0x4C($sp)
/* F0FC 800214DC 4800B68F */  lw         $s6, 0x48($sp)
/* F100 800214E0 4400B58F */  lw         $s5, 0x44($sp)
/* F104 800214E4 4000B48F */  lw         $s4, 0x40($sp)
/* F108 800214E8 3C00B38F */  lw         $s3, 0x3C($sp)
/* F10C 800214EC 3800B28F */  lw         $s2, 0x38($sp)
/* F110 800214F0 3400B18F */  lw         $s1, 0x34($sp)
/* F114 800214F4 3000B08F */  lw         $s0, 0x30($sp)
/* F118 800214F8 0800E003 */  jr         $ra
/* F11C 800214FC 5800BD27 */   addiu     $sp, $sp, 0x58
.size COLL_Scrub, . - COLL_Scrub
