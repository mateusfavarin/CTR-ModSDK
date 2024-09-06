.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel MATH_VectorNormalize
/* 2AF98 8003D378 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2AF9C 8003D37C 1000B0AF */  sw         $s0, 0x10($sp)
/* 2AFA0 8003D380 1400BFAF */  sw         $ra, 0x14($sp)
/* 2AFA4 8003D384 CAF4000C */  jal        MATH_VectorLength
/* 2AFA8 8003D388 21808000 */   addu      $s0, $a0, $zero
/* 2AFAC 8003D38C 21304000 */  addu       $a2, $v0, $zero
/* 2AFB0 8003D390 2E00C010 */  beqz       $a2, .L8003D44C
/* 2AFB4 8003D394 00000000 */   nop
/* 2AFB8 8003D398 00000486 */  lh         $a0, 0x0($s0)
/* 2AFBC 8003D39C 00000000 */  nop
/* 2AFC0 8003D3A0 00230400 */  sll        $a0, $a0, 12
/* 2AFC4 8003D3A4 1A008600 */  div        $zero, $a0, $a2
/* 2AFC8 8003D3A8 0200C014 */  bnez       $a2, .L8003D3B4
/* 2AFCC 8003D3AC 00000000 */   nop
/* 2AFD0 8003D3B0 0D000700 */  break      7
.L8003D3B4:
/* 2AFD4 8003D3B4 FFFF0124 */  addiu      $at, $zero, -0x1
/* 2AFD8 8003D3B8 0400C114 */  bne        $a2, $at, .L8003D3CC
/* 2AFDC 8003D3BC 0080013C */   lui       $at, (0x80000000 >> 16)
/* 2AFE0 8003D3C0 02008114 */  bne        $a0, $at, .L8003D3CC
/* 2AFE4 8003D3C4 00000000 */   nop
/* 2AFE8 8003D3C8 0D000600 */  break      6
.L8003D3CC:
/* 2AFEC 8003D3CC 12200000 */  mflo       $a0
/* 2AFF0 8003D3D0 02000386 */  lh         $v1, 0x2($s0)
/* 2AFF4 8003D3D4 00000000 */  nop
/* 2AFF8 8003D3D8 001B0300 */  sll        $v1, $v1, 12
/* 2AFFC 8003D3DC 1A006600 */  div        $zero, $v1, $a2
/* 2B000 8003D3E0 0200C014 */  bnez       $a2, .L8003D3EC
/* 2B004 8003D3E4 00000000 */   nop
/* 2B008 8003D3E8 0D000700 */  break      7
.L8003D3EC:
/* 2B00C 8003D3EC FFFF0124 */  addiu      $at, $zero, -0x1
/* 2B010 8003D3F0 0400C114 */  bne        $a2, $at, .L8003D404
/* 2B014 8003D3F4 0080013C */   lui       $at, (0x80000000 >> 16)
/* 2B018 8003D3F8 02006114 */  bne        $v1, $at, .L8003D404
/* 2B01C 8003D3FC 00000000 */   nop
/* 2B020 8003D400 0D000600 */  break      6
.L8003D404:
/* 2B024 8003D404 12180000 */  mflo       $v1
/* 2B028 8003D408 04000286 */  lh         $v0, 0x4($s0)
/* 2B02C 8003D40C 00000000 */  nop
/* 2B030 8003D410 00130200 */  sll        $v0, $v0, 12
/* 2B034 8003D414 1A004600 */  div        $zero, $v0, $a2
/* 2B038 8003D418 0200C014 */  bnez       $a2, .L8003D424
/* 2B03C 8003D41C 00000000 */   nop
/* 2B040 8003D420 0D000700 */  break      7
.L8003D424:
/* 2B044 8003D424 FFFF0124 */  addiu      $at, $zero, -0x1
/* 2B048 8003D428 0400C114 */  bne        $a2, $at, .L8003D43C
/* 2B04C 8003D42C 0080013C */   lui       $at, (0x80000000 >> 16)
/* 2B050 8003D430 02004114 */  bne        $v0, $at, .L8003D43C
/* 2B054 8003D434 00000000 */   nop
/* 2B058 8003D438 0D000600 */  break      6
.L8003D43C:
/* 2B05C 8003D43C 12100000 */  mflo       $v0
/* 2B060 8003D440 000004A6 */  sh         $a0, 0x0($s0)
/* 2B064 8003D444 020003A6 */  sh         $v1, 0x2($s0)
/* 2B068 8003D448 040002A6 */  sh         $v0, 0x4($s0)
.L8003D44C:
/* 2B06C 8003D44C 1400BF8F */  lw         $ra, 0x14($sp)
/* 2B070 8003D450 1000B08F */  lw         $s0, 0x10($sp)
/* 2B074 8003D454 2110C000 */  addu       $v0, $a2, $zero
/* 2B078 8003D458 0800E003 */  jr         $ra
/* 2B07C 8003D45C 1800BD27 */   addiu     $sp, $sp, 0x18
.size MATH_VectorNormalize, . - MATH_VectorNormalize
