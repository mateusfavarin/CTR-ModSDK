.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel CTR_ClearRenderLists_3P4P
/* F84C 80021C2C 1500A018 */  blez       $a1, .L80021C84
/* F850 80021C30 21300000 */   addu      $a2, $zero, $zero
/* F854 80021C34 0880023C */  lui        $v0, %hi(D_80081B30)
/* F858 80021C38 301B4324 */  addiu      $v1, $v0, %lo(D_80081B30)
.L80021C3C:
/* F85C 80021C3C 0000628C */  lw         $v0, 0x0($v1)
/* F860 80021C40 0C1880AC */  sw         $zero, 0x180C($a0)
/* F864 80021C44 081882AC */  sw         $v0, 0x1808($a0)
/* F868 80021C48 0000628C */  lw         $v0, 0x0($v1)
/* F86C 80021C4C 141880AC */  sw         $zero, 0x1814($a0)
/* F870 80021C50 101882AC */  sw         $v0, 0x1810($a0)
/* F874 80021C54 0000628C */  lw         $v0, 0x0($v1)
/* F878 80021C58 0100C624 */  addiu      $a2, $a2, 0x1
/* F87C 80021C5C 1C1880AC */  sw         $zero, 0x181C($a0)
/* F880 80021C60 181882AC */  sw         $v0, 0x1818($a0)
/* F884 80021C64 0000628C */  lw         $v0, 0x0($v1)
/* F888 80021C68 04006324 */  addiu      $v1, $v1, 0x4
/* F88C 80021C6C 241880AC */  sw         $zero, 0x1824($a0)
/* F890 80021C70 281880AC */  sw         $zero, 0x1828($a0)
/* F894 80021C74 201882AC */  sw         $v0, 0x1820($a0)
/* F898 80021C78 2A10C500 */  slt        $v0, $a2, $a1
/* F89C 80021C7C EFFF4014 */  bnez       $v0, .L80021C3C
/* F8A0 80021C80 30008424 */   addiu     $a0, $a0, 0x30
.L80021C84:
/* F8A4 80021C84 0800E003 */  jr         $ra
/* F8A8 80021C88 00000000 */   nop
.size CTR_ClearRenderLists_3P4P, . - CTR_ClearRenderLists_3P4P
