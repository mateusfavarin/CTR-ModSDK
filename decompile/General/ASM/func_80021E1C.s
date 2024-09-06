.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_80021E1C
/* FA3C 80021E1C A4870008 */  j          .L80021E90
/* FA40 80021E20 00000000 */   nop
.L80021E24:
/* FA44 80021E24 03160200 */  sra        $v0, $v0, 24
/* FA48 80021E28 0F004104 */  bgez       $v0, .L80021E68
/* FA4C 80021E2C 21304000 */   addu      $a2, $v0, $zero
/* FA50 80021E30 23100200 */  negu       $v0, $v0
/* FA54 80021E34 01004624 */  addiu      $a2, $v0, 0x1
/* FA58 80021E38 0100A524 */  addiu      $a1, $a1, 0x1
/* FA5C 80021E3C 0000A390 */  lbu        $v1, 0x0($a1)
/* FA60 80021E40 1300C010 */  beqz       $a2, .L80021E90
/* FA64 80021E44 0100A524 */   addiu     $a1, $a1, 0x1
.L80021E48:
/* FA68 80021E48 00008290 */  lbu        $v0, 0x0($a0)
/* FA6C 80021E4C FFFFC624 */  addiu      $a2, $a2, -0x1
/* FA70 80021E50 25104300 */  or         $v0, $v0, $v1
/* FA74 80021E54 000082A0 */  sb         $v0, 0x0($a0)
/* FA78 80021E58 FBFFC014 */  bnez       $a2, .L80021E48
/* FA7C 80021E5C 01008424 */   addiu     $a0, $a0, 0x1
/* FA80 80021E60 A4870008 */  j          .L80021E90
/* FA84 80021E64 00000000 */   nop
.L80021E68:
/* FA88 80021E68 0900C010 */  beqz       $a2, .L80021E90
/* FA8C 80021E6C 0100A524 */   addiu     $a1, $a1, 0x1
.L80021E70:
/* FA90 80021E70 0000A390 */  lbu        $v1, 0x0($a1)
/* FA94 80021E74 0100A524 */  addiu      $a1, $a1, 0x1
/* FA98 80021E78 00008290 */  lbu        $v0, 0x0($a0)
/* FA9C 80021E7C FFFFC624 */  addiu      $a2, $a2, -0x1
/* FAA0 80021E80 25104300 */  or         $v0, $v0, $v1
/* FAA4 80021E84 000082A0 */  sb         $v0, 0x0($a0)
/* FAA8 80021E88 F9FFC014 */  bnez       $a2, .L80021E70
/* FAAC 80021E8C 01008424 */   addiu     $a0, $a0, 0x1
.L80021E90:
/* FAB0 80021E90 0000A280 */  lb         $v0, 0x0($a1)
/* FAB4 80021E94 0000A390 */  lbu        $v1, 0x0($a1)
/* FAB8 80021E98 E2FF4014 */  bnez       $v0, .L80021E24
/* FABC 80021E9C 00160300 */   sll       $v0, $v1, 24
/* FAC0 80021EA0 0800E003 */  jr         $ra
/* FAC4 80021EA4 00000000 */   nop
.size func_80021E1C, . - func_80021E1C
