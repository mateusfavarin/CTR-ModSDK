.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel Level_SoundLoopFade
/* 1C664 8002EA44 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1C668 8002EA48 21408000 */  addu       $t0, $a0, $zero
/* 1C66C 8002EA4C 1000BFAF */  sw         $ra, 0x10($sp)
/* 1C670 8002EA50 0800028D */  lw         $v0, 0x8($t0)
/* 1C674 8002EA54 00000000 */  nop
/* 1C678 8002EA58 13004610 */  beq        $v0, $a2, .L8002EAA8
/* 1C67C 8002EA5C 21184000 */   addu      $v1, $v0, $zero
/* 1C680 8002EA60 2A106600 */  slt        $v0, $v1, $a2
/* 1C684 8002EA64 05004010 */  beqz       $v0, .L8002EA7C
/* 1C688 8002EA68 040006AD */   sw        $a2, 0x4($t0)
/* 1C68C 8002EA6C 21106700 */  addu       $v0, $v1, $a3
/* 1C690 8002EA70 080002AD */  sw         $v0, 0x8($t0)
/* 1C694 8002EA74 A4BA0008 */  j          .L8002EA90
/* 1C698 8002EA78 2A10C200 */   slt       $v0, $a2, $v0
.L8002EA7C:
/* 1C69C 8002EA7C 2A10C300 */  slt        $v0, $a2, $v1
/* 1C6A0 8002EA80 06004010 */  beqz       $v0, .L8002EA9C
/* 1C6A4 8002EA84 23106700 */   subu      $v0, $v1, $a3
/* 1C6A8 8002EA88 080002AD */  sw         $v0, 0x8($t0)
/* 1C6AC 8002EA8C 2A104600 */  slt        $v0, $v0, $a2
.L8002EA90:
/* 1C6B0 8002EA90 02004010 */  beqz       $v0, .L8002EA9C
/* 1C6B4 8002EA94 00000000 */   nop
/* 1C6B8 8002EA98 080006AD */  sw         $a2, 0x8($t0)
.L8002EA9C:
/* 1C6BC 8002EA9C 0800068D */  lw         $a2, 0x8($t0)
/* 1C6C0 8002EAA0 70BA000C */  jal        Level_SoundLoopSet
/* 1C6C4 8002EAA4 0C000425 */   addiu     $a0, $t0, 0xC
.L8002EAA8:
/* 1C6C8 8002EAA8 1000BF8F */  lw         $ra, 0x10($sp)
/* 1C6CC 8002EAAC 00000000 */  nop
/* 1C6D0 8002EAB0 0800E003 */  jr         $ra
/* 1C6D4 8002EAB4 1800BD27 */   addiu     $sp, $sp, 0x18
.size Level_SoundLoopFade, . - Level_SoundLoopFade
