.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_80020334
/* DF54 80020334 2200C984 */  lh         $t1, 0x22($a2)
/* DF58 80020338 05008014 */  bnez       $a0, .L80020350
/* DF5C 8002033C DFFF2231 */   andi      $v0, $t1, 0xFFDF
/* DF60 80020340 2200C2A4 */  sh         $v0, 0x22($a2)
/* DF64 80020344 0E00C0A4 */  sh         $zero, 0xE($a2)
/* DF68 80020348 0800E003 */  jr         $ra
/* DF6C 8002034C C002C0AC */   sw        $zero, 0x2C0($a2)
.L80020350:
/* DF70 80020350 C002C28C */  lw         $v0, 0x2C0($a2)
/* DF74 80020354 00000000 */  nop
/* DF78 80020358 FFFF4324 */  addiu      $v1, $v0, -0x1
/* DF7C 8002035C 1B006004 */  bltz       $v1, .L800203CC
/* DF80 80020360 20002A35 */   ori       $t2, $t1, 0x20
/* DF84 80020364 40100300 */  sll        $v0, $v1, 1
/* DF88 80020368 21104300 */  addu       $v0, $v0, $v1
/* DF8C 8002036C 80100200 */  sll        $v0, $v0, 2
/* DF90 80020370 0C024824 */  addiu      $t0, $v0, 0x20C
.L80020374:
/* DF94 80020374 2138C800 */  addu       $a3, $a2, $t0
/* DF98 80020378 0000E28C */  lw         $v0, 0x0($a3)
/* DF9C 8002037C 00000000 */  nop
/* DFA0 80020380 0F004414 */  bne        $v0, $a0, .L800203C0
/* DFA4 80020384 00000000 */   nop
/* DFA8 80020388 0400E28C */  lw         $v0, 0x4($a3)
/* DFAC 8002038C 00000000 */  nop
/* DFB0 80020390 0C004514 */  bne        $v0, $a1, .L800203C4
/* DFB4 80020394 FFFF6324 */   addiu     $v1, $v1, -0x1
/* DFB8 80020398 0800E38C */  lw         $v1, 0x8($a3)
/* DFBC 8002039C 00000000 */  nop
/* DFC0 800203A0 01046228 */  slti       $v0, $v1, 0x401
/* DFC4 800203A4 03004010 */  beqz       $v0, .L800203B4
/* DFC8 800203A8 00000000 */   nop
/* DFCC 800203AC 00016324 */  addiu      $v1, $v1, 0x100
/* DFD0 800203B0 0800E3AC */  sw         $v1, 0x8($a3)
.L800203B4:
/* DFD4 800203B4 2200CAA4 */  sh         $t2, 0x22($a2)
/* DFD8 800203B8 0800E003 */  jr         $ra
/* DFDC 800203BC 0E00C3A4 */   sh        $v1, 0xE($a2)
.L800203C0:
/* DFE0 800203C0 FFFF6324 */  addiu      $v1, $v1, -0x1
.L800203C4:
/* DFE4 800203C4 EBFF6104 */  bgez       $v1, .L80020374
/* DFE8 800203C8 F4FF0825 */   addiu     $t0, $t0, -0xC
.L800203CC:
/* DFEC 800203CC C002C38C */  lw         $v1, 0x2C0($a2)
/* DFF0 800203D0 00000000 */  nop
/* DFF4 800203D4 40100300 */  sll        $v0, $v1, 1
/* DFF8 800203D8 21104300 */  addu       $v0, $v0, $v1
/* DFFC 800203DC 80100200 */  sll        $v0, $v0, 2
/* E000 800203E0 0C024224 */  addiu      $v0, $v0, 0x20C
/* E004 800203E4 2138C200 */  addu       $a3, $a2, $v0
/* E008 800203E8 0000E4AC */  sw         $a0, 0x0($a3)
/* E00C 800203EC 0400E5AC */  sw         $a1, 0x4($a3)
/* E010 800203F0 0800E0AC */  sw         $zero, 0x8($a3)
/* E014 800203F4 C002C38C */  lw         $v1, 0x2C0($a2)
/* E018 800203F8 DFFF2231 */  andi       $v0, $t1, 0xFFDF
/* E01C 800203FC 2200C2A4 */  sh         $v0, 0x22($a2)
/* E020 80020400 0E00C0A4 */  sh         $zero, 0xE($a2)
/* E024 80020404 01006324 */  addiu      $v1, $v1, 0x1
/* E028 80020408 0800E003 */  jr         $ra
/* E02C 8002040C C002C3AC */   sw        $v1, 0x2C0($a2)
.size func_80020334, . - func_80020334
