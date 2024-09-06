.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel ConvertRotToMatrix_InverseTranspose_NoRotY
/* 59D44 8006C124 94020124 */  addiu      $at, $zero, 0x294
/* 59D48 8006C128 801F013C */  lui        $at, (0x1F80002C >> 16)
/* 59D4C 8006C12C 000030AC */  sw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 59D50 8006C130 040031AC */  sw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 59D54 8006C134 080032AC */  sw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 59D58 8006C138 0C0033AC */  sw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 59D5C 8006C13C 100034AC */  sw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 59D60 8006C140 2C003FAC */  sw         $ra, (0x1F80002C & 0xFFFF)($at)
/* 59D64 8006C144 0400B084 */  lh         $s0, 0x4($a1)
/* 59D68 8006C148 0000B384 */  lh         $s3, 0x0($a1)
/* 59D6C 8006C14C 0CB1010C */  jal        TRIG_AngleSinCos_r16r17r18_duplicate
/* 59D70 8006C150 00000E24 */   addiu     $t6, $zero, 0x0
/* 59D74 8006C154 00100F24 */  addiu      $t7, $zero, 0x1000
/* 59D78 8006C158 22181100 */  neg        $v1, $s1 /* handwritten instruction */
/* 59D7C 8006C15C 001C0300 */  sll        $v1, $v1, 16
/* 59D80 8006C160 25587200 */  or         $t3, $v1, $s2
/* 59D84 8006C164 00641100 */  sll        $t4, $s1, 16
/* 59D88 8006C168 50B1010C */  jal        func_8006C540
/* 59D8C 8006C16C 21684002 */   addu      $t5, $s2, $zero
/* 59D90 8006C170 0A006012 */  beqz       $s3, .L8006C19C
/* 59D94 8006C174 21806002 */   addu      $s0, $s3, $zero
/* 59D98 8006C178 0CB1010C */  jal        TRIG_AngleSinCos_r16r17r18_duplicate
/* 59D9C 8006C17C 00100B24 */   addiu     $t3, $zero, 0x1000
/* 59DA0 8006C180 00000C24 */  addiu      $t4, $zero, 0x0
/* 59DA4 8006C184 22181100 */  neg        $v1, $s1 /* handwritten instruction */
/* 59DA8 8006C188 001C0300 */  sll        $v1, $v1, 16
/* 59DAC 8006C18C 25687200 */  or         $t5, $v1, $s2
/* 59DB0 8006C190 00741100 */  sll        $t6, $s1, 16
/* 59DB4 8006C194 27B1010C */  jal        func_8006C49C
/* 59DB8 8006C198 21784002 */   addu      $t7, $s2, $zero
.L8006C19C:
/* 59DBC 8006C19C 00008BAC */  sw         $t3, 0x0($a0)
/* 59DC0 8006C1A0 04008CAC */  sw         $t4, 0x4($a0)
/* 59DC4 8006C1A4 08008DAC */  sw         $t5, 0x8($a0)
/* 59DC8 8006C1A8 0C008EAC */  sw         $t6, 0xC($a0)
/* 59DCC 8006C1AC 10008FAC */  sw         $t7, 0x10($a0)
/* 59DD0 8006C1B0 2C003F8C */  lw         $ra, 0x2C($at)
/* 59DD4 8006C1B4 1000348C */  lw         $s4, 0x10($at)
/* 59DD8 8006C1B8 0C00338C */  lw         $s3, 0xC($at)
/* 59DDC 8006C1BC 0800328C */  lw         $s2, 0x8($at)
/* 59DE0 8006C1C0 0400318C */  lw         $s1, 0x4($at)
/* 59DE4 8006C1C4 0000308C */  lw         $s0, 0x0($at)
/* 59DE8 8006C1C8 0800E003 */  jr         $ra
/* 59DEC 8006C1CC 00000000 */   nop
.size ConvertRotToMatrix_InverseTranspose_NoRotY, . - ConvertRotToMatrix_InverseTranspose_NoRotY
