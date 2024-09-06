.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel VehGroundShadow_Main
/* 49340 8005B720 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 49344 8005B724 801F043C */  lui        $a0, (0x1F800224 >> 16)
/* 49348 8005B728 24028434 */  ori        $a0, $a0, (0x1F800224 & 0xFFFF)
/* 4934C 8005B72C 21280000 */  addu       $a1, $zero, $zero
/* 49350 8005B730 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 49354 8005B734 801F133C */  lui        $s3, (0x1F80023C >> 16)
/* 49358 8005B738 4400BFAF */  sw         $ra, 0x44($sp)
/* 4935C 8005B73C 4000BEAF */  sw         $fp, 0x40($sp)
/* 49360 8005B740 3C00B7AF */  sw         $s7, 0x3C($sp)
/* 49364 8005B744 3800B6AF */  sw         $s6, 0x38($sp)
/* 49368 8005B748 3400B5AF */  sw         $s5, 0x34($sp)
/* 4936C 8005B74C 3000B4AF */  sw         $s4, 0x30($sp)
/* 49370 8005B750 2800B2AF */  sw         $s2, 0x28($sp)
/* 49374 8005B754 2400B1AF */  sw         $s1, 0x24($sp)
/* 49378 8005B758 AE6D010C */  jal        DECOMP_VehGroundShadow_Subset1
/* 4937C 8005B75C 2000B0AF */   sw        $s0, 0x20($sp)
/* 49380 8005B760 63024010 */  beqz       $v0, .L8005C0F0
/* 49384 8005B764 00000000 */   nop
/* 49388 8005B768 21206002 */  addu       $a0, $s3, $zero
/* 4938C 8005B76C 30028434 */  ori        $a0, $a0, (0x1F800230 & 0xFFFF)
/* 49390 8005B770 AE6D010C */  jal        DECOMP_VehGroundShadow_Subset1
/* 49394 8005B774 01000524 */   addiu     $a1, $zero, 0x1
/* 49398 8005B778 5D024010 */  beqz       $v0, .L8005C0F0
/* 4939C 8005B77C 00000000 */   nop
/* 493A0 8005B780 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 493A4 8005B784 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 493A8 8005B788 00000000 */  nop
/* 493AC 8005B78C 1000428C */  lw         $v0, 0x10($v0)
/* 493B0 8005B790 00000000 */  nop
/* 493B4 8005B794 80005E8C */  lw         $fp, 0x80($v0)
/* 493B8 8005B798 8400438C */  lw         $v1, 0x84($v0)
/* 493BC 8005B79C 0005C227 */  addiu      $v0, $fp, 0x500
/* 493C0 8005B7A0 2B104300 */  sltu       $v0, $v0, $v1
/* 493C4 8005B7A4 52024010 */  beqz       $v0, .L8005C0F0
/* 493C8 8005B7A8 801F193C */   lui       $t9, (0x1F800090 >> 16)
/* 493CC 8005B7AC 90003937 */  ori        $t9, $t9, (0x1F800090 & 0xFFFF)
/* 493D0 8005B7B0 900060AE */  sw         $zero, (0x1F800090 & 0xFFFF)($s3)
/* 493D4 8005B7B4 940060AE */  sw         $zero, (0x1F800094 & 0xFFFF)($s3)
/* 493D8 8005B7B8 980060AE */  sw         $zero, (0x1F800098 & 0xFFFF)($s3)
/* 493DC 8005B7BC 00002C8F */  lw         $t4, 0x0($t9)
/* 493E0 8005B7C0 04002D8F */  lw         $t5, 0x4($t9)
/* 493E4 8005B7C4 08002E8F */  lw         $t6, 0x8($t9)
/* 493E8 8005B7C8 0028CC48 */  ctc2       $t4, $5 /* handwritten instruction */
/* 493EC 8005B7CC 0030CD48 */  ctc2       $t5, $6 /* handwritten instruction */
/* 493F0 8005B7D0 0038CE48 */  ctc2       $t6, $7 /* handwritten instruction */
/* 493F4 8005B7D4 21B80000 */  addu       $s7, $zero, $zero
/* 493F8 8005B7D8 21A86002 */  addu       $s5, $s3, $zero
/* 493FC 8005B7DC A400B536 */  ori        $s5, $s5, (0x1F8000A4 & 0xFFFF)
/* 49400 8005B7E0 21306002 */  addu       $a2, $s3, $zero
/* 49404 8005B7E4 B600C634 */  ori        $a2, $a2, (0x1F8000B6 & 0xFFFF)
.L8005B7E8:
/* 49408 8005B7E8 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 4940C 8005B7EC ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 49410 8005B7F0 80101700 */  sll        $v0, $s7, 2
/* 49414 8005B7F4 21106200 */  addu       $v0, $v1, $v0
/* 49418 8005B7F8 EC24458C */  lw         $a1, 0x24EC($v0)
/* 4941C 8005B7FC 00000000 */  nop
/* 49420 8005B800 2C00A010 */  beqz       $a1, .L8005B8B4
/* 49424 8005B804 00000000 */   nop
/* 49428 8005B808 0200C5AC */  sw         $a1, 0x2($a2)
/* 4942C 8005B80C 1C00A88C */  lw         $t0, 0x1C($a1)
/* 49430 8005B810 00000000 */  nop
/* 49434 8005B814 0600C8AC */  sw         $t0, 0x6($a2)
/* 49438 8005B818 28000295 */  lhu        $v0, 0x28($t0)
/* 4943C 8005B81C 00000000 */  nop
/* 49440 8005B820 1400C2A4 */  sh         $v0, 0x14($a2)
/* 49444 8005B824 A81C6290 */  lbu        $v0, 0x1CA8($v1)
/* 49448 8005B828 00000000 */  nop
/* 4944C 8005B82C FFFF4724 */  addiu      $a3, $v0, -0x1
/* 49450 8005B830 0A00E004 */  bltz       $a3, .L8005B85C
/* 49454 8005B834 00110700 */   sll       $v0, $a3, 4
/* 49458 8005B838 21104700 */  addu       $v0, $v0, $a3
/* 4945C 8005B83C C0100200 */  sll        $v0, $v0, 3
/* 49460 8005B840 21204800 */  addu       $a0, $v0, $t0
.L8005B844:
/* 49464 8005B844 B8008390 */  lbu        $v1, 0xB8($a0)
/* 49468 8005B848 78FF8424 */  addiu      $a0, $a0, -0x88
/* 4946C 8005B84C 2110A702 */  addu       $v0, $s5, $a3
/* 49470 8005B850 FFFFE724 */  addiu      $a3, $a3, -0x1
/* 49474 8005B854 FBFFE104 */  bgez       $a3, .L8005B844
/* 49478 8005B858 1C0043A0 */   sb        $v1, 0x1C($v0)
.L8005B85C:
/* 4947C 8005B85C D402A28C */  lw         $v0, 0x2D4($a1)
/* 49480 8005B860 00000000 */  nop
/* 49484 8005B864 03120200 */  sra        $v0, $v0, 8
/* 49488 8005B868 0E00C2A4 */  sh         $v0, 0xE($a2)
/* 4948C 8005B86C D002A28C */  lw         $v0, 0x2D0($a1)
/* 49490 8005B870 1400C394 */  lhu        $v1, 0x14($a2)
/* 49494 8005B874 03120200 */  sra        $v0, $v0, 8
/* 49498 8005B878 03004224 */  addiu      $v0, $v0, 0x3
/* 4949C 8005B87C 1000C2A4 */  sh         $v0, 0x10($a2)
/* 494A0 8005B880 DC02A28C */  lw         $v0, 0x2DC($a1)
/* 494A4 8005B884 00206330 */  andi       $v1, $v1, 0x2000
/* 494A8 8005B888 03120200 */  sra        $v0, $v0, 8
/* 494AC 8005B88C 04006010 */  beqz       $v1, .L8005B8A0
/* 494B0 8005B890 1200C2A4 */   sh        $v0, 0x12($a2)
/* 494B4 8005B894 51000291 */  lbu        $v0, 0x51($t0)
/* 494B8 8005B898 2B6E0108 */  j          .L8005B8AC
/* 494BC 8005B89C 01004224 */   addiu     $v0, $v0, 0x1
.L8005B8A0:
/* 494C0 8005B8A0 50000291 */  lbu        $v0, 0x50($t0)
/* 494C4 8005B8A4 00000000 */  nop
/* 494C8 8005B8A8 01004224 */  addiu      $v0, $v0, 0x1
.L8005B8AC:
/* 494CC 8005B8AC 2E6E0108 */  j          .L8005B8B8
/* 494D0 8005B8B0 0100C2A0 */   sb        $v0, 0x1($a2)
.L8005B8B4:
/* 494D4 8005B8B4 0200C0AC */  sw         $zero, 0x2($a2)
.L8005B8B8:
/* 494D8 8005B8B8 0000C0A0 */  sb         $zero, 0x0($a2)
/* 494DC 8005B8BC 0100F726 */  addiu      $s7, $s7, 0x1
/* 494E0 8005B8C0 2800C624 */  addiu      $a2, $a2, 0x28
/* 494E4 8005B8C4 0800E22A */  slti       $v0, $s7, 0x8
/* 494E8 8005B8C8 C7FF4014 */  bnez       $v0, .L8005B7E8
/* 494EC 8005B8CC 2800B526 */   addiu     $s5, $s5, 0x28
/* 494F0 8005B8D0 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 494F4 8005B8D4 ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 494F8 8005B8D8 1400A0AE */  sw         $zero, 0x14($s5)
/* 494FC 8005B8DC A81C6290 */  lbu        $v0, 0x1CA8($v1)
/* 49500 8005B8E0 00000000 */  nop
/* 49504 8005B8E4 FFFF5724 */  addiu      $s7, $v0, -0x1
/* 49508 8005B8E8 00111700 */  sll        $v0, $s7, 4
/* 4950C 8005B8EC 21105700 */  addu       $v0, $v0, $s7
/* 49510 8005B8F0 00110200 */  sll        $v0, $v0, 4
/* 49514 8005B8F4 68014224 */  addiu      $v0, $v0, 0x168
/* 49518 8005B8F8 F701E006 */  bltz       $s7, .L8005C0D8
/* 4951C 8005B8FC 21106200 */   addu      $v0, $v1, $v0
/* 49520 8005B900 FFFF0B24 */  addiu      $t3, $zero, -0x1
/* 49524 8005B904 48007826 */  addiu      $t8, $s3, %lo(D_1F800048)
/* 49528 8005B908 01000F24 */  addiu      $t7, $zero, 0x1
/* 4952C 8005B90C 38005624 */  addiu      $s6, $v0, 0x38
.L8005B910:
/* 49530 8005B910 E0FFC28E */  lw         $v0, -0x20($s6)
/* 49534 8005B914 00000000 */  nop
/* 49538 8005B918 400262AE */  sw         $v0, (0x1F800240 & 0xFFFF)($s3)
/* 4953C 8005B91C BC00C28E */  lw         $v0, 0xBC($s6)
/* 49540 8005B920 00000000 */  nop
/* 49544 8005B924 3C0262AE */  sw         $v0, (0x1F80023C & 0xFFFF)($s3)
/* 49548 8005B928 E8FFC396 */  lhu        $v1, -0x18($s6)
/* 4954C 8005B92C EAFFC296 */  lhu        $v0, -0x16($s6)
/* 49550 8005B930 001C0300 */  sll        $v1, $v1, 16
/* 49554 8005B934 431C0300 */  sra        $v1, $v1, 17
/* 49558 8005B938 00140200 */  sll        $v0, $v0, 16
/* 4955C 8005B93C 43140200 */  sra        $v0, $v0, 17
/* 49560 8005B940 00640300 */  sll        $t4, $v1, 16
/* 49564 8005B944 006C0200 */  sll        $t5, $v0, 16
/* 49568 8005B948 00C0CC48 */  ctc2       $t4, $24 /* handwritten instruction */
/* 4956C 8005B94C 00C8CD48 */  ctc2       $t5, $25 /* handwritten instruction */
/* 49570 8005B950 4002798E */  lw         $t9, (0x1F800240 & 0xFFFF)($s3)
/* 49574 8005B954 00000000 */  nop
/* 49578 8005B958 00D0D948 */  ctc2       $t9, $26 /* handwritten instruction */
/* 4957C 8005B95C 4400C28E */  lw         $v0, 0x44($s6)
/* 49580 8005B960 00000000 */  nop
/* 49584 8005B964 900062AE */  sw         $v0, (0x1F800090 & 0xFFFF)($s3)
/* 49588 8005B968 4800C28E */  lw         $v0, 0x48($s6)
/* 4958C 8005B96C 00000000 */  nop
/* 49590 8005B970 940062AE */  sw         $v0, (0x1F800094 & 0xFFFF)($s3)
/* 49594 8005B974 4C00C28E */  lw         $v0, 0x4C($s6)
/* 49598 8005B978 00000000 */  nop
/* 4959C 8005B97C 980062AE */  sw         $v0, (0x1F800098 & 0xFFFF)($s3)
/* 495A0 8005B980 F0FFC28E */  lw         $v0, -0x10($s6)
/* 495A4 8005B984 00000000 */  nop
/* 495A8 8005B988 500062AE */  sw         $v0, (0x1F800050 & 0xFFFF)($s3)
/* 495AC 8005B98C F4FFC28E */  lw         $v0, -0xC($s6)
/* 495B0 8005B990 00000000 */  nop
/* 495B4 8005B994 540062AE */  sw         $v0, (0x1F800054 & 0xFFFF)($s3)
/* 495B8 8005B998 F8FFC28E */  lw         $v0, -0x8($s6)
/* 495BC 8005B99C 00000000 */  nop
/* 495C0 8005B9A0 580062AE */  sw         $v0, (0x1F800058 & 0xFFFF)($s3)
/* 495C4 8005B9A4 0000C296 */  lhu        $v0, 0x0($s6)
/* 495C8 8005B9A8 FCFFC38E */  lw         $v1, -0x4($s6)
/* 495CC 8005B9AC 600062A6 */  sh         $v0, (0x1F800060 & 0xFFFF)($s3)
/* 495D0 8005B9B0 50006226 */  addiu      $v0, $s3, %lo(D_1F800050)
/* 495D4 8005B9B4 5C0063AE */  sw         $v1, (0x1F80005C & 0xFFFF)($s3)
/* 495D8 8005B9B8 00004C8C */  lw         $t4, 0x0($v0)
/* 495DC 8005B9BC 04004D8C */  lw         $t5, 0x4($v0)
/* 495E0 8005B9C0 0000CC48 */  ctc2       $t4, $0 /* handwritten instruction */
/* 495E4 8005B9C4 0008CD48 */  ctc2       $t5, $1 /* handwritten instruction */
/* 495E8 8005B9C8 08004C8C */  lw         $t4, 0x8($v0)
/* 495EC 8005B9CC 0C004D8C */  lw         $t5, 0xC($v0)
/* 495F0 8005B9D0 10004E8C */  lw         $t6, 0x10($v0)
/* 495F4 8005B9D4 0010CC48 */  ctc2       $t4, $2 /* handwritten instruction */
/* 495F8 8005B9D8 0018CD48 */  ctc2       $t5, $3 /* handwritten instruction */
/* 495FC 8005B9DC 0020CE48 */  ctc2       $t6, $4 /* handwritten instruction */
/* 49600 8005B9E0 A4007526 */  addiu      $s5, $s3, %lo(D_1F8000A4)
/* 49604 8005B9E4 1400A58E */  lw         $a1, 0x14($s5)
/* 49608 8005B9E8 00000000 */  nop
/* 4960C 8005B9EC B701A010 */  beqz       $a1, .L8005C0CC
/* 49610 8005B9F0 00000000 */   nop
/* 49614 8005B9F4 B8007226 */  addiu      $s2, $s3, %lo(D_1F8000B8)
.L8005B9F8:
/* 49618 8005B9F8 FEFF4282 */  lb         $v0, -0x2($s2)
/* 4961C 8005B9FC 00000000 */  nop
/* 49620 8005BA00 AD014B10 */  beq        $v0, $t3, .L8005C0B8
/* 49624 8005BA04 00000000 */   nop
/* 49628 8005BA08 12004296 */  lhu        $v0, 0x12($s2)
/* 4962C 8005BA0C 00000000 */  nop
/* 49630 8005BA10 80004230 */  andi       $v0, $v0, 0x80
/* 49634 8005BA14 5F004014 */  bnez       $v0, .L8005BB94
/* 49638 8005BA18 2110B702 */   addu      $v0, $s5, $s7
/* 4963C 8005BA1C 1C004290 */  lbu        $v0, 0x1C($v0)
/* 49640 8005BA20 00000000 */  nop
/* 49644 8005BA24 40004230 */  andi       $v0, $v0, 0x40
/* 49648 8005BA28 A3014010 */  beqz       $v0, .L8005C0B8
/* 4964C 8005BA2C 00000000 */   nop
/* 49650 8005BA30 0C004396 */  lhu        $v1, 0xC($s2)
/* 49654 8005BA34 90006296 */  lhu        $v0, (0x1F800090 & 0xFFFF)($s3)
/* 49658 8005BA38 00000000 */  nop
/* 4965C 8005BA3C 23186200 */  subu       $v1, $v1, $v0
/* 49660 8005BA40 80100300 */  sll        $v0, $v1, 2
/* 49664 8005BA44 801C0300 */  sll        $v1, $v1, 18
/* 49668 8005BA48 9C0062A6 */  sh         $v0, (0x1F80009C & 0xFFFF)($s3)
/* 4966C 8005BA4C 0E004496 */  lhu        $a0, 0xE($s2)
/* 49670 8005BA50 94006296 */  lhu        $v0, (0x1F800094 & 0xFFFF)($s3)
/* 49674 8005BA54 03440300 */  sra        $t0, $v1, 16
/* 49678 8005BA58 23208200 */  subu       $a0, $a0, $v0
/* 4967C 8005BA5C 80100400 */  sll        $v0, $a0, 2
/* 49680 8005BA60 80240400 */  sll        $a0, $a0, 18
/* 49684 8005BA64 9E0062A6 */  sh         $v0, (0x1F80009E & 0xFFFF)($s3)
/* 49688 8005BA68 10004396 */  lhu        $v1, 0x10($s2)
/* 4968C 8005BA6C 98006296 */  lhu        $v0, (0x1F800098 & 0xFFFF)($s3)
/* 49690 8005BA70 03340400 */  sra        $a2, $a0, 16
/* 49694 8005BA74 23186200 */  subu       $v1, $v1, $v0
/* 49698 8005BA78 80140300 */  sll        $v0, $v1, 18
/* 4969C 8005BA7C 03240200 */  sra        $a0, $v0, 16
/* 496A0 8005BA80 4002628E */  lw         $v0, (0x1F800240 & 0xFFFF)($s3)
/* 496A4 8005BA84 80180300 */  sll        $v1, $v1, 2
/* 496A8 8005BA88 A00063A6 */  sh         $v1, (0x1F8000A0 & 0xFFFF)($s3)
/* 496AC 8005BA8C 01014328 */  slti       $v1, $v0, 0x101
/* 496B0 8005BA90 0D006010 */  beqz       $v1, .L8005BAC8
/* 496B4 8005BA94 71170229 */   slti      $v0, $t0, 0x1771
/* 496B8 8005BA98 87014010 */  beqz       $v0, .L8005C0B8
/* 496BC 8005BA9C 7117C228 */   slti      $v0, $a2, 0x1771
/* 496C0 8005BAA0 85014010 */  beqz       $v0, .L8005C0B8
/* 496C4 8005BAA4 71178228 */   slti      $v0, $a0, 0x1771
/* 496C8 8005BAA8 83014010 */  beqz       $v0, .L8005C0B8
/* 496CC 8005BAAC 90E80229 */   slti      $v0, $t0, -0x1770
/* 496D0 8005BAB0 81014014 */  bnez       $v0, .L8005C0B8
/* 496D4 8005BAB4 90E8C228 */   slti      $v0, $a2, -0x1770
/* 496D8 8005BAB8 7F014014 */  bnez       $v0, .L8005C0B8
/* 496DC 8005BABC 90E88228 */   slti      $v0, $a0, -0x1770
/* 496E0 8005BAC0 7D014014 */  bnez       $v0, .L8005C0B8
/* 496E4 8005BAC4 00000000 */   nop
.L8005BAC8:
/* 496E8 8005BAC8 9C006226 */  addiu      $v0, $s3, %lo(D_1F80009C)
/* 496EC 8005BACC 000040C8 */  lwc2       $0, 0x0($v0)
/* 496F0 8005BAD0 040041C8 */  lwc2       $1, 0x4($v0)
/* 496F4 8005BAD4 00000000 */  nop
/* 496F8 8005BAD8 00000000 */  nop
/* 496FC 8005BADC 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 49700 8005BAE0 00D81448 */  mfc2       $s4, $27 /* handwritten instruction */
/* 49704 8005BAE4 00000000 */  nop
/* 49708 8005BAE8 83A01400 */  sra        $s4, $s4, 2
/* 4970C 8005BAEC CCFF822A */  slti       $v0, $s4, -0x34
/* 49710 8005BAF0 71014014 */  bnez       $v0, .L8005C0B8
/* 49714 8005BAF4 00000000 */   nop
/* 49718 8005BAF8 15006010 */  beqz       $v1, .L8005BB50
/* 4971C 8005BAFC 8001822A */   slti      $v0, $s4, 0x180
/* 49720 8005BB00 03004010 */  beqz       $v0, .L8005BB10
/* 49724 8005BB04 00020224 */   addiu     $v0, $zero, 0x200
/* 49728 8005BB08 CD6E0108 */  j          .L8005BB34
/* 4972C 8005BB0C 1F001424 */   addiu     $s4, $zero, 0x1F
.L8005BB10:
/* 49730 8005BB10 23105400 */  subu       $v0, $v0, $s4
/* 49734 8005BB14 40190200 */  sll        $v1, $v0, 5
/* 49738 8005BB18 23106200 */  subu       $v0, $v1, $v0
/* 4973C 8005BB1C 03004104 */  bgez       $v0, .L8005BB2C
/* 49740 8005BB20 C3A10200 */   sra       $s4, $v0, 7
/* 49744 8005BB24 7F004224 */  addiu      $v0, $v0, 0x7F
/* 49748 8005BB28 C3A10200 */  sra        $s4, $v0, 7
.L8005BB2C:
/* 4974C 8005BB2C 6201801A */  blez       $s4, .L8005C0B8
/* 49750 8005BB30 00000000 */   nop
.L8005BB34:
/* 49754 8005BB34 00121400 */  sll        $v0, $s4, 8
/* 49758 8005BB38 002E033C */  lui        $v1, (0x2E000000 >> 16)
/* 4975C 8005BB3C 25104300 */  or         $v0, $v0, $v1
/* 49760 8005BB40 25108202 */  or         $v0, $s4, $v0
/* 49764 8005BB44 001C1400 */  sll        $v1, $s4, 16
/* 49768 8005BB48 D66E0108 */  j          .L8005BB58
/* 4976C 8005BB4C 25A04300 */   or        $s4, $v0, $v1
.L8005BB50:
/* 49770 8005BB50 1F2E143C */  lui        $s4, (0x2E1F1F1F >> 16)
/* 49774 8005BB54 1F1F9436 */  ori        $s4, $s4, (0x2E1F1F1F & 0xFFFF)
.L8005BB58:
/* 49778 8005BB58 FEFF4282 */  lb         $v0, -0x2($s2)
/* 4977C 8005BB5C 00000000 */  nop
/* 49780 8005BB60 64004014 */  bnez       $v0, .L8005BCF4
/* 49784 8005BB64 00000000 */   nop
/* 49788 8005BB68 D802A28C */  lw         $v0, 0x2D8($a1)
/* 4978C 8005BB6C D002A38C */  lw         $v1, 0x2D0($a1)
/* 49790 8005BB70 00000000 */  nop
/* 49794 8005BB74 23104300 */  subu       $v0, $v0, $v1
/* 49798 8005BB78 03120200 */  sra        $v0, $v0, 8
/* 4979C 8005BB7C 00010324 */  addiu      $v1, $zero, 0x100
/* 497A0 8005BB80 23886200 */  subu       $s1, $v1, $v0
/* 497A4 8005BB84 0300201A */  blez       $s1, .L8005BB94
/* 497A8 8005BB88 0A01222A */   slti      $v0, $s1, 0x10A
/* 497AC 8005BB8C 03004014 */  bnez       $v0, .L8005BB9C
/* 497B0 8005BB90 0101222A */   slti      $v0, $s1, 0x101
.L8005BB94:
/* 497B4 8005BB94 2E700108 */  j          .L8005C0B8
/* 497B8 8005BB98 FEFF4BA2 */   sb        $t3, -0x2($s2)
.L8005BB9C:
/* 497BC 8005BB9C 02004014 */  bnez       $v0, .L8005BBA8
/* 497C0 8005BBA0 70007026 */   addiu     $s0, $s3, %lo(D_1F800070)
/* 497C4 8005BBA4 00011124 */  addiu      $s1, $zero, 0x100
.L8005BBA8:
/* 497C8 8005BBA8 21200002 */  addu       $a0, $s0, $zero
/* 497CC 8005BBAC EE02A684 */  lh         $a2, 0x2EE($a1)
/* 497D0 8005BBB0 7003A524 */  addiu      $a1, $a1, 0x370
/* 497D4 8005BBB4 1000ABAF */  sw         $t3, 0x10($sp)
/* 497D8 8005BBB8 1400AFAF */  sw         $t7, 0x14($sp)
/* 497DC 8005BBBC 277E010C */  jal        VehPhysForce_RotAxisAngle
/* 497E0 8005BBC0 1800B8AF */   sw        $t8, 0x18($sp)
/* 497E4 8005BBC4 00000C8E */  lw         $t4, 0x0($s0)
/* 497E8 8005BBC8 04000D8E */  lw         $t5, 0x4($s0)
/* 497EC 8005BBCC 0040CC48 */  ctc2       $t4, $8 /* handwritten instruction */
/* 497F0 8005BBD0 0048CD48 */  ctc2       $t5, $9 /* handwritten instruction */
/* 497F4 8005BBD4 08000C8E */  lw         $t4, 0x8($s0)
/* 497F8 8005BBD8 0C000D8E */  lw         $t5, 0xC($s0)
/* 497FC 8005BBDC 10000E8E */  lw         $t6, 0x10($s0)
/* 49800 8005BBE0 0050CC48 */  ctc2       $t4, $10 /* handwritten instruction */
/* 49804 8005BBE4 0058CD48 */  ctc2       $t5, $11 /* handwritten instruction */
/* 49808 8005BBE8 0060CE48 */  ctc2       $t6, $12 /* handwritten instruction */
/* 4980C 8005BBEC 21380000 */  addu       $a3, $zero, $zero
/* 49810 8005BBF0 80181100 */  sll        $v1, $s1, 2
/* 49814 8005BBF4 21187100 */  addu       $v1, $v1, $s1
/* 49818 8005BBF8 C0180300 */  sll        $v1, $v1, 3
/* 4981C 8005BBFC 21107100 */  addu       $v0, $v1, $s1
/* 49820 8005BC00 83510200 */  sra        $t2, $v0, 6
/* 49824 8005BC04 40101100 */  sll        $v0, $s1, 1
/* 49828 8005BC08 21105100 */  addu       $v0, $v0, $s1
/* 4982C 8005BC0C 80100200 */  sll        $v0, $v0, 2
/* 49830 8005BC10 21105100 */  addu       $v0, $v0, $s1
/* 49834 8005BC14 80100200 */  sll        $v0, $v0, 2
/* 49838 8005BC18 83490200 */  sra        $t1, $v0, 6
/* 4983C 8005BC1C 2128A002 */  addu       $a1, $s5, $zero
/* 49840 8005BC20 83190300 */  sra        $v1, $v1, 6
/* 49844 8005BC24 480063A6 */  sh         $v1, (0x1F800048 & 0xFFFF)($s3)
/* 49848 8005BC28 4A0060A6 */  sh         $zero, (0x1F80004A & 0xFFFF)($s3)
/* 4984C 8005BC2C 4C0060A6 */  sh         $zero, (0x1F80004C & 0xFFFF)($s3)
/* 49850 8005BC30 1800B88F */  lw         $t8, 0x18($sp)
/* 49854 8005BC34 1400AF8F */  lw         $t7, 0x14($sp)
/* 49858 8005BC38 1000AB8F */  lw         $t3, 0x10($sp)
.L8005BC3C:
/* 4985C 8005BC3C 000000CB */  lwc2       $0, 0x0($t8)
/* 49860 8005BC40 040001CB */  lwc2       $1, 0x4($t8)
/* 49864 8005BC44 00000000 */  nop
/* 49868 8005BC48 00000000 */  nop
/* 4986C 8005BC4C 12604A4A */  MVMVA      1, 1, 0, 3, 0
/* 49870 8005BC50 0500E010 */  beqz       $a3, .L8005BC68
/* 49874 8005BC54 00000000 */   nop
/* 49878 8005BC58 0600EF10 */  beq        $a3, $t7, .L8005BC74
/* 4987C 8005BC5C 00000000 */   nop
/* 49880 8005BC60 1E6F0108 */  j          .L8005BC78
/* 49884 8005BC64 00000000 */   nop
.L8005BC68:
/* 49888 8005BC68 480060A6 */  sh         $zero, (0x1F800048 & 0xFFFF)($s3)
/* 4988C 8005BC6C 1E6F0108 */  j          .L8005BC78
/* 49890 8005BC70 4C006AA6 */   sh        $t2, (0x1F80004C & 0xFFFF)($s3)
.L8005BC74:
/* 49894 8005BC74 4C0069A6 */  sh         $t1, (0x1F80004C & 0xFFFF)($s3)
.L8005BC78:
/* 49898 8005BC78 00C80848 */  mfc2       $t0, $25 /* handwritten instruction */
/* 4989C 8005BC7C 00D00648 */  mfc2       $a2, $26 /* handwritten instruction */
/* 498A0 8005BC80 00D80448 */  mfc2       $a0, $27 /* handwritten instruction */
/* 498A4 8005BC84 0000A8A4 */  sh         $t0, 0x0($a1)
/* 498A8 8005BC88 0200A6A4 */  sh         $a2, 0x2($a1)
/* 498AC 8005BC8C 0400A4A4 */  sh         $a0, 0x4($a1)
/* 498B0 8005BC90 0100E724 */  addiu      $a3, $a3, 0x1
/* 498B4 8005BC94 0300E228 */  slti       $v0, $a3, 0x3
/* 498B8 8005BC98 E8FF4014 */  bnez       $v0, .L8005BC3C
/* 498BC 8005BC9C 0600A524 */   addiu     $a1, $a1, 0x6
/* 498C0 8005BCA0 50006226 */  addiu      $v0, $s3, %lo(D_1F800050)
/* 498C4 8005BCA4 00004C8C */  lw         $t4, 0x0($v0)
/* 498C8 8005BCA8 04004D8C */  lw         $t5, 0x4($v0)
/* 498CC 8005BCAC 0000CC48 */  ctc2       $t4, $0 /* handwritten instruction */
/* 498D0 8005BCB0 0008CD48 */  ctc2       $t5, $1 /* handwritten instruction */
/* 498D4 8005BCB4 08004C8C */  lw         $t4, 0x8($v0)
/* 498D8 8005BCB8 0C004D8C */  lw         $t5, 0xC($v0)
/* 498DC 8005BCBC 10004E8C */  lw         $t6, 0x10($v0)
/* 498E0 8005BCC0 0010CC48 */  ctc2       $t4, $2 /* handwritten instruction */
/* 498E4 8005BCC4 0018CD48 */  ctc2       $t5, $3 /* handwritten instruction */
/* 498E8 8005BCC8 0020CE48 */  ctc2       $t6, $4 /* handwritten instruction */
/* 498EC 8005BCCC 9C006296 */  lhu        $v0, (0x1F80009C & 0xFFFF)($s3)
/* 498F0 8005BCD0 9E006396 */  lhu        $v1, (0x1F80009E & 0xFFFF)($s3)
/* 498F4 8005BCD4 A0006496 */  lhu        $a0, (0x1F8000A0 & 0xFFFF)($s3)
/* 498F8 8005BCD8 FEFF4FA2 */  sb         $t7, -0x2($s2)
/* 498FC 8005BCDC 00140200 */  sll        $v0, $v0, 16
/* 49900 8005BCE0 03440200 */  sra        $t0, $v0, 16
/* 49904 8005BCE4 001C0300 */  sll        $v1, $v1, 16
/* 49908 8005BCE8 03340300 */  sra        $a2, $v1, 16
/* 4990C 8005BCEC 00240400 */  sll        $a0, $a0, 16
/* 49910 8005BCF0 03240400 */  sra        $a0, $a0, 16
.L8005BCF4:
/* 49914 8005BCF4 0C0268A6 */  sh         $t0, (0x1F80020C & 0xFFFF)($s3)
/* 49918 8005BCF8 0E0266A6 */  sh         $a2, (0x1F80020E & 0xFFFF)($s3)
/* 4991C 8005BCFC 100264A6 */  sh         $a0, (0x1F800210 & 0xFFFF)($s3)
/* 49920 8005BD00 0000A296 */  lhu        $v0, 0x0($s5)
/* 49924 8005BD04 F2FF4396 */  lhu        $v1, -0xE($s2)
/* 49928 8005BD08 23100201 */  subu       $v0, $t0, $v0
/* 4992C 8005BD0C 23104300 */  subu       $v0, $v0, $v1
/* 49930 8005BD10 140262A6 */  sh         $v0, (0x1F800214 & 0xFFFF)($s3)
/* 49934 8005BD14 EEFF4296 */  lhu        $v0, -0x12($s2)
/* 49938 8005BD18 F4FF4396 */  lhu        $v1, -0xC($s2)
/* 4993C 8005BD1C 2310C200 */  subu       $v0, $a2, $v0
/* 49940 8005BD20 23104300 */  subu       $v0, $v0, $v1
/* 49944 8005BD24 160262A6 */  sh         $v0, (0x1F800216 & 0xFFFF)($s3)
/* 49948 8005BD28 F0FF4296 */  lhu        $v0, -0x10($s2)
/* 4994C 8005BD2C F6FF4396 */  lhu        $v1, -0xA($s2)
/* 49950 8005BD30 23108200 */  subu       $v0, $a0, $v0
/* 49954 8005BD34 23104300 */  subu       $v0, $v0, $v1
/* 49958 8005BD38 180262A6 */  sh         $v0, (0x1F800218 & 0xFFFF)($s3)
/* 4995C 8005BD3C F2FF4296 */  lhu        $v0, -0xE($s2)
/* 49960 8005BD40 21380000 */  addu       $a3, $zero, $zero
/* 49964 8005BD44 23100201 */  subu       $v0, $t0, $v0
/* 49968 8005BD48 1C0262A6 */  sh         $v0, (0x1F80021C & 0xFFFF)($s3)
/* 4996C 8005BD4C F4FF4296 */  lhu        $v0, -0xC($s2)
/* 49970 8005BD50 24000924 */  addiu      $t1, $zero, 0x24
/* 49974 8005BD54 2310C200 */  subu       $v0, $a2, $v0
/* 49978 8005BD58 1E0262A6 */  sh         $v0, (0x1F80021E & 0xFFFF)($s3)
/* 4997C 8005BD5C F6FF4296 */  lhu        $v0, -0xA($s2)
/* 49980 8005BD60 21286002 */  addu       $a1, $s3, $zero
/* 49984 8005BD64 23108200 */  subu       $v0, $a0, $v0
/* 49988 8005BD68 200262A6 */  sh         $v0, (0x1F800220 & 0xFFFF)($s3)
.L8005BD6C:
/* 4998C 8005BD6C 0C026226 */  addiu      $v0, $s3, %lo(D_1F80020C)
/* 49990 8005BD70 000040C8 */  lwc2       $0, 0x0($v0)
/* 49994 8005BD74 040041C8 */  lwc2       $1, 0x4($v0)
/* 49998 8005BD78 080042C8 */  lwc2       $2, 0x8($v0)
/* 4999C 8005BD7C 0C0043C8 */  lwc2       $3, 0xC($v0)
/* 499A0 8005BD80 100044C8 */  lwc2       $4, 0x10($v0)
/* 499A4 8005BD84 140045C8 */  lwc2       $5, 0x14($v0)
/* 499A8 8005BD88 00000000 */  nop
/* 499AC 8005BD8C 00000000 */  nop
/* 499B0 8005BD90 3000284A */  RTPT
/* 499B4 8005BD94 2C00E014 */  bnez       $a3, .L8005BE48
/* 499B8 8005BD98 03000224 */   addiu     $v0, $zero, 0x3
/* 499BC 8005BD9C 0000A296 */  lhu        $v0, 0x0($s5)
/* 499C0 8005BDA0 F2FF4396 */  lhu        $v1, -0xE($s2)
/* 499C4 8005BDA4 21104800 */  addu       $v0, $v0, $t0
/* 499C8 8005BDA8 23104300 */  subu       $v0, $v0, $v1
/* 499CC 8005BDAC 0C0262A6 */  sh         $v0, (0x1F80020C & 0xFFFF)($s3)
/* 499D0 8005BDB0 EEFF4296 */  lhu        $v0, -0x12($s2)
/* 499D4 8005BDB4 F4FF4396 */  lhu        $v1, -0xC($s2)
/* 499D8 8005BDB8 21104600 */  addu       $v0, $v0, $a2
/* 499DC 8005BDBC 23104300 */  subu       $v0, $v0, $v1
/* 499E0 8005BDC0 0E0262A6 */  sh         $v0, (0x1F80020E & 0xFFFF)($s3)
/* 499E4 8005BDC4 F0FF4296 */  lhu        $v0, -0x10($s2)
/* 499E8 8005BDC8 F6FF4396 */  lhu        $v1, -0xA($s2)
/* 499EC 8005BDCC 21104400 */  addu       $v0, $v0, $a0
/* 499F0 8005BDD0 23104300 */  subu       $v0, $v0, $v1
/* 499F4 8005BDD4 100262A6 */  sh         $v0, (0x1F800210 & 0xFFFF)($s3)
/* 499F8 8005BDD8 0000A296 */  lhu        $v0, 0x0($s5)
/* 499FC 8005BDDC 00000000 */  nop
/* 49A00 8005BDE0 21104800 */  addu       $v0, $v0, $t0
/* 49A04 8005BDE4 140262A6 */  sh         $v0, (0x1F800214 & 0xFFFF)($s3)
/* 49A08 8005BDE8 EEFF4296 */  lhu        $v0, -0x12($s2)
/* 49A0C 8005BDEC 00000000 */  nop
/* 49A10 8005BDF0 21104600 */  addu       $v0, $v0, $a2
/* 49A14 8005BDF4 160262A6 */  sh         $v0, (0x1F800216 & 0xFFFF)($s3)
/* 49A18 8005BDF8 F0FF4296 */  lhu        $v0, -0x10($s2)
/* 49A1C 8005BDFC 00000000 */  nop
/* 49A20 8005BE00 21104400 */  addu       $v0, $v0, $a0
/* 49A24 8005BE04 180262A6 */  sh         $v0, (0x1F800218 & 0xFFFF)($s3)
/* 49A28 8005BE08 0000A296 */  lhu        $v0, 0x0($s5)
/* 49A2C 8005BE0C F8FF4396 */  lhu        $v1, -0x8($s2)
/* 49A30 8005BE10 21104800 */  addu       $v0, $v0, $t0
/* 49A34 8005BE14 21186200 */  addu       $v1, $v1, $v0
/* 49A38 8005BE18 1C0263A6 */  sh         $v1, (0x1F80021C & 0xFFFF)($s3)
/* 49A3C 8005BE1C EEFF4296 */  lhu        $v0, -0x12($s2)
/* 49A40 8005BE20 FAFF4396 */  lhu        $v1, -0x6($s2)
/* 49A44 8005BE24 21104600 */  addu       $v0, $v0, $a2
/* 49A48 8005BE28 21186200 */  addu       $v1, $v1, $v0
/* 49A4C 8005BE2C 1E0263A6 */  sh         $v1, (0x1F80021E & 0xFFFF)($s3)
/* 49A50 8005BE30 F0FF4296 */  lhu        $v0, -0x10($s2)
/* 49A54 8005BE34 FCFF4396 */  lhu        $v1, -0x4($s2)
/* 49A58 8005BE38 21104400 */  addu       $v0, $v0, $a0
/* 49A5C 8005BE3C 21186200 */  addu       $v1, $v1, $v0
/* 49A60 8005BE40 BB6F0108 */  j          .L8005BEEC
/* 49A64 8005BE44 200263A6 */   sh        $v1, (0x1F800220 & 0xFFFF)($s3)
.L8005BE48:
/* 49A68 8005BE48 2800E214 */  bne        $a3, $v0, .L8005BEEC
/* 49A6C 8005BE4C 00000000 */   nop
/* 49A70 8005BE50 F8FF4296 */  lhu        $v0, -0x8($s2)
/* 49A74 8005BE54 00000000 */  nop
/* 49A78 8005BE58 21104800 */  addu       $v0, $v0, $t0
/* 49A7C 8005BE5C 0C0262A6 */  sh         $v0, (0x1F80020C & 0xFFFF)($s3)
/* 49A80 8005BE60 FAFF4296 */  lhu        $v0, -0x6($s2)
/* 49A84 8005BE64 00000000 */  nop
/* 49A88 8005BE68 21104600 */  addu       $v0, $v0, $a2
/* 49A8C 8005BE6C 0E0262A6 */  sh         $v0, (0x1F80020E & 0xFFFF)($s3)
/* 49A90 8005BE70 FCFF4296 */  lhu        $v0, -0x4($s2)
/* 49A94 8005BE74 00000000 */  nop
/* 49A98 8005BE78 21104400 */  addu       $v0, $v0, $a0
/* 49A9C 8005BE7C 100262A6 */  sh         $v0, (0x1F800210 & 0xFFFF)($s3)
/* 49AA0 8005BE80 0000A296 */  lhu        $v0, 0x0($s5)
/* 49AA4 8005BE84 F8FF4396 */  lhu        $v1, -0x8($s2)
/* 49AA8 8005BE88 23100201 */  subu       $v0, $t0, $v0
/* 49AAC 8005BE8C 21186200 */  addu       $v1, $v1, $v0
/* 49AB0 8005BE90 140263A6 */  sh         $v1, (0x1F800214 & 0xFFFF)($s3)
/* 49AB4 8005BE94 EEFF4296 */  lhu        $v0, -0x12($s2)
/* 49AB8 8005BE98 FAFF4396 */  lhu        $v1, -0x6($s2)
/* 49ABC 8005BE9C 2310C200 */  subu       $v0, $a2, $v0
/* 49AC0 8005BEA0 21186200 */  addu       $v1, $v1, $v0
/* 49AC4 8005BEA4 160263A6 */  sh         $v1, (0x1F800216 & 0xFFFF)($s3)
/* 49AC8 8005BEA8 F0FF4296 */  lhu        $v0, -0x10($s2)
/* 49ACC 8005BEAC FCFF4396 */  lhu        $v1, -0x4($s2)
/* 49AD0 8005BEB0 23108200 */  subu       $v0, $a0, $v0
/* 49AD4 8005BEB4 21186200 */  addu       $v1, $v1, $v0
/* 49AD8 8005BEB8 180263A6 */  sh         $v1, (0x1F800218 & 0xFFFF)($s3)
/* 49ADC 8005BEBC 0000A296 */  lhu        $v0, 0x0($s5)
/* 49AE0 8005BEC0 00000000 */  nop
/* 49AE4 8005BEC4 23100201 */  subu       $v0, $t0, $v0
/* 49AE8 8005BEC8 1C0262A6 */  sh         $v0, (0x1F80021C & 0xFFFF)($s3)
/* 49AEC 8005BECC EEFF4296 */  lhu        $v0, -0x12($s2)
/* 49AF0 8005BED0 00000000 */  nop
/* 49AF4 8005BED4 2310C200 */  subu       $v0, $a2, $v0
/* 49AF8 8005BED8 1E0262A6 */  sh         $v0, (0x1F80021E & 0xFFFF)($s3)
/* 49AFC 8005BEDC F0FF4296 */  lhu        $v0, -0x10($s2)
/* 49B00 8005BEE0 00000000 */  nop
/* 49B04 8005BEE4 23108200 */  subu       $v0, $a0, $v0
/* 49B08 8005BEE8 200262A6 */  sh         $v0, (0x1F800220 & 0xFFFF)($s3)
.L8005BEEC:
/* 49B0C 8005BEEC 0000ACE8 */  swc2       $12, (0x1F800000 & 0xFFFF)($a1)
/* 49B10 8005BEF0 0400ADE8 */  swc2       $13, (0x1F800004 & 0xFFFF)($a1)
/* 49B14 8005BEF4 0800AEE8 */  swc2       $14, (0x1F800008 & 0xFFFF)($a1)
/* 49B18 8005BEF8 21106902 */  addu       $v0, $s3, $t1
/* 49B1C 8005BEFC 000051E8 */  swc2       $17, (0x1F800000 & 0xFFFF)($v0)
/* 49B20 8005BF00 040052E8 */  swc2       $18, (0x1F800004 & 0xFFFF)($v0)
/* 49B24 8005BF04 080053E8 */  swc2       $19, (0x1F800008 & 0xFFFF)($v0)
/* 49B28 8005BF08 0C002925 */  addiu      $t1, $t1, 0xC
/* 49B2C 8005BF0C 0300E724 */  addiu      $a3, $a3, 0x3
/* 49B30 8005BF10 0900E228 */  slti       $v0, $a3, 0x9
/* 49B34 8005BF14 95FF4014 */  bnez       $v0, .L8005BD6C
/* 49B38 8005BF18 0C00A524 */   addiu     $a1, $a1, %lo(D_1F80000C)
/* 49B3C 8005BF1C 21380000 */  addu       $a3, $zero, $zero
/* 49B40 8005BF20 2000C627 */  addiu      $a2, $fp, 0x20
.L8005BF24:
/* 49B44 8005BF24 0100E230 */  andi       $v0, $a3, 0x1
/* 49B48 8005BF28 02004010 */  beqz       $v0, .L8005BF34
/* 49B4C 8005BF2C 24026326 */   addiu     $v1, $s3, %lo(D_1F800224)
/* 49B50 8005BF30 30026326 */  addiu      $v1, $s3, %lo(D_1F800230)
.L8005BF34:
/* 49B54 8005BF34 E4FFD4AC */  sw         $s4, -0x1C($a2)
/* 49B58 8005BF38 0000628C */  lw         $v0, 0x0($v1)
/* 49B5C 8005BF3C 00000000 */  nop
/* 49B60 8005BF40 ECFFC2AC */  sw         $v0, -0x14($a2)
/* 49B64 8005BF44 0400628C */  lw         $v0, 0x4($v1)
/* 49B68 8005BF48 00000000 */  nop
/* 49B6C 8005BF4C F4FFC2AC */  sw         $v0, -0xC($a2)
/* 49B70 8005BF50 08006294 */  lhu        $v0, 0x8($v1)
/* 49B74 8005BF54 00000000 */  nop
/* 49B78 8005BF58 FCFFC2A4 */  sh         $v0, -0x4($a2)
/* 49B7C 8005BF5C 0A006294 */  lhu        $v0, 0xA($v1)
/* 49B80 8005BF60 1A00EF10 */  beq        $a3, $t7, .L8005BFCC
/* 49B84 8005BF64 0400C2A4 */   sh        $v0, 0x4($a2)
/* 49B88 8005BF68 0200E228 */  slti       $v0, $a3, 0x2
/* 49B8C 8005BF6C 05004010 */  beqz       $v0, .L8005BF84
/* 49B90 8005BF70 02000224 */   addiu     $v0, $zero, 0x2
/* 49B94 8005BF74 0900E010 */  beqz       $a3, .L8005BF9C
/* 49B98 8005BF78 00000000 */   nop
/* 49B9C 8005BF7C 14700108 */  j          .L8005C050
/* 49BA0 8005BF80 00000000 */   nop
.L8005BF84:
/* 49BA4 8005BF84 1A00E210 */  beq        $a3, $v0, .L8005BFF0
/* 49BA8 8005BF88 03000224 */   addiu     $v0, $zero, 0x3
/* 49BAC 8005BF8C 2400E210 */  beq        $a3, $v0, .L8005C020
/* 49BB0 8005BF90 00000000 */   nop
/* 49BB4 8005BF94 14700108 */  j          .L8005C050
/* 49BB8 8005BF98 00000000 */   nop
.L8005BF9C:
/* 49BBC 8005BF9C 2000628E */  lw         $v0, (0x1F800020 & 0xFFFF)($s3)
/* 49BC0 8005BFA0 00000000 */  nop
/* 49BC4 8005BFA4 E8FFC2AC */  sw         $v0, -0x18($a2)
/* 49BC8 8005BFA8 0000628E */  lw         $v0, (0x1F800000 & 0xFFFF)($s3)
/* 49BCC 8005BFAC 00000000 */  nop
/* 49BD0 8005BFB0 F0FFC2AC */  sw         $v0, -0x10($a2)
/* 49BD4 8005BFB4 0400628E */  lw         $v0, (0x1F800004 & 0xFFFF)($s3)
/* 49BD8 8005BFB8 00000000 */  nop
/* 49BDC 8005BFBC F8FFC2AC */  sw         $v0, -0x8($a2)
/* 49BE0 8005BFC0 0800628E */  lw         $v0, (0x1F800008 & 0xFFFF)($s3)
/* 49BE4 8005BFC4 14700108 */  j          .L8005C050
/* 49BE8 8005BFC8 0000C2AC */   sw        $v0, 0x0($a2)
.L8005BFCC:
/* 49BEC 8005BFCC 2000628E */  lw         $v0, (0x1F800020 & 0xFFFF)($s3)
/* 49BF0 8005BFD0 00000000 */  nop
/* 49BF4 8005BFD4 E8FFC2AC */  sw         $v0, -0x18($a2)
/* 49BF8 8005BFD8 0000628E */  lw         $v0, (0x1F800000 & 0xFFFF)($s3)
/* 49BFC 8005BFDC 00000000 */  nop
/* 49C00 8005BFE0 F0FFC2AC */  sw         $v0, -0x10($a2)
/* 49C04 8005BFE4 1C00628E */  lw         $v0, (0x1F80001C & 0xFFFF)($s3)
/* 49C08 8005BFE8 11700108 */  j          .L8005C044
/* 49C0C 8005BFEC F8FFC2AC */   sw        $v0, -0x8($a2)
.L8005BFF0:
/* 49C10 8005BFF0 1000628E */  lw         $v0, (0x1F800010 & 0xFFFF)($s3)
/* 49C14 8005BFF4 00000000 */  nop
/* 49C18 8005BFF8 E8FFC2AC */  sw         $v0, -0x18($a2)
/* 49C1C 8005BFFC 0000628E */  lw         $v0, (0x1F800000 & 0xFFFF)($s3)
/* 49C20 8005C000 00000000 */  nop
/* 49C24 8005C004 F0FFC2AC */  sw         $v0, -0x10($a2)
/* 49C28 8005C008 0C00628E */  lw         $v0, (0x1F80000C & 0xFFFF)($s3)
/* 49C2C 8005C00C 00000000 */  nop
/* 49C30 8005C010 F8FFC2AC */  sw         $v0, -0x8($a2)
/* 49C34 8005C014 0800628E */  lw         $v0, (0x1F800008 & 0xFFFF)($s3)
/* 49C38 8005C018 14700108 */  j          .L8005C050
/* 49C3C 8005C01C 0000C2AC */   sw        $v0, 0x0($a2)
.L8005C020:
/* 49C40 8005C020 1000628E */  lw         $v0, (0x1F800010 & 0xFFFF)($s3)
/* 49C44 8005C024 00000000 */  nop
/* 49C48 8005C028 E8FFC2AC */  sw         $v0, -0x18($a2)
/* 49C4C 8005C02C 0000628E */  lw         $v0, (0x1F800000 & 0xFFFF)($s3)
/* 49C50 8005C030 00000000 */  nop
/* 49C54 8005C034 F0FFC2AC */  sw         $v0, -0x10($a2)
/* 49C58 8005C038 1400628E */  lw         $v0, (0x1F800014 & 0xFFFF)($s3)
/* 49C5C 8005C03C 00000000 */  nop
/* 49C60 8005C040 F8FFC2AC */  sw         $v0, -0x8($a2)
.L8005C044:
/* 49C64 8005C044 1800628E */  lw         $v0, (0x1F800018 & 0xFFFF)($s3)
/* 49C68 8005C048 00000000 */  nop
/* 49C6C 8005C04C 0000C2AC */  sw         $v0, 0x0($a2)
.L8005C050:
/* 49C70 8005C050 2400628E */  lw         $v0, (0x1F800024 & 0xFFFF)($s3)
/* 49C74 8005C054 FFFF4382 */  lb         $v1, -0x1($s2)
/* 49C78 8005C058 03120200 */  sra        $v0, $v0, 8
/* 49C7C 8005C05C 21184300 */  addu       $v1, $v0, $v1
/* 49C80 8005C060 03006104 */  bgez       $v1, .L8005C070
/* 49C84 8005C064 00046228 */   slti      $v0, $v1, 0x400
/* 49C88 8005C068 21180000 */  addu       $v1, $zero, $zero
/* 49C8C 8005C06C 00046228 */  slti       $v0, $v1, 0x400
.L8005C070:
/* 49C90 8005C070 02004014 */  bnez       $v0, .L8005C07C
/* 49C94 8005C074 FF00053C */   lui       $a1, (0xFFFFFF >> 16)
/* 49C98 8005C078 FF030324 */  addiu      $v1, $zero, 0x3FF
.L8005C07C:
/* 49C9C 8005C07C FFFFA534 */  ori        $a1, $a1, (0xFFFFFF & 0xFFFF)
/* 49CA0 8005C080 2800C624 */  addiu      $a2, $a2, 0x28
/* 49CA4 8005C084 0100E724 */  addiu      $a3, $a3, 0x1
/* 49CA8 8005C088 80100300 */  sll        $v0, $v1, 2
/* 49CAC 8005C08C 3C02648E */  lw         $a0, (0x1F80023C & 0xFFFF)($s3)
/* 49CB0 8005C090 2428C503 */  and        $a1, $fp, $a1
/* 49CB4 8005C094 21208200 */  addu       $a0, $a0, $v0
/* 49CB8 8005C098 0000838C */  lw         $v1, 0x0($a0)
/* 49CBC 8005C09C 0009023C */  lui        $v0, (0x9000000 >> 16)
/* 49CC0 8005C0A0 25186200 */  or         $v1, $v1, $v0
/* 49CC4 8005C0A4 0000C3AF */  sw         $v1, 0x0($fp)
/* 49CC8 8005C0A8 2800DE27 */  addiu      $fp, $fp, 0x28
/* 49CCC 8005C0AC 0400E228 */  slti       $v0, $a3, 0x4
/* 49CD0 8005C0B0 9CFF4014 */  bnez       $v0, .L8005BF24
/* 49CD4 8005C0B4 000085AC */   sw        $a1, 0x0($a0)
.L8005C0B8:
/* 49CD8 8005C0B8 28005226 */  addiu      $s2, $s2, 0x28
/* 49CDC 8005C0BC 0000458E */  lw         $a1, 0x0($s2)
/* 49CE0 8005C0C0 00000000 */  nop
/* 49CE4 8005C0C4 4CFEA014 */  bnez       $a1, .L8005B9F8
/* 49CE8 8005C0C8 2800B526 */   addiu     $s5, $s5, 0x28
.L8005C0CC:
/* 49CEC 8005C0CC FFFFF726 */  addiu      $s7, $s7, -0x1
/* 49CF0 8005C0D0 0FFEE106 */  bgez       $s7, .L8005B910
/* 49CF4 8005C0D4 F0FED626 */   addiu     $s6, $s6, -0x110
.L8005C0D8:
/* 49CF8 8005C0D8 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 49CFC 8005C0DC ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 49D00 8005C0E0 00000000 */  nop
/* 49D04 8005C0E4 1000428C */  lw         $v0, 0x10($v0)
/* 49D08 8005C0E8 00000000 */  nop
/* 49D0C 8005C0EC 80005EAC */  sw         $fp, 0x80($v0)
.L8005C0F0:
/* 49D10 8005C0F0 4400BF8F */  lw         $ra, 0x44($sp)
/* 49D14 8005C0F4 4000BE8F */  lw         $fp, 0x40($sp)
/* 49D18 8005C0F8 3C00B78F */  lw         $s7, 0x3C($sp)
/* 49D1C 8005C0FC 3800B68F */  lw         $s6, 0x38($sp)
/* 49D20 8005C100 3400B58F */  lw         $s5, 0x34($sp)
/* 49D24 8005C104 3000B48F */  lw         $s4, 0x30($sp)
/* 49D28 8005C108 2C00B38F */  lw         $s3, 0x2C($sp)
/* 49D2C 8005C10C 2800B28F */  lw         $s2, 0x28($sp)
/* 49D30 8005C110 2400B18F */  lw         $s1, 0x24($sp)
/* 49D34 8005C114 2000B08F */  lw         $s0, 0x20($sp)
/* 49D38 8005C118 0800E003 */  jr         $ra
/* 49D3C 8005C11C 4800BD27 */   addiu     $sp, $sp, 0x48
.size VehGroundShadow_Main, . - VehGroundShadow_Main
