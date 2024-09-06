.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel CTR_ClearRenderLists_1P2P
/* F7DC 80021BBC 1900A018 */  blez       $a1, .L80021C24
/* F7E0 80021BC0 21300000 */   addu      $a2, $zero, $zero
/* F7E4 80021BC4 0880023C */  lui        $v0, %hi(D_80081B20)
/* F7E8 80021BC8 201B4324 */  addiu      $v1, $v0, %lo(D_80081B20)
.L80021BCC:
/* F7EC 80021BCC 0000628C */  lw         $v0, 0x0($v1)
/* F7F0 80021BD0 0C1880AC */  sw         $zero, 0x180C($a0)
/* F7F4 80021BD4 081882AC */  sw         $v0, 0x1808($a0)
/* F7F8 80021BD8 0000628C */  lw         $v0, 0x0($v1)
/* F7FC 80021BDC 141880AC */  sw         $zero, 0x1814($a0)
/* F800 80021BE0 101882AC */  sw         $v0, 0x1810($a0)
/* F804 80021BE4 0000628C */  lw         $v0, 0x0($v1)
/* F808 80021BE8 1C1880AC */  sw         $zero, 0x181C($a0)
/* F80C 80021BEC 181882AC */  sw         $v0, 0x1818($a0)
/* F810 80021BF0 0000628C */  lw         $v0, 0x0($v1)
/* F814 80021BF4 0100C624 */  addiu      $a2, $a2, 0x1
/* F818 80021BF8 241880AC */  sw         $zero, 0x1824($a0)
/* F81C 80021BFC 201882AC */  sw         $v0, 0x1820($a0)
/* F820 80021C00 0000628C */  lw         $v0, 0x0($v1)
/* F824 80021C04 04006324 */  addiu      $v1, $v1, 0x4
/* F828 80021C08 2C1880AC */  sw         $zero, 0x182C($a0)
/* F82C 80021C0C 301880AC */  sw         $zero, 0x1830($a0)
/* F830 80021C10 341880AC */  sw         $zero, 0x1834($a0)
/* F834 80021C14 281882AC */  sw         $v0, 0x1828($a0)
/* F838 80021C18 2A10C500 */  slt        $v0, $a2, $a1
/* F83C 80021C1C EBFF4014 */  bnez       $v0, .L80021BCC
/* F840 80021C20 30008424 */   addiu     $a0, $a0, 0x30
.L80021C24:
/* F844 80021C24 0800E003 */  jr         $ra
/* F848 80021C28 00000000 */   nop
.size CTR_ClearRenderLists_1P2P, . - CTR_ClearRenderLists_1P2P
