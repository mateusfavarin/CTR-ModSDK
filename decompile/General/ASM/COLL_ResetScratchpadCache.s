.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel COLL_ResetScratchpadCache
/* D410 8001F7F0 0000288F */  lw         $t0, 0x0($t9)
/* D414 8001F7F4 0400298F */  lw         $t1, 0x4($t9)
/* D418 8001F7F8 FFFF0331 */  andi       $v1, $t0, 0xFFFF
/* D41C 8001F7FC 00190300 */  sll        $v1, $v1, 4
/* D420 8001F800 21187800 */  addu       $v1, $v1, $t8
/* D424 8001F804 00006B8C */  lw         $t3, 0x0($v1)
/* D428 8001F808 04006D8C */  lw         $t5, 0x4($v1)
/* D42C 8001F80C F0008BAC */  sw         $t3, 0xF0($a0)
/* D430 8001F810 F4008DAC */  sw         $t5, 0xF4($a0)
/* D434 8001F814 F80083AC */  sw         $v1, 0xF8($a0)
/* D438 8001F818 021C0800 */  srl        $v1, $t0, 16
/* D43C 8001F81C 00190300 */  sll        $v1, $v1, 4
/* D440 8001F820 21187800 */  addu       $v1, $v1, $t8
/* D444 8001F824 00006B8C */  lw         $t3, 0x0($v1)
/* D448 8001F828 04006D8C */  lw         $t5, 0x4($v1)
/* D44C 8001F82C 04018BAC */  sw         $t3, 0x104($a0)
/* D450 8001F830 08018DAC */  sw         $t5, 0x108($a0)
/* D454 8001F834 0C0183AC */  sw         $v1, 0x10C($a0)
/* D458 8001F838 EC0089AC */  sw         $t1, 0xEC($a0)
/* D45C 8001F83C 0800288F */  lw         $t0, 0x8($t9)
/* D460 8001F840 FFFF2331 */  andi       $v1, $t1, 0xFFFF
/* D464 8001F844 00190300 */  sll        $v1, $v1, 4
/* D468 8001F848 21187800 */  addu       $v1, $v1, $t8
/* D46C 8001F84C 00006B8C */  lw         $t3, 0x0($v1)
/* D470 8001F850 04006D8C */  lw         $t5, 0x4($v1)
/* D474 8001F854 18018BAC */  sw         $t3, 0x118($a0)
/* D478 8001F858 1C018DAC */  sw         $t5, 0x11C($a0)
/* D47C 8001F85C 200183AC */  sw         $v1, 0x120($a0)
/* D480 8001F860 021C0900 */  srl        $v1, $t1, 16
/* D484 8001F864 00190300 */  sll        $v1, $v1, 4
/* D488 8001F868 21187800 */  addu       $v1, $v1, $t8
/* D48C 8001F86C 00006B8C */  lw         $t3, 0x0($v1)
/* D490 8001F870 04006D8C */  lw         $t5, 0x4($v1)
/* D494 8001F874 2C018BAC */  sw         $t3, 0x12C($a0)
/* D498 8001F878 30018DAC */  sw         $t5, 0x130($a0)
/* D49C 8001F87C 340183AC */  sw         $v1, 0x134($a0)
/* D4A0 8001F880 0C00298F */  lw         $t1, 0xC($t9)
/* D4A4 8001F884 FFFF0331 */  andi       $v1, $t0, 0xFFFF
/* D4A8 8001F888 00190300 */  sll        $v1, $v1, 4
/* D4AC 8001F88C 21187800 */  addu       $v1, $v1, $t8
/* D4B0 8001F890 00006B8C */  lw         $t3, 0x0($v1)
/* D4B4 8001F894 04006D8C */  lw         $t5, 0x4($v1)
/* D4B8 8001F898 40018BAC */  sw         $t3, 0x140($a0)
/* D4BC 8001F89C 44018DAC */  sw         $t5, 0x144($a0)
/* D4C0 8001F8A0 480183AC */  sw         $v1, 0x148($a0)
/* D4C4 8001F8A4 021C0800 */  srl        $v1, $t0, 16
/* D4C8 8001F8A8 00190300 */  sll        $v1, $v1, 4
/* D4CC 8001F8AC 21187800 */  addu       $v1, $v1, $t8
/* D4D0 8001F8B0 00006B8C */  lw         $t3, 0x0($v1)
/* D4D4 8001F8B4 04006D8C */  lw         $t5, 0x4($v1)
/* D4D8 8001F8B8 54018BAC */  sw         $t3, 0x154($a0)
/* D4DC 8001F8BC 58018DAC */  sw         $t5, 0x158($a0)
/* D4E0 8001F8C0 5C0183AC */  sw         $v1, 0x15C($a0)
/* D4E4 8001F8C4 10002897 */  lhu        $t0, 0x10($t9)
/* D4E8 8001F8C8 FFFF2331 */  andi       $v1, $t1, 0xFFFF
/* D4EC 8001F8CC 00190300 */  sll        $v1, $v1, 4
/* D4F0 8001F8D0 21187800 */  addu       $v1, $v1, $t8
/* D4F4 8001F8D4 00006B8C */  lw         $t3, 0x0($v1)
/* D4F8 8001F8D8 04006D8C */  lw         $t5, 0x4($v1)
/* D4FC 8001F8DC 68018BAC */  sw         $t3, 0x168($a0)
/* D500 8001F8E0 6C018DAC */  sw         $t5, 0x16C($a0)
/* D504 8001F8E4 700183AC */  sw         $v1, 0x170($a0)
/* D508 8001F8E8 021C0900 */  srl        $v1, $t1, 16
/* D50C 8001F8EC 00190300 */  sll        $v1, $v1, 4
/* D510 8001F8F0 21187800 */  addu       $v1, $v1, $t8
/* D514 8001F8F4 00006B8C */  lw         $t3, 0x0($v1)
/* D518 8001F8F8 04006D8C */  lw         $t5, 0x4($v1)
/* D51C 8001F8FC 7C018BAC */  sw         $t3, 0x17C($a0)
/* D520 8001F900 80018DAC */  sw         $t5, 0x180($a0)
/* D524 8001F904 840183AC */  sw         $v1, 0x184($a0)
/* D528 8001F908 00190800 */  sll        $v1, $t0, 4
/* D52C 8001F90C 21187800 */  addu       $v1, $v1, $t8
/* D530 8001F910 00006B8C */  lw         $t3, 0x0($v1)
/* D534 8001F914 04006D8C */  lw         $t5, 0x4($v1)
/* D538 8001F918 90018BAC */  sw         $t3, 0x190($a0)
/* D53C 8001F91C 94018DAC */  sw         $t5, 0x194($a0)
/* D540 8001F920 0800E003 */  jr         $ra
/* D544 8001F924 980183AC */   sw        $v1, 0x198($a0)
.size COLL_ResetScratchpadCache, . - COLL_ResetScratchpadCache
