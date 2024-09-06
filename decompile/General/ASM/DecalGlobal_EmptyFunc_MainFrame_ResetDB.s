.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel DecalGlobal_EmptyFunc_MainFrame_ResetDB
/* 107B4 80022B94 0800E003 */  jr         $ra
/* 107B8 80022B98 00000000 */   nop
.size DecalGlobal_EmptyFunc_MainFrame_ResetDB, . - DecalGlobal_EmptyFunc_MainFrame_ResetDB
