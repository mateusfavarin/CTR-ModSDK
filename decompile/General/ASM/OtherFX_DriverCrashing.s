.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel OtherFX_DriverCrashing
/* 1C380 8002E760 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1C384 8002E764 1000BFAF */  sw         $ra, 0x10($sp)
/* 1C388 8002E768 2118A000 */  addu       $v1, $a1, $zero
/* 1C38C 8002E76C DD00622C */  sltiu      $v0, $v1, 0xDD
/* 1C390 8002E770 03004014 */  bnez       $v0, .L8002E780
/* 1C394 8002E774 21308000 */   addu      $a2, $a0, $zero
/* 1C398 8002E778 E4B90008 */  j          .L8002E790
/* 1C39C 8002E77C 0A000424 */   addiu     $a0, $zero, 0xA
.L8002E780:
/* 1C3A0 8002E780 A100622C */  sltiu      $v0, $v1, 0xA1
/* 1C3A4 8002E784 02004014 */  bnez       $v0, .L8002E790
/* 1C3A8 8002E788 0B000424 */   addiu     $a0, $zero, 0xB
/* 1C3AC 8002E78C 0C000424 */  addiu      $a0, $zero, 0xC
.L8002E790:
/* 1C3B0 8002E790 21280000 */  addu       $a1, $zero, $zero
/* 1C3B4 8002E794 00360600 */  sll        $a2, $a2, 24
/* 1C3B8 8002E798 FF006230 */  andi       $v0, $v1, 0xFF
/* 1C3BC 8002E79C 00140200 */  sll        $v0, $v0, 16
/* 1C3C0 8002E7A0 2530C200 */  or         $a2, $a2, $v0
/* 1C3C4 8002E7A4 34A1000C */  jal        DECOMP_OtherFX_Play_LowLevel
/* 1C3C8 8002E7A8 8080C634 */   ori       $a2, $a2, 0x8080
/* 1C3CC 8002E7AC 1000BF8F */  lw         $ra, 0x10($sp)
/* 1C3D0 8002E7B0 00000000 */  nop
/* 1C3D4 8002E7B4 0800E003 */  jr         $ra
/* 1C3D8 8002E7B8 1800BD27 */   addiu     $sp, $sp, 0x18
.size OtherFX_DriverCrashing, . - OtherFX_DriverCrashing
