.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel AnimateQuad
/* 57A90 80069E70 801F013C */  lui        $at, (0x1F800000 >> 16)
/* 57A94 80069E74 000030AC */  sw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 57A98 80069E78 040031AC */  sw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 57A9C 80069E7C 080032AC */  sw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 57AA0 80069E80 0C0033AC */  sw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 57AA4 80069E84 100034AC */  sw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 57AA8 80069E88 140035AC */  sw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 57AAC 80069E8C 180036AC */  sw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 57AB0 80069E90 1C0037AC */  sw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 57AB4 80069E94 28003FAC */  sw         $ra, (0x1F800028 & 0xFFFF)($at)
/* 57AB8 80069E98 00A8C048 */  ctc2       $zero, $21 /* handwritten instruction */
/* 57ABC 80069E9C 00B0C048 */  ctc2       $zero, $22 /* handwritten instruction */
/* 57AC0 80069EA0 00B8C048 */  ctc2       $zero, $23 /* handwritten instruction */
/* 57AC4 80069EA4 F0FFC624 */  addiu      $a2, $a2, -0x10
/* 57AC8 80069EA8 0000ED8C */  lw         $t5, 0x0($a3)
/* 57ACC 80069EAC 0400E724 */  addiu      $a3, $a3, 0x4
/* 57AD0 80069EB0 03000104 */  bgez       $zero, .L80069EC0
/* 57AD4 80069EB4 20000E24 */   addiu     $t6, $zero, 0x20
.L80069EB8:
/* 57AD8 80069EB8 C3A7010C */  jal        AnimateQuadVertex
/* 57ADC 80069EBC 1000C624 */   addiu     $a2, $a2, 0x10
.L80069EC0:
/* 57AE0 80069EC0 0700A010 */  beqz       $a1, .L80069EE0
/* 57AE4 80069EC4 FFFFA524 */   addiu     $a1, $a1, -0x1
/* 57AE8 80069EC8 FBFFC015 */  bnez       $t6, .L80069EB8
/* 57AEC 80069ECC FFFFCE25 */   addiu     $t6, $t6, -0x1
/* 57AF0 80069ED0 0000ED8C */  lw         $t5, 0x0($a3)
/* 57AF4 80069ED4 0400E724 */  addiu      $a3, $a3, 0x4
/* 57AF8 80069ED8 F7FF0104 */  bgez       $zero, .L80069EB8
/* 57AFC 80069EDC 1F000E24 */   addiu     $t6, $zero, 0x1F
.L80069EE0:
/* 57B00 80069EE0 28003F8C */  lw         $ra, (0x1F800028 & 0xFFFF)($at)
/* 57B04 80069EE4 1C00378C */  lw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 57B08 80069EE8 1800368C */  lw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 57B0C 80069EEC 1400358C */  lw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 57B10 80069EF0 1000348C */  lw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 57B14 80069EF4 0C00338C */  lw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 57B18 80069EF8 0800328C */  lw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 57B1C 80069EFC 0400318C */  lw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 57B20 80069F00 0000308C */  lw         $s0, (0x1F800000 & 0xFFFF)($at)
glabel .L80069F04
/* 57B24 80069F04 0800E003 */  jr         $ra
/* 57B28 80069F08 00000000 */   nop
.size AnimateQuad, . - AnimateQuad
