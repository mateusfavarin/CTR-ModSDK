.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel Torch_Subset2
/* 3956C 8004B94C 00700A48 */  mfc2       $t2, $14 /* handwritten instruction */
/* 39570 8004B950 1C00EBAC */  sw         $t3, 0x1C($a3)
/* 39574 8004B954 0C00ECAC */  sw         $t4, 0xC($a3)
/* 39578 8004B958 0400EDAC */  sw         $t5, 0x4($a3)
/* 3957C 8004B95C 1400EEAC */  sw         $t6, 0x14($a3)
/* 39580 8004B960 FFFF4931 */  andi       $t1, $t2, 0xFFFF
/* 39584 8004B964 03540A00 */  sra        $t2, $t2, 16
/* 39588 8004B968 23188900 */  subu       $v1, $a0, $t1
/* 3958C 8004B96C 2340AA00 */  subu       $t0, $a1, $t2
/* 39590 8004B970 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 39594 8004B974 00440800 */  sll        $t0, $t0, 16
/* 39598 8004B978 25186800 */  or         $v1, $v1, $t0
/* 3959C 8004B97C 2000E3AC */  sw         $v1, 0x20($a3)
/* 395A0 8004B980 21188900 */  addu       $v1, $a0, $t1
/* 395A4 8004B984 2340AA00 */  subu       $t0, $a1, $t2
/* 395A8 8004B988 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 395AC 8004B98C 00440800 */  sll        $t0, $t0, 16
/* 395B0 8004B990 25186800 */  or         $v1, $v1, $t0
/* 395B4 8004B994 0800E3AC */  sw         $v1, 0x8($a3)
/* 395B8 8004B998 23188900 */  subu       $v1, $a0, $t1
/* 395BC 8004B99C 2140AA00 */  addu       $t0, $a1, $t2
/* 395C0 8004B9A0 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 395C4 8004B9A4 00440800 */  sll        $t0, $t0, 16
/* 395C8 8004B9A8 25186800 */  or         $v1, $v1, $t0
/* 395CC 8004B9AC 1800E3AC */  sw         $v1, 0x18($a3)
/* 395D0 8004B9B0 21188900 */  addu       $v1, $a0, $t1
/* 395D4 8004B9B4 2140AA00 */  addu       $t0, $a1, $t2
/* 395D8 8004B9B8 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 395DC 8004B9BC 00440800 */  sll        $t0, $t0, 16
/* 395E0 8004B9C0 25186800 */  or         $v1, $v1, $t0
/* 395E4 8004B9C4 0800E003 */  jr         $ra
/* 395E8 8004B9C8 1000E3AC */   sw        $v1, 0x10($a3)
.size Torch_Subset2, . - Torch_Subset2
