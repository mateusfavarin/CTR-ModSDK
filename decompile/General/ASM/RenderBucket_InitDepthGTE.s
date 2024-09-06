.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel RenderBucket_InitDepthGTE
/* 58A94 8006AE74 00D8C048 */  ctc2       $zero, $27 /* handwritten instruction */
/* 58A98 8006AE78 00E0C048 */  ctc2       $zero, $28 /* handwritten instruction */
/* 58A9C 8006AE7C 55050324 */  addiu      $v1, $zero, 0x555
/* 58AA0 8006AE80 00E8C348 */  ctc2       $v1, $29 /* handwritten instruction */
/* 58AA4 8006AE84 00040324 */  addiu      $v1, $zero, 0x400
/* 58AA8 8006AE88 0800E003 */  jr         $ra
/* 58AAC 8006AE8C 00F0C348 */   ctc2      $v1, $30 /* handwritten instruction */
.size RenderBucket_InitDepthGTE, . - RenderBucket_InitDepthGTE
