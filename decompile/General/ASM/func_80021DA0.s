.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_80021DA0
/* F9C0 80021DA0 81870008 */  j          .L80021E04
/* F9C4 80021DA4 00000000 */   nop
.L80021DA8:
/* F9C8 80021DA8 03160200 */  sra        $v0, $v0, 24
/* F9CC 80021DAC 0D004104 */  bgez       $v0, .L80021DE4
/* F9D0 80021DB0 21184000 */   addu      $v1, $v0, $zero
/* F9D4 80021DB4 23100200 */  negu       $v0, $v0
/* F9D8 80021DB8 01004324 */  addiu      $v1, $v0, 0x1
/* F9DC 80021DBC 0100A524 */  addiu      $a1, $a1, 0x1
/* F9E0 80021DC0 0000A290 */  lbu        $v0, 0x0($a1)
/* F9E4 80021DC4 0F006010 */  beqz       $v1, .L80021E04
/* F9E8 80021DC8 0100A524 */   addiu     $a1, $a1, 0x1
.L80021DCC:
/* F9EC 80021DCC 000082A0 */  sb         $v0, 0x0($a0)
/* F9F0 80021DD0 FFFF6324 */  addiu      $v1, $v1, -0x1
/* F9F4 80021DD4 FDFF6014 */  bnez       $v1, .L80021DCC
/* F9F8 80021DD8 01008424 */   addiu     $a0, $a0, 0x1
/* F9FC 80021DDC 81870008 */  j          .L80021E04
/* FA00 80021DE0 00000000 */   nop
.L80021DE4:
/* FA04 80021DE4 07006010 */  beqz       $v1, .L80021E04
/* FA08 80021DE8 0100A524 */   addiu     $a1, $a1, 0x1
.L80021DEC:
/* FA0C 80021DEC 0000A290 */  lbu        $v0, 0x0($a1)
/* FA10 80021DF0 0100A524 */  addiu      $a1, $a1, 0x1
/* FA14 80021DF4 FFFF6324 */  addiu      $v1, $v1, -0x1
/* FA18 80021DF8 000082A0 */  sb         $v0, 0x0($a0)
/* FA1C 80021DFC FBFF6014 */  bnez       $v1, .L80021DEC
/* FA20 80021E00 01008424 */   addiu     $a0, $a0, 0x1
.L80021E04:
/* FA24 80021E04 0000A280 */  lb         $v0, 0x0($a1)
/* FA28 80021E08 0000A390 */  lbu        $v1, 0x0($a1)
/* FA2C 80021E0C E6FF4014 */  bnez       $v0, .L80021DA8
/* FA30 80021E10 00160300 */   sll       $v0, $v1, 24
/* FA34 80021E14 0800E003 */  jr         $ra
/* FA38 80021E18 00000000 */   nop
.size func_80021DA0, . - func_80021DA0
