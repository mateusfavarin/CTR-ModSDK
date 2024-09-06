.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel SelectProfile_PrintInteger
/* 35B40 80047F20 98FFBD27 */  addiu      $sp, $sp, -0x68
/* 35B44 80047F24 21188000 */  addu       $v1, $a0, $zero
/* 35B48 80047F28 5C00B1AF */  sw         $s1, 0x5C($sp)
/* 35B4C 80047F2C 2188A000 */  addu       $s1, $a1, $zero
/* 35B50 80047F30 6000B2AF */  sw         $s2, 0x60($sp)
/* 35B54 80047F34 2190C000 */  addu       $s2, $a2, $zero
/* 35B58 80047F38 003C0700 */  sll        $a3, $a3, 16
/* 35B5C 80047F3C 033C0700 */  sra        $a3, $a3, 16
/* 35B60 80047F40 5800B0AF */  sw         $s0, 0x58($sp)
/* 35B64 80047F44 7800B097 */  lhu        $s0, 0x78($sp)
/* 35B68 80047F48 01000224 */  addiu      $v0, $zero, 0x1
/* 35B6C 80047F4C 0500E214 */  bne        $a3, $v0, .L80047F64
/* 35B70 80047F50 6400BFAF */   sw        $ra, 0x64($sp)
/* 35B74 80047F54 1800A427 */  addiu      $a0, $sp, 0x18
/* 35B78 80047F58 0980053C */  lui        $a1, %hi(D_8008D484)
/* 35B7C 80047F5C DC1F0108 */  j          .L80047F70
/* 35B80 80047F60 84D4A524 */   addiu     $a1, $a1, %lo(D_8008D484)
.L80047F64:
/* 35B84 80047F64 1800A427 */  addiu      $a0, $sp, 0x18
/* 35B88 80047F68 0980053C */  lui        $a1, %hi(D_8008D48C)
/* 35B8C 80047F6C 8CD4A524 */  addiu      $a1, $a1, %lo(D_8008D48C)
.L80047F70:
/* 35B90 80047F70 D2E0010C */  jal        sprintf
/* 35B94 80047F74 21306000 */   addu      $a2, $v1, $zero
/* 35B98 80047F78 00141000 */  sll        $v0, $s0, 16
/* 35B9C 80047F7C 03140200 */  sra        $v0, $v0, 16
/* 35BA0 80047F80 1800A427 */  addiu      $a0, $sp, 0x18
/* 35BA4 80047F84 002C1100 */  sll        $a1, $s1, 16
/* 35BA8 80047F88 032C0500 */  sra        $a1, $a1, 16
/* 35BAC 80047F8C 00341200 */  sll        $a2, $s2, 16
/* 35BB0 80047F90 03340600 */  sra        $a2, $a2, 16
/* 35BB4 80047F94 01000724 */  addiu      $a3, $zero, 0x1
/* 35BB8 80047F98 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 35BBC 80047F9C 1000A2AF */   sw        $v0, 0x10($sp)
/* 35BC0 80047FA0 6400BF8F */  lw         $ra, 0x64($sp)
/* 35BC4 80047FA4 6000B28F */  lw         $s2, 0x60($sp)
/* 35BC8 80047FA8 5C00B18F */  lw         $s1, 0x5C($sp)
/* 35BCC 80047FAC 5800B08F */  lw         $s0, 0x58($sp)
/* 35BD0 80047FB0 0800E003 */  jr         $ra
/* 35BD4 80047FB4 6800BD27 */   addiu     $sp, $sp, 0x68
.size SelectProfile_PrintInteger, . - SelectProfile_PrintInteger
