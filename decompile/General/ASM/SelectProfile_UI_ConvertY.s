.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel SelectProfile_UI_ConvertY
/* 35BF8 80047FD8 94FF8424 */  addiu      $a0, $a0, -0x6C
/* 35BFC 80047FDC 18008500 */  mult       $a0, $a1
/* 35C00 80047FE0 12100000 */  mflo       $v0
/* 35C04 80047FE4 02004104 */  bgez       $v0, .L80047FF0
/* 35C08 80047FE8 00000000 */   nop
/* 35C0C 80047FEC FF004224 */  addiu      $v0, $v0, 0xFF
.L80047FF0:
/* 35C10 80047FF0 0800E003 */  jr         $ra
/* 35C14 80047FF4 03120200 */   sra       $v0, $v0, 8
.size SelectProfile_UI_ConvertY, . - SelectProfile_UI_ConvertY
