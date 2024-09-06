.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel Level_SoundLoopSet
/* 1C5E0 8002E9C0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1C5E4 8002E9C4 1000B0AF */  sw         $s0, 0x10($sp)
/* 1C5E8 8002E9C8 21808000 */  addu       $s0, $a0, $zero
/* 1C5EC 8002E9CC 0900C014 */  bnez       $a2, .L8002E9F4
/* 1C5F0 8002E9D0 1400BFAF */   sw        $ra, 0x14($sp)
/* 1C5F4 8002E9D4 0000048E */  lw         $a0, 0x0($s0)
/* 1C5F8 8002E9D8 00000000 */  nop
/* 1C5FC 8002E9DC 15008010 */  beqz       $a0, .L8002EA34
/* 1C600 8002E9E0 00000000 */   nop
/* 1C604 8002E9E4 02A2000C */  jal        DECOMP_OtherFX_Stop1
/* 1C608 8002E9E8 00000000 */   nop
/* 1C60C 8002E9EC 8DBA0008 */  j          .L8002EA34
/* 1C610 8002E9F0 000000AE */   sw        $zero, 0x0($s0)
.L8002E9F4:
/* 1C614 8002E9F4 0000048E */  lw         $a0, 0x0($s0)
/* 1C618 8002E9F8 00000000 */  nop
/* 1C61C 8002E9FC 09008014 */  bnez       $a0, .L8002EA24
/* 1C620 8002EA00 00000000 */   nop
/* 1C624 8002EA04 FFFFA430 */  andi       $a0, $a1, 0xFFFF
/* 1C628 8002EA08 21280000 */  addu       $a1, $zero, $zero
/* 1C62C 8002EA0C FF00C630 */  andi       $a2, $a2, 0xFF
/* 1C630 8002EA10 00340600 */  sll        $a2, $a2, 16
/* 1C634 8002EA14 34A1000C */  jal        DECOMP_OtherFX_Play_LowLevel
/* 1C638 8002EA18 8080C634 */   ori       $a2, $a2, 0x8080
/* 1C63C 8002EA1C 8DBA0008 */  j          .L8002EA34
/* 1C640 8002EA20 000002AE */   sw        $v0, 0x0($s0)
.L8002EA24:
/* 1C644 8002EA24 FF00C530 */  andi       $a1, $a2, 0xFF
/* 1C648 8002EA28 002C0500 */  sll        $a1, $a1, 16
/* 1C64C 8002EA2C A4A1000C */  jal        DECOMP_OtherFX_Modify
/* 1C650 8002EA30 8080A534 */   ori       $a1, $a1, 0x8080
.L8002EA34:
/* 1C654 8002EA34 1400BF8F */  lw         $ra, 0x14($sp)
/* 1C658 8002EA38 1000B08F */  lw         $s0, 0x10($sp)
/* 1C65C 8002EA3C 0800E003 */  jr         $ra
/* 1C660 8002EA40 1800BD27 */   addiu     $sp, $sp, 0x18
.size Level_SoundLoopSet, . - Level_SoundLoopSet
