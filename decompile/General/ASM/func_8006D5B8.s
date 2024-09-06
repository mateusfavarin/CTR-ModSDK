.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel func_8006D5B8
/* 5B1D8 8006D5B8 48002980 */  lb         $t1, 0x48($at)
/* 5B1DC 8006D5BC 7F00033C */  lui        $v1, (0x7F7F7F >> 16)
/* 5B1E0 8006D5C0 7F7F6334 */  ori        $v1, $v1, (0x7F7F7F & 0xFFFF)
/* 5B1E4 8006D5C4 26400901 */  xor        $t0, $t0, $t1
/* 5B1E8 8006D5C8 27000005 */  bltz       $t0, .L8006D668
/* 5B1EC 8006D5CC 42480E00 */   srl       $t1, $t6, 1
/* 5B1F0 8006D5D0 24482301 */  and        $t1, $t1, $v1
/* 5B1F4 8006D5D4 42700900 */  srl        $t6, $t1, 1
/* 5B1F8 8006D5D8 2470C301 */  and        $t6, $t6, $v1
/* 5B1FC 8006D5DC 2170C901 */  addu       $t6, $t6, $t1
/* 5B200 8006D5E0 42480F00 */  srl        $t1, $t7, 1
/* 5B204 8006D5E4 24482301 */  and        $t1, $t1, $v1
/* 5B208 8006D5E8 42780900 */  srl        $t7, $t1, 1
/* 5B20C 8006D5EC 2478E301 */  and        $t7, $t7, $v1
/* 5B210 8006D5F0 2178E901 */  addu       $t7, $t7, $t1
/* 5B214 8006D5F4 42481000 */  srl        $t1, $s0, 1
/* 5B218 8006D5F8 24482301 */  and        $t1, $t1, $v1
/* 5B21C 8006D5FC 42800900 */  srl        $s0, $t1, 1
/* 5B220 8006D600 24800302 */  and        $s0, $s0, $v1
/* 5B224 8006D604 21800902 */  addu       $s0, $s0, $t1
/* 5B228 8006D608 00600848 */  mfc2       $t0, $12 /* handwritten instruction */
/* 5B22C 8006D60C FFFF033C */  lui        $v1, (0xFFFF0000 >> 16)
/* 5B230 8006D610 FFFF0931 */  andi       $t1, $t0, 0xFFFF
/* 5B234 8006D614 24400301 */  and        $t0, $t0, $v1
/* 5B238 8006D618 03002925 */  addiu      $t1, $t1, 0x3
/* 5B23C 8006D61C FFFF2931 */  andi       $t1, $t1, 0xFFFF
/* 5B240 8006D620 25400901 */  or         $t0, $t0, $t1
/* 5B244 8006D624 00608848 */  mtc2       $t0, $12 /* handwritten instruction */
/* 5B248 8006D628 00680848 */  mfc2       $t0, $13 /* handwritten instruction */
/* 5B24C 8006D62C 00000000 */  nop
/* 5B250 8006D630 FFFF0931 */  andi       $t1, $t0, 0xFFFF
/* 5B254 8006D634 24400301 */  and        $t0, $t0, $v1
/* 5B258 8006D638 03002925 */  addiu      $t1, $t1, 0x3
/* 5B25C 8006D63C FFFF2931 */  andi       $t1, $t1, 0xFFFF
/* 5B260 8006D640 25400901 */  or         $t0, $t0, $t1
/* 5B264 8006D644 00688848 */  mtc2       $t0, $13 /* handwritten instruction */
/* 5B268 8006D648 00700848 */  mfc2       $t0, $14 /* handwritten instruction */
/* 5B26C 8006D64C 00000000 */  nop
/* 5B270 8006D650 FFFF0931 */  andi       $t1, $t0, 0xFFFF
/* 5B274 8006D654 24400301 */  and        $t0, $t0, $v1
/* 5B278 8006D658 03002925 */  addiu      $t1, $t1, 0x3
/* 5B27C 8006D65C FFFF2931 */  andi       $t1, $t1, 0xFFFF
/* 5B280 8006D660 25400901 */  or         $t0, $t0, $t1
/* 5B284 8006D664 00708848 */  mtc2       $t0, $14 /* handwritten instruction */
.L8006D668:
/* 5B288 8006D668 0800A002 */  jr         $s5
/* 5B28C 8006D66C 00000000 */   nop
.size func_8006D5B8, . - func_8006D5B8
