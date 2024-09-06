.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel MEMCARD_GetInfo
/* 2BE58 8003E238 9804828F */  lw         $v0, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BE5C 8003E23C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2BE60 8003E240 1000B0AF */  sw         $s0, 0x10($sp)
/* 2BE64 8003E244 21808000 */  addu       $s0, $a0, $zero
/* 2BE68 8003E248 1800BFAF */  sw         $ra, 0x18($sp)
/* 2BE6C 8003E24C 03004010 */  beqz       $v0, .L8003E25C
/* 2BE70 8003E250 1400B1AF */   sw        $s1, 0x14($sp)
/* 2BE74 8003E254 A2F80008 */  j          .L8003E288
/* 2BE78 8003E258 01000224 */   addiu     $v0, $zero, 0x1
.L8003E25C:
/* 2BE7C 8003E25C D5F6000C */  jal        DECOMP_MEMCARD_SkipEvents
/* 2BE80 8003E260 01001124 */   addiu     $s1, $zero, 0x1
/* 2BE84 8003E264 21102002 */  addu       $v0, $s1, $zero
/* 2BE88 8003E268 4C0990AF */  sw         $s0, 0x94C($gp) /* Failed to symbolize address 0x0000094C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BE8C 8003E26C 980482AF */  sw         $v0, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
.L8003E270:
/* 2BE90 8003E270 AADF010C */  jal        _card_info
/* 2BE94 8003E274 21200002 */   addu      $a0, $s0, $zero
/* 2BE98 8003E278 FDFF5114 */  bne        $v0, $s1, .L8003E270
/* 2BE9C 8003E27C 08000224 */   addiu     $v0, $zero, 0x8
/* 2BEA0 8003E280 A40482AF */  sw         $v0, 0x4A4($gp) /* Failed to symbolize address 0x000004A4 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BEA4 8003E284 07000224 */  addiu      $v0, $zero, 0x7
.L8003E288:
/* 2BEA8 8003E288 1800BF8F */  lw         $ra, 0x18($sp)
/* 2BEAC 8003E28C 1400B18F */  lw         $s1, 0x14($sp)
/* 2BEB0 8003E290 1000B08F */  lw         $s0, 0x10($sp)
/* 2BEB4 8003E294 0800E003 */  jr         $ra
/* 2BEB8 8003E298 2000BD27 */   addiu     $sp, $sp, 0x20
.size MEMCARD_GetInfo, . - MEMCARD_GetInfo
