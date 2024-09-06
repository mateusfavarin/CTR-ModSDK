.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel FLARE_Init
/* 12D58 80025138 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 12D5C 8002513C 1000B0AF */  sw         $s0, 0x10($sp)
/* 12D60 80025140 21808000 */  addu       $s0, $a0, $zero
/* 12D64 80025144 0C00043C */  lui        $a0, (0xC030D >> 16)
/* 12D68 80025148 0D038434 */  ori        $a0, $a0, (0xC030D & 0xFFFF)
/* 12D6C 8002514C 0280053C */  lui        $a1, %hi(FLARE_ThTick)
/* 12D70 80025150 0180063C */  lui        $a2, %hi(D_80011074)
/* 12D74 80025154 4C4CA524 */  addiu      $a1, $a1, %lo(FLARE_ThTick)
/* 12D78 80025158 7410C624 */  addiu      $a2, $a2, %lo(D_80011074)
/* 12D7C 8002515C 1400BFAF */  sw         $ra, 0x14($sp)
/* 12D80 80025160 1708010C */  jal        DECOMP_PROC_BirthWithObject
/* 12D84 80025164 21380000 */   addu      $a3, $zero, $zero
/* 12D88 80025168 0C004010 */  beqz       $v0, .L8002519C
/* 12D8C 8002516C 00000000 */   nop
/* 12D90 80025170 3000428C */  lw         $v0, 0x30($v0)
/* 12D94 80025174 00000000 */  nop
/* 12D98 80025178 000040AC */  sw         $zero, 0x0($v0)
/* 12D9C 8002517C 0300038A */  lwl        $v1, 0x3($s0)
/* 12DA0 80025180 0000039A */  lwr        $v1, 0x0($s0)
/* 12DA4 80025184 0700088A */  lwl        $t0, 0x7($s0)
/* 12DA8 80025188 0400089A */  lwr        $t0, 0x4($s0)
/* 12DAC 8002518C 070043A8 */  swl        $v1, 0x7($v0)
/* 12DB0 80025190 040043B8 */  swr        $v1, 0x4($v0)
/* 12DB4 80025194 0B0048A8 */  swl        $t0, 0xB($v0)
/* 12DB8 80025198 080048B8 */  swr        $t0, 0x8($v0)
.L8002519C:
/* 12DBC 8002519C 1400BF8F */  lw         $ra, 0x14($sp)
/* 12DC0 800251A0 1000B08F */  lw         $s0, 0x10($sp)
/* 12DC4 800251A4 0800E003 */  jr         $ra
/* 12DC8 800251A8 1800BD27 */   addiu     $sp, $sp, 0x18
.size FLARE_Init, . - FLARE_Init
