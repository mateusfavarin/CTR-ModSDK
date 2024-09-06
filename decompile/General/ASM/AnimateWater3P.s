.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel AnimateWater3P
/* 5B568 8006D948 801F013C */  lui        $at, (0x1F800000 >> 16)
/* 5B56C 8006D94C 000030AC */  sw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 5B570 8006D950 040031AC */  sw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 5B574 8006D954 080032AC */  sw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 5B578 8006D958 0C0033AC */  sw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 5B57C 8006D95C 100034AC */  sw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 5B580 8006D960 140035AC */  sw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 5B584 8006D964 180036AC */  sw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 5B588 8006D968 1C0037AC */  sw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 5B58C 8006D96C 20003CAC */  sw         $gp, (0x1F800020 & 0xFFFF)($at)
/* 5B590 8006D970 28003FAC */  sw         $ra, (0x1F800028 & 0xFFFF)($at)
/* 5B594 8006D974 1000B88F */  lw         $t8, 0x10($sp)
/* 5B598 8006D978 1400B98F */  lw         $t9, 0x14($sp)
/* 5B59C 8006D97C 1800BC8F */  lw         $gp, 0x18($sp)
/* 5B5A0 8006D980 F8FFC624 */  addiu      $a2, $a2, -0x8
/* 5B5A4 8006D984 1C000324 */  addiu      $v1, $zero, 0x1C
/* 5B5A8 8006D988 C2400400 */  srl        $t0, $a0, 3
/* 5B5AC 8006D98C 1B000301 */  divu       $zero, $t0, $v1
/* 5B5B0 8006D990 0000E794 */  lhu        $a3, 0x0($a3)
/* 5B5B4 8006D994 10400000 */  mfhi       $t0
/* 5B5B8 8006D998 07008930 */  andi       $t1, $a0, 0x7
/* 5B5BC 8006D99C 404A0900 */  sll        $t1, $t1, 9
/* 5B5C0 8006D9A0 00408948 */  mtc2       $t1, $8 /* handwritten instruction */
/* 5B5C4 8006D9A4 01000925 */  addiu      $t1, $t0, 0x1
/* 5B5C8 8006D9A8 1B002301 */  divu       $zero, $t1, $v1
/* 5B5CC 8006D9AC 00000D8F */  lw         $t5, 0x0($t8)
/* 5B5D0 8006D9B0 04001827 */  addiu      $t8, $t8, 0x4
/* 5B5D4 8006D9B4 0000238F */  lw         $v1, 0x0($t9)
/* 5B5D8 8006D9B8 04003927 */  addiu      $t9, $t9, 0x4
/* 5B5DC 8006D9BC 2568A301 */  or         $t5, $t5, $v1
/* 5B5E0 8006D9C0 0000838F */  lw         $v1, 0x0($gp)
/* 5B5E4 8006D9C4 04009C27 */  addiu      $gp, $gp, %lo(D_4)
/* 5B5E8 8006D9C8 2568A301 */  or         $t5, $t5, $v1
/* 5B5EC 8006D9CC 40580800 */  sll        $t3, $t0, 1
/* 5B5F0 8006D9D0 10480000 */  mfhi       $t1
/* 5B5F4 8006D9D4 20000E24 */  addiu      $t6, $zero, 0x20
/* 5B5F8 8006D9D8 03000104 */  bgez       $zero, .L8006D9E8
/* 5B5FC 8006D9DC 40600900 */   sll       $t4, $t1, 1
.L8006D9E0:
/* 5B600 8006D9E0 DFB6010C */  jal        AnimateWaterVertex
/* 5B604 8006D9E4 0800C624 */   addiu     $a2, $a2, 0x8
.L8006D9E8:
/* 5B608 8006D9E8 0D00A010 */  beqz       $a1, .L8006DA20
/* 5B60C 8006D9EC FFFFA524 */   addiu     $a1, $a1, -0x1
/* 5B610 8006D9F0 FBFFC015 */  bnez       $t6, .L8006D9E0
/* 5B614 8006D9F4 FFFFCE25 */   addiu     $t6, $t6, -0x1
/* 5B618 8006D9F8 00000D8F */  lw         $t5, 0x0($t8)
/* 5B61C 8006D9FC 04001827 */  addiu      $t8, $t8, 0x4
/* 5B620 8006DA00 0000238F */  lw         $v1, 0x0($t9)
/* 5B624 8006DA04 04003927 */  addiu      $t9, $t9, 0x4
/* 5B628 8006DA08 2568A301 */  or         $t5, $t5, $v1
/* 5B62C 8006DA0C 0000838F */  lw         $v1, 0x0($gp)
/* 5B630 8006DA10 04009C27 */  addiu      $gp, $gp, %lo(D_4)
/* 5B634 8006DA14 2568A301 */  or         $t5, $t5, $v1
/* 5B638 8006DA18 F1FF0104 */  bgez       $zero, .L8006D9E0
/* 5B63C 8006DA1C 1F000E24 */   addiu     $t6, $zero, 0x1F
.L8006DA20:
/* 5B640 8006DA20 28003F8C */  lw         $ra, (0x1F800028 & 0xFFFF)($at)
/* 5B644 8006DA24 20003C8C */  lw         $gp, (0x1F800020 & 0xFFFF)($at)
/* 5B648 8006DA28 1C00378C */  lw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 5B64C 8006DA2C 1800368C */  lw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 5B650 8006DA30 1400358C */  lw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 5B654 8006DA34 1000348C */  lw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 5B658 8006DA38 0C00338C */  lw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 5B65C 8006DA3C 0800328C */  lw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 5B660 8006DA40 0400318C */  lw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 5B664 8006DA44 0000308C */  lw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 5B668 8006DA48 0800E003 */  jr         $ra
/* 5B66C 8006DA4C 00000000 */   nop
.size AnimateWater3P, . - AnimateWater3P
