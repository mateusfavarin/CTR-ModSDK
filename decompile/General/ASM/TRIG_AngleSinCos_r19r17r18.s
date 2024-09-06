.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel TRIG_AngleSinCos_r19r17r18
/* 57BB4 80069F94 0880033C */  lui        $v1, %hi(D_800845A0)
/* 57BB8 80069F98 A0456324 */  addiu      $v1, $v1, %lo(D_800845A0)
/* 57BBC 80069F9C FF037132 */  andi       $s1, $s3, 0x3FF
/* 57BC0 80069FA0 80881100 */  sll        $s1, $s1, 2
/* 57BC4 80069FA4 21187100 */  addu       $v1, $v1, $s1
/* 57BC8 80069FA8 0000718C */  lw         $s1, 0x0($v1)
/* 57BCC 80069FAC 00046332 */  andi       $v1, $s3, 0x400
/* 57BD0 80069FB0 07006014 */  bnez       $v1, .L80069FD0
/* 57BD4 80069FB4 00086332 */   andi      $v1, $s3, 0x800
/* 57BD8 80069FB8 03941100 */  sra        $s2, $s1, 16
/* 57BDC 80069FBC 008C1100 */  sll        $s1, $s1, 16
/* 57BE0 80069FC0 09006014 */  bnez       $v1, .L80069FE8
/* 57BE4 80069FC4 038C1100 */   sra       $s1, $s1, 16
/* 57BE8 80069FC8 0800E003 */  jr         $ra
/* 57BEC 80069FCC 00000000 */   nop
.L80069FD0:
/* 57BF0 80069FD0 00941100 */  sll        $s2, $s1, 16
/* 57BF4 80069FD4 03941200 */  sra        $s2, $s2, 16
/* 57BF8 80069FD8 06006014 */  bnez       $v1, .L80069FF4
/* 57BFC 80069FDC 038C1100 */   sra       $s1, $s1, 16
/* 57C00 80069FE0 0800E003 */  jr         $ra
/* 57C04 80069FE4 22901200 */   neg       $s2, $s2 /* handwritten instruction */
.L80069FE8:
/* 57C08 80069FE8 22901200 */  neg        $s2, $s2 /* handwritten instruction */
/* 57C0C 80069FEC 0800E003 */  jr         $ra
/* 57C10 80069FF0 22881100 */   neg       $s1, $s1 /* handwritten instruction */
.L80069FF4:
/* 57C14 80069FF4 0800E003 */  jr         $ra
/* 57C18 80069FF8 22881100 */   neg       $s1, $s1 /* handwritten instruction */
.size TRIG_AngleSinCos_r19r17r18, . - TRIG_AngleSinCos_r19r17r18
