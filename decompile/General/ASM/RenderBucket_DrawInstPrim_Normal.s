.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel RenderBucket_DrawInstPrim_Normal
/* 5898C 8006AD6C 3C00238C */  lw         $v1, 0x3C($at)
/* 58990 8006AD70 4000288C */  lw         $t0, 0x40($at)
/* 58994 8006AD74 80490B00 */  sll        $t1, $t3, 6
/* 58998 8006AD78 0200201D */  bgtz       $t1, .L8006AD84
/* 5899C 8006AD7C 00000000 */   nop
/* 589A0 8006AD80 21180001 */  addu       $v1, $t0, $zero
.L8006AD84:
/* 589A4 8006AD84 380023AC */  sw         $v1, 0x38($at)
/* 589A8 8006AD88 2C002B8C */  lw         $t3, 0x2C($at)
/* 589AC 8006AD8C 3800258C */  lw         $a1, 0x38($at)
/* 589B0 8006AD90 425C0B00 */  srl        $t3, $t3, 17
/* 589B4 8006AD94 80580B00 */  sll        $t3, $t3, 2
/* 589B8 8006AD98 21586501 */  addu       $t3, $t3, $a1
/* 589BC 8006AD9C 20012A84 */  lh         $t2, 0x120($at)
/* 589C0 8006ADA0 5000268C */  lw         $a2, 0x50($at)
/* 589C4 8006ADA4 00A08E48 */  mtc2       $t6, $20 /* handwritten instruction */
/* 589C8 8006ADA8 00A88F48 */  mtc2       $t7, $21 /* handwritten instruction */
/* 589CC 8006ADAC 00B09048 */  mtc2       $s0, $22 /* handwritten instruction */
/* 589D0 8006ADB0 00408A48 */  mtc2       $t2, $8 /* handwritten instruction */
/* 589D4 8006ADB4 04004011 */  beqz       $t2, .L8006ADC8
/* 589D8 8006ADB8 C0410B00 */   sll       $t0, $t3, 7
/* 589DC 8006ADBC 02000005 */  bltz       $t0, .L8006ADC8
/* 589E0 8006ADC0 00000000 */   nop
/* 589E4 8006ADC4 2A00F84A */  DPCT
glabel .L8006ADC8
/* 589E8 8006ADC8 0C00C014 */  bnez       $a2, .L8006ADFC
/* 589EC 8006ADCC 0030033C */   lui       $v1, (0x30000000 >> 16)
/* 589F0 8006ADD0 08004CE8 */  swc2       $12, 0x8($v0)
/* 589F4 8006ADD4 10004DE8 */  swc2       $13, 0x10($v0)
/* 589F8 8006ADD8 18004EE8 */  swc2       $14, 0x18($v0)
/* 589FC 8006ADDC 00A00848 */  mfc2       $t0, $20 /* handwritten instruction */
/* 58A00 8006ADE0 1C000924 */  addiu      $t1, $zero, 0x1C
/* 58A04 8006ADE4 25186800 */  or         $v1, $v1, $t0
/* 58A08 8006ADE8 040043AC */  sw         $v1, 0x4($v0)
/* 58A0C 8006ADEC 0C0055E8 */  swc2       $21, 0xC($v0)
/* 58A10 8006ADF0 140056E8 */  swc2       $22, 0x14($v0)
/* 58A14 8006ADF4 16000104 */  bgez       $zero, .L8006AE50
/* 58A18 8006ADF8 0006083C */   lui       $t0, (0x6000000 >> 16)
.L8006ADFC:
/* 58A1C 8006ADFC 0000C38C */  lw         $v1, 0x0($a2)
/* 58A20 8006AE00 0400C88C */  lw         $t0, 0x4($a2)
/* 58A24 8006AE04 0800C98C */  lw         $t1, 0x8($a2)
/* 58A28 8006AE08 08004CE8 */  swc2       $12, 0x8($v0)
/* 58A2C 8006AE0C 14004DE8 */  swc2       $13, 0x14($v0)
/* 58A30 8006AE10 20004EE8 */  swc2       $14, 0x20($v0)
/* 58A34 8006AE14 0C0043AC */  sw         $v1, 0xC($v0)
/* 58A38 8006AE18 180048AC */  sw         $t0, 0x18($v0)
/* 58A3C 8006AE1C 240049AC */  sw         $t1, 0x24($v0)
/* 58A40 8006AE20 00A00948 */  mfc2       $t1, $20 /* handwritten instruction */
/* 58A44 8006AE24 6000033C */  lui        $v1, (0x600000 >> 16)
/* 58A48 8006AE28 24406800 */  and        $t0, $v1, $t0
/* 58A4C 8006AE2C 02006810 */  beq        $v1, $t0, .L8006AE38
/* 58A50 8006AE30 0034033C */   lui       $v1, (0x34000000 >> 16)
/* 58A54 8006AE34 0036033C */  lui        $v1, (0x36000000 >> 16)
.L8006AE38:
/* 58A58 8006AE38 25186900 */  or         $v1, $v1, $t1
/* 58A5C 8006AE3C 040043AC */  sw         $v1, 0x4($v0)
/* 58A60 8006AE40 100055E8 */  swc2       $21, 0x10($v0)
/* 58A64 8006AE44 1C0056E8 */  swc2       $22, 0x1C($v0)
/* 58A68 8006AE48 28000924 */  addiu      $t1, $zero, 0x28
/* 58A6C 8006AE4C 0009083C */  lui        $t0, (0x9000000 >> 16)
glabel .L8006AE50
/* 58A70 8006AE50 0000638D */  lw         $v1, 0x0($t3)
/* 58A74 8006AE54 00520200 */  sll        $t2, $v0, 8
/* 58A78 8006AE58 25186800 */  or         $v1, $v1, $t0
/* 58A7C 8006AE5C 000043AC */  sw         $v1, 0x0($v0)
/* 58A80 8006AE60 02520A00 */  srl        $t2, $t2, 8
/* 58A84 8006AE64 00006AAD */  sw         $t2, 0x0($t3)
/* 58A88 8006AE68 21104900 */  addu       $v0, $v0, $t1
/* 58A8C 8006AE6C 0800E003 */  jr         $ra
/* 58A90 8006AE70 00000000 */   nop
.size RenderBucket_DrawInstPrim_Normal, . - RenderBucket_DrawInstPrim_Normal
