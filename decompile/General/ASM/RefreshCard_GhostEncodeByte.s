.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel RefreshCard_GhostEncodeByte
/* 34780 80046B60 21188000 */  addu       $v1, $a0, $zero
/* 34784 80046B64 00240400 */  sll        $a0, $a0, 16
/* 34788 80046B68 03240400 */  sra        $a0, $a0, 16
/* 3478C 80046B6C 0A008228 */  slti       $v0, $a0, 0xA
/* 34790 80046B70 03004010 */  beqz       $v0, .L80046B80
/* 34794 80046B74 30006224 */   addiu     $v0, $v1, 0x30
/* 34798 80046B78 0800E003 */  jr         $ra
/* 3479C 80046B7C FF004230 */   andi      $v0, $v0, 0xFF
.L80046B80:
/* 347A0 80046B80 24008228 */  slti       $v0, $a0, 0x24
/* 347A4 80046B84 03004010 */  beqz       $v0, .L80046B94
/* 347A8 80046B88 37006224 */   addiu     $v0, $v1, 0x37
/* 347AC 80046B8C 0800E003 */  jr         $ra
/* 347B0 80046B90 FF004230 */   andi      $v0, $v0, 0xFF
.L80046B94:
/* 347B4 80046B94 3E008228 */  slti       $v0, $a0, 0x3E
/* 347B8 80046B98 06004014 */  bnez       $v0, .L80046BB4
/* 347BC 80046B9C 3D006224 */   addiu     $v0, $v1, 0x3D
/* 347C0 80046BA0 3E000324 */  addiu      $v1, $zero, 0x3E
/* 347C4 80046BA4 04008310 */  beq        $a0, $v1, .L80046BB8
/* 347C8 80046BA8 2D000224 */   addiu     $v0, $zero, 0x2D
/* 347CC 80046BAC 0800E003 */  jr         $ra
/* 347D0 80046BB0 5F000224 */   addiu     $v0, $zero, 0x5F
.L80046BB4:
/* 347D4 80046BB4 FF004230 */  andi       $v0, $v0, 0xFF
.L80046BB8:
/* 347D8 80046BB8 0800E003 */  jr         $ra
/* 347DC 80046BBC 00000000 */   nop
.size RefreshCard_GhostEncodeByte, . - RefreshCard_GhostEncodeByte
