.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_8006D258
/* 5AE78 8006D258 5000268C */  lw         $a2, 0x50($at)
/* 5AE7C 8006D25C A0002CE8 */  swc2       $12, 0xA0($at)
/* 5AE80 8006D260 A40031E8 */  swc2       $17, 0xA4($at)
/* 5AE84 8006D264 B8002DE8 */  swc2       $13, 0xB8($at)
/* 5AE88 8006D268 BC0032E8 */  swc2       $18, 0xBC($at)
/* 5AE8C 8006D26C D0002EE8 */  swc2       $14, 0xD0($at)
/* 5AE90 8006D270 D40033E8 */  swc2       $19, 0xD4($at)
/* 5AE94 8006D274 98002EAC */  sw         $t6, 0x98($at)
/* 5AE98 8006D278 B0002FAC */  sw         $t7, 0xB0($at)
/* 5AE9C 8006D27C C80030AC */  sw         $s0, 0xC8($at)
/* 5AEA0 8006D280 0C00C010 */  beqz       $a2, .L8006D2B4
/* 5AEA4 8006D284 540026AC */   sw        $a2, 0x54($at)
/* 5AEA8 8006D288 0000CA8C */  lw         $t2, 0x0($a2)
/* 5AEAC 8006D28C 0400C58C */  lw         $a1, 0x4($a2)
/* 5AEB0 8006D290 60002AAC */  sw         $t2, 0x60($at)
/* 5AEB4 8006D294 9C002AA4 */  sh         $t2, 0x9C($at)
/* 5AEB8 8006D298 0800CA8C */  lw         $t2, 0x8($a2)
/* 5AEBC 8006D29C 640025AC */  sw         $a1, 0x64($at)
/* 5AEC0 8006D2A0 B40025A4 */  sh         $a1, 0xB4($at)
/* 5AEC4 8006D2A4 68002AAC */  sw         $t2, 0x68($at)
/* 5AEC8 8006D2A8 CC002AA4 */  sh         $t2, 0xCC($at)
/* 5AECC 8006D2AC 60002624 */  addiu      $a2, $at, 0x60
/* 5AED0 8006D2B0 500026AC */  sw         $a2, 0x50($at)
.L8006D2B4:
/* 5AED4 8006D2B4 0800E003 */  jr         $ra
/* 5AED8 8006D2B8 00000000 */   nop
.size func_8006D258, . - func_8006D258
