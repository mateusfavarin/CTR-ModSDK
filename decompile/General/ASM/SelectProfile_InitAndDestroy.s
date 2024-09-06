.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel SelectProfile_InitAndDestroy
/* 36AFC 80048EDC 0880023C */  lui        $v0, %hi(D_80085B9C)
/* 36B00 80048EE0 9C5B4484 */  lh         $a0, %lo(D_80085B9C)($v0)
/* 36B04 80048EE4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 36B08 80048EE8 1000BFAF */  sw         $ra, 0x10($sp)
/* 36B0C 80048EEC 7321010C */  jal        SelectProfile_Init
/* 36B10 80048EF0 00000000 */   nop
/* 36B14 80048EF4 3822010C */  jal        SelectProfile_Destroy
/* 36B18 80048EF8 00000000 */   nop
/* 36B1C 80048EFC 1000BF8F */  lw         $ra, 0x10($sp)
/* 36B20 80048F00 00000000 */  nop
/* 36B24 80048F04 0800E003 */  jr         $ra
/* 36B28 80048F08 1800BD27 */   addiu     $sp, $sp, 0x18
.size SelectProfile_InitAndDestroy, . - SelectProfile_InitAndDestroy
