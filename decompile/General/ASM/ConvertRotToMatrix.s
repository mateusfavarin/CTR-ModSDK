.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel ConvertRotToMatrix
/* 59EC4 8006C2A4 801F013C */  lui        $at, (0x1F80002C >> 16)
/* 59EC8 8006C2A8 000030AC */  sw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 59ECC 8006C2AC 040031AC */  sw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 59ED0 8006C2B0 080032AC */  sw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 59ED4 8006C2B4 0C0033AC */  sw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 59ED8 8006C2B8 100034AC */  sw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 59EDC 8006C2BC 2C003FAC */  sw         $ra, (0x1F80002C & 0xFFFF)($at)
/* 59EE0 8006C2C0 0000B384 */  lh         $s3, 0x0($a1)
/* 59EE4 8006C2C4 0200B084 */  lh         $s0, 0x2($a1)
/* 59EE8 8006C2C8 0400B484 */  lh         $s4, 0x4($a1)
/* 59EEC 8006C2CC 0CB1010C */  jal        TRIG_AngleSinCos_r16r17r18_duplicate
/* 59EF0 8006C2D0 00100D24 */   addiu     $t5, $zero, 0x1000
/* 59EF4 8006C2D4 21584002 */  addu       $t3, $s2, $zero
/* 59EF8 8006C2D8 21602002 */  addu       $t4, $s1, $zero
/* 59EFC 8006C2DC 22181100 */  neg        $v1, $s1 /* handwritten instruction */
/* 59F00 8006C2E0 FFFF6E30 */  andi       $t6, $v1, 0xFFFF
/* 59F04 8006C2E4 50B1010C */  jal        func_8006C540
/* 59F08 8006C2E8 21784002 */   addu      $t7, $s2, $zero
/* 59F0C 8006C2EC 0A006012 */  beqz       $s3, .L8006C318
/* 59F10 8006C2F0 21806002 */   addu      $s0, $s3, $zero
/* 59F14 8006C2F4 0CB1010C */  jal        TRIG_AngleSinCos_r16r17r18_duplicate
/* 59F18 8006C2F8 00100B24 */   addiu     $t3, $zero, 0x1000
/* 59F1C 8006C2FC 00000C24 */  addiu      $t4, $zero, 0x0
/* 59F20 8006C300 22181100 */  neg        $v1, $s1 /* handwritten instruction */
/* 59F24 8006C304 001C0300 */  sll        $v1, $v1, 16
/* 59F28 8006C308 25687200 */  or         $t5, $v1, $s2
/* 59F2C 8006C30C 00741100 */  sll        $t6, $s1, 16
/* 59F30 8006C310 27B1010C */  jal        func_8006C49C
/* 59F34 8006C314 21784002 */   addu      $t7, $s2, $zero
.L8006C318:
/* 59F38 8006C318 0A008012 */  beqz       $s4, .L8006C344
/* 59F3C 8006C31C 21808002 */   addu      $s0, $s4, $zero
/* 59F40 8006C320 0CB1010C */  jal        TRIG_AngleSinCos_r16r17r18_duplicate
/* 59F44 8006C324 00000E24 */   addiu     $t6, $zero, 0x0
/* 59F48 8006C328 00100F24 */  addiu      $t7, $zero, 0x1000
/* 59F4C 8006C32C 22181100 */  neg        $v1, $s1 /* handwritten instruction */
/* 59F50 8006C330 001C0300 */  sll        $v1, $v1, 16
/* 59F54 8006C334 25587200 */  or         $t3, $v1, $s2
/* 59F58 8006C338 00641100 */  sll        $t4, $s1, 16
/* 59F5C 8006C33C 27B1010C */  jal        func_8006C49C
/* 59F60 8006C340 21684002 */   addu      $t5, $s2, $zero
.L8006C344:
/* 59F64 8006C344 00008BAC */  sw         $t3, 0x0($a0)
/* 59F68 8006C348 04008CAC */  sw         $t4, 0x4($a0)
/* 59F6C 8006C34C 08008DAC */  sw         $t5, 0x8($a0)
/* 59F70 8006C350 0C008EAC */  sw         $t6, 0xC($a0)
/* 59F74 8006C354 10008FAC */  sw         $t7, 0x10($a0)
/* 59F78 8006C358 2C003F8C */  lw         $ra, 0x2C($at)
/* 59F7C 8006C35C 1000348C */  lw         $s4, 0x10($at)
/* 59F80 8006C360 0C00338C */  lw         $s3, 0xC($at)
/* 59F84 8006C364 0800328C */  lw         $s2, 0x8($at)
/* 59F88 8006C368 0400318C */  lw         $s1, 0x4($at)
/* 59F8C 8006C36C 0000308C */  lw         $s0, 0x0($at)
/* 59F90 8006C370 0800E003 */  jr         $ra
/* 59F94 8006C374 00000000 */   nop
.size ConvertRotToMatrix, . - ConvertRotToMatrix
