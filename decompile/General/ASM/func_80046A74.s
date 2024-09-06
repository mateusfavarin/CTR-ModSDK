.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_80046A74
/* 34694 80046A74 0A80023C */  lui        $v0, %hi(D_8009AA30)
/* 34698 80046A78 30AA438C */  lw         $v1, %lo(D_8009AA30)($v0)
/* 3469C 80046A7C F7FF0424 */  addiu      $a0, $zero, -0x9
/* 346A0 80046A80 06006334 */  ori        $v1, $v1, 0x6
/* 346A4 80046A84 24186400 */  and        $v1, $v1, $a0
/* 346A8 80046A88 0800E003 */  jr         $ra
/* 346AC 80046A8C 30AA43AC */   sw        $v1, %lo(D_8009AA30)($v0)
.size func_80046A74, . - func_80046A74
