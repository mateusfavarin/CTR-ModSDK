.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel Torch_Subset1
/* 39534 8004B914 23588C00 */  subu       $t3, $a0, $t4
/* 39538 8004B918 21608C00 */  addu       $t4, $a0, $t4
/* 3953C 8004B91C FFFF6B31 */  andi       $t3, $t3, 0xFFFF
/* 39540 8004B920 FFFF8C31 */  andi       $t4, $t4, 0xFFFF
/* 39544 8004B924 25586301 */  or         $t3, $t3, $v1
/* 39548 8004B928 25608301 */  or         $t4, $t4, $v1
/* 3954C 8004B92C 03740E00 */  sra        $t6, $t6, 16
/* 39550 8004B930 2368AE00 */  subu       $t5, $a1, $t6
/* 39554 8004B934 2170AE00 */  addu       $t6, $a1, $t6
/* 39558 8004B938 006C0D00 */  sll        $t5, $t5, 16
/* 3955C 8004B93C 00740E00 */  sll        $t6, $t6, 16
/* 39560 8004B940 2568A401 */  or         $t5, $t5, $a0
/* 39564 8004B944 0800E003 */  jr         $ra
/* 39568 8004B948 2570C401 */   or        $t6, $t6, $a0
.size Torch_Subset1, . - Torch_Subset1
