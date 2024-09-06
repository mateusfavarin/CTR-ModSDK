.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel RefreshCard_NextMemcardAction
/* 3473C 80046B1C 0A80083C */  lui        $t0, %hi(D_8009AA30)
/* 34740 80046B20 1000A98F */  lw         $t1, 0x10($sp)
/* 34744 80046B24 1400AA8F */  lw         $t2, 0x14($sp)
/* 34748 80046B28 30AA0325 */  addiu      $v1, $t0, %lo(D_8009AA30)
/* 3474C 80046B2C 120065A4 */  sh         $a1, 0x12($v1)
/* 34750 80046B30 0A0065A4 */  sh         $a1, 0xA($v1)
/* 34754 80046B34 140064A4 */  sh         $a0, 0x14($v1)
/* 34758 80046B38 0C0064A4 */  sh         $a0, 0xC($v1)
/* 3475C 80046B3C 180066AC */  sw         $a2, 0x18($v1)
/* 34760 80046B40 1C0067AC */  sw         $a3, 0x1C($v1)
/* 34764 80046B44 30AA028D */  lw         $v0, %lo(D_8009AA30)($t0)
/* 34768 80046B48 F7FF0424 */  addiu      $a0, $zero, -0x9
/* 3476C 80046B4C 24104400 */  and        $v0, $v0, $a0
/* 34770 80046B50 30AA02AD */  sw         $v0, %lo(D_8009AA30)($t0)
/* 34774 80046B54 200069AC */  sw         $t1, 0x20($v1)
/* 34778 80046B58 0800E003 */  jr         $ra
/* 3477C 80046B5C 24006AA4 */   sh        $t2, 0x24($v1)
.size RefreshCard_NextMemcardAction, . - RefreshCard_NextMemcardAction
