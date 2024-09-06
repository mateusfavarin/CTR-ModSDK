.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel RefreshCard_Entry
/* 35984 80047D64 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 35988 80047D68 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 3598C 80047D6C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 35990 80047D70 1000BFAF */  sw         $ra, 0x10($sp)
/* 35994 80047D74 0000428C */  lw         $v0, 0x0($v0)
/* 35998 80047D78 00000000 */  nop
/* 3599C 80047D7C 10004230 */  andi       $v0, $v0, 0x10
/* 359A0 80047D80 05004014 */  bnez       $v0, .L80047D98
/* 359A4 80047D84 00000000 */   nop
/* 359A8 80047D88 961E010C */  jal        func_80047A58
/* 359AC 80047D8C 00000000 */   nop
/* 359B0 80047D90 B41C010C */  jal        func_800472D0
/* 359B4 80047D94 00000000 */   nop
.L80047D98:
/* 359B8 80047D98 1000BF8F */  lw         $ra, 0x10($sp)
/* 359BC 80047D9C 00000000 */  nop
/* 359C0 80047DA0 0800E003 */  jr         $ra
/* 359C4 80047DA4 1800BD27 */   addiu     $sp, $sp, 0x18
.size RefreshCard_Entry, . - RefreshCard_Entry
