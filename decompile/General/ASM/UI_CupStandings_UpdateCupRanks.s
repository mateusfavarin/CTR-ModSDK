.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel UI_CupStandings_UpdateCupRanks
/* 43E40 80056220 21480000 */  addu       $t1, $zero, $zero
/* 43E44 80056224 FFFF0724 */  addiu      $a3, $zero, -0x1
/* 43E48 80056228 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 43E4C 8005622C ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 43E50 80056230 21302001 */  addu       $a2, $t1, $zero
/* 43E54 80056234 A81C8390 */  lbu        $v1, 0x1CA8($a0)
/* 43E58 80056238 AB1C8290 */  lbu        $v0, 0x1CAB($a0)
/* 43E5C 8005623C 00000000 */  nop
/* 43E60 80056240 21104300 */  addu       $v0, $v0, $v1
/* 43E64 80056244 2B004010 */  beqz       $v0, .L800562F4
/* 43E68 80056248 21400000 */   addu      $t0, $zero, $zero
/* 43E6C 8005624C 21504000 */  addu       $t2, $v0, $zero
/* 43E70 80056250 21688000 */  addu       $t5, $a0, $zero
/* 43E74 80056254 FFFF0C24 */  addiu      $t4, $zero, -0x1
/* 43E78 80056258 01000B24 */  addiu      $t3, $zero, 0x1
.L8005625C:
/* 43E7C 8005625C FFFF4425 */  addiu      $a0, $t2, -0x1
/* 43E80 80056260 18008004 */  bltz       $a0, .L800562C4
/* 43E84 80056264 80100400 */   sll       $v0, $a0, 2
/* 43E88 80056268 21284D00 */  addu       $a1, $v0, $t5
.L8005626C:
/* 43E8C 8005626C 00140900 */  sll        $v0, $t1, 16
/* 43E90 80056270 601EA38C */  lw         $v1, 0x1E60($a1)
/* 43E94 80056274 03140200 */  sra        $v0, $v0, 16
/* 43E98 80056278 2A186200 */  slt        $v1, $v1, $v0
/* 43E9C 8005627C 0E006014 */  bnez       $v1, .L800562B8
/* 43EA0 80056280 FF00C230 */   andi      $v0, $a2, 0xFF
/* 43EA4 80056284 07108200 */  srav       $v0, $v0, $a0
/* 43EA8 80056288 01004230 */  andi       $v0, $v0, 0x1
/* 43EAC 8005628C 0A004014 */  bnez       $v0, .L800562B8
/* 43EB0 80056290 00140700 */   sll       $v0, $a3, 16
/* 43EB4 80056294 601EA994 */  lhu        $t1, 0x1E60($a1)
/* 43EB8 80056298 03140200 */  sra        $v0, $v0, 16
/* 43EBC 8005629C 03004C10 */  beq        $v0, $t4, .L800562AC
/* 43EC0 800562A0 04104B00 */   sllv      $v0, $t3, $v0
/* 43EC4 800562A4 27100200 */  nor        $v0, $zero, $v0
/* 43EC8 800562A8 2430C200 */  and        $a2, $a2, $v0
.L800562AC:
/* 43ECC 800562AC 21388000 */  addu       $a3, $a0, $zero
/* 43ED0 800562B0 04108B00 */  sllv       $v0, $t3, $a0
/* 43ED4 800562B4 2530C200 */  or         $a2, $a2, $v0
.L800562B8:
/* 43ED8 800562B8 FFFF8424 */  addiu      $a0, $a0, -0x1
/* 43EDC 800562BC EBFF8104 */  bgez       $a0, .L8005626C
/* 43EE0 800562C0 FCFFA524 */   addiu     $a1, $a1, -0x4
.L800562C4:
/* 43EE4 800562C4 0880023C */  lui        $v0, %hi(D_80086D44)
/* 43EE8 800562C8 446D4224 */  addiu      $v0, $v0, %lo(D_80086D44)
/* 43EEC 800562CC 80180800 */  sll        $v1, $t0, 2
/* 43EF0 800562D0 21186200 */  addu       $v1, $v1, $v0
/* 43EF4 800562D4 00140700 */  sll        $v0, $a3, 16
/* 43EF8 800562D8 03140200 */  sra        $v0, $v0, 16
/* 43EFC 800562DC 000062AC */  sw         $v0, 0x0($v1)
/* 43F00 800562E0 21480000 */  addu       $t1, $zero, $zero
/* 43F04 800562E4 01000825 */  addiu      $t0, $t0, 0x1
/* 43F08 800562E8 2A100A01 */  slt        $v0, $t0, $t2
/* 43F0C 800562EC DBFF4014 */  bnez       $v0, .L8005625C
/* 43F10 800562F0 FFFF0724 */   addiu     $a3, $zero, -0x1
.L800562F4:
/* 43F14 800562F4 0800E003 */  jr         $ra
/* 43F18 800562F8 00000000 */   nop
.size UI_CupStandings_UpdateCupRanks, . - UI_CupStandings_UpdateCupRanks
