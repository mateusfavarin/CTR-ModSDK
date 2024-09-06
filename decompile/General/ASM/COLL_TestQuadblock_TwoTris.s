.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel COLL_TestQuadblock_TwoTris
/* D29C 8001F67C ECFFBD27 */  addiu      $sp, $sp, -0x14
/* D2A0 8001F680 2C00988C */  lw         $t8, 0x2C($a0)
/* D2A4 8001F684 1000BFAF */  sw         $ra, 0x10($sp)
/* D2A8 8001F688 1000188F */  lw         $t8, 0x10($t8)
/* D2AC 8001F68C FC7D000C */  jal        COLL_ResetScratchpadCache
/* D2B0 8001F690 21C8A000 */   addu      $t9, $a1, $zero
/* D2B4 8001F694 02000324 */  addiu      $v1, $zero, 0x2
/* D2B8 8001F698 3F002883 */  lb         $t0, 0x3F($t9)
/* D2BC 8001F69C EC008994 */  lhu        $t1, 0xEC($a0)
/* D2C0 8001F6A0 EE008A94 */  lhu        $t2, 0xEE($a0)
/* D2C4 8001F6A4 AB0183A0 */  sb         $v1, 0x1AB($a0)
/* D2C8 8001F6A8 07002A11 */  beq        $t1, $t2, .L8001F6C8
/* D2CC 8001F6AC AA0188A0 */   sb        $t0, 0x1AA($a0)
/* D2D0 8001F6B0 5A002387 */  lh         $v1, 0x5A($t9)
/* D2D4 8001F6B4 04018524 */  addiu      $a1, $a0, 0x104
/* D2D8 8001F6B8 2C018624 */  addiu      $a2, $a0, 0x12C
/* D2DC 8001F6BC 18018724 */  addiu      $a3, $a0, 0x118
/* D2E0 8001F6C0 B77C000C */  jal        COLL_TestTriangle_GetNormalVector
/* D2E4 8001F6C4 A80183A4 */   sh        $v1, 0x1A8($a0)
.L8001F6C8:
/* D2E8 8001F6C8 58002387 */  lh         $v1, 0x58($t9)
/* D2EC 8001F6CC F0008524 */  addiu      $a1, $a0, 0xF0
/* D2F0 8001F6D0 04018624 */  addiu      $a2, $a0, 0x104
/* D2F4 8001F6D4 18018724 */  addiu      $a3, $a0, 0x118
/* D2F8 8001F6D8 B77C000C */  jal        COLL_TestTriangle_GetNormalVector
/* D2FC 8001F6DC A80183A4 */   sh        $v1, 0x1A8($a0)
/* D300 8001F6E0 1000BF8F */  lw         $ra, 0x10($sp)
/* D304 8001F6E4 1400BD27 */  addiu      $sp, $sp, 0x14
/* D308 8001F6E8 0800E003 */  jr         $ra
/* D30C 8001F6EC 00000000 */   nop
.size COLL_TestQuadblock_TwoTris, . - COLL_TestQuadblock_TwoTris
