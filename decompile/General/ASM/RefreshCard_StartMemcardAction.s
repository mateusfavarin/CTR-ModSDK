.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel RefreshCard_StartMemcardAction
/* 34DB8 80047198 0C0584A7 */  sh         $a0, 0x50C($gp) /* Failed to symbolize address 0x0000050C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34DBC 8004719C 180A80A7 */  sh         $zero, 0xA18($gp) /* Failed to symbolize address 0x00000A18 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34DC0 800471A0 F80980A7 */  sh         $zero, 0x9F8($gp) /* Failed to symbolize address 0x000009F8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34DC4 800471A4 0800E003 */  jr         $ra
/* 34DC8 800471A8 00000000 */   nop
.size RefreshCard_StartMemcardAction, . - RefreshCard_StartMemcardAction
