.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel MainInit_RainBuffer
/* 28C28 8003B008 A81C8290 */  lbu        $v0, 0x1CA8($a0)
/* 28C2C 8003B00C 00000000 */  nop
/* 28C30 8003B010 35004010 */  beqz       $v0, .L8003B0E8
/* 28C34 8003B014 21380000 */   addu      $a3, $zero, $zero
/* 28C38 8003B018 21308000 */  addu       $a2, $a0, $zero
.L8003B01C:
/* 28C3C 8003B01C 6001828C */  lw         $v0, 0x160($a0)
/* 28C40 8003B020 401AC524 */  addiu      $a1, $a2, 0x1A40
/* 28C44 8003B024 04014324 */  addiu      $v1, $v0, 0x104
/* 28C48 8003B028 34014224 */  addiu      $v0, $v0, 0x134
.L8003B02C:
/* 28C4C 8003B02C 0000688C */  lw         $t0, 0x0($v1)
/* 28C50 8003B030 0400698C */  lw         $t1, 0x4($v1)
/* 28C54 8003B034 08006A8C */  lw         $t2, 0x8($v1)
/* 28C58 8003B038 0C006B8C */  lw         $t3, 0xC($v1)
/* 28C5C 8003B03C 0000A8AC */  sw         $t0, 0x0($a1)
/* 28C60 8003B040 0400A9AC */  sw         $t1, 0x4($a1)
/* 28C64 8003B044 0800AAAC */  sw         $t2, 0x8($a1)
/* 28C68 8003B048 0C00ABAC */  sw         $t3, 0xC($a1)
/* 28C6C 8003B04C 10006324 */  addiu      $v1, $v1, 0x10
/* 28C70 8003B050 F6FF6214 */  bne        $v1, $v0, .L8003B02C
/* 28C74 8003B054 1000A524 */   addiu     $a1, $a1, 0x10
/* 28C78 8003B058 A81C8390 */  lbu        $v1, 0x1CA8($a0)
/* 28C7C 8003B05C 401AC28C */  lw         $v0, 0x1A40($a2)
/* 28C80 8003B060 00000000 */  nop
/* 28C84 8003B064 1A004300 */  div        $zero, $v0, $v1
/* 28C88 8003B068 02006014 */  bnez       $v1, .L8003B074
/* 28C8C 8003B06C 00000000 */   nop
/* 28C90 8003B070 0D000700 */  break      7
.L8003B074:
/* 28C94 8003B074 FFFF0124 */  addiu      $at, $zero, -0x1
/* 28C98 8003B078 04006114 */  bne        $v1, $at, .L8003B08C
/* 28C9C 8003B07C 0080013C */   lui       $at, (0x80000000 >> 16)
/* 28CA0 8003B080 02004114 */  bne        $v0, $at, .L8003B08C
/* 28CA4 8003B084 00000000 */   nop
/* 28CA8 8003B088 0D000600 */  break      6
.L8003B08C:
/* 28CAC 8003B08C 12100000 */  mflo       $v0
/* 28CB0 8003B090 441AC394 */  lhu        $v1, 0x1A44($a2)
/* 28CB4 8003B094 401AC2AC */  sw         $v0, 0x1A40($a2)
/* 28CB8 8003B098 A81C8290 */  lbu        $v0, 0x1CA8($a0)
/* 28CBC 8003B09C 00000000 */  nop
/* 28CC0 8003B0A0 1A006200 */  div        $zero, $v1, $v0
/* 28CC4 8003B0A4 02004014 */  bnez       $v0, .L8003B0B0
/* 28CC8 8003B0A8 00000000 */   nop
/* 28CCC 8003B0AC 0D000700 */  break      7
.L8003B0B0:
/* 28CD0 8003B0B0 FFFF0124 */  addiu      $at, $zero, -0x1
/* 28CD4 8003B0B4 04004114 */  bne        $v0, $at, .L8003B0C8
/* 28CD8 8003B0B8 0080013C */   lui       $at, (0x80000000 >> 16)
/* 28CDC 8003B0BC 02006114 */  bne        $v1, $at, .L8003B0C8
/* 28CE0 8003B0C0 00000000 */   nop
/* 28CE4 8003B0C4 0D000600 */  break      6
.L8003B0C8:
/* 28CE8 8003B0C8 12180000 */  mflo       $v1
/* 28CEC 8003B0CC 0100E724 */  addiu      $a3, $a3, 0x1
/* 28CF0 8003B0D0 441AC3A4 */  sh         $v1, 0x1A44($a2)
/* 28CF4 8003B0D4 A81C8290 */  lbu        $v0, 0x1CA8($a0)
/* 28CF8 8003B0D8 00000000 */  nop
/* 28CFC 8003B0DC 2A10E200 */  slt        $v0, $a3, $v0
/* 28D00 8003B0E0 CEFF4014 */  bnez       $v0, .L8003B01C
/* 28D04 8003B0E4 3000C624 */   addiu     $a2, $a2, 0x30
.L8003B0E8:
/* 28D08 8003B0E8 0800E003 */  jr         $ra
/* 28D0C 8003B0EC 00000000 */   nop
.size MainInit_RainBuffer, . - MainInit_RainBuffer
