.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel RenderBucket_DrawInstPrim_Ghost
/* 5B290 8006D670 2C002B8C */  lw         $t3, 0x2C($at)
/* 5B294 8006D674 3800258C */  lw         $a1, 0x38($at)
/* 5B298 8006D678 425C0B00 */  srl        $t3, $t3, 17
/* 5B29C 8006D67C 80580B00 */  sll        $t3, $t3, 2
/* 5B2A0 8006D680 21586501 */  addu       $t3, $t3, $a1
/* 5B2A4 8006D684 20012A8C */  lw         $t2, 0x120($at)
/* 5B2A8 8006D688 5000268C */  lw         $a2, 0x50($at)
/* 5B2AC 8006D68C 00A08E48 */  mtc2       $t6, $20 /* handwritten instruction */
/* 5B2B0 8006D690 00A88F48 */  mtc2       $t7, $21 /* handwritten instruction */
/* 5B2B4 8006D694 00B09048 */  mtc2       $s0, $22 /* handwritten instruction */
/* 5B2B8 8006D698 00408A48 */  mtc2       $t2, $8 /* handwritten instruction */
/* 5B2BC 8006D69C CAF54011 */  beqz       $t2, .L8006ADC8
/* 5B2C0 8006D6A0 00000000 */   nop
/* 5B2C4 8006D6A4 2A00F84A */  DPCT
/* 5B2C8 8006D6A8 00E1083C */  lui        $t0, (0xE1000A40 >> 16)
/* 5B2CC 8006D6AC 400A0835 */  ori        $t0, $t0, (0xE1000A40 & 0xFFFF)
/* 5B2D0 8006D6B0 040048AC */  sw         $t0, 0x4($v0)
/* 5B2D4 8006D6B4 080040AC */  sw         $zero, 0x8($v0)
/* 5B2D8 8006D6B8 2401238C */  lw         $v1, 0x124($at)
/* 5B2DC 8006D6BC 10004CE8 */  swc2       $12, 0x10($v0)
/* 5B2E0 8006D6C0 14004DE8 */  swc2       $13, 0x14($v0)
/* 5B2E4 8006D6C4 0C0043AC */  sw         $v1, 0xC($v0)
/* 5B2E8 8006D6C8 1700C014 */  bnez       $a2, .L8006D728
/* 5B2EC 8006D6CC 18004EE8 */   swc2      $14, 0x18($v0)
/* 5B2F0 8006D6D0 00E1083C */  lui        $t0, (0xE1000A20 >> 16)
/* 5B2F4 8006D6D4 200A0835 */  ori        $t0, $t0, (0xE1000A20 & 0xFFFF)
/* 5B2F8 8006D6D8 1C0048AC */  sw         $t0, 0x1C($v0)
/* 5B2FC 8006D6DC 200040AC */  sw         $zero, 0x20($v0)
/* 5B300 8006D6E0 00A00848 */  mfc2       $t0, $20 /* handwritten instruction */
/* 5B304 8006D6E4 0032033C */  lui        $v1, (0x32000000 >> 16)
/* 5B308 8006D6E8 25186800 */  or         $v1, $v1, $t0
/* 5B30C 8006D6EC 240043AC */  sw         $v1, 0x24($v0)
/* 5B310 8006D6F0 28004CE8 */  swc2       $12, 0x28($v0)
/* 5B314 8006D6F4 2C0055E8 */  swc2       $21, 0x2C($v0)
/* 5B318 8006D6F8 30004DE8 */  swc2       $13, 0x30($v0)
/* 5B31C 8006D6FC 340056E8 */  swc2       $22, 0x34($v0)
/* 5B320 8006D700 38004EE8 */  swc2       $14, 0x38($v0)
/* 5B324 8006D704 0000638D */  lw         $v1, 0x0($t3)
/* 5B328 8006D708 000E083C */  lui        $t0, (0xE000000 >> 16)
/* 5B32C 8006D70C 25186800 */  or         $v1, $v1, $t0
/* 5B330 8006D710 000043AC */  sw         $v1, 0x0($v0)
/* 5B334 8006D714 00520200 */  sll        $t2, $v0, 8
/* 5B338 8006D718 02520A00 */  srl        $t2, $t2, 8
/* 5B33C 8006D71C 00006AAD */  sw         $t2, 0x0($t3)
/* 5B340 8006D720 0800E003 */  jr         $ra
/* 5B344 8006D724 3C004224 */   addiu     $v0, $v0, 0x3C
.L8006D728:
/* 5B348 8006D728 0400C88C */  lw         $t0, 0x4($a2)
/* 5B34C 8006D72C 6000033C */  lui        $v1, (0x600000 >> 16)
/* 5B350 8006D730 27186300 */  nor        $v1, $v1, $v1
/* 5B354 8006D734 24400301 */  and        $t0, $t0, $v1
/* 5B358 8006D738 2000033C */  lui        $v1, (0x200000 >> 16)
/* 5B35C 8006D73C 25400301 */  or         $t0, $t0, $v1
/* 5B360 8006D740 0000C38C */  lw         $v1, 0x0($a2)
/* 5B364 8006D744 0800C98C */  lw         $t1, 0x8($a2)
/* 5B368 8006D748 20004CE8 */  swc2       $12, 0x20($v0)
/* 5B36C 8006D74C 2C004DE8 */  swc2       $13, 0x2C($v0)
/* 5B370 8006D750 38004EE8 */  swc2       $14, 0x38($v0)
/* 5B374 8006D754 240043AC */  sw         $v1, 0x24($v0)
/* 5B378 8006D758 300048AC */  sw         $t0, 0x30($v0)
/* 5B37C 8006D75C 3C0049AC */  sw         $t1, 0x3C($v0)
/* 5B380 8006D760 00A00948 */  mfc2       $t1, $20 /* handwritten instruction */
/* 5B384 8006D764 0036033C */  lui        $v1, (0x36000000 >> 16)
/* 5B388 8006D768 25186900 */  or         $v1, $v1, $t1
/* 5B38C 8006D76C 1C0043AC */  sw         $v1, 0x1C($v0)
/* 5B390 8006D770 280055E8 */  swc2       $21, 0x28($v0)
/* 5B394 8006D774 340056E8 */  swc2       $22, 0x34($v0)
/* 5B398 8006D778 000F083C */  lui        $t0, (0xF000000 >> 16)
/* 5B39C 8006D77C 0000638D */  lw         $v1, 0x0($t3)
/* 5B3A0 8006D780 00520200 */  sll        $t2, $v0, 8
/* 5B3A4 8006D784 25186800 */  or         $v1, $v1, $t0
/* 5B3A8 8006D788 000043AC */  sw         $v1, 0x0($v0)
/* 5B3AC 8006D78C 02520A00 */  srl        $t2, $t2, 8
/* 5B3B0 8006D790 00006AAD */  sw         $t2, 0x0($t3)
/* 5B3B4 8006D794 0800E003 */  jr         $ra
/* 5B3B8 8006D798 40004224 */   addiu     $v0, $v0, 0x40
.size RenderBucket_DrawInstPrim_Ghost, . - RenderBucket_DrawInstPrim_Ghost
