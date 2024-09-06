.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel TRIG_AngleSinCos_r9r8r10
/* 5CB50 8006EF30 0880033C */  lui        $v1, %hi(D_800845A0)
/* 5CB54 8006EF34 A0456324 */  addiu      $v1, $v1, %lo(D_800845A0)
/* 5CB58 8006EF38 FF032831 */  andi       $t0, $t1, 0x3FF
/* 5CB5C 8006EF3C 80400800 */  sll        $t0, $t0, 2
/* 5CB60 8006EF40 21186800 */  addu       $v1, $v1, $t0
/* 5CB64 8006EF44 0000688C */  lw         $t0, 0x0($v1)
/* 5CB68 8006EF48 00042331 */  andi       $v1, $t1, 0x400
/* 5CB6C 8006EF4C 07006014 */  bnez       $v1, .L8006EF6C
/* 5CB70 8006EF50 00082331 */   andi      $v1, $t1, 0x800
/* 5CB74 8006EF54 03540800 */  sra        $t2, $t0, 16
/* 5CB78 8006EF58 00440800 */  sll        $t0, $t0, 16
/* 5CB7C 8006EF5C 09006014 */  bnez       $v1, .L8006EF84
/* 5CB80 8006EF60 03440800 */   sra       $t0, $t0, 16
/* 5CB84 8006EF64 0800E003 */  jr         $ra
/* 5CB88 8006EF68 00000000 */   nop
.L8006EF6C:
/* 5CB8C 8006EF6C 00540800 */  sll        $t2, $t0, 16
/* 5CB90 8006EF70 03540A00 */  sra        $t2, $t2, 16
/* 5CB94 8006EF74 06006014 */  bnez       $v1, .L8006EF90
/* 5CB98 8006EF78 03440800 */   sra       $t0, $t0, 16
/* 5CB9C 8006EF7C 0800E003 */  jr         $ra
/* 5CBA0 8006EF80 22500A00 */   neg       $t2, $t2 /* handwritten instruction */
.L8006EF84:
/* 5CBA4 8006EF84 22500A00 */  neg        $t2, $t2 /* handwritten instruction */
/* 5CBA8 8006EF88 0800E003 */  jr         $ra
/* 5CBAC 8006EF8C 22400800 */   neg       $t0, $t0 /* handwritten instruction */
.L8006EF90:
/* 5CBB0 8006EF90 0800E003 */  jr         $ra
/* 5CBB4 8006EF94 22400800 */   neg       $t0, $t0 /* handwritten instruction */
.size TRIG_AngleSinCos_r9r8r10, . - TRIG_AngleSinCos_r9r8r10
