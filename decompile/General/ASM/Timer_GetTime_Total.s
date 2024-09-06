.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel Timer_GetTime_Total
/* 38FC4 8004B3A4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 38FC8 8004B3A8 00F2043C */  lui        $a0, (0xF2000001 >> 16)
/* 38FCC 8004B3AC 1000B0AF */  sw         $s0, 0x10($sp)
/* 38FD0 8004B3B0 1C0A908F */  lw         $s0, 0xA1C($gp) /* Failed to symbolize address 0x00000A1C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 38FD4 8004B3B4 1400BFAF */  sw         $ra, 0x14($sp)
/* 38FD8 8004B3B8 F9DE010C */  jal        GetRCnt
/* 38FDC 8004B3BC 01008434 */   ori       $a0, $a0, (0xF2000001 & 0xFFFF)
/* 38FE0 8004B3C0 21184000 */  addu       $v1, $v0, $zero
/* 38FE4 8004B3C4 64006228 */  slti       $v0, $v1, 0x64
/* 38FE8 8004B3C8 04004010 */  beqz       $v0, .L8004B3DC
/* 38FEC 8004B3CC 21800302 */   addu      $s0, $s0, $v1
/* 38FF0 8004B3D0 1C0A908F */  lw         $s0, 0xA1C($gp) /* Failed to symbolize address 0x00000A1C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 38FF4 8004B3D4 00000000 */  nop
/* 38FF8 8004B3D8 21800302 */  addu       $s0, $s0, $v1
.L8004B3DC:
/* 38FFC 8004B3DC F831033C */  lui        $v1, (0x31F86329 >> 16)
/* 39000 8004B3E0 29636334 */  ori        $v1, $v1, (0x31F86329 & 0xFFFF)
/* 39004 8004B3E4 40111000 */  sll        $v0, $s0, 5
/* 39008 8004B3E8 23105000 */  subu       $v0, $v0, $s0
/* 3900C 8004B3EC 80100200 */  sll        $v0, $v0, 2
/* 39010 8004B3F0 21105000 */  addu       $v0, $v0, $s0
/* 39014 8004B3F4 C0100200 */  sll        $v0, $v0, 3
/* 39018 8004B3F8 18004300 */  mult       $v0, $v1
/* 3901C 8004B3FC C3170200 */  sra        $v0, $v0, 31
/* 39020 8004B400 1400BF8F */  lw         $ra, 0x14($sp)
/* 39024 8004B404 1000B08F */  lw         $s0, 0x10($sp)
/* 39028 8004B408 10280000 */  mfhi       $a1
/* 3902C 8004B40C 831A0500 */  sra        $v1, $a1, 10
/* 39030 8004B410 23106200 */  subu       $v0, $v1, $v0
/* 39034 8004B414 0800E003 */  jr         $ra
/* 39038 8004B418 1800BD27 */   addiu     $sp, $sp, 0x18
.size Timer_GetTime_Total, . - Timer_GetTime_Total
