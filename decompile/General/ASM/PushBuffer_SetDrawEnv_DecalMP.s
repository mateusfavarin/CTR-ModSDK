.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel PushBuffer_SetDrawEnv_DecalMP
/* 30594 80042974 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 30598 80042978 7400B1AF */  sw         $s1, 0x74($sp)
/* 3059C 8004297C 21888000 */  addu       $s1, $a0, $zero
/* 305A0 80042980 7400A424 */  addiu      $a0, $a1, 0x74
/* 305A4 80042984 1000A227 */  addiu      $v0, $sp, 0x10
/* 305A8 80042988 9000A897 */  lhu        $t0, 0x90($sp)
/* 305AC 8004298C 9400A993 */  lbu        $t1, 0x94($sp)
/* 305B0 80042990 9800AA93 */  lbu        $t2, 0x98($sp)
/* 305B4 80042994 9C00AB93 */  lbu        $t3, 0x9C($sp)
/* 305B8 80042998 5000A324 */  addiu      $v1, $a1, 0x50
/* 305BC 8004299C 7800BFAF */  sw         $ra, 0x78($sp)
/* 305C0 800429A0 7000B0AF */  sw         $s0, 0x70($sp)
.L800429A4:
/* 305C4 800429A4 0000AC8C */  lw         $t4, 0x0($a1)
/* 305C8 800429A8 0400AD8C */  lw         $t5, 0x4($a1)
/* 305CC 800429AC 0800AE8C */  lw         $t6, 0x8($a1)
/* 305D0 800429B0 0C00AF8C */  lw         $t7, 0xC($a1)
/* 305D4 800429B4 00004CAC */  sw         $t4, 0x0($v0)
/* 305D8 800429B8 04004DAC */  sw         $t5, 0x4($v0)
/* 305DC 800429BC 08004EAC */  sw         $t6, 0x8($v0)
/* 305E0 800429C0 0C004FAC */  sw         $t7, 0xC($v0)
/* 305E4 800429C4 1000A524 */  addiu      $a1, $a1, 0x10
/* 305E8 800429C8 F6FFA314 */  bne        $a1, $v1, .L800429A4
/* 305EC 800429CC 10004224 */   addiu     $v0, $v0, 0x10
/* 305F0 800429D0 0000AC8C */  lw         $t4, 0x0($a1)
/* 305F4 800429D4 0400AD8C */  lw         $t5, 0x4($a1)
/* 305F8 800429D8 0800AE8C */  lw         $t6, 0x8($a1)
/* 305FC 800429DC 00004CAC */  sw         $t4, 0x0($v0)
/* 30600 800429E0 04004DAC */  sw         $t5, 0x4($v0)
/* 30604 800429E4 08004EAC */  sw         $t6, 0x8($v0)
/* 30608 800429E8 0000C294 */  lhu        $v0, 0x0($a2)
/* 3060C 800429EC 00000000 */  nop
/* 30610 800429F0 1000A2A7 */  sh         $v0, 0x10($sp)
/* 30614 800429F4 0200C294 */  lhu        $v0, 0x2($a2)
/* 30618 800429F8 00000000 */  nop
/* 3061C 800429FC 1200A2A7 */  sh         $v0, 0x12($sp)
/* 30620 80042A00 0400C294 */  lhu        $v0, 0x4($a2)
/* 30624 80042A04 00000000 */  nop
/* 30628 80042A08 1400A2A7 */  sh         $v0, 0x14($sp)
/* 3062C 80042A0C A400A28F */  lw         $v0, 0xA4($sp)
/* 30630 80042A10 0600C394 */  lhu        $v1, 0x6($a2)
/* 30634 80042A14 2800A2A3 */  sb         $v0, 0x28($sp)
/* 30638 80042A18 A000A28F */  lw         $v0, 0xA0($sp)
/* 3063C 80042A1C 1800A7A7 */  sh         $a3, 0x18($sp)
/* 30640 80042A20 1A00A8A7 */  sh         $t0, 0x1A($sp)
/* 30644 80042A24 2900A9A3 */  sb         $t1, 0x29($sp)
/* 30648 80042A28 2A00AAA3 */  sb         $t2, 0x2A($sp)
/* 3064C 80042A2C 2B00ABA3 */  sb         $t3, 0x2B($sp)
/* 30650 80042A30 1600A3A7 */  sh         $v1, 0x16($sp)
/* 30654 80042A34 2600A2A3 */  sb         $v0, 0x26($sp)
/* 30658 80042A38 0C00838C */  lw         $v1, 0xC($a0)
/* 3065C 80042A3C 1000828C */  lw         $v0, 0x10($a0)
/* 30660 80042A40 00000000 */  nop
/* 30664 80042A44 2B104300 */  sltu       $v0, $v0, $v1
/* 30668 80042A48 04004014 */  bnez       $v0, .L80042A5C
/* 3066C 80042A4C 21800000 */   addu      $s0, $zero, $zero
/* 30670 80042A50 21806000 */  addu       $s0, $v1, $zero
/* 30674 80042A54 40000226 */  addiu      $v0, $s0, 0x40
/* 30678 80042A58 0C0082AC */  sw         $v0, 0xC($a0)
.L80042A5C:
/* 3067C 80042A5C 06000012 */  beqz       $s0, .L80042A78
/* 30680 80042A60 21200002 */   addu      $a0, $s0, $zero
/* 30684 80042A64 70CE010C */  jal        SetDrawEnv
/* 30688 80042A68 1000A527 */   addiu     $a1, $sp, 0x10
/* 3068C 80042A6C 21202002 */  addu       $a0, $s1, $zero
/* 30690 80042A70 C4D4010C */  jal        AddPrim
/* 30694 80042A74 21280002 */   addu      $a1, $s0, $zero
.L80042A78:
/* 30698 80042A78 7800BF8F */  lw         $ra, 0x78($sp)
/* 3069C 80042A7C 7400B18F */  lw         $s1, 0x74($sp)
/* 306A0 80042A80 7000B08F */  lw         $s0, 0x70($sp)
/* 306A4 80042A84 0800E003 */  jr         $ra
/* 306A8 80042A88 8000BD27 */   addiu     $sp, $sp, 0x80
.size PushBuffer_SetDrawEnv_DecalMP, . - PushBuffer_SetDrawEnv_DecalMP
