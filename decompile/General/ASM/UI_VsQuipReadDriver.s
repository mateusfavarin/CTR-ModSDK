.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel UI_VsQuipReadDriver
/* 42628 80054A08 02000224 */  addiu      $v0, $zero, 0x2
/* 4262C 80054A0C 1000C210 */  beq        $a2, $v0, .L80054A50
/* 42630 80054A10 0300C228 */   slti      $v0, $a2, 0x3
/* 42634 80054A14 05004010 */  beqz       $v0, .L80054A2C
/* 42638 80054A18 01000224 */   addiu     $v0, $zero, 0x1
/* 4263C 80054A1C 0800C210 */  beq        $a2, $v0, .L80054A40
/* 42640 80054A20 21100000 */   addu      $v0, $zero, $zero
/* 42644 80054A24 9C520108 */  j          .L80054A70
/* 42648 80054A28 00000000 */   nop
.L80054A2C:
/* 4264C 80054A2C 04000224 */  addiu      $v0, $zero, 0x4
/* 42650 80054A30 0B00C210 */  beq        $a2, $v0, .L80054A60
/* 42654 80054A34 21100000 */   addu      $v0, $zero, $zero
/* 42658 80054A38 9C520108 */  j          .L80054A70
/* 4265C 80054A3C 00000000 */   nop
.L80054A40:
/* 42660 80054A40 21108500 */  addu       $v0, $a0, $a1
/* 42664 80054A44 00004290 */  lbu        $v0, 0x0($v0)
/* 42668 80054A48 0800E003 */  jr         $ra
/* 4266C 80054A4C 00000000 */   nop
.L80054A50:
/* 42670 80054A50 21108500 */  addu       $v0, $a0, $a1
/* 42674 80054A54 00004284 */  lh         $v0, 0x0($v0)
/* 42678 80054A58 0800E003 */  jr         $ra
/* 4267C 80054A5C 00000000 */   nop
.L80054A60:
/* 42680 80054A60 21108500 */  addu       $v0, $a0, $a1
/* 42684 80054A64 0000428C */  lw         $v0, 0x0($v0)
/* 42688 80054A68 0800E003 */  jr         $ra
/* 4268C 80054A6C 00000000 */   nop
.L80054A70:
/* 42690 80054A70 0800E003 */  jr         $ra
/* 42694 80054A74 00000000 */   nop
.size UI_VsQuipReadDriver, . - UI_VsQuipReadDriver
