.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel BOTS_Killplane
/* 1690 80013A70 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1694 80013A74 1800B2AF */  sw         $s2, 0x18($sp)
/* 1698 80013A78 21908000 */  addu       $s2, $a0, $zero
/* 169C 80013A7C 1400B1AF */  sw         $s1, 0x14($sp)
/* 16A0 80013A80 21880000 */  addu       $s1, $zero, $zero
/* 16A4 80013A84 0180053C */  lui        $a1, %hi(D_80010000)
/* 16A8 80013A88 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 16AC 80013A8C ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 16B0 80013A90 0000A524 */  addiu      $a1, $a1, %lo(D_80010000)
/* 16B4 80013A94 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 16B8 80013A98 1000B0AF */  sw         $s0, 0x10($sp)
/* 16BC 80013A9C 3000508E */  lw         $s0, 0x30($s2)
/* 16C0 80013AA0 33C6010C */  jal        strcmp
/* 16C4 80013AA4 141A8424 */   addiu     $a0, $a0, 0x1A14
/* 16C8 80013AA8 31004014 */  bnez       $v0, .L80013B70
/* 16CC 80013AAC 21102002 */   addu      $v0, $s1, $zero
/* 16D0 80013AB0 95040392 */  lbu        $v1, 0x495($s0)
/* 16D4 80013AB4 94000224 */  addiu      $v0, $zero, 0x94
/* 16D8 80013AB8 03006214 */  bne        $v1, $v0, .L80013AC8
/* 16DC 80013ABC FF000624 */   addiu     $a2, $zero, 0xFF
/* 16E0 80013AC0 B64E0008 */  j          .L80013AD8
/* 16E4 80013AC4 84000624 */   addiu     $a2, $zero, 0x84
.L80013AC8:
/* 16E8 80013AC8 A0000224 */  addiu      $v0, $zero, 0xA0
/* 16EC 80013ACC 03006214 */  bne        $v1, $v0, .L80013ADC
/* 16F0 80013AD0 2118C000 */   addu      $v1, $a2, $zero
/* 16F4 80013AD4 80000624 */  addiu      $a2, $zero, 0x80
.L80013AD8:
/* 16F8 80013AD8 2118C000 */  addu       $v1, $a2, $zero
.L80013ADC:
/* 16FC 80013ADC FF000224 */  addiu      $v0, $zero, 0xFF
/* 1700 80013AE0 22006210 */  beq        $v1, $v0, .L80013B6C
/* 1704 80013AE4 FFFF6224 */   addiu     $v0, $v1, -0x1
/* 1708 80013AE8 A405058E */  lw         $a1, 0x5A4($s0)
/* 170C 80013AEC 00000000 */  nop
/* 1710 80013AF0 1200A490 */  lbu        $a0, 0x12($a1)
/* 1714 80013AF4 D34E0008 */  j          .L80013B4C
/* 1718 80013AF8 2A108200 */   slt       $v0, $a0, $v0
.L80013AFC:
/* 171C 80013AFC B8050386 */  lh         $v1, 0x5B8($s0)
/* 1720 80013B00 E0DA4224 */  addiu      $v0, $v0, %lo(D_8008DAE0)
/* 1724 80013B04 80180300 */  sll        $v1, $v1, 2
/* 1728 80013B08 21106200 */  addu       $v0, $v1, $v0
/* 172C 80013B0C 0000428C */  lw         $v0, 0x0($v0)
/* 1730 80013B10 ECFFA524 */  addiu      $a1, $a1, -0x14
/* 1734 80013B14 2B10A200 */  sltu       $v0, $a1, $v0
/* 1738 80013B18 08004010 */  beqz       $v0, .L80013B3C
/* 173C 80013B1C 0980023C */   lui       $v0, %hi(D_8008DAEC)
/* 1740 80013B20 ECDA4224 */  addiu      $v0, $v0, %lo(D_8008DAEC)
/* 1744 80013B24 21106200 */  addu       $v0, $v1, $v0
/* 1748 80013B28 0000428C */  lw         $v0, 0x0($v0)
/* 174C 80013B2C 00000000 */  nop
/* 1750 80013B30 0800428C */  lw         $v0, 0x8($v0)
/* 1754 80013B34 00000000 */  nop
/* 1758 80013B38 ECFF4524 */  addiu      $a1, $v0, -0x14
.L80013B3C:
/* 175C 80013B3C 1200A490 */  lbu        $a0, 0x12($a1)
/* 1760 80013B40 2118C000 */  addu       $v1, $a2, $zero
/* 1764 80013B44 FFFF6224 */  addiu      $v0, $v1, -0x1
/* 1768 80013B48 2A108200 */  slt        $v0, $a0, $v0
.L80013B4C:
/* 176C 80013B4C EBFF4014 */  bnez       $v0, .L80013AFC
/* 1770 80013B50 0980023C */   lui       $v0, %hi(D_8008DAE0)
/* 1774 80013B54 01006224 */  addiu      $v0, $v1, 0x1
/* 1778 80013B58 2A104400 */  slt        $v0, $v0, $a0
/* 177C 80013B5C E7FF4014 */  bnez       $v0, .L80013AFC
/* 1780 80013B60 0980023C */   lui       $v0, %hi(D_8008DAE0)
/* 1784 80013B64 A40505AE */  sw         $a1, 0x5A4($s0)
/* 1788 80013B68 01001124 */  addiu      $s1, $zero, 0x1
.L80013B6C:
/* 178C 80013B6C 21102002 */  addu       $v0, $s1, $zero
.L80013B70:
/* 1790 80013B70 21004014 */  bnez       $v0, .L80013BF8
/* 1794 80013B74 00000000 */   nop
/* 1798 80013B78 A405048E */  lw         $a0, 0x5A4($s0)
/* 179C 80013B7C 95040292 */  lbu        $v0, 0x495($s0)
/* 17A0 80013B80 12008390 */  lbu        $v1, 0x12($a0)
/* 17A4 80013B84 F54E0008 */  j          .L80013BD4
/* 17A8 80013B88 00000000 */   nop
.L80013B8C:
/* 17AC 80013B8C B8050386 */  lh         $v1, 0x5B8($s0)
/* 17B0 80013B90 E0DA4224 */  addiu      $v0, $v0, %lo(D_8008DAE0)
/* 17B4 80013B94 80180300 */  sll        $v1, $v1, 2
/* 17B8 80013B98 21106200 */  addu       $v0, $v1, $v0
/* 17BC 80013B9C 0000428C */  lw         $v0, 0x0($v0)
/* 17C0 80013BA0 ECFF8424 */  addiu      $a0, $a0, -0x14
/* 17C4 80013BA4 2B108200 */  sltu       $v0, $a0, $v0
/* 17C8 80013BA8 08004010 */  beqz       $v0, .L80013BCC
/* 17CC 80013BAC 0980023C */   lui       $v0, %hi(D_8008DAEC)
/* 17D0 80013BB0 ECDA4224 */  addiu      $v0, $v0, %lo(D_8008DAEC)
/* 17D4 80013BB4 21106200 */  addu       $v0, $v1, $v0
/* 17D8 80013BB8 0000428C */  lw         $v0, 0x0($v0)
/* 17DC 80013BBC 00000000 */  nop
/* 17E0 80013BC0 0800428C */  lw         $v0, 0x8($v0)
/* 17E4 80013BC4 00000000 */  nop
/* 17E8 80013BC8 ECFF4424 */  addiu      $a0, $v0, -0x14
.L80013BCC:
/* 17EC 80013BCC 12008390 */  lbu        $v1, 0x12($a0)
/* 17F0 80013BD0 95040292 */  lbu        $v0, 0x495($s0)
.L80013BD4:
/* 17F4 80013BD4 00000000 */  nop
/* 17F8 80013BD8 ECFF6210 */  beq        $v1, $v0, .L80013B8C
/* 17FC 80013BDC 0980023C */   lui       $v0, %hi(D_8008DAE0)
/* 1800 80013BE0 0E008294 */  lhu        $v0, 0xE($a0)
/* 1804 80013BE4 00000000 */  nop
/* 1808 80013BE8 00404230 */  andi       $v0, $v0, 0x4000
/* 180C 80013BEC E7FF4014 */  bnez       $v0, .L80013B8C
/* 1810 80013BF0 0980023C */   lui       $v0, %hi(D_8008DAE0)
/* 1814 80013BF4 A40504AE */  sw         $a0, 0x5A4($s0)
.L80013BF8:
/* 1818 80013BF8 0E4E000C */  jal        BOTS_MaskGrab
/* 181C 80013BFC 21204002 */   addu      $a0, $s2, $zero
/* 1820 80013C00 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 1824 80013C04 1800B28F */  lw         $s2, 0x18($sp)
/* 1828 80013C08 1400B18F */  lw         $s1, 0x14($sp)
/* 182C 80013C0C 1000B08F */  lw         $s0, 0x10($sp)
/* 1830 80013C10 0800E003 */  jr         $ra
/* 1834 80013C14 2000BD27 */   addiu     $sp, $sp, 0x20
.size BOTS_Killplane, . - BOTS_Killplane
