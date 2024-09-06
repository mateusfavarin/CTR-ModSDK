.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel VehCalc_FastSqrt
/* 46C90 80059070 21400000 */  addu       $t0, $zero, $zero
/* 46C94 80059074 01000224 */  addiu      $v0, $zero, 0x1
/* 46C98 80059078 0430A200 */  sllv       $a2, $v0, $a1
/* 46C9C 8005907C 21384000 */  addu       $a3, $v0, $zero
/* 46CA0 80059080 2B10C400 */  sltu       $v0, $a2, $a0
/* 46CA4 80059084 08004010 */  beqz       $v0, .L800590A8
/* 46CA8 80059088 21480001 */   addu      $t1, $t0, $zero
.L8005908C:
/* 46CAC 8005908C 80100600 */  sll        $v0, $a2, 2
/* 46CB0 80059090 05004010 */  beqz       $v0, .L800590A8
/* 46CB4 80059094 00000000 */   nop
/* 46CB8 80059098 21304000 */  addu       $a2, $v0, $zero
/* 46CBC 8005909C 2B10C400 */  sltu       $v0, $a2, $a0
/* 46CC0 800590A0 FAFF4014 */  bnez       $v0, .L8005908C
/* 46CC4 800590A4 0100E724 */   addiu     $a3, $a3, 0x1
.L800590A8:
/* 46CC8 800590A8 FFFFA224 */  addiu      $v0, $a1, -0x1
/* 46CCC 800590AC 2110E200 */  addu       $v0, $a3, $v0
/* 46CD0 800590B0 01000324 */  addiu      $v1, $zero, 0x1
/* 46CD4 800590B4 1000C010 */  beqz       $a2, .L800590F8
/* 46CD8 800590B8 04184300 */   sllv      $v1, $v1, $v0
.L800590BC:
/* 46CDC 800590BC 0300E104 */  bgez       $a3, .L800590CC
/* 46CE0 800590C0 0428E800 */   sllv      $a1, $t0, $a3
/* 46CE4 800590C4 23100700 */  negu       $v0, $a3
/* 46CE8 800590C8 06284800 */  srlv       $a1, $t0, $v0
.L800590CC:
/* 46CEC 800590CC 21102601 */  addu       $v0, $t1, $a2
/* 46CF0 800590D0 2128A200 */  addu       $a1, $a1, $v0
/* 46CF4 800590D4 2B108500 */  sltu       $v0, $a0, $a1
/* 46CF8 800590D8 03004014 */  bnez       $v0, .L800590E8
/* 46CFC 800590DC 00000000 */   nop
/* 46D00 800590E0 2148A000 */  addu       $t1, $a1, $zero
/* 46D04 800590E4 21400301 */  addu       $t0, $t0, $v1
.L800590E8:
/* 46D08 800590E8 42180300 */  srl        $v1, $v1, 1
/* 46D0C 800590EC 82300600 */  srl        $a2, $a2, 2
/* 46D10 800590F0 F2FFC014 */  bnez       $a2, .L800590BC
/* 46D14 800590F4 FFFFE724 */   addiu     $a3, $a3, -0x1
.L800590F8:
/* 46D18 800590F8 0800E003 */  jr         $ra
/* 46D1C 800590FC 21100001 */   addu      $v0, $t0, $zero
.size VehCalc_FastSqrt, . - VehCalc_FastSqrt
