.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel MainFrame_HaveAllPads
/* 23990 80035D70 8C01838F */  lw         $v1, 0x18C($gp) /* Failed to symbolize address 0x0000018C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 23994 80035D74 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 23998 80035D78 03006210 */  beq        $v1, $v0, .L80035D88
/* 2399C 80035D7C 01000524 */   addiu     $a1, $zero, 0x1
/* 239A0 80035D80 0800E003 */  jr         $ra
/* 239A4 80035D84 01000224 */   addiu     $v0, $zero, 0x1
.L80035D88:
/* 239A8 80035D88 00140400 */  sll        $v0, $a0, 16
/* 239AC 80035D8C 03140200 */  sra        $v0, $v0, 16
/* 239B0 80035D90 1F004010 */  beqz       $v0, .L80035E10
/* 239B4 80035D94 00000000 */   nop
/* 239B8 80035D98 1E004018 */  blez       $v0, .L80035E14
/* 239BC 80035D9C 21300000 */   addu      $a2, $zero, $zero
/* 239C0 80035DA0 4403888F */  lw         $t0, 0x344($gp) /* Failed to symbolize address 0x00000344 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 239C4 80035DA4 21384000 */  addu       $a3, $v0, $zero
.L80035DA8:
/* 239C8 80035DA8 00140500 */  sll        $v0, $a1, 16
/* 239CC 80035DAC 0F004010 */  beqz       $v0, .L80035DEC
/* 239D0 80035DB0 21200000 */   addu      $a0, $zero, $zero
/* 239D4 80035DB4 001C0600 */  sll        $v1, $a2, 16
/* 239D8 80035DB8 031C0300 */  sra        $v1, $v1, 16
/* 239DC 80035DBC 80100300 */  sll        $v0, $v1, 2
/* 239E0 80035DC0 21104300 */  addu       $v0, $v0, $v1
/* 239E4 80035DC4 00110200 */  sll        $v0, $v0, 4
/* 239E8 80035DC8 21100201 */  addu       $v0, $t0, $v0
/* 239EC 80035DCC 2000428C */  lw         $v0, 0x20($v0)
/* 239F0 80035DD0 00000000 */  nop
/* 239F4 80035DD4 05004010 */  beqz       $v0, .L80035DEC
/* 239F8 80035DD8 00000000 */   nop
/* 239FC 80035DDC 00004290 */  lbu        $v0, 0x0($v0)
/* 23A00 80035DE0 00000000 */  nop
/* 23A04 80035DE4 0100422C */  sltiu      $v0, $v0, 0x1
/* 23A08 80035DE8 21204000 */  addu       $a0, $v0, $zero
.L80035DEC:
/* 23A0C 80035DEC 0100C224 */  addiu      $v0, $a2, 0x1
/* 23A10 80035DF0 21304000 */  addu       $a2, $v0, $zero
/* 23A14 80035DF4 00140200 */  sll        $v0, $v0, 16
/* 23A18 80035DF8 03140200 */  sra        $v0, $v0, 16
/* 23A1C 80035DFC 2A104700 */  slt        $v0, $v0, $a3
/* 23A20 80035E00 E9FF4014 */  bnez       $v0, .L80035DA8
/* 23A24 80035E04 21288000 */   addu      $a1, $a0, $zero
/* 23A28 80035E08 86D70008 */  j          .L80035E18
/* 23A2C 80035E0C 00140500 */   sll       $v0, $a1, 16
.L80035E10:
/* 23A30 80035E10 21280000 */  addu       $a1, $zero, $zero
.L80035E14:
/* 23A34 80035E14 00140500 */  sll        $v0, $a1, 16
.L80035E18:
/* 23A38 80035E18 0800E003 */  jr         $ra
/* 23A3C 80035E1C 03140200 */   sra       $v0, $v0, 16
.size MainFrame_HaveAllPads, . - MainFrame_HaveAllPads
