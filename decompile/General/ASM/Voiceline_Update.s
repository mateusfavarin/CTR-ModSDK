.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel Voiceline_Update
/* 1AD18 8002D0F8 80088293 */  lbu        $v0, 0x880($gp) /* Failed to symbolize address 0x00000880 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 1AD1C 8002D0FC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1AD20 8002D100 1400BFAF */  sw         $ra, 0x14($sp)
/* 1AD24 8002D104 64004010 */  beqz       $v0, .L8002D298
/* 1AD28 8002D108 1000B0AF */   sw        $s0, 0x10($sp)
/* 1AD2C 8002D10C 82088287 */  lh         $v0, 0x882($gp) /* Failed to symbolize address 0x00000882 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 1AD30 8002D110 82088397 */  lhu        $v1, 0x882($gp) /* Failed to symbolize address 0x00000882 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 1AD34 8002D114 05004010 */  beqz       $v0, .L8002D12C
/* 1AD38 8002D118 FFFF6224 */   addiu     $v0, $v1, -0x1
/* 1AD3C 8002D11C 820882A7 */  sh         $v0, 0x882($gp) /* Failed to symbolize address 0x00000882 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 1AD40 8002D120 00140200 */  sll        $v0, $v0, 16
/* 1AD44 8002D124 5C004014 */  bnez       $v0, .L8002D298
/* 1AD48 8002D128 00000000 */   nop
.L8002D12C:
/* 1AD4C 8002D12C 0980023C */  lui        $v0, %hi(D_8008D708)
/* 1AD50 8002D130 08D7428C */  lw         $v0, %lo(D_8008D708)($v0)
/* 1AD54 8002D134 00000000 */  nop
/* 1AD58 8002D138 57004014 */  bnez       $v0, .L8002D298
/* 1AD5C 8002D13C 00000000 */   nop
/* 1AD60 8002D140 81088293 */  lbu        $v0, 0x881($gp) /* Failed to symbolize address 0x00000881 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 1AD64 8002D144 00000000 */  nop
/* 1AD68 8002D148 39004010 */  beqz       $v0, .L8002D230
/* 1AD6C 8002D14C 00000000 */   nop
/* 1AD70 8002D150 0980023C */  lui        $v0, %hi(D_8008D9DC)
/* 1AD74 8002D154 DCD94290 */  lbu        $v0, %lo(D_8008D9DC)($v0)
/* 1AD78 8002D158 00000000 */  nop
/* 1AD7C 8002D15C 30004010 */  beqz       $v0, .L8002D220
/* 1AD80 8002D160 00000000 */   nop
/* 1AD84 8002D164 0980023C */  lui        $v0, %hi(D_8008D9E4)
/* 1AD88 8002D168 E4D9428C */  lw         $v0, %lo(D_8008D9E4)($v0)
/* 1AD8C 8002D16C 00000000 */  nop
/* 1AD90 8002D170 1F004228 */  slti       $v0, $v0, 0x1F
/* 1AD94 8002D174 2A004014 */  bnez       $v0, .L8002D220
/* 1AD98 8002D178 01000224 */   addiu     $v0, $zero, 0x1
/* 1AD9C 8002D17C 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 1ADA0 8002D180 ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 1ADA4 8002D184 810880A3 */  sb         $zero, 0x881($gp) /* Failed to symbolize address 0x00000881 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 1ADA8 8002D188 A81C8390 */  lbu        $v1, 0x1CA8($a0)
/* 1ADAC 8002D18C 00000000 */  nop
/* 1ADB0 8002D190 23006214 */  bne        $v1, $v0, .L8002D220
/* 1ADB4 8002D194 00000000 */   nop
/* 1ADB8 8002D198 EC24848C */  lw         $a0, 0x24EC($a0)
/* 1ADBC 8002D19C F992010C */  jal        DECOMP_VehPickupItem_MaskBoolGoodGuy
/* 1ADC0 8002D1A0 00000000 */   nop
/* 1ADC4 8002D1A4 00140200 */  sll        $v0, $v0, 16
/* 1ADC8 8002D1A8 07004010 */  beqz       $v0, .L8002D1C8
/* 1ADCC 8002D1AC 01000424 */   addiu     $a0, $zero, 0x1
/* 1ADD0 8002D1B0 6D73000C */  jal        DECOMP_CDSYS_XAPlay
/* 1ADD4 8002D1B4 1E000524 */   addiu     $a1, $zero, 0x1E
/* 1ADD8 8002D1B8 15004010 */  beqz       $v0, .L8002D210
/* 1ADDC 8002D1BC 01000424 */   addiu     $a0, $zero, 0x1
/* 1ADE0 8002D1C0 77B40008 */  j          .L8002D1DC
/* 1ADE4 8002D1C4 1E000524 */   addiu     $a1, $zero, 0x1E
.L8002D1C8:
/* 1ADE8 8002D1C8 6D73000C */  jal        DECOMP_CDSYS_XAPlay
/* 1ADEC 8002D1CC 3D000524 */   addiu     $a1, $zero, 0x3D
/* 1ADF0 8002D1D0 0F004010 */  beqz       $v0, .L8002D210
/* 1ADF4 8002D1D4 01000424 */   addiu     $a0, $zero, 0x1
/* 1ADF8 8002D1D8 3D000524 */  addiu      $a1, $zero, 0x3D
.L8002D1DC:
/* 1ADFC 8002D1DC 4873000C */  jal        DECOMP_CDSYS_XAGetTrackLength
/* 1AE00 8002D1E0 00000000 */   nop
/* 1AE04 8002D1E4 6666033C */  lui        $v1, (0x66666667 >> 16)
/* 1AE08 8002D1E8 67666334 */  ori        $v1, $v1, (0x66666667 & 0xFFFF)
/* 1AE0C 8002D1EC 18004300 */  mult       $v0, $v1
/* 1AE10 8002D1F0 C3170200 */  sra        $v0, $v0, 31
/* 1AE14 8002D1F4 10300000 */  mfhi       $a2
/* 1AE18 8002D1F8 43180600 */  sra        $v1, $a2, 1
/* 1AE1C 8002D1FC 23186200 */  subu       $v1, $v1, $v0
/* 1AE20 8002D200 1E006324 */  addiu      $v1, $v1, 0x1E
/* 1AE24 8002D204 820883A7 */  sh         $v1, 0x882($gp) /* Failed to symbolize address 0x00000882 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 1AE28 8002D208 A6B40008 */  j          .L8002D298
/* 1AE2C 8002D20C 00000000 */   nop
.L8002D210:
/* 1AE30 8002D210 1E000224 */  addiu      $v0, $zero, 0x1E
/* 1AE34 8002D214 820882A7 */  sh         $v0, 0x882($gp) /* Failed to symbolize address 0x00000882 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 1AE38 8002D218 A6B40008 */  j          .L8002D298
/* 1AE3C 8002D21C 00000000 */   nop
.L8002D220:
/* 1AE40 8002D220 81088293 */  lbu        $v0, 0x881($gp) /* Failed to symbolize address 0x00000881 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 1AE44 8002D224 00000000 */  nop
/* 1AE48 8002D228 0F004014 */  bnez       $v0, .L8002D268
/* 1AE4C 8002D22C 0980023C */   lui       $v0, %hi(D_800961B4)
.L8002D230:
/* 1AE50 8002D230 0980023C */  lui        $v0, %hi(D_8008D9DC)
/* 1AE54 8002D234 DCD94290 */  lbu        $v0, %lo(D_8008D9DC)($v0)
/* 1AE58 8002D238 00000000 */  nop
/* 1AE5C 8002D23C 0A004014 */  bnez       $v0, .L8002D268
/* 1AE60 8002D240 0980023C */   lui       $v0, %hi(D_800961B4)
/* 1AE64 8002D244 0980023C */  lui        $v0, %hi(D_8008D9E4)
/* 1AE68 8002D248 E4D9428C */  lw         $v0, %lo(D_8008D9E4)($v0)
/* 1AE6C 8002D24C 00000000 */  nop
/* 1AE70 8002D250 1F004228 */  slti       $v0, $v0, 0x1F
/* 1AE74 8002D254 04004014 */  bnez       $v0, .L8002D268
/* 1AE78 8002D258 0980023C */   lui       $v0, %hi(D_800961B4)
/* 1AE7C 8002D25C 01000224 */  addiu      $v0, $zero, 0x1
/* 1AE80 8002D260 810882A3 */  sb         $v0, 0x881($gp) /* Failed to symbolize address 0x00000881 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 1AE84 8002D264 0980023C */  lui        $v0, %hi(D_800961B4)
.L8002D268:
/* 1AE88 8002D268 B461508C */  lw         $s0, %lo(D_800961B4)($v0)
/* 1AE8C 8002D26C 00000000 */  nop
/* 1AE90 8002D270 09000012 */  beqz       $s0, .L8002D298
/* 1AE94 8002D274 B4614424 */   addiu     $a0, $v0, %lo(D_800961B4)
/* 1AE98 8002D278 F9C5000C */  jal        DECOMP_LIST_RemoveMember
/* 1AE9C 8002D27C 21280002 */   addu      $a1, $s0, $zero
/* 1AEA0 8002D280 0980043C */  lui        $a0, %hi(D_800961A4)
/* 1AEA4 8002D284 A4618424 */  addiu      $a0, $a0, %lo(D_800961A4)
/* 1AEA8 8002D288 E2C5000C */  jal        DECOMP_LIST_AddBack
/* 1AEAC 8002D28C 21280002 */   addu      $a1, $s0, $zero
/* 1AEB0 8002D290 CAB3000C */  jal        Voiceline_StartPlay
/* 1AEB4 8002D294 21200002 */   addu      $a0, $s0, $zero
.L8002D298:
/* 1AEB8 8002D298 1400BF8F */  lw         $ra, 0x14($sp)
/* 1AEBC 8002D29C 1000B08F */  lw         $s0, 0x10($sp)
/* 1AEC0 8002D2A0 0800E003 */  jr         $ra
/* 1AEC4 8002D2A4 1800BD27 */   addiu     $sp, $sp, 0x18
.size Voiceline_Update, . - Voiceline_Update
