.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel RenderBucket_QueueDraw
/* 5E570 80070950 5000238C */  lw         $v1, 0x50($at)
/* 5E574 80070954 7400C78F */  lw         $a3, 0x74($fp)
/* 5E578 80070958 24187C00 */  and        $v1, $v1, $gp
/* 5E57C 8007095C ED026010 */  beqz       $v1, .L80071514
/* 5E580 80070960 40003FAC */   sw        $ra, 0x40($at)
/* 5E584 80070964 EB02E010 */  beqz       $a3, .L80071514
/* 5E588 80070968 5800288C */   lw        $t0, 0x58($at)
/* 5E58C 8007096C 2000E384 */  lh         $v1, 0x20($a3)
/* 5E590 80070970 18000711 */  beq        $t0, $a3, .L800709D4
/* 5E594 80070974 580027AC */   sw        $a3, 0x58($at)
/* 5E598 80070978 2800EB8C */  lw         $t3, 0x28($a3)
/* 5E59C 8007097C 2C00EC8C */  lw         $t4, 0x2C($a3)
/* 5E5A0 80070980 3000ED8C */  lw         $t5, 0x30($a3)
/* 5E5A4 80070984 3400EE8C */  lw         $t6, 0x34($a3)
/* 5E5A8 80070988 80B1010C */  jal        func_8006C600
/* 5E5AC 8007098C 3800EF8C */   lw        $t7, 0x38($a3)
/* 5E5B0 80070990 0000F084 */  lh         $s0, 0x0($a3)
/* 5E5B4 80070994 0200F184 */  lh         $s1, 0x2($a3)
/* 5E5B8 80070998 0400F284 */  lh         $s2, 0x4($a3)
/* 5E5BC 8007099C 440030AC */  sw         $s0, 0x44($at)
/* 5E5C0 800709A0 480031AC */  sw         $s1, 0x48($at)
/* 5E5C4 800709A4 4C0032AC */  sw         $s2, 0x4C($at)
/* 5E5C8 800709A8 2200E884 */  lh         $t0, 0x22($a3)
/* 5E5CC 800709AC 1800E98C */  lw         $t1, 0x18($a3)
/* 5E5D0 800709B0 F400EA8C */  lw         $t2, 0xF4($a3)
/* 5E5D4 800709B4 3C0023A4 */  sh         $v1, 0x3C($at)
/* 5E5D8 800709B8 3E0028A4 */  sh         $t0, 0x3E($at)
/* 5E5DC 800709BC C01B0300 */  sll        $v1, $v1, 15
/* 5E5E0 800709C0 C0430800 */  sll        $t0, $t0, 15
/* 5E5E4 800709C4 00C0C348 */  ctc2       $v1, $24 /* handwritten instruction */
/* 5E5E8 800709C8 00C8C848 */  ctc2       $t0, $25 /* handwritten instruction */
/* 5E5EC 800709CC 00D0C948 */  ctc2       $t1, $26 /* handwritten instruction */
/* 5E5F0 800709D0 30002AAC */  sw         $t2, 0x30($at)
.L800709D4:
/* 5E5F4 800709D4 0004033C */  lui        $v1, (0x4000000 >> 16)
/* 5E5F8 800709D8 24187C00 */  and        $v1, $v1, $gp
/* 5E5FC 800709DC 0A006010 */  beqz       $v1, .L80070A08
/* 5E600 800709E0 00048A33 */   andi      $t2, $gp, 0x400
/* 5E604 800709E4 6C00A38F */  lw         $v1, 0x6C($sp)
/* 5E608 800709E8 5C00288C */  lw         $t0, 0x5C($at)
/* 5E60C 800709EC 3000638C */  lw         $v1, 0x30($v1)
/* 5E610 800709F0 FFFF0825 */  addiu      $t0, $t0, -0x1
/* 5E614 800709F4 4A006380 */  lb         $v1, 0x4A($v1)
/* 5E618 800709F8 00000000 */  nop
/* 5E61C 800709FC 02006814 */  bne        $v1, $t0, .L80070A08
/* 5E620 80070A00 FFFE0324 */   addiu     $v1, $zero, -0x101
/* 5E624 80070A04 24E08303 */  and        $gp, $gp, $v1
.L80070A08:
/* 5E628 80070A08 4400A38F */  lw         $v1, 0x44($sp)
/* 5E62C 80070A0C 4800A88F */  lw         $t0, 0x48($sp)
/* 5E630 80070A10 4C00A98F */  lw         $t1, 0x4C($sp)
/* 5E634 80070A14 11004015 */  bnez       $t2, .L80070A5C
/* 5E638 80070A18 7C0028AC */   sw        $t0, 0x7C($at)
/* 5E63C 80070A1C 4400308C */  lw         $s0, 0x44($at)
/* 5E640 80070A20 4800318C */  lw         $s1, 0x48($at)
/* 5E644 80070A24 4C00328C */  lw         $s2, 0x4C($at)
/* 5E648 80070A28 23187000 */  subu       $v1, $v1, $s0
/* 5E64C 80070A2C 23401101 */  subu       $t0, $t0, $s1
/* 5E650 80070A30 23483201 */  subu       $t1, $t1, $s2
/* 5E654 80070A34 00488348 */  mtc2       $v1, $9 /* handwritten instruction */
/* 5E658 80070A38 00508848 */  mtc2       $t0, $10 /* handwritten instruction */
/* 5E65C 80070A3C 00588948 */  mtc2       $t1, $11 /* handwritten instruction */
/* 5E660 80070A40 B40023A4 */  sh         $v1, 0xB4($at)
/* 5E664 80070A44 B60028A4 */  sh         $t0, 0xB6($at)
/* 5E668 80070A48 12E04B4A */  MVMVA      1, 1, 3, 3, 0
/* 5E66C 80070A4C B80029A4 */  sh         $t1, 0xB8($at)
/* 5E670 80070A50 00580948 */  mfc2       $t1, $11 /* handwritten instruction */
/* 5E674 80070A54 00500848 */  mfc2       $t0, $10 /* handwritten instruction */
/* 5E678 80070A58 00480348 */  mfc2       $v1, $9 /* handwritten instruction */
.L80070A5C:
/* 5E67C 80070A5C 2200B297 */  lhu        $s2, 0x22($sp)
/* 5E680 80070A60 00010A3C */  lui        $t2, (0x1000000 >> 16)
/* 5E684 80070A64 24508A03 */  and        $t2, $gp, $t2
/* 5E688 80070A68 07004011 */  beqz       $t2, .L80070A88
/* 5E68C 80070A6C 40500900 */   sll       $t2, $t1, 1
/* 5E690 80070A70 00F05125 */  addiu      $s1, $t2, -0x1000
/* 5E694 80070A74 A702201E */  bgtz       $s1, .L80071514
/* 5E698 80070A78 240000AC */   sw        $zero, 0x24($zero)
/* 5E69C 80070A7C 21904A02 */  addu       $s2, $s2, $t2
/* 5E6A0 80070A80 00F05126 */  addiu      $s1, $s2, -0x1000
/* 5E6A4 80070A84 A302201E */  bgtz       $s1, .L80071514
.L80070A88:
/* 5E6A8 80070A88 BC00D2A7 */   sh        $s2, 0xBC($fp)
/* 5E6AC 80070A8C 00F02A25 */  addiu      $t2, $t1, -0x1000
/* 5E6B0 80070A90 8C0029AC */  sw         $t1, 0x8C($at)
/* 5E6B4 80070A94 05004105 */  bgez       $t2, .L80070AAC
/* 5E6B8 80070A98 00000A24 */   addiu     $t2, $zero, 0x0
/* 5E6BC 80070A9C 02000A24 */  addiu      $t2, $zero, 0x2
/* 5E6C0 80070AA0 04184301 */  sllv       $v1, $v1, $t2
/* 5E6C4 80070AA4 04404801 */  sllv       $t0, $t0, $t2
/* 5E6C8 80070AA8 04484901 */  sllv       $t1, $t1, $t2
.L80070AAC:
/* 5E6CC 80070AAC 0008113C */  lui        $s1, (0x8000000 >> 16)
/* 5E6D0 80070AB0 24889103 */  and        $s1, $gp, $s1
/* 5E6D4 80070AB4 04002012 */  beqz       $s1, .L80070AC8
/* 5E6D8 80070AB8 1400748E */   lw        $s4, 0x14($s3)
/* 5E6DC 80070ABC 83180300 */  sra        $v1, $v1, 2
/* 5E6E0 80070AC0 83400800 */  sra        $t0, $t0, 2
/* 5E6E4 80070AC4 83480900 */  sra        $t1, $t1, 2
.L80070AC8:
/* 5E6E8 80070AC8 8C00C3AF */  sw         $v1, 0x8C($fp)
/* 5E6EC 80070ACC 9000C8AF */  sw         $t0, 0x90($fp)
/* 5E6F0 80070AD0 12007586 */  lh         $s5, 0x12($s3)
/* 5E6F4 80070AD4 9400C9AF */  sw         $t1, 0x94($fp)
/* 5E6F8 80070AD8 0028C348 */  ctc2       $v1, $5 /* handwritten instruction */
/* 5E6FC 80070ADC 0030C848 */  ctc2       $t0, $6 /* handwritten instruction */
/* 5E700 80070AE0 0038C948 */  ctc2       $t1, $7 /* handwritten instruction */
/* 5E704 80070AE4 3C002384 */  lh         $v1, 0x3C($at)
/* 5E708 80070AE8 8C00298C */  lw         $t1, 0x8C($at)
/* 5E70C 80070AEC 43180300 */  sra        $v1, $v1, 1
/* 5E710 80070AF0 18006900 */  mult       $v1, $t1
/* 5E714 80070AF4 12480000 */  mflo       $t1
/* 5E718 80070AF8 00D04848 */  cfc2       $t0, $26 /* handwritten instruction */
/* 5E71C 80070AFC 00000324 */  addiu      $v1, $zero, 0x0
/* 5E720 80070B00 1A002801 */  div        $zero, $t1, $t0
/* 5E724 80070B04 12480000 */  mflo       $t1
.L80070B08:
/* 5E728 80070B08 14008896 */  lhu        $t0, 0x14($s4)
/* 5E72C 80070B0C FFFFB526 */  addiu      $s5, $s5, -0x1
/* 5E730 80070B10 23402801 */  subu       $t0, $t1, $t0
/* 5E734 80070B14 06000005 */  bltz       $t0, .L80070B30
/* 5E738 80070B18 00000000 */   nop
/* 5E73C 80070B1C 01006324 */  addiu      $v1, $v1, 0x1
/* 5E740 80070B20 F9FFA016 */  bnez       $s5, .L80070B08
/* 5E744 80070B24 40009426 */   addiu     $s4, $s4, 0x40
/* 5E748 80070B28 7A020104 */  bgez       $zero, .L80071514
/* 5E74C 80070B2C E000C0AF */   sw        $zero, 0xE0($fp)
.L80070B30:
/* 5E750 80070B30 E000D4AF */  sw         $s4, 0xE0($fp)
/* 5E754 80070B34 D800C3AF */  sw         $v1, 0xD8($fp)
/* 5E758 80070B38 3000AB8F */  lw         $t3, 0x30($sp)
/* 5E75C 80070B3C 3400AC8F */  lw         $t4, 0x34($sp)
/* 5E760 80070B40 3800AD8F */  lw         $t5, 0x38($sp)
/* 5E764 80070B44 3C00AE8F */  lw         $t6, 0x3C($sp)
/* 5E768 80070B48 50B1010C */  jal        func_8006C540
/* 5E76C 80070B4C 4000AF8F */   lw        $t7, 0x40($sp)
/* 5E770 80070B50 02000924 */  addiu      $t1, $zero, 0x2
/* 5E774 80070B54 23502A01 */  subu       $t2, $t1, $t2
/* 5E778 80070B58 1800838E */  lw         $v1, 0x18($s4)
/* 5E77C 80070B5C 10004925 */  addiu      $t1, $t2, 0x10
/* 5E780 80070B60 06402301 */  srlv       $t0, $v1, $t1
/* 5E784 80070B64 001C0300 */  sll        $v1, $v1, 16
/* 5E788 80070B68 06182301 */  srlv       $v1, $v1, $t1
/* 5E78C 80070B6C 1C008996 */  lhu        $t1, 0x1C($s4)
/* 5E790 80070B70 0080C348 */  ctc2       $v1, $16 /* handwritten instruction */
/* 5E794 80070B74 0088C048 */  ctc2       $zero, $17 /* handwritten instruction */
/* 5E798 80070B78 0090C848 */  ctc2       $t0, $18 /* handwritten instruction */
/* 5E79C 80070B7C 0098C048 */  ctc2       $zero, $19 /* handwritten instruction */
/* 5E7A0 80070B80 07484901 */  srav       $t1, $t1, $t2
/* 5E7A4 80070B84 00A0C948 */  ctc2       $t1, $20 /* handwritten instruction */
/* 5E7A8 80070B88 1C00A0CB */  lwc2       $0, 0x1C($sp)
/* 5E7AC 80070B8C 2000A1CB */  lwc2       $1, 0x20($sp)
/* 5E7B0 80070B90 00028A33 */  andi       $t2, $gp, 0x200
/* 5E7B4 80070B94 14004011 */  beqz       $t2, .L80070BE8
/* 5E7B8 80070B98 8C002A8C */   lw        $t2, 0x8C($at)
/* 5E7BC 80070B9C 1C00A387 */  lh         $v1, 0x1C($sp)
/* 5E7C0 80070BA0 43500A00 */  sra        $t2, $t2, 1
/* 5E7C4 80070BA4 00104A25 */  addiu      $t2, $t2, 0x1000
/* 5E7C8 80070BA8 18004301 */  mult       $t2, $v1
/* 5E7CC 80070BAC 1E00A887 */  lh         $t0, 0x1E($sp)
/* 5E7D0 80070BB0 12180000 */  mflo       $v1
/* 5E7D4 80070BB4 031B0300 */  sra        $v1, $v1, 12
/* 5E7D8 80070BB8 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 5E7DC 80070BBC 18004801 */  mult       $t2, $t0
/* 5E7E0 80070BC0 2000A987 */  lh         $t1, 0x20($sp)
/* 5E7E4 80070BC4 12400000 */  mflo       $t0
/* 5E7E8 80070BC8 03430800 */  sra        $t0, $t0, 12
/* 5E7EC 80070BCC 00440800 */  sll        $t0, $t0, 16
/* 5E7F0 80070BD0 18004901 */  mult       $t2, $t1
/* 5E7F4 80070BD4 12480000 */  mflo       $t1
/* 5E7F8 80070BD8 034B0900 */  sra        $t1, $t1, 12
/* 5E7FC 80070BDC 25186800 */  or         $v1, $v1, $t0
/* 5E800 80070BE0 00008348 */  mtc2       $v1, $0 /* handwritten instruction */
/* 5E804 80070BE4 00088948 */  mtc2       $t1, $1 /* handwritten instruction */
.L80070BE8:
/* 5E808 80070BE8 00000C24 */  addiu      $t4, $zero, 0x0
/* 5E80C 80070BEC 00000E24 */  addiu      $t6, $zero, 0x0
/* 5E810 80070BF0 12604C4A */  MVMVA      1, 2, 0, 3, 0
/* 5E814 80070BF4 00480B48 */  mfc2       $t3, $9 /* handwritten instruction */
/* 5E818 80070BF8 00500D48 */  mfc2       $t5, $10 /* handwritten instruction */
/* 5E81C 80070BFC 00580F48 */  mfc2       $t7, $11 /* handwritten instruction */
/* 5E820 80070C00 74002BA4 */  sh         $t3, 0x74($at)
/* 5E824 80070C04 76002DA4 */  sh         $t5, 0x76($at)
/* 5E828 80070C08 78002FAC */  sw         $t7, 0x78($at)
/* 5E82C 80070C0C FFFF6B31 */  andi       $t3, $t3, 0xFFFF
/* 5E830 80070C10 FFFFAD31 */  andi       $t5, $t5, 0xFFFF
/* 5E834 80070C14 27B1010C */  jal        func_8006C49C
/* 5E838 80070C18 FFFFEF31 */   andi      $t7, $t7, 0xFFFF
/* 5E83C 80070C1C 5000A883 */  lb         $t0, 0x50($sp)
/* 5E840 80070C20 5100A983 */  lb         $t1, 0x51($sp)
/* 5E844 80070C24 BC0028AC */  sw         $t0, 0xBC($at)
/* 5E848 80070C28 C00029AC */  sw         $t1, 0xC0($at)
/* 5E84C 80070C2C 7000A38F */  lw         $v1, 0x70($sp)
/* 5E850 80070C30 5C00298C */  lw         $t1, 0x5C($at)
/* 5E854 80070C34 1A006010 */  beqz       $v1, .L80070CA0
/* 5E858 80070C38 02560300 */   srl       $t2, $v1, 24
/* 5E85C 80070C3C 18002A11 */  beq        $t1, $t2, .L80070CA0
/* 5E860 80070C40 00520300 */   sll       $t2, $v1, 8
/* 5E864 80070C44 03560A00 */  sra        $t2, $t2, 24
/* 5E868 80070C48 0088CA48 */  ctc2       $t2, $17 /* handwritten instruction */
/* 5E86C 80070C4C 00540300 */  sll        $t2, $v1, 16
/* 5E870 80070C50 03560A00 */  sra        $t2, $t2, 24
/* 5E874 80070C54 00540A00 */  sll        $t2, $t2, 16
/* 5E878 80070C58 001E0300 */  sll        $v1, $v1, 24
/* 5E87C 80070C5C 031E0300 */  sra        $v1, $v1, 24
/* 5E880 80070C60 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 5E884 80070C64 25186A00 */  or         $v1, $v1, $t2
/* 5E888 80070C68 0080C348 */  ctc2       $v1, $16 /* handwritten instruction */
/* 5E88C 80070C6C B40020C8 */  lwc2       $0, 0xB4($at)
/* 5E890 80070C70 B80021C8 */  lwc2       $1, 0xB8($at)
/* 5E894 80070C74 BC00288C */  lw         $t0, 0xBC($at)
/* 5E898 80070C78 C000298C */  lw         $t1, 0xC0($at)
/* 5E89C 80070C7C 12604C4A */  MVMVA      1, 2, 0, 3, 0
/* 5E8A0 80070C80 00C80348 */  mfc2       $v1, $25 /* handwritten instruction */
/* 5E8A4 80070C84 00000000 */  nop
/* 5E8A8 80070C88 05006018 */  blez       $v1, .L80070CA0
/* 5E8AC 80070C8C 00000000 */   nop
/* 5E8B0 80070C90 0A000825 */  addiu      $t0, $t0, 0xA
/* 5E8B4 80070C94 0A002925 */  addiu      $t1, $t1, 0xA
/* 5E8B8 80070C98 BC0028AC */  sw         $t0, 0xBC($at)
/* 5E8BC 80070C9C C00029AC */  sw         $t1, 0xC0($at)
.L80070CA0:
/* 5E8C0 80070CA0 3800968E */  lw         $s6, 0x38($s4)
/* 5E8C4 80070CA4 5200A393 */  lbu        $v1, 0x52($sp)
/* 5E8C8 80070CA8 00001124 */  addiu      $s1, $zero, 0x0
/* 5E8CC 80070CAC 3800C012 */  beqz       $s6, .L80070D90
/* 5E8D0 80070CB0 80180300 */   sll       $v1, $v1, 2
/* 5E8D4 80070CB4 21B0C302 */  addu       $s6, $s6, $v1
/* 5E8D8 80070CB8 0000D68E */  lw         $s6, 0x0($s6)
/* 5E8DC 80070CBC 5400A397 */  lhu        $v1, 0x54($sp)
/* 5E8E0 80070CC0 1400CA8E */  lw         $t2, 0x14($s6)
/* 5E8E4 80070CC4 1000C886 */  lh         $t0, 0x10($s6)
/* 5E8E8 80070CC8 1200C996 */  lhu        $t1, 0x12($s6)
/* 5E8EC 80070CCC D400CAAF */  sw         $t2, 0xD4($fp)
/* 5E8F0 80070CD0 800023AC */  sw         $v1, 0x80($at)
/* 5E8F4 80070CD4 21500001 */  addu       $t2, $t0, $zero
/* 5E8F8 80070CD8 FF7F0831 */  andi       $t0, $t0, 0x7FFF
/* 5E8FC 80070CDC FFFF0825 */  addiu      $t0, $t0, -0x1
/* 5E900 80070CE0 06004105 */  bgez       $t2, .L80070CFC
/* 5E904 80070CE4 840028AC */   sw        $t0, 0x84($at)
/* 5E908 80070CE8 42400800 */  srl        $t0, $t0, 1
/* 5E90C 80070CEC 01006A30 */  andi       $t2, $v1, 0x1
/* 5E910 80070CF0 02004011 */  beqz       $t2, .L80070CFC
/* 5E914 80070CF4 42180300 */   srl       $v1, $v1, 1
/* 5E918 80070CF8 FFFF1124 */  addiu      $s1, $zero, -0x1
.L80070CFC:
/* 5E91C 80070CFC 23500301 */  subu       $t2, $t0, $v1
/* 5E920 80070D00 02004105 */  bgez       $t2, .L80070D0C
/* 5E924 80070D04 54002A8C */   lw        $t2, 0x54($at)
/* 5E928 80070D08 21180001 */  addu       $v1, $t0, $zero
.L80070D0C:
/* 5E92C 80070D0C 9000288C */  lw         $t0, 0x90($at)
/* 5E930 80070D10 19006900 */  multu      $v1, $t1
/* 5E934 80070D14 1A000015 */  bnez       $t0, .L80070D80
/* 5E938 80070D18 30008A33 */   andi      $t2, $gp, 0x30
/* 5E93C 80070D1C 18004011 */  beqz       $t2, .L80070D80
/* 5E940 80070D20 8000238C */   lw        $v1, 0x80($at)
/* 5E944 80070D24 1600BE17 */  bne        $sp, $fp, .L80070D80
/* 5E948 80070D28 8400288C */   lw        $t0, 0x84($at)
/* 5E94C 80070D2C 20008A33 */  andi       $t2, $gp, 0x20
/* 5E950 80070D30 06004015 */  bnez       $t2, .L80070D4C
/* 5E954 80070D34 10008A33 */   andi      $t2, $gp, 0x10
/* 5E958 80070D38 23500301 */  subu       $t2, $t0, $v1
/* 5E95C 80070D3C 0F00401D */  bgtz       $t2, .L80070D7C
/* 5E960 80070D40 01006324 */   addiu     $v1, $v1, 0x1
/* 5E964 80070D44 0D000104 */  bgez       $zero, .L80070D7C
/* 5E968 80070D48 00000324 */   addiu     $v1, $zero, 0x0
.L80070D4C:
/* 5E96C 80070D4C 07004011 */  beqz       $t2, .L80070D6C
/* 5E970 80070D50 23500301 */   subu      $t2, $t0, $v1
/* 5E974 80070D54 0900401D */  bgtz       $t2, .L80070D7C
/* 5E978 80070D58 01006324 */   addiu     $v1, $v1, 0x1
/* 5E97C 80070D5C EFFF0A24 */  addiu      $t2, $zero, -0x11
/* 5E980 80070D60 24E08A03 */  and        $gp, $gp, $t2
/* 5E984 80070D64 05000104 */  bgez       $zero, .L80070D7C
/* 5E988 80070D68 FFFF0325 */   addiu     $v1, $t0, -0x1
.L80070D6C:
/* 5E98C 80070D6C 0300601C */  bgtz       $v1, .L80070D7C
/* 5E990 80070D70 FFFF6324 */   addiu     $v1, $v1, -0x1
/* 5E994 80070D74 10009C37 */  ori        $gp, $gp, 0x10
/* 5E998 80070D78 01000324 */  addiu      $v1, $zero, 0x1
.L80070D7C:
/* 5E99C 80070D7C 5400A3AF */  sw         $v1, 0x54($sp)
.L80070D80:
/* 5E9A0 80070D80 12180000 */  mflo       $v1
/* 5E9A4 80070D84 1800D626 */  addiu      $s6, $s6, 0x18
/* 5E9A8 80070D88 04000104 */  bgez       $zero, .L80070D9C
/* 5E9AC 80070D8C 21B0C302 */   addu      $s6, $s6, $v1
.L80070D90:
/* 5E9B0 80070D90 30008A8E */  lw         $t2, 0x30($s4)
/* 5E9B4 80070D94 2400968E */  lw         $s6, 0x24($s4)
/* 5E9B8 80070D98 D400CAAF */  sw         $t2, 0xD4($fp)
.L80070D9C:
/* 5E9BC 80070D9C 0000D78E */  lw         $s7, 0x0($s6)
/* 5E9C0 80070DA0 0400D886 */  lh         $t8, 0x4($s6)
/* 5E9C4 80070DA4 F8FF193C */  lui        $t9, (0xFFF8FFFF >> 16)
/* 5E9C8 80070DA8 FFFF3937 */  ori        $t9, $t9, (0xFFF8FFFF & 0xFFFF)
/* 5E9CC 80070DAC 11002012 */  beqz       $s1, .L80070DF4
/* 5E9D0 80070DB0 640031AC */   sw        $s1, 0x64($at)
/* 5E9D4 80070DB4 2188C902 */  addu       $s1, $s6, $t1
/* 5E9D8 80070DB8 02002886 */  lh         $t0, 0x2($s1)
/* 5E9DC 80070DBC 034C1700 */  sra        $t1, $s7, 16
/* 5E9E0 80070DC0 21400901 */  addu       $t0, $t0, $t1
/* 5E9E4 80070DC4 83400800 */  sra        $t0, $t0, 2
/* 5E9E8 80070DC8 40440800 */  sll        $t0, $t0, 17
/* 5E9EC 80070DCC 00002986 */  lh         $t1, 0x0($s1)
/* 5E9F0 80070DD0 04002A86 */  lh         $t2, 0x4($s1)
/* 5E9F4 80070DD4 00BC1700 */  sll        $s7, $s7, 16
/* 5E9F8 80070DD8 03BC1700 */  sra        $s7, $s7, 16
/* 5E9FC 80070DDC 21483701 */  addu       $t1, $t1, $s7
/* 5EA00 80070DE0 43480900 */  sra        $t1, $t1, 1
/* 5EA04 80070DE4 FFFF2931 */  andi       $t1, $t1, 0xFFFF
/* 5EA08 80070DE8 25B80901 */  or         $s7, $t0, $t1
/* 5EA0C 80070DEC 21C00A03 */  addu       $t8, $t8, $t2
/* 5EA10 80070DF0 43C01800 */  sra        $t8, $t8, 1
.L80070DF4:
/* 5EA14 80070DF4 C000D6AF */  sw         $s6, 0xC0($fp)
/* 5EA18 80070DF8 C400D1AF */  sw         $s1, 0xC4($fp)
/* 5EA1C 80070DFC 9800CBAF */  sw         $t3, 0x98($fp)
/* 5EA20 80070E00 9C00CCAF */  sw         $t4, 0x9C($fp)
/* 5EA24 80070E04 A000CDAF */  sw         $t5, 0xA0($fp)
/* 5EA28 80070E08 A400CEAF */  sw         $t6, 0xA4($fp)
/* 5EA2C 80070E0C A800CFAF */  sw         $t7, 0xA8($fp)
/* 5EA30 80070E10 00708333 */  andi       $v1, $gp, 0x7000
/* 5EA34 80070E14 680020AC */  sw         $zero, 0x68($at)
/* 5EA38 80070E18 54006010 */  beqz       $v1, .L80070F6C
/* 5EA3C 80070E1C 6C0020AC */   sw        $zero, 0x6C($at)
/* 5EA40 80070E20 00108333 */  andi       $v1, $gp, 0x1000
/* 5EA44 80070E24 2D006014 */  bnez       $v1, .L80070EDC
/* 5EA48 80070E28 700020AC */   sw        $zero, 0x70($at)
/* 5EA4C 80070E2C 76002384 */  lh         $v1, 0x76($at)
/* 5EA50 80070E30 03541700 */  sra        $t2, $s7, 16
/* 5EA54 80070E34 1A004301 */  div        $zero, $t2, $v1
/* 5EA58 80070E38 5600A887 */  lh         $t0, 0x56($sp)
/* 5EA5C 80070E3C 7C00298C */  lw         $t1, 0x7C($at)
/* 5EA60 80070E40 12500000 */  mflo       $t2
/* 5EA64 80070E44 03530A00 */  sra        $t2, $t2, 12
/* 5EA68 80070E48 21482A01 */  addu       $t1, $t1, $t2
/* 5EA6C 80070E4C 25506C01 */  or         $t2, $t3, $t4
/* 5EA70 80070E50 25504D01 */  or         $t2, $t2, $t5
/* 5EA74 80070E54 25504E01 */  or         $t2, $t2, $t6
/* 5EA78 80070E58 25504F01 */  or         $t2, $t2, $t7
/* 5EA7C 80070E5C 00F04A25 */  addiu      $t2, $t2, -0x1000
/* 5EA80 80070E60 3A004011 */  beqz       $t2, .L80070F4C
/* 5EA84 80070E64 23500901 */   subu      $t2, $t0, $t1
/* 5EA88 80070E68 80500A00 */  sll        $t2, $t2, 2
/* 5EA8C 80070E6C BE00CAA7 */  sh         $t2, 0xBE($fp)
/* 5EA90 80070E70 00408333 */  andi       $v1, $gp, 0x4000
/* 5EA94 80070E74 02006014 */  bnez       $v1, .L80070E80
/* 5EA98 80070E78 6A014A25 */   addiu     $t2, $t2, 0x16A
/* 5EA9C 80070E7C 3C004005 */  bltz       $t2, .L80070F70
.L80070E80:
/* 5EAA0 80070E80 16008896 */   lhu       $t0, 0x16($s4)
/* 5EAA4 80070E84 FFFE0324 */  addiu      $v1, $zero, -0x101
/* 5EAA8 80070E88 24E08303 */  and        $gp, $gp, $v1
/* 5EAAC 80070E8C 6C0023AC */  sw         $v1, 0x6C($at)
/* 5EAB0 80070E90 00088333 */  andi       $v1, $gp, 0x800
/* 5EAB4 80070E94 3B006014 */  bnez       $v1, .L80070F84
/* 5EAB8 80070E98 01000831 */   andi      $t0, $t0, 0x1
/* 5EABC 80070E9C 39000015 */  bnez       $t0, .L80070F84
/* 5EAC0 80070EA0 00000000 */   nop
/* 5EAC4 80070EA4 56B1010C */  jal        func_8006C558
/* 5EAC8 80070EA8 00000000 */   nop
/* 5EACC 80070EAC 00404348 */  cfc2       $v1, $8 /* handwritten instruction */
/* 5EAD0 80070EB0 00484848 */  cfc2       $t0, $9 /* handwritten instruction */
/* 5EAD4 80070EB4 00504948 */  cfc2       $t1, $10 /* handwritten instruction */
/* 5EAD8 80070EB8 7800C3AF */  sw         $v1, 0x78($fp)
/* 5EADC 80070EBC 7C00C8AF */  sw         $t0, 0x7C($fp)
/* 5EAE0 80070EC0 8000C9AF */  sw         $t1, 0x80($fp)
/* 5EAE4 80070EC4 00584348 */  cfc2       $v1, $11 /* handwritten instruction */
/* 5EAE8 80070EC8 00604848 */  cfc2       $t0, $12 /* handwritten instruction */
/* 5EAEC 80070ECC 50B1010C */  jal        func_8006C540
/* 5EAF0 80070ED0 8400C3AF */   sw        $v1, 0x84($fp)
/* 5EAF4 80070ED4 5F000104 */  bgez       $zero, .L80071054
/* 5EAF8 80070ED8 8800C8AF */   sw        $t0, 0x88($fp)
.L80070EDC:
/* 5EAFC 80070EDC 7800238C */  lw         $v1, 0x78($at)
/* 5EB00 80070EE0 A8050A24 */  addiu      $t2, $zero, 0x5A8
/* 5EB04 80070EE4 18006A00 */  mult       $v1, $t2
/* 5EB08 80070EE8 00D04348 */  cfc2       $v1, $26 /* handwritten instruction */
/* 5EB0C 80070EEC 8C00298C */  lw         $t1, 0x8C($at)
/* 5EB10 80070EF0 80180300 */  sll        $v1, $v1, 2
/* 5EB14 80070EF4 23482301 */  subu       $t1, $t1, $v1
/* 5EB18 80070EF8 12500000 */  mflo       $t2
/* 5EB1C 80070EFC 03530A00 */  sra        $t2, $t2, 12
/* 5EB20 80070F00 23482A01 */  subu       $t1, $t1, $t2
/* 5EB24 80070F04 19002105 */  bgez       $t1, .L80070F6C
/* 5EB28 80070F08 00000000 */   nop
/* 5EB2C 80070F0C 56B1010C */  jal        func_8006C558
/* 5EB30 80070F10 00000000 */   nop
/* 5EB34 80070F14 9800CBAF */  sw         $t3, 0x98($fp)
/* 5EB38 80070F18 9C00CCAF */  sw         $t4, 0x9C($fp)
/* 5EB3C 80070F1C A000CDAF */  sw         $t5, 0xA0($fp)
/* 5EB40 80070F20 A400CEAF */  sw         $t6, 0xA4($fp)
/* 5EB44 80070F24 50B1010C */  jal        func_8006C540
/* 5EB48 80070F28 A800CFAF */   sw        $t7, 0xA8($fp)
/* 5EB4C 80070F2C 00100324 */  addiu      $v1, $zero, 0x1000
/* 5EB50 80070F30 7800C3AF */  sw         $v1, 0x78($fp)
/* 5EB54 80070F34 7C00C0AF */  sw         $zero, 0x7C($fp)
/* 5EB58 80070F38 8000C3AF */  sw         $v1, 0x80($fp)
/* 5EB5C 80070F3C 8400C0AF */  sw         $zero, 0x84($fp)
/* 5EB60 80070F40 8800C3AF */  sw         $v1, 0x88($fp)
/* 5EB64 80070F44 43000104 */  bgez       $zero, .L80071054
/* 5EB68 80070F48 70003CAC */   sw        $gp, 0x70($at)
.L80070F4C:
/* 5EB6C 80070F4C 00530A00 */  sll        $t2, $t2, 12
/* 5EB70 80070F50 1A004301 */  div        $zero, $t2, $v1
/* 5EB74 80070F54 12500000 */  mflo       $t2
/* 5EB78 80070F58 80500A00 */  sll        $t2, $t2, 2
/* 5EB7C 80070F5C BE00CAA7 */  sh         $t2, 0xBE($fp)
/* 5EB80 80070F60 68002AAC */  sw         $t2, 0x68($at)
/* 5EB84 80070F64 FFFE0824 */  addiu      $t0, $zero, -0x101
/* 5EB88 80070F68 24E08803 */  and        $gp, $gp, $t0
.L80070F6C:
/* 5EB8C 80070F6C 16008896 */  lhu        $t0, 0x16($s4)
.L80070F70:
/* 5EB90 80070F70 00088333 */  andi       $v1, $gp, 0x800
/* 5EB94 80070F74 03006014 */  bnez       $v1, .L80070F84
/* 5EB98 80070F78 01000331 */   andi      $v1, $t0, 0x1
/* 5EB9C 80070F7C 2D006010 */  beqz       $v1, .L80071034
/* 5EBA0 80070F80 00000000 */   nop
.L80070F84:
/* 5EBA4 80070F84 00285048 */  cfc2       $s0, $5 /* handwritten instruction */
/* 5EBA8 80070F88 00385248 */  cfc2       $s2, $7 /* handwritten instruction */
/* 5EBAC 80070F8C 00808933 */  andi       $t1, $gp, 0x8000
/* 5EBB0 80070F90 02002011 */  beqz       $t1, .L80070F9C
/* 5EBB4 80070F94 00000000 */   nop
/* 5EBB8 80070F98 22801000 */  neg        $s0, $s0 /* handwritten instruction */
.L80070F9C:
/* 5EBBC 80070F9C 00489048 */  mtc2       $s0, $9 /* handwritten instruction */
/* 5EBC0 80070FA0 00509248 */  mtc2       $s2, $10 /* handwritten instruction */
/* 5EBC4 80070FA4 00000000 */  nop
/* 5EBC8 80070FA8 00000000 */  nop
/* 5EBCC 80070FAC 2804A04A */  SQR        0
/* 5EBD0 80070FB0 00C80348 */  mfc2       $v1, $25 /* handwritten instruction */
/* 5EBD4 80070FB4 00D00848 */  mfc2       $t0, $26 /* handwritten instruction */
/* 5EBD8 80070FB8 880024AC */  sw         $a0, 0x88($at)
/* 5EBDC 80070FBC 86B1010C */  jal        SquareRoot0_stub
/* 5EBE0 80070FC0 21206800 */   addu      $a0, $v1, $t0
/* 5EBE4 80070FC4 8800248C */  lw         $a0, 0x88($at)
/* 5EBE8 80070FC8 00931200 */  sll        $s2, $s2, 12
/* 5EBEC 80070FCC 1A004202 */  div        $zero, $s2, $v0
/* 5EBF0 80070FD0 12580000 */  mflo       $t3
/* 5EBF4 80070FD4 00100D24 */  addiu      $t5, $zero, 0x1000
/* 5EBF8 80070FD8 FFFF6B31 */  andi       $t3, $t3, 0xFFFF
/* 5EBFC 80070FDC 21786001 */  addu       $t7, $t3, $zero
/* 5EC00 80070FE0 00831000 */  sll        $s0, $s0, 12
/* 5EC04 80070FE4 1A000202 */  div        $zero, $s0, $v0
/* 5EC08 80070FE8 12600000 */  mflo       $t4
/* 5EC0C 80070FEC FFFF8C31 */  andi       $t4, $t4, 0xFFFF
/* 5EC10 80070FF0 22700C00 */  neg        $t6, $t4 /* handwritten instruction */
/* 5EC14 80070FF4 27B1010C */  jal        func_8006C49C
/* 5EC18 80070FF8 FFFFCE31 */   andi      $t6, $t6, 0xFFFF
/* 5EC1C 80070FFC 00100324 */  addiu      $v1, $zero, 0x1000
/* 5EC20 80071000 00F60824 */  addiu      $t0, $zero, -0xA00
/* 5EC24 80071004 0000C348 */  ctc2       $v1, $0 /* handwritten instruction */
/* 5EC28 80071008 0008C048 */  ctc2       $zero, $1 /* handwritten instruction */
/* 5EC2C 8007100C 0010C848 */  ctc2       $t0, $2 /* handwritten instruction */
/* 5EC30 80071010 0018C048 */  ctc2       $zero, $3 /* handwritten instruction */
/* 5EC34 80071014 27B1010C */  jal        func_8006C49C
/* 5EC38 80071018 0020C348 */   ctc2      $v1, $4 /* handwritten instruction */
/* 5EC3C 8007101C 7800CBAF */  sw         $t3, 0x78($fp)
/* 5EC40 80071020 7C00CCAF */  sw         $t4, 0x7C($fp)
/* 5EC44 80071024 8000CDAF */  sw         $t5, 0x80($fp)
/* 5EC48 80071028 8400CEAF */  sw         $t6, 0x84($fp)
/* 5EC4C 8007102C 09000104 */  bgez       $zero, .L80071054
/* 5EC50 80071030 8800CFAF */   sw        $t7, 0x88($fp)
.L80071034:
/* 5EC54 80071034 56B1010C */  jal        func_8006C558
/* 5EC58 80071038 00000000 */   nop
/* 5EC5C 8007103C 7800CBAF */  sw         $t3, 0x78($fp)
/* 5EC60 80071040 7C00CCAF */  sw         $t4, 0x7C($fp)
/* 5EC64 80071044 8000CDAF */  sw         $t5, 0x80($fp)
/* 5EC68 80071048 8400CEAF */  sw         $t6, 0x84($fp)
/* 5EC6C 8007104C 50B1010C */  jal        func_8006C540
/* 5EC70 80071050 8800CFAF */   sw        $t7, 0x88($fp)
.L80071054:
/* 5EC74 80071054 F8FF033C */  lui        $v1, (0xFFF8FFFF >> 16)
/* 5EC78 80071058 FFFF6334 */  ori        $v1, $v1, (0xFFF8FFFF & 0xFFFF)
/* 5EC7C 8007105C 80B81700 */  sll        $s7, $s7, 2
/* 5EC80 80071060 24B8E302 */  and        $s7, $s7, $v1
/* 5EC84 80071064 80C01800 */  sll        $t8, $t8, 2
/* 5EC88 80071068 00009748 */  mtc2       $s7, $0 /* handwritten instruction */
/* 5EC8C 8007106C 00089848 */  mtc2       $t8, $1 /* handwritten instruction */
/* 5EC90 80071070 FC03E326 */  addiu      $v1, $s7, 0x3FC
/* 5EC94 80071074 24187900 */  and        $v1, $v1, $t9
/* 5EC98 80071078 00108348 */  mtc2       $v1, $2 /* handwritten instruction */
/* 5EC9C 8007107C 00189848 */  mtc2       $t8, $3 /* handwritten instruction */
/* 5ECA0 80071080 FC03083C */  lui        $t0, (0x3FC0000 >> 16)
/* 5ECA4 80071084 21186800 */  addu       $v1, $v1, $t0
/* 5ECA8 80071088 00208348 */  mtc2       $v1, $4 /* handwritten instruction */
/* 5ECAC 8007108C 00289848 */  mtc2       $t8, $5 /* handwritten instruction */
/* 5ECB0 80071090 FC030327 */  addiu      $v1, $t8, 0x3FC
/* 5ECB4 80071094 00000000 */  nop
/* 5ECB8 80071098 3000284A */  RTPT
/* 5ECBC 8007109C 00600948 */  mfc2       $t1, $12 /* handwritten instruction */
/* 5ECC0 800710A0 00880F48 */  mfc2       $t7, $17 /* handwritten instruction */
/* 5ECC4 800710A4 036C0900 */  sra        $t5, $t1, 16
/* 5ECC8 800710A8 03740900 */  sra        $t6, $t1, 16
/* 5ECCC 800710AC 004C0900 */  sll        $t1, $t1, 16
/* 5ECD0 800710B0 035C0900 */  sra        $t3, $t1, 16
/* 5ECD4 800710B4 03640900 */  sra        $t4, $t1, 16
/* 5ECD8 800710B8 2180E001 */  addu       $s0, $t7, $zero
/* 5ECDC 800710BC 00680948 */  mfc2       $t1, $13 /* handwritten instruction */
/* 5ECE0 800710C0 00900A48 */  mfc2       $t2, $18 /* handwritten instruction */
/* 5ECE4 800710C4 49C5010C */  jal        func_80071524
/* 5ECE8 800710C8 00000000 */   nop
/* 5ECEC 800710CC 00700948 */  mfc2       $t1, $14 /* handwritten instruction */
/* 5ECF0 800710D0 00980A48 */  mfc2       $t2, $19 /* handwritten instruction */
/* 5ECF4 800710D4 49C5010C */  jal        func_80071524
/* 5ECF8 800710D8 00000000 */   nop
/* 5ECFC 800710DC 00088348 */  mtc2       $v1, $1 /* handwritten instruction */
/* 5ED00 800710E0 00188348 */  mtc2       $v1, $3 /* handwritten instruction */
/* 5ED04 800710E4 00288348 */  mtc2       $v1, $5 /* handwritten instruction */
/* 5ED08 800710E8 FC03033C */  lui        $v1, (0x3FC0000 >> 16)
/* 5ED0C 800710EC 2118E302 */  addu       $v1, $s7, $v1
/* 5ED10 800710F0 3000284A */  RTPT
/* 5ED14 800710F4 00600948 */  mfc2       $t1, $12 /* handwritten instruction */
/* 5ED18 800710F8 00880A48 */  mfc2       $t2, $17 /* handwritten instruction */
/* 5ED1C 800710FC 49C5010C */  jal        func_80071524
/* 5ED20 80071100 00000000 */   nop
/* 5ED24 80071104 00680948 */  mfc2       $t1, $13 /* handwritten instruction */
/* 5ED28 80071108 00900A48 */  mfc2       $t2, $18 /* handwritten instruction */
/* 5ED2C 8007110C 49C5010C */  jal        func_80071524
/* 5ED30 80071110 00000000 */   nop
/* 5ED34 80071114 00700948 */  mfc2       $t1, $14 /* handwritten instruction */
/* 5ED38 80071118 00980A48 */  mfc2       $t2, $19 /* handwritten instruction */
/* 5ED3C 8007111C 49C5010C */  jal        func_80071524
/* 5ED40 80071120 00000000 */   nop
/* 5ED44 80071124 00008348 */  mtc2       $v1, $0 /* handwritten instruction */
/* 5ED48 80071128 00089848 */  mtc2       $t8, $1 /* handwritten instruction */
/* 5ED4C 8007112C 00108348 */  mtc2       $v1, $2 /* handwritten instruction */
/* 5ED50 80071130 00208048 */  mtc2       $zero, $4 /* handwritten instruction */
/* 5ED54 80071134 00288048 */  mtc2       $zero, $5 /* handwritten instruction */
/* 5ED58 80071138 00000000 */  nop
/* 5ED5C 8007113C 00000000 */  nop
/* 5ED60 80071140 3000284A */  RTPT
/* 5ED64 80071144 00600948 */  mfc2       $t1, $12 /* handwritten instruction */
/* 5ED68 80071148 00880A48 */  mfc2       $t2, $17 /* handwritten instruction */
/* 5ED6C 8007114C 49C5010C */  jal        func_80071524
/* 5ED70 80071150 00D04348 */   cfc2      $v1, $26 /* handwritten instruction */
/* 5ED74 80071154 00680948 */  mfc2       $t1, $13 /* handwritten instruction */
/* 5ED78 80071158 00900A48 */  mfc2       $t2, $18 /* handwritten instruction */
/* 5ED7C 8007115C 49C5010C */  jal        func_80071524
/* 5ED80 80071160 43180300 */   sra       $v1, $v1, 1
/* 5ED84 80071164 00018A33 */  andi       $t2, $gp, 0x100
/* 5ED88 80071168 18004011 */  beqz       $t2, .L800711CC
/* 5ED8C 8007116C 004C0D00 */   sll       $t1, $t5, 16
/* 5ED90 80071170 FFFF6A31 */  andi       $t2, $t3, 0xFFFF
/* 5ED94 80071174 25482A01 */  or         $t1, $t1, $t2
/* 5ED98 80071178 0001E9AC */  sw         $t1, 0x100($a3)
/* 5ED9C 8007117C 2348CD01 */  subu       $t1, $t6, $t5
/* 5EDA0 80071180 00440900 */  sll        $t0, $t1, 16
/* 5EDA4 80071184 23508B01 */  subu       $t2, $t4, $t3
/* 5EDA8 80071188 FFFF4A31 */  andi       $t2, $t2, 0xFFFF
/* 5EDAC 8007118C 25400A01 */  or         $t0, $t0, $t2
/* 5EDB0 80071190 0C006005 */  bltz       $t3, .L800711C4
/* 5EDB4 80071194 0401E8AC */   sw        $t0, 0x104($a3)
/* 5EDB8 80071198 0A00A005 */  bltz       $t5, .L800711C4
/* 5EDBC 8007119C C0FF2825 */   addiu     $t0, $t1, -0x40
/* 5EDC0 800711A0 0800001D */  bgtz       $t0, .L800711C4
/* 5EDC4 800711A4 A0FF4825 */   addiu     $t0, $t2, -0x60
/* 5EDC8 800711A8 0600001D */  bgtz       $t0, .L800711C4
/* 5EDCC 800711AC 3C002884 */   lh        $t0, 0x3C($at)
/* 5EDD0 800711B0 3E002984 */  lh         $t1, 0x3E($at)
/* 5EDD4 800711B4 23408801 */  subu       $t0, $t4, $t0
/* 5EDD8 800711B8 02000105 */  bgez       $t0, .L800711C4
/* 5EDDC 800711BC 2348C901 */   subu      $t1, $t6, $t1
/* 5EDE0 800711C0 02002005 */  bltz       $t1, .L800711CC
.L800711C4:
/* 5EDE4 800711C4 FFFE0824 */   addiu     $t0, $zero, -0x101
/* 5EDE8 800711C8 24E08803 */  and        $gp, $gp, $t0
.L800711CC:
/* 5EDEC 800711CC D1008005 */  bltz       $t4, .L80071514
/* 5EDF0 800711D0 3C002894 */   lhu       $t0, 0x3C($at)
/* 5EDF4 800711D4 CF00C005 */  bltz       $t6, .L80071514
/* 5EDF8 800711D8 23180302 */   subu      $v1, $s0, $v1
/* 5EDFC 800711DC CD006004 */  bltz       $v1, .L80071514
/* 5EE00 800711E0 3E002994 */   lhu       $t1, 0x3E($at)
/* 5EE04 800711E4 23186801 */  subu       $v1, $t3, $t0
/* 5EE08 800711E8 CA00601C */  bgtz       $v1, .L80071514
/* 5EE0C 800711EC 2318A901 */   subu      $v1, $t5, $t1
/* 5EE10 800711F0 C800601C */  bgtz       $v1, .L80071514
/* 5EE14 800711F4 0002033C */   lui       $v1, (0x2000000 >> 16)
/* 5EE18 800711F8 24187C00 */  and        $v1, $v1, $gp
/* 5EE1C 800711FC 6E006014 */  bnez       $v1, .L800713B8
/* 5EE20 80071200 43790F00 */   sra       $t7, $t7, 5
/* 5EE24 80071204 43811000 */  sra        $s0, $s0, 5
/* 5EE28 80071208 FEFFEF25 */  addiu      $t7, $t7, -0x2
/* 5EE2C 8007120C 01001026 */  addiu      $s0, $s0, 0x1
/* 5EE30 80071210 DC00CFA7 */  sh         $t7, 0xDC($fp)
/* 5EE34 80071214 DE00D0A7 */  sh         $s0, 0xDE($fp)
/* 5EE38 80071218 3400238C */  lw         $v1, 0x34($at)
/* 5EE3C 8007121C 38002A8C */  lw         $t2, 0x38($at)
/* 5EE40 80071220 23400F02 */  subu       $t0, $s0, $t7
/* 5EE44 80071224 80400800 */  sll        $t0, $t0, 2
/* 5EE48 80071228 21400301 */  addu       $t0, $t0, $v1
/* 5EE4C 8007122C 04000925 */  addiu      $t1, $t0, 0x4
/* 5EE50 80071230 23504901 */  subu       $t2, $t2, $t1
/* 5EE54 80071234 B7004019 */  blez       $t2, .L80071514
/* 5EE58 80071238 00000000 */   nop
/* 5EE5C 8007123C 340029AC */  sw         $t1, 0x34($at)
/* 5EE60 80071240 8C00318C */  lw         $s1, 0x8C($at)
/* 5EE64 80071244 BC00298C */  lw         $t1, 0xBC($at)
/* 5EE68 80071248 00018A33 */  andi       $t2, $gp, 0x100
/* 5EE6C 8007124C 12004015 */  bnez       $t2, .L80071298
/* 5EE70 80071250 83891100 */   sra       $s1, $s1, 6
/* 5EE74 80071254 30002A8C */  lw         $t2, 0x30($at)
/* 5EE78 80071258 21483101 */  addu       $t1, $t1, $s1
/* 5EE7C 8007125C 03002105 */  bgez       $t1, .L8007126C
/* 5EE80 80071260 80480900 */   sll       $t1, $t1, 2
/* 5EE84 80071264 05000104 */  bgez       $zero, .L8007127C
/* 5EE88 80071268 00000924 */   addiu     $t1, $zero, 0x0
.L8007126C:
/* 5EE8C 8007126C 04F03125 */  addiu      $s1, $t1, -0xFFC
/* 5EE90 80071270 0200201A */  blez       $s1, .L8007127C
/* 5EE94 80071274 00000000 */   nop
/* 5EE98 80071278 FC0F0924 */  addiu      $t1, $zero, 0xFFC
.L8007127C:
/* 5EE9C 8007127C 21504901 */  addu       $t2, $t2, $t1
/* 5EEA0 80071280 0000498D */  lw         $t1, 0x0($t2)
/* 5EEA4 80071284 008A0800 */  sll        $s1, $t0, 8
/* 5EEA8 80071288 028A1100 */  srl        $s1, $s1, 8
/* 5EEAC 8007128C 000051AD */  sw         $s1, 0x0($t2)
/* 5EEB0 80071290 0E000104 */  bgez       $zero, .L800712CC
/* 5EEB4 80071294 000069AC */   sw        $t1, 0x0($v1)
.L80071298:
/* 5EEB8 80071298 21483101 */  addu       $t1, $t1, $s1
/* 5EEBC 8007129C 03002105 */  bgez       $t1, .L800712AC
/* 5EEC0 800712A0 80480900 */   sll       $t1, $t1, 2
/* 5EEC4 800712A4 05000104 */  bgez       $zero, .L800712BC
/* 5EEC8 800712A8 00000924 */   addiu     $t1, $zero, 0x0
.L800712AC:
/* 5EECC 800712AC 04F03125 */  addiu      $s1, $t1, -0xFFC
/* 5EED0 800712B0 0200201A */  blez       $s1, .L800712BC
/* 5EED4 800712B4 00000000 */   nop
/* 5EED8 800712B8 FC0F0924 */  addiu      $t1, $zero, 0xFFC
.L800712BC:
/* 5EEDC 800712BC F400E3AC */  sw         $v1, 0xF4($a3)
/* 5EEE0 800712C0 F800E8AC */  sw         $t0, 0xF8($a3)
/* 5EEE4 800712C4 FC00E9AC */  sw         $t1, 0xFC($a3)
/* 5EEE8 800712C8 000060AC */  sw         $zero, 0x0($v1)
.L800712CC:
/* 5EEEC 800712CC 21486000 */  addu       $t1, $v1, $zero
.L800712D0:
/* 5EEF0 800712D0 05002811 */  beq        $t1, $t0, .L800712E8
/* 5EEF4 800712D4 008A0900 */   sll       $s1, $t1, 8
/* 5EEF8 800712D8 028A1100 */  srl        $s1, $s1, 8
/* 5EEFC 800712DC 040031AD */  sw         $s1, 0x4($t1)
/* 5EF00 800712E0 FBFF0104 */  bgez       $zero, .L800712D0
/* 5EF04 800712E4 04002925 */   addiu     $t1, $t1, 0x4
.L800712E8:
/* 5EF08 800712E8 80400F00 */  sll        $t0, $t7, 2
/* 5EF0C 800712EC 23186800 */  subu       $v1, $v1, $t0
/* 5EF10 800712F0 E400C3AF */  sw         $v1, 0xE4($fp)
/* 5EF14 800712F4 E800C3AF */  sw         $v1, 0xE8($fp)
/* 5EF18 800712F8 6800288C */  lw         $t0, 0x68($at)
/* 5EF1C 800712FC 6C00298C */  lw         $t1, 0x6C($at)
/* 5EF20 80071300 00018A33 */  andi       $t2, $gp, 0x100
/* 5EF24 80071304 54004015 */  bnez       $t2, .L80071458
/* 5EF28 80071308 00608333 */   andi      $v1, $gp, 0x6000
/* 5EF2C 8007130C 52006010 */  beqz       $v1, .L80071458
/* 5EF30 80071310 00408333 */   andi      $v1, $gp, 0x4000
/* 5EF34 80071314 02006014 */  bnez       $v1, .L80071320
/* 5EF38 80071318 25400901 */   or        $t0, $t0, $t1
/* 5EF3C 8007131C 4E000011 */  beqz       $t0, .L80071458
.L80071320:
/* 5EF40 80071320 3400238C */   lw        $v1, 0x34($at)
/* 5EF44 80071324 38002A8C */  lw         $t2, 0x38($at)
/* 5EF48 80071328 23400F02 */  subu       $t0, $s0, $t7
/* 5EF4C 8007132C 80400800 */  sll        $t0, $t0, 2
/* 5EF50 80071330 21400301 */  addu       $t0, $t0, $v1
/* 5EF54 80071334 04000925 */  addiu      $t1, $t0, 0x4
/* 5EF58 80071338 23504901 */  subu       $t2, $t2, $t1
/* 5EF5C 8007133C 75004019 */  blez       $t2, .L80071514
/* 5EF60 80071340 00000000 */   nop
/* 5EF64 80071344 340029AC */  sw         $t1, 0x34($at)
/* 5EF68 80071348 8C00318C */  lw         $s1, 0x8C($at)
/* 5EF6C 8007134C C000298C */  lw         $t1, 0xC0($at)
/* 5EF70 80071350 83891100 */  sra        $s1, $s1, 6
/* 5EF74 80071354 30002A8C */  lw         $t2, 0x30($at)
/* 5EF78 80071358 21483101 */  addu       $t1, $t1, $s1
/* 5EF7C 8007135C 03002105 */  bgez       $t1, .L8007136C
/* 5EF80 80071360 80480900 */   sll       $t1, $t1, 2
/* 5EF84 80071364 05000104 */  bgez       $zero, .L8007137C
/* 5EF88 80071368 00000924 */   addiu     $t1, $zero, 0x0
.L8007136C:
/* 5EF8C 8007136C 04F03125 */  addiu      $s1, $t1, -0xFFC
/* 5EF90 80071370 0200201A */  blez       $s1, .L8007137C
/* 5EF94 80071374 00000000 */   nop
/* 5EF98 80071378 FC0F0924 */  addiu      $t1, $zero, 0xFFC
.L8007137C:
/* 5EF9C 8007137C 21504901 */  addu       $t2, $t2, $t1
/* 5EFA0 80071380 0000498D */  lw         $t1, 0x0($t2)
/* 5EFA4 80071384 008A0800 */  sll        $s1, $t0, 8
/* 5EFA8 80071388 028A1100 */  srl        $s1, $s1, 8
/* 5EFAC 8007138C 000051AD */  sw         $s1, 0x0($t2)
/* 5EFB0 80071390 000069AC */  sw         $t1, 0x0($v1)
/* 5EFB4 80071394 21486000 */  addu       $t1, $v1, $zero
.L80071398:
/* 5EFB8 80071398 05002811 */  beq        $t1, $t0, .L800713B0
/* 5EFBC 8007139C 008A0900 */   sll       $s1, $t1, 8
/* 5EFC0 800713A0 028A1100 */  srl        $s1, $s1, 8
/* 5EFC4 800713A4 040031AD */  sw         $s1, 0x4($t1)
/* 5EFC8 800713A8 FBFF0104 */  bgez       $zero, .L80071398
/* 5EFCC 800713AC 04002925 */   addiu     $t1, $t1, 0x4
.L800713B0:
/* 5EFD0 800713B0 80400F00 */  sll        $t0, $t7, 2
/* 5EFD4 800713B4 23486800 */  subu       $t1, $v1, $t0
.L800713B8:
/* 5EFD8 800713B8 00608333 */  andi       $v1, $gp, 0x6000
/* 5EFDC 800713BC 26006010 */  beqz       $v1, .L80071458
/* 5EFE0 800713C0 6800238C */   lw        $v1, 0x68($at)
/* 5EFE4 800713C4 6C00288C */  lw         $t0, 0x6C($at)
/* 5EFE8 800713C8 E800C9AF */  sw         $t1, 0xE8($fp)
/* 5EFEC 800713CC 25486800 */  or         $t1, $v1, $t0
/* 5EFF0 800713D0 1E002011 */  beqz       $t1, .L8007144C
/* 5EFF4 800713D4 00000000 */   nop
/* 5EFF8 800713D8 10000011 */  beqz       $t0, .L8007141C
/* 5EFFC 800713DC 00408933 */   andi      $t1, $gp, 0x4000
/* 5F000 800713E0 03002015 */  bnez       $t1, .L800713F0
/* 5F004 800713E4 0680033C */   lui       $v1, (0x8006B030 >> 16)
/* 5F008 800713E8 05000104 */  bgez       $zero, .L80071400
/* 5F00C 800713EC 30B06334 */   ori       $v1, $v1, (0x8006B030 & 0xFFFF)
.L800713F0:
/* 5F010 800713F0 0780033C */  lui        $v1, %hi(Draw_KartBodyReflection)
/* 5F014 800713F4 C4C96324 */  addiu      $v1, $v1, %lo(Draw_KartBodyReflection)
/* 5F018 800713F8 1000083C */  lui        $t0, (0x100040 >> 16)
/* 5F01C 800713FC 25E08803 */  or         $gp, $gp, $t0
.L80071400:
/* 5F020 80071400 6400318C */  lw         $s1, 0x64($at)
/* 5F024 80071404 0680083C */  lui        $t0, (0x8006BF30 >> 16)
/* 5F028 80071408 23002012 */  beqz       $s1, .L80071498
/* 5F02C 8007140C 30BF0835 */   ori       $t0, $t0, (0x8006BF30 & 0xFFFF)
/* 5F030 80071410 0680083C */  lui        $t0, (0x8006CDEC >> 16)
/* 5F034 80071414 20000104 */  bgez       $zero, .L80071498
/* 5F038 80071418 ECCD0835 */   ori       $t0, $t0, (0x8006CDEC & 0xFFFF)
.L8007141C:
/* 5F03C 8007141C 0A006004 */  bltz       $v1, .L80071448
/* 5F040 80071420 00408333 */   andi      $v1, $gp, 0x4000
/* 5F044 80071424 03006014 */  bnez       $v1, .L80071434
/* 5F048 80071428 0680033C */   lui       $v1, (0x8006B030 >> 16)
/* 5F04C 8007142C 14000104 */  bgez       $zero, .L80071480
/* 5F050 80071430 30B06334 */   ori       $v1, $v1, (0x8006B030 & 0xFFFF)
.L80071434:
/* 5F054 80071434 0780033C */  lui        $v1, %hi(Draw_KartBodyReflection)
/* 5F058 80071438 C4C96324 */  addiu      $v1, $v1, %lo(Draw_KartBodyReflection)
/* 5F05C 8007143C 1000083C */  lui        $t0, (0x100040 >> 16)
/* 5F060 80071440 0F000104 */  bgez       $zero, .L80071480
/* 5F064 80071444 25E08803 */   or        $gp, $gp, $t0
.L80071448:
/* 5F068 80071448 03006010 */  beqz       $v1, .L80071458
.L8007144C:
/* 5F06C 8007144C 0680033C */   lui       $v1, (0x8006BBC0 >> 16)
/* 5F070 80071450 0B000104 */  bgez       $zero, .L80071480
/* 5F074 80071454 C0BB6334 */   ori       $v1, $v1, (0x8006BBC0 & 0xFFFF)
.L80071458:
/* 5F078 80071458 7000288C */  lw         $t0, 0x70($at)
/* 5F07C 8007145C 00108333 */  andi       $v1, $gp, 0x1000
/* 5F080 80071460 05006010 */  beqz       $v1, .L80071478
/* 5F084 80071464 00000000 */   nop
/* 5F088 80071468 03000011 */  beqz       $t0, .L80071478
/* 5F08C 8007146C 0680033C */   lui       $v1, (0x8006A6B8 >> 16)
/* 5F090 80071470 E3FF0104 */  bgez       $zero, .L80071400
/* 5F094 80071474 B8A66334 */   ori       $v1, $v1, (0x8006A6B8 & 0xFFFF)
.L80071478:
/* 5F098 80071478 0780033C */  lui        $v1, %hi(RenderBucket_DrawFunc_Normal)
/* 5F09C 8007147C 2CA56324 */  addiu      $v1, $v1, %lo(RenderBucket_DrawFunc_Normal)
.L80071480:
/* 5F0A0 80071480 6400318C */  lw         $s1, 0x64($at)
/* 5F0A4 80071484 0680083C */  lui        $t0, (0x8006A8E0 >> 16)
/* 5F0A8 80071488 03002012 */  beqz       $s1, .L80071498
/* 5F0AC 8007148C E0A80835 */   ori       $t0, $t0, (0x8006A8E0 & 0xFFFF)
/* 5F0B0 80071490 0780083C */  lui        $t0, %hi(Draw_Uncompress2)
/* 5F0B4 80071494 4CB20825 */  addiu      $t0, $t0, %lo(Draw_Uncompress2)
.L80071498:
/* 5F0B8 80071498 0000DDAC */  sw         $sp, 0x0($a2)
/* 5F0BC 8007149C 0400DEAC */  sw         $fp, 0x4($a2)
/* 5F0C0 800714A0 0800C624 */  addiu      $a2, $a2, 0x8
/* 5F0C4 800714A4 40009C37 */  ori        $gp, $gp, (0x100040 & 0xFFFF)
/* 5F0C8 800714A8 EC00C3AF */  sw         $v1, 0xEC($fp)
/* 5F0CC 800714AC F000C8AF */  sw         $t0, 0xF0($fp)
/* 5F0D0 800714B0 0980033C */  lui        $v1, %hi(D_8008A460)
/* 5F0D4 800714B4 60A46324 */  addiu      $v1, $v1, %lo(D_8008A460)
/* 5F0D8 800714B8 0980083C */  lui        $t0, %hi(D_8008A470)
/* 5F0DC 800714BC 70A40825 */  addiu      $t0, $t0, %lo(D_8008A470)
/* 5F0E0 800714C0 824C1C00 */  srl        $t1, $gp, 18
/* 5F0E4 800714C4 0C002931 */  andi       $t1, $t1, 0xC
/* 5F0E8 800714C8 21186900 */  addu       $v1, $v1, $t1
/* 5F0EC 800714CC 21400901 */  addu       $t0, $t0, $t1
/* 5F0F0 800714D0 0000638C */  lw         $v1, 0x0($v1)
/* 5F0F4 800714D4 0000088D */  lw         $t0, 0x0($t0)
/* 5F0F8 800714D8 6400A3AF */  sw         $v1, 0x64($sp)
/* 5F0FC 800714DC 6800A8AF */  sw         $t0, 0x68($sp)
/* 5F100 800714E0 824B1C00 */  srl        $t1, $gp, 14
/* 5F104 800714E4 1C002931 */  andi       $t1, $t1, 0x1C
/* 5F108 800714E8 21402900 */  addu       $t0, $at, $t1
/* 5F10C 800714EC 9400038D */  lw         $v1, 0x94($t0)
/* 5F110 800714F0 C400088D */  lw         $t0, 0xC4($t0)
/* 5F114 800714F4 5C00A3AF */  sw         $v1, 0x5C($sp)
/* 5F118 800714F8 6000A8AF */  sw         $t0, 0x60($sp)
/* 5F11C 800714FC 2000838E */  lw         $v1, 0x20($s4)
/* 5F120 80071500 2800888E */  lw         $t0, 0x28($s4)
/* 5F124 80071504 2C00898E */  lw         $t1, 0x2C($s4)
/* 5F128 80071508 C800C3AF */  sw         $v1, 0xC8($fp)
/* 5F12C 8007150C CC00C8AF */  sw         $t0, 0xCC($fp)
/* 5F130 80071510 D000C9AF */  sw         $t1, 0xD0($fp)
.L80071514:
/* 5F134 80071514 40003F8C */  lw         $ra, 0x40($at)
/* 5F138 80071518 B800DCAF */  sw         $gp, 0xB8($fp)
/* 5F13C 8007151C 0800E003 */  jr         $ra
/* 5F140 80071520 00000000 */   nop
.size RenderBucket_QueueDraw, . - RenderBucket_QueueDraw
