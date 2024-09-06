.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel RaceConfig_SaveGameOptions
/* 31944 80043D24 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 31948 80043D28 1400B1AF */  sw         $s1, 0x14($sp)
/* 3194C 80043D2C 21880000 */  addu       $s1, $zero, $zero
/* 31950 80043D30 0980023C */  lui        $v0, %hi(D_8008E6E8)
/* 31954 80043D34 1800B2AF */  sw         $s2, 0x18($sp)
/* 31958 80043D38 E8E65224 */  addiu      $s2, $v0, %lo(D_8008E6E8)
/* 3195C 80043D3C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 31960 80043D40 1000B0AF */  sw         $s0, 0x10($sp)
/* 31964 80043D44 00841100 */  sll        $s0, $s1, 16
.L80043D48:
/* 31968 80043D48 03841000 */  sra        $s0, $s0, 16
/* 3196C 80043D4C 38AC000C */  jal        DECOMP_howl_VolumeGet
/* 31970 80043D50 21200002 */   addu      $a0, $s0, $zero
/* 31974 80043D54 40801000 */  sll        $s0, $s0, 1
/* 31978 80043D58 21801202 */  addu       $s0, $s0, $s2
/* 3197C 80043D5C FF004230 */  andi       $v0, $v0, 0xFF
/* 31980 80043D60 941402A6 */  sh         $v0, 0x1494($s0)
/* 31984 80043D64 01002226 */  addiu      $v0, $s1, 0x1
/* 31988 80043D68 21884000 */  addu       $s1, $v0, $zero
/* 3198C 80043D6C 00140200 */  sll        $v0, $v0, 16
/* 31990 80043D70 03140200 */  sra        $v0, $v0, 16
/* 31994 80043D74 03004228 */  slti       $v0, $v0, 0x3
/* 31998 80043D78 F3FF4014 */  bnez       $v0, .L80043D48
/* 3199C 80043D7C 00841100 */   sll       $s0, $s1, 16
/* 319A0 80043D80 0980103C */  lui        $s0, %hi(D_8008FB82)
/* 319A4 80043D84 0880023C */  lui        $v0, %hi(D_800841FC)
/* 319A8 80043D88 FC414724 */  addiu      $a3, $v0, %lo(D_800841FC)
/* 319AC 80043D8C 82FB0626 */  addiu      $a2, $s0, %lo(D_8008FB82)
/* 319B0 80043D90 0300E388 */  lwl        $v1, 0x3($a3)
/* 319B4 80043D94 0000E398 */  lwr        $v1, 0x0($a3)
/* 319B8 80043D98 0700E588 */  lwl        $a1, 0x7($a3)
/* 319BC 80043D9C 0400E598 */  lwr        $a1, 0x4($a3)
/* 319C0 80043DA0 0300C3A8 */  swl        $v1, 0x3($a2)
/* 319C4 80043DA4 0000C3B8 */  swr        $v1, 0x0($a2)
/* 319C8 80043DA8 0700C5A8 */  swl        $a1, 0x7($a2)
/* 319CC 80043DAC 0400C5B8 */  swr        $a1, 0x4($a2)
/* 319D0 80043DB0 0B00E388 */  lwl        $v1, 0xB($a3)
/* 319D4 80043DB4 0800E398 */  lwr        $v1, 0x8($a3)
/* 319D8 80043DB8 0F00E588 */  lwl        $a1, 0xF($a3)
/* 319DC 80043DBC 0C00E598 */  lwr        $a1, 0xC($a3)
/* 319E0 80043DC0 0B00C3A8 */  swl        $v1, 0xB($a2)
/* 319E4 80043DC4 0800C3B8 */  swr        $v1, 0x8($a2)
/* 319E8 80043DC8 0F00C5A8 */  swl        $a1, 0xF($a2)
/* 319EC 80043DCC 0C00C5B8 */  swr        $a1, 0xC($a2)
/* 319F0 80043DD0 1300E388 */  lwl        $v1, 0x13($a3)
/* 319F4 80043DD4 1000E398 */  lwr        $v1, 0x10($a3)
/* 319F8 80043DD8 1700E588 */  lwl        $a1, 0x17($a3)
/* 319FC 80043DDC 1400E598 */  lwr        $a1, 0x14($a3)
/* 31A00 80043DE0 1300C3A8 */  swl        $v1, 0x13($a2)
/* 31A04 80043DE4 1000C3B8 */  swr        $v1, 0x10($a2)
/* 31A08 80043DE8 1700C5A8 */  swl        $a1, 0x17($a2)
/* 31A0C 80043DEC 1400C5B8 */  swr        $a1, 0x14($a2)
/* 31A10 80043DF0 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 31A14 80043DF4 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 31A18 80043DF8 82FB1026 */  addiu      $s0, $s0, %lo(D_8008FB82)
/* 31A1C 80043DFC 0000428C */  lw         $v0, 0x0($v0)
/* 31A20 80043E00 66EB1026 */  addiu      $s0, $s0, -0x149A
/* 31A24 80043E04 000F4230 */  andi       $v0, $v0, 0xF00
/* 31A28 80043E08 7CAC000C */  jal        DECOMP_howl_ModeGet
/* 31A2C 80043E0C B41402AE */   sw        $v0, 0x14B4($s0)
/* 31A30 80043E10 FF004230 */  andi       $v0, $v0, 0xFF
/* 31A34 80043E14 2B100200 */  sltu       $v0, $zero, $v0
/* 31A38 80043E18 B81402A6 */  sh         $v0, 0x14B8($s0)
/* 31A3C 80043E1C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 31A40 80043E20 1800B28F */  lw         $s2, 0x18($sp)
/* 31A44 80043E24 1400B18F */  lw         $s1, 0x14($sp)
/* 31A48 80043E28 1000B08F */  lw         $s0, 0x10($sp)
/* 31A4C 80043E2C 0800E003 */  jr         $ra
/* 31A50 80043E30 2000BD27 */   addiu     $sp, $sp, 0x20
.size RaceConfig_SaveGameOptions, . - RaceConfig_SaveGameOptions
