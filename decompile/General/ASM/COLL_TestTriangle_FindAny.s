.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel COLL_TestTriangle_FindAny
/* CB70 8001EF50 3C008384 */  lh         $v1, 0x3C($a0)
/* CB74 8001EF54 0600A884 */  lh         $t0, 0x6($a1)
/* CB78 8001EF58 0C00A98C */  lw         $t1, 0xC($a1)
/* CB7C 8001EF5C 1000AA8C */  lw         $t2, 0x10($a1)
/* CB80 8001EF60 01006324 */  addiu      $v1, $v1, 0x1
/* CB84 8001EF64 3C0083A4 */  sh         $v1, 0x3C($a0)
/* CB88 8001EF68 520088A4 */  sh         $t0, 0x52($a0)
/* CB8C 8001EF6C 540089AC */  sw         $t1, 0x54($a0)
/* CB90 8001EF70 58008AAC */  sw         $t2, 0x58($a0)
glabel func_8001EF74
/* CB94 8001EF74 1000838C */  lw         $v1, 0x10($a0)
/* CB98 8001EF78 1C008E84 */  lh         $t6, 0x1C($a0)
/* CB9C 8001EF7C 1E008F84 */  lh         $t7, 0x1E($a0)
/* CBA0 8001EF80 20009884 */  lh         $t8, 0x20($a0)
/* CBA4 8001EF84 10008B84 */  lh         $t3, 0x10($a0)
/* CBA8 8001EF88 12008C84 */  lh         $t4, 0x12($a0)
/* CBAC 8001EF8C 14008D84 */  lh         $t5, 0x14($a0)
/* CBB0 8001EF90 0000C348 */  ctc2       $v1, $0 /* handwritten instruction */
/* CBB4 8001EF94 2370CB01 */  subu       $t6, $t6, $t3
/* CBB8 8001EF98 2378EC01 */  subu       $t7, $t7, $t4
/* CBBC 8001EF9C 23C00D03 */  subu       $t8, $t8, $t5
/* CBC0 8001EFA0 001C0E00 */  sll        $v1, $t6, 16
/* CBC4 8001EFA4 FFFFA831 */  andi       $t0, $t5, 0xFFFF
/* CBC8 8001EFA8 25186800 */  or         $v1, $v1, $t0
/* CBCC 8001EFAC FFFFE831 */  andi       $t0, $t7, 0xFFFF
/* CBD0 8001EFB0 004C1800 */  sll        $t1, $t8, 16
/* CBD4 8001EFB4 25400901 */  or         $t0, $t0, $t1
/* CBD8 8001EFB8 0008C348 */  ctc2       $v1, $1 /* handwritten instruction */
/* CBDC 8001EFBC 0010C848 */  ctc2       $t0, $2 /* handwritten instruction */
/* CBE0 8001EFC0 540080C8 */  lwc2       $0, 0x54($a0)
/* CBE4 8001EFC4 00088A48 */  mtc2       $t2, $1 /* handwritten instruction */
/* CBE8 8001EFC8 03540A00 */  sra        $t2, $t2, 16
/* CBEC 8001EFCC 40530A00 */  sll        $t2, $t2, 13
/* CBF0 8001EFD0 1260404A */  MVMVA      0, 0, 0, 3, 0
/* CBF4 8001EFD4 00D00848 */  mfc2       $t0, $26 /* handwritten instruction */
/* CBF8 8001EFD8 00C80348 */  mfc2       $v1, $25 /* handwritten instruction */
/* CBFC 8001EFDC B7000105 */  bgez       $t0, .L8001F2BC
/* CC00 8001EFE0 23186A00 */   subu      $v1, $v1, $t2
/* CC04 8001EFE4 03430800 */  sra        $t0, $t0, 12
/* CC08 8001EFE8 22180300 */  neg        $v1, $v1 /* handwritten instruction */
/* CC0C 8001EFEC 1A006800 */  div        $zero, $v1, $t0
/* CC10 8001EFF0 00C88B48 */  mtc2       $t3, $25 /* handwritten instruction */
/* CC14 8001EFF4 00D08C48 */  mtc2       $t4, $26 /* handwritten instruction */
/* CC18 8001EFF8 00D88D48 */  mtc2       $t5, $27 /* handwritten instruction */
/* CC1C 8001EFFC 00488E48 */  mtc2       $t6, $9 /* handwritten instruction */
/* CC20 8001F000 00508F48 */  mtc2       $t7, $10 /* handwritten instruction */
/* CC24 8001F004 00589848 */  mtc2       $t8, $11 /* handwritten instruction */
/* CC28 8001F008 12180000 */  mflo       $v1
/* CC2C 8001F00C 00408348 */  mtc2       $v1, $8 /* handwritten instruction */
/* CC30 8001F010 AA006004 */  bltz       $v1, .L8001F2BC
/* CC34 8001F014 00F06824 */   addiu     $t0, $v1, -0x1000
/* CC38 8001F018 A800001D */  bgtz       $t0, .L8001F2BC
/* CC3C 8001F01C 00000000 */   nop
/* CC40 8001F020 3E00A84B */  GPL        1
/* CC44 8001F024 00C80E48 */  mfc2       $t6, $25 /* handwritten instruction */
/* CC48 8001F028 00D00F48 */  mfc2       $t7, $26 /* handwritten instruction */
/* CC4C 8001F02C 00D81848 */  mfc2       $t8, $27 /* handwritten instruction */
/* CC50 8001F030 52008384 */  lh         $v1, 0x52($a0)
/* CC54 8001F034 4C008EA4 */  sh         $t6, 0x4C($a0)
/* CC58 8001F038 4E008FA4 */  sh         $t7, 0x4E($a0)
/* CC5C 8001F03C 500098A4 */  sh         $t8, 0x50($a0)
/* CC60 8001F040 03000824 */  addiu      $t0, $zero, 0x3
/* CC64 8001F044 1C006814 */  bne        $v1, $t0, .L8001F0B8
/* CC68 8001F048 01000824 */   addiu     $t0, $zero, 0x1
/* CC6C 8001F04C 0400AB84 */  lh         $t3, 0x4($a1)
/* CC70 8001F050 0400CD84 */  lh         $t5, 0x4($a2)
/* CC74 8001F054 0400F184 */  lh         $s1, 0x4($a3)
/* CC78 8001F058 2368AB01 */  subu       $t5, $t5, $t3
/* CC7C 8001F05C 23882B02 */  subu       $s1, $s1, $t3
/* CC80 8001F060 23580B03 */  subu       $t3, $t8, $t3
/* CC84 8001F064 0200A105 */  bgez       $t5, .L8001F070
/* CC88 8001F068 2118A001 */   addu      $v1, $t5, $zero
/* CC8C 8001F06C 22180D00 */  neg        $v1, $t5 /* handwritten instruction */
.L8001F070:
/* CC90 8001F070 02002106 */  bgez       $s1, .L8001F07C
/* CC94 8001F074 21402002 */   addu      $t0, $s1, $zero
/* CC98 8001F078 22401100 */  neg        $t0, $s1 /* handwritten instruction */
.L8001F07C:
/* CC9C 8001F07C 23486800 */  subu       $t1, $v1, $t0
/* CCA0 8001F080 06002105 */  bgez       $t1, .L8001F09C
/* CCA4 8001F084 2118A001 */   addu      $v1, $t5, $zero
/* CCA8 8001F088 21682002 */  addu       $t5, $s1, $zero
/* CCAC 8001F08C 21886000 */  addu       $s1, $v1, $zero
/* CCB0 8001F090 2118C000 */  addu       $v1, $a2, $zero
/* CCB4 8001F094 2130E000 */  addu       $a2, $a3, $zero
/* CCB8 8001F098 21386000 */  addu       $a3, $v1, $zero
.L8001F09C:
/* CCBC 8001F09C 0000AC84 */  lh         $t4, 0x0($a1)
/* CCC0 8001F0A0 0000D084 */  lh         $s0, 0x0($a2)
/* CCC4 8001F0A4 0000F284 */  lh         $s2, 0x0($a3)
/* CCC8 8001F0A8 23800C02 */  subu       $s0, $s0, $t4
/* CCCC 8001F0AC 23904C02 */  subu       $s2, $s2, $t4
/* CCD0 8001F0B0 37000104 */  bgez       $zero, .L8001F190
/* CCD4 8001F0B4 2360CC01 */   subu      $t4, $t6, $t4
.L8001F0B8:
/* CCD8 8001F0B8 1B006814 */  bne        $v1, $t0, .L8001F128
/* CCDC 8001F0BC 0000AB84 */   lh        $t3, 0x0($a1)
/* CCE0 8001F0C0 0000CD84 */  lh         $t5, 0x0($a2)
/* CCE4 8001F0C4 0000F184 */  lh         $s1, 0x0($a3)
/* CCE8 8001F0C8 2368AB01 */  subu       $t5, $t5, $t3
/* CCEC 8001F0CC 23882B02 */  subu       $s1, $s1, $t3
/* CCF0 8001F0D0 2358CB01 */  subu       $t3, $t6, $t3
/* CCF4 8001F0D4 0200A105 */  bgez       $t5, .L8001F0E0
/* CCF8 8001F0D8 2118A001 */   addu      $v1, $t5, $zero
/* CCFC 8001F0DC 22180D00 */  neg        $v1, $t5 /* handwritten instruction */
.L8001F0E0:
/* CD00 8001F0E0 02002106 */  bgez       $s1, .L8001F0EC
/* CD04 8001F0E4 21402002 */   addu      $t0, $s1, $zero
/* CD08 8001F0E8 22401100 */  neg        $t0, $s1 /* handwritten instruction */
.L8001F0EC:
/* CD0C 8001F0EC 23486800 */  subu       $t1, $v1, $t0
/* CD10 8001F0F0 06002105 */  bgez       $t1, .L8001F10C
/* CD14 8001F0F4 2118A001 */   addu      $v1, $t5, $zero
/* CD18 8001F0F8 21682002 */  addu       $t5, $s1, $zero
/* CD1C 8001F0FC 21886000 */  addu       $s1, $v1, $zero
/* CD20 8001F100 2118C000 */  addu       $v1, $a2, $zero
/* CD24 8001F104 2130E000 */  addu       $a2, $a3, $zero
/* CD28 8001F108 21386000 */  addu       $a3, $v1, $zero
.L8001F10C:
/* CD2C 8001F10C 0200AC84 */  lh         $t4, 0x2($a1)
/* CD30 8001F110 0200D084 */  lh         $s0, 0x2($a2)
/* CD34 8001F114 0200F284 */  lh         $s2, 0x2($a3)
/* CD38 8001F118 23800C02 */  subu       $s0, $s0, $t4
/* CD3C 8001F11C 23904C02 */  subu       $s2, $s2, $t4
/* CD40 8001F120 1B000104 */  bgez       $zero, .L8001F190
/* CD44 8001F124 2360EC01 */   subu      $t4, $t7, $t4
.L8001F128:
/* CD48 8001F128 0200AB84 */  lh         $t3, 0x2($a1)
/* CD4C 8001F12C 0200CD84 */  lh         $t5, 0x2($a2)
/* CD50 8001F130 0200F184 */  lh         $s1, 0x2($a3)
/* CD54 8001F134 2368AB01 */  subu       $t5, $t5, $t3
/* CD58 8001F138 23882B02 */  subu       $s1, $s1, $t3
/* CD5C 8001F13C 2358EB01 */  subu       $t3, $t7, $t3
/* CD60 8001F140 0200A105 */  bgez       $t5, .L8001F14C
/* CD64 8001F144 2118A001 */   addu      $v1, $t5, $zero
/* CD68 8001F148 22180D00 */  neg        $v1, $t5 /* handwritten instruction */
.L8001F14C:
/* CD6C 8001F14C 02002106 */  bgez       $s1, .L8001F158
/* CD70 8001F150 21402002 */   addu      $t0, $s1, $zero
/* CD74 8001F154 22401100 */  neg        $t0, $s1 /* handwritten instruction */
.L8001F158:
/* CD78 8001F158 23486800 */  subu       $t1, $v1, $t0
/* CD7C 8001F15C 06002105 */  bgez       $t1, .L8001F178
/* CD80 8001F160 2118A001 */   addu      $v1, $t5, $zero
/* CD84 8001F164 21682002 */  addu       $t5, $s1, $zero
/* CD88 8001F168 21886000 */  addu       $s1, $v1, $zero
/* CD8C 8001F16C 2118C000 */  addu       $v1, $a2, $zero
/* CD90 8001F170 2130E000 */  addu       $a2, $a3, $zero
/* CD94 8001F174 21386000 */  addu       $a3, $v1, $zero
.L8001F178:
/* CD98 8001F178 0400AC84 */  lh         $t4, 0x4($a1)
/* CD9C 8001F17C 0400D084 */  lh         $s0, 0x4($a2)
/* CDA0 8001F180 0400F284 */  lh         $s2, 0x4($a3)
/* CDA4 8001F184 23800C02 */  subu       $s0, $s0, $t4
/* CDA8 8001F188 23904C02 */  subu       $s2, $s2, $t4
/* CDAC 8001F18C 23600C03 */  subu       $t4, $t8, $t4
.L8001F190:
/* CDB0 8001F190 00F00E24 */  addiu      $t6, $zero, -0x1000
/* CDB4 8001F194 00F00F24 */  addiu      $t7, $zero, -0x1000
/* CDB8 8001F198 1D00A011 */  beqz       $t5, .L8001F210
/* CDBC 8001F19C 18004D02 */   mult      $s2, $t5
/* CDC0 8001F1A0 12180000 */  mflo       $v1
/* CDC4 8001F1A4 00000000 */  nop
/* CDC8 8001F1A8 00000000 */  nop
/* CDCC 8001F1AC 18003002 */  mult       $s1, $s0
/* CDD0 8001F1B0 12400000 */  mflo       $t0
/* CDD4 8001F1B4 23186800 */  subu       $v1, $v1, $t0
/* CDD8 8001F1B8 83190300 */  sra        $v1, $v1, 6
/* CDDC 8001F1BC 21006010 */  beqz       $v1, .L8001F244
/* CDE0 8001F1C0 18008D01 */   mult      $t4, $t5
/* CDE4 8001F1C4 12400000 */  mflo       $t0
/* CDE8 8001F1C8 00000000 */  nop
/* CDEC 8001F1CC 00000000 */  nop
/* CDF0 8001F1D0 18007001 */  mult       $t3, $s0
/* CDF4 8001F1D4 12480000 */  mflo       $t1
/* CDF8 8001F1D8 23400901 */  subu       $t0, $t0, $t1
/* CDFC 8001F1DC 80410800 */  sll        $t0, $t0, 6
/* CE00 8001F1E0 1A000301 */  div        $zero, $t0, $v1
/* CE04 8001F1E4 12780000 */  mflo       $t7
/* CE08 8001F1E8 1600E005 */  bltz       $t7, .L8001F244
/* CE0C 8001F1EC 00F0E825 */   addiu     $t0, $t7, -0x1000
/* CE10 8001F1F0 1400001D */  bgtz       $t0, .L8001F244
/* CE14 8001F1F4 1800F101 */   mult      $t7, $s1
/* CE18 8001F1F8 12400000 */  mflo       $t0
/* CE1C 8001F1FC 001B0B00 */  sll        $v1, $t3, 12
/* CE20 8001F200 23186800 */  subu       $v1, $v1, $t0
/* CE24 8001F204 1A006D00 */  div        $zero, $v1, $t5
/* CE28 8001F208 0E000104 */  bgez       $zero, .L8001F244
/* CE2C 8001F20C 12700000 */   mflo      $t6
.L8001F210:
/* CE30 8001F210 2A002012 */  beqz       $s1, .L8001F2BC
/* CE34 8001F214 001B0B00 */   sll       $v1, $t3, 12
/* CE38 8001F218 1A007100 */  div        $zero, $v1, $s1
/* CE3C 8001F21C 12780000 */  mflo       $t7
/* CE40 8001F220 0800E005 */  bltz       $t7, .L8001F244
/* CE44 8001F224 00F0E825 */   addiu     $t0, $t7, -0x1000
/* CE48 8001F228 0600001D */  bgtz       $t0, .L8001F244
/* CE4C 8001F22C 1800F201 */   mult      $t7, $s2
/* CE50 8001F230 12400000 */  mflo       $t0
/* CE54 8001F234 001B0C00 */  sll        $v1, $t4, 12
/* CE58 8001F238 23186800 */  subu       $v1, $v1, $t0
/* CE5C 8001F23C 1A007000 */  div        $zero, $v1, $s0
/* CE60 8001F240 12700000 */  mflo       $t6
.L8001F244:
/* CE64 8001F244 6400888C */  lw         $t0, 0x64($a0)
/* CE68 8001F248 1C00C005 */  bltz       $t6, .L8001F2BC
/* CE6C 8001F24C 2118CF01 */   addu      $v1, $t6, $t7
/* CE70 8001F250 00F06324 */  addiu      $v1, $v1, -0x1000
/* CE74 8001F254 12000985 */  lh         $t1, 0x12($t0)
/* CE78 8001F258 1800601C */  bgtz       $v1, .L8001F2BC
/* CE7C 8001F25C 40002931 */   andi      $t1, $t1, 0x40
/* CE80 8001F260 18002015 */  bnez       $t1, .L8001F2C4
/* CE84 8001F264 3E008984 */   lh        $t1, 0x3E($a0)
/* CE88 8001F268 800088AC */  sw         $t0, 0x80($a0)
/* CE8C 8001F26C C8008EA4 */  sh         $t6, 0xC8($a0)
/* CE90 8001F270 CA008FA4 */  sh         $t7, 0xCA($a0)
/* CE94 8001F274 0800A58C */  lw         $a1, 0x8($a1)
/* CE98 8001F278 0800C68C */  lw         $a2, 0x8($a2)
/* CE9C 8001F27C 0800E78C */  lw         $a3, 0x8($a3)
/* CEA0 8001F280 CC0085AC */  sw         $a1, 0xCC($a0)
/* CEA4 8001F284 D00086AC */  sw         $a2, 0xD0($a0)
/* CEA8 8001F288 D40087AC */  sw         $a3, 0xD4($a0)
/* CEAC 8001F28C 01002925 */  addiu      $t1, $t1, 0x1
/* CEB0 8001F290 3E0089A4 */  sh         $t1, 0x3E($a0)
/* CEB4 8001F294 4C00838C */  lw         $v1, 0x4C($a0)
/* CEB8 8001F298 50008884 */  lh         $t0, 0x50($a0)
/* CEBC 8001F29C 5400898C */  lw         $t1, 0x54($a0)
/* CEC0 8001F2A0 58008A8C */  lw         $t2, 0x58($a0)
/* CEC4 8001F2A4 680083AC */  sw         $v1, 0x68($a0)
/* CEC8 8001F2A8 1C0083AC */  sw         $v1, 0x1C($a0)
/* CECC 8001F2AC 6C0088A4 */  sh         $t0, 0x6C($a0)
/* CED0 8001F2B0 200088A4 */  sh         $t0, 0x20($a0)
/* CED4 8001F2B4 700089AC */  sw         $t1, 0x70($a0)
/* CED8 8001F2B8 74008AAC */  sw         $t2, 0x74($a0)
.L8001F2BC:
/* CEDC 8001F2BC 0800E003 */  jr         $ra
/* CEE0 8001F2C0 00000000 */   nop
.L8001F2C4:
/* CEE4 8001F2C4 A401838C */  lw         $v1, 0x1A4($a0)
/* CEE8 8001F2C8 38000891 */  lbu        $t0, 0x38($t0)
/* CEEC 8001F2CC 00000000 */  nop
/* CEF0 8001F2D0 25186800 */  or         $v1, $v1, $t0
/* CEF4 8001F2D4 0800E003 */  jr         $ra
/* CEF8 8001F2D8 A40183AC */   sw        $v1, 0x1A4($a0)
.size COLL_TestTriangle_FindAny, . - COLL_TestTriangle_FindAny
