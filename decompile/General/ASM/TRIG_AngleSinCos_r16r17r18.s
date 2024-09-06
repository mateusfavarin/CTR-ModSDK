.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel TRIG_AngleSinCos_r16r17r18
/* 5DA28 8006FE08 0880033C */  lui        $v1, %hi(D_800845A0)
/* 5DA2C 8006FE0C A0456324 */  addiu      $v1, $v1, %lo(D_800845A0)
/* 5DA30 8006FE10 FF031132 */  andi       $s1, $s0, 0x3FF
/* 5DA34 8006FE14 80881100 */  sll        $s1, $s1, 2
/* 5DA38 8006FE18 21187100 */  addu       $v1, $v1, $s1
/* 5DA3C 8006FE1C 0000718C */  lw         $s1, 0x0($v1)
/* 5DA40 8006FE20 00040332 */  andi       $v1, $s0, 0x400
/* 5DA44 8006FE24 07006014 */  bnez       $v1, .L8006FE44
/* 5DA48 8006FE28 00080332 */   andi      $v1, $s0, 0x800
/* 5DA4C 8006FE2C 03941100 */  sra        $s2, $s1, 16
/* 5DA50 8006FE30 008C1100 */  sll        $s1, $s1, 16
/* 5DA54 8006FE34 09006014 */  bnez       $v1, .L8006FE5C
/* 5DA58 8006FE38 038C1100 */   sra       $s1, $s1, 16
/* 5DA5C 8006FE3C 0800E003 */  jr         $ra
/* 5DA60 8006FE40 00000000 */   nop
.L8006FE44:
/* 5DA64 8006FE44 00941100 */  sll        $s2, $s1, 16
/* 5DA68 8006FE48 03941200 */  sra        $s2, $s2, 16
/* 5DA6C 8006FE4C 06006014 */  bnez       $v1, .L8006FE68
/* 5DA70 8006FE50 038C1100 */   sra       $s1, $s1, 16
/* 5DA74 8006FE54 0800E003 */  jr         $ra
/* 5DA78 8006FE58 22901200 */   neg       $s2, $s2 /* handwritten instruction */
.L8006FE5C:
/* 5DA7C 8006FE5C 22901200 */  neg        $s2, $s2 /* handwritten instruction */
/* 5DA80 8006FE60 0800E003 */  jr         $ra
/* 5DA84 8006FE64 22881100 */   neg       $s1, $s1 /* handwritten instruction */
.L8006FE68:
/* 5DA88 8006FE68 0800E003 */  jr         $ra
/* 5DA8C 8006FE6C 22881100 */   neg       $s1, $s1 /* handwritten instruction */
.size TRIG_AngleSinCos_r16r17r18, . - TRIG_AngleSinCos_r16r17r18
