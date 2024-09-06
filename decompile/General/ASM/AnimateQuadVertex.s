.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel AnimateQuadVertex
/* 57B2C 80069F0C 0100A331 */  andi       $v1, $t5, 0x1
/* 57B30 80069F10 FCFF6010 */  beqz       $v1, .L80069F04
/* 57B34 80069F14 42680D00 */   srl       $t5, $t5, 1
/* 57B38 80069F18 21A0E003 */  addu       $s4, $ra, $zero
/* 57B3C 80069F1C 0800D78C */  lw         $s7, 0x8($a2)
/* 57B40 80069F20 0000CF8C */  lw         $t7, 0x0($a2)
/* 57B44 80069F24 0400D58C */  lw         $s5, 0x4($a2)
/* 57B48 80069F28 03841700 */  sra        $s0, $s7, 16
/* 57B4C 80069F2C FF3F1332 */  andi       $s3, $s0, 0x3FFF
/* 57B50 80069F30 E5A7010C */  jal        TRIG_AngleSinCos_r19r17r18
/* 57B54 80069F34 21986402 */   addu      $s3, $s3, $a0
/* 57B58 80069F38 09000106 */  bgez       $s0, .L80069F60
/* 57B5C 80069F3C 02B41500 */   srl       $s6, $s5, 16
/* 57B60 80069F40 00B41600 */  sll        $s6, $s6, 16
/* 57B64 80069F44 C3191100 */  sra        $v1, $s1, 7
/* 57B68 80069F48 21A8A302 */  addu       $s5, $s5, $v1
/* 57B6C 80069F4C C3191200 */  sra        $v1, $s2, 7
/* 57B70 80069F50 21B8E302 */  addu       $s7, $s7, $v1
/* 57B74 80069F54 25A8B602 */  or         $s5, $s5, $s6
/* 57B78 80069F58 0000F5AD */  sw         $s5, 0x0($t7)
/* 57B7C 80069F5C 0400F7A5 */  sh         $s7, 0x4($t7)
.L80069F60:
/* 57B80 80069F60 00400332 */  andi       $v1, $s0, 0x4000
/* 57B84 80069F64 09006010 */  beqz       $v1, .L80069F8C
/* 57B88 80069F68 00102326 */   addiu     $v1, $s1, 0x1000
/* 57B8C 80069F6C 83180300 */  sra        $v1, $v1, 2
/* 57B90 80069F70 00408348 */  mtc2       $v1, $8 /* handwritten instruction */
/* 57B94 80069F74 0C00C6C8 */  lwc2       $6, 0xC($a2)
/* 57B98 80069F78 00000000 */  nop
/* 57B9C 80069F7C 00000000 */  nop
/* 57BA0 80069F80 1000784A */  DPCS
/* 57BA4 80069F84 0800F6E9 */  swc2       $22, 0x8($t7)
/* 57BA8 80069F88 0C00F6E9 */  swc2       $22, 0xC($t7)
.L80069F8C:
/* 57BAC 80069F8C 08008002 */  jr         $s4
/* 57BB0 80069F90 00000000 */   nop
.size AnimateQuadVertex, . - AnimateQuadVertex
