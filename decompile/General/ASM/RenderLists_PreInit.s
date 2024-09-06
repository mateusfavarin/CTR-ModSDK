.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel RenderLists_PreInit
/* 5DEF4 800702D4 801F013C */  lui        $at, (0x1F800084 >> 16)
/* 5DEF8 800702D8 07000A24 */  addiu      $t2, $zero, 0x7
/* 5DEFC 800702DC 0980083C */  lui        $t0, %hi(D_8008A408)
/* 5DF00 800702E0 08A40825 */  addiu      $t0, $t0, %lo(D_8008A408)
/* 5DF04 800702E4 84002920 */  addi       $t1, $at, (0x1F800084 & 0xFFFF) /* handwritten instruction */
.L800702E8:
/* 5DF08 800702E8 0000038D */  lw         $v1, 0x0($t0)
/* 5DF0C 800702EC 04000825 */  addiu      $t0, $t0, 0x4
/* 5DF10 800702F0 000023AD */  sw         $v1, 0x0($t1)
/* 5DF14 800702F4 04002925 */  addiu      $t1, $t1, 0x4
/* 5DF18 800702F8 FBFF4015 */  bnez       $t2, .L800702E8
/* 5DF1C 800702FC FFFF4A25 */   addiu     $t2, $t2, -0x1
/* 5DF20 80070300 0800E003 */  jr         $ra
/* 5DF24 80070304 00000000 */   nop
.size RenderLists_PreInit, . - RenderLists_PreInit
