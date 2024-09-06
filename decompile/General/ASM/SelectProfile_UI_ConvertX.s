.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel SelectProfile_UI_ConvertX
/* 35BD8 80047FB8 00FF8424 */  addiu      $a0, $a0, -0x100
/* 35BDC 80047FBC 18008500 */  mult       $a0, $a1
/* 35BE0 80047FC0 12100000 */  mflo       $v0
/* 35BE4 80047FC4 02004104 */  bgez       $v0, .L80047FD0
/* 35BE8 80047FC8 00000000 */   nop
/* 35BEC 80047FCC FF004224 */  addiu      $v0, $v0, 0xFF
.L80047FD0:
/* 35BF0 80047FD0 0800E003 */  jr         $ra
/* 35BF4 80047FD4 03120200 */   sra       $v0, $v0, 8
.size SelectProfile_UI_ConvertX, . - SelectProfile_UI_ConvertX
