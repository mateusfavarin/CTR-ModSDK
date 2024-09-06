.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel RefreshCard_GhostDecodeByte
/* 347E0 80046BC0 FF008330 */  andi       $v1, $a0, 0xFF
/* 347E4 80046BC4 2D000224 */  addiu      $v0, $zero, 0x2D
/* 347E8 80046BC8 03006214 */  bne        $v1, $v0, .L80046BD8
/* 347EC 80046BCC 5F000224 */   addiu     $v0, $zero, 0x5F
/* 347F0 80046BD0 0800E003 */  jr         $ra
/* 347F4 80046BD4 3E000224 */   addiu     $v0, $zero, 0x3E
.L80046BD8:
/* 347F8 80046BD8 03006214 */  bne        $v1, $v0, .L80046BE8
/* 347FC 80046BDC 3A00622C */   sltiu     $v0, $v1, 0x3A
/* 34800 80046BE0 0800E003 */  jr         $ra
/* 34804 80046BE4 3F000224 */   addiu     $v0, $zero, 0x3F
.L80046BE8:
/* 34808 80046BE8 03004010 */  beqz       $v0, .L80046BF8
/* 3480C 80046BEC FF008230 */   andi      $v0, $a0, 0xFF
/* 34810 80046BF0 0800E003 */  jr         $ra
/* 34814 80046BF4 D0FF4224 */   addiu     $v0, $v0, -0x30
.L80046BF8:
/* 34818 80046BF8 5B00622C */  sltiu      $v0, $v1, 0x5B
/* 3481C 80046BFC 07004014 */  bnez       $v0, .L80046C1C
/* 34820 80046C00 C9FF0334 */   ori       $v1, $zero, 0xFFC9
/* 34824 80046C04 FF008230 */  andi       $v0, $a0, 0xFF
/* 34828 80046C08 C3FF0334 */  ori        $v1, $zero, 0xFFC3
/* 3482C 80046C0C 21104300 */  addu       $v0, $v0, $v1
/* 34830 80046C10 00140200 */  sll        $v0, $v0, 16
/* 34834 80046C14 0800E003 */  jr         $ra
/* 34838 80046C18 03140200 */   sra       $v0, $v0, 16
.L80046C1C:
/* 3483C 80046C1C FF008230 */  andi       $v0, $a0, 0xFF
/* 34840 80046C20 21104300 */  addu       $v0, $v0, $v1
/* 34844 80046C24 00140200 */  sll        $v0, $v0, 16
/* 34848 80046C28 0800E003 */  jr         $ra
/* 3484C 80046C2C 03140200 */   sra       $v0, $v0, 16
.size RefreshCard_GhostDecodeByte, . - RefreshCard_GhostDecodeByte
