.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel CTR_EmptyFunc_MainFrame_ResetDB
/* F8AC 80021C8C 0800E003 */  jr         $ra
/* F8B0 80021C90 00000000 */   nop
.size CTR_EmptyFunc_MainFrame_ResetDB, . - CTR_EmptyFunc_MainFrame_ResetDB
