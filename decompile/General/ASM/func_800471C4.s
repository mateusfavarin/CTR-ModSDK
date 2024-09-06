.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_800471C4
/* 34DE4 800471C4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 34DE8 800471C8 1000BFAF */  sw         $ra, 0x10($sp)
/* 34DEC 800471CC 0E0584A7 */  sh         $a0, 0x50E($gp) /* Failed to symbolize address 0x0000050E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34DF0 800471D0 9D1A010C */  jal        func_80046A74
/* 34DF4 800471D4 00000000 */   nop
/* 34DF8 800471D8 1000BF8F */  lw         $ra, 0x10($sp)
/* 34DFC 800471DC 00000000 */  nop
/* 34E00 800471E0 0800E003 */  jr         $ra
/* 34E04 800471E4 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800471C4, . - func_800471C4
