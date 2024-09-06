.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel func_8006EF98
/* 5CBB8 8006EF98 00F09548 */  mtc2       $s5, $30 /* handwritten instruction */
/* 5CBBC 8006EF9C 1700A012 */  beqz       $s5, .L8006EFFC
/* 5CBC0 8006EFA0 00001624 */   addiu     $s6, $zero, 0x0
/* 5CBC4 8006EFA4 00F81348 */  mfc2       $s3, $31 /* handwritten instruction */
/* 5CBC8 8006EFA8 00001124 */  addiu      $s1, $zero, 0x0
/* 5CBCC 8006EFAC 1E007332 */  andi       $s3, $s3, 0x1E
/* 5CBD0 8006EFB0 04A87502 */  sllv       $s5, $s5, $s3
/* 5CBD4 8006EFB4 0B000104 */  bgez       $zero, .L8006EFE4
/* 5CBD8 8006EFB8 1E00733A */   xori      $s3, $s3, 0x1E
.L8006EFBC:
/* 5CBDC 8006EFBC 82971500 */  srl        $s2, $s5, 30
/* 5CBE0 8006EFC0 25883202 */  or         $s1, $s1, $s2
/* 5CBE4 8006EFC4 80901600 */  sll        $s2, $s6, 2
/* 5CBE8 8006EFC8 01005226 */  addiu      $s2, $s2, 0x1
/* 5CBEC 8006EFCC 40B01600 */  sll        $s6, $s6, 1
/* 5CBF0 8006EFD0 23903202 */  subu       $s2, $s1, $s2
/* 5CBF4 8006EFD4 06004006 */  bltz       $s2, .L8006EFF0
/* 5CBF8 8006EFD8 80A81500 */   sll       $s5, $s5, 2
/* 5CBFC 8006EFDC 0100D626 */  addiu      $s6, $s6, 0x1
/* 5CC00 8006EFE0 80881200 */  sll        $s1, $s2, 2
.L8006EFE4:
/* 5CC04 8006EFE4 F5FF6106 */  bgez       $s3, .L8006EFBC
/* 5CC08 8006EFE8 FEFF7326 */   addiu     $s3, $s3, -0x2
/* 5CC0C 8006EFEC 0800E003 */  jr         $ra
.L8006EFF0:
/* 5CC10 8006EFF0 80881100 */   sll       $s1, $s1, 2
/* 5CC14 8006EFF4 F1FF6106 */  bgez       $s3, .L8006EFBC
/* 5CC18 8006EFF8 FEFF7326 */   addiu     $s3, $s3, -0x2
.L8006EFFC:
/* 5CC1C 8006EFFC 0800E003 */  jr         $ra
/* 5CC20 8006F000 00000000 */   nop
.size func_8006EF98, . - func_8006EF98
