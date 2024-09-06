.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel PROC_StartSearch_Self
/* 30164 80042544 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 30168 80042548 21388000 */  addu       $a3, $a0, $zero
/* 3016C 8004254C 1000BFAF */  sw         $ra, 0x10($sp)
/* 30170 80042550 0000E294 */  lhu        $v0, 0x0($a3)
/* 30174 80042554 0600E494 */  lhu        $a0, 0x6($a3)
/* 30178 80042558 0200E394 */  lhu        $v1, 0x2($a3)
/* 3017C 8004255C 21288000 */  addu       $a1, $a0, $zero
/* 30180 80042560 23104400 */  subu       $v0, $v0, $a0
/* 30184 80042564 1C00E2A4 */  sh         $v0, 0x1C($a3)
/* 30188 80042568 0400E294 */  lhu        $v0, 0x4($a3)
/* 3018C 8004256C 23186500 */  subu       $v1, $v1, $a1
/* 30190 80042570 1E00E3A4 */  sh         $v1, 0x1E($a3)
/* 30194 80042574 0000E394 */  lhu        $v1, 0x0($a3)
/* 30198 80042578 23104400 */  subu       $v0, $v0, $a0
/* 3019C 8004257C 2000E2A4 */  sh         $v0, 0x20($a3)
/* 301A0 80042580 0200E294 */  lhu        $v0, 0x2($a3)
/* 301A4 80042584 21186500 */  addu       $v1, $v1, $a1
/* 301A8 80042588 2200E3A4 */  sh         $v1, 0x22($a3)
/* 301AC 8004258C 0400E394 */  lhu        $v1, 0x4($a3)
/* 301B0 80042590 21104400 */  addu       $v0, $v0, $a0
/* 301B4 80042594 2400E2A4 */  sh         $v0, 0x24($a3)
/* 301B8 80042598 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 301BC 8004259C ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 301C0 800425A0 21186500 */  addu       $v1, $v1, $a1
/* 301C4 800425A4 2600E3A4 */  sh         $v1, 0x26($a3)
/* 301C8 800425A8 6001428C */  lw         $v0, 0x160($v0)
/* 301CC 800425AC 0480063C */  lui        $a2, %hi(PROC_PerBspLeaf_CheckInstances)
/* 301D0 800425B0 0000428C */  lw         $v0, 0x0($v0)
/* 301D4 800425B4 FC23C624 */  addiu      $a2, $a2, %lo(PROC_PerBspLeaf_CheckInstances)
/* 301D8 800425B8 1800448C */  lw         $a0, 0x18($v0)
/* 301DC 800425BC FB7A000C */  jal        COLL_SearchTree_FindX
/* 301E0 800425C0 1C00E524 */   addiu     $a1, $a3, 0x1C
/* 301E4 800425C4 1000BF8F */  lw         $ra, 0x10($sp)
/* 301E8 800425C8 00000000 */  nop
/* 301EC 800425CC 0800E003 */  jr         $ra
/* 301F0 800425D0 1800BD27 */   addiu     $sp, $sp, 0x18
.size PROC_StartSearch_Self, . - PROC_StartSearch_Self
