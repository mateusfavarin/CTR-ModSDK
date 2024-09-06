.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel MEMCARD_FindNextGhost
/* 2C298 8003E678 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 2C29C 8003E67C 9804838F */  lw         $v1, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2C2A0 8003E680 0F000224 */  addiu      $v0, $zero, 0xF
/* 2C2A4 8003E684 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 2C2A8 8003E688 0D006214 */  bne        $v1, $v0, .L8003E6C0
/* 2C2AC 8003E68C 3800B0AF */   sw        $s0, 0x38($sp)
/* 2C2B0 8003E690 FADF010C */  jal        nextfile
/* 2C2B4 8003E694 1000A427 */   addiu     $a0, $sp, 0x10
/* 2C2B8 8003E698 21284000 */  addu       $a1, $v0, $zero
/* 2C2BC 8003E69C 1000A227 */  addiu      $v0, $sp, 0x10
/* 2C2C0 8003E6A0 0600A214 */  bne        $a1, $v0, .L8003E6BC
/* 2C2C4 8003E6A4 0A80103C */   lui       $s0, %hi(D_800990C4)
/* 2C2C8 8003E6A8 C4901026 */  addiu      $s0, $s0, %lo(D_800990C4)
/* 2C2CC 8003E6AC 30D7010C */  jal        strcpy
/* 2C2D0 8003E6B0 21200002 */   addu      $a0, $s0, $zero
/* 2C2D4 8003E6B4 B1F90008 */  j          .L8003E6C4
/* 2C2D8 8003E6B8 21100002 */   addu      $v0, $s0, $zero
.L8003E6BC:
/* 2C2DC 8003E6BC 980480AF */  sw         $zero, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
.L8003E6C0:
/* 2C2E0 8003E6C0 21100000 */  addu       $v0, $zero, $zero
.L8003E6C4:
/* 2C2E4 8003E6C4 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 2C2E8 8003E6C8 3800B08F */  lw         $s0, 0x38($sp)
/* 2C2EC 8003E6CC 0800E003 */  jr         $ra
/* 2C2F0 8003E6D0 4000BD27 */   addiu     $sp, $sp, 0x40
.size MEMCARD_FindNextGhost, . - MEMCARD_FindNextGhost
