.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_80035684
/* 232A4 80035684 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 232A8 80035688 1000B0AF */  sw         $s0, 0x10($sp)
/* 232AC 8003568C 21808000 */  addu       $s0, $a0, $zero
/* 232B0 80035690 1800B2AF */  sw         $s2, 0x18($sp)
/* 232B4 80035694 2190A000 */  addu       $s2, $a1, $zero
/* 232B8 80035698 80201200 */  sll        $a0, $s2, 2
/* 232BC 8003569C 21100402 */  addu       $v0, $s0, $a0
/* 232C0 800356A0 2000BFAF */  sw         $ra, 0x20($sp)
/* 232C4 800356A4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 232C8 800356A8 1400B1AF */  sw         $s1, 0x14($sp)
/* 232CC 800356AC EC24518C */  lw         $s1, 0x24EC($v0)
/* 232D0 800356B0 6001028E */  lw         $v0, 0x160($s0)
/* 232D4 800356B4 5003238E */  lw         $v1, 0x350($s1)
/* 232D8 800356B8 0000538C */  lw         $s3, 0x0($v0)
/* 232DC 800356BC 37006010 */  beqz       $v1, .L8003579C
/* 232E0 800356C0 00000000 */   nop
/* 232E4 800356C4 4400628C */  lw         $v0, 0x44($v1)
/* 232E8 800356C8 00000000 */  nop
/* 232EC 800356CC 33004010 */  beqz       $v0, .L8003579C
/* 232F0 800356D0 00000000 */   nop
/* 232F4 800356D4 0000438C */  lw         $v1, 0x0($v0)
/* 232F8 800356D8 00000000 */  nop
/* 232FC 800356DC 14006010 */  beqz       $v1, .L80035730
/* 23300 800356E0 01006230 */   andi      $v0, $v1, 0x1
/* 23304 800356E4 09004010 */  beqz       $v0, .L8003570C
/* 23308 800356E8 FCFF0524 */   addiu     $a1, $zero, -0x4
/* 2330C 800356EC 381A028E */  lw         $v0, 0x1A38($s0)
/* 23310 800356F0 00000000 */  nop
/* 23314 800356F4 21104400 */  addu       $v0, $v0, $a0
/* 23318 800356F8 0000448C */  lw         $a0, 0x0($v0)
/* 2331C 800356FC 8787000C */  jal        func_80021E1C
/* 23320 80035700 24286500 */   and       $a1, $v1, $a1
/* 23324 80035704 CCD50008 */  j          .L80035730
/* 23328 80035708 00000000 */   nop
.L8003570C:
/* 2332C 8003570C 21286000 */  addu       $a1, $v1, $zero
/* 23330 80035710 381A028E */  lw         $v0, 0x1A38($s0)
/* 23334 80035714 1C00668E */  lw         $a2, 0x1C($s3)
/* 23338 80035718 21104400 */  addu       $v0, $v0, $a0
/* 2333C 8003571C 1F00C624 */  addiu      $a2, $a2, 0x1F
/* 23340 80035720 43310600 */  sra        $a2, $a2, 5
/* 23344 80035724 0000448C */  lw         $a0, 0x0($v0)
/* 23348 80035728 AA87000C */  jal        func_80021EA8
/* 2334C 8003572C 80300600 */   sll       $a2, $a2, 2
.L80035730:
/* 23350 80035730 5003228E */  lw         $v0, 0x350($s1)
/* 23354 80035734 00000000 */  nop
/* 23358 80035738 4400428C */  lw         $v0, 0x44($v0)
/* 2335C 8003573C 00000000 */  nop
/* 23360 80035740 0400468C */  lw         $a2, 0x4($v0)
/* 23364 80035744 00000000 */  nop
/* 23368 80035748 1400C010 */  beqz       $a2, .L8003579C
/* 2336C 8003574C 0100C230 */   andi      $v0, $a2, 0x1
/* 23370 80035750 09004010 */  beqz       $v0, .L80035778
/* 23374 80035754 80181200 */   sll       $v1, $s2, 2
/* 23378 80035758 381A028E */  lw         $v0, 0x1A38($s0)
/* 2337C 8003575C FCFF0524 */  addiu      $a1, $zero, -0x4
/* 23380 80035760 21104300 */  addu       $v0, $v0, $v1
/* 23384 80035764 1000448C */  lw         $a0, 0x10($v0)
/* 23388 80035768 8787000C */  jal        func_80021E1C
/* 2338C 8003576C 2428C500 */   and       $a1, $a2, $a1
/* 23390 80035770 E7D50008 */  j          .L8003579C
/* 23394 80035774 00000000 */   nop
.L80035778:
/* 23398 80035778 2128C000 */  addu       $a1, $a2, $zero
/* 2339C 8003577C 381A028E */  lw         $v0, 0x1A38($s0)
/* 233A0 80035780 0000668E */  lw         $a2, 0x0($s3)
/* 233A4 80035784 21104300 */  addu       $v0, $v0, $v1
/* 233A8 80035788 1F00C624 */  addiu      $a2, $a2, 0x1F
/* 233AC 8003578C 43310600 */  sra        $a2, $a2, 5
/* 233B0 80035790 1000448C */  lw         $a0, 0x10($v0)
/* 233B4 80035794 AA87000C */  jal        func_80021EA8
/* 233B8 80035798 80300600 */   sll       $a2, $a2, 2
.L8003579C:
/* 233BC 8003579C 2000BF8F */  lw         $ra, 0x20($sp)
/* 233C0 800357A0 1C00B38F */  lw         $s3, 0x1C($sp)
/* 233C4 800357A4 1800B28F */  lw         $s2, 0x18($sp)
/* 233C8 800357A8 1400B18F */  lw         $s1, 0x14($sp)
/* 233CC 800357AC 1000B08F */  lw         $s0, 0x10($sp)
/* 233D0 800357B0 0800E003 */  jr         $ra
/* 233D4 800357B4 2800BD27 */   addiu     $sp, $sp, 0x28
.size func_80035684, . - func_80035684
