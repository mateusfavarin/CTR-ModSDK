.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel TRIG_AngleSinCos_r16r17r18_duplicate
/* 5A050 8006C430 0880033C */  lui        $v1, %hi(D_800845A0)
/* 5A054 8006C434 A0456324 */  addiu      $v1, $v1, %lo(D_800845A0)
/* 5A058 8006C438 FF031132 */  andi       $s1, $s0, 0x3FF
/* 5A05C 8006C43C 80881100 */  sll        $s1, $s1, 2
/* 5A060 8006C440 21187100 */  addu       $v1, $v1, $s1
/* 5A064 8006C444 0000718C */  lw         $s1, 0x0($v1)
/* 5A068 8006C448 00040332 */  andi       $v1, $s0, 0x400
/* 5A06C 8006C44C 05006014 */  bnez       $v1, .L8006C464
/* 5A070 8006C450 00080332 */   andi      $v1, $s0, 0x800
/* 5A074 8006C454 09006014 */  bnez       $v1, .L8006C47C
/* 5A078 8006C458 02941100 */   srl       $s2, $s1, 16
/* 5A07C 8006C45C 0800E003 */  jr         $ra
/* 5A080 8006C460 FFFF3132 */   andi      $s1, $s1, 0xFFFF
.L8006C464:
/* 5A084 8006C464 FFFF3232 */  andi       $s2, $s1, 0xFFFF
/* 5A088 8006C468 09006014 */  bnez       $v1, .L8006C490
/* 5A08C 8006C46C 028C1100 */   srl       $s1, $s1, 16
/* 5A090 8006C470 22901200 */  neg        $s2, $s2 /* handwritten instruction */
/* 5A094 8006C474 0800E003 */  jr         $ra
/* 5A098 8006C478 FFFF5232 */   andi      $s2, $s2, 0xFFFF
.L8006C47C:
/* 5A09C 8006C47C 22901200 */  neg        $s2, $s2 /* handwritten instruction */
/* 5A0A0 8006C480 22881100 */  neg        $s1, $s1 /* handwritten instruction */
/* 5A0A4 8006C484 FFFF5232 */  andi       $s2, $s2, 0xFFFF
/* 5A0A8 8006C488 0800E003 */  jr         $ra
/* 5A0AC 8006C48C FFFF3132 */   andi      $s1, $s1, 0xFFFF
.L8006C490:
/* 5A0B0 8006C490 22881100 */  neg        $s1, $s1 /* handwritten instruction */
/* 5A0B4 8006C494 0800E003 */  jr         $ra
/* 5A0B8 8006C498 FFFF3132 */   andi      $s1, $s1, 0xFFFF
glabel func_8006C49C
/* 5A0BC 8006C49C FFFF093C */  lui        $t1, (0xFFFF0000 >> 16)
/* 5A0C0 8006C4A0 FFFF6331 */  andi       $v1, $t3, 0xFFFF
/* 5A0C4 8006C4A4 24408901 */  and        $t0, $t4, $t1
/* 5A0C8 8006C4A8 25186800 */  or         $v1, $v1, $t0
/* 5A0CC 8006C4AC 00008348 */  mtc2       $v1, $0 /* handwritten instruction */
/* 5A0D0 8006C4B0 00088E48 */  mtc2       $t6, $1 /* handwritten instruction */
/* 5A0D4 8006C4B4 021C0B00 */  srl        $v1, $t3, 16
/* 5A0D8 8006C4B8 00440D00 */  sll        $t0, $t5, 16
/* 5A0DC 8006C4BC 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 5A0E0 8006C4C0 25186800 */  or         $v1, $v1, $t0
/* 5A0E4 8006C4C4 02440E00 */  srl        $t0, $t6, 16
/* 5A0E8 8006C4C8 00108348 */  mtc2       $v1, $2 /* handwritten instruction */
/* 5A0EC 8006C4CC 00188848 */  mtc2       $t0, $3 /* handwritten instruction */
/* 5A0F0 8006C4D0 FFFF8331 */  andi       $v1, $t4, 0xFFFF
/* 5A0F4 8006C4D4 2440A901 */  and        $t0, $t5, $t1
/* 5A0F8 8006C4D8 25186800 */  or         $v1, $v1, $t0
/* 5A0FC 8006C4DC 00480B48 */  mfc2       $t3, $9 /* handwritten instruction */
/* 5A100 8006C4E0 00500C48 */  mfc2       $t4, $10 /* handwritten instruction */
/* 5A104 8006C4E4 00580E48 */  mfc2       $t6, $11 /* handwritten instruction */
/* 5A108 8006C4E8 12E0484A */  MVMVA      1, 0, 1, 3, 0
/* 5A10C 8006C4EC 00208348 */  mtc2       $v1, $4 /* handwritten instruction */
/* 5A110 8006C4F0 00288F48 */  mtc2       $t7, $5 /* handwritten instruction */
/* 5A114 8006C4F4 FFFF6B31 */  andi       $t3, $t3, 0xFFFF
/* 5A118 8006C4F8 00640C00 */  sll        $t4, $t4, 16
/* 5A11C 8006C4FC FFFFCE31 */  andi       $t6, $t6, 0xFFFF
/* 5A120 8006C500 00480348 */  mfc2       $v1, $9 /* handwritten instruction */
/* 5A124 8006C504 00500D48 */  mfc2       $t5, $10 /* handwritten instruction */
/* 5A128 8006C508 00580848 */  mfc2       $t0, $11 /* handwritten instruction */
/* 5A12C 8006C50C 1260494A */  MVMVA      1, 0, 2, 3, 0
/* 5A130 8006C510 001C0300 */  sll        $v1, $v1, 16
/* 5A134 8006C514 25586301 */  or         $t3, $t3, $v1
/* 5A138 8006C518 FFFFAD31 */  andi       $t5, $t5, 0xFFFF
/* 5A13C 8006C51C 00440800 */  sll        $t0, $t0, 16
/* 5A140 8006C520 2570C801 */  or         $t6, $t6, $t0
/* 5A144 8006C524 00480348 */  mfc2       $v1, $9 /* handwritten instruction */
/* 5A148 8006C528 00500848 */  mfc2       $t0, $10 /* handwritten instruction */
/* 5A14C 8006C52C 00580F48 */  mfc2       $t7, $11 /* handwritten instruction */
/* 5A150 8006C530 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 5A154 8006C534 25608301 */  or         $t4, $t4, $v1
/* 5A158 8006C538 00440800 */  sll        $t0, $t0, 16
/* 5A15C 8006C53C 2568A801 */  or         $t5, $t5, $t0
glabel func_8006C540
/* 5A160 8006C540 0000CB48 */  ctc2       $t3, $0 /* handwritten instruction */
/* 5A164 8006C544 0008CC48 */  ctc2       $t4, $1 /* handwritten instruction */
/* 5A168 8006C548 0010CD48 */  ctc2       $t5, $2 /* handwritten instruction */
/* 5A16C 8006C54C 0018CE48 */  ctc2       $t6, $3 /* handwritten instruction */
/* 5A170 8006C550 0800E003 */  jr         $ra
/* 5A174 8006C554 0020CF48 */   ctc2      $t7, $4 /* handwritten instruction */
glabel func_8006C558
/* 5A178 8006C558 FFFF093C */  lui        $t1, (0xFFFF0000 >> 16)
/* 5A17C 8006C55C FFFF6331 */  andi       $v1, $t3, 0xFFFF
/* 5A180 8006C560 24408901 */  and        $t0, $t4, $t1
/* 5A184 8006C564 25186800 */  or         $v1, $v1, $t0
/* 5A188 8006C568 00008348 */  mtc2       $v1, $0 /* handwritten instruction */
/* 5A18C 8006C56C 00088E48 */  mtc2       $t6, $1 /* handwritten instruction */
/* 5A190 8006C570 021C0B00 */  srl        $v1, $t3, 16
/* 5A194 8006C574 00440D00 */  sll        $t0, $t5, 16
/* 5A198 8006C578 12604A4A */  MVMVA      1, 1, 0, 3, 0
/* 5A19C 8006C57C 25186800 */  or         $v1, $v1, $t0
/* 5A1A0 8006C580 02440E00 */  srl        $t0, $t6, 16
/* 5A1A4 8006C584 00108348 */  mtc2       $v1, $2 /* handwritten instruction */
/* 5A1A8 8006C588 00188848 */  mtc2       $t0, $3 /* handwritten instruction */
/* 5A1AC 8006C58C FFFF8331 */  andi       $v1, $t4, 0xFFFF
/* 5A1B0 8006C590 2440A901 */  and        $t0, $t5, $t1
/* 5A1B4 8006C594 25186800 */  or         $v1, $v1, $t0
/* 5A1B8 8006C598 00480B48 */  mfc2       $t3, $9 /* handwritten instruction */
/* 5A1BC 8006C59C 00500C48 */  mfc2       $t4, $10 /* handwritten instruction */
/* 5A1C0 8006C5A0 00580E48 */  mfc2       $t6, $11 /* handwritten instruction */
/* 5A1C4 8006C5A4 12E04A4A */  MVMVA      1, 1, 1, 3, 0
/* 5A1C8 8006C5A8 00208348 */  mtc2       $v1, $4 /* handwritten instruction */
/* 5A1CC 8006C5AC 00288F48 */  mtc2       $t7, $5 /* handwritten instruction */
/* 5A1D0 8006C5B0 FFFF6B31 */  andi       $t3, $t3, 0xFFFF
/* 5A1D4 8006C5B4 00640C00 */  sll        $t4, $t4, 16
/* 5A1D8 8006C5B8 FFFFCE31 */  andi       $t6, $t6, 0xFFFF
/* 5A1DC 8006C5BC 00480348 */  mfc2       $v1, $9 /* handwritten instruction */
/* 5A1E0 8006C5C0 00500D48 */  mfc2       $t5, $10 /* handwritten instruction */
/* 5A1E4 8006C5C4 00580848 */  mfc2       $t0, $11 /* handwritten instruction */
/* 5A1E8 8006C5C8 12604B4A */  MVMVA      1, 1, 2, 3, 0
/* 5A1EC 8006C5CC 001C0300 */  sll        $v1, $v1, 16
/* 5A1F0 8006C5D0 25586301 */  or         $t3, $t3, $v1
/* 5A1F4 8006C5D4 FFFFAD31 */  andi       $t5, $t5, 0xFFFF
/* 5A1F8 8006C5D8 00440800 */  sll        $t0, $t0, 16
/* 5A1FC 8006C5DC 2570C801 */  or         $t6, $t6, $t0
/* 5A200 8006C5E0 00480348 */  mfc2       $v1, $9 /* handwritten instruction */
/* 5A204 8006C5E4 00500848 */  mfc2       $t0, $10 /* handwritten instruction */
/* 5A208 8006C5E8 00580F48 */  mfc2       $t7, $11 /* handwritten instruction */
/* 5A20C 8006C5EC FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 5A210 8006C5F0 25608301 */  or         $t4, $t4, $v1
/* 5A214 8006C5F4 00440800 */  sll        $t0, $t0, 16
/* 5A218 8006C5F8 0800E003 */  jr         $ra
/* 5A21C 8006C5FC 2568A801 */   or        $t5, $t5, $t0
glabel func_8006C600
/* 5A220 8006C600 0040CB48 */  ctc2       $t3, $8 /* handwritten instruction */
/* 5A224 8006C604 0048CC48 */  ctc2       $t4, $9 /* handwritten instruction */
/* 5A228 8006C608 0050CD48 */  ctc2       $t5, $10 /* handwritten instruction */
/* 5A22C 8006C60C 0058CE48 */  ctc2       $t6, $11 /* handwritten instruction */
/* 5A230 8006C610 0800E003 */  jr         $ra
/* 5A234 8006C614 0060CF48 */   ctc2      $t7, $12 /* handwritten instruction */
.size TRIG_AngleSinCos_r16r17r18_duplicate, . - TRIG_AngleSinCos_r16r17r18_duplicate
