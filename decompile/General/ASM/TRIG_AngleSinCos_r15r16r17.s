.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel TRIG_AngleSinCos_r15r16r17
/* 580E4 8006A4C4 0880033C */  lui        $v1, %hi(D_800845A0)
/* 580E8 8006A4C8 A0456324 */  addiu      $v1, $v1, %lo(D_800845A0)
/* 580EC 8006A4CC FF03F031 */  andi       $s0, $t7, 0x3FF
/* 580F0 8006A4D0 80801000 */  sll        $s0, $s0, 2
/* 580F4 8006A4D4 21187000 */  addu       $v1, $v1, $s0
/* 580F8 8006A4D8 0000708C */  lw         $s0, 0x0($v1)
/* 580FC 8006A4DC 0004E331 */  andi       $v1, $t7, 0x400
/* 58100 8006A4E0 07006014 */  bnez       $v1, .L8006A500
/* 58104 8006A4E4 0008E331 */   andi      $v1, $t7, 0x800
/* 58108 8006A4E8 038C1000 */  sra        $s1, $s0, 16
/* 5810C 8006A4EC 00841000 */  sll        $s0, $s0, 16
/* 58110 8006A4F0 09006014 */  bnez       $v1, .L8006A518
/* 58114 8006A4F4 03841000 */   sra       $s0, $s0, 16
/* 58118 8006A4F8 0800E003 */  jr         $ra
/* 5811C 8006A4FC 00000000 */   nop
.L8006A500:
/* 58120 8006A500 008C1000 */  sll        $s1, $s0, 16
/* 58124 8006A504 038C1100 */  sra        $s1, $s1, 16
/* 58128 8006A508 06006014 */  bnez       $v1, .L8006A524
/* 5812C 8006A50C 03841000 */   sra       $s0, $s0, 16
/* 58130 8006A510 0800E003 */  jr         $ra
/* 58134 8006A514 22881100 */   neg       $s1, $s1 /* handwritten instruction */
.L8006A518:
/* 58138 8006A518 22881100 */  neg        $s1, $s1 /* handwritten instruction */
/* 5813C 8006A51C 0800E003 */  jr         $ra
/* 58140 8006A520 22801000 */   neg       $s0, $s0 /* handwritten instruction */
.L8006A524:
/* 58144 8006A524 0800E003 */  jr         $ra
/* 58148 8006A528 22801000 */   neg       $s0, $s0 /* handwritten instruction */
.size TRIG_AngleSinCos_r15r16r17, . - TRIG_AngleSinCos_r15r16r17
