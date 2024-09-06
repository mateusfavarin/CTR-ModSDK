.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel AnimateWater2P
/* 5B484 8006D864 801F013C */  lui        $at, (0x1F800000 >> 16)
/* 5B488 8006D868 000030AC */  sw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 5B48C 8006D86C 040031AC */  sw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 5B490 8006D870 080032AC */  sw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 5B494 8006D874 0C0033AC */  sw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 5B498 8006D878 100034AC */  sw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 5B49C 8006D87C 140035AC */  sw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 5B4A0 8006D880 180036AC */  sw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 5B4A4 8006D884 1C0037AC */  sw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 5B4A8 8006D888 28003FAC */  sw         $ra, (0x1F800028 & 0xFFFF)($at)
/* 5B4AC 8006D88C 1000B88F */  lw         $t8, 0x10($sp)
/* 5B4B0 8006D890 1400B98F */  lw         $t9, 0x14($sp)
/* 5B4B4 8006D894 F8FFC624 */  addiu      $a2, $a2, -0x8
/* 5B4B8 8006D898 1C000324 */  addiu      $v1, $zero, 0x1C
/* 5B4BC 8006D89C C2400400 */  srl        $t0, $a0, 3
/* 5B4C0 8006D8A0 1B000301 */  divu       $zero, $t0, $v1
/* 5B4C4 8006D8A4 0000E794 */  lhu        $a3, 0x0($a3)
/* 5B4C8 8006D8A8 10400000 */  mfhi       $t0
/* 5B4CC 8006D8AC 07008930 */  andi       $t1, $a0, 0x7
/* 5B4D0 8006D8B0 404A0900 */  sll        $t1, $t1, 9
/* 5B4D4 8006D8B4 00408948 */  mtc2       $t1, $8 /* handwritten instruction */
/* 5B4D8 8006D8B8 01000925 */  addiu      $t1, $t0, 0x1
/* 5B4DC 8006D8BC 1B002301 */  divu       $zero, $t1, $v1
/* 5B4E0 8006D8C0 00000D8F */  lw         $t5, 0x0($t8)
/* 5B4E4 8006D8C4 04001827 */  addiu      $t8, $t8, 0x4
/* 5B4E8 8006D8C8 0000238F */  lw         $v1, 0x0($t9)
/* 5B4EC 8006D8CC 04003927 */  addiu      $t9, $t9, 0x4
/* 5B4F0 8006D8D0 2568A301 */  or         $t5, $t5, $v1
/* 5B4F4 8006D8D4 40580800 */  sll        $t3, $t0, 1
/* 5B4F8 8006D8D8 10480000 */  mfhi       $t1
/* 5B4FC 8006D8DC 20000E24 */  addiu      $t6, $zero, 0x20
/* 5B500 8006D8E0 03000104 */  bgez       $zero, .L8006D8F0
/* 5B504 8006D8E4 40600900 */   sll       $t4, $t1, 1
.L8006D8E8:
/* 5B508 8006D8E8 DFB6010C */  jal        AnimateWaterVertex
/* 5B50C 8006D8EC 0800C624 */   addiu     $a2, $a2, 0x8
.L8006D8F0:
/* 5B510 8006D8F0 0A00A010 */  beqz       $a1, .L8006D91C
/* 5B514 8006D8F4 FFFFA524 */   addiu     $a1, $a1, -0x1
/* 5B518 8006D8F8 FBFFC015 */  bnez       $t6, .L8006D8E8
/* 5B51C 8006D8FC FFFFCE25 */   addiu     $t6, $t6, -0x1
/* 5B520 8006D900 00000D8F */  lw         $t5, 0x0($t8)
/* 5B524 8006D904 04001827 */  addiu      $t8, $t8, 0x4
/* 5B528 8006D908 0000238F */  lw         $v1, 0x0($t9)
/* 5B52C 8006D90C 04003927 */  addiu      $t9, $t9, 0x4
/* 5B530 8006D910 2568A301 */  or         $t5, $t5, $v1
/* 5B534 8006D914 F4FF0104 */  bgez       $zero, .L8006D8E8
/* 5B538 8006D918 1F000E24 */   addiu     $t6, $zero, 0x1F
.L8006D91C:
/* 5B53C 8006D91C 28003F8C */  lw         $ra, (0x1F800028 & 0xFFFF)($at)
/* 5B540 8006D920 1C00378C */  lw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 5B544 8006D924 1800368C */  lw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 5B548 8006D928 1400358C */  lw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 5B54C 8006D92C 1000348C */  lw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 5B550 8006D930 0C00338C */  lw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 5B554 8006D934 0800328C */  lw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 5B558 8006D938 0400318C */  lw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 5B55C 8006D93C 0000308C */  lw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 5B560 8006D940 0800E003 */  jr         $ra
/* 5B564 8006D944 00000000 */   nop
.size AnimateWater2P, . - AnimateWater2P
