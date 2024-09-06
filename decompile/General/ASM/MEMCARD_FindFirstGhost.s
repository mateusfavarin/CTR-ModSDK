.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel MEMCARD_FindFirstGhost
/* 2C220 8003E600 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 2C224 8003E604 21188000 */  addu       $v1, $a0, $zero
/* 2C228 8003E608 9804828F */  lw         $v0, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2C22C 8003E60C 2130A000 */  addu       $a2, $a1, $zero
/* 2C230 8003E610 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 2C234 8003E614 13004014 */  bnez       $v0, .L8003E664
/* 2C238 8003E618 3800B0AF */   sw        $s0, 0x38($sp)
/* 2C23C 8003E61C 0A80023C */  lui        $v0, %hi(D_800990A4)
/* 2C240 8003E620 A4905024 */  addiu      $s0, $v0, %lo(D_800990A4)
/* 2C244 8003E624 21200002 */  addu       $a0, $s0, $zero
/* 2C248 8003E628 CCF5000C */  jal        DECOMP_MEMCARD_StringSet
/* 2C24C 8003E62C 21286000 */   addu      $a1, $v1, $zero
/* 2C250 8003E630 21200002 */  addu       $a0, $s0, $zero
/* 2C254 8003E634 22E0010C */  jal        firstfile
/* 2C258 8003E638 1000A527 */   addiu     $a1, $sp, 0x10
/* 2C25C 8003E63C 21284000 */  addu       $a1, $v0, $zero
/* 2C260 8003E640 1000A227 */  addiu      $v0, $sp, 0x10
/* 2C264 8003E644 0700A214 */  bne        $a1, $v0, .L8003E664
/* 2C268 8003E648 0F000224 */   addiu     $v0, $zero, 0xF
/* 2C26C 8003E64C 980482AF */  sw         $v0, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2C270 8003E650 20001026 */  addiu      $s0, $s0, 0x20
/* 2C274 8003E654 30D7010C */  jal        strcpy
/* 2C278 8003E658 21200002 */   addu      $a0, $s0, $zero
/* 2C27C 8003E65C 9AF90008 */  j          .L8003E668
/* 2C280 8003E660 21100002 */   addu      $v0, $s0, $zero
.L8003E664:
/* 2C284 8003E664 21100000 */  addu       $v0, $zero, $zero
.L8003E668:
/* 2C288 8003E668 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 2C28C 8003E66C 3800B08F */  lw         $s0, 0x38($sp)
/* 2C290 8003E670 0800E003 */  jr         $ra
/* 2C294 8003E674 4000BD27 */   addiu     $sp, $sp, 0x40
.size MEMCARD_FindFirstGhost, . - MEMCARD_FindFirstGhost
