.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel VehPhysCrash_AI
/* 4ACF0 8005D0D0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4ACF4 8005D0D4 1400B1AF */  sw         $s1, 0x14($sp)
/* 4ACF8 8005D0D8 21888000 */  addu       $s1, $a0, $zero
/* 4ACFC 8005D0DC 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 4AD00 8005D0E0 1800B2AF */  sw         $s2, 0x18($sp)
/* 4AD04 8005D0E4 1000B0AF */  sw         $s0, 0x10($sp)
/* 4AD08 8005D0E8 A405228E */  lw         $v0, 0x5A4($s1)
/* 4AD0C 8005D0EC 00000000 */  nop
/* 4AD10 8005D0F0 06004290 */  lbu        $v0, 0x6($v0)
/* 4AD14 8005D0F4 2190A000 */  addu       $s2, $a1, $zero
/* 4AD18 8005D0F8 00110200 */  sll        $v0, $v0, 4
/* 4AD1C 8005D0FC 800A82A7 */  sh         $v0, 0xA80($gp) /* Failed to symbolize address 0x00000A80 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 4AD20 8005D100 A405228E */  lw         $v0, 0x5A4($s1)
/* 4AD24 8005D104 0A80103C */  lui        $s0, %hi(D_8009AE38)
/* 4AD28 8005D108 07004290 */  lbu        $v0, 0x7($v0)
/* 4AD2C 8005D10C 38AE1026 */  addiu      $s0, $s0, %lo(D_8009AE38)
/* 4AD30 8005D110 00110200 */  sll        $v0, $v0, 4
/* 4AD34 8005D114 820A82A7 */  sh         $v0, 0xA82($gp) /* Failed to symbolize address 0x00000A82 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 4AD38 8005D118 A405228E */  lw         $v0, 0x5A4($s1)
/* 4AD3C 8005D11C 00000000 */  nop
/* 4AD40 8005D120 08004290 */  lbu        $v0, 0x8($v0)
/* 4AD44 8005D124 0980053C */  lui        $a1, %hi(D_8008D9EC)
/* 4AD48 8005D128 ECD9A524 */  addiu      $a1, $a1, %lo(D_8008D9EC)
/* 4AD4C 8005D12C 00110200 */  sll        $v0, $v0, 4
/* 4AD50 8005D130 840A82A7 */  sh         $v0, 0xA84($gp) /* Failed to symbolize address 0x00000A84 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 4AD54 8005D134 A9B0010C */  jal        ConvertRotToMatrix
/* 4AD58 8005D138 21200002 */   addu      $a0, $s0, $zero
/* 4AD5C 8005D13C 0A80063C */  lui        $a2, %hi(D_8009AE28)
/* 4AD60 8005D140 04000596 */  lhu        $a1, 0x4($s0)
/* 4AD64 8005D144 28AEC724 */  addiu      $a3, $a2, %lo(D_8009AE28)
/* 4AD68 8005D148 002C0500 */  sll        $a1, $a1, 16
/* 4AD6C 8005D14C 032D0500 */  sra        $a1, $a1, 20
/* 4AD70 8005D150 28AEC5AC */  sw         $a1, %lo(D_8009AE28)($a2)
/* 4AD74 8005D154 0A000496 */  lhu        $a0, 0xA($s0)
/* 4AD78 8005D158 10000396 */  lhu        $v1, 0x10($s0)
/* 4AD7C 8005D15C 00240400 */  sll        $a0, $a0, 16
/* 4AD80 8005D160 03250400 */  sra        $a0, $a0, 20
/* 4AD84 8005D164 001C0300 */  sll        $v1, $v1, 16
/* 4AD88 8005D168 031D0300 */  sra        $v1, $v1, 20
/* 4AD8C 8005D16C 0400E4AC */  sw         $a0, 0x4($a3)
/* 4AD90 8005D170 0800E3AC */  sw         $v1, 0x8($a3)
/* 4AD94 8005D174 0000428E */  lw         $v0, 0x0($s2)
/* 4AD98 8005D178 00000000 */  nop
/* 4AD9C 8005D17C 1800A200 */  mult       $a1, $v0
/* 4ADA0 8005D180 12280000 */  mflo       $a1
/* 4ADA4 8005D184 0400428E */  lw         $v0, 0x4($s2)
/* 4ADA8 8005D188 00000000 */  nop
/* 4ADAC 8005D18C 18008200 */  mult       $a0, $v0
/* 4ADB0 8005D190 12200000 */  mflo       $a0
/* 4ADB4 8005D194 0800428E */  lw         $v0, 0x8($s2)
/* 4ADB8 8005D198 00000000 */  nop
/* 4ADBC 8005D19C 18006200 */  mult       $v1, $v0
/* 4ADC0 8005D1A0 2118A400 */  addu       $v1, $a1, $a0
/* 4ADC4 8005D1A4 12100000 */  mflo       $v0
/* 4ADC8 8005D1A8 21186200 */  addu       $v1, $v1, $v0
/* 4ADCC 8005D1AC 031A0300 */  sra        $v1, $v1, 8
/* 4ADD0 8005D1B0 D40523AE */  sw         $v1, 0x5D4($s1)
/* 4ADD4 8005D1B4 28AEC28C */  lw         $v0, %lo(D_8009AE28)($a2)
/* 4ADD8 8005D1B8 00000000 */  nop
/* 4ADDC 8005D1BC 18004300 */  mult       $v0, $v1
/* 4ADE0 8005D1C0 0000428E */  lw         $v0, 0x0($s2)
/* 4ADE4 8005D1C4 12300000 */  mflo       $a2
/* 4ADE8 8005D1C8 03220600 */  sra        $a0, $a2, 8
/* 4ADEC 8005D1CC 23104400 */  subu       $v0, $v0, $a0
/* 4ADF0 8005D1D0 D80522AE */  sw         $v0, 0x5D8($s1)
/* 4ADF4 8005D1D4 0800E28C */  lw         $v0, 0x8($a3)
/* 4ADF8 8005D1D8 00000000 */  nop
/* 4ADFC 8005D1DC 18004300 */  mult       $v0, $v1
/* 4AE00 8005D1E0 B005228E */  lw         $v0, 0x5B0($s1)
/* 4AE04 8005D1E4 0800438E */  lw         $v1, 0x8($s2)
/* 4AE08 8005D1E8 08004234 */  ori        $v0, $v0, 0x8
/* 4AE0C 8005D1EC B00522AE */  sw         $v0, 0x5B0($s1)
/* 4AE10 8005D1F0 12300000 */  mflo       $a2
/* 4AE14 8005D1F4 03120600 */  sra        $v0, $a2, 8
/* 4AE18 8005D1F8 23186200 */  subu       $v1, $v1, $v0
/* 4AE1C 8005D1FC E00523AE */  sw         $v1, 0x5E0($s1)
/* 4AE20 8005D200 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 4AE24 8005D204 1800B28F */  lw         $s2, 0x18($sp)
/* 4AE28 8005D208 1400B18F */  lw         $s1, 0x14($sp)
/* 4AE2C 8005D20C 1000B08F */  lw         $s0, 0x10($sp)
/* 4AE30 8005D210 0800E003 */  jr         $ra
/* 4AE34 8005D214 2000BD27 */   addiu     $sp, $sp, 0x20
.size VehPhysCrash_AI, . - VehPhysCrash_AI
