.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel Particle_RenderList
/* 2D1B0 8003F590 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 2D1B4 8003F594 1800B0AF */  sw         $s0, 0x18($sp)
/* 2D1B8 8003F598 21808000 */  addu       $s0, $a0, $zero
/* 2D1BC 8003F59C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 2D1C0 8003F5A0 2188A000 */  addu       $s1, $a1, $zero
/* 2D1C4 8003F5A4 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 2D1C8 8003F5A8 3800BEAF */  sw         $fp, 0x38($sp)
/* 2D1CC 8003F5AC 3400B7AF */  sw         $s7, 0x34($sp)
/* 2D1D0 8003F5B0 3000B6AF */  sw         $s6, 0x30($sp)
/* 2D1D4 8003F5B4 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 2D1D8 8003F5B8 2800B4AF */  sw         $s4, 0x28($sp)
/* 2D1DC 8003F5BC 2400B3AF */  sw         $s3, 0x24($sp)
/* 2D1E0 8003F5C0 440A010C */  jal        DECOMP_PushBuffer_SetPsyqGeom
/* 2D1E4 8003F5C4 2000B2AF */   sw        $s2, 0x20($sp)
/* 2D1E8 8003F5C8 2800028E */  lw         $v0, 0x28($s0)
/* 2D1EC 8003F5CC 801F173C */  lui        $s7, (0x1F800020 >> 16)
/* 2D1F0 8003F5D0 0000E2AE */  sw         $v0, (0x1F800000 & 0xFFFF)($s7)
/* 2D1F4 8003F5D4 2C00028E */  lw         $v0, 0x2C($s0)
/* 2D1F8 8003F5D8 00000000 */  nop
/* 2D1FC 8003F5DC 0400E2AE */  sw         $v0, (0x1F800004 & 0xFFFF)($s7)
/* 2D200 8003F5E0 3000028E */  lw         $v0, 0x30($s0)
/* 2D204 8003F5E4 00000000 */  nop
/* 2D208 8003F5E8 0800E2AE */  sw         $v0, (0x1F800008 & 0xFFFF)($s7)
/* 2D20C 8003F5EC 38000296 */  lhu        $v0, 0x38($s0)
/* 2D210 8003F5F0 3400038E */  lw         $v1, 0x34($s0)
/* 2D214 8003F5F4 1000E2A6 */  sh         $v0, (0x1F800010 & 0xFFFF)($s7)
/* 2D218 8003F5F8 0C00E3AE */  sw         $v1, (0x1F80000C & 0xFFFF)($s7)
/* 2D21C 8003F5FC 0000EC8E */  lw         $t4, (0x1F800000 & 0xFFFF)($s7)
/* 2D220 8003F600 0400ED8E */  lw         $t5, (0x1F800004 & 0xFFFF)($s7)
/* 2D224 8003F604 0040CC48 */  ctc2       $t4, $8 /* handwritten instruction */
/* 2D228 8003F608 0048CD48 */  ctc2       $t5, $9 /* handwritten instruction */
/* 2D22C 8003F60C 0800EC8E */  lw         $t4, (0x1F800008 & 0xFFFF)($s7)
/* 2D230 8003F610 0C00ED8E */  lw         $t5, (0x1F80000C & 0xFFFF)($s7)
/* 2D234 8003F614 1000EE8E */  lw         $t6, (0x1F800010 & 0xFFFF)($s7)
/* 2D238 8003F618 0050CC48 */  ctc2       $t4, $10 /* handwritten instruction */
/* 2D23C 8003F61C 0058CD48 */  ctc2       $t5, $11 /* handwritten instruction */
/* 2D240 8003F620 0060CE48 */  ctc2       $t6, $12 /* handwritten instruction */
/* 2D244 8003F624 F400028E */  lw         $v0, 0xF4($s0)
/* 2D248 8003F628 00000000 */  nop
/* 2D24C 8003F62C 2000E2AE */  sw         $v0, (0x1F800020 & 0xFFFF)($s7)
/* 2D250 8003F630 7C00028E */  lw         $v0, 0x7C($s0)
/* 2D254 8003F634 08011E82 */  lb         $fp, 0x108($s0)
/* 2D258 8003F638 80100200 */  sll        $v0, $v0, 2
/* 2D25C 8003F63C 2400E2AE */  sw         $v0, (0x1F800024 & 0xFFFF)($s7)
/* 2D260 8003F640 8000028E */  lw         $v0, 0x80($s0)
/* 2D264 8003F644 00000000 */  nop
/* 2D268 8003F648 80100200 */  sll        $v0, $v0, 2
/* 2D26C 8003F64C 2800E2AE */  sw         $v0, (0x1F800028 & 0xFFFF)($s7)
/* 2D270 8003F650 8400028E */  lw         $v0, 0x84($s0)
/* 2D274 8003F654 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 2D278 8003F658 ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 2D27C 8003F65C 80100200 */  sll        $v0, $v0, 2
/* 2D280 8003F660 2C00E2AE */  sw         $v0, (0x1F80002C & 0xFFFF)($s7)
/* 2D284 8003F664 A41C838C */  lw         $v1, 0x1CA4($a0)
/* 2D288 8003F668 00000000 */  nop
/* 2D28C 8003F66C 80100300 */  sll        $v0, $v1, 2
/* 2D290 8003F670 21104300 */  addu       $v0, $v0, $v1
/* 2D294 8003F674 1000838C */  lw         $v1, 0x10($a0)
/* 2D298 8003F678 C0100200 */  sll        $v0, $v0, 3
/* 2D29C 8003F67C 8000648C */  lw         $a0, 0x80($v1)
/* 2D2A0 8003F680 8400638C */  lw         $v1, 0x84($v1)
/* 2D2A4 8003F684 21108200 */  addu       $v0, $a0, $v0
/* 2D2A8 8003F688 2B104300 */  sltu       $v0, $v0, $v1
/* 2D2AC 8003F68C 12034010 */  beqz       $v0, .L800402D8
/* 2D2B0 8003F690 00000000 */   nop
/* 2D2B4 8003F694 0A032012 */  beqz       $s1, .L800402C0
/* 2D2B8 8003F698 21988000 */   addu      $s3, $a0, $zero
/* 2D2BC 8003F69C 0880023C */  lui        $v0, %hi(D_800845A0)
/* 2D2C0 8003F6A0 A0455824 */  addiu      $t8, $v0, %lo(D_800845A0)
/* 2D2C4 8003F6A4 20007426 */  addiu      $s4, $s3, 0x20
.L8003F6A8:
/* 2D2C8 8003F6A8 19002382 */  lb         $v1, 0x19($s1)
/* 2D2CC 8003F6AC FFFF0224 */  addiu      $v0, $zero, -0x1
/* 2D2D0 8003F6B0 03006210 */  beq        $v1, $v0, .L8003F6C0
/* 2D2D4 8003F6B4 00000000 */   nop
/* 2D2D8 8003F6B8 FD027E14 */  bne        $v1, $fp, .L800402B0
/* 2D2DC 8003F6BC 00000000 */   nop
.L8003F6C0:
/* 2D2E0 8003F6C0 0C00248E */  lw         $a0, 0xC($s1)
/* 2D2E4 8003F6C4 00000000 */  nop
/* 2D2E8 8003F6C8 F9028010 */  beqz       $a0, .L800402B0
/* 2D2EC 8003F6CC 00000000 */   nop
/* 2D2F0 8003F6D0 14003096 */  lhu        $s0, 0x14($s1)
/* 2D2F4 8003F6D4 00000000 */  nop
/* 2D2F8 8003F6D8 00040232 */  andi       $v0, $s0, 0x400
/* 2D2FC 8003F6DC 15004010 */  beqz       $v0, .L8003F734
/* 2D300 8003F6E0 00000000 */   nop
/* 2D304 8003F6E4 7400228E */  lw         $v0, 0x74($s1)
/* 2D308 8003F6E8 00000000 */  nop
/* 2D30C 8003F6EC 034A0200 */  sra        $t1, $v0, 8
/* 2D310 8003F6F0 02002105 */  bgez       $t1, .L8003F6FC
/* 2D314 8003F6F4 00000000 */   nop
/* 2D318 8003F6F8 21480000 */  addu       $t1, $zero, $zero
.L8003F6FC:
/* 2D31C 8003F6FC 12008384 */  lh         $v1, 0x12($a0)
/* 2D320 8003F700 00000000 */  nop
/* 2D324 8003F704 2A102301 */  slt        $v0, $t1, $v1
/* 2D328 8003F708 02004014 */  bnez       $v0, .L8003F714
/* 2D32C 8003F70C 00000000 */   nop
/* 2D330 8003F710 FFFF6924 */  addiu      $t1, $v1, -0x1
.L8003F714:
/* 2D334 8003F714 E6022005 */  bltz       $t1, .L800402B0
/* 2D338 8003F718 80100900 */   sll       $v0, $t1, 2
/* 2D33C 8003F71C 21108200 */  addu       $v0, $a0, $v0
/* 2D340 8003F720 1400428C */  lw         $v0, 0x14($v0)
/* 2D344 8003F724 00000000 */  nop
/* 2D348 8003F728 21904000 */  addu       $s2, $v0, $zero
/* 2D34C 8003F72C CEFD0008 */  j          .L8003F738
/* 2D350 8003F730 080032AE */   sw        $s2, 0x8($s1)
.L8003F734:
/* 2D354 8003F734 0800328E */  lw         $s2, 0x8($s1)
.L8003F738:
/* 2D358 8003F738 00000000 */  nop
/* 2D35C 8003F73C DC024012 */  beqz       $s2, .L800402B0
/* 2D360 8003F740 21B00000 */   addu      $s6, $zero, $zero
/* 2D364 8003F744 2400228E */  lw         $v0, 0x24($s1)
/* 2D368 8003F748 2C00238E */  lw         $v1, 0x2C($s1)
/* 2D36C 8003F74C 12003596 */  lhu        $s5, 0x12($s1)
/* 2D370 8003F750 83290200 */  sra        $a1, $v0, 6
/* 2D374 8003F754 3400228E */  lw         $v0, 0x34($s1)
/* 2D378 8003F758 00000000 */  nop
/* 2D37C 8003F75C 83210200 */  sra        $a0, $v0, 6
/* 2D380 8003F760 0008A232 */  andi       $v0, $s5, 0x800
/* 2D384 8003F764 21004010 */  beqz       $v0, .L8003F7EC
/* 2D388 8003F768 83310300 */   sra       $a2, $v1, 6
/* 2D38C 8003F76C 2000238E */  lw         $v1, 0x20($s1)
/* 2D390 8003F770 00000000 */  nop
/* 2D394 8003F774 1D006010 */  beqz       $v1, .L8003F7EC
/* 2D398 8003F778 00111E00 */   sll       $v0, $fp, 4
/* 2D39C 8003F77C 21105E00 */  addu       $v0, $v0, $fp
/* 2D3A0 8003F780 C0100200 */  sll        $v0, $v0, 3
/* 2D3A4 8003F784 74004224 */  addiu      $v0, $v0, 0x74
/* 2D3A8 8003F788 21B06200 */  addu       $s6, $v1, $v0
/* 2D3AC 8003F78C 4400C78E */  lw         $a3, 0x44($s6)
/* 2D3B0 8003F790 00000000 */  nop
/* 2D3B4 8003F794 4000E230 */  andi       $v0, $a3, 0x40
/* 2D3B8 8003F798 C5024010 */  beqz       $v0, .L800402B0
/* 2D3BC 8003F79C 00000000 */   nop
/* 2D3C0 8003F7A0 4400628C */  lw         $v0, 0x44($v1)
/* 2D3C4 8003F7A4 00000000 */  nop
/* 2D3C8 8003F7A8 80100200 */  sll        $v0, $v0, 2
/* 2D3CC 8003F7AC 2128A200 */  addu       $a1, $a1, $v0
/* 2D3D0 8003F7B0 0080A232 */  andi       $v0, $s5, 0x8000
/* 2D3D4 8003F7B4 05004014 */  bnez       $v0, .L8003F7CC
/* 2D3D8 8003F7B8 00000000 */   nop
/* 2D3DC 8003F7BC 4800628C */  lw         $v0, 0x48($v1)
/* 2D3E0 8003F7C0 00000000 */  nop
/* 2D3E4 8003F7C4 80100200 */  sll        $v0, $v0, 2
/* 2D3E8 8003F7C8 2130C200 */  addu       $a2, $a2, $v0
.L8003F7CC:
/* 2D3EC 8003F7CC 4C00628C */  lw         $v0, 0x4C($v1)
/* 2D3F0 8003F7D0 00000000 */  nop
/* 2D3F4 8003F7D4 80100200 */  sll        $v0, $v0, 2
/* 2D3F8 8003F7D8 21208200 */  addu       $a0, $a0, $v0
/* 2D3FC 8003F7DC 0001E230 */  andi       $v0, $a3, 0x100
/* 2D400 8003F7E0 02004010 */  beqz       $v0, .L8003F7EC
/* 2D404 8003F7E4 00000000 */   nop
/* 2D408 8003F7E8 21B00000 */  addu       $s6, $zero, $zero
.L8003F7EC:
/* 2D40C 8003F7EC 2400E28E */  lw         $v0, (0x1F800024 & 0xFFFF)($s7)
/* 2D410 8003F7F0 2C00E38E */  lw         $v1, (0x1F80002C & 0xFFFF)($s7)
/* 2D414 8003F7F4 2328A200 */  subu       $a1, $a1, $v0
/* 2D418 8003F7F8 2800E28E */  lw         $v0, (0x1F800028 & 0xFFFF)($s7)
/* 2D41C 8003F7FC 00000000 */  nop
/* 2D420 8003F800 2330C200 */  subu       $a2, $a2, $v0
/* 2D424 8003F804 0200A104 */  bgez       $a1, .L8003F810
/* 2D428 8003F808 2110A000 */   addu      $v0, $a1, $zero
/* 2D42C 8003F80C 23100200 */  negu       $v0, $v0
.L8003F810:
/* 2D430 8003F810 31754228 */  slti       $v0, $v0, 0x7531
/* 2D434 8003F814 A6024010 */  beqz       $v0, .L800402B0
/* 2D438 8003F818 23208300 */   subu      $a0, $a0, $v1
/* 2D43C 8003F81C 0200C104 */  bgez       $a2, .L8003F828
/* 2D440 8003F820 2110C000 */   addu      $v0, $a2, $zero
/* 2D444 8003F824 23100200 */  negu       $v0, $v0
.L8003F828:
/* 2D448 8003F828 31754228 */  slti       $v0, $v0, 0x7531
/* 2D44C 8003F82C A0024010 */  beqz       $v0, .L800402B0
/* 2D450 8003F830 00000000 */   nop
/* 2D454 8003F834 02008104 */  bgez       $a0, .L8003F840
/* 2D458 8003F838 21108000 */   addu      $v0, $a0, $zero
/* 2D45C 8003F83C 23100200 */  negu       $v0, $v0
.L8003F840:
/* 2D460 8003F840 31754228 */  slti       $v0, $v0, 0x7531
/* 2D464 8003F844 9A024010 */  beqz       $v0, .L800402B0
/* 2D468 8003F848 FFFFA230 */   andi      $v0, $a1, 0xFFFF
/* 2D46C 8003F84C 001C0600 */  sll        $v1, $a2, 16
/* 2D470 8003F850 25104300 */  or         $v0, $v0, $v1
/* 2D474 8003F854 00008248 */  mtc2       $v0, $0 /* handwritten instruction */
/* 2D478 8003F858 00088448 */  mtc2       $a0, $1 /* handwritten instruction */
/* 2D47C 8003F85C 00000000 */  nop
/* 2D480 8003F860 00000000 */  nop
/* 2D484 8003F864 12604A4A */  MVMVA      1, 1, 0, 3, 0
/* 2D488 8003F868 00C80C48 */  mfc2       $t4, $25 /* handwritten instruction */
/* 2D48C 8003F86C 00D00D48 */  mfc2       $t5, $26 /* handwritten instruction */
/* 2D490 8003F870 00D80E48 */  mfc2       $t6, $27 /* handwritten instruction */
/* 2D494 8003F874 0028CC48 */  ctc2       $t4, $5 /* handwritten instruction */
/* 2D498 8003F878 0030CD48 */  ctc2       $t5, $6 /* handwritten instruction */
/* 2D49C 8003F87C 0038CE48 */  ctc2       $t6, $7 /* handwritten instruction */
/* 2D4A0 8003F880 00D80848 */  mfc2       $t0, $27 /* handwritten instruction */
/* 2D4A4 8003F884 00000000 */  nop
/* 2D4A8 8003F888 89020005 */  bltz       $t0, .L800402B0
/* 2D4AC 8003F88C 00000000 */   nop
/* 2D4B0 8003F890 1A002286 */  lh         $v0, 0x1A($s1)
/* 2D4B4 8003F894 00000000 */  nop
/* 2D4B8 8003F898 80100200 */  sll        $v0, $v0, 2
/* 2D4BC 8003F89C 2A104800 */  slt        $v0, $v0, $t0
/* 2D4C0 8003F8A0 83024014 */  bnez       $v0, .L800402B0
/* 2D4C4 8003F8A4 21200002 */   addu      $a0, $s0, $zero
/* 2D4C8 8003F8A8 2128A002 */  addu       $a1, $s5, $zero
/* 2D4CC 8003F8AC 21302002 */  addu       $a2, $s1, $zero
/* 2D4D0 8003F8B0 31FD000C */  jal        DECOMP_Particle_SetColors
/* 2D4D4 8003F8B4 1000B8AF */   sw        $t8, 0x10($sp)
/* 2D4D8 8003F8B8 21784000 */  addu       $t7, $v0, $zero
/* 2D4DC 8003F8BC 0010A232 */  andi       $v0, $s5, 0x1000
/* 2D4E0 8003F8C0 1000B88F */  lw         $t8, 0x10($sp)
/* 2D4E4 8003F8C4 5D004010 */  beqz       $v0, .L8003FA3C
/* 2D4E8 8003F8C8 21306002 */   addu      $a2, $s3, $zero
/* 2D4EC 8003F8CC 0000EC8E */  lw         $t4, (0x1F800000 & 0xFFFF)($s7)
/* 2D4F0 8003F8D0 0400ED8E */  lw         $t5, (0x1F800004 & 0xFFFF)($s7)
/* 2D4F4 8003F8D4 0000CC48 */  ctc2       $t4, $0 /* handwritten instruction */
/* 2D4F8 8003F8D8 0008CD48 */  ctc2       $t5, $1 /* handwritten instruction */
/* 2D4FC 8003F8DC 0800EC8E */  lw         $t4, (0x1F800008 & 0xFFFF)($s7)
/* 2D500 8003F8E0 0C00ED8E */  lw         $t5, (0x1F80000C & 0xFFFF)($s7)
/* 2D504 8003F8E4 1000EE8E */  lw         $t6, (0x1F800010 & 0xFFFF)($s7)
/* 2D508 8003F8E8 0010CC48 */  ctc2       $t4, $2 /* handwritten instruction */
/* 2D50C 8003F8EC 0018CD48 */  ctc2       $t5, $3 /* handwritten instruction */
/* 2D510 8003F8F0 0020CE48 */  ctc2       $t6, $4 /* handwritten instruction */
/* 2D514 8003F8F4 21C80000 */  addu       $t9, $zero, $zero
/* 2D518 8003F8F8 00009948 */  mtc2       $t9, $0 /* handwritten instruction */
/* 2D51C 8003F8FC 00089948 */  mtc2       $t9, $1 /* handwritten instruction */
/* 2D520 8003F900 20000232 */  andi       $v0, $s0, 0x20
/* 2D524 8003F904 1D004010 */  beqz       $v0, .L8003F97C
/* 2D528 8003F908 00000000 */   nop
/* 2D52C 8003F90C 5400238E */  lw         $v1, 0x54($s1)
/* 2D530 8003F910 2C00228E */  lw         $v0, 0x2C($s1)
/* 2D534 8003F914 4C00248E */  lw         $a0, 0x4C($s1)
/* 2D538 8003F918 23186200 */  subu       $v1, $v1, $v0
/* 2D53C 8003F91C 83190300 */  sra        $v1, $v1, 6
/* 2D540 8003F920 18006400 */  mult       $v1, $a0
/* 2D544 8003F924 4400228E */  lw         $v0, 0x44($s1)
/* 2D548 8003F928 3400238E */  lw         $v1, 0x34($s1)
/* 2D54C 8003F92C 12380000 */  mflo       $a3
/* 2D550 8003F930 23104300 */  subu       $v0, $v0, $v1
/* 2D554 8003F934 83110200 */  sra        $v0, $v0, 6
/* 2D558 8003F938 18004400 */  mult       $v0, $a0
/* 2D55C 8003F93C 2400238E */  lw         $v1, 0x24($s1)
/* 2D560 8003F940 3C00228E */  lw         $v0, 0x3C($s1)
/* 2D564 8003F944 12280000 */  mflo       $a1
/* 2D568 8003F948 23104300 */  subu       $v0, $v0, $v1
/* 2D56C 8003F94C 83110200 */  sra        $v0, $v0, 6
/* 2D570 8003F950 18004400 */  mult       $v0, $a0
/* 2D574 8003F954 03440700 */  sra        $t0, $a3, 16
/* 2D578 8003F958 032C0500 */  sra        $a1, $a1, 16
/* 2D57C 8003F95C 12180000 */  mflo       $v1
/* 2D580 8003F960 02140300 */  srl        $v0, $v1, 16
/* 2D584 8003F964 001C0800 */  sll        $v1, $t0, 16
/* 2D588 8003F968 25104300 */  or         $v0, $v0, $v1
/* 2D58C 8003F96C 00108248 */  mtc2       $v0, $2 /* handwritten instruction */
/* 2D590 8003F970 00188548 */  mtc2       $a1, $3 /* handwritten instruction */
/* 2D594 8003F974 71FE0008 */  j          .L8003F9C4
/* 2D598 8003F978 00000000 */   nop
.L8003F97C:
/* 2D59C 8003F97C 3C00238E */  lw         $v1, 0x3C($s1)
/* 2D5A0 8003F980 2400228E */  lw         $v0, 0x24($s1)
/* 2D5A4 8003F984 2C00248E */  lw         $a0, 0x2C($s1)
/* 2D5A8 8003F988 23186200 */  subu       $v1, $v1, $v0
/* 2D5AC 8003F98C 83190300 */  sra        $v1, $v1, 6
/* 2D5B0 8003F990 5400228E */  lw         $v0, 0x54($s1)
/* 2D5B4 8003F994 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 2D5B8 8003F998 23104400 */  subu       $v0, $v0, $a0
/* 2D5BC 8003F99C 83110200 */  sra        $v0, $v0, 6
/* 2D5C0 8003F9A0 00140200 */  sll        $v0, $v0, 16
/* 2D5C4 8003F9A4 25186200 */  or         $v1, $v1, $v0
/* 2D5C8 8003F9A8 00108348 */  mtc2       $v1, $2 /* handwritten instruction */
/* 2D5CC 8003F9AC 4400228E */  lw         $v0, 0x44($s1)
/* 2D5D0 8003F9B0 3400238E */  lw         $v1, 0x34($s1)
/* 2D5D4 8003F9B4 00000000 */  nop
/* 2D5D8 8003F9B8 23104300 */  subu       $v0, $v0, $v1
/* 2D5DC 8003F9BC 83110200 */  sra        $v0, $v0, 6
/* 2D5E0 8003F9C0 00188248 */  mtc2       $v0, $3 /* handwritten instruction */
.L8003F9C4:
/* 2D5E4 8003F9C4 00000000 */  nop
/* 2D5E8 8003F9C8 00000000 */  nop
/* 2D5EC 8003F9CC 3000284A */  RTPT
/* 2D5F0 8003F9D0 0050023C */  lui        $v0, (0x50000000 >> 16)
/* 2D5F4 8003F9D4 2578E201 */  or         $t7, $t7, $v0
/* 2D5F8 8003F9D8 0020A232 */  andi       $v0, $s5, 0x2000
/* 2D5FC 8003F9DC 05004010 */  beqz       $v0, .L8003F9F4
/* 2D600 8003F9E0 00000000 */   nop
/* 2D604 8003F9E4 7400228E */  lw         $v0, 0x74($s1)
/* 2D608 8003F9E8 1400CFAC */  sw         $t7, 0x14($a2)
/* 2D60C 8003F9EC 80FE0008 */  j          .L8003FA00
/* 2D610 8003F9F0 0C00C2AC */   sw        $v0, 0xC($a2)
.L8003F9F4:
/* 2D614 8003F9F4 7400228E */  lw         $v0, 0x74($s1)
/* 2D618 8003F9F8 0C00CFAC */  sw         $t7, 0xC($a2)
/* 2D61C 8003F9FC 1400C2AC */  sw         $v0, 0x14($a2)
.L8003FA00:
/* 2D620 8003FA00 00E1033C */  lui        $v1, (0xE1000A00 >> 16)
/* 2D624 8003FA04 000A6334 */  ori        $v1, $v1, (0xE1000A00 & 0xFFFF)
/* 2D628 8003FA08 6000A232 */  andi       $v0, $s5, 0x60
/* 2D62C 8003FA0C 25104300 */  or         $v0, $v0, $v1
/* 2D630 8003FA10 78002FAE */  sw         $t7, 0x78($s1)
/* 2D634 8003FA14 0400C2AC */  sw         $v0, 0x4($a2)
/* 2D638 8003FA18 1000C224 */  addiu      $v0, $a2, 0x10
/* 2D63C 8003FA1C 0800C0AC */  sw         $zero, 0x8($a2)
/* 2D640 8003FA20 00004CE8 */  swc2       $12, 0x0($v0)
/* 2D644 8003FA24 1800C224 */  addiu      $v0, $a2, 0x18
/* 2D648 8003FA28 00004DE8 */  swc2       $13, 0x0($v0)
/* 2D64C 8003FA2C 3000E226 */  addiu      $v0, $s7, %lo(D_1F800030)
/* 2D650 8003FA30 000051E8 */  swc2       $17, 0x0($v0)
/* 2D654 8003FA34 77000108 */  j          .L800401DC
/* 2D658 8003FA38 00000000 */   nop
.L8003FA3C:
/* 2D65C 8003FA3C 002C023C */  lui        $v0, (0x2C000000 >> 16)
/* 2D660 8003FA40 2578E201 */  or         $t7, $t7, $v0
/* 2D664 8003FA44 00200924 */  addiu      $t1, $zero, 0x2000
/* 2D668 8003FA48 21400000 */  addu       $t0, $zero, $zero
/* 2D66C 8003FA4C 00100524 */  addiu      $a1, $zero, 0x1000
/* 2D670 8003FA50 21500001 */  addu       $t2, $t0, $zero
/* 2D674 8003FA54 08000232 */  andi       $v0, $s0, 0x8
/* 2D678 8003FA58 1D014010 */  beqz       $v0, .L8003FED0
/* 2D67C 8003FA5C 2160A000 */   addu      $t4, $a1, $zero
/* 2D680 8003FA60 10000232 */  andi       $v0, $s0, 0x10
/* 2D684 8003FA64 CC004010 */  beqz       $v0, .L8003FD98
/* 2D688 8003FA68 00000000 */   nop
/* 2D68C 8003FA6C 3C00238E */  lw         $v1, 0x3C($s1)
/* 2D690 8003FA70 00000000 */  nop
/* 2D694 8003FA74 FF036230 */  andi       $v0, $v1, 0x3FF
/* 2D698 8003FA78 80100200 */  sll        $v0, $v0, 2
/* 2D69C 8003FA7C 21105800 */  addu       $v0, $v0, $t8
/* 2D6A0 8003FA80 0000448C */  lw         $a0, 0x0($v0)
/* 2D6A4 8003FA84 00046230 */  andi       $v0, $v1, 0x400
/* 2D6A8 8003FA88 07004010 */  beqz       $v0, .L8003FAA8
/* 2D6AC 8003FA8C 00140400 */   sll       $v0, $a0, 16
/* 2D6B0 8003FA90 033C0200 */  sra        $a3, $v0, 16
/* 2D6B4 8003FA94 00086230 */  andi       $v0, $v1, 0x800
/* 2D6B8 8003FA98 09004014 */  bnez       $v0, .L8003FAC0
/* 2D6BC 8003FA9C 03240400 */   sra       $a0, $a0, 16
/* 2D6C0 8003FAA0 B1FE0008 */  j          .L8003FAC4
/* 2D6C4 8003FAA4 23380700 */   negu      $a3, $a3
.L8003FAA8:
/* 2D6C8 8003FAA8 033C0400 */  sra        $a3, $a0, 16
/* 2D6CC 8003FAAC 00240400 */  sll        $a0, $a0, 16
/* 2D6D0 8003FAB0 00086230 */  andi       $v0, $v1, 0x800
/* 2D6D4 8003FAB4 03004010 */  beqz       $v0, .L8003FAC4
/* 2D6D8 8003FAB8 03240400 */   sra       $a0, $a0, 16
/* 2D6DC 8003FABC 23380700 */  negu       $a3, $a3
.L8003FAC0:
/* 2D6E0 8003FAC0 23200400 */  negu       $a0, $a0
.L8003FAC4:
/* 2D6E4 8003FAC4 4400238E */  lw         $v1, 0x44($s1)
/* 2D6E8 8003FAC8 00000000 */  nop
/* 2D6EC 8003FACC FF036230 */  andi       $v0, $v1, 0x3FF
/* 2D6F0 8003FAD0 80100200 */  sll        $v0, $v0, 2
/* 2D6F4 8003FAD4 21105800 */  addu       $v0, $v0, $t8
/* 2D6F8 8003FAD8 0000468C */  lw         $a2, 0x0($v0)
/* 2D6FC 8003FADC 00046230 */  andi       $v0, $v1, 0x400
/* 2D700 8003FAE0 07004010 */  beqz       $v0, .L8003FB00
/* 2D704 8003FAE4 00140600 */   sll       $v0, $a2, 16
/* 2D708 8003FAE8 03440200 */  sra        $t0, $v0, 16
/* 2D70C 8003FAEC 00086230 */  andi       $v0, $v1, 0x800
/* 2D710 8003FAF0 09004014 */  bnez       $v0, .L8003FB18
/* 2D714 8003FAF4 03340600 */   sra       $a2, $a2, 16
/* 2D718 8003FAF8 C7FE0008 */  j          .L8003FB1C
/* 2D71C 8003FAFC 23400800 */   negu      $t0, $t0
.L8003FB00:
/* 2D720 8003FB00 03440600 */  sra        $t0, $a2, 16
/* 2D724 8003FB04 00340600 */  sll        $a2, $a2, 16
/* 2D728 8003FB08 00086230 */  andi       $v0, $v1, 0x800
/* 2D72C 8003FB0C 03004010 */  beqz       $v0, .L8003FB1C
/* 2D730 8003FB10 03340600 */   sra       $a2, $a2, 16
/* 2D734 8003FB14 23400800 */  negu       $t0, $t0
.L8003FB18:
/* 2D738 8003FB18 23300600 */  negu       $a2, $a2
.L8003FB1C:
/* 2D73C 8003FB1C 20000232 */  andi       $v0, $s0, 0x20
/* 2D740 8003FB20 55004010 */  beqz       $v0, .L8003FC78
/* 2D744 8003FB24 40000232 */   andi      $v0, $s0, 0x40
/* 2D748 8003FB28 4C00298E */  lw         $t1, 0x4C($s1)
/* 2D74C 8003FB2C 31004010 */  beqz       $v0, .L8003FBF4
/* 2D750 8003FB30 18000901 */   mult      $t0, $t1
/* 2D754 8003FB34 12500000 */  mflo       $t2
/* 2D758 8003FB38 00000000 */  nop
/* 2D75C 8003FB3C 00000000 */  nop
/* 2D760 8003FB40 1800C900 */  mult       $a2, $t1
/* 2D764 8003FB44 12480000 */  mflo       $t1
/* 2D768 8003FB48 23100600 */  negu       $v0, $a2
/* 2D76C 8003FB4C 00000000 */  nop
/* 2D770 8003FB50 1800E200 */  mult       $a3, $v0
/* 2D774 8003FB54 12580000 */  mflo       $t3
/* 2D778 8003FB58 00000000 */  nop
/* 2D77C 8003FB5C 00000000 */  nop
/* 2D780 8003FB60 18000701 */  mult       $t0, $a3
/* 2D784 8003FB64 12180000 */  mflo       $v1
/* 2D788 8003FB68 5400258E */  lw         $a1, 0x54($s1)
/* 2D78C 8003FB6C 03130B00 */  sra        $v0, $t3, 12
/* 2D790 8003FB70 18004500 */  mult       $v0, $a1
/* 2D794 8003FB74 12580000 */  mflo       $t3
/* 2D798 8003FB78 03130300 */  sra        $v0, $v1, 12
/* 2D79C 8003FB7C 00000000 */  nop
/* 2D7A0 8003FB80 18004500 */  mult       $v0, $a1
/* 2D7A4 8003FB84 12680000 */  mflo       $t5
/* 2D7A8 8003FB88 00000000 */  nop
/* 2D7AC 8003FB8C 00000000 */  nop
/* 2D7B0 8003FB90 18008600 */  mult       $a0, $a2
/* 2D7B4 8003FB94 12800000 */  mflo       $s0
/* 2D7B8 8003FB98 23100400 */  negu       $v0, $a0
/* 2D7BC 8003FB9C 00000000 */  nop
/* 2D7C0 8003FBA0 18004800 */  mult       $v0, $t0
/* 2D7C4 8003FBA4 FFFFEC30 */  andi       $t4, $a3, 0xFFFF
/* 2D7C8 8003FBA8 C31A0A00 */  sra        $v1, $t2, 11
/* 2D7CC 8003FBAC 12300000 */  mflo       $a2
/* 2D7D0 8003FBB0 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 2D7D4 8003FBB4 C3120900 */  sra        $v0, $t1, 11
/* 2D7D8 8003FBB8 18008500 */  mult       $a0, $a1
/* 2D7DC 8003FBBC 00140200 */  sll        $v0, $v0, 16
/* 2D7E0 8003FBC0 25486200 */  or         $t1, $v1, $v0
/* 2D7E4 8003FBC4 031B1000 */  sra        $v1, $s0, 12
/* 2D7E8 8003FBC8 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 2D7EC 8003FBCC 03130600 */  sra        $v0, $a2, 12
/* 2D7F0 8003FBD0 00140200 */  sll        $v0, $v0, 16
/* 2D7F4 8003FBD4 25506200 */  or         $t2, $v1, $v0
/* 2D7F8 8003FBD8 03130B00 */  sra        $v0, $t3, 12
/* 2D7FC 8003FBDC 00440200 */  sll        $t0, $v0, 16
/* 2D800 8003FBE0 031B0D00 */  sra        $v1, $t5, 12
/* 2D804 8003FBE4 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 2D808 8003FBE8 12200000 */  mflo       $a0
/* 2D80C 8003FBEC ABFF0008 */  j          .L8003FEAC
/* 2D810 8003FBF0 03130400 */   sra       $v0, $a0, 12
.L8003FBF4:
/* 2D814 8003FBF4 1800E900 */  mult       $a3, $t1
/* 2D818 8003FBF8 12100000 */  mflo       $v0
/* 2D81C 8003FBFC 00000000 */  nop
/* 2D820 8003FC00 00000000 */  nop
/* 2D824 8003FC04 18008900 */  mult       $a0, $t1
/* 2D828 8003FC08 12200000 */  mflo       $a0
/* 2D82C 8003FC0C 00000000 */  nop
/* 2D830 8003FC10 00000000 */  nop
/* 2D834 8003FC14 1800C900 */  mult       $a2, $t1
/* 2D838 8003FC18 12500000 */  mflo       $t2
/* 2D83C 8003FC1C 00000000 */  nop
/* 2D840 8003FC20 00000000 */  nop
/* 2D844 8003FC24 18000901 */  mult       $t0, $t1
/* 2D848 8003FC28 033B0200 */  sra        $a3, $v0, 12
/* 2D84C 8003FC2C 12180000 */  mflo       $v1
/* 2D850 8003FC30 03330A00 */  sra        $a2, $t2, 12
/* 2D854 8003FC34 23100600 */  negu       $v0, $a2
/* 2D858 8003FC38 1800E200 */  mult       $a3, $v0
/* 2D85C 8003FC3C 12800000 */  mflo       $s0
/* 2D860 8003FC40 03430300 */  sra        $t0, $v1, 12
/* 2D864 8003FC44 00000000 */  nop
/* 2D868 8003FC48 18000701 */  mult       $t0, $a3
/* 2D86C 8003FC4C 12280000 */  mflo       $a1
/* 2D870 8003FC50 03230400 */  sra        $a0, $a0, 12
/* 2D874 8003FC54 00000000 */  nop
/* 2D878 8003FC58 18008600 */  mult       $a0, $a2
/* 2D87C 8003FC5C FFFFEC30 */  andi       $t4, $a3, 0xFFFF
/* 2D880 8003FC60 12580000 */  mflo       $t3
/* 2D884 8003FC64 40180800 */  sll        $v1, $t0, 1
/* 2D888 8003FC68 23100400 */  negu       $v0, $a0
/* 2D88C 8003FC6C 18004800 */  mult       $v0, $t0
/* 2D890 8003FC70 57FF0008 */  j          .L8003FD5C
/* 2D894 8003FC74 FFFF6330 */   andi      $v1, $v1, 0xFFFF
.L8003FC78:
/* 2D898 8003FC78 29004010 */  beqz       $v0, .L8003FD20
/* 2D89C 8003FC7C 23100600 */   negu      $v0, $a2
/* 2D8A0 8003FC80 1800E200 */  mult       $a3, $v0
/* 2D8A4 8003FC84 12480000 */  mflo       $t1
/* 2D8A8 8003FC88 00000000 */  nop
/* 2D8AC 8003FC8C 00000000 */  nop
/* 2D8B0 8003FC90 18000701 */  mult       $t0, $a3
/* 2D8B4 8003FC94 12180000 */  mflo       $v1
/* 2D8B8 8003FC98 5400258E */  lw         $a1, 0x54($s1)
/* 2D8BC 8003FC9C 03130900 */  sra        $v0, $t1, 12
/* 2D8C0 8003FCA0 18004500 */  mult       $v0, $a1
/* 2D8C4 8003FCA4 12580000 */  mflo       $t3
/* 2D8C8 8003FCA8 03130300 */  sra        $v0, $v1, 12
/* 2D8CC 8003FCAC 00000000 */  nop
/* 2D8D0 8003FCB0 18004500 */  mult       $v0, $a1
/* 2D8D4 8003FCB4 12680000 */  mflo       $t5
/* 2D8D8 8003FCB8 00000000 */  nop
/* 2D8DC 8003FCBC 00000000 */  nop
/* 2D8E0 8003FCC0 18008600 */  mult       $a0, $a2
/* 2D8E4 8003FCC4 12800000 */  mflo       $s0
/* 2D8E8 8003FCC8 23100400 */  negu       $v0, $a0
/* 2D8EC 8003FCCC 00000000 */  nop
/* 2D8F0 8003FCD0 18004800 */  mult       $v0, $t0
/* 2D8F4 8003FCD4 FFFFEC30 */  andi       $t4, $a3, 0xFFFF
/* 2D8F8 8003FCD8 12500000 */  mflo       $t2
/* 2D8FC 8003FCDC 401C0600 */  sll        $v1, $a2, 17
/* 2D900 8003FCE0 40100800 */  sll        $v0, $t0, 1
/* 2D904 8003FCE4 18008500 */  mult       $a0, $a1
/* 2D908 8003FCE8 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 2D90C 8003FCEC 25484300 */  or         $t1, $v0, $v1
/* 2D910 8003FCF0 031B1000 */  sra        $v1, $s0, 12
/* 2D914 8003FCF4 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 2D918 8003FCF8 03130A00 */  sra        $v0, $t2, 12
/* 2D91C 8003FCFC 00140200 */  sll        $v0, $v0, 16
/* 2D920 8003FD00 25506200 */  or         $t2, $v1, $v0
/* 2D924 8003FD04 03130B00 */  sra        $v0, $t3, 12
/* 2D928 8003FD08 00440200 */  sll        $t0, $v0, 16
/* 2D92C 8003FD0C 031B0D00 */  sra        $v1, $t5, 12
/* 2D930 8003FD10 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 2D934 8003FD14 12200000 */  mflo       $a0
/* 2D938 8003FD18 ABFF0008 */  j          .L8003FEAC
/* 2D93C 8003FD1C 03130400 */   sra       $v0, $a0, 12
.L8003FD20:
/* 2D940 8003FD20 1800E200 */  mult       $a3, $v0
/* 2D944 8003FD24 12800000 */  mflo       $s0
/* 2D948 8003FD28 00000000 */  nop
/* 2D94C 8003FD2C 00000000 */  nop
/* 2D950 8003FD30 18000701 */  mult       $t0, $a3
/* 2D954 8003FD34 12280000 */  mflo       $a1
/* 2D958 8003FD38 00000000 */  nop
/* 2D95C 8003FD3C 00000000 */  nop
/* 2D960 8003FD40 18008600 */  mult       $a0, $a2
/* 2D964 8003FD44 40180800 */  sll        $v1, $t0, 1
/* 2D968 8003FD48 12580000 */  mflo       $t3
/* 2D96C 8003FD4C FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 2D970 8003FD50 23100400 */  negu       $v0, $a0
/* 2D974 8003FD54 18004800 */  mult       $v0, $t0
/* 2D978 8003FD58 FFFFEC30 */  andi       $t4, $a3, 0xFFFF
.L8003FD5C:
/* 2D97C 8003FD5C 40140600 */  sll        $v0, $a2, 17
/* 2D980 8003FD60 25486200 */  or         $t1, $v1, $v0
/* 2D984 8003FD64 03131000 */  sra        $v0, $s0, 12
/* 2D988 8003FD68 00440200 */  sll        $t0, $v0, 16
/* 2D98C 8003FD6C 03130500 */  sra        $v0, $a1, 12
/* 2D990 8003FD70 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 2D994 8003FD74 001C0400 */  sll        $v1, $a0, 16
/* 2D998 8003FD78 25284300 */  or         $a1, $v0, $v1
/* 2D99C 8003FD7C 031B0B00 */  sra        $v1, $t3, 12
/* 2D9A0 8003FD80 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 2D9A4 8003FD84 12500000 */  mflo       $t2
/* 2D9A8 8003FD88 03130A00 */  sra        $v0, $t2, 12
/* 2D9AC 8003FD8C 00140200 */  sll        $v0, $v0, 16
/* 2D9B0 8003FD90 1D000108 */  j          .L80040074
/* 2D9B4 8003FD94 25506200 */   or        $t2, $v1, $v0
.L8003FD98:
/* 2D9B8 8003FD98 3C00238E */  lw         $v1, 0x3C($s1)
/* 2D9BC 8003FD9C 00000000 */  nop
/* 2D9C0 8003FDA0 FF036230 */  andi       $v0, $v1, 0x3FF
/* 2D9C4 8003FDA4 80100200 */  sll        $v0, $v0, 2
/* 2D9C8 8003FDA8 21105800 */  addu       $v0, $v0, $t8
/* 2D9CC 8003FDAC 0000448C */  lw         $a0, 0x0($v0)
/* 2D9D0 8003FDB0 00046230 */  andi       $v0, $v1, 0x400
/* 2D9D4 8003FDB4 07004010 */  beqz       $v0, .L8003FDD4
/* 2D9D8 8003FDB8 00140400 */   sll       $v0, $a0, 16
/* 2D9DC 8003FDBC 033C0200 */  sra        $a3, $v0, 16
/* 2D9E0 8003FDC0 00086230 */  andi       $v0, $v1, 0x800
/* 2D9E4 8003FDC4 09004014 */  bnez       $v0, .L8003FDEC
/* 2D9E8 8003FDC8 03240400 */   sra       $a0, $a0, 16
/* 2D9EC 8003FDCC 7CFF0008 */  j          .L8003FDF0
/* 2D9F0 8003FDD0 23380700 */   negu      $a3, $a3
.L8003FDD4:
/* 2D9F4 8003FDD4 033C0400 */  sra        $a3, $a0, 16
/* 2D9F8 8003FDD8 00240400 */  sll        $a0, $a0, 16
/* 2D9FC 8003FDDC 00086230 */  andi       $v0, $v1, 0x800
/* 2DA00 8003FDE0 03004010 */  beqz       $v0, .L8003FDF0
/* 2DA04 8003FDE4 03240400 */   sra       $a0, $a0, 16
/* 2DA08 8003FDE8 23380700 */  negu       $a3, $a3
.L8003FDEC:
/* 2DA0C 8003FDEC 23200400 */  negu       $a0, $a0
.L8003FDF0:
/* 2DA10 8003FDF0 20000232 */  andi       $v0, $s0, 0x20
/* 2DA14 8003FDF4 1D004010 */  beqz       $v0, .L8003FE6C
/* 2DA18 8003FDF8 40000232 */   andi      $v0, $s0, 0x40
/* 2DA1C 8003FDFC 4C00298E */  lw         $t1, 0x4C($s1)
/* 2DA20 8003FE00 0A004010 */  beqz       $v0, .L8003FE2C
/* 2DA24 8003FE04 40100900 */   sll       $v0, $t1, 1
/* 2DA28 8003FE08 5400258E */  lw         $a1, 0x54($s1)
/* 2DA2C 8003FE0C 00000000 */  nop
/* 2DA30 8003FE10 1800E500 */  mult       $a3, $a1
/* 2DA34 8003FE14 12180000 */  mflo       $v1
/* 2DA38 8003FE18 00000000 */  nop
/* 2DA3C 8003FE1C 00000000 */  nop
/* 2DA40 8003FE20 18008500 */  mult       $a0, $a1
/* 2DA44 8003FE24 A4FF0008 */  j          .L8003FE90
/* 2DA48 8003FE28 FFFF4930 */   andi      $t1, $v0, 0xFFFF
.L8003FE2C:
/* 2DA4C 8003FE2C 1800E900 */  mult       $a3, $t1
/* 2DA50 8003FE30 12380000 */  mflo       $a3
/* 2DA54 8003FE34 00000000 */  nop
/* 2DA58 8003FE38 00000000 */  nop
/* 2DA5C 8003FE3C 18008900 */  mult       $a0, $t1
/* 2DA60 8003FE40 FFFF4930 */  andi       $t1, $v0, 0xFFFF
/* 2DA64 8003FE44 033B0700 */  sra        $a3, $a3, 12
/* 2DA68 8003FE48 12180000 */  mflo       $v1
/* 2DA6C 8003FE4C 03230300 */  sra        $a0, $v1, 12
/* 2DA70 8003FE50 FFFFE330 */  andi       $v1, $a3, 0xFFFF
/* 2DA74 8003FE54 00140400 */  sll        $v0, $a0, 16
/* 2DA78 8003FE58 25286200 */  or         $a1, $v1, $v0
/* 2DA7C 8003FE5C 23100400 */  negu       $v0, $a0
/* 2DA80 8003FE60 00540200 */  sll        $t2, $v0, 16
/* 2DA84 8003FE64 1D000108 */  j          .L80040074
/* 2DA88 8003FE68 21606000 */   addu      $t4, $v1, $zero
.L8003FE6C:
/* 2DA8C 8003FE6C 12004010 */  beqz       $v0, .L8003FEB8
/* 2DA90 8003FE70 FFFFE230 */   andi      $v0, $a3, 0xFFFF
/* 2DA94 8003FE74 5400258E */  lw         $a1, 0x54($s1)
/* 2DA98 8003FE78 00000000 */  nop
/* 2DA9C 8003FE7C 1800E500 */  mult       $a3, $a1
/* 2DAA0 8003FE80 12180000 */  mflo       $v1
/* 2DAA4 8003FE84 00000000 */  nop
/* 2DAA8 8003FE88 00000000 */  nop
/* 2DAAC 8003FE8C 18008500 */  mult       $a0, $a1
.L8003FE90:
/* 2DAB0 8003FE90 23100400 */  negu       $v0, $a0
/* 2DAB4 8003FE94 00540200 */  sll        $t2, $v0, 16
/* 2DAB8 8003FE98 FFFFEC30 */  andi       $t4, $a3, 0xFFFF
/* 2DABC 8003FE9C 031B0300 */  sra        $v1, $v1, 12
/* 2DAC0 8003FEA0 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 2DAC4 8003FEA4 12280000 */  mflo       $a1
/* 2DAC8 8003FEA8 03130500 */  sra        $v0, $a1, 12
.L8003FEAC:
/* 2DACC 8003FEAC 00140200 */  sll        $v0, $v0, 16
/* 2DAD0 8003FEB0 1D000108 */  j          .L80040074
/* 2DAD4 8003FEB4 25286200 */   or        $a1, $v1, $v0
.L8003FEB8:
/* 2DAD8 8003FEB8 001C0400 */  sll        $v1, $a0, 16
/* 2DADC 8003FEBC 25284300 */  or         $a1, $v0, $v1
/* 2DAE0 8003FEC0 23180400 */  negu       $v1, $a0
/* 2DAE4 8003FEC4 00540300 */  sll        $t2, $v1, 16
/* 2DAE8 8003FEC8 1D000108 */  j          .L80040074
/* 2DAEC 8003FECC 21604000 */   addu      $t4, $v0, $zero
.L8003FED0:
/* 2DAF0 8003FED0 10000232 */  andi       $v0, $s0, 0x10
/* 2DAF4 8003FED4 5A004010 */  beqz       $v0, .L80040040
/* 2DAF8 8003FED8 20000232 */   andi      $v0, $s0, 0x20
/* 2DAFC 8003FEDC 4400238E */  lw         $v1, 0x44($s1)
/* 2DB00 8003FEE0 00000000 */  nop
/* 2DB04 8003FEE4 FF036230 */  andi       $v0, $v1, 0x3FF
/* 2DB08 8003FEE8 80100200 */  sll        $v0, $v0, 2
/* 2DB0C 8003FEEC 21105800 */  addu       $v0, $v0, $t8
/* 2DB10 8003FEF0 0000448C */  lw         $a0, 0x0($v0)
/* 2DB14 8003FEF4 00046230 */  andi       $v0, $v1, 0x400
/* 2DB18 8003FEF8 07004010 */  beqz       $v0, .L8003FF18
/* 2DB1C 8003FEFC 00140400 */   sll       $v0, $a0, 16
/* 2DB20 8003FF00 033C0200 */  sra        $a3, $v0, 16
/* 2DB24 8003FF04 00086230 */  andi       $v0, $v1, 0x800
/* 2DB28 8003FF08 09004014 */  bnez       $v0, .L8003FF30
/* 2DB2C 8003FF0C 03240400 */   sra       $a0, $a0, 16
/* 2DB30 8003FF10 CDFF0008 */  j          .L8003FF34
/* 2DB34 8003FF14 23380700 */   negu      $a3, $a3
.L8003FF18:
/* 2DB38 8003FF18 033C0400 */  sra        $a3, $a0, 16
/* 2DB3C 8003FF1C 00240400 */  sll        $a0, $a0, 16
/* 2DB40 8003FF20 00086230 */  andi       $v0, $v1, 0x800
/* 2DB44 8003FF24 03004010 */  beqz       $v0, .L8003FF34
/* 2DB48 8003FF28 03240400 */   sra       $a0, $a0, 16
/* 2DB4C 8003FF2C 23380700 */  negu       $a3, $a3
.L8003FF30:
/* 2DB50 8003FF30 23200400 */  negu       $a0, $a0
.L8003FF34:
/* 2DB54 8003FF34 20000232 */  andi       $v0, $s0, 0x20
/* 2DB58 8003FF38 26004010 */  beqz       $v0, .L8003FFD4
/* 2DB5C 8003FF3C 40000232 */   andi      $v0, $s0, 0x40
/* 2DB60 8003FF40 4C00298E */  lw         $t1, 0x4C($s1)
/* 2DB64 8003FF44 14004010 */  beqz       $v0, .L8003FF98
/* 2DB68 8003FF48 1800E900 */   mult      $a3, $t1
/* 2DB6C 8003FF4C 12180000 */  mflo       $v1
/* 2DB70 8003FF50 00000000 */  nop
/* 2DB74 8003FF54 00000000 */  nop
/* 2DB78 8003FF58 18008900 */  mult       $a0, $t1
/* 2DB7C 8003FF5C 12300000 */  mflo       $a2
/* 2DB80 8003FF60 5400258E */  lw         $a1, 0x54($s1)
/* 2DB84 8003FF64 23100400 */  negu       $v0, $a0
/* 2DB88 8003FF68 18004500 */  mult       $v0, $a1
/* 2DB8C 8003FF6C 12200000 */  mflo       $a0
/* 2DB90 8003FF70 00000000 */  nop
/* 2DB94 8003FF74 00000000 */  nop
/* 2DB98 8003FF78 1800E500 */  mult       $a3, $a1
/* 2DB9C 8003FF7C C31A0300 */  sra        $v1, $v1, 11
/* 2DBA0 8003FF80 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 2DBA4 8003FF84 C3120600 */  sra        $v0, $a2, 11
/* 2DBA8 8003FF88 00140200 */  sll        $v0, $v0, 16
/* 2DBAC 8003FF8C 25486200 */  or         $t1, $v1, $v0
/* 2DBB0 8003FF90 03000108 */  j          .L8004000C
/* 2DBB4 8003FF94 03130400 */   sra       $v0, $a0, 12
.L8003FF98:
/* 2DBB8 8003FF98 12180000 */  mflo       $v1
/* 2DBBC 8003FF9C 00000000 */  nop
/* 2DBC0 8003FFA0 00000000 */  nop
/* 2DBC4 8003FFA4 18008900 */  mult       $a0, $t1
/* 2DBC8 8003FFA8 033B0300 */  sra        $a3, $v1, 12
/* 2DBCC 8003FFAC FFFFE530 */  andi       $a1, $a3, 0xFFFF
/* 2DBD0 8003FFB0 12100000 */  mflo       $v0
/* 2DBD4 8003FFB4 03230200 */  sra        $a0, $v0, 12
/* 2DBD8 8003FFB8 40100700 */  sll        $v0, $a3, 1
/* 2DBDC 8003FFBC FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 2DBE0 8003FFC0 401C0400 */  sll        $v1, $a0, 17
/* 2DBE4 8003FFC4 25484300 */  or         $t1, $v0, $v1
/* 2DBE8 8003FFC8 23100400 */  negu       $v0, $a0
/* 2DBEC 8003FFCC 1D000108 */  j          .L80040074
/* 2DBF0 8003FFD0 00440200 */   sll       $t0, $v0, 16
.L8003FFD4:
/* 2DBF4 8003FFD4 12004010 */  beqz       $v0, .L80040020
/* 2DBF8 8003FFD8 23100400 */   negu      $v0, $a0
/* 2DBFC 8003FFDC 5400258E */  lw         $a1, 0x54($s1)
/* 2DC00 8003FFE0 00000000 */  nop
/* 2DC04 8003FFE4 18004500 */  mult       $v0, $a1
/* 2DC08 8003FFE8 12400000 */  mflo       $t0
/* 2DC0C 8003FFEC 00000000 */  nop
/* 2DC10 8003FFF0 00000000 */  nop
/* 2DC14 8003FFF4 1800E500 */  mult       $a3, $a1
/* 2DC18 8003FFF8 401C0400 */  sll        $v1, $a0, 17
/* 2DC1C 8003FFFC 40100700 */  sll        $v0, $a3, 1
/* 2DC20 80040000 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 2DC24 80040004 25484300 */  or         $t1, $v0, $v1
/* 2DC28 80040008 03130800 */  sra        $v0, $t0, 12
.L8004000C:
/* 2DC2C 8004000C 00440200 */  sll        $t0, $v0, 16
/* 2DC30 80040010 12280000 */  mflo       $a1
/* 2DC34 80040014 03130500 */  sra        $v0, $a1, 12
/* 2DC38 80040018 1D000108 */  j          .L80040074
/* 2DC3C 8004001C FFFF4530 */   andi      $a1, $v0, 0xFFFF
.L80040020:
/* 2DC40 80040020 40100700 */  sll        $v0, $a3, 1
/* 2DC44 80040024 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 2DC48 80040028 401C0400 */  sll        $v1, $a0, 17
/* 2DC4C 8004002C 25484300 */  or         $t1, $v0, $v1
/* 2DC50 80040030 23100400 */  negu       $v0, $a0
/* 2DC54 80040034 00440200 */  sll        $t0, $v0, 16
/* 2DC58 80040038 1D000108 */  j          .L80040074
/* 2DC5C 8004003C FFFFE530 */   andi      $a1, $a3, 0xFFFF
.L80040040:
/* 2DC60 80040040 09004010 */  beqz       $v0, .L80040068
/* 2DC64 80040044 40000232 */   andi      $v0, $s0, 0x40
/* 2DC68 80040048 4C00228E */  lw         $v0, 0x4C($s1)
/* 2DC6C 8004004C 00000000 */  nop
/* 2DC70 80040050 40480200 */  sll        $t1, $v0, 1
/* 2DC74 80040054 40000232 */  andi       $v0, $s0, 0x40
/* 2DC78 80040058 05004014 */  bnez       $v0, .L80040070
/* 2DC7C 8004005C 43280900 */   sra       $a1, $t1, 1
/* 2DC80 80040060 1D000108 */  j          .L80040074
/* 2DC84 80040064 00000000 */   nop
.L80040068:
/* 2DC88 80040068 02004010 */  beqz       $v0, .L80040074
/* 2DC8C 8004006C 00000000 */   nop
.L80040070:
/* 2DC90 80040070 5400258E */  lw         $a1, 0x54($s1)
.L80040074:
/* 2DC94 80040074 0000C948 */  ctc2       $t1, $0 /* handwritten instruction */
/* 2DC98 80040078 0008C848 */  ctc2       $t0, $1 /* handwritten instruction */
/* 2DC9C 8004007C 0010C548 */  ctc2       $a1, $2 /* handwritten instruction */
/* 2DCA0 80040080 0018CA48 */  ctc2       $t2, $3 /* handwritten instruction */
/* 2DCA4 80040084 0020CC48 */  ctc2       $t4, $4 /* handwritten instruction */
/* 2DCA8 80040088 9FFF043C */  lui        $a0, (0xFF9FFFFF >> 16)
/* 2DCAC 8004008C E4FF8FAE */  sw         $t7, -0x1C($s4)
/* 2DCB0 80040090 1400428E */  lw         $v0, 0x14($s2)
/* 2DCB4 80040094 FFFF8434 */  ori        $a0, $a0, (0xFF9FFFFF & 0xFFFF)
/* 2DCB8 80040098 ECFF82AE */  sw         $v0, -0x14($s4)
/* 2DCBC 8004009C 6000A232 */  andi       $v0, $s5, 0x60
/* 2DCC0 800400A0 1800438E */  lw         $v1, 0x18($s2)
/* 2DCC4 800400A4 00140200 */  sll        $v0, $v0, 16
/* 2DCC8 800400A8 24186400 */  and        $v1, $v1, $a0
/* 2DCCC 800400AC 25186200 */  or         $v1, $v1, $v0
/* 2DCD0 800400B0 F4FF83AE */  sw         $v1, -0xC($s4)
/* 2DCD4 800400B4 1C004296 */  lhu        $v0, 0x1C($s2)
/* 2DCD8 800400B8 00000000 */  nop
/* 2DCDC 800400BC FCFF82A6 */  sh         $v0, -0x4($s4)
/* 2DCE0 800400C0 1E004296 */  lhu        $v0, 0x1E($s2)
/* 2DCE4 800400C4 00000000 */  nop
/* 2DCE8 800400C8 040082A6 */  sh         $v0, 0x4($s4)
/* 2DCEC 800400CC 18004292 */  lbu        $v0, 0x18($s2)
/* 2DCF0 800400D0 14004392 */  lbu        $v1, 0x14($s2)
/* 2DCF4 800400D4 00000000 */  nop
/* 2DCF8 800400D8 23104300 */  subu       $v0, $v0, $v1
/* 2DCFC 800400DC 01004424 */  addiu      $a0, $v0, 0x1
/* 2DD00 800400E0 1D004292 */  lbu        $v0, 0x1D($s2)
/* 2DD04 800400E4 15004392 */  lbu        $v1, 0x15($s2)
/* 2DD08 800400E8 40300400 */  sll        $a2, $a0, 1
/* 2DD0C 800400EC 23104300 */  subu       $v0, $v0, $v1
/* 2DD10 800400F0 01004324 */  addiu      $v1, $v0, 0x1
/* 2DD14 800400F4 0004A232 */  andi       $v0, $s5, 0x400
/* 2DD18 800400F8 03004010 */  beqz       $v0, .L80040108
/* 2DD1C 800400FC 40380300 */   sll       $a3, $v1, 1
/* 2DD20 80040100 00310400 */  sll        $a2, $a0, 4
/* 2DD24 80040104 00390300 */  sll        $a3, $v1, 4
.L80040108:
/* 2DD28 80040108 23180600 */  negu       $v1, $a2
/* 2DD2C 8004010C FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 2DD30 80040110 23100700 */  negu       $v0, $a3
/* 2DD34 80040114 00140200 */  sll        $v0, $v0, 16
/* 2DD38 80040118 25286200 */  or         $a1, $v1, $v0
/* 2DD3C 8004011C 21C80000 */  addu       $t9, $zero, $zero
/* 2DD40 80040120 00089948 */  mtc2       $t9, $1 /* handwritten instruction */
/* 2DD44 80040124 21202003 */  addu       $a0, $t9, $zero
/* 2DD48 80040128 01000D24 */  addiu      $t5, $zero, 0x1
/* 2DD4C 8004012C 02000C24 */  addiu      $t4, $zero, 0x2
/* 2DD50 80040130 03000B24 */  addiu      $t3, $zero, 0x3
/* 2DD54 80040134 FFFFC830 */  andi       $t0, $a2, 0xFFFF
/* 2DD58 80040138 21504000 */  addu       $t2, $v0, $zero
/* 2DD5C 8004013C 08006926 */  addiu      $t1, $s3, 0x8
/* 2DD60 80040140 00340700 */  sll        $a2, $a3, 16
.L80040144:
/* 2DD64 80040144 00008548 */  mtc2       $a1, $0 /* handwritten instruction */
/* 2DD68 80040148 00000000 */  nop
/* 2DD6C 8004014C 00000000 */  nop
/* 2DD70 80040150 0100184A */  RTPS
/* 2DD74 80040154 13008D10 */  beq        $a0, $t5, .L800401A4
/* 2DD78 80040158 02008228 */   slti      $v0, $a0, 0x2
/* 2DD7C 8004015C 05004010 */  beqz       $v0, .L80040174
/* 2DD80 80040160 00000000 */   nop
/* 2DD84 80040164 09008010 */  beqz       $a0, .L8004018C
/* 2DD88 80040168 00000000 */   nop
/* 2DD8C 8004016C 74000108 */  j          .L800401D0
/* 2DD90 80040170 01008424 */   addiu     $a0, $a0, 0x1
.L80040174:
/* 2DD94 80040174 10008C10 */  beq        $a0, $t4, .L800401B8
/* 2DD98 80040178 18006226 */   addiu     $v0, $s3, 0x18
/* 2DD9C 8004017C 12008B10 */  beq        $a0, $t3, .L800401C8
/* 2DDA0 80040180 00000000 */   nop
/* 2DDA4 80040184 74000108 */  j          .L800401D0
/* 2DDA8 80040188 01008424 */   addiu     $a0, $a0, 0x1
.L8004018C:
/* 2DDAC 8004018C 25280A01 */  or         $a1, $t0, $t2
/* 2DDB0 80040190 00002EE9 */  swc2       $14, 0x0($t1)
/* 2DDB4 80040194 3000E226 */  addiu      $v0, $s7, %lo(D_1F800030)
/* 2DDB8 80040198 000053E8 */  swc2       $19, 0x0($v0)
/* 2DDBC 8004019C 74000108 */  j          .L800401D0
/* 2DDC0 800401A0 01008424 */   addiu     $a0, $a0, 0x1
.L800401A4:
/* 2DDC4 800401A4 25286600 */  or         $a1, $v1, $a2
/* 2DDC8 800401A8 10006226 */  addiu      $v0, $s3, 0x10
/* 2DDCC 800401AC 00004EE8 */  swc2       $14, 0x0($v0)
/* 2DDD0 800401B0 74000108 */  j          .L800401D0
/* 2DDD4 800401B4 01008424 */   addiu     $a0, $a0, 0x1
.L800401B8:
/* 2DDD8 800401B8 25280601 */  or         $a1, $t0, $a2
/* 2DDDC 800401BC 00004EE8 */  swc2       $14, 0x0($v0)
/* 2DDE0 800401C0 74000108 */  j          .L800401D0
/* 2DDE4 800401C4 01008424 */   addiu     $a0, $a0, 0x1
.L800401C8:
/* 2DDE8 800401C8 00008EEA */  swc2       $14, 0x0($s4)
/* 2DDEC 800401CC 01008424 */  addiu      $a0, $a0, 0x1
.L800401D0:
/* 2DDF0 800401D0 04008228 */  slti       $v0, $a0, 0x4
/* 2DDF4 800401D4 DBFF4014 */  bnez       $v0, .L80040144
/* 2DDF8 800401D8 00000000 */   nop
.L800401DC:
/* 2DDFC 800401DC 1100C012 */  beqz       $s6, .L80040224
/* 2DE00 800401E0 00000000 */   nop
/* 2DE04 800401E4 3000E28E */  lw         $v0, (0x1F800030 & 0xFFFF)($s7)
/* 2DE08 800401E8 6800C396 */  lhu        $v1, 0x68($s6)
/* 2DE0C 800401EC 43210200 */  sra        $a0, $v0, 5
/* 2DE10 800401F0 2A108300 */  slt        $v0, $a0, $v1
/* 2DE14 800401F4 02004010 */  beqz       $v0, .L80040200
/* 2DE18 800401F8 00000000 */   nop
/* 2DE1C 800401FC 21206000 */  addu       $a0, $v1, $zero
.L80040200:
/* 2DE20 80040200 6A00C396 */  lhu        $v1, 0x6A($s6)
/* 2DE24 80040204 00000000 */  nop
/* 2DE28 80040208 2A106400 */  slt        $v0, $v1, $a0
/* 2DE2C 8004020C 02004010 */  beqz       $v0, .L80040218
/* 2DE30 80040210 00000000 */   nop
/* 2DE34 80040214 21206000 */  addu       $a0, $v1, $zero
.L80040218:
/* 2DE38 80040218 7000C38E */  lw         $v1, 0x70($s6)
/* 2DE3C 8004021C 96000108 */  j          .L80040258
/* 2DE40 80040220 80100400 */   sll       $v0, $a0, 2
.L80040224:
/* 2DE44 80040224 3000E28E */  lw         $v0, (0x1F800030 & 0xFFFF)($s7)
/* 2DE48 80040228 18002382 */  lb         $v1, 0x18($s1)
/* 2DE4C 8004022C 03120200 */  sra        $v0, $v0, 8
/* 2DE50 80040230 21204300 */  addu       $a0, $v0, $v1
/* 2DE54 80040234 03008104 */  bgez       $a0, .L80040244
/* 2DE58 80040238 00048228 */   slti      $v0, $a0, 0x400
/* 2DE5C 8004023C 21200000 */  addu       $a0, $zero, $zero
/* 2DE60 80040240 00048228 */  slti       $v0, $a0, 0x400
.L80040244:
/* 2DE64 80040244 02004014 */  bnez       $v0, .L80040250
/* 2DE68 80040248 00000000 */   nop
/* 2DE6C 8004024C FF030424 */  addiu      $a0, $zero, 0x3FF
.L80040250:
/* 2DE70 80040250 2000E38E */  lw         $v1, (0x1F800020 & 0xFFFF)($s7)
/* 2DE74 80040254 80100400 */  sll        $v0, $a0, 2
.L80040258:
/* 2DE78 80040258 21286200 */  addu       $a1, $v1, $v0
/* 2DE7C 8004025C 0010A232 */  andi       $v0, $s5, 0x1000
/* 2DE80 80040260 0A004010 */  beqz       $v0, .L8004028C
/* 2DE84 80040264 FF00023C */   lui       $v0, (0xFFFFFF >> 16)
/* 2DE88 80040268 FFFF4234 */  ori        $v0, $v0, (0xFFFFFF & 0xFFFF)
/* 2DE8C 8004026C 1C009426 */  addiu      $s4, $s4, 0x1C
/* 2DE90 80040270 0006043C */  lui        $a0, (0x6000000 >> 16)
/* 2DE94 80040274 0000A38C */  lw         $v1, 0x0($a1)
/* 2DE98 80040278 24106202 */  and        $v0, $s3, $v0
/* 2DE9C 8004027C 25186400 */  or         $v1, $v1, $a0
/* 2DEA0 80040280 000063AE */  sw         $v1, 0x0($s3)
/* 2DEA4 80040284 AB000108 */  j          .L800402AC
/* 2DEA8 80040288 1C007326 */   addiu     $s3, $s3, 0x1C
.L8004028C:
/* 2DEAC 8004028C FFFF4234 */  ori        $v0, $v0, (0xFFFFFF & 0xFFFF)
/* 2DEB0 80040290 28009426 */  addiu      $s4, $s4, 0x28
/* 2DEB4 80040294 0009043C */  lui        $a0, (0x9000000 >> 16)
/* 2DEB8 80040298 0000A38C */  lw         $v1, 0x0($a1)
/* 2DEBC 8004029C 24106202 */  and        $v0, $s3, $v0
/* 2DEC0 800402A0 25186400 */  or         $v1, $v1, $a0
/* 2DEC4 800402A4 000063AE */  sw         $v1, 0x0($s3)
/* 2DEC8 800402A8 28007326 */  addiu      $s3, $s3, 0x28
.L800402AC:
/* 2DECC 800402AC 0000A2AC */  sw         $v0, 0x0($a1)
.L800402B0:
/* 2DED0 800402B0 0000318E */  lw         $s1, 0x0($s1)
/* 2DED4 800402B4 00000000 */  nop
/* 2DED8 800402B8 FBFC2016 */  bnez       $s1, .L8003F6A8
/* 2DEDC 800402BC 00000000 */   nop
.L800402C0:
/* 2DEE0 800402C0 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 2DEE4 800402C4 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 2DEE8 800402C8 00000000 */  nop
/* 2DEEC 800402CC 1000428C */  lw         $v0, 0x10($v0)
/* 2DEF0 800402D0 00000000 */  nop
/* 2DEF4 800402D4 800053AC */  sw         $s3, 0x80($v0)
.L800402D8:
/* 2DEF8 800402D8 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 2DEFC 800402DC 3800BE8F */  lw         $fp, 0x38($sp)
/* 2DF00 800402E0 3400B78F */  lw         $s7, 0x34($sp)
/* 2DF04 800402E4 3000B68F */  lw         $s6, 0x30($sp)
/* 2DF08 800402E8 2C00B58F */  lw         $s5, 0x2C($sp)
/* 2DF0C 800402EC 2800B48F */  lw         $s4, 0x28($sp)
/* 2DF10 800402F0 2400B38F */  lw         $s3, 0x24($sp)
/* 2DF14 800402F4 2000B28F */  lw         $s2, 0x20($sp)
/* 2DF18 800402F8 1C00B18F */  lw         $s1, 0x1C($sp)
/* 2DF1C 800402FC 1800B08F */  lw         $s0, 0x18($sp)
/* 2DF20 80040300 0800E003 */  jr         $ra
/* 2DF24 80040304 4000BD27 */   addiu     $sp, $sp, 0x40
.size Particle_RenderList, . - Particle_RenderList
