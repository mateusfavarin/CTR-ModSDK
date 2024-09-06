.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel DrawSky_Full
/* 577D0 80069BB0 801F013C */  lui        $at, (0x1F800014 >> 16)
/* 577D4 80069BB4 00003FAC */  sw         $ra, (0x1F800000 & 0xFFFF)($at)
/* 577D8 80069BB8 040030AC */  sw         $s0, (0x1F800004 & 0xFFFF)($at)
/* 577DC 80069BBC 080031AC */  sw         $s1, (0x1F800008 & 0xFFFF)($at)
/* 577E0 80069BC0 0C0032AC */  sw         $s2, (0x1F80000C & 0xFFFF)($at)
/* 577E4 80069BC4 0C00C28C */  lw         $v0, 0xC($a2)
/* 577E8 80069BC8 37008010 */  beqz       $a0, .L80069CA8
/* 577EC 80069BCC 1400CE8C */   lw        $t6, 0x14($a2)
/* 577F0 80069BD0 2000AF8C */  lw         $t7, 0x20($a1)
/* 577F4 80069BD4 F400A78C */  lw         $a3, 0xF4($a1)
/* 577F8 80069BD8 04008C8C */  lw         $t4, 0x4($a0)
/* 577FC 80069BDC 2800A38C */  lw         $v1, 0x28($a1)
/* 57800 80069BE0 2C00A88C */  lw         $t0, 0x2C($a1)
/* 57804 80069BE4 3000A98C */  lw         $t1, 0x30($a1)
/* 57808 80069BE8 3400AA8C */  lw         $t2, 0x34($a1)
/* 5780C 80069BEC 0000C348 */  ctc2       $v1, $0 /* handwritten instruction */
/* 57810 80069BF0 3800A38C */  lw         $v1, 0x38($a1)
/* 57814 80069BF4 0008C848 */  ctc2       $t0, $1 /* handwritten instruction */
/* 57818 80069BF8 0010C948 */  ctc2       $t1, $2 /* handwritten instruction */
/* 5781C 80069BFC 0018CA48 */  ctc2       $t2, $3 /* handwritten instruction */
/* 57820 80069C00 0020C348 */  ctc2       $v1, $4 /* handwritten instruction */
/* 57824 80069C04 FC0FE724 */  addiu      $a3, $a3, 0xFFC
/* 57828 80069C08 0800A38C */  lw         $v1, 0x8($a1)
/* 5782C 80069C0C 0028C048 */  ctc2       $zero, $5 /* handwritten instruction */
/* 57830 80069C10 0030C048 */  ctc2       $zero, $6 /* handwritten instruction */
/* 57834 80069C14 0038C048 */  ctc2       $zero, $7 /* handwritten instruction */
/* 57838 80069C18 00056324 */  addiu      $v1, $v1, 0x500
/* 5783C 80069C1C C2190300 */  srl        $v1, $v1, 7
/* 57840 80069C20 1C006330 */  andi       $v1, $v1, 0x1C
/* 57844 80069C24 21588300 */  addu       $t3, $a0, $v1
/* 57848 80069C28 100023AC */  sw         $v1, (0x1F800010 & 0xFFFF)($at)
/* 5784C 80069C2C 42180300 */  srl        $v1, $v1, 1
/* 57850 80069C30 140023AC */  sw         $v1, (0x1F800014 & 0xFFFF)($at)
/* 57854 80069C34 31A7010C */  jal        DrawSky_Piece
/* 57858 80069C38 21688300 */   addu      $t5, $a0, $v1
/* 5785C 80069C3C 1000238C */  lw         $v1, 0x10($at)
/* 57860 80069C40 1400288C */  lw         $t0, 0x14($at)
/* 57864 80069C44 04006324 */  addiu      $v1, $v1, 0x4
/* 57868 80069C48 1C006330 */  andi       $v1, $v1, 0x1C
/* 5786C 80069C4C 02000825 */  addiu      $t0, $t0, 0x2
/* 57870 80069C50 0E000831 */  andi       $t0, $t0, 0xE
/* 57874 80069C54 21588300 */  addu       $t3, $a0, $v1
/* 57878 80069C58 31A7010C */  jal        DrawSky_Piece
/* 5787C 80069C5C 21688800 */   addu      $t5, $a0, $t0
/* 57880 80069C60 1000238C */  lw         $v1, 0x10($at)
/* 57884 80069C64 1400288C */  lw         $t0, 0x14($at)
/* 57888 80069C68 FCFF6324 */  addiu      $v1, $v1, -0x4
/* 5788C 80069C6C 1C006330 */  andi       $v1, $v1, 0x1C
/* 57890 80069C70 FEFF0825 */  addiu      $t0, $t0, -0x2
/* 57894 80069C74 0E000831 */  andi       $t0, $t0, 0xE
/* 57898 80069C78 21588300 */  addu       $t3, $a0, $v1
/* 5789C 80069C7C 31A7010C */  jal        DrawSky_Piece
/* 578A0 80069C80 21688800 */   addu      $t5, $a0, $t0
/* 578A4 80069C84 1000238C */  lw         $v1, 0x10($at)
/* 578A8 80069C88 1400288C */  lw         $t0, 0x14($at)
/* 578AC 80069C8C F8FF6324 */  addiu      $v1, $v1, -0x8
/* 578B0 80069C90 1C006330 */  andi       $v1, $v1, 0x1C
/* 578B4 80069C94 FCFF0825 */  addiu      $t0, $t0, -0x4
/* 578B8 80069C98 0E000831 */  andi       $t0, $t0, 0xE
/* 578BC 80069C9C 21588300 */  addu       $t3, $a0, $v1
/* 578C0 80069CA0 31A7010C */  jal        DrawSky_Piece
/* 578C4 80069CA4 21688800 */   addu      $t5, $a0, $t0
.L80069CA8:
/* 578C8 80069CA8 00003F8C */  lw         $ra, (0x1F800000 & 0xFFFF)($at)
/* 578CC 80069CAC 0400308C */  lw         $s0, (0x1F800004 & 0xFFFF)($at)
/* 578D0 80069CB0 0800318C */  lw         $s1, (0x1F800008 & 0xFFFF)($at)
/* 578D4 80069CB4 0C00328C */  lw         $s2, (0x1F80000C & 0xFFFF)($at)
/* 578D8 80069CB8 0C00C2AC */  sw         $v0, 0xC($a2)
/* 578DC 80069CBC 0800E003 */  jr         $ra
/* 578E0 80069CC0 00000000 */   nop
.size DrawSky_Full, . - DrawSky_Full
