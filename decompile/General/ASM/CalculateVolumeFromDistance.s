.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel CalculateVolumeFromDistance
/* 1C46C 8002E84C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 1C470 8002E850 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 1C474 8002E854 21888000 */  addu       $s1, $a0, $zero
/* 1C478 8002E858 2000B2AF */  sw         $s2, 0x20($sp)
/* 1C47C 8002E85C 2190A000 */  addu       $s2, $a1, $zero
/* 1C480 8002E860 1800B0AF */  sw         $s0, 0x18($sp)
/* 1C484 8002E864 2180C000 */  addu       $s0, $a2, $zero
/* 1C488 8002E868 7017022A */  slti       $v0, $s0, 0x1770
/* 1C48C 8002E86C 09004014 */  bnez       $v0, .L8002E894
/* 1C490 8002E870 2400BFAF */   sw        $ra, 0x24($sp)
/* 1C494 8002E874 0000248E */  lw         $a0, 0x0($s1)
/* 1C498 8002E878 00000000 */  nop
/* 1C49C 8002E87C 3F008010 */  beqz       $a0, .L8002E97C
/* 1C4A0 8002E880 00000000 */   nop
/* 1C4A4 8002E884 02A2000C */  jal        DECOMP_OtherFX_Stop1
/* 1C4A8 8002E888 00000000 */   nop
/* 1C4AC 8002E88C 5FBA0008 */  j          .L8002E97C
/* 1C4B0 8002E890 000020AE */   sw        $zero, 0x0($s1)
.L8002E894:
/* 1C4B4 8002E894 0000248E */  lw         $a0, 0x0($s1)
/* 1C4B8 8002E898 00000000 */  nop
/* 1C4BC 8002E89C 06008010 */  beqz       $a0, .L8002E8B8
/* 1C4C0 8002E8A0 FFFF8230 */   andi      $v0, $a0, 0xFFFF
/* 1C4C4 8002E8A4 05005210 */  beq        $v0, $s2, .L8002E8BC
/* 1C4C8 8002E8A8 2D01022A */   slti      $v0, $s0, 0x12D
/* 1C4CC 8002E8AC 02A2000C */  jal        DECOMP_OtherFX_Stop1
/* 1C4D0 8002E8B0 00000000 */   nop
/* 1C4D4 8002E8B4 000020AE */  sw         $zero, 0x0($s1)
.L8002E8B8:
/* 1C4D8 8002E8B8 2D01022A */  slti       $v0, $s0, 0x12D
.L8002E8BC:
/* 1C4DC 8002E8BC 08004014 */  bnez       $v0, .L8002E8E0
/* 1C4E0 8002E8C0 21200002 */   addu      $a0, $s0, $zero
/* 1C4E4 8002E8C4 1000A0AF */  sw         $zero, 0x10($sp)
/* 1C4E8 8002E8C8 2C010524 */  addiu      $a1, $zero, 0x12C
/* 1C4EC 8002E8CC 70170624 */  addiu      $a2, $zero, 0x1770
/* 1C4F0 8002E8D0 E763010C */  jal        DECOMP_VehCalc_MapToRange
/* 1C4F4 8002E8D4 FF000724 */   addiu     $a3, $zero, 0xFF
/* 1C4F8 8002E8D8 39BA0008 */  j          .L8002E8E4
/* 1C4FC 8002E8DC 21304000 */   addu      $a2, $v0, $zero
.L8002E8E0:
/* 1C500 8002E8E0 FF000624 */  addiu      $a2, $zero, 0xFF
.L8002E8E4:
/* 1C504 8002E8E4 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 1C508 8002E8E8 24004212 */  beq        $s2, $v0, .L8002E97C
/* 1C50C 8002E8EC 00000000 */   nop
/* 1C510 8002E8F0 0000248E */  lw         $a0, 0x0($s1)
/* 1C514 8002E8F4 00000000 */  nop
/* 1C518 8002E8F8 09008014 */  bnez       $a0, .L8002E920
/* 1C51C 8002E8FC 89000224 */   addiu     $v0, $zero, 0x89
/* 1C520 8002E900 FFFF4432 */  andi       $a0, $s2, 0xFFFF
/* 1C524 8002E904 21280000 */  addu       $a1, $zero, $zero
/* 1C528 8002E908 FF00C630 */  andi       $a2, $a2, 0xFF
/* 1C52C 8002E90C 00340600 */  sll        $a2, $a2, 16
/* 1C530 8002E910 34A1000C */  jal        DECOMP_OtherFX_Play_LowLevel
/* 1C534 8002E914 8080C634 */   ori       $a2, $a2, 0x8080
/* 1C538 8002E918 5FBA0008 */  j          .L8002E97C
/* 1C53C 8002E91C 000022AE */   sw        $v0, 0x0($s1)
.L8002E920:
/* 1C540 8002E920 12004216 */  bne        $s2, $v0, .L8002E96C
/* 1C544 8002E924 FF00C530 */   andi      $a1, $a2, 0xFF
/* 1C548 8002E928 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 1C54C 8002E92C ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 1C550 8002E930 00000000 */  nop
/* 1C554 8002E934 E41C428C */  lw         $v0, 0x1CE4($v0)
/* 1C558 8002E938 002C0500 */  sll        $a1, $a1, 16
/* 1C55C 8002E93C 82100200 */  srl        $v0, $v0, 2
/* 1C560 8002E940 7F004230 */  andi       $v0, $v0, 0x7F
/* 1C564 8002E944 C0FF4224 */  addiu      $v0, $v0, -0x40
/* 1C568 8002E948 02004104 */  bgez       $v0, .L8002E954
/* 1C56C 8002E94C 00000000 */   nop
/* 1C570 8002E950 23100200 */  negu       $v0, $v0
.L8002E954:
/* 1C574 8002E954 64004224 */  addiu      $v0, $v0, 0x64
/* 1C578 8002E958 FF004230 */  andi       $v0, $v0, 0xFF
/* 1C57C 8002E95C 00120200 */  sll        $v0, $v0, 8
/* 1C580 8002E960 2528A200 */  or         $a1, $a1, $v0
/* 1C584 8002E964 5DBA0008 */  j          .L8002E974
/* 1C588 8002E968 8000A534 */   ori       $a1, $a1, 0x80
.L8002E96C:
/* 1C58C 8002E96C 002C0500 */  sll        $a1, $a1, 16
/* 1C590 8002E970 8080A534 */  ori        $a1, $a1, 0x8080
.L8002E974:
/* 1C594 8002E974 A4A1000C */  jal        DECOMP_OtherFX_Modify
/* 1C598 8002E978 00000000 */   nop
.L8002E97C:
/* 1C59C 8002E97C 2400BF8F */  lw         $ra, 0x24($sp)
/* 1C5A0 8002E980 2000B28F */  lw         $s2, 0x20($sp)
/* 1C5A4 8002E984 1C00B18F */  lw         $s1, 0x1C($sp)
/* 1C5A8 8002E988 1800B08F */  lw         $s0, 0x18($sp)
/* 1C5AC 8002E98C 0800E003 */  jr         $ra
/* 1C5B0 8002E990 2800BD27 */   addiu     $sp, $sp, 0x28
.size CalculateVolumeFromDistance, . - CalculateVolumeFromDistance
