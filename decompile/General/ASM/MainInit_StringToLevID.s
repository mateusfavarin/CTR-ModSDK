.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel MainInit_StringToLevID
/* 29DF4 8003C1D4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 29DF8 8003C1D8 1800B2AF */  sw         $s2, 0x18($sp)
/* 29DFC 8003C1DC 21908000 */  addu       $s2, $a0, $zero
/* 29E00 8003C1E0 1400B1AF */  sw         $s1, 0x14($sp)
/* 29E04 8003C1E4 21880000 */  addu       $s1, $zero, $zero
/* 29E08 8003C1E8 0880023C */  lui        $v0, %hi(D_80083A80)
/* 29E0C 8003C1EC 1000B0AF */  sw         $s0, 0x10($sp)
/* 29E10 8003C1F0 803A5024 */  addiu      $s0, $v0, %lo(D_80083A80)
/* 29E14 8003C1F4 1C00BFAF */  sw         $ra, 0x1C($sp)
.L8003C1F8:
/* 29E18 8003C1F8 0400048E */  lw         $a0, 0x4($s0)
/* 29E1C 8003C1FC 32DF010C */  jal        strlen
/* 29E20 8003C200 00000000 */   nop
/* 29E24 8003C204 21284002 */  addu       $a1, $s2, $zero
/* 29E28 8003C208 0400048E */  lw         $a0, 0x4($s0)
/* 29E2C 8003C20C 68DA010C */  jal        strncmp
/* 29E30 8003C210 21304000 */   addu      $a2, $v0, $zero
/* 29E34 8003C214 06004010 */  beqz       $v0, .L8003C230
/* 29E38 8003C218 21102002 */   addu      $v0, $s1, $zero
/* 29E3C 8003C21C 01003126 */  addiu      $s1, $s1, 0x1
/* 29E40 8003C220 4100222A */  slti       $v0, $s1, 0x41
/* 29E44 8003C224 F4FF4014 */  bnez       $v0, .L8003C1F8
/* 29E48 8003C228 18001026 */   addiu     $s0, $s0, 0x18
/* 29E4C 8003C22C 21100000 */  addu       $v0, $zero, $zero
.L8003C230:
/* 29E50 8003C230 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 29E54 8003C234 1800B28F */  lw         $s2, 0x18($sp)
/* 29E58 8003C238 1400B18F */  lw         $s1, 0x14($sp)
/* 29E5C 8003C23C 1000B08F */  lw         $s0, 0x10($sp)
/* 29E60 8003C240 0800E003 */  jr         $ra
/* 29E64 8003C244 2000BD27 */   addiu     $sp, $sp, 0x20
.size MainInit_StringToLevID, . - MainInit_StringToLevID
