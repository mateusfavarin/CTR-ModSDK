.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel ApplyMatrixLV_stub
/* 5A310 8006C6F0 0000888C */  lw         $t0, 0x0($a0)
/* 5A314 8006C6F4 0400898C */  lw         $t1, 0x4($a0)
/* 5A318 8006C6F8 08008A8C */  lw         $t2, 0x8($a0)
/* 5A31C 8006C6FC C35B0800 */  sra        $t3, $t0, 15
/* 5A320 8006C700 C3630900 */  sra        $t4, $t1, 15
/* 5A324 8006C704 C36B0A00 */  sra        $t5, $t2, 15
/* 5A328 8006C708 00488B48 */  mtc2       $t3, $9 /* handwritten instruction */
/* 5A32C 8006C70C 00508C48 */  mtc2       $t4, $10 /* handwritten instruction */
/* 5A330 8006C710 00588D48 */  mtc2       $t5, $11 /* handwritten instruction */
/* 5A334 8006C714 FF7F0831 */  andi       $t0, $t0, 0x7FFF
/* 5A338 8006C718 12E0414A */  MVMVA      0, 0, 3, 3, 0
/* 5A33C 8006C71C FF7F2931 */  andi       $t1, $t1, 0x7FFF
/* 5A340 8006C720 FF7F4A31 */  andi       $t2, $t2, 0x7FFF
/* 5A344 8006C724 00C80B48 */  mfc2       $t3, $25 /* handwritten instruction */
/* 5A348 8006C728 00D00C48 */  mfc2       $t4, $26 /* handwritten instruction */
/* 5A34C 8006C72C 00D80D48 */  mfc2       $t5, $27 /* handwritten instruction */
/* 5A350 8006C730 00488848 */  mtc2       $t0, $9 /* handwritten instruction */
/* 5A354 8006C734 00508948 */  mtc2       $t1, $10 /* handwritten instruction */
/* 5A358 8006C738 00588A48 */  mtc2       $t2, $11 /* handwritten instruction */
/* 5A35C 8006C73C C0580B00 */  sll        $t3, $t3, 3
/* 5A360 8006C740 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 5A364 8006C744 C0600C00 */  sll        $t4, $t4, 3
/* 5A368 8006C748 C0680D00 */  sll        $t5, $t5, 3
/* 5A36C 8006C74C 00C80848 */  mfc2       $t0, $25 /* handwritten instruction */
/* 5A370 8006C750 00D00948 */  mfc2       $t1, $26 /* handwritten instruction */
/* 5A374 8006C754 00D80A48 */  mfc2       $t2, $27 /* handwritten instruction */
/* 5A378 8006C758 21400B01 */  addu       $t0, $t0, $t3
/* 5A37C 8006C75C 21482C01 */  addu       $t1, $t1, $t4
/* 5A380 8006C760 21504D01 */  addu       $t2, $t2, $t5
/* 5A384 8006C764 0000A8AC */  sw         $t0, 0x0($a1)
/* 5A388 8006C768 0400A9AC */  sw         $t1, 0x4($a1)
/* 5A38C 8006C76C 0800AAAC */  sw         $t2, 0x8($a1)
/* 5A390 8006C770 0800E003 */  jr         $ra
/* 5A394 8006C774 2110A000 */   addu      $v0, $a1, $zero
/* 5A398 8006C778 0600404B */  NCLIP
/* 5A39C 8006C77C 80480B00 */  sll        $t1, $t3, 2
/* 5A3A0 8006C780 2C002B8C */  lw         $t3, 0x2C($at)
/* 5A3A4 8006C784 3800258C */  lw         $a1, 0x38($at)
/* 5A3A8 8006C788 425C0B00 */  srl        $t3, $t3, 17
/* 5A3AC 8006C78C 80580B00 */  sll        $t3, $t3, 2
/* 5A3B0 8006C790 21586501 */  addu       $t3, $t3, $a1
/* 5A3B4 8006C794 24002584 */  lh         $a1, 0x24($at)
/* 5A3B8 8006C798 5000268C */  lw         $a2, 0x50($at)
/* 5A3BC 8006C79C 00C00A48 */  mfc2       $t2, $24 /* handwritten instruction */
/* 5A3C0 8006C7A0 2648A900 */  xor        $t1, $a1, $t1
/* 5A3C4 8006C7A4 26504901 */  xor        $t2, $t2, $t1
/* 5A3C8 8006C7A8 02004105 */  bgez       $t2, .L8006C7B4
/* 5A3CC 8006C7AC 08004CE8 */   swc2      $12, 0x8($v0)
/* 5A3D0 8006C7B0 04006B25 */  addiu      $t3, $t3, 0x4
.L8006C7B4:
/* 5A3D4 8006C7B4 10004DE8 */  swc2       $13, 0x10($v0)
/* 5A3D8 8006C7B8 18004EE8 */  swc2       $14, 0x18($v0)
/* 5A3DC 8006C7BC 001E0E00 */  sll        $v1, $t6, 24
/* 5A3E0 8006C7C0 C31C0300 */  sra        $v1, $v1, 19
/* 5A3E4 8006C7C4 00488348 */  mtc2       $v1, $9 /* handwritten instruction */
/* 5A3E8 8006C7C8 021A0E00 */  srl        $v1, $t6, 8
/* 5A3EC 8006C7CC 001E0300 */  sll        $v1, $v1, 24
/* 5A3F0 8006C7D0 C31C0300 */  sra        $v1, $v1, 19
/* 5A3F4 8006C7D4 00508348 */  mtc2       $v1, $10 /* handwritten instruction */
/* 5A3F8 8006C7D8 021C0E00 */  srl        $v1, $t6, 16
/* 5A3FC 8006C7DC 001E0300 */  sll        $v1, $v1, 24
/* 5A400 8006C7E0 C31C0300 */  sra        $v1, $v1, 19
/* 5A404 8006C7E4 00588348 */  mtc2       $v1, $11 /* handwritten instruction */
/* 5A408 8006C7E8 00000000 */  nop
/* 5A40C 8006C7EC 00000000 */  nop
/* 5A410 8006C7F0 12E04D4A */  MVMVA      1, 2, 3, 3, 0
/* 5A414 8006C7F4 00480348 */  mfc2       $v1, $9 /* handwritten instruction */
/* 5A418 8006C7F8 00580848 */  mfc2       $t0, $11 /* handwritten instruction */
/* 5A41C 8006C7FC 00106324 */  addiu      $v1, $v1, 0x1000
/* 5A420 8006C800 40480300 */  sll        $t1, $v1, 1
/* 5A424 8006C804 21186900 */  addu       $v1, $v1, $t1
/* 5A428 8006C808 40480900 */  sll        $t1, $t1, 1
/* 5A42C 8006C80C 21186900 */  addu       $v1, $v1, $t1
/* 5A430 8006C810 00206324 */  addiu      $v1, $v1, 0x2000
/* 5A434 8006C814 02004105 */  bgez       $t2, .L8006C820
/* 5A438 8006C818 02190300 */   srl       $v1, $v1, 4
/* 5A43C 8006C81C 42180300 */  srl        $v1, $v1, 1
.L8006C820:
/* 5A440 8006C820 C3400800 */  sra        $t0, $t0, 3
/* 5A444 8006C824 00408348 */  mtc2       $v1, $8 /* handwritten instruction */
/* 5A448 8006C828 0980093C */  lui        $t1, %hi(D_8008A2C4)
/* 5A44C 8006C82C C4A22925 */  addiu      $t1, $t1, %lo(D_8008A2C4)
/* 5A450 8006C830 1000784A */  DPCS
/* 5A454 8006C834 02000105 */  bgez       $t0, .L8006C840
/* 5A458 8006C838 00000000 */   nop
/* 5A45C 8006C83C 23400800 */  negu       $t0, $t0
.L8006C840:
/* 5A460 8006C840 80FE0825 */  addiu      $t0, $t0, -0x180
/* 5A464 8006C844 06000005 */  bltz       $t0, .L8006C860
/* 5A468 8006C848 00000324 */   addiu     $v1, $zero, 0x0
/* 5A46C 8006C84C 80FF0325 */  addiu      $v1, $t0, -0x80
/* 5A470 8006C850 02006004 */  bltz       $v1, .L8006C85C
/* 5A474 8006C854 21402801 */   addu      $t0, $t1, $t0
/* 5A478 8006C858 7F002825 */  addiu      $t0, $t1, 0x7F
.L8006C85C:
/* 5A47C 8006C85C 00000391 */  lbu        $v1, 0x0($t0)
.L8006C860:
/* 5A480 8006C860 00B00848 */  mfc2       $t0, $22 /* handwritten instruction */
/* 5A484 8006C864 02004105 */  bgez       $t2, .L8006C870
/* 5A488 8006C868 024A0800 */   srl       $t1, $t0, 8
/* 5A48C 8006C86C C2180300 */  srl        $v1, $v1, 3
.L8006C870:
/* 5A490 8006C870 022C0800 */  srl        $a1, $t0, 16
/* 5A494 8006C874 FF000831 */  andi       $t0, $t0, 0xFF
/* 5A498 8006C878 FF002931 */  andi       $t1, $t1, 0xFF
/* 5A49C 8006C87C FF00A530 */  andi       $a1, $a1, 0xFF
/* 5A4A0 8006C880 21400301 */  addu       $t0, $t0, $v1
/* 5A4A4 8006C884 21482301 */  addu       $t1, $t1, $v1
/* 5A4A8 8006C888 2128A300 */  addu       $a1, $a1, $v1
/* 5A4AC 8006C88C 01FFA324 */  addiu      $v1, $a1, -0xFF
/* 5A4B0 8006C890 02006018 */  blez       $v1, .L8006C89C
/* 5A4B4 8006C894 002C0500 */   sll       $a1, $a1, 16
/* 5A4B8 8006C898 FF00053C */  lui        $a1, (0xFF0000 >> 16)
.L8006C89C:
/* 5A4BC 8006C89C 01FF2325 */  addiu      $v1, $t1, -0xFF
/* 5A4C0 8006C8A0 02006018 */  blez       $v1, .L8006C8AC
/* 5A4C4 8006C8A4 004A0900 */   sll       $t1, $t1, 8
/* 5A4C8 8006C8A8 00FF0934 */  ori        $t1, $zero, 0xFF00
.L8006C8AC:
/* 5A4CC 8006C8AC 01FF0325 */  addiu      $v1, $t0, -0xFF
/* 5A4D0 8006C8B0 02006018 */  blez       $v1, .L8006C8BC
/* 5A4D4 8006C8B4 25482501 */   or        $t1, $t1, $a1
/* 5A4D8 8006C8B8 FF000824 */  addiu      $t0, $zero, 0xFF
.L8006C8BC:
/* 5A4DC 8006C8BC 25482801 */  or         $t1, $t1, $t0
/* 5A4E0 8006C8C0 0400C58C */  lw         $a1, 0x4($a2)
/* 5A4E4 8006C8C4 6000083C */  lui        $t0, (0x600000 >> 16)
/* 5A4E8 8006C8C8 24180501 */  and        $v1, $t0, $a1
/* 5A4EC 8006C8CC 05006010 */  beqz       $v1, .L8006C8E4
/* 5A4F0 8006C8D0 C0180B00 */   sll       $v1, $t3, 3
/* 5A4F4 8006C8D4 24186A00 */  and        $v1, $v1, $t2
/* 5A4F8 8006C8D8 06006104 */  bgez       $v1, .L8006C8F4
/* 5A4FC 8006C8DC 0024033C */   lui       $v1, (0x24000000 >> 16)
/* 5A500 8006C8E0 0800E003 */  jr         $ra
.L8006C8E4:
/* 5A504 8006C8E4 2000083C */   lui       $t0, (0x200000 >> 16)
/* 5A508 8006C8E8 02004105 */  bgez       $t2, .L8006C8F4
/* 5A50C 8006C8EC 0026033C */   lui       $v1, (0x26000000 >> 16)
/* 5A510 8006C8F0 4000083C */  lui        $t0, (0x400000 >> 16)
.L8006C8F4:
/* 5A514 8006C8F4 25186900 */  or         $v1, $v1, $t1
/* 5A518 8006C8F8 25400501 */  or         $t0, $t0, $a1
/* 5A51C 8006C8FC 040043AC */  sw         $v1, 0x4($v0)
/* 5A520 8006C900 0000C38C */  lw         $v1, 0x0($a2)
/* 5A524 8006C904 0800C98C */  lw         $t1, 0x8($a2)
/* 5A528 8006C908 0C0043AC */  sw         $v1, 0xC($v0)
/* 5A52C 8006C90C 140048AC */  sw         $t0, 0x14($v0)
/* 5A530 8006C910 1C0049AC */  sw         $t1, 0x1C($v0)
/* 5A534 8006C914 0007083C */  lui        $t0, (0x7000000 >> 16)
/* 5A538 8006C918 4DF90104 */  bgez       $zero, .L8006AE50
/* 5A53C 8006C91C 20000924 */   addiu     $t1, $zero, 0x20
/* 5A540 8006C920 0800E003 */  jr         $ra
/* 5A544 8006C924 00000000 */   nop
/* 5A548 8006C928 5300E383 */  lb         $v1, 0x53($ra)
/* 5A54C 8006C92C 5800E897 */  lhu        $t0, 0x58($ra)
/* 5A550 8006C930 0080C348 */  ctc2       $v1, $16 /* handwritten instruction */
/* 5A554 8006C934 0088C848 */  ctc2       $t0, $17 /* handwritten instruction */
/* 5A558 8006C938 F400C38C */  lw         $v1, 0xF4($a2)
/* 5A55C 8006C93C F800C894 */  lhu        $t0, 0xF8($a2)
/* 5A560 8006C940 0098C348 */  ctc2       $v1, $19 /* handwritten instruction */
/* 5A564 8006C944 00A0C848 */  ctc2       $t0, $20 /* handwritten instruction */
/* 5A568 8006C948 2400E38F */  lw         $v1, 0x24($ra)
glabel .L8006C94C
/* 5A56C 8006C94C 00308048 */  mtc2       $zero, $6 /* handwritten instruction */
/* 5A570 8006C950 02440300 */  srl        $t0, $v1, 16
/* 5A574 8006C954 024A0300 */  srl        $t1, $v1, 8
/* 5A578 8006C958 F00F0831 */  andi       $t0, $t0, 0xFF0
/* 5A57C 8006C95C F00F2931 */  andi       $t1, $t1, 0xFF0
/* 5A580 8006C960 F00F6330 */  andi       $v1, $v1, 0xFF0
/* 5A584 8006C964 00A8C848 */  ctc2       $t0, $21 /* handwritten instruction */
/* 5A588 8006C968 00B0C948 */  ctc2       $t1, $22 /* handwritten instruction */
/* 5A58C 8006C96C 08004001 */  jr         $t2
/* 5A590 8006C970 00B8C348 */   ctc2      $v1, $23 /* handwritten instruction */
/* 5A594 8006C974 00A8C048 */  ctc2       $zero, $21 /* handwritten instruction */
/* 5A598 8006C978 00B0C048 */  ctc2       $zero, $22 /* handwritten instruction */
/* 5A59C 8006C97C 08004001 */  jr         $t2
/* 5A5A0 8006C980 00B8C048 */   ctc2      $zero, $23 /* handwritten instruction */
.size ApplyMatrixLV_stub, . - ApplyMatrixLV_stub
