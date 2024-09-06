.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_8006D4A4
/* 5B0C4 8006D4A4 02000A85 */  lh         $t2, 0x2($t0)
/* 5B0C8 8006D4A8 02002585 */  lh         $a1, 0x2($t1)
/* 5B0CC 8006D4AC 0E000685 */  lh         $a2, 0xE($t0)
/* 5B0D0 8006D4B0 2328AA00 */  subu       $a1, $a1, $t2
/* 5B0D4 8006D4B4 00340600 */  sll        $a2, $a2, 16
/* 5B0D8 8006D4B8 50002A8C */  lw         $t2, 0x50($at)
/* 5B0DC 8006D4BC 1A00C500 */  div        $zero, $a2, $a1
/* 5B0E0 8006D4C0 13004011 */  beqz       $t2, .L8006D510
/* 5B0E4 8006D4C4 12280000 */   mflo      $a1
/* 5B0E8 8006D4C8 0C000A91 */  lbu        $t2, 0xC($t0)
/* 5B0EC 8006D4CC 0C002691 */  lbu        $a2, 0xC($t1)
/* 5B0F0 8006D4D0 00000000 */  nop
/* 5B0F4 8006D4D4 2330CA00 */  subu       $a2, $a2, $t2
/* 5B0F8 8006D4D8 1800C500 */  mult       $a2, $a1
/* 5B0FC 8006D4DC 12300000 */  mflo       $a2
/* 5B100 8006D4E0 03340600 */  sra        $a2, $a2, 16
/* 5B104 8006D4E4 2130CA00 */  addu       $a2, $a2, $t2
/* 5B108 8006D4E8 0C0066A0 */  sb         $a2, 0xC($v1)
/* 5B10C 8006D4EC 0D000A91 */  lbu        $t2, 0xD($t0)
/* 5B110 8006D4F0 0D002691 */  lbu        $a2, 0xD($t1)
/* 5B114 8006D4F4 00000000 */  nop
/* 5B118 8006D4F8 2330CA00 */  subu       $a2, $a2, $t2
/* 5B11C 8006D4FC 1800C500 */  mult       $a2, $a1
/* 5B120 8006D500 12300000 */  mflo       $a2
/* 5B124 8006D504 03340600 */  sra        $a2, $a2, 16
/* 5B128 8006D508 2130CA00 */  addu       $a2, $a2, $t2
/* 5B12C 8006D50C 0D0066A0 */  sb         $a2, 0xD($v1)
.L8006D510:
/* 5B130 8006D510 00000A85 */  lh         $t2, 0x0($t0)
/* 5B134 8006D514 00002685 */  lh         $a2, 0x0($t1)
/* 5B138 8006D518 00000000 */  nop
/* 5B13C 8006D51C 2330CA00 */  subu       $a2, $a2, $t2
/* 5B140 8006D520 1800C500 */  mult       $a2, $a1
/* 5B144 8006D524 12300000 */  mflo       $a2
/* 5B148 8006D528 03340600 */  sra        $a2, $a2, 16
/* 5B14C 8006D52C 2130CA00 */  addu       $a2, $a2, $t2
/* 5B150 8006D530 000066A4 */  sh         $a2, 0x0($v1)
/* 5B154 8006D534 04000A8D */  lw         $t2, 0x4($t0)
/* 5B158 8006D538 0400268D */  lw         $a2, 0x4($t1)
/* 5B15C 8006D53C 00000000 */  nop
/* 5B160 8006D540 2330CA00 */  subu       $a2, $a2, $t2
/* 5B164 8006D544 1800C500 */  mult       $a2, $a1
/* 5B168 8006D548 12300000 */  mflo       $a2
/* 5B16C 8006D54C 03340600 */  sra        $a2, $a2, 16
/* 5B170 8006D550 2130CA00 */  addu       $a2, $a2, $t2
/* 5B174 8006D554 0800E003 */  jr         $ra
/* 5B178 8006D558 040066AC */   sw        $a2, 0x4($v1)
.size func_8006D4A4, . - func_8006D4A4
