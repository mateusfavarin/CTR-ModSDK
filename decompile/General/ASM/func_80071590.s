.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_80071590
/* 5F1B0 80071590 07000324 */  addiu      $v1, $zero, 0x7
/* 5F1B4 80071594 0980083C */  lui        $t0, %hi(D_8008A428)
/* 5F1B8 80071598 28A40825 */  addiu      $t0, $t0, %lo(D_8008A428)
/* 5F1BC 8007159C 94002924 */  addiu      $t1, $at, 0x94
.L800715A0:
/* 5F1C0 800715A0 00000A8D */  lw         $t2, 0x0($t0)
/* 5F1C4 800715A4 04000825 */  addiu      $t0, $t0, 0x4
/* 5F1C8 800715A8 00002AAD */  sw         $t2, 0x0($t1)
/* 5F1CC 800715AC 04002925 */  addiu      $t1, $t1, 0x4
/* 5F1D0 800715B0 FBFF601C */  bgtz       $v1, .L800715A0
/* 5F1D4 800715B4 FFFF6324 */   addiu     $v1, $v1, -0x1
/* 5F1D8 800715B8 07000324 */  addiu      $v1, $zero, 0x7
/* 5F1DC 800715BC 0980083C */  lui        $t0, %hi(D_8008A444)
/* 5F1E0 800715C0 44A40825 */  addiu      $t0, $t0, %lo(D_8008A444)
/* 5F1E4 800715C4 C4002924 */  addiu      $t1, $at, 0xC4
.L800715C8:
/* 5F1E8 800715C8 00000A8D */  lw         $t2, 0x0($t0)
/* 5F1EC 800715CC 04000825 */  addiu      $t0, $t0, 0x4
/* 5F1F0 800715D0 00002AAD */  sw         $t2, 0x0($t1)
/* 5F1F4 800715D4 04002925 */  addiu      $t1, $t1, 0x4
/* 5F1F8 800715D8 FBFF601C */  bgtz       $v1, .L800715C8
/* 5F1FC 800715DC FFFF6324 */   addiu     $v1, $v1, -0x1
/* 5F200 800715E0 0800E003 */  jr         $ra
/* 5F204 800715E4 00000000 */   nop
.size func_80071590, . - func_80071590
