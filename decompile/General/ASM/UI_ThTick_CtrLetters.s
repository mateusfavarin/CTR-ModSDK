.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel UI_ThTick_CtrLetters
/* 3A534 8004C914 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 3A538 8004C918 2000BFAF */  sw         $ra, 0x20($sp)
/* 3A53C 8004C91C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 3A540 8004C920 1800B0AF */  sw         $s0, 0x18($sp)
/* 3A544 8004C924 3400908C */  lw         $s0, 0x34($a0)
/* 3A548 8004C928 3000918C */  lw         $s1, 0x30($a0)
/* 3A54C 8004C92C 21200002 */  addu       $a0, $s0, $zero
/* 3A550 8004C930 21282002 */  addu       $a1, $s1, $zero
/* 3A554 8004C934 02002296 */  lhu        $v0, 0x2($s1)
/* 3A558 8004C938 28002626 */  addiu      $a2, $s1, 0x28
/* 3A55C 8004C93C 40004224 */  addiu      $v0, $v0, 0x40
/* 3A560 8004C940 B45C010C */  jal        Vector_SpecLightSpin2D
/* 3A564 8004C944 020022A6 */   sh        $v0, 0x2($s1)
/* 3A568 8004C948 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 3A56C 8004C94C ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 3A570 8004C950 00000000 */  nop
/* 3A574 8004C954 0000428C */  lw         $v0, 0x0($v0)
/* 3A578 8004C958 2000033C */  lui        $v1, (0x200000 >> 16)
/* 3A57C 8004C95C 24104300 */  and        $v0, $v0, $v1
/* 3A580 8004C960 08004010 */  beqz       $v0, .L8004C984
/* 3A584 8004C964 00000000 */   nop
/* 3A588 8004C968 D10F010C */  jal        DECOMP_RaceFlag_IsTransitioning
/* 3A58C 8004C96C 00000000 */   nop
/* 3A590 8004C970 04004010 */  beqz       $v0, .L8004C984
/* 3A594 8004C974 00000000 */   nop
/* 3A598 8004C978 1C0000A6 */  sh         $zero, 0x1C($s0)
/* 3A59C 8004C97C 1E0000A6 */  sh         $zero, 0x1E($s0)
/* 3A5A0 8004C980 200000A6 */  sh         $zero, 0x20($s0)
.L8004C984:
/* 3A5A4 8004C984 1C000386 */  lh         $v1, 0x1C($s0)
/* 3A5A8 8004C988 00080224 */  addiu      $v0, $zero, 0x800
/* 3A5AC 8004C98C 0D006210 */  beq        $v1, $v0, .L8004C9C4
/* 3A5B0 8004C990 00000000 */   nop
/* 3A5B4 8004C994 1000A0A7 */  sh         $zero, 0x10($sp)
/* 3A5B8 8004C998 1C000386 */  lh         $v1, 0x1C($s0)
/* 3A5BC 8004C99C 00000000 */  nop
/* 3A5C0 8004C9A0 00F86224 */  addiu      $v0, $v1, -0x800
/* 3A5C4 8004C9A4 03004104 */  bgez       $v0, .L8004C9B4
/* 3A5C8 8004C9A8 83120200 */   sra       $v0, $v0, 10
/* 3A5CC 8004C9AC FFFB6224 */  addiu      $v0, $v1, -0x401
/* 3A5D0 8004C9B0 83120200 */  sra        $v0, $v0, 10
.L8004C9B4:
/* 3A5D4 8004C9B4 01004224 */  addiu      $v0, $v0, 0x1
/* 3A5D8 8004C9B8 40120200 */  sll        $v0, $v0, 9
/* 3A5DC 8004C9BC 73320108 */  j          .L8004C9CC
/* 3A5E0 8004C9C0 1200A2A7 */   sh        $v0, 0x12($sp)
.L8004C9C4:
/* 3A5E4 8004C9C4 1000A0A7 */  sh         $zero, 0x10($sp)
/* 3A5E8 8004C9C8 1200A0A7 */  sh         $zero, 0x12($sp)
.L8004C9CC:
/* 3A5EC 8004C9CC 1400A0A7 */  sh         $zero, 0x14($sp)
/* 3A5F0 8004C9D0 30001026 */  addiu      $s0, $s0, 0x30
/* 3A5F4 8004C9D4 21200002 */  addu       $a0, $s0, $zero
/* 3A5F8 8004C9D8 A9B0010C */  jal        ConvertRotToMatrix
/* 3A5FC 8004C9DC 1000A527 */   addiu     $a1, $sp, 0x10
/* 3A600 8004C9E0 21200002 */  addu       $a0, $s0, $zero
/* 3A604 8004C9E4 08002526 */  addiu      $a1, $s1, 0x8
/* 3A608 8004C9E8 ECB0010C */  jal        MatrixRotate
/* 3A60C 8004C9EC 21308000 */   addu      $a2, $a0, $zero
/* 3A610 8004C9F0 2000BF8F */  lw         $ra, 0x20($sp)
/* 3A614 8004C9F4 1C00B18F */  lw         $s1, 0x1C($sp)
/* 3A618 8004C9F8 1800B08F */  lw         $s0, 0x18($sp)
/* 3A61C 8004C9FC 0800E003 */  jr         $ra
/* 3A620 8004CA00 2800BD27 */   addiu     $sp, $sp, 0x28
.size UI_ThTick_CtrLetters, . - UI_ThTick_CtrLetters
