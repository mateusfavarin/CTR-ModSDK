.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel SquareRoot0_stub
/* 5A238 8006C618 00F08448 */  mtc2       $a0, $30 /* handwritten instruction */
/* 5A23C 8006C61C 17008010 */  beqz       $a0, .L8006C67C
/* 5A240 8006C620 00000224 */   addiu     $v0, $zero, 0x0
/* 5A244 8006C624 00F80948 */  mfc2       $t1, $31 /* handwritten instruction */
/* 5A248 8006C628 00000324 */  addiu      $v1, $zero, 0x0
/* 5A24C 8006C62C 1E002931 */  andi       $t1, $t1, 0x1E
/* 5A250 8006C630 04202401 */  sllv       $a0, $a0, $t1
/* 5A254 8006C634 0B000104 */  bgez       $zero, .L8006C664
/* 5A258 8006C638 1E002939 */   xori      $t1, $t1, 0x1E
.L8006C63C:
/* 5A25C 8006C63C 82470400 */  srl        $t0, $a0, 30
/* 5A260 8006C640 25186800 */  or         $v1, $v1, $t0
/* 5A264 8006C644 80400200 */  sll        $t0, $v0, 2
/* 5A268 8006C648 01000825 */  addiu      $t0, $t0, 0x1
/* 5A26C 8006C64C 40100200 */  sll        $v0, $v0, 1
/* 5A270 8006C650 23406800 */  subu       $t0, $v1, $t0
/* 5A274 8006C654 06000005 */  bltz       $t0, .L8006C670
/* 5A278 8006C658 80200400 */   sll       $a0, $a0, 2
/* 5A27C 8006C65C 01004224 */  addiu      $v0, $v0, 0x1
/* 5A280 8006C660 80180800 */  sll        $v1, $t0, 2
.L8006C664:
/* 5A284 8006C664 F5FF2105 */  bgez       $t1, .L8006C63C
/* 5A288 8006C668 FEFF2925 */   addiu     $t1, $t1, -0x2
/* 5A28C 8006C66C 0800E003 */  jr         $ra
.L8006C670:
/* 5A290 8006C670 80180300 */   sll       $v1, $v1, 2
/* 5A294 8006C674 F1FF2105 */  bgez       $t1, .L8006C63C
/* 5A298 8006C678 FEFF2925 */   addiu     $t1, $t1, -0x2
.L8006C67C:
/* 5A29C 8006C67C 0800E003 */  jr         $ra
/* 5A2A0 8006C680 00000000 */   nop
.size SquareRoot0_stub, . - SquareRoot0_stub
