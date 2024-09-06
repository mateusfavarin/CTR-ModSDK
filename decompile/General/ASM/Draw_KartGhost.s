.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel Draw_KartGhost
/* 5A5A4 8006C984 2400E38F */  lw         $v1, 0x24($ra)
/* 5A5A8 8006C988 2200E887 */  lh         $t0, 0x22($ra)
/* 5A5AC 8006C98C EFFF6014 */  bnez       $v1, .L8006C94C
/* 5A5B0 8006C990 00100924 */   addiu     $t1, $zero, 0x1000
/* 5A5B4 8006C994 23482801 */  subu       $t1, $t1, $t0
/* 5A5B8 8006C998 42490900 */  srl        $t1, $t1, 5
/* 5A5BC 8006C99C 240129A0 */  sb         $t1, 0x124($at)
/* 5A5C0 8006C9A0 250129A0 */  sb         $t1, 0x125($at)
/* 5A5C4 8006C9A4 260129A0 */  sb         $t1, 0x126($at)
/* 5A5C8 8006C9A8 22000924 */  addiu      $t1, $zero, 0x22
/* 5A5CC 8006C9AC 270129A0 */  sb         $t1, 0x127($at)
/* 5A5D0 8006C9B0 00F00825 */  addiu      $t0, $t0, -0x1000
/* 5A5D4 8006C9B4 E5FF0015 */  bnez       $t0, .L8006C94C
/* 5A5D8 8006C9B8 00000000 */   nop
/* 5A5DC 8006C9BC D8F80104 */  bgez       $zero, .L8006AD20
/* 5A5E0 8006C9C0 00000000 */   nop
.size Draw_KartGhost, . - Draw_KartGhost
