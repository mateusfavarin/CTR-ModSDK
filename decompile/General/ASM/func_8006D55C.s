.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_8006D55C
/* 5B17C 8006D55C 48002980 */  lb         $t1, 0x48($at)
.L8006D560:
/* 5B180 8006D560 07000005 */  bltz       $t0, .L8006D580
/* 5B184 8006D564 4C00238C */   lw        $v1, 0x4C($at)
/* 5B188 8006D568 06702E01 */  srlv       $t6, $t6, $t1
/* 5B18C 8006D56C 06782F01 */  srlv       $t7, $t7, $t1
/* 5B190 8006D570 06803001 */  srlv       $s0, $s0, $t1
/* 5B194 8006D574 2470C301 */  and        $t6, $t6, $v1
/* 5B198 8006D578 2478E301 */  and        $t7, $t7, $v1
/* 5B19C 8006D57C 24800302 */  and        $s0, $s0, $v1
.L8006D580:
/* 5B1A0 8006D580 0800A002 */  jr         $s5
/* 5B1A4 8006D584 00000000 */   nop
/* 5B1A8 8006D588 48002980 */  lb         $t1, 0x48($at)
/* 5B1AC 8006D58C 08000105 */  bgez       $t0, .L8006D5B0
/* 5B1B0 8006D590 0801288C */   lw        $t0, 0x108($at)
/* 5B1B4 8006D594 F2FF0104 */  bgez       $zero, .L8006D560
/* 5B1B8 8006D598 00000000 */   nop
/* 5B1BC 8006D59C 48002980 */  lb         $t1, 0x48($at)
/* 5B1C0 8006D5A0 00000000 */  nop
/* 5B1C4 8006D5A4 26400901 */  xor        $t0, $t0, $t1
/* 5B1C8 8006D5A8 F5FF0105 */  bgez       $t0, .L8006D580
/* 5B1CC 8006D5AC 00000000 */   nop
.L8006D5B0:
/* 5B1D0 8006D5B0 0800E003 */  jr         $ra
/* 5B1D4 8006D5B4 00000000 */   nop
.size func_8006D55C, . - func_8006D55C
