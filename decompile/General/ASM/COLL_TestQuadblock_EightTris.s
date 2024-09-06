.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel COLL_TestQuadblock_EightTris
/* D310 8001F6F0 ECFFBD27 */  addiu      $sp, $sp, -0x14
/* D314 8001F6F4 2C00988C */  lw         $t8, 0x2C($a0)
/* D318 8001F6F8 1000BFAF */  sw         $ra, 0x10($sp)
/* D31C 8001F6FC 1000188F */  lw         $t8, 0x10($t8)
/* D320 8001F700 FC7D000C */  jal        COLL_ResetScratchpadCache
/* D324 8001F704 21C8A000 */   addu      $t9, $a1, $zero
/* D328 8001F708 3F002883 */  lb         $t0, 0x3F($t9)
/* D32C 8001F70C EC008994 */  lhu        $t1, 0xEC($a0)
/* D330 8001F710 EE008A94 */  lhu        $t2, 0xEE($a0)
/* D334 8001F714 AB0180A0 */  sb         $zero, 0x1AB($a0)
/* D338 8001F718 19002A11 */  beq        $t1, $t2, .L8001F780
/* D33C 8001F71C AA0188A0 */   sb        $t0, 0x1AA($a0)
/* D340 8001F720 50002387 */  lh         $v1, 0x50($t9)
/* D344 8001F724 90018524 */  addiu      $a1, $a0, 0x190
/* D348 8001F728 68018624 */  addiu      $a2, $a0, 0x168
/* D34C 8001F72C 7C018724 */  addiu      $a3, $a0, 0x17C
/* D350 8001F730 B77C000C */  jal        COLL_TestTriangle_GetNormalVector
/* D354 8001F734 A80183A4 */   sh        $v1, 0x1A8($a0)
/* D358 8001F738 52002387 */  lh         $v1, 0x52($t9)
/* D35C 8001F73C 7C018524 */  addiu      $a1, $a0, 0x17C
/* D360 8001F740 2C018624 */  addiu      $a2, $a0, 0x12C
/* D364 8001F744 90018724 */  addiu      $a3, $a0, 0x190
/* D368 8001F748 B77C000C */  jal        COLL_TestTriangle_GetNormalVector
/* D36C 8001F74C A80183A4 */   sh        $v1, 0x1A8($a0)
/* D370 8001F750 54002387 */  lh         $v1, 0x54($t9)
/* D374 8001F754 04018524 */  addiu      $a1, $a0, 0x104
/* D378 8001F758 7C018624 */  addiu      $a2, $a0, 0x17C
/* D37C 8001F75C 68018724 */  addiu      $a3, $a0, 0x168
/* D380 8001F760 B77C000C */  jal        COLL_TestTriangle_GetNormalVector
/* D384 8001F764 A80183A4 */   sh        $v1, 0x1A8($a0)
/* D388 8001F768 56002387 */  lh         $v1, 0x56($t9)
/* D38C 8001F76C 18018524 */  addiu      $a1, $a0, 0x118
/* D390 8001F770 68018624 */  addiu      $a2, $a0, 0x168
/* D394 8001F774 90018724 */  addiu      $a3, $a0, 0x190
/* D398 8001F778 B77C000C */  jal        COLL_TestTriangle_GetNormalVector
/* D39C 8001F77C A80183A4 */   sh        $v1, 0x1A8($a0)
.L8001F780:
/* D3A0 8001F780 48002387 */  lh         $v1, 0x48($t9)
/* D3A4 8001F784 F0008524 */  addiu      $a1, $a0, 0xF0
/* D3A8 8001F788 40018624 */  addiu      $a2, $a0, 0x140
/* D3AC 8001F78C 54018724 */  addiu      $a3, $a0, 0x154
/* D3B0 8001F790 B77C000C */  jal        COLL_TestTriangle_GetNormalVector
/* D3B4 8001F794 A80183A4 */   sh        $v1, 0x1A8($a0)
/* D3B8 8001F798 4A002387 */  lh         $v1, 0x4A($t9)
/* D3BC 8001F79C 40018524 */  addiu      $a1, $a0, 0x140
/* D3C0 8001F7A0 68018624 */  addiu      $a2, $a0, 0x168
/* D3C4 8001F7A4 54018724 */  addiu      $a3, $a0, 0x154
/* D3C8 8001F7A8 B77C000C */  jal        COLL_TestTriangle_GetNormalVector
/* D3CC 8001F7AC A80183A4 */   sh        $v1, 0x1A8($a0)
/* D3D0 8001F7B0 4C002387 */  lh         $v1, 0x4C($t9)
/* D3D4 8001F7B4 68018524 */  addiu      $a1, $a0, 0x168
/* D3D8 8001F7B8 40018624 */  addiu      $a2, $a0, 0x140
/* D3DC 8001F7BC 04018724 */  addiu      $a3, $a0, 0x104
/* D3E0 8001F7C0 B77C000C */  jal        COLL_TestTriangle_GetNormalVector
/* D3E4 8001F7C4 A80183A4 */   sh        $v1, 0x1A8($a0)
/* D3E8 8001F7C8 4E002387 */  lh         $v1, 0x4E($t9)
/* D3EC 8001F7CC 54018524 */  addiu      $a1, $a0, 0x154
/* D3F0 8001F7D0 68018624 */  addiu      $a2, $a0, 0x168
/* D3F4 8001F7D4 18018724 */  addiu      $a3, $a0, 0x118
/* D3F8 8001F7D8 B77C000C */  jal        COLL_TestTriangle_GetNormalVector
/* D3FC 8001F7DC A80183A4 */   sh        $v1, 0x1A8($a0)
/* D400 8001F7E0 1000BF8F */  lw         $ra, 0x10($sp)
/* D404 8001F7E4 1400BD27 */  addiu      $sp, $sp, 0x14
/* D408 8001F7E8 0800E003 */  jr         $ra
/* D40C 8001F7EC 00000000 */   nop
.size COLL_TestQuadblock_EightTris, . - COLL_TestQuadblock_EightTris
