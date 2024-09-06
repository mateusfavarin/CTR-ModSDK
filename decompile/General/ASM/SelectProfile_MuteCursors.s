.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel SelectProfile_MuteCursors
/* 369C0 80048DA0 0880033C */  lui        $v1, %hi(D_80085B88)
/* 369C4 80048DA4 885B6324 */  addiu      $v1, $v1, %lo(D_80085B88)
/* 369C8 80048DA8 8000063C */  lui        $a2, (0x800000 >> 16)
/* 369CC 80048DAC 0880043C */  lui        $a0, %hi(D_80085BB4)
/* 369D0 80048DB0 B45B8424 */  addiu      $a0, $a0, %lo(D_80085BB4)
/* 369D4 80048DB4 0880053C */  lui        $a1, %hi(D_80085BE0)
/* 369D8 80048DB8 0800628C */  lw         $v0, 0x8($v1)
/* 369DC 80048DBC E05BA524 */  addiu      $a1, $a1, %lo(D_80085BE0)
/* 369E0 80048DC0 25104600 */  or         $v0, $v0, $a2
/* 369E4 80048DC4 080062AC */  sw         $v0, 0x8($v1)
/* 369E8 80048DC8 0800828C */  lw         $v0, 0x8($a0)
/* 369EC 80048DCC 0800A38C */  lw         $v1, 0x8($a1)
/* 369F0 80048DD0 25104600 */  or         $v0, $v0, $a2
/* 369F4 80048DD4 25186600 */  or         $v1, $v1, $a2
/* 369F8 80048DD8 080082AC */  sw         $v0, 0x8($a0)
/* 369FC 80048DDC 0800E003 */  jr         $ra
/* 36A00 80048DE0 0800A3AC */   sw        $v1, 0x8($a1)
.size SelectProfile_MuteCursors, . - SelectProfile_MuteCursors
