.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel func_80070284
/* 5DEA4 80070284 0780193C */  lui        $t9, (0x80070290 >> 16)
/* 5DEA8 80070288 0800E002 */  jr         $s7
/* 5DEAC 8007028C 90023937 */   ori       $t9, $t9, (0x80070290 & 0xFFFF)
/* 5DEB0 80070290 21C00103 */  addu       $t8, $t8, $at
/* 5DEB4 80070294 6000038F */  lw         $v1, 0x60($t8)
/* 5DEB8 80070298 6400088F */  lw         $t0, 0x64($t8)
/* 5DEBC 8007029C 00009C48 */  mtc2       $gp, $0 /* handwritten instruction */
/* 5DEC0 800702A0 00089E48 */  mtc2       $fp, $1 /* handwritten instruction */
/* 5DEC4 800702A4 0040C348 */  ctc2       $v1, $8 /* handwritten instruction */
/* 5DEC8 800702A8 0048C848 */  ctc2       $t0, $9 /* handwritten instruction */
/* 5DECC 800702AC 03440800 */  sra        $t0, $t0, 16
/* 5DED0 800702B0 40400800 */  sll        $t0, $t0, 1
/* 5DED4 800702B4 22400800 */  neg        $t0, $t0 /* handwritten instruction */
/* 5DED8 800702B8 0068C848 */  ctc2       $t0, $13 /* handwritten instruction */
/* 5DEDC 800702BC 00000000 */  nop
/* 5DEE0 800702C0 00000000 */  nop
/* 5DEE4 800702C4 12204A4A */  MVMVA      1, 1, 0, 1, 0
/* 5DEE8 800702C8 00481948 */  mfc2       $t9, $9 /* handwritten instruction */
/* 5DEEC 800702CC 0800E003 */  jr         $ra
/* 5DEF0 800702D0 00000000 */   nop
.size func_80070284, . - func_80070284
