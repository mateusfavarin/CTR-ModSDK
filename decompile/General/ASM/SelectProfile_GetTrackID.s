.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel SelectProfile_GetTrackID
/* 361C8 800485A8 0880033C */  lui        $v1, %hi(D_80085B76)
/* 361CC 800485AC 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 361D0 800485B0 ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 361D4 800485B4 01000224 */  addiu      $v0, $zero, 0x1
/* 361D8 800485B8 765B62A4 */  sh         $v0, %lo(D_80085B76)($v1)
/* 361DC 800485BC 101A8394 */  lhu        $v1, 0x1A10($a0)
/* 361E0 800485C0 0980023C */  lui        $v0, %hi(D_8008FBD2)
/* 361E4 800485C4 0800E003 */  jr         $ra
/* 361E8 800485C8 D2FB43A4 */   sh        $v1, %lo(D_8008FBD2)($v0)
.size SelectProfile_GetTrackID, . - SelectProfile_GetTrackID
