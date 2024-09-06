.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_80070308
/* 5DF28 80070308 0800E002 */  jr         $s7
/* 5DF2C 8007030C 21C8E003 */   addu      $t9, $ra, $zero
/* 5DF30 80070310 DA005C98 */  lwr        $gp, 0xDA($v0)
/* 5DF34 80070314 DE005E84 */  lh         $fp, 0xDE($v0)
/* 5DF38 80070318 08002003 */  jr         $t9
/* 5DF3C 8007031C DD005C88 */   lwl       $gp, 0xDD($v0)
/* 5DF40 80070320 D4005C94 */  lhu        $gp, 0xD4($v0)
/* 5DF44 80070324 DE005E84 */  lh         $fp, 0xDE($v0)
/* 5DF48 80070328 08002003 */  jr         $t9
/* 5DF4C 8007032C DD005C88 */   lwl       $gp, 0xDD($v0)
/* 5DF50 80070330 D4005C8C */  lw         $gp, 0xD4($v0)
/* 5DF54 80070334 DE005E84 */  lh         $fp, 0xDE($v0)
/* 5DF58 80070338 08002003 */  jr         $t9
/* 5DF5C 8007033C DA005C98 */   lwr       $gp, 0xDA($v0)
/* 5DF60 80070340 D4005C8C */  lw         $gp, 0xD4($v0)
/* 5DF64 80070344 08002003 */  jr         $t9
/* 5DF68 80070348 DE005E84 */   lh        $fp, 0xDE($v0)
/* 5DF6C 8007034C DA005C98 */  lwr        $gp, 0xDA($v0)
/* 5DF70 80070350 D8005E84 */  lh         $fp, 0xD8($v0)
/* 5DF74 80070354 08002003 */  jr         $t9
/* 5DF78 80070358 DD005C88 */   lwl       $gp, 0xDD($v0)
/* 5DF7C 8007035C D4005C94 */  lhu        $gp, 0xD4($v0)
/* 5DF80 80070360 D8005E84 */  lh         $fp, 0xD8($v0)
/* 5DF84 80070364 08002003 */  jr         $t9
/* 5DF88 80070368 DD005C88 */   lwl       $gp, 0xDD($v0)
/* 5DF8C 8007036C D4005C8C */  lw         $gp, 0xD4($v0)
/* 5DF90 80070370 D8005E84 */  lh         $fp, 0xD8($v0)
/* 5DF94 80070374 08002003 */  jr         $t9
/* 5DF98 80070378 DA005C98 */   lwr       $gp, 0xDA($v0)
/* 5DF9C 8007037C D4005C8C */  lw         $gp, 0xD4($v0)
/* 5DFA0 80070380 08002003 */  jr         $t9
/* 5DFA4 80070384 D8005E84 */   lh        $fp, 0xD8($v0)
.size func_80070308, . - func_80070308
