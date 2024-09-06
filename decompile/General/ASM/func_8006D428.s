.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_8006D428
/* 5B048 8006D428 88003FAC */  sw         $ra, 0x88($at)
/* 5B04C 8006D42C 29B5010C */  jal        func_8006D4A4
/* 5B050 8006D430 00000000 */   nop
/* 5B054 8006D434 08000A91 */  lbu        $t2, 0x8($t0)
/* 5B058 8006D438 08002691 */  lbu        $a2, 0x8($t1)
/* 5B05C 8006D43C 88003F8C */  lw         $ra, 0x88($at)
/* 5B060 8006D440 2330CA00 */  subu       $a2, $a2, $t2
/* 5B064 8006D444 1800C500 */  mult       $a2, $a1
/* 5B068 8006D448 12300000 */  mflo       $a2
/* 5B06C 8006D44C 03340600 */  sra        $a2, $a2, 16
/* 5B070 8006D450 2130CA00 */  addu       $a2, $a2, $t2
/* 5B074 8006D454 080066A0 */  sb         $a2, 0x8($v1)
/* 5B078 8006D458 09000A91 */  lbu        $t2, 0x9($t0)
/* 5B07C 8006D45C 09002691 */  lbu        $a2, 0x9($t1)
/* 5B080 8006D460 00000000 */  nop
/* 5B084 8006D464 2330CA00 */  subu       $a2, $a2, $t2
/* 5B088 8006D468 1800C500 */  mult       $a2, $a1
/* 5B08C 8006D46C 12300000 */  mflo       $a2
/* 5B090 8006D470 03340600 */  sra        $a2, $a2, 16
/* 5B094 8006D474 2130CA00 */  addu       $a2, $a2, $t2
/* 5B098 8006D478 090066A0 */  sb         $a2, 0x9($v1)
/* 5B09C 8006D47C 0A000A91 */  lbu        $t2, 0xA($t0)
/* 5B0A0 8006D480 0A002691 */  lbu        $a2, 0xA($t1)
/* 5B0A4 8006D484 00000000 */  nop
/* 5B0A8 8006D488 2330CA00 */  subu       $a2, $a2, $t2
/* 5B0AC 8006D48C 1800C500 */  mult       $a2, $a1
/* 5B0B0 8006D490 12300000 */  mflo       $a2
/* 5B0B4 8006D494 03340600 */  sra        $a2, $a2, 16
/* 5B0B8 8006D498 2130CA00 */  addu       $a2, $a2, $t2
/* 5B0BC 8006D49C 0800E003 */  jr         $ra
/* 5B0C0 8006D4A0 0A0066A0 */   sb        $a2, 0xA($v1)
.size func_8006D428, . - func_8006D428
