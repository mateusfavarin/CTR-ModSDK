.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel RefreshCard_StopMemcardAction
/* 34DCC 800471AC 01000224 */  addiu      $v0, $zero, 0x1
/* 34DD0 800471B0 F80982A7 */  sh         $v0, 0x9F8($gp) /* Failed to symbolize address 0x000009F8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34DD4 800471B4 02000224 */  addiu      $v0, $zero, 0x2
/* 34DD8 800471B8 0C0582A7 */  sh         $v0, 0x50C($gp) /* Failed to symbolize address 0x0000050C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34DDC 800471BC 0800E003 */  jr         $ra
/* 34DE0 800471C0 00000000 */   nop
.size RefreshCard_StopMemcardAction, . - RefreshCard_StopMemcardAction
