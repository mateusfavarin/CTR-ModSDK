.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel COLL_TestTriangle_GetNormalVector
/* CEFC 8001F2DC 0000A384 */  lh         $v1, 0x0($a1)
/* CF00 8001F2E0 0200A884 */  lh         $t0, 0x2($a1)
/* CF04 8001F2E4 0400A984 */  lh         $t1, 0x4($a1)
/* CF08 8001F2E8 0000EB84 */  lh         $t3, 0x0($a3)
/* CF0C 8001F2EC 0200EC84 */  lh         $t4, 0x2($a3)
/* CF10 8001F2F0 0400ED84 */  lh         $t5, 0x4($a3)
/* CF14 8001F2F4 0000CE84 */  lh         $t6, 0x0($a2)
/* CF18 8001F2F8 0200CF84 */  lh         $t7, 0x2($a2)
/* CF1C 8001F2FC 0400D884 */  lh         $t8, 0x4($a2)
/* CF20 8001F300 23586301 */  subu       $t3, $t3, $v1
/* CF24 8001F304 23608801 */  subu       $t4, $t4, $t0
/* CF28 8001F308 2368A901 */  subu       $t5, $t5, $t1
/* CF2C 8001F30C 2370C301 */  subu       $t6, $t6, $v1
/* CF30 8001F310 2378E801 */  subu       $t7, $t7, $t0
/* CF34 8001F314 23C00903 */  subu       $t8, $t8, $t1
/* CF38 8001F318 FFFF6B31 */  andi       $t3, $t3, 0xFFFF
/* CF3C 8001F31C FFFF8C31 */  andi       $t4, $t4, 0xFFFF
/* CF40 8001F320 FFFFAD31 */  andi       $t5, $t5, 0xFFFF
/* CF44 8001F324 0000CB48 */  ctc2       $t3, $0 /* handwritten instruction */
/* CF48 8001F328 0010CC48 */  ctc2       $t4, $2 /* handwritten instruction */
/* CF4C 8001F32C 0020CD48 */  ctc2       $t5, $4 /* handwritten instruction */
/* CF50 8001F330 00488E48 */  mtc2       $t6, $9 /* handwritten instruction */
/* CF54 8001F334 00508F48 */  mtc2       $t7, $10 /* handwritten instruction */
/* CF58 8001F338 00589848 */  mtc2       $t8, $11 /* handwritten instruction */
/* CF5C 8001F33C AB018390 */  lbu        $v1, 0x1AB($a0)
/* CF60 8001F340 AA018890 */  lbu        $t0, 0x1AA($a0)
/* CF64 8001F344 0C00704B */  OP         0
/* CF68 8001F348 0000AE8C */  lw         $t6, 0x0($a1)
/* CF6C 8001F34C 0400B894 */  lhu        $t8, 0x4($a1)
/* CF70 8001F350 A8018984 */  lh         $t1, 0x1A8($a0)
/* CF74 8001F354 00C80B48 */  mfc2       $t3, $25 /* handwritten instruction */
/* CF78 8001F358 00D00C48 */  mfc2       $t4, $26 /* handwritten instruction */
/* CF7C 8001F35C 07586B00 */  srav       $t3, $t3, $v1
/* CF80 8001F360 18006901 */  mult       $t3, $t1
/* CF84 8001F364 07606C00 */  srav       $t4, $t4, $v1
/* CF88 8001F368 12580000 */  mflo       $t3
/* CF8C 8001F36C 00D80D48 */  mfc2       $t5, $27 /* handwritten instruction */
/* CF90 8001F370 0000CE48 */  ctc2       $t6, $0 /* handwritten instruction */
/* CF94 8001F374 18008901 */  mult       $t4, $t1
/* CF98 8001F378 07686D00 */  srav       $t5, $t5, $v1
/* CF9C 8001F37C 12600000 */  mflo       $t4
/* CFA0 8001F380 0008D848 */  ctc2       $t8, $1 /* handwritten instruction */
/* CFA4 8001F384 07580B01 */  srav       $t3, $t3, $t0
/* CFA8 8001F388 1800A901 */  mult       $t5, $t1
/* CFAC 8001F38C 12680000 */  mflo       $t5
/* CFB0 8001F390 07600C01 */  srav       $t4, $t4, $t0
/* CFB4 8001F394 07680D01 */  srav       $t5, $t5, $t0
/* CFB8 8001F398 00488B48 */  mtc2       $t3, $9 /* handwritten instruction */
/* CFBC 8001F39C 00508C48 */  mtc2       $t4, $10 /* handwritten instruction */
/* CFC0 8001F3A0 00588D48 */  mtc2       $t5, $11 /* handwritten instruction */
/* CFC4 8001F3A4 0C00ABA4 */  sh         $t3, 0xC($a1)
/* CFC8 8001F3A8 0E00ACA4 */  sh         $t4, 0xE($a1)
/* CFCC 8001F3AC 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* CFD0 8001F3B0 00C80348 */  mfc2       $v1, $25 /* handwritten instruction */
/* CFD4 8001F3B4 1000ADA4 */  sh         $t5, 0x10($a1)
/* CFD8 8001F3B8 43180300 */  sra        $v1, $v1, 1
/* CFDC 8001F3BC 1200A3A4 */  sh         $v1, 0x12($a1)
/* CFE0 8001F3C0 02006105 */  bgez       $t3, .L8001F3CC
/* CFE4 8001F3C4 00000000 */   nop
/* CFE8 8001F3C8 22580B00 */  neg        $t3, $t3 /* handwritten instruction */
.L8001F3CC:
/* CFEC 8001F3CC 02008105 */  bgez       $t4, .L8001F3D8
/* CFF0 8001F3D0 00000000 */   nop
/* CFF4 8001F3D4 22600C00 */  neg        $t4, $t4 /* handwritten instruction */
.L8001F3D8:
/* CFF8 8001F3D8 0200A105 */  bgez       $t5, .L8001F3E4
/* CFFC 8001F3DC 00000000 */   nop
/* D000 8001F3E0 22680D00 */  neg        $t5, $t5 /* handwritten instruction */
.L8001F3E4:
/* D004 8001F3E4 01000824 */  addiu      $t0, $zero, 0x1
/* D008 8001F3E8 23186C01 */  subu       $v1, $t3, $t4
/* D00C 8001F3EC 05006004 */  bltz       $v1, .L8001F404
/* D010 8001F3F0 23186D01 */   subu      $v1, $t3, $t5
/* D014 8001F3F4 07006004 */  bltz       $v1, .L8001F414
/* D018 8001F3F8 00000000 */   nop
/* D01C 8001F3FC 05000104 */  bgez       $zero, .L8001F414
/* D020 8001F400 02000824 */   addiu     $t0, $zero, 0x2
.L8001F404:
/* D024 8001F404 23188D01 */  subu       $v1, $t4, $t5
/* D028 8001F408 02006004 */  bltz       $v1, .L8001F414
/* D02C 8001F40C 00000000 */   nop
/* D030 8001F410 03000824 */  addiu      $t0, $zero, 0x3
.L8001F414:
/* D034 8001F414 0800E003 */  jr         $ra
/* D038 8001F418 0600A8A4 */   sh        $t0, 0x6($a1)
.size COLL_TestTriangle_GetNormalVector, . - COLL_TestTriangle_GetNormalVector
