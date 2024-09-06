.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel SelectProfile_QueueLoadHub_MenuProc
/* 359C8 80047DA8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 359CC 80047DAC 1000B0AF */  sw         $s0, 0x10($sp)
/* 359D0 80047DB0 21808000 */  addu       $s0, $a0, $zero
/* 359D4 80047DB4 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 359D8 80047DB8 ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 359DC 80047DBC 27000224 */  addiu      $v0, $zero, 0x27
/* 359E0 80047DC0 1400BFAF */  sw         $ra, 0x14($sp)
/* 359E4 80047DC4 101A82AC */  sw         $v0, 0x1A10($a0)
/* 359E8 80047DC8 0980023C */  lui        $v0, %hi(D_8008FBCE)
/* 359EC 80047DCC CEFB4394 */  lhu        $v1, %lo(D_8008FBCE)($v0)
/* 359F0 80047DD0 0880023C */  lui        $v0, %hi(D_80086E84)
/* 359F4 80047DD4 846E43A4 */  sh         $v1, %lo(D_80086E84)($v0)
/* 359F8 80047DD8 B01E8484 */  lh         $a0, 0x1EB0($a0)
/* 359FC 80047DDC F0F3000C */  jal        DECOMP_MainRaceTrack_RequestLoad
/* 35A00 80047DE0 00000000 */   nop
/* 35A04 80047DE4 721A010C */  jal        DECOMP_RECTMENU_Hide
/* 35A08 80047DE8 21200002 */   addu      $a0, $s0, $zero
/* 35A0C 80047DEC 1400BF8F */  lw         $ra, 0x14($sp)
/* 35A10 80047DF0 1000B08F */  lw         $s0, 0x10($sp)
/* 35A14 80047DF4 0800E003 */  jr         $ra
/* 35A18 80047DF8 1800BD27 */   addiu     $sp, $sp, 0x18
.size SelectProfile_QueueLoadHub_MenuProc, . - SelectProfile_QueueLoadHub_MenuProc
