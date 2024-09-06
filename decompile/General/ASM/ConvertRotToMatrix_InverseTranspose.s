.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel ConvertRotToMatrix_InverseTranspose
/* 59DF0 8006C1D0 801F013C */  lui        $at, (0x1F80002C >> 16)
/* 59DF4 8006C1D4 000030AC */  sw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 59DF8 8006C1D8 040031AC */  sw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 59DFC 8006C1DC 080032AC */  sw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 59E00 8006C1E0 0C0033AC */  sw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 59E04 8006C1E4 100034AC */  sw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 59E08 8006C1E8 2C003FAC */  sw         $ra, (0x1F80002C & 0xFFFF)($at)
/* 59E0C 8006C1EC 0000B384 */  lh         $s3, 0x0($a1)
/* 59E10 8006C1F0 0400B084 */  lh         $s0, 0x4($a1)
/* 59E14 8006C1F4 0200B484 */  lh         $s4, 0x2($a1)
glabel .L8006C1F8
/* 59E18 8006C1F8 0CB1010C */  jal        TRIG_AngleSinCos_r16r17r18_duplicate
/* 59E1C 8006C1FC 00000E24 */   addiu     $t6, $zero, 0x0
/* 59E20 8006C200 00100F24 */  addiu      $t7, $zero, 0x1000
/* 59E24 8006C204 22181100 */  neg        $v1, $s1 /* handwritten instruction */
/* 59E28 8006C208 001C0300 */  sll        $v1, $v1, 16
/* 59E2C 8006C20C 25587200 */  or         $t3, $v1, $s2
/* 59E30 8006C210 00641100 */  sll        $t4, $s1, 16
/* 59E34 8006C214 50B1010C */  jal        func_8006C540
/* 59E38 8006C218 21684002 */   addu      $t5, $s2, $zero
/* 59E3C 8006C21C 0A006012 */  beqz       $s3, .L8006C248
/* 59E40 8006C220 21806002 */   addu      $s0, $s3, $zero
/* 59E44 8006C224 0CB1010C */  jal        TRIG_AngleSinCos_r16r17r18_duplicate
/* 59E48 8006C228 00100B24 */   addiu     $t3, $zero, 0x1000
/* 59E4C 8006C22C 00000C24 */  addiu      $t4, $zero, 0x0
/* 59E50 8006C230 22181100 */  neg        $v1, $s1 /* handwritten instruction */
/* 59E54 8006C234 001C0300 */  sll        $v1, $v1, 16
/* 59E58 8006C238 25687200 */  or         $t5, $v1, $s2
/* 59E5C 8006C23C 00741100 */  sll        $t6, $s1, 16
/* 59E60 8006C240 27B1010C */  jal        func_8006C49C
/* 59E64 8006C244 21784002 */   addu      $t7, $s2, $zero
.L8006C248:
/* 59E68 8006C248 09008012 */  beqz       $s4, .L8006C270
/* 59E6C 8006C24C 21808002 */   addu      $s0, $s4, $zero
/* 59E70 8006C250 0CB1010C */  jal        TRIG_AngleSinCos_r16r17r18_duplicate
/* 59E74 8006C254 00100D24 */   addiu     $t5, $zero, 0x1000
/* 59E78 8006C258 21584002 */  addu       $t3, $s2, $zero
/* 59E7C 8006C25C 21602002 */  addu       $t4, $s1, $zero
/* 59E80 8006C260 22181100 */  neg        $v1, $s1 /* handwritten instruction */
/* 59E84 8006C264 FFFF6E30 */  andi       $t6, $v1, 0xFFFF
/* 59E88 8006C268 27B1010C */  jal        func_8006C49C
/* 59E8C 8006C26C 21784002 */   addu      $t7, $s2, $zero
.L8006C270:
/* 59E90 8006C270 00008BAC */  sw         $t3, 0x0($a0)
/* 59E94 8006C274 04008CAC */  sw         $t4, 0x4($a0)
/* 59E98 8006C278 08008DAC */  sw         $t5, 0x8($a0)
/* 59E9C 8006C27C 0C008EAC */  sw         $t6, 0xC($a0)
/* 59EA0 8006C280 10008FAC */  sw         $t7, 0x10($a0)
/* 59EA4 8006C284 2C003F8C */  lw         $ra, 0x2C($at)
/* 59EA8 8006C288 1000348C */  lw         $s4, 0x10($at)
/* 59EAC 8006C28C 0C00338C */  lw         $s3, 0xC($at)
/* 59EB0 8006C290 0800328C */  lw         $s2, 0x8($at)
/* 59EB4 8006C294 0400318C */  lw         $s1, 0x4($at)
/* 59EB8 8006C298 0000308C */  lw         $s0, 0x0($at)
/* 59EBC 8006C29C 0800E003 */  jr         $ra
/* 59EC0 8006C2A0 00000000 */   nop
.size ConvertRotToMatrix_InverseTranspose, . - ConvertRotToMatrix_InverseTranspose
