.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel AnimateWater1P
/* 5B3BC 8006D79C 801F013C */  lui        $at, (0x1F800000 >> 16)
/* 5B3C0 8006D7A0 000030AC */  sw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 5B3C4 8006D7A4 040031AC */  sw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 5B3C8 8006D7A8 080032AC */  sw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 5B3CC 8006D7AC 0C0033AC */  sw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 5B3D0 8006D7B0 100034AC */  sw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 5B3D4 8006D7B4 140035AC */  sw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 5B3D8 8006D7B8 180036AC */  sw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 5B3DC 8006D7BC 1C0037AC */  sw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 5B3E0 8006D7C0 28003FAC */  sw         $ra, (0x1F800028 & 0xFFFF)($at)
/* 5B3E4 8006D7C4 1000B88F */  lw         $t8, 0x10($sp)
/* 5B3E8 8006D7C8 F8FFC624 */  addiu      $a2, $a2, -0x8
/* 5B3EC 8006D7CC 1C000324 */  addiu      $v1, $zero, 0x1C
/* 5B3F0 8006D7D0 C2400400 */  srl        $t0, $a0, 3
/* 5B3F4 8006D7D4 1B000301 */  divu       $zero, $t0, $v1
/* 5B3F8 8006D7D8 0000E794 */  lhu        $a3, 0x0($a3)
/* 5B3FC 8006D7DC 10400000 */  mfhi       $t0
/* 5B400 8006D7E0 07008930 */  andi       $t1, $a0, 0x7
/* 5B404 8006D7E4 404A0900 */  sll        $t1, $t1, 9
/* 5B408 8006D7E8 00408948 */  mtc2       $t1, $8 /* handwritten instruction */
/* 5B40C 8006D7EC 01000925 */  addiu      $t1, $t0, 0x1
/* 5B410 8006D7F0 1B002301 */  divu       $zero, $t1, $v1
/* 5B414 8006D7F4 00000D8F */  lw         $t5, 0x0($t8)
/* 5B418 8006D7F8 04001827 */  addiu      $t8, $t8, 0x4
/* 5B41C 8006D7FC 40580800 */  sll        $t3, $t0, 1
/* 5B420 8006D800 10480000 */  mfhi       $t1
/* 5B424 8006D804 20000E24 */  addiu      $t6, $zero, 0x20
/* 5B428 8006D808 03000104 */  bgez       $zero, .L8006D818
/* 5B42C 8006D80C 40600900 */   sll       $t4, $t1, 1
.L8006D810:
/* 5B430 8006D810 DFB6010C */  jal        AnimateWaterVertex
/* 5B434 8006D814 0800C624 */   addiu     $a2, $a2, 0x8
.L8006D818:
/* 5B438 8006D818 0700A010 */  beqz       $a1, .L8006D838
/* 5B43C 8006D81C FFFFA524 */   addiu     $a1, $a1, -0x1
/* 5B440 8006D820 FBFFC015 */  bnez       $t6, .L8006D810
/* 5B444 8006D824 FFFFCE25 */   addiu     $t6, $t6, -0x1
/* 5B448 8006D828 00000D8F */  lw         $t5, 0x0($t8)
/* 5B44C 8006D82C 04001827 */  addiu      $t8, $t8, 0x4
/* 5B450 8006D830 F7FF0104 */  bgez       $zero, .L8006D810
/* 5B454 8006D834 1F000E24 */   addiu     $t6, $zero, 0x1F
.L8006D838:
/* 5B458 8006D838 28003F8C */  lw         $ra, (0x1F800028 & 0xFFFF)($at)
/* 5B45C 8006D83C 1C00378C */  lw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 5B460 8006D840 1800368C */  lw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 5B464 8006D844 1400358C */  lw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 5B468 8006D848 1000348C */  lw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 5B46C 8006D84C 0C00338C */  lw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 5B470 8006D850 0800328C */  lw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 5B474 8006D854 0400318C */  lw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 5B478 8006D858 0000308C */  lw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 5B47C 8006D85C 0800E003 */  jr         $ra
/* 5B480 8006D860 00000000 */   nop
.size AnimateWater1P, . - AnimateWater1P
