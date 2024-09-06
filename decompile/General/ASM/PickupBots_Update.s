.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel PickupBots_Update
/* 2E4D8 800408B8 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 2E4DC 800408BC ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 2E4E0 800408C0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 2E4E4 800408C4 2800BFAF */  sw         $ra, 0x28($sp)
/* 2E4E8 800408C8 2400B5AF */  sw         $s5, 0x24($sp)
/* 2E4EC 800408CC 2000B4AF */  sw         $s4, 0x20($sp)
/* 2E4F0 800408D0 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 2E4F4 800408D4 1800B2AF */  sw         $s2, 0x18($sp)
/* 2E4F8 800408D8 1400B1AF */  sw         $s1, 0x14($sp)
/* 2E4FC 800408DC 1000B0AF */  sw         $s0, 0x10($sp)
/* 2E500 800408E0 AB1C6290 */  lbu        $v0, 0x1CAB($v1)
/* 2E504 800408E4 00000000 */  nop
/* 2E508 800408E8 06004010 */  beqz       $v0, .L80040904
/* 2E50C 800408EC 00000000 */   nop
/* 2E510 800408F0 101D628C */  lw         $v0, 0x1D10($v1)
/* 2E514 800408F4 00000000 */  nop
/* 2E518 800408F8 004B4228 */  slti       $v0, $v0, 0x4B00
/* 2E51C 800408FC 0A004010 */  beqz       $v0, .L80040928
/* 2E520 80040900 00000000 */   nop
.L80040904:
/* 2E524 80040904 0000628C */  lw         $v0, 0x0($v1)
/* 2E528 80040908 00000000 */  nop
/* 2E52C 8004090C F0024104 */  bgez       $v0, .L800414D0
/* 2E530 80040910 00000000 */   nop
/* 2E534 80040914 101D628C */  lw         $v0, 0x1D10($v1)
/* 2E538 80040918 00000000 */  nop
/* 2E53C 8004091C C0124228 */  slti       $v0, $v0, 0x12C0
/* 2E540 80040920 EB024014 */  bnez       $v0, .L800414D0
/* 2E544 80040924 00000000 */   nop
.L80040928:
/* 2E548 80040928 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 2E54C 8004092C ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 2E550 80040930 00000000 */  nop
/* 2E554 80040934 0000828C */  lw         $v0, 0x0($a0)
/* 2E558 80040938 2080033C */  lui        $v1, (0x80200000 >> 16)
/* 2E55C 8004093C 24104300 */  and        $v0, $v0, $v1
/* 2E560 80040940 0080033C */  lui        $v1, (0x80000000 >> 16)
/* 2E564 80040944 91014314 */  bne        $v0, $v1, .L80040F8C
/* 2E568 80040948 00000000 */   nop
/* 2E56C 8004094C F024928C */  lw         $s2, 0x24F0($a0)
/* 2E570 80040950 7C09918F */  lw         $s1, 0x97C($gp) /* Failed to symbolize address 0x0000097C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E574 80040954 B005428E */  lw         $v0, 0x5B0($s2)
/* 2E578 80040958 EC24958C */  lw         $s5, 0x24EC($a0)
/* 2E57C 8004095C 02004230 */  andi       $v0, $v0, 0x2
/* 2E580 80040960 76014014 */  bnez       $v0, .L80040F3C
/* 2E584 80040964 0002033C */   lui       $v1, (0x2000000 >> 16)
/* 2E588 80040968 C802428E */  lw         $v0, 0x2C8($s2)
/* 2E58C 8004096C 00000000 */  nop
/* 2E590 80040970 24104300 */  and        $v0, $v0, $v1
/* 2E594 80040974 71014014 */  bnez       $v0, .L80040F3C
/* 2E598 80040978 00000000 */   nop
/* 2E59C 8004097C 1800428E */  lw         $v0, 0x18($s2)
/* 2E5A0 80040980 00000000 */  nop
/* 2E5A4 80040984 6D014014 */  bnez       $v0, .L80040F3C
/* 2E5A8 80040988 00000000 */   nop
/* 2E5AC 8004098C 0C004286 */  lh         $v0, 0xC($s2)
/* 2E5B0 80040990 00000000 */  nop
/* 2E5B4 80040994 69014014 */  bnez       $v0, .L80040F3C
/* 2E5B8 80040998 00000000 */   nop
/* 2E5BC 8004099C D405428E */  lw         $v0, 0x5D4($s2)
/* 2E5C0 800409A0 00000000 */  nop
/* 2E5C4 800409A4 411F4228 */  slti       $v0, $v0, 0x1F41
/* 2E5C8 800409A8 64014014 */  bnez       $v0, .L80040F3C
/* 2E5CC 800409AC 08002526 */   addiu     $a1, $s1, 0x8
/* 2E5D0 800409B0 0100A290 */  lbu        $v0, 0x1($a1)
/* 2E5D4 800409B4 00000000 */  nop
/* 2E5D8 800409B8 37004014 */  bnez       $v0, .L80040A98
/* 2E5DC 800409BC 00000000 */   nop
/* 2E5E0 800409C0 00002392 */  lbu        $v1, 0x0($s1)
/* 2E5E4 800409C4 6001848C */  lw         $a0, 0x160($a0)
/* 2E5E8 800409C8 40100300 */  sll        $v0, $v1, 1
/* 2E5EC 800409CC 21104300 */  addu       $v0, $v0, $v1
/* 2E5F0 800409D0 4C01838C */  lw         $v1, 0x14C($a0)
/* 2E5F4 800409D4 80100200 */  sll        $v0, $v0, 2
/* 2E5F8 800409D8 21104300 */  addu       $v0, $v0, $v1
/* 2E5FC 800409DC 06004294 */  lhu        $v0, 0x6($v0)
/* 2E600 800409E0 8804438E */  lw         $v1, 0x488($s2)
/* 2E604 800409E4 C0100200 */  sll        $v0, $v0, 3
/* 2E608 800409E8 2A104300 */  slt        $v0, $v0, $v1
/* 2E60C 800409EC 4A004010 */  beqz       $v0, .L80040B18
/* 2E610 800409F0 66000224 */   addiu     $v0, $zero, 0x66
/* 2E614 800409F4 02002392 */  lbu        $v1, 0x2($s1)
/* 2E618 800409F8 00000000 */  nop
/* 2E61C 800409FC 04006210 */  beq        $v1, $v0, .L80040A10
/* 2E620 80040A00 FFFF0624 */   addiu     $a2, $zero, -0x1
/* 2E624 80040A04 64000224 */  addiu      $v0, $zero, 0x64
/* 2E628 80040A08 06006214 */  bne        $v1, $v0, .L80040A24
/* 2E62C 80040A0C 00000000 */   nop
.L80040A10:
/* 2E630 80040A10 C0048387 */  lh         $v1, 0x4C0($gp) /* Failed to symbolize address 0x000004C0 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E634 80040A14 05000224 */  addiu      $v0, $zero, 0x5
/* 2E638 80040A18 02006214 */  bne        $v1, $v0, .L80040A24
/* 2E63C 80040A1C 00000000 */   nop
/* 2E640 80040A20 01002692 */  lbu        $a2, 0x1($s1)
.L80040A24:
/* 2E644 80040A24 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 2E648 80040A28 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 2E64C 80040A2C 00000000 */  nop
/* 2E650 80040A30 101A458C */  lw         $a1, 0x1A10($v0)
/* 2E654 80040A34 0D000224 */  addiu      $v0, $zero, 0xD
/* 2E658 80040A38 0500A214 */  bne        $a1, $v0, .L80040A50
/* 2E65C 80040A3C 0880043C */   lui       $a0, %hi(D_800859D0)
/* 2E660 80040A40 0880023C */  lui        $v0, %hi(D_800859D0)
/* 2E664 80040A44 D059518C */  lw         $s1, %lo(D_800859D0)($v0)
/* 2E668 80040A48 A0020108 */  j          .L80040A80
/* 2E66C 80040A4C 00140600 */   sll       $v0, $a2, 16
.L80040A50:
/* 2E670 80040A50 0880033C */  lui        $v1, %hi(D_80083A80)
/* 2E674 80040A54 803A6324 */  addiu      $v1, $v1, %lo(D_80083A80)
/* 2E678 80040A58 40100500 */  sll        $v0, $a1, 1
/* 2E67C 80040A5C 21104500 */  addu       $v0, $v0, $a1
/* 2E680 80040A60 C0100200 */  sll        $v0, $v0, 3
/* 2E684 80040A64 21104300 */  addu       $v0, $v0, $v1
/* 2E688 80040A68 00004284 */  lh         $v0, 0x0($v0)
/* 2E68C 80040A6C D0598424 */  addiu      $a0, $a0, %lo(D_800859D0)
/* 2E690 80040A70 80100200 */  sll        $v0, $v0, 2
/* 2E694 80040A74 21104400 */  addu       $v0, $v0, $a0
/* 2E698 80040A78 0000518C */  lw         $s1, 0x0($v0)
/* 2E69C 80040A7C 00140600 */  sll        $v0, $a2, 16
.L80040A80:
/* 2E6A0 80040A80 03140200 */  sra        $v0, $v0, 16
/* 2E6A4 80040A84 FFFF0324 */  addiu      $v1, $zero, -0x1
/* 2E6A8 80040A88 23004310 */  beq        $v0, $v1, .L80040B18
/* 2E6AC 80040A8C 00000000 */   nop
/* 2E6B0 80040A90 C6020108 */  j          .L80040B18
/* 2E6B4 80040A94 010026A2 */   sb        $a2, 0x1($s1)
.L80040A98:
/* 2E6B8 80040A98 08002392 */  lbu        $v1, 0x8($s1)
/* 2E6BC 80040A9C 6001848C */  lw         $a0, 0x160($a0)
/* 2E6C0 80040AA0 40100300 */  sll        $v0, $v1, 1
/* 2E6C4 80040AA4 21104300 */  addu       $v0, $v0, $v1
/* 2E6C8 80040AA8 4C01838C */  lw         $v1, 0x14C($a0)
/* 2E6CC 80040AAC 80100200 */  sll        $v0, $v0, 2
/* 2E6D0 80040AB0 21104300 */  addu       $v0, $v0, $v1
/* 2E6D4 80040AB4 06004294 */  lhu        $v0, 0x6($v0)
/* 2E6D8 80040AB8 8804438E */  lw         $v1, 0x488($s2)
/* 2E6DC 80040ABC C0100200 */  sll        $v0, $v0, 3
/* 2E6E0 80040AC0 2A186200 */  slt        $v1, $v1, $v0
/* 2E6E4 80040AC4 14006010 */  beqz       $v1, .L80040B18
/* 2E6E8 80040AC8 66000224 */   addiu     $v0, $zero, 0x66
/* 2E6EC 80040ACC 02002392 */  lbu        $v1, 0x2($s1)
/* 2E6F0 80040AD0 00000000 */  nop
/* 2E6F4 80040AD4 04006210 */  beq        $v1, $v0, .L80040AE8
/* 2E6F8 80040AD8 FFFF0424 */   addiu     $a0, $zero, -0x1
/* 2E6FC 80040ADC 64000224 */  addiu      $v0, $zero, 0x64
/* 2E700 80040AE0 08006214 */  bne        $v1, $v0, .L80040B04
/* 2E704 80040AE4 00140400 */   sll       $v0, $a0, 16
.L80040AE8:
/* 2E708 80040AE8 C0048387 */  lh         $v1, 0x4C0($gp) /* Failed to symbolize address 0x000004C0 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E70C 80040AEC 05000224 */  addiu      $v0, $zero, 0x5
/* 2E710 80040AF0 04006214 */  bne        $v1, $v0, .L80040B04
/* 2E714 80040AF4 00140400 */   sll       $v0, $a0, 16
/* 2E718 80040AF8 01002492 */  lbu        $a0, 0x1($s1)
/* 2E71C 80040AFC 00000000 */  nop
/* 2E720 80040B00 00140400 */  sll        $v0, $a0, 16
.L80040B04:
/* 2E724 80040B04 03140200 */  sra        $v0, $v0, 16
/* 2E728 80040B08 FFFF0324 */  addiu      $v1, $zero, -0x1
/* 2E72C 80040B0C 02004310 */  beq        $v0, $v1, .L80040B18
/* 2E730 80040B10 2188A000 */   addu      $s1, $a1, $zero
/* 2E734 80040B14 010024A2 */  sb         $a0, 0x1($s1)
.L80040B18:
/* 2E738 80040B18 7C0991AF */  sw         $s1, 0x97C($gp) /* Failed to symbolize address 0x0000097C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E73C 80040B1C 03002292 */  lbu        $v0, 0x3($s1)
/* 2E740 80040B20 00000000 */  nop
/* 2E744 80040B24 34004014 */  bnez       $v0, .L80040BF8
/* 2E748 80040B28 1E000324 */   addiu     $v1, $zero, 0x1E
/* 2E74C 80040B2C BC048287 */  lh         $v0, 0x4BC($gp) /* Failed to symbolize address 0x000004BC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E750 80040B30 BC048497 */  lhu        $a0, 0x4BC($gp) /* Failed to symbolize address 0x000004BC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E754 80040B34 2A004314 */  bne        $v0, $v1, .L80040BE0
/* 2E758 80040B38 00000000 */   nop
/* 2E75C 80040B3C B005428E */  lw         $v0, 0x5B0($s2)
/* 2E760 80040B40 00000000 */  nop
/* 2E764 80040B44 80004230 */  andi       $v0, $v0, 0x80
/* 2E768 80040B48 2B004014 */  bnez       $v0, .L80040BF8
/* 2E76C 80040B4C 00000000 */   nop
/* 2E770 80040B50 BE048287 */  lh         $v0, 0x4BE($gp) /* Failed to symbolize address 0x000004BE for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E774 80040B54 00000000 */  nop
/* 2E778 80040B58 0D004010 */  beqz       $v0, .L80040B90
/* 2E77C 80040B5C 02000224 */   addiu     $v0, $zero, 0x2
/* 2E780 80040B60 B8054386 */  lh         $v1, 0x5B8($s2)
/* 2E784 80040B64 00000000 */  nop
/* 2E788 80040B68 0D006010 */  beqz       $v1, .L80040BA0
/* 2E78C 80040B6C 01000224 */   addiu     $v0, $zero, 0x1
/* 2E790 80040B70 21006214 */  bne        $v1, $v0, .L80040BF8
/* 2E794 80040B74 02000224 */   addiu     $v0, $zero, 0x2
/* 2E798 80040B78 B005438E */  lw         $v1, 0x5B0($s2)
/* 2E79C 80040B7C 270642A2 */  sb         $v0, 0x627($s2)
/* 2E7A0 80040B80 BC0480A7 */  sh         $zero, 0x4BC($gp) /* Failed to symbolize address 0x000004BC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E7A4 80040B84 BE0480A7 */  sh         $zero, 0x4BE($gp) /* Failed to symbolize address 0x000004BE for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E7A8 80040B88 ED020108 */  j          .L80040BB4
/* 2E7AC 80040B8C 40006334 */   ori       $v1, $v1, 0x40
.L80040B90:
/* 2E7B0 80040B90 B8054386 */  lh         $v1, 0x5B8($s2)
/* 2E7B4 80040B94 00000000 */  nop
/* 2E7B8 80040B98 08006214 */  bne        $v1, $v0, .L80040BBC
/* 2E7BC 80040B9C 01000224 */   addiu     $v0, $zero, 0x1
.L80040BA0:
/* 2E7C0 80040BA0 B005438E */  lw         $v1, 0x5B0($s2)
/* 2E7C4 80040BA4 01000224 */  addiu      $v0, $zero, 0x1
/* 2E7C8 80040BA8 270642A2 */  sb         $v0, 0x627($s2)
/* 2E7CC 80040BAC BC0480A7 */  sh         $zero, 0x4BC($gp) /* Failed to symbolize address 0x000004BC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E7D0 80040BB0 40006334 */  ori        $v1, $v1, 0x40
.L80040BB4:
/* 2E7D4 80040BB4 FE020108 */  j          .L80040BF8
/* 2E7D8 80040BB8 B00543AE */   sw        $v1, 0x5B0($s2)
.L80040BBC:
/* 2E7DC 80040BBC 0E006214 */  bne        $v1, $v0, .L80040BF8
/* 2E7E0 80040BC0 00000000 */   nop
/* 2E7E4 80040BC4 B005428E */  lw         $v0, 0x5B0($s2)
/* 2E7E8 80040BC8 270640A2 */  sb         $zero, 0x627($s2)
/* 2E7EC 80040BCC BC0480A7 */  sh         $zero, 0x4BC($gp) /* Failed to symbolize address 0x000004BC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E7F0 80040BD0 BE0483A7 */  sh         $v1, 0x4BE($gp) /* Failed to symbolize address 0x000004BE for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E7F4 80040BD4 40004234 */  ori        $v0, $v0, 0x40
/* 2E7F8 80040BD8 FE020108 */  j          .L80040BF8
/* 2E7FC 80040BDC B00542AE */   sw        $v0, 0x5B0($s2)
.L80040BE0:
/* 2E800 80040BE0 B005428E */  lw         $v0, 0x5B0($s2)
/* 2E804 80040BE4 00000000 */  nop
/* 2E808 80040BE8 40004230 */  andi       $v0, $v0, 0x40
/* 2E80C 80040BEC 02004014 */  bnez       $v0, .L80040BF8
/* 2E810 80040BF0 01008224 */   addiu     $v0, $a0, 0x1
/* 2E814 80040BF4 BC0482A7 */  sh         $v0, 0x4BC($gp) /* Failed to symbolize address 0x000004BC for %gp_rel. Make sure this address is within the recognized valid address space */
.L80040BF8:
/* 2E818 80040BF8 78098287 */  lh         $v0, 0x978($gp) /* Failed to symbolize address 0x00000978 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E81C 80040BFC 78098397 */  lhu        $v1, 0x978($gp) /* Failed to symbolize address 0x00000978 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E820 80040C00 04004018 */  blez       $v0, .L80040C14
/* 2E824 80040C04 FFFF6224 */   addiu     $v0, $v1, -0x1
/* 2E828 80040C08 780982A7 */  sh         $v0, 0x978($gp) /* Failed to symbolize address 0x00000978 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E82C 80040C0C 34050108 */  j          .L800414D0
/* 2E830 80040C10 00000000 */   nop
.L80040C14:
/* 2E834 80040C14 0980043C */  lui        $a0, %hi(D_8008D668)
/* 2E838 80040C18 68D68424 */  addiu      $a0, $a0, %lo(D_8008D668)
/* 2E83C 80040C1C A1B1010C */  jal        RngDeadCoed
/* 2E840 80040C20 21980000 */   addu      $s3, $zero, $zero
/* 2E844 80040C24 10004230 */  andi       $v0, $v0, 0x10
/* 2E848 80040C28 0980033C */  lui        $v1, %hi(D_8008FBA4)
/* 2E84C 80040C2C A4FB6324 */  addiu      $v1, $v1, %lo(D_8008FBA4)
/* 2E850 80040C30 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 2E854 80040C34 ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 2E858 80040C38 04002596 */  lhu        $a1, 0x4($s1)
/* 2E85C 80040C3C B81E848C */  lw         $a0, 0x1EB8($a0)
/* 2E860 80040C40 0C00A524 */  addiu      $a1, $a1, 0xC
/* 2E864 80040C44 21208300 */  addu       $a0, $a0, $v1
/* 2E868 80040C48 47008380 */  lb         $v1, 0x47($a0)
/* 2E86C 80040C4C 21104500 */  addu       $v0, $v0, $a1
/* 2E870 80040C50 80180300 */  sll        $v1, $v1, 2
/* 2E874 80040C54 21104300 */  addu       $v0, $v0, $v1
/* 2E878 80040C58 780982A7 */  sh         $v0, 0x978($gp) /* Failed to symbolize address 0x00000978 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E87C 80040C5C 02003092 */  lbu        $s0, 0x2($s1)
/* 2E880 80040C60 64000224 */  addiu      $v0, $zero, 0x64
/* 2E884 80040C64 21180002 */  addu       $v1, $s0, $zero
/* 2E888 80040C68 03006214 */  bne        $v1, $v0, .L80040C78
/* 2E88C 80040C6C 65000224 */   addiu     $v0, $zero, 0x65
/* 2E890 80040C70 29030108 */  j          .L80040CA4
/* 2E894 80040C74 03001024 */   addiu     $s0, $zero, 0x3
.L80040C78:
/* 2E898 80040C78 03006214 */  bne        $v1, $v0, .L80040C88
/* 2E89C 80040C7C 66000224 */   addiu     $v0, $zero, 0x66
/* 2E8A0 80040C80 29030108 */  j          .L80040CA4
/* 2E8A4 80040C84 01001024 */   addiu     $s0, $zero, 0x1
.L80040C88:
/* 2E8A8 80040C88 03006214 */  bne        $v1, $v0, .L80040C98
/* 2E8AC 80040C8C 0F000224 */   addiu     $v0, $zero, 0xF
/* 2E8B0 80040C90 29030108 */  j          .L80040CA4
/* 2E8B4 80040C94 04001024 */   addiu     $s0, $zero, 0x4
.L80040C98:
/* 2E8B8 80040C98 02006214 */  bne        $v1, $v0, .L80040CA4
/* 2E8BC 80040C9C 00000000 */   nop
/* 2E8C0 80040CA0 FFFF1024 */  addiu      $s0, $zero, -0x1
.L80040CA4:
/* 2E8C4 80040CA4 06002496 */  lhu        $a0, 0x6($s1)
/* 2E8C8 80040CA8 00000000 */  nop
/* 2E8CC 80040CAC 02008230 */  andi       $v0, $a0, 0x2
/* 2E8D0 80040CB0 3A004010 */  beqz       $v0, .L80040D9C
/* 2E8D4 80040CB4 00000000 */   nop
/* 2E8D8 80040CB8 C0048287 */  lh         $v0, 0x4C0($gp) /* Failed to symbolize address 0x000004C0 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E8DC 80040CBC C0048397 */  lhu        $v1, 0x4C0($gp) /* Failed to symbolize address 0x000004C0 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E8E0 80040CC0 05004228 */  slti       $v0, $v0, 0x5
/* 2E8E4 80040CC4 32004014 */  bnez       $v0, .L80040D90
/* 2E8E8 80040CC8 01006224 */   addiu     $v0, $v1, 0x1
/* 2E8EC 80040CCC 02002392 */  lbu        $v1, 0x2($s1)
/* 2E8F0 80040CD0 64000224 */  addiu      $v0, $zero, 0x64
/* 2E8F4 80040CD4 0C006214 */  bne        $v1, $v0, .L80040D08
/* 2E8F8 80040CD8 65000224 */   addiu     $v0, $zero, 0x65
/* 2E8FC 80040CDC 01002392 */  lbu        $v1, 0x1($s1)
/* 2E900 80040CE0 03000224 */  addiu      $v0, $zero, 0x3
/* 2E904 80040CE4 23006210 */  beq        $v1, $v0, .L80040D74
/* 2E908 80040CE8 03001024 */   addiu     $s0, $zero, 0x3
/* 2E90C 80040CEC 21108000 */  addu       $v0, $a0, $zero
/* 2E910 80040CF0 05000324 */  addiu      $v1, $zero, 0x5
/* 2E914 80040CF4 01004234 */  ori        $v0, $v0, 0x1
/* 2E918 80040CF8 010030A2 */  sb         $s0, 0x1($s1)
/* 2E91C 80040CFC C00483A7 */  sh         $v1, 0x4C0($gp) /* Failed to symbolize address 0x000004C0 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E920 80040D00 68030108 */  j          .L80040DA0
/* 2E924 80040D04 060022A6 */   sh        $v0, 0x6($s1)
.L80040D08:
/* 2E928 80040D08 0D006214 */  bne        $v1, $v0, .L80040D40
/* 2E92C 80040D0C 66000224 */   addiu     $v0, $zero, 0x66
/* 2E930 80040D10 01008230 */  andi       $v0, $a0, 0x1
/* 2E934 80040D14 07004014 */  bnez       $v0, .L80040D34
/* 2E938 80040D18 01001024 */   addiu     $s0, $zero, 0x1
/* 2E93C 80040D1C 01008234 */  ori        $v0, $a0, 0x1
/* 2E940 80040D20 060022A6 */  sh         $v0, 0x6($s1)
/* 2E944 80040D24 05000224 */  addiu      $v0, $zero, 0x5
/* 2E948 80040D28 C00482A7 */  sh         $v0, 0x4C0($gp) /* Failed to symbolize address 0x000004C0 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E94C 80040D2C 68030108 */  j          .L80040DA0
/* 2E950 80040D30 03001024 */   addiu     $s0, $zero, 0x3
.L80040D34:
/* 2E954 80040D34 FEFF8230 */  andi       $v0, $a0, 0xFFFE
/* 2E958 80040D38 67030108 */  j          .L80040D9C
/* 2E95C 80040D3C 060022A6 */   sh        $v0, 0x6($s1)
.L80040D40:
/* 2E960 80040D40 17006214 */  bne        $v1, $v0, .L80040DA0
/* 2E964 80040D44 03000324 */   addiu     $v1, $zero, 0x3
/* 2E968 80040D48 01002292 */  lbu        $v0, 0x1($s1)
/* 2E96C 80040D4C 00000000 */  nop
/* 2E970 80040D50 08004310 */  beq        $v0, $v1, .L80040D74
/* 2E974 80040D54 04001024 */   addiu     $s0, $zero, 0x4
/* 2E978 80040D58 06002296 */  lhu        $v0, 0x6($s1)
/* 2E97C 80040D5C 010023A2 */  sb         $v1, 0x1($s1)
/* 2E980 80040D60 05000324 */  addiu      $v1, $zero, 0x5
/* 2E984 80040D64 C00483A7 */  sh         $v1, 0x4C0($gp) /* Failed to symbolize address 0x000004C0 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E988 80040D68 01004234 */  ori        $v0, $v0, 0x1
/* 2E98C 80040D6C 68030108 */  j          .L80040DA0
/* 2E990 80040D70 060022A6 */   sh        $v0, 0x6($s1)
.L80040D74:
/* 2E994 80040D74 06002396 */  lhu        $v1, 0x6($s1)
/* 2E998 80040D78 02000224 */  addiu      $v0, $zero, 0x2
/* 2E99C 80040D7C 010022A2 */  sb         $v0, 0x1($s1)
/* 2E9A0 80040D80 C00480A7 */  sh         $zero, 0x4C0($gp) /* Failed to symbolize address 0x000004C0 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E9A4 80040D84 FEFF6330 */  andi       $v1, $v1, 0xFFFE
/* 2E9A8 80040D88 68030108 */  j          .L80040DA0
/* 2E9AC 80040D8C 060023A6 */   sh        $v1, 0x6($s1)
.L80040D90:
/* 2E9B0 80040D90 C00482A7 */  sh         $v0, 0x4C0($gp) /* Failed to symbolize address 0x000004C0 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2E9B4 80040D94 68030108 */  j          .L80040DA0
/* 2E9B8 80040D98 00000000 */   nop
.L80040D9C:
/* 2E9BC 80040D9C C00480A7 */  sh         $zero, 0x4C0($gp) /* Failed to symbolize address 0x000004C0 for %gp_rel. Make sure this address is within the recognized valid address space */
.L80040DA0:
/* 2E9C0 80040DA0 01002392 */  lbu        $v1, 0x1($s1)
/* 2E9C4 80040DA4 02000224 */  addiu      $v0, $zero, 0x2
/* 2E9C8 80040DA8 02006214 */  bne        $v1, $v0, .L80040DB4
/* 2E9CC 80040DAC 00141000 */   sll       $v0, $s0, 16
/* 2E9D0 80040DB0 01001324 */  addiu      $s3, $zero, 0x1
.L80040DB4:
/* 2E9D4 80040DB4 C6014004 */  bltz       $v0, .L800414D0
/* 2E9D8 80040DB8 21200000 */   addu      $a0, $zero, $zero
/* 2E9DC 80040DBC 30004392 */  lbu        $v1, 0x30($s2)
/* 2E9E0 80040DC0 06002296 */  lhu        $v0, 0x6($s1)
/* 2E9E4 80040DC4 001E0300 */  sll        $v1, $v1, 24
/* 2E9E8 80040DC8 01004230 */  andi       $v0, $v0, 0x1
/* 2E9EC 80040DCC 02004010 */  beqz       $v0, .L80040DD8
/* 2E9F0 80040DD0 03A60300 */   sra       $s4, $v1, 24
/* 2E9F4 80040DD4 0A000424 */  addiu      $a0, $zero, 0xA
.L80040DD8:
/* 2E9F8 80040DD8 FDFF0226 */  addiu      $v0, $s0, -0x3
/* 2E9FC 80040DDC FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 2EA00 80040DE0 0200422C */  sltiu      $v0, $v0, 0x2
/* 2EA04 80040DE4 300044A2 */  sb         $a0, 0x30($s2)
/* 2EA08 80040DE8 0D004010 */  beqz       $v0, .L80040E20
/* 2EA0C 80040DEC 360050A2 */   sb        $s0, 0x36($s2)
/* 2EA10 80040DF0 0880043C */  lui        $a0, %hi(D_80086E84)
/* 2EA14 80040DF4 846E8424 */  addiu      $a0, $a0, %lo(D_80086E84)
/* 2EA18 80040DF8 4A004392 */  lbu        $v1, 0x4A($s2)
/* 2EA1C 80040DFC 4A00A292 */  lbu        $v0, 0x4A($s5)
/* 2EA20 80040E00 40180300 */  sll        $v1, $v1, 1
/* 2EA24 80040E04 21186400 */  addu       $v1, $v1, $a0
/* 2EA28 80040E08 40100200 */  sll        $v0, $v0, 1
/* 2EA2C 80040E0C 21104400 */  addu       $v0, $v0, $a0
/* 2EA30 80040E10 00006584 */  lh         $a1, 0x0($v1)
/* 2EA34 80040E14 00004684 */  lh         $a2, 0x0($v0)
/* 2EA38 80040E18 94030108 */  j          .L80040E50
/* 2EA3C 80040E1C 0F000424 */   addiu     $a0, $zero, 0xF
.L80040E20:
/* 2EA40 80040E20 0A000424 */  addiu      $a0, $zero, 0xA
/* 2EA44 80040E24 0880063C */  lui        $a2, %hi(D_80086E84)
/* 2EA48 80040E28 846EC624 */  addiu      $a2, $a2, %lo(D_80086E84)
/* 2EA4C 80040E2C 4A004392 */  lbu        $v1, 0x4A($s2)
/* 2EA50 80040E30 4A00A292 */  lbu        $v0, 0x4A($s5)
/* 2EA54 80040E34 40180300 */  sll        $v1, $v1, 1
/* 2EA58 80040E38 21186600 */  addu       $v1, $v1, $a2
/* 2EA5C 80040E3C 40100200 */  sll        $v0, $v0, 1
/* 2EA60 80040E40 21104600 */  addu       $v0, $v0, $a2
/* 2EA64 80040E44 00006584 */  lh         $a1, 0x0($v1)
/* 2EA68 80040E48 00004684 */  lh         $a2, 0x0($v0)
/* 2EA6C 80040E4C 02007336 */  ori        $s3, $s3, 0x2
.L80040E50:
/* 2EA70 80040E50 FAB2000C */  jal        Voiceline_RequestPlay
/* 2EA74 80040E54 00000000 */   nop
/* 2EA78 80040E58 36004392 */  lbu        $v1, 0x36($s2)
/* 2EA7C 80040E5C 01000424 */  addiu      $a0, $zero, 0x1
/* 2EA80 80040E60 08006414 */  bne        $v1, $a0, .L80040E84
/* 2EA84 80040E64 04000224 */   addiu     $v0, $zero, 0x4
/* 2EA88 80040E68 21204002 */  addu       $a0, $s2, $zero
/* 2EA8C 80040E6C 02000524 */  addiu      $a1, $zero, 0x2
/* 2EA90 80040E70 00341300 */  sll        $a2, $s3, 16
/* 2EA94 80040E74 0395010C */  jal        DECOMP_VehPickupItem_ShootNow
/* 2EA98 80040E78 03340600 */   sra       $a2, $a2, 16
/* 2EA9C 80040E7C CC030108 */  j          .L80040F30
/* 2EAA0 80040E80 0F000224 */   addiu     $v0, $zero, 0xF
.L80040E84:
/* 2EAA4 80040E84 17006214 */  bne        $v1, $v0, .L80040EE4
/* 2EAA8 80040E88 00141300 */   sll       $v0, $s3, 16
/* 2EAAC 80040E8C 03140200 */  sra        $v0, $v0, 16
/* 2EAB0 80040E90 15004414 */  bne        $v0, $a0, .L80040EE8
/* 2EAB4 80040E94 21204002 */   addu      $a0, $s2, $zero
/* 2EAB8 80040E98 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 2EABC 80040E9C ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 2EAC0 80040EA0 00000000 */  nop
/* 2EAC4 80040EA4 101A438C */  lw         $v1, 0x1A10($v0)
/* 2EAC8 80040EA8 0D000224 */  addiu      $v0, $zero, 0xD
/* 2EACC 80040EAC 0F006214 */  bne        $v1, $v0, .L80040EEC
/* 2EAD0 80040EB0 002C1000 */   sll       $a1, $s0, 16
/* 2EAD4 80040EB4 21204002 */  addu       $a0, $s2, $zero
/* 2EAD8 80040EB8 00841000 */  sll        $s0, $s0, 16
/* 2EADC 80040EBC 03841000 */  sra        $s0, $s0, 16
/* 2EAE0 80040EC0 21280002 */  addu       $a1, $s0, $zero
/* 2EAE4 80040EC4 0395010C */  jal        DECOMP_VehPickupItem_ShootNow
/* 2EAE8 80040EC8 01000624 */   addiu     $a2, $zero, 0x1
/* 2EAEC 80040ECC 21204002 */  addu       $a0, $s2, $zero
/* 2EAF0 80040ED0 21280002 */  addu       $a1, $s0, $zero
/* 2EAF4 80040ED4 0395010C */  jal        DECOMP_VehPickupItem_ShootNow
/* 2EAF8 80040ED8 01000624 */   addiu     $a2, $zero, 0x1
/* 2EAFC 80040EDC CC030108 */  j          .L80040F30
/* 2EB00 80040EE0 0F000224 */   addiu     $v0, $zero, 0xF
.L80040EE4:
/* 2EB04 80040EE4 21204002 */  addu       $a0, $s2, $zero
.L80040EE8:
/* 2EB08 80040EE8 002C1000 */  sll        $a1, $s0, 16
.L80040EEC:
/* 2EB0C 80040EEC 032C0500 */  sra        $a1, $a1, 16
/* 2EB10 80040EF0 00341300 */  sll        $a2, $s3, 16
/* 2EB14 80040EF4 0395010C */  jal        DECOMP_VehPickupItem_ShootNow
/* 2EB18 80040EF8 03340600 */   sra       $a2, $a2, 16
/* 2EB1C 80040EFC 36004392 */  lbu        $v1, 0x36($s2)
/* 2EB20 80040F00 03000224 */  addiu      $v0, $zero, 0x3
/* 2EB24 80040F04 0A006214 */  bne        $v1, $v0, .L80040F30
/* 2EB28 80040F08 0F000224 */   addiu     $v0, $zero, 0xF
/* 2EB2C 80040F0C 01002292 */  lbu        $v0, 0x1($s1)
/* 2EB30 80040F10 00000000 */  nop
/* 2EB34 80040F14 06004314 */  bne        $v0, $v1, .L80040F30
/* 2EB38 80040F18 0F000224 */   addiu     $v0, $zero, 0xF
/* 2EB3C 80040F1C C0048287 */  lh         $v0, 0x4C0($gp) /* Failed to symbolize address 0x000004C0 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2EB40 80040F20 05000324 */  addiu      $v1, $zero, 0x5
/* 2EB44 80040F24 02004310 */  beq        $v0, $v1, .L80040F30
/* 2EB48 80040F28 0F000224 */   addiu     $v0, $zero, 0xF
/* 2EB4C 80040F2C C00483A7 */  sh         $v1, 0x4C0($gp) /* Failed to symbolize address 0x000004C0 for %gp_rel. Make sure this address is within the recognized valid address space */
.L80040F30:
/* 2EB50 80040F30 360042A2 */  sb         $v0, 0x36($s2)
/* 2EB54 80040F34 34050108 */  j          .L800414D0
/* 2EB58 80040F38 300054A2 */   sb        $s4, 0x30($s2)
.L80040F3C:
/* 2EB5C 80040F3C 0980043C */  lui        $a0, %hi(D_8008D668)
/* 2EB60 80040F40 68D68424 */  addiu      $a0, $a0, %lo(D_8008D668)
/* 2EB64 80040F44 A1B1010C */  jal        RngDeadCoed
/* 2EB68 80040F48 00000000 */   nop
/* 2EB6C 80040F4C 10004230 */  andi       $v0, $v0, 0x10
/* 2EB70 80040F50 0980033C */  lui        $v1, %hi(D_8008FBA4)
/* 2EB74 80040F54 A4FB6324 */  addiu      $v1, $v1, %lo(D_8008FBA4)
/* 2EB78 80040F58 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 2EB7C 80040F5C ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 2EB80 80040F60 04002596 */  lhu        $a1, 0x4($s1)
/* 2EB84 80040F64 B81E848C */  lw         $a0, 0x1EB8($a0)
/* 2EB88 80040F68 0C00A524 */  addiu      $a1, $a1, 0xC
/* 2EB8C 80040F6C 21208300 */  addu       $a0, $a0, $v1
/* 2EB90 80040F70 47008380 */  lb         $v1, 0x47($a0)
/* 2EB94 80040F74 21104500 */  addu       $v0, $v0, $a1
/* 2EB98 80040F78 80180300 */  sll        $v1, $v1, 2
/* 2EB9C 80040F7C 21104300 */  addu       $v0, $v0, $v1
/* 2EBA0 80040F80 780982A7 */  sh         $v0, 0x978($gp) /* Failed to symbolize address 0x00000978 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2EBA4 80040F84 34050108 */  j          .L800414D0
/* 2EBA8 80040F88 00000000 */   nop
.L80040F8C:
/* 2EBAC 80040F8C A81C8290 */  lbu        $v0, 0x1CA8($a0)
/* 2EBB0 80040F90 00000000 */  nop
/* 2EBB4 80040F94 4E014010 */  beqz       $v0, .L800414D0
/* 2EBB8 80040F98 21A00000 */   addu      $s4, $zero, $zero
/* 2EBBC 80040F9C 1000133C */  lui        $s3, (0x100000 >> 16)
/* 2EBC0 80040FA0 EB51153C */  lui        $s5, (0x51EB851F >> 16)
/* 2EBC4 80040FA4 1F85B536 */  ori        $s5, $s5, (0x51EB851F & 0xFFFF)
/* 2EBC8 80040FA8 0880023C */  lui        $v0, %hi(D_80086E84)
/* 2EBCC 80040FAC 846E5224 */  addiu      $s2, $v0, %lo(D_80086E84)
.L80040FB0:
/* 2EBD0 80040FB0 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 2EBD4 80040FB4 ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 2EBD8 80040FB8 80101400 */  sll        $v0, $s4, 2
/* 2EBDC 80040FBC 21106200 */  addu       $v0, $v1, $v0
/* 2EBE0 80040FC0 EC24518C */  lw         $s1, 0x24EC($v0)
/* 2EBE4 80040FC4 00000000 */  nop
/* 2EBE8 80040FC8 82042286 */  lh         $v0, 0x482($s1)
/* 2EBEC 80040FCC 00000000 */  nop
/* 2EBF0 80040FD0 BB004010 */  beqz       $v0, .L800412C0
/* 2EBF4 80040FD4 FFFF4224 */   addiu     $v0, $v0, -0x1
/* 2EBF8 80040FD8 80100200 */  sll        $v0, $v0, 2
/* 2EBFC 80040FDC 21106200 */  addu       $v0, $v1, $v0
/* 2EC00 80040FE0 0C25508C */  lw         $s0, 0x250C($v0)
/* 2EC04 80040FE4 00000000 */  nop
/* 2EC08 80040FE8 C802038E */  lw         $v1, 0x2C8($s0)
/* 2EC0C 80040FEC 00000000 */  nop
/* 2EC10 80040FF0 24107300 */  and        $v0, $v1, $s3
/* 2EC14 80040FF4 B2004010 */  beqz       $v0, .L800412C0
/* 2EC18 80040FF8 00000000 */   nop
/* 2EC1C 80040FFC B005028E */  lw         $v0, 0x5B0($s0)
/* 2EC20 80041000 00000000 */  nop
/* 2EC24 80041004 02004230 */  andi       $v0, $v0, 0x2
/* 2EC28 80041008 AD004014 */  bnez       $v0, .L800412C0
/* 2EC2C 8004100C 0002023C */   lui       $v0, (0x2000000 >> 16)
/* 2EC30 80041010 24106200 */  and        $v0, $v1, $v0
/* 2EC34 80041014 AA004014 */  bnez       $v0, .L800412C0
/* 2EC38 80041018 00000000 */   nop
/* 2EC3C 8004101C 24060286 */  lh         $v0, 0x624($s0)
/* 2EC40 80041020 00000000 */  nop
/* 2EC44 80041024 A6004014 */  bnez       $v0, .L800412C0
/* 2EC48 80041028 00000000 */   nop
/* 2EC4C 8004102C 1800028E */  lw         $v0, 0x18($s0)
/* 2EC50 80041030 00000000 */  nop
/* 2EC54 80041034 A2004014 */  bnez       $v0, .L800412C0
/* 2EC58 80041038 00000000 */   nop
/* 2EC5C 8004103C 0C000286 */  lh         $v0, 0xC($s0)
/* 2EC60 80041040 00000000 */  nop
/* 2EC64 80041044 9E004014 */  bnez       $v0, .L800412C0
/* 2EC68 80041048 00000000 */   nop
/* 2EC6C 8004104C 1C00248E */  lw         $a0, 0x1C($s1)
/* 2EC70 80041050 1C00058E */  lw         $a1, 0x1C($s0)
/* 2EC74 80041054 4400838C */  lw         $v1, 0x44($a0)
/* 2EC78 80041058 4400A28C */  lw         $v0, 0x44($a1)
/* 2EC7C 8004105C 00000000 */  nop
/* 2EC80 80041060 23186200 */  subu       $v1, $v1, $v0
/* 2EC84 80041064 18006300 */  mult       $v1, $v1
/* 2EC88 80041068 4C00838C */  lw         $v1, 0x4C($a0)
/* 2EC8C 8004106C 4C00A28C */  lw         $v0, 0x4C($a1)
/* 2EC90 80041070 12300000 */  mflo       $a2
/* 2EC94 80041074 23186200 */  subu       $v1, $v1, $v0
/* 2EC98 80041078 00000000 */  nop
/* 2EC9C 8004107C 18006300 */  mult       $v1, $v1
/* 2ECA0 80041080 3A01023C */  lui        $v0, (0x13AFFFE >> 16)
/* 2ECA4 80041084 FEFF4234 */  ori        $v0, $v0, (0x13AFFFE & 0xFFFF)
/* 2ECA8 80041088 F6FF033C */  lui        $v1, (0xFFF6FFFF >> 16)
/* 2ECAC 8004108C FFFF6334 */  ori        $v1, $v1, (0xFFF6FFFF & 0xFFFF)
/* 2ECB0 80041090 12400000 */  mflo       $t0
/* 2ECB4 80041094 2120C800 */  addu       $a0, $a2, $t0
/* 2ECB8 80041098 21188300 */  addu       $v1, $a0, $v1
/* 2ECBC 8004109C 2B104300 */  sltu       $v0, $v0, $v1
/* 2ECC0 800410A0 87004014 */  bnez       $v0, .L800412C0
/* 2ECC4 800410A4 00000000 */   nop
/* 2ECC8 800410A8 8AFA000C */  jal        DECOMP_MixRNG_Scramble
/* 2ECCC 800410AC 00000000 */   nop
/* 2ECD0 800410B0 18005500 */  mult       $v0, $s5
/* 2ECD4 800410B4 C31F0200 */  sra        $v1, $v0, 31
/* 2ECD8 800410B8 10380000 */  mfhi       $a3
/* 2ECDC 800410BC 83210700 */  sra        $a0, $a3, 6
/* 2ECE0 800410C0 23208300 */  subu       $a0, $a0, $v1
/* 2ECE4 800410C4 40180400 */  sll        $v1, $a0, 1
/* 2ECE8 800410C8 21186400 */  addu       $v1, $v1, $a0
/* 2ECEC 800410CC C0180300 */  sll        $v1, $v1, 3
/* 2ECF0 800410D0 21186400 */  addu       $v1, $v1, $a0
/* 2ECF4 800410D4 C0180300 */  sll        $v1, $v1, 3
/* 2ECF8 800410D8 23204300 */  subu       $a0, $v0, $v1
/* 2ECFC 800410DC 48008014 */  bnez       $a0, .L80041200
/* 2ED00 800410E0 01000224 */   addiu     $v0, $zero, 0x1
/* 2ED04 800410E4 44000292 */  lbu        $v0, 0x44($s0)
/* 2ED08 800410E8 00000000 */  nop
/* 2ED0C 800410EC 12004010 */  beqz       $v0, .L80041138
/* 2ED10 800410F0 00000000 */   nop
/* 2ED14 800410F4 8AFA000C */  jal        DECOMP_MixRNG_Scramble
/* 2ED18 800410F8 00000000 */   nop
/* 2ED1C 800410FC 18005500 */  mult       $v0, $s5
/* 2ED20 80041100 C31F0200 */  sra        $v1, $v0, 31
/* 2ED24 80041104 10380000 */  mfhi       $a3
/* 2ED28 80041108 43210700 */  sra        $a0, $a3, 5
/* 2ED2C 8004110C 23208300 */  subu       $a0, $a0, $v1
/* 2ED30 80041110 40180400 */  sll        $v1, $a0, 1
/* 2ED34 80041114 21186400 */  addu       $v1, $v1, $a0
/* 2ED38 80041118 C0180300 */  sll        $v1, $v1, 3
/* 2ED3C 8004111C 21186400 */  addu       $v1, $v1, $a0
/* 2ED40 80041120 80180300 */  sll        $v1, $v1, 2
/* 2ED44 80041124 23104300 */  subu       $v0, $v0, $v1
/* 2ED48 80041128 32004228 */  slti       $v0, $v0, 0x32
/* 2ED4C 8004112C 02004010 */  beqz       $v0, .L80041138
/* 2ED50 80041130 0A000224 */   addiu     $v0, $zero, 0xA
/* 2ED54 80041134 300002A2 */  sb         $v0, 0x30($s0)
.L80041138:
/* 2ED58 80041138 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 2ED5C 8004113C ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 2ED60 80041140 00000000 */  nop
/* 2ED64 80041144 101D428C */  lw         $v0, 0x1D10($v0)
/* 2ED68 80041148 00000000 */  nop
/* 2ED6C 8004114C 01004230 */  andi       $v0, $v0, 0x1
/* 2ED70 80041150 14004010 */  beqz       $v0, .L800411A4
/* 2ED74 80041154 03000224 */   addiu     $v0, $zero, 0x3
/* 2ED78 80041158 360002A2 */  sb         $v0, 0x36($s0)
/* 2ED7C 8004115C C802228E */  lw         $v0, 0x2C8($s1)
/* 2ED80 80041160 00000000 */  nop
/* 2ED84 80041164 24105300 */  and        $v0, $v0, $s3
/* 2ED88 80041168 0C004014 */  bnez       $v0, .L8004119C
/* 2ED8C 8004116C 21200002 */   addu      $a0, $s0, $zero
/* 2ED90 80041170 4A000292 */  lbu        $v0, 0x4A($s0)
/* 2ED94 80041174 4A002392 */  lbu        $v1, 0x4A($s1)
/* 2ED98 80041178 40100200 */  sll        $v0, $v0, 1
/* 2ED9C 8004117C 21105200 */  addu       $v0, $v0, $s2
/* 2EDA0 80041180 40180300 */  sll        $v1, $v1, 1
/* 2EDA4 80041184 21187200 */  addu       $v1, $v1, $s2
/* 2EDA8 80041188 00004584 */  lh         $a1, 0x0($v0)
/* 2EDAC 8004118C 00006684 */  lh         $a2, 0x0($v1)
/* 2EDB0 80041190 FAB2000C */  jal        Voiceline_RequestPlay
/* 2EDB4 80041194 0F000424 */   addiu     $a0, $zero, 0xF
/* 2EDB8 80041198 21200002 */  addu       $a0, $s0, $zero
.L8004119C:
/* 2EDBC 8004119C 7C040108 */  j          .L800411F0
/* 2EDC0 800411A0 03000524 */   addiu     $a1, $zero, 0x3
.L800411A4:
/* 2EDC4 800411A4 04000224 */  addiu      $v0, $zero, 0x4
/* 2EDC8 800411A8 360002A2 */  sb         $v0, 0x36($s0)
/* 2EDCC 800411AC C802228E */  lw         $v0, 0x2C8($s1)
/* 2EDD0 800411B0 00000000 */  nop
/* 2EDD4 800411B4 24105300 */  and        $v0, $v0, $s3
/* 2EDD8 800411B8 0C004014 */  bnez       $v0, .L800411EC
/* 2EDDC 800411BC 21200002 */   addu      $a0, $s0, $zero
/* 2EDE0 800411C0 4A000292 */  lbu        $v0, 0x4A($s0)
/* 2EDE4 800411C4 4A002392 */  lbu        $v1, 0x4A($s1)
/* 2EDE8 800411C8 40100200 */  sll        $v0, $v0, 1
/* 2EDEC 800411CC 21105200 */  addu       $v0, $v0, $s2
/* 2EDF0 800411D0 40180300 */  sll        $v1, $v1, 1
/* 2EDF4 800411D4 21187200 */  addu       $v1, $v1, $s2
/* 2EDF8 800411D8 00004584 */  lh         $a1, 0x0($v0)
/* 2EDFC 800411DC 00006684 */  lh         $a2, 0x0($v1)
/* 2EE00 800411E0 FAB2000C */  jal        Voiceline_RequestPlay
/* 2EE04 800411E4 0F000424 */   addiu     $a0, $zero, 0xF
/* 2EE08 800411E8 21200002 */  addu       $a0, $s0, $zero
.L800411EC:
/* 2EE0C 800411EC 04000524 */  addiu      $a1, $zero, 0x4
.L800411F0:
/* 2EE10 800411F0 0395010C */  jal        DECOMP_VehPickupItem_ShootNow
/* 2EE14 800411F4 21300000 */   addu      $a2, $zero, $zero
/* 2EE18 800411F8 A9040108 */  j          .L800412A4
/* 2EE1C 800411FC 300000A2 */   sb        $zero, 0x30($s0)
.L80041200:
/* 2EE20 80041200 11008214 */  bne        $a0, $v0, .L80041248
/* 2EE24 80041204 02000224 */   addiu     $v0, $zero, 0x2
/* 2EE28 80041208 360004A2 */  sb         $a0, 0x36($s0)
/* 2EE2C 8004120C C802228E */  lw         $v0, 0x2C8($s1)
/* 2EE30 80041210 00000000 */  nop
/* 2EE34 80041214 24105300 */  and        $v0, $v0, $s3
/* 2EE38 80041218 1F004014 */  bnez       $v0, .L80041298
/* 2EE3C 8004121C 21200002 */   addu      $a0, $s0, $zero
/* 2EE40 80041220 4A000292 */  lbu        $v0, 0x4A($s0)
/* 2EE44 80041224 4A002392 */  lbu        $v1, 0x4A($s1)
/* 2EE48 80041228 40100200 */  sll        $v0, $v0, 1
/* 2EE4C 8004122C 21105200 */  addu       $v0, $v0, $s2
/* 2EE50 80041230 40180300 */  sll        $v1, $v1, 1
/* 2EE54 80041234 21187200 */  addu       $v1, $v1, $s2
/* 2EE58 80041238 00004584 */  lh         $a1, 0x0($v0)
/* 2EE5C 8004123C 00006684 */  lh         $a2, 0x0($v1)
/* 2EE60 80041240 A3040108 */  j          .L8004128C
/* 2EE64 80041244 0A000424 */   addiu     $a0, $zero, 0xA
.L80041248:
/* 2EE68 80041248 1C008214 */  bne        $a0, $v0, .L800412BC
/* 2EE6C 8004124C 0F000224 */   addiu     $v0, $zero, 0xF
/* 2EE70 80041250 360004A2 */  sb         $a0, 0x36($s0)
/* 2EE74 80041254 C802228E */  lw         $v0, 0x2C8($s1)
/* 2EE78 80041258 00000000 */  nop
/* 2EE7C 8004125C 24105300 */  and        $v0, $v0, $s3
/* 2EE80 80041260 0D004014 */  bnez       $v0, .L80041298
/* 2EE84 80041264 21200002 */   addu      $a0, $s0, $zero
/* 2EE88 80041268 4A000292 */  lbu        $v0, 0x4A($s0)
/* 2EE8C 8004126C 4A002392 */  lbu        $v1, 0x4A($s1)
/* 2EE90 80041270 40100200 */  sll        $v0, $v0, 1
/* 2EE94 80041274 21105200 */  addu       $v0, $v0, $s2
/* 2EE98 80041278 40180300 */  sll        $v1, $v1, 1
/* 2EE9C 8004127C 21187200 */  addu       $v1, $v1, $s2
/* 2EEA0 80041280 00004584 */  lh         $a1, 0x0($v0)
/* 2EEA4 80041284 00006684 */  lh         $a2, 0x0($v1)
/* 2EEA8 80041288 0B000424 */  addiu      $a0, $zero, 0xB
.L8004128C:
/* 2EEAC 8004128C FAB2000C */  jal        Voiceline_RequestPlay
/* 2EEB0 80041290 00000000 */   nop
/* 2EEB4 80041294 21200002 */  addu       $a0, $s0, $zero
.L80041298:
/* 2EEB8 80041298 02000524 */  addiu      $a1, $zero, 0x2
/* 2EEBC 8004129C 0395010C */  jal        DECOMP_VehPickupItem_ShootNow
/* 2EEC0 800412A0 21300000 */   addu      $a2, $zero, $zero
.L800412A4:
/* 2EEC4 800412A4 8AFA000C */  jal        DECOMP_MixRNG_Scramble
/* 2EEC8 800412A8 00000000 */   nop
/* 2EECC 800412AC FF004230 */  andi       $v0, $v0, 0xFF
/* 2EED0 800412B0 F0004224 */  addiu      $v0, $v0, 0xF0
/* 2EED4 800412B4 240602A6 */  sh         $v0, 0x624($s0)
/* 2EED8 800412B8 0F000224 */  addiu      $v0, $zero, 0xF
.L800412BC:
/* 2EEDC 800412BC 360002A2 */  sb         $v0, 0x36($s0)
.L800412C0:
/* 2EEE0 800412C0 82042386 */  lh         $v1, 0x482($s1)
/* 2EEE4 800412C4 00000000 */  nop
/* 2EEE8 800412C8 03006228 */  slti       $v0, $v1, 0x3
/* 2EEEC 800412CC 78004010 */  beqz       $v0, .L800414B0
/* 2EEF0 800412D0 01006224 */   addiu     $v0, $v1, 0x1
/* 2EEF4 800412D4 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 2EEF8 800412D8 ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 2EEFC 800412DC 80100200 */  sll        $v0, $v0, 2
/* 2EF00 800412E0 21108200 */  addu       $v0, $a0, $v0
/* 2EF04 800412E4 0C25508C */  lw         $s0, 0x250C($v0)
/* 2EF08 800412E8 00000000 */  nop
/* 2EF0C 800412EC C802038E */  lw         $v1, 0x2C8($s0)
/* 2EF10 800412F0 00000000 */  nop
/* 2EF14 800412F4 24107300 */  and        $v0, $v1, $s3
/* 2EF18 800412F8 6D004010 */  beqz       $v0, .L800414B0
/* 2EF1C 800412FC 00000000 */   nop
/* 2EF20 80041300 B005028E */  lw         $v0, 0x5B0($s0)
/* 2EF24 80041304 00000000 */  nop
/* 2EF28 80041308 02004230 */  andi       $v0, $v0, 0x2
/* 2EF2C 8004130C 68004014 */  bnez       $v0, .L800414B0
/* 2EF30 80041310 0002023C */   lui       $v0, (0x2000000 >> 16)
/* 2EF34 80041314 24106200 */  and        $v0, $v1, $v0
/* 2EF38 80041318 65004014 */  bnez       $v0, .L800414B0
/* 2EF3C 8004131C 00000000 */   nop
/* 2EF40 80041320 24060286 */  lh         $v0, 0x624($s0)
/* 2EF44 80041324 00000000 */  nop
/* 2EF48 80041328 61004014 */  bnez       $v0, .L800414B0
/* 2EF4C 8004132C 00000000 */   nop
/* 2EF50 80041330 1800028E */  lw         $v0, 0x18($s0)
/* 2EF54 80041334 00000000 */  nop
/* 2EF58 80041338 5D004014 */  bnez       $v0, .L800414B0
/* 2EF5C 8004133C 00000000 */   nop
/* 2EF60 80041340 0C000286 */  lh         $v0, 0xC($s0)
/* 2EF64 80041344 00000000 */  nop
/* 2EF68 80041348 59004014 */  bnez       $v0, .L800414B0
/* 2EF6C 8004134C 00000000 */   nop
/* 2EF70 80041350 44002292 */  lbu        $v0, 0x44($s1)
/* 2EF74 80041354 331D8380 */  lb         $v1, 0x1D33($a0)
/* 2EF78 80041358 00000000 */  nop
/* 2EF7C 8004135C 2A104300 */  slt        $v0, $v0, $v1
/* 2EF80 80041360 06004014 */  bnez       $v0, .L8004137C
/* 2EF84 80041364 00000000 */   nop
/* 2EF88 80041368 8804228E */  lw         $v0, 0x488($s1)
/* 2EF8C 8004136C 00000000 */  nop
/* 2EF90 80041370 813E4228 */  slti       $v0, $v0, 0x3E81
/* 2EF94 80041374 4E004014 */  bnez       $v0, .L800414B0
/* 2EF98 80041378 00000000 */   nop
.L8004137C:
/* 2EF9C 8004137C 1C00248E */  lw         $a0, 0x1C($s1)
/* 2EFA0 80041380 1C00058E */  lw         $a1, 0x1C($s0)
/* 2EFA4 80041384 4400838C */  lw         $v1, 0x44($a0)
/* 2EFA8 80041388 4400A28C */  lw         $v0, 0x44($a1)
/* 2EFAC 8004138C 00000000 */  nop
/* 2EFB0 80041390 23186200 */  subu       $v1, $v1, $v0
/* 2EFB4 80041394 18006300 */  mult       $v1, $v1
/* 2EFB8 80041398 4C00838C */  lw         $v1, 0x4C($a0)
/* 2EFBC 8004139C 4C00A28C */  lw         $v0, 0x4C($a1)
/* 2EFC0 800413A0 12300000 */  mflo       $a2
/* 2EFC4 800413A4 23186200 */  subu       $v1, $v1, $v0
/* 2EFC8 800413A8 00000000 */  nop
/* 2EFCC 800413AC 18006300 */  mult       $v1, $v1
/* 2EFD0 800413B0 3A01023C */  lui        $v0, (0x13AFFFE >> 16)
/* 2EFD4 800413B4 FEFF4234 */  ori        $v0, $v0, (0x13AFFFE & 0xFFFF)
/* 2EFD8 800413B8 F6FF033C */  lui        $v1, (0xFFF6FFFF >> 16)
/* 2EFDC 800413BC FFFF6334 */  ori        $v1, $v1, (0xFFF6FFFF & 0xFFFF)
/* 2EFE0 800413C0 12400000 */  mflo       $t0
/* 2EFE4 800413C4 2120C800 */  addu       $a0, $a2, $t0
/* 2EFE8 800413C8 21188300 */  addu       $v1, $a0, $v1
/* 2EFEC 800413CC 2B104300 */  sltu       $v0, $v0, $v1
/* 2EFF0 800413D0 37004014 */  bnez       $v0, .L800414B0
/* 2EFF4 800413D4 00000000 */   nop
/* 2EFF8 800413D8 8AFA000C */  jal        DECOMP_MixRNG_Scramble
/* 2EFFC 800413DC 00000000 */   nop
/* 2F000 800413E0 18005500 */  mult       $v0, $s5
/* 2F004 800413E4 C31F0200 */  sra        $v1, $v0, 31
/* 2F008 800413E8 10380000 */  mfhi       $a3
/* 2F00C 800413EC 03220700 */  sra        $a0, $a3, 8
/* 2F010 800413F0 23208300 */  subu       $a0, $a0, $v1
/* 2F014 800413F4 40180400 */  sll        $v1, $a0, 1
/* 2F018 800413F8 21186400 */  addu       $v1, $v1, $a0
/* 2F01C 800413FC C0180300 */  sll        $v1, $v1, 3
/* 2F020 80041400 21186400 */  addu       $v1, $v1, $a0
/* 2F024 80041404 40190300 */  sll        $v1, $v1, 5
/* 2F028 80041408 23204300 */  subu       $a0, $v0, $v1
/* 2F02C 8004140C 02008228 */  slti       $v0, $a0, 0x2
/* 2F030 80041410 0A004010 */  beqz       $v0, .L8004143C
/* 2F034 80041414 04008228 */   slti      $v0, $a0, 0x4
/* 2F038 80041418 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 2F03C 8004141C ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 2F040 80041420 00000000 */  nop
/* 2F044 80041424 331D4280 */  lb         $v0, 0x1D33($v0)
/* 2F048 80041428 44000392 */  lbu        $v1, 0x44($s0)
/* 2F04C 8004142C FFFF4224 */  addiu      $v0, $v0, -0x1
/* 2F050 80041430 04006214 */  bne        $v1, $v0, .L80041444
/* 2F054 80041434 02000224 */   addiu     $v0, $zero, 0x2
/* 2F058 80041438 04008228 */  slti       $v0, $a0, 0x4
.L8004143C:
/* 2F05C 8004143C 1A004010 */  beqz       $v0, .L800414A8
/* 2F060 80041440 01000224 */   addiu     $v0, $zero, 0x1
.L80041444:
/* 2F064 80041444 360002A2 */  sb         $v0, 0x36($s0)
/* 2F068 80041448 C802228E */  lw         $v0, 0x2C8($s1)
/* 2F06C 8004144C 00000000 */  nop
/* 2F070 80041450 24105300 */  and        $v0, $v0, $s3
/* 2F074 80041454 0C004014 */  bnez       $v0, .L80041488
/* 2F078 80041458 21200002 */   addu      $a0, $s0, $zero
/* 2F07C 8004145C 4A000292 */  lbu        $v0, 0x4A($s0)
/* 2F080 80041460 4A002392 */  lbu        $v1, 0x4A($s1)
/* 2F084 80041464 40100200 */  sll        $v0, $v0, 1
/* 2F088 80041468 21105200 */  addu       $v0, $v0, $s2
/* 2F08C 8004146C 40180300 */  sll        $v1, $v1, 1
/* 2F090 80041470 21187200 */  addu       $v1, $v1, $s2
/* 2F094 80041474 00004584 */  lh         $a1, 0x0($v0)
/* 2F098 80041478 00006684 */  lh         $a2, 0x0($v1)
/* 2F09C 8004147C FAB2000C */  jal        Voiceline_RequestPlay
/* 2F0A0 80041480 0B000424 */   addiu     $a0, $zero, 0xB
/* 2F0A4 80041484 21200002 */  addu       $a0, $s0, $zero
.L80041488:
/* 2F0A8 80041488 02000524 */  addiu      $a1, $zero, 0x2
/* 2F0AC 8004148C 0395010C */  jal        DECOMP_VehPickupItem_ShootNow
/* 2F0B0 80041490 21300000 */   addu      $a2, $zero, $zero
/* 2F0B4 80041494 8AFA000C */  jal        DECOMP_MixRNG_Scramble
/* 2F0B8 80041498 00000000 */   nop
/* 2F0BC 8004149C FF004230 */  andi       $v0, $v0, 0xFF
/* 2F0C0 800414A0 F0004224 */  addiu      $v0, $v0, 0xF0
/* 2F0C4 800414A4 240602A6 */  sh         $v0, 0x624($s0)
.L800414A8:
/* 2F0C8 800414A8 0F000224 */  addiu      $v0, $zero, 0xF
/* 2F0CC 800414AC 360002A2 */  sb         $v0, 0x36($s0)
.L800414B0:
/* 2F0D0 800414B0 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 2F0D4 800414B4 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 2F0D8 800414B8 00000000 */  nop
/* 2F0DC 800414BC A81C4290 */  lbu        $v0, 0x1CA8($v0)
/* 2F0E0 800414C0 01009426 */  addiu      $s4, $s4, 0x1
/* 2F0E4 800414C4 2A108202 */  slt        $v0, $s4, $v0
/* 2F0E8 800414C8 B9FE4014 */  bnez       $v0, .L80040FB0
/* 2F0EC 800414CC 00000000 */   nop
.L800414D0:
/* 2F0F0 800414D0 2800BF8F */  lw         $ra, 0x28($sp)
/* 2F0F4 800414D4 2400B58F */  lw         $s5, 0x24($sp)
/* 2F0F8 800414D8 2000B48F */  lw         $s4, 0x20($sp)
/* 2F0FC 800414DC 1C00B38F */  lw         $s3, 0x1C($sp)
/* 2F100 800414E0 1800B28F */  lw         $s2, 0x18($sp)
/* 2F104 800414E4 1400B18F */  lw         $s1, 0x14($sp)
/* 2F108 800414E8 1000B08F */  lw         $s0, 0x10($sp)
/* 2F10C 800414EC 0800E003 */  jr         $ra
/* 2F110 800414F0 3000BD27 */   addiu     $sp, $sp, 0x30
.size PickupBots_Update, . - PickupBots_Update
