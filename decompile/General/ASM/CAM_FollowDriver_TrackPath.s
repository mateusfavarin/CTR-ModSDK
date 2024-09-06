.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel CAM_FollowDriver_TrackPath
/* 7518 800198F8 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 751C 800198FC 3000B4AF */  sw         $s4, 0x30($sp)
/* 7520 80019900 21A08000 */  addu       $s4, $a0, $zero
/* 7524 80019904 3800B6AF */  sw         $s6, 0x38($sp)
/* 7528 80019908 21B0A000 */  addu       $s6, $a1, $zero
/* 752C 8001990C 3400B5AF */  sw         $s5, 0x34($sp)
/* 7530 80019910 21A8C000 */  addu       $s5, $a2, $zero
/* 7534 80019914 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 7538 80019918 2198E000 */  addu       $s3, $a3, $zero
/* 753C 8001991C 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 7540 80019920 2800B2AF */  sw         $s2, 0x28($sp)
/* 7544 80019924 2400B1AF */  sw         $s1, 0x24($sp)
/* 7548 80019928 7300A01A */  blez       $s5, .L80019AF8
/* 754C 8001992C 2000B0AF */   sw        $s0, 0x20($sp)
/* 7550 80019930 8800918E */  lw         $s1, 0x88($s4)
/* 7554 80019934 00000000 */  nop
/* 7558 80019938 0A002292 */  lbu        $v0, 0xA($s1)
/* 755C 8001993C 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 7560 80019940 ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 7564 80019944 40180200 */  sll        $v1, $v0, 1
/* 7568 80019948 21186200 */  addu       $v1, $v1, $v0
/* 756C 8001994C 6001828C */  lw         $v0, 0x160($a0)
/* 7570 80019950 80180300 */  sll        $v1, $v1, 2
/* 7574 80019954 4C01448C */  lw         $a0, 0x14C($v0)
/* 7578 80019958 7000828E */  lw         $v0, 0x70($s4)
/* 757C 8001995C 00000000 */  nop
/* 7580 80019960 00014230 */  andi       $v0, $v0, 0x100
/* 7584 80019964 08004010 */  beqz       $v0, .L80019988
/* 7588 80019968 21808300 */   addu      $s0, $a0, $v1
/* 758C 8001996C 0B002392 */  lbu        $v1, 0xB($s1)
/* 7590 80019970 FF000224 */  addiu      $v0, $zero, 0xFF
/* 7594 80019974 04006210 */  beq        $v1, $v0, .L80019988
/* 7598 80019978 40100300 */   sll       $v0, $v1, 1
/* 759C 8001997C 21104300 */  addu       $v0, $v0, $v1
/* 75A0 80019980 80100200 */  sll        $v0, $v0, 2
/* 75A4 80019984 21808200 */  addu       $s0, $a0, $v0
.L80019988:
/* 75A8 80019988 00000286 */  lh         $v0, 0x0($s0)
/* 75AC 8001998C 00002386 */  lh         $v1, 0x0($s1)
/* 75B0 80019990 00000000 */  nop
/* 75B4 80019994 23104300 */  subu       $v0, $v0, $v1
/* 75B8 80019998 18004200 */  mult       $v0, $v0
/* 75BC 8001999C 1000A2AF */  sw         $v0, 0x10($sp)
/* 75C0 800199A0 02000286 */  lh         $v0, 0x2($s0)
/* 75C4 800199A4 02002386 */  lh         $v1, 0x2($s1)
/* 75C8 800199A8 12280000 */  mflo       $a1
/* 75CC 800199AC 23104300 */  subu       $v0, $v0, $v1
/* 75D0 800199B0 00000000 */  nop
/* 75D4 800199B4 18004200 */  mult       $v0, $v0
/* 75D8 800199B8 1400A2AF */  sw         $v0, 0x14($sp)
/* 75DC 800199BC 04002386 */  lh         $v1, 0x4($s1)
/* 75E0 800199C0 04000286 */  lh         $v0, 0x4($s0)
/* 75E4 800199C4 12200000 */  mflo       $a0
/* 75E8 800199C8 23104300 */  subu       $v0, $v0, $v1
/* 75EC 800199CC 00000000 */  nop
/* 75F0 800199D0 18004200 */  mult       $v0, $v0
/* 75F4 800199D4 1800A2AF */  sw         $v0, 0x18($sp)
/* 75F8 800199D8 2120A400 */  addu       $a0, $a1, $a0
/* 75FC 800199DC 12180000 */  mflo       $v1
/* 7600 800199E0 86B1010C */  jal        SquareRoot0_stub
/* 7604 800199E4 21208300 */   addu      $a0, $a0, $v1
/* 7608 800199E8 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 760C 800199EC ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 7610 800199F0 00000000 */  nop
/* 7614 800199F4 0000638C */  lw         $v1, 0x0($v1)
/* 7618 800199F8 00000000 */  nop
/* 761C 800199FC 0F006330 */  andi       $v1, $v1, 0xF
/* 7620 80019A00 03006010 */  beqz       $v1, .L80019A10
/* 7624 80019A04 21204000 */   addu      $a0, $v0, $zero
/* 7628 80019A08 87660008 */  j          .L80019A1C
/* 762C 80019A0C 21900000 */   addu      $s2, $zero, $zero
.L80019A10:
/* 7630 80019A10 9400828E */  lw         $v0, 0x94($s4)
/* 7634 80019A14 00000000 */  nop
/* 7638 80019A18 21905500 */  addu       $s2, $v0, $s5
.L80019A1C:
/* 763C 80019A1C 2A104402 */  slt        $v0, $s2, $a0
/* 7640 80019A20 A2004014 */  bnez       $v0, .L80019CAC
/* 7644 80019A24 00000000 */   nop
/* 7648 80019A28 23904402 */  subu       $s2, $s2, $a0
.L80019A2C:
/* 764C 80019A2C 21880002 */  addu       $s1, $s0, $zero
/* 7650 80019A30 0A000492 */  lbu        $a0, 0xA($s0)
/* 7654 80019A34 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 7658 80019A38 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 765C 80019A3C 40180400 */  sll        $v1, $a0, 1
/* 7660 80019A40 21186400 */  addu       $v1, $v1, $a0
/* 7664 80019A44 6001428C */  lw         $v0, 0x160($v0)
/* 7668 80019A48 80180300 */  sll        $v1, $v1, 2
/* 766C 80019A4C 4C01448C */  lw         $a0, 0x14C($v0)
/* 7670 80019A50 7000828E */  lw         $v0, 0x70($s4)
/* 7674 80019A54 00000000 */  nop
/* 7678 80019A58 00014230 */  andi       $v0, $v0, 0x100
/* 767C 80019A5C 08004010 */  beqz       $v0, .L80019A80
/* 7680 80019A60 21808300 */   addu      $s0, $a0, $v1
/* 7684 80019A64 0B002392 */  lbu        $v1, 0xB($s1)
/* 7688 80019A68 FF000224 */  addiu      $v0, $zero, 0xFF
/* 768C 80019A6C 04006210 */  beq        $v1, $v0, .L80019A80
/* 7690 80019A70 40100300 */   sll       $v0, $v1, 1
/* 7694 80019A74 21104300 */  addu       $v0, $v0, $v1
/* 7698 80019A78 80100200 */  sll        $v0, $v0, 2
/* 769C 80019A7C 21808200 */  addu       $s0, $a0, $v0
.L80019A80:
/* 76A0 80019A80 00000286 */  lh         $v0, 0x0($s0)
/* 76A4 80019A84 00002386 */  lh         $v1, 0x0($s1)
/* 76A8 80019A88 00000000 */  nop
/* 76AC 80019A8C 23104300 */  subu       $v0, $v0, $v1
/* 76B0 80019A90 18004200 */  mult       $v0, $v0
/* 76B4 80019A94 1000A2AF */  sw         $v0, 0x10($sp)
/* 76B8 80019A98 02000286 */  lh         $v0, 0x2($s0)
/* 76BC 80019A9C 02002386 */  lh         $v1, 0x2($s1)
/* 76C0 80019AA0 12280000 */  mflo       $a1
/* 76C4 80019AA4 23104300 */  subu       $v0, $v0, $v1
/* 76C8 80019AA8 00000000 */  nop
/* 76CC 80019AAC 18004200 */  mult       $v0, $v0
/* 76D0 80019AB0 1400A2AF */  sw         $v0, 0x14($sp)
/* 76D4 80019AB4 04002386 */  lh         $v1, 0x4($s1)
/* 76D8 80019AB8 04000286 */  lh         $v0, 0x4($s0)
/* 76DC 80019ABC 12200000 */  mflo       $a0
/* 76E0 80019AC0 23104300 */  subu       $v0, $v0, $v1
/* 76E4 80019AC4 00000000 */  nop
/* 76E8 80019AC8 18004200 */  mult       $v0, $v0
/* 76EC 80019ACC 1800A2AF */  sw         $v0, 0x18($sp)
/* 76F0 80019AD0 2120A400 */  addu       $a0, $a1, $a0
/* 76F4 80019AD4 12180000 */  mflo       $v1
/* 76F8 80019AD8 86B1010C */  jal        SquareRoot0_stub
/* 76FC 80019ADC 21208300 */   addu      $a0, $a0, $v1
/* 7700 80019AE0 21204000 */  addu       $a0, $v0, $zero
/* 7704 80019AE4 2A104402 */  slt        $v0, $s2, $a0
/* 7708 80019AE8 D0FF4010 */  beqz       $v0, .L80019A2C
/* 770C 80019AEC 23904402 */   subu      $s2, $s2, $a0
/* 7710 80019AF0 2B670008 */  j          .L80019CAC
/* 7714 80019AF4 21904402 */   addu      $s2, $s2, $a0
.L80019AF8:
/* 7718 80019AF8 8800918E */  lw         $s1, 0x88($s4)
/* 771C 80019AFC 00000000 */  nop
/* 7720 80019B00 08002292 */  lbu        $v0, 0x8($s1)
/* 7724 80019B04 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 7728 80019B08 ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 772C 80019B0C 40180200 */  sll        $v1, $v0, 1
/* 7730 80019B10 21186200 */  addu       $v1, $v1, $v0
/* 7734 80019B14 6001828C */  lw         $v0, 0x160($a0)
/* 7738 80019B18 80180300 */  sll        $v1, $v1, 2
/* 773C 80019B1C 4C01448C */  lw         $a0, 0x14C($v0)
/* 7740 80019B20 7000828E */  lw         $v0, 0x70($s4)
/* 7744 80019B24 00000000 */  nop
/* 7748 80019B28 00014230 */  andi       $v0, $v0, 0x100
/* 774C 80019B2C 08004010 */  beqz       $v0, .L80019B50
/* 7750 80019B30 21808300 */   addu      $s0, $a0, $v1
/* 7754 80019B34 09002392 */  lbu        $v1, 0x9($s1)
/* 7758 80019B38 FF000224 */  addiu      $v0, $zero, 0xFF
/* 775C 80019B3C 04006210 */  beq        $v1, $v0, .L80019B50
/* 7760 80019B40 40100300 */   sll       $v0, $v1, 1
/* 7764 80019B44 21104300 */  addu       $v0, $v0, $v1
/* 7768 80019B48 80100200 */  sll        $v0, $v0, 2
/* 776C 80019B4C 21808200 */  addu       $s0, $a0, $v0
.L80019B50:
/* 7770 80019B50 00000286 */  lh         $v0, 0x0($s0)
/* 7774 80019B54 00002386 */  lh         $v1, 0x0($s1)
/* 7778 80019B58 00000000 */  nop
/* 777C 80019B5C 23104300 */  subu       $v0, $v0, $v1
/* 7780 80019B60 18004200 */  mult       $v0, $v0
/* 7784 80019B64 1000A2AF */  sw         $v0, 0x10($sp)
/* 7788 80019B68 02000286 */  lh         $v0, 0x2($s0)
/* 778C 80019B6C 02002386 */  lh         $v1, 0x2($s1)
/* 7790 80019B70 12280000 */  mflo       $a1
/* 7794 80019B74 23104300 */  subu       $v0, $v0, $v1
/* 7798 80019B78 00000000 */  nop
/* 779C 80019B7C 18004200 */  mult       $v0, $v0
/* 77A0 80019B80 1400A2AF */  sw         $v0, 0x14($sp)
/* 77A4 80019B84 04002386 */  lh         $v1, 0x4($s1)
/* 77A8 80019B88 04000286 */  lh         $v0, 0x4($s0)
/* 77AC 80019B8C 12200000 */  mflo       $a0
/* 77B0 80019B90 23104300 */  subu       $v0, $v0, $v1
/* 77B4 80019B94 00000000 */  nop
/* 77B8 80019B98 18004200 */  mult       $v0, $v0
/* 77BC 80019B9C 1800A2AF */  sw         $v0, 0x18($sp)
/* 77C0 80019BA0 2120A400 */  addu       $a0, $a1, $a0
/* 77C4 80019BA4 12180000 */  mflo       $v1
/* 77C8 80019BA8 86B1010C */  jal        SquareRoot0_stub
/* 77CC 80019BAC 21208300 */   addu      $a0, $a0, $v1
/* 77D0 80019BB0 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 77D4 80019BB4 ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 77D8 80019BB8 00000000 */  nop
/* 77DC 80019BBC 0000638C */  lw         $v1, 0x0($v1)
/* 77E0 80019BC0 00000000 */  nop
/* 77E4 80019BC4 0F006330 */  andi       $v1, $v1, 0xF
/* 77E8 80019BC8 03006010 */  beqz       $v1, .L80019BD8
/* 77EC 80019BCC 21204000 */   addu      $a0, $v0, $zero
/* 77F0 80019BD0 27670008 */  j          .L80019C9C
/* 77F4 80019BD4 21900000 */   addu      $s2, $zero, $zero
.L80019BD8:
/* 77F8 80019BD8 9400828E */  lw         $v0, 0x94($s4)
/* 77FC 80019BDC 27670008 */  j          .L80019C9C
/* 7800 80019BE0 23905500 */   subu      $s2, $v0, $s5
.L80019BE4:
/* 7804 80019BE4 21880002 */  addu       $s1, $s0, $zero
/* 7808 80019BE8 08000492 */  lbu        $a0, 0x8($s0)
/* 780C 80019BEC 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 7810 80019BF0 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 7814 80019BF4 40180400 */  sll        $v1, $a0, 1
/* 7818 80019BF8 21186400 */  addu       $v1, $v1, $a0
/* 781C 80019BFC 6001428C */  lw         $v0, 0x160($v0)
/* 7820 80019C00 80180300 */  sll        $v1, $v1, 2
/* 7824 80019C04 4C01448C */  lw         $a0, 0x14C($v0)
/* 7828 80019C08 7000828E */  lw         $v0, 0x70($s4)
/* 782C 80019C0C 00000000 */  nop
/* 7830 80019C10 00014230 */  andi       $v0, $v0, 0x100
/* 7834 80019C14 08004010 */  beqz       $v0, .L80019C38
/* 7838 80019C18 21808300 */   addu      $s0, $a0, $v1
/* 783C 80019C1C 09002392 */  lbu        $v1, 0x9($s1)
/* 7840 80019C20 FF000224 */  addiu      $v0, $zero, 0xFF
/* 7844 80019C24 04006210 */  beq        $v1, $v0, .L80019C38
/* 7848 80019C28 40100300 */   sll       $v0, $v1, 1
/* 784C 80019C2C 21104300 */  addu       $v0, $v0, $v1
/* 7850 80019C30 80100200 */  sll        $v0, $v0, 2
/* 7854 80019C34 21808200 */  addu       $s0, $a0, $v0
.L80019C38:
/* 7858 80019C38 00000286 */  lh         $v0, 0x0($s0)
/* 785C 80019C3C 00002386 */  lh         $v1, 0x0($s1)
/* 7860 80019C40 00000000 */  nop
/* 7864 80019C44 23104300 */  subu       $v0, $v0, $v1
/* 7868 80019C48 18004200 */  mult       $v0, $v0
/* 786C 80019C4C 1000A2AF */  sw         $v0, 0x10($sp)
/* 7870 80019C50 02000286 */  lh         $v0, 0x2($s0)
/* 7874 80019C54 02002386 */  lh         $v1, 0x2($s1)
/* 7878 80019C58 12280000 */  mflo       $a1
/* 787C 80019C5C 23104300 */  subu       $v0, $v0, $v1
/* 7880 80019C60 00000000 */  nop
/* 7884 80019C64 18004200 */  mult       $v0, $v0
/* 7888 80019C68 1400A2AF */  sw         $v0, 0x14($sp)
/* 788C 80019C6C 04002386 */  lh         $v1, 0x4($s1)
/* 7890 80019C70 04000286 */  lh         $v0, 0x4($s0)
/* 7894 80019C74 12200000 */  mflo       $a0
/* 7898 80019C78 23104300 */  subu       $v0, $v0, $v1
/* 789C 80019C7C 00000000 */  nop
/* 78A0 80019C80 18004200 */  mult       $v0, $v0
/* 78A4 80019C84 1800A2AF */  sw         $v0, 0x18($sp)
/* 78A8 80019C88 2120A400 */  addu       $a0, $a1, $a0
/* 78AC 80019C8C 12180000 */  mflo       $v1
/* 78B0 80019C90 86B1010C */  jal        SquareRoot0_stub
/* 78B4 80019C94 21208300 */   addu      $a0, $a0, $v1
/* 78B8 80019C98 21204000 */  addu       $a0, $v0, $zero
.L80019C9C:
/* 78BC 80019C9C 2A104402 */  slt        $v0, $s2, $a0
/* 78C0 80019CA0 D0FF4010 */  beqz       $v0, .L80019BE4
/* 78C4 80019CA4 23904402 */   subu      $s2, $s2, $a0
/* 78C8 80019CA8 21904402 */  addu       $s2, $s2, $a0
.L80019CAC:
/* 78CC 80019CAC 03006012 */  beqz       $s3, .L80019CBC
/* 78D0 80019CB0 00000000 */   nop
/* 78D4 80019CB4 940092AE */  sw         $s2, 0x94($s4)
/* 78D8 80019CB8 880091AE */  sw         $s1, 0x88($s4)
.L80019CBC:
/* 78DC 80019CBC 0E008010 */  beqz       $a0, .L80019CF8
/* 78E0 80019CC0 00131200 */   sll       $v0, $s2, 12
/* 78E4 80019CC4 1A004400 */  div        $zero, $v0, $a0
/* 78E8 80019CC8 02008014 */  bnez       $a0, .L80019CD4
/* 78EC 80019CCC 00000000 */   nop
/* 78F0 80019CD0 0D000700 */  break      7
.L80019CD4:
/* 78F4 80019CD4 FFFF0124 */  addiu      $at, $zero, -0x1
/* 78F8 80019CD8 04008114 */  bne        $a0, $at, .L80019CEC
/* 78FC 80019CDC 0080013C */   lui       $at, (0x80000000 >> 16)
/* 7900 80019CE0 02004114 */  bne        $v0, $at, .L80019CEC
/* 7904 80019CE4 00000000 */   nop
/* 7908 80019CE8 0D000600 */  break      6
.L80019CEC:
/* 790C 80019CEC 12980000 */  mflo       $s3
/* 7910 80019CF0 3F670008 */  j          .L80019CFC
/* 7914 80019CF4 00000000 */   nop
.L80019CF8:
/* 7918 80019CF8 21980000 */  addu       $s3, $zero, $zero
.L80019CFC:
/* 791C 80019CFC 1000A28F */  lw         $v0, 0x10($sp)
/* 7920 80019D00 00000000 */  nop
/* 7924 80019D04 18005300 */  mult       $v0, $s3
/* 7928 80019D08 00002296 */  lhu        $v0, 0x0($s1)
/* 792C 80019D0C 12400000 */  mflo       $t0
/* 7930 80019D10 031B0800 */  sra        $v1, $t0, 12
/* 7934 80019D14 21104300 */  addu       $v0, $v0, $v1
/* 7938 80019D18 0000C2A6 */  sh         $v0, 0x0($s6)
/* 793C 80019D1C 1400A28F */  lw         $v0, 0x14($sp)
/* 7940 80019D20 00000000 */  nop
/* 7944 80019D24 18005300 */  mult       $v0, $s3
/* 7948 80019D28 02002296 */  lhu        $v0, 0x2($s1)
/* 794C 80019D2C 12400000 */  mflo       $t0
/* 7950 80019D30 031B0800 */  sra        $v1, $t0, 12
/* 7954 80019D34 21104300 */  addu       $v0, $v0, $v1
/* 7958 80019D38 80004224 */  addiu      $v0, $v0, 0x80
/* 795C 80019D3C 0200C2A6 */  sh         $v0, 0x2($s6)
/* 7960 80019D40 1800A28F */  lw         $v0, 0x18($sp)
/* 7964 80019D44 00000000 */  nop
/* 7968 80019D48 18005300 */  mult       $v0, $s3
/* 796C 80019D4C 04002296 */  lhu        $v0, 0x4($s1)
/* 7970 80019D50 12400000 */  mflo       $t0
/* 7974 80019D54 031B0800 */  sra        $v1, $t0, 12
/* 7978 80019D58 21104300 */  addu       $v0, $v0, $v1
/* 797C 80019D5C 0400C2A6 */  sh         $v0, 0x4($s6)
/* 7980 80019D60 1000A48F */  lw         $a0, 0x10($sp)
/* 7984 80019D64 1800A58F */  lw         $a1, 0x18($sp)
/* 7988 80019D68 CFC5010C */  jal        ratan2
/* 798C 80019D6C 00000000 */   nop
/* 7990 80019D70 1100A01A */  blez       $s5, .L80019DB8
/* 7994 80019D74 00085224 */   addiu     $s2, $v0, 0x800
/* 7998 80019D78 0A000292 */  lbu        $v0, 0xA($s0)
/* 799C 80019D7C 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 79A0 80019D80 ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 79A4 80019D84 40180200 */  sll        $v1, $v0, 1
/* 79A8 80019D88 21186200 */  addu       $v1, $v1, $v0
/* 79AC 80019D8C 6001828C */  lw         $v0, 0x160($a0)
/* 79B0 80019D90 80180300 */  sll        $v1, $v1, 2
/* 79B4 80019D94 4C01448C */  lw         $a0, 0x14C($v0)
/* 79B8 80019D98 7000828E */  lw         $v0, 0x70($s4)
/* 79BC 80019D9C 00000000 */  nop
/* 79C0 80019DA0 00014230 */  andi       $v0, $v0, 0x100
/* 79C4 80019DA4 18004010 */  beqz       $v0, .L80019E08
/* 79C8 80019DA8 21888300 */   addu      $s1, $a0, $v1
/* 79CC 80019DAC 0B000392 */  lbu        $v1, 0xB($s0)
/* 79D0 80019DB0 7D670008 */  j          .L80019DF4
/* 79D4 80019DB4 FF000224 */   addiu     $v0, $zero, 0xFF
.L80019DB8:
/* 79D8 80019DB8 08000292 */  lbu        $v0, 0x8($s0)
/* 79DC 80019DBC 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 79E0 80019DC0 ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 79E4 80019DC4 40180200 */  sll        $v1, $v0, 1
/* 79E8 80019DC8 21186200 */  addu       $v1, $v1, $v0
/* 79EC 80019DCC 6001828C */  lw         $v0, 0x160($a0)
/* 79F0 80019DD0 80180300 */  sll        $v1, $v1, 2
/* 79F4 80019DD4 4C01448C */  lw         $a0, 0x14C($v0)
/* 79F8 80019DD8 7000828E */  lw         $v0, 0x70($s4)
/* 79FC 80019DDC 00000000 */  nop
/* 7A00 80019DE0 00014230 */  andi       $v0, $v0, 0x100
/* 7A04 80019DE4 08004010 */  beqz       $v0, .L80019E08
/* 7A08 80019DE8 21888300 */   addu      $s1, $a0, $v1
/* 7A0C 80019DEC 09000392 */  lbu        $v1, 0x9($s0)
/* 7A10 80019DF0 FF000224 */  addiu      $v0, $zero, 0xFF
.L80019DF4:
/* 7A14 80019DF4 04006210 */  beq        $v1, $v0, .L80019E08
/* 7A18 80019DF8 40100300 */   sll       $v0, $v1, 1
/* 7A1C 80019DFC 21104300 */  addu       $v0, $v0, $v1
/* 7A20 80019E00 80100200 */  sll        $v0, $v0, 2
/* 7A24 80019E04 21888200 */  addu       $s1, $a0, $v0
.L80019E08:
/* 7A28 80019E08 00002386 */  lh         $v1, 0x0($s1)
/* 7A2C 80019E0C 00000486 */  lh         $a0, 0x0($s0)
/* 7A30 80019E10 04002286 */  lh         $v0, 0x4($s1)
/* 7A34 80019E14 04000586 */  lh         $a1, 0x4($s0)
/* 7A38 80019E18 23206400 */  subu       $a0, $v1, $a0
/* 7A3C 80019E1C CFC5010C */  jal        ratan2
/* 7A40 80019E20 23284500 */   subu      $a1, $v0, $a1
/* 7A44 80019E24 00084224 */  addiu      $v0, $v0, 0x800
/* 7A48 80019E28 23105200 */  subu       $v0, $v0, $s2
/* 7A4C 80019E2C FF0F4330 */  andi       $v1, $v0, 0xFFF
/* 7A50 80019E30 00086228 */  slti       $v0, $v1, 0x800
/* 7A54 80019E34 03004014 */  bnez       $v0, .L80019E44
/* 7A58 80019E38 18007300 */   mult      $v1, $s3
/* 7A5C 80019E3C 00F06324 */  addiu      $v1, $v1, -0x1000
/* 7A60 80019E40 18007300 */  mult       $v1, $s3
.L80019E44:
/* 7A64 80019E44 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 7A68 80019E48 3800B68F */  lw         $s6, 0x38($sp)
/* 7A6C 80019E4C 3400B58F */  lw         $s5, 0x34($sp)
/* 7A70 80019E50 3000B48F */  lw         $s4, 0x30($sp)
/* 7A74 80019E54 2C00B38F */  lw         $s3, 0x2C($sp)
/* 7A78 80019E58 2400B18F */  lw         $s1, 0x24($sp)
/* 7A7C 80019E5C 2000B08F */  lw         $s0, 0x20($sp)
/* 7A80 80019E60 12400000 */  mflo       $t0
/* 7A84 80019E64 03130800 */  sra        $v0, $t0, 12
/* 7A88 80019E68 21104202 */  addu       $v0, $s2, $v0
/* 7A8C 80019E6C 2800B28F */  lw         $s2, 0x28($sp)
/* 7A90 80019E70 FF0F4230 */  andi       $v0, $v0, 0xFFF
/* 7A94 80019E74 0800E003 */  jr         $ra
/* 7A98 80019E78 4000BD27 */   addiu     $sp, $sp, 0x40
.size CAM_FollowDriver_TrackPath, . - CAM_FollowDriver_TrackPath
