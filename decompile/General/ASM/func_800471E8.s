.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_800471E8
/* 34E08 800471E8 FC098287 */  lh         $v0, 0x9FC($gp) /* Failed to symbolize address 0x000009FC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34E0C 800471EC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 34E10 800471F0 06004014 */  bnez       $v0, .L8004720C
/* 34E14 800471F4 1000BFAF */   sw        $ra, 0x10($sp)
/* 34E18 800471F8 0805848F */  lw         $a0, 0x508($gp) /* Failed to symbolize address 0x00000508 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34E1C 800471FC 099B000C */  jal        DECOMP_GAMEPROG_InitFullMemcard
/* 34E20 80047200 00000000 */   nop
/* 34E24 80047204 01000224 */  addiu      $v0, $zero, 0x1
/* 34E28 80047208 FC0982A7 */  sh         $v0, 0x9FC($gp) /* Failed to symbolize address 0x000009FC for %gp_rel. Make sure this address is within the recognized valid address space */
.L8004720C:
/* 34E2C 8004720C 1000BF8F */  lw         $ra, 0x10($sp)
/* 34E30 80047210 01000224 */  addiu      $v0, $zero, 0x1
/* 34E34 80047214 F00982A7 */  sh         $v0, 0x9F0($gp) /* Failed to symbolize address 0x000009F0 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34E38 80047218 BC0980A7 */  sh         $zero, 0x9BC($gp) /* Failed to symbolize address 0x000009BC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34E3C 8004721C 0800E003 */  jr         $ra
/* 34E40 80047220 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800471E8, . - func_800471E8
