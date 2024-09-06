.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel DecalGlobal_FindInLEV
/* 108A8 80022C88 3C00838C */  lw         $v1, 0x3C($a0)
/* 108AC 80022C8C 00000000 */  nop
/* 108B0 80022C90 24006010 */  beqz       $v1, .L80022D24
/* 108B4 80022C94 00000000 */   nop
/* 108B8 80022C98 0800628C */  lw         $v0, 0x8($v1)
/* 108BC 80022C9C 0C00668C */  lw         $a2, 0xC($v1)
/* 108C0 80022CA0 80100200 */  sll        $v0, $v0, 2
/* 108C4 80022CA4 2138C200 */  addu       $a3, $a2, $v0
/* 108C8 80022CA8 2B10C700 */  sltu       $v0, $a2, $a3
/* 108CC 80022CAC 1D004010 */  beqz       $v0, .L80022D24
/* 108D0 80022CB0 00000000 */   nop
/* 108D4 80022CB4 0000A88C */  lw         $t0, 0x0($a1)
.L80022CB8:
/* 108D8 80022CB8 0000C48C */  lw         $a0, 0x0($a2)
/* 108DC 80022CBC 00000000 */  nop
/* 108E0 80022CC0 0000828C */  lw         $v0, 0x0($a0)
/* 108E4 80022CC4 00000000 */  nop
/* 108E8 80022CC8 12004814 */  bne        $v0, $t0, .L80022D14
/* 108EC 80022CCC 00000000 */   nop
/* 108F0 80022CD0 0400838C */  lw         $v1, 0x4($a0)
/* 108F4 80022CD4 0400A28C */  lw         $v0, 0x4($a1)
/* 108F8 80022CD8 00000000 */  nop
/* 108FC 80022CDC 0D006214 */  bne        $v1, $v0, .L80022D14
/* 10900 80022CE0 00000000 */   nop
/* 10904 80022CE4 0800838C */  lw         $v1, 0x8($a0)
/* 10908 80022CE8 0800A28C */  lw         $v0, 0x8($a1)
/* 1090C 80022CEC 00000000 */  nop
/* 10910 80022CF0 08006214 */  bne        $v1, $v0, .L80022D14
/* 10914 80022CF4 00000000 */   nop
/* 10918 80022CF8 0C00838C */  lw         $v1, 0xC($a0)
/* 1091C 80022CFC 0C00A28C */  lw         $v0, 0xC($a1)
/* 10920 80022D00 00000000 */  nop
/* 10924 80022D04 04006214 */  bne        $v1, $v0, .L80022D18
/* 10928 80022D08 0400C624 */   addiu     $a2, $a2, 0x4
/* 1092C 80022D0C 0800E003 */  jr         $ra
/* 10930 80022D10 21108000 */   addu      $v0, $a0, $zero
.L80022D14:
/* 10934 80022D14 0400C624 */  addiu      $a2, $a2, 0x4
.L80022D18:
/* 10938 80022D18 2B10C700 */  sltu       $v0, $a2, $a3
/* 1093C 80022D1C E6FF4014 */  bnez       $v0, .L80022CB8
/* 10940 80022D20 00000000 */   nop
.L80022D24:
/* 10944 80022D24 0800E003 */  jr         $ra
/* 10948 80022D28 21100000 */   addu      $v0, $zero, $zero
.size DecalGlobal_FindInLEV, . - DecalGlobal_FindInLEV
