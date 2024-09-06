.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel Timer_GetTime_Elapsed
/* 3903C 8004B41C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 39040 8004B420 1400B1AF */  sw         $s1, 0x14($sp)
/* 39044 8004B424 21888000 */  addu       $s1, $a0, $zero
/* 39048 8004B428 1000B0AF */  sw         $s0, 0x10($sp)
/* 3904C 8004B42C 1800BFAF */  sw         $ra, 0x18($sp)
/* 39050 8004B430 E92C010C */  jal        Timer_GetTime_Total
/* 39054 8004B434 2180A000 */   addu      $s0, $a1, $zero
/* 39058 8004B438 02000012 */  beqz       $s0, .L8004B444
/* 3905C 8004B43C 21184000 */   addu      $v1, $v0, $zero
/* 39060 8004B440 000003AE */  sw         $v1, 0x0($s0)
.L8004B444:
/* 39064 8004B444 2A107100 */  slt        $v0, $v1, $s1
/* 39068 8004B448 03004010 */  beqz       $v0, .L8004B458
/* 3906C 8004B44C 0C00023C */   lui       $v0, (0xC7E18 >> 16)
/* 39070 8004B450 187E4234 */  ori        $v0, $v0, (0xC7E18 & 0xFFFF)
/* 39074 8004B454 21186200 */  addu       $v1, $v1, $v0
.L8004B458:
/* 39078 8004B458 23107100 */  subu       $v0, $v1, $s1
/* 3907C 8004B45C 1800BF8F */  lw         $ra, 0x18($sp)
/* 39080 8004B460 1400B18F */  lw         $s1, 0x14($sp)
/* 39084 8004B464 1000B08F */  lw         $s0, 0x10($sp)
/* 39088 8004B468 0800E003 */  jr         $ra
/* 3908C 8004B46C 2000BD27 */   addiu     $sp, $sp, 0x20
.size Timer_GetTime_Elapsed, . - Timer_GetTime_Elapsed
