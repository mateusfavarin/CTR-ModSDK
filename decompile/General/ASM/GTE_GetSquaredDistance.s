.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel GTE_GetSquaredDistance
/* 1C3DC 8002E7BC 00008284 */  lh         $v0, 0x0($a0)
/* 1C3E0 8002E7C0 0000A384 */  lh         $v1, 0x0($a1)
/* 1C3E4 8002E7C4 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1C3E8 8002E7C8 23104300 */  subu       $v0, $v0, $v1
/* 1C3EC 8002E7CC 0000A2AF */  sw         $v0, 0x0($sp)
/* 1C3F0 8002E7D0 02008284 */  lh         $v0, 0x2($a0)
/* 1C3F4 8002E7D4 0200A684 */  lh         $a2, 0x2($a1)
/* 1C3F8 8002E7D8 04008384 */  lh         $v1, 0x4($a0)
/* 1C3FC 8002E7DC 0400A484 */  lh         $a0, 0x4($a1)
/* 1C400 8002E7E0 23104600 */  subu       $v0, $v0, $a2
/* 1C404 8002E7E4 23186400 */  subu       $v1, $v1, $a0
/* 1C408 8002E7E8 0400A2AF */  sw         $v0, 0x4($sp)
/* 1C40C 8002E7EC 0800A3AF */  sw         $v1, 0x8($sp)
/* 1C410 8002E7F0 0000A9CB */  lwc2       $9, 0x0($sp)
/* 1C414 8002E7F4 0400A227 */  addiu      $v0, $sp, 0x4
/* 1C418 8002E7F8 00004AC8 */  lwc2       $10, 0x0($v0)
/* 1C41C 8002E7FC 0800A227 */  addiu      $v0, $sp, 0x8
/* 1C420 8002E800 00004BC8 */  lwc2       $11, 0x0($v0)
/* 1C424 8002E804 00000000 */  nop
/* 1C428 8002E808 00000000 */  nop
/* 1C42C 8002E80C 2804A04A */  SQR        0
/* 1C430 8002E810 00C80748 */  mfc2       $a3, $25 /* handwritten instruction */
/* 1C434 8002E814 00000000 */  nop
/* 1C438 8002E818 0000A7AF */  sw         $a3, 0x0($sp)
/* 1C43C 8002E81C 00D00748 */  mfc2       $a3, $26 /* handwritten instruction */
/* 1C440 8002E820 00000000 */  nop
/* 1C444 8002E824 0400A7AF */  sw         $a3, 0x4($sp)
/* 1C448 8002E828 00D80748 */  mfc2       $a3, $27 /* handwritten instruction */
/* 1C44C 8002E82C 0000A28F */  lw         $v0, 0x0($sp)
/* 1C450 8002E830 0400A38F */  lw         $v1, 0x4($sp)
/* 1C454 8002E834 2120E000 */  addu       $a0, $a3, $zero
/* 1C458 8002E838 0800A7AF */  sw         $a3, 0x8($sp)
/* 1C45C 8002E83C 21104300 */  addu       $v0, $v0, $v1
/* 1C460 8002E840 21104400 */  addu       $v0, $v0, $a0
/* 1C464 8002E844 0800E003 */  jr         $ra
/* 1C468 8002E848 1000BD27 */   addiu     $sp, $sp, 0x10
.size GTE_GetSquaredDistance, . - GTE_GetSquaredDistance
