.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel OtherFX_RecycleMute
/* 1C344 8002E724 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1C348 8002E728 1000B0AF */  sw         $s0, 0x10($sp)
/* 1C34C 8002E72C 21808000 */  addu       $s0, $a0, $zero
/* 1C350 8002E730 1400BFAF */  sw         $ra, 0x14($sp)
/* 1C354 8002E734 0000048E */  lw         $a0, 0x0($s0)
/* 1C358 8002E738 00000000 */  nop
/* 1C35C 8002E73C 04008010 */  beqz       $a0, .L8002E750
/* 1C360 8002E740 00000000 */   nop
/* 1C364 8002E744 02A2000C */  jal        DECOMP_OtherFX_Stop1
/* 1C368 8002E748 00000000 */   nop
/* 1C36C 8002E74C 000000AE */  sw         $zero, 0x0($s0)
.L8002E750:
/* 1C370 8002E750 1400BF8F */  lw         $ra, 0x14($sp)
/* 1C374 8002E754 1000B08F */  lw         $s0, 0x10($sp)
/* 1C378 8002E758 0800E003 */  jr         $ra
/* 1C37C 8002E75C 1800BD27 */   addiu     $sp, $sp, 0x18
.size OtherFX_RecycleMute, . - OtherFX_RecycleMute
