.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel RefreshCard_BoolGhostForLEV
/* 34610 800469F0 21300000 */  addu       $a2, $zero, $zero
/* 34614 800469F4 0A80023C */  lui        $v0, %hi(D_8009AA30)
/* 34618 800469F8 30AA4224 */  addiu      $v0, $v0, %lo(D_8009AA30)
/* 3461C 800469FC 2C004384 */  lh         $v1, 0x2C($v0)
/* 34620 80046A00 00000000 */  nop
/* 34624 80046A04 18006018 */  blez       $v1, .L80046A68
/* 34628 80046A08 2128C000 */   addu      $a1, $a2, $zero
/* 3462C 80046A0C 21404000 */  addu       $t0, $v0, $zero
/* 34630 80046A10 00140400 */  sll        $v0, $a0, 16
/* 34634 80046A14 033C0200 */  sra        $a3, $v0, 16
/* 34638 80046A18 21206000 */  addu       $a0, $v1, $zero
.L80046A1C:
/* 3463C 80046A1C 00140500 */  sll        $v0, $a1, 16
/* 34640 80046A20 03140200 */  sra        $v0, $v0, 16
/* 34644 80046A24 40180200 */  sll        $v1, $v0, 1
/* 34648 80046A28 21186200 */  addu       $v1, $v1, $v0
/* 3464C 80046A2C 80180300 */  sll        $v1, $v1, 2
/* 34650 80046A30 21186200 */  addu       $v1, $v1, $v0
/* 34654 80046A34 80180300 */  sll        $v1, $v1, 2
/* 34658 80046A38 21186800 */  addu       $v1, $v1, $t0
/* 3465C 80046A3C 58006284 */  lh         $v0, 0x58($v1)
/* 34660 80046A40 00000000 */  nop
/* 34664 80046A44 02004714 */  bne        $v0, $a3, .L80046A50
/* 34668 80046A48 0100A224 */   addiu     $v0, $a1, 0x1
/* 3466C 80046A4C 0100C624 */  addiu      $a2, $a2, 0x1
.L80046A50:
/* 34670 80046A50 21284000 */  addu       $a1, $v0, $zero
/* 34674 80046A54 00140200 */  sll        $v0, $v0, 16
/* 34678 80046A58 03140200 */  sra        $v0, $v0, 16
/* 3467C 80046A5C 2A104400 */  slt        $v0, $v0, $a0
/* 34680 80046A60 EEFF4014 */  bnez       $v0, .L80046A1C
/* 34684 80046A64 00000000 */   nop
.L80046A68:
/* 34688 80046A68 00140600 */  sll        $v0, $a2, 16
/* 3468C 80046A6C 0800E003 */  jr         $ra
/* 34690 80046A70 03140200 */   sra       $v0, $v0, 16
.size RefreshCard_BoolGhostForLEV, . - RefreshCard_BoolGhostForLEV
