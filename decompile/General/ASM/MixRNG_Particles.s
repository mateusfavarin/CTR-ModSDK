.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel MixRNG_Particles
/* 2C68C 8003EA6C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2C690 8003EA70 1000B0AF */  sw         $s0, 0x10($sp)
/* 2C694 8003EA74 21808000 */  addu       $s0, $a0, $zero
/* 2C698 8003EA78 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 2C69C 8003EA7C ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 2C6A0 8003EA80 1400BFAF */  sw         $ra, 0x14($sp)
/* 2C6A4 8003EA84 A1B1010C */  jal        RngDeadCoed
/* 2C6A8 8003EA88 2C258424 */   addiu     $a0, $a0, 0x252C
/* 2C6AC 8003EA8C FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 2C6B0 8003EA90 18005000 */  mult       $v0, $s0
/* 2C6B4 8003EA94 1400BF8F */  lw         $ra, 0x14($sp)
/* 2C6B8 8003EA98 1000B08F */  lw         $s0, 0x10($sp)
/* 2C6BC 8003EA9C 12180000 */  mflo       $v1
/* 2C6C0 8003EAA0 03140300 */  sra        $v0, $v1, 16
/* 2C6C4 8003EAA4 0800E003 */  jr         $ra
/* 2C6C8 8003EAA8 1800BD27 */   addiu     $sp, $sp, 0x18
.size MixRNG_Particles, . - MixRNG_Particles
