.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel Draw_KartBodyReflection
/* 5A5E4 8006C9C4 D6F80011 */  beqz       $t0, .L8006AD20
/* 5A5E8 8006C9C8 04003927 */   addiu     $t9, $t9, 0x4
/* 5A5EC 8006C9CC 09F8C002 */  jalr       $s6
/* 5A5F0 8006C9D0 0C012BAC */   sw        $t3, 0x10C($at)
/* 5A5F4 8006C9D4 FCFF2B8F */  lw         $t3, -0x4($t9)
/* 5A5F8 8006C9D8 900028AC */  sw         $t0, 0x90($at)
/* 5A5FC 8006C9DC 940023AC */  sw         $v1, 0x94($at)
/* 5A600 8006C9E0 44002384 */  lh         $v1, 0x44($at)
/* 5A604 8006C9E4 03440800 */  sra        $t0, $t0, 16
/* 5A608 8006C9E8 23406800 */  subu       $t0, $v1, $t0
/* 5A60C 8006C9EC 9E0028A4 */  sh         $t0, 0x9E($at)
/* 5A610 8006C9F0 09F8C002 */  jalr       $s6
/* 5A614 8006C9F4 21702001 */   addu      $t6, $t1, $zero
/* 5A618 8006C9F8 00002B8F */  lw         $t3, 0x0($t9)
/* 5A61C 8006C9FC A80028AC */  sw         $t0, 0xA8($at)
/* 5A620 8006CA00 AC0023AC */  sw         $v1, 0xAC($at)
/* 5A624 8006CA04 44002384 */  lh         $v1, 0x44($at)
/* 5A628 8006CA08 03440800 */  sra        $t0, $t0, 16
/* 5A62C 8006CA0C 23406800 */  subu       $t0, $v1, $t0
/* 5A630 8006CA10 B60028A4 */  sh         $t0, 0xB6($at)
/* 5A634 8006CA14 09F8C002 */  jalr       $s6
/* 5A638 8006CA18 21782001 */   addu      $t7, $t1, $zero
/* 5A63C 8006CA1C 900020C8 */  lwc2       $0, 0x90($at)
/* 5A640 8006CA20 940021C8 */  lwc2       $1, 0x94($at)
/* 5A644 8006CA24 A80022C8 */  lwc2       $2, 0xA8($at)
/* 5A648 8006CA28 AC0023C8 */  lwc2       $3, 0xAC($at)
/* 5A64C 8006CA2C 00208848 */  mtc2       $t0, $4 /* handwritten instruction */
/* 5A650 8006CA30 00288348 */  mtc2       $v1, $5 /* handwritten instruction */
/* 5A654 8006CA34 21802001 */  addu       $s0, $t1, $zero
/* 5A658 8006CA38 0C012B8C */  lw         $t3, 0x10C($at)
/* 5A65C 8006CA3C 3000284A */  RTPT
/* 5A660 8006CA40 C00028AC */  sw         $t0, 0xC0($at)
/* 5A664 8006CA44 C40023AC */  sw         $v1, 0xC4($at)
/* 5A668 8006CA48 44002384 */  lh         $v1, 0x44($at)
/* 5A66C 8006CA4C 03440800 */  sra        $t0, $t0, 16
/* 5A670 8006CA50 23406800 */  subu       $t0, $v1, $t0
/* 5A674 8006CA54 CE0028A4 */  sh         $t0, 0xCE($at)
/* 5A678 8006CA58 04003927 */  addiu      $t9, $t9, 0x4
/* 5A67C 8006CA5C 6C002CE8 */  swc2       $12, 0x6C($at)
/* 5A680 8006CA60 700031E8 */  swc2       $17, 0x70($at)
/* 5A684 8006CA64 74002DE8 */  swc2       $13, 0x74($at)
/* 5A688 8006CA68 780032E8 */  swc2       $18, 0x78($at)
/* 5A68C 8006CA6C 7C002EE8 */  swc2       $14, 0x7C($at)
/* 5A690 8006CA70 800033E8 */  swc2       $19, 0x80($at)
/* 5A694 8006CA74 1C01238C */  lw         $v1, 0x11C($at)
/* 5A698 8006CA78 00000848 */  mfc2       $t0, $0 /* handwritten instruction */
/* 5A69C 8006CA7C 00100948 */  mfc2       $t1, $2 /* handwritten instruction */
/* 5A6A0 8006CA80 00200A48 */  mfc2       $t2, $4 /* handwritten instruction */
/* 5A6A4 8006CA84 FFFF053C */  lui        $a1, (0xFFFF0000 >> 16)
/* 5A6A8 8006CA88 FFFF0631 */  andi       $a2, $t0, 0xFFFF
/* 5A6AC 8006CA8C 24400501 */  and        $t0, $t0, $a1
/* 5A6B0 8006CA90 23406800 */  subu       $t0, $v1, $t0
/* 5A6B4 8006CA94 25400601 */  or         $t0, $t0, $a2
/* 5A6B8 8006CA98 FFFF2631 */  andi       $a2, $t1, 0xFFFF
/* 5A6BC 8006CA9C 24482501 */  and        $t1, $t1, $a1
/* 5A6C0 8006CAA0 23486900 */  subu       $t1, $v1, $t1
/* 5A6C4 8006CAA4 25482601 */  or         $t1, $t1, $a2
/* 5A6C8 8006CAA8 FFFF4631 */  andi       $a2, $t2, 0xFFFF
/* 5A6CC 8006CAAC 24504501 */  and        $t2, $t2, $a1
/* 5A6D0 8006CAB0 23506A00 */  subu       $t2, $v1, $t2
/* 5A6D4 8006CAB4 25504601 */  or         $t2, $t2, $a2
/* 5A6D8 8006CAB8 00008848 */  mtc2       $t0, $0 /* handwritten instruction */
/* 5A6DC 8006CABC 00108948 */  mtc2       $t1, $2 /* handwritten instruction */
/* 5A6E0 8006CAC0 00208A48 */  mtc2       $t2, $4 /* handwritten instruction */
/* 5A6E4 8006CAC4 00000000 */  nop
/* 5A6E8 8006CAC8 00000000 */  nop
/* 5A6EC 8006CACC 3000284A */  RTPT
.L8006CAD0:
/* 5A6F0 8006CAD0 24002884 */  lh         $t0, 0x24($at)
/* 5A6F4 8006CAD4 FF016631 */  andi       $a2, $t3, 0x1FF
/* 5A6F8 8006CAD8 0300C010 */  beqz       $a2, .L8006CAE8
/* 5A6FC 8006CADC 80300600 */   sll       $a2, $a2, 2
/* 5A700 8006CAE0 2130DD00 */  addu       $a2, $a2, $sp
/* 5A704 8006CAE4 FCFFC68C */  lw         $a2, -0x4($a2)
.L8006CAE8:
/* 5A708 8006CAE8 00800839 */  xori       $t0, $t0, 0x8000
/* 5A70C 8006CAEC 240028A4 */  sh         $t0, 0x24($at)
/* 5A710 8006CAF0 500026AC */  sw         $a2, 0x50($at)
/* 5A714 8006CAF4 4000288C */  lw         $t0, 0x40($at)
/* 5A718 8006CAF8 3C00238C */  lw         $v1, 0x3C($at)
/* 5A71C 8006CAFC 3C0028AC */  sw         $t0, 0x3C($at)
/* 5A720 8006CB00 400023AC */  sw         $v1, 0x40($at)
/* 5A724 8006CB04 080120AC */  sw         $zero, 0x108($at)
/* 5A728 8006CB08 1C00238C */  lw         $v1, 0x1C($at)
/* 5A72C 8006CB0C 00700A48 */  mfc2       $t2, $14 /* handwritten instruction */
/* 5A730 8006CB10 00F84548 */  cfc2       $a1, $31 /* handwritten instruction */
/* 5A734 8006CB14 C0400B00 */  sll        $t0, $t3, 3
/* 5A738 8006CB18 402B0500 */  sll        $a1, $a1, 13
/* 5A73C 8006CB1C 1A00A004 */  bltz       $a1, .L8006CB88
/* 5A740 8006CB20 80480B00 */   sll       $t1, $t3, 2
/* 5A744 8006CB24 07000105 */  bgez       $t0, .L8006CB44
/* 5A748 8006CB28 24002584 */   lh        $a1, 0x24($at)
/* 5A74C 8006CB2C 0600404B */  NCLIP
/* 5A750 8006CB30 00C00848 */  mfc2       $t0, $24 /* handwritten instruction */
/* 5A754 8006CB34 2648A900 */  xor        $t1, $a1, $t1
/* 5A758 8006CB38 13000011 */  beqz       $t0, .L8006CB88
/* 5A75C 8006CB3C 26400901 */   xor       $t0, $t0, $t1
/* 5A760 8006CB40 11000019 */  blez       $t0, .L8006CB88
.L8006CB44:
/* 5A764 8006CB44 00600848 */   mfc2      $t0, $12 /* handwritten instruction */
/* 5A768 8006CB48 00680948 */  mfc2       $t1, $13 /* handwritten instruction */
/* 5A76C 8006CB4C 24280A01 */  and        $a1, $t0, $t2
/* 5A770 8006CB50 2428A900 */  and        $a1, $a1, $t1
/* 5A774 8006CB54 2D00584B */  AVSZ3
/* 5A778 8006CB58 23400301 */  subu       $t0, $t0, $v1
/* 5A77C 8006CB5C 23482301 */  subu       $t1, $t1, $v1
/* 5A780 8006CB60 23504301 */  subu       $t2, $t2, $v1
/* 5A784 8006CB64 25180901 */  or         $v1, $t0, $t1
/* 5A788 8006CB68 27186A00 */  nor        $v1, $v1, $t2
/* 5A78C 8006CB6C 25186500 */  or         $v1, $v1, $a1
/* 5A790 8006CB70 05006004 */  bltz       $v1, .L8006CB88
/* 5A794 8006CB74 001C0300 */   sll       $v1, $v1, 16
/* 5A798 8006CB78 03006004 */  bltz       $v1, .L8006CB88
/* 5A79C 8006CB7C 2C0038E8 */   swc2      $24, 0x2C($at)
/* 5A7A0 8006CB80 25B4010C */  jal        func_8006D094
/* 5A7A4 8006CB84 00000000 */   nop
.L8006CB88:
/* 5A7A8 8006CB88 00600348 */  mfc2       $v1, $12 /* handwritten instruction */
/* 5A7AC 8006CB8C 00880848 */  mfc2       $t0, $17 /* handwritten instruction */
/* 5A7B0 8006CB90 00680948 */  mfc2       $t1, $13 /* handwritten instruction */
/* 5A7B4 8006CB94 00900A48 */  mfc2       $t2, $18 /* handwritten instruction */
/* 5A7B8 8006CB98 6C002CC8 */  lwc2       $12, 0x6C($at)
/* 5A7BC 8006CB9C 700031C8 */  lwc2       $17, 0x70($at)
/* 5A7C0 8006CBA0 74002DC8 */  lwc2       $13, 0x74($at)
/* 5A7C4 8006CBA4 780032C8 */  lwc2       $18, 0x78($at)
/* 5A7C8 8006CBA8 6C0023AC */  sw         $v1, 0x6C($at)
/* 5A7CC 8006CBAC 700028AC */  sw         $t0, 0x70($at)
/* 5A7D0 8006CBB0 740029AC */  sw         $t1, 0x74($at)
/* 5A7D4 8006CBB4 78002AAC */  sw         $t2, 0x78($at)
/* 5A7D8 8006CBB8 00700348 */  mfc2       $v1, $14 /* handwritten instruction */
/* 5A7DC 8006CBBC 00980848 */  mfc2       $t0, $19 /* handwritten instruction */
/* 5A7E0 8006CBC0 7C002EC8 */  lwc2       $14, 0x7C($at)
/* 5A7E4 8006CBC4 800033C8 */  lwc2       $19, 0x80($at)
/* 5A7E8 8006CBC8 7C0023AC */  sw         $v1, 0x7C($at)
/* 5A7EC 8006CBCC 24002384 */  lh         $v1, 0x24($at)
/* 5A7F0 8006CBD0 800028AC */  sw         $t0, 0x80($at)
/* 5A7F4 8006CBD4 00806338 */  xori       $v1, $v1, 0x8000
/* 5A7F8 8006CBD8 240023A4 */  sh         $v1, 0x24($at)
/* 5A7FC 8006CBDC 3C00238C */  lw         $v1, 0x3C($at)
/* 5A800 8006CBE0 4000288C */  lw         $t0, 0x40($at)
/* 5A804 8006CBE4 400023AC */  sw         $v1, 0x40($at)
/* 5A808 8006CBE8 3C0028AC */  sw         $t0, 0x3C($at)
/* 5A80C 8006CBEC FFFF0824 */  addiu      $t0, $zero, -0x1
/* 5A810 8006CBF0 080128AC */  sw         $t0, 0x108($at)
/* 5A814 8006CBF4 1C00238C */  lw         $v1, 0x1C($at)
/* 5A818 8006CBF8 00700A48 */  mfc2       $t2, $14 /* handwritten instruction */
/* 5A81C 8006CBFC 00F84548 */  cfc2       $a1, $31 /* handwritten instruction */
/* 5A820 8006CC00 C0400B00 */  sll        $t0, $t3, 3
/* 5A824 8006CC04 402B0500 */  sll        $a1, $a1, 13
/* 5A828 8006CC08 1A00A004 */  bltz       $a1, .L8006CC74
/* 5A82C 8006CC0C 80480B00 */   sll       $t1, $t3, 2
/* 5A830 8006CC10 07000105 */  bgez       $t0, .L8006CC30
/* 5A834 8006CC14 24002584 */   lh        $a1, 0x24($at)
/* 5A838 8006CC18 0600404B */  NCLIP
/* 5A83C 8006CC1C 00C00848 */  mfc2       $t0, $24 /* handwritten instruction */
/* 5A840 8006CC20 2648A900 */  xor        $t1, $a1, $t1
/* 5A844 8006CC24 13000011 */  beqz       $t0, .L8006CC74
/* 5A848 8006CC28 26400901 */   xor       $t0, $t0, $t1
/* 5A84C 8006CC2C 11000019 */  blez       $t0, .L8006CC74
.L8006CC30:
/* 5A850 8006CC30 00600848 */   mfc2      $t0, $12 /* handwritten instruction */
/* 5A854 8006CC34 00680948 */  mfc2       $t1, $13 /* handwritten instruction */
/* 5A858 8006CC38 24280A01 */  and        $a1, $t0, $t2
/* 5A85C 8006CC3C 2428A900 */  and        $a1, $a1, $t1
/* 5A860 8006CC40 2D00584B */  AVSZ3
/* 5A864 8006CC44 23400301 */  subu       $t0, $t0, $v1
/* 5A868 8006CC48 23482301 */  subu       $t1, $t1, $v1
/* 5A86C 8006CC4C 23504301 */  subu       $t2, $t2, $v1
/* 5A870 8006CC50 25180901 */  or         $v1, $t0, $t1
/* 5A874 8006CC54 27186A00 */  nor        $v1, $v1, $t2
/* 5A878 8006CC58 25186500 */  or         $v1, $v1, $a1
/* 5A87C 8006CC5C 05006004 */  bltz       $v1, .L8006CC74
/* 5A880 8006CC60 001C0300 */   sll       $v1, $v1, 16
/* 5A884 8006CC64 03006004 */  bltz       $v1, .L8006CC74
/* 5A888 8006CC68 2C0038E8 */   swc2      $24, 0x2C($at)
/* 5A88C 8006CC6C 25B4010C */  jal        func_8006D094
/* 5A890 8006CC70 00000000 */   nop
.L8006CC74:
/* 5A894 8006CC74 00002B8F */  lw         $t3, 0x0($t9)
/* 5A898 8006CC78 04003927 */  addiu      $t9, $t9, 0x4
/* 5A89C 8006CC7C 51FF6005 */  bltz       $t3, Draw_KartBodyReflection
/* 5A8A0 8006CC80 01006825 */   addiu     $t0, $t3, 0x1
/* 5A8A4 8006CC84 02440B00 */  srl        $t0, $t3, 16
/* 5A8A8 8006CC88 14000015 */  bnez       $t0, .L8006CCDC
/* 5A8AC 8006CC8C 40480B00 */   sll       $t1, $t3, 1
/* 5A8B0 8006CC90 C0470B00 */  sll        $t0, $t3, 31
/* 5A8B4 8006CC94 C2190B00 */  srl        $v1, $t3, 7
/* 5A8B8 8006CC98 04000005 */  bltz       $t0, .L8006CCAC
/* 5A8BC 8006CC9C FC016330 */   andi      $v1, $v1, 0x1FC
/* 5A8C0 8006CCA0 21187C00 */  addu       $v1, $v1, $gp
/* 5A8C4 8006CCA4 03000104 */  bgez       $zero, .L8006CCB4
/* 5A8C8 8006CCA8 00006F8C */   lw        $t7, 0x0($v1)
.L8006CCAC:
/* 5A8CC 8006CCAC 21186100 */  addu       $v1, $v1, $at
/* 5A8D0 8006CCB0 40016F8C */  lw         $t7, 0x140($v1)
.L8006CCB4:
/* 5A8D4 8006CCB4 80470B00 */  sll        $t0, $t3, 30
/* 5A8D8 8006CCB8 04000005 */  bltz       $t0, .L8006CCCC
/* 5A8DC 8006CCBC FC016331 */   andi      $v1, $t3, 0x1FC
/* 5A8E0 8006CCC0 21187C00 */  addu       $v1, $v1, $gp
/* 5A8E4 8006CCC4 03000104 */  bgez       $zero, .L8006CCD4
/* 5A8E8 8006CCC8 0000708C */   lw        $s0, 0x0($v1)
.L8006CCCC:
/* 5A8EC 8006CCCC 21186100 */  addu       $v1, $v1, $at
/* 5A8F0 8006CCD0 4001708C */  lw         $s0, 0x140($v1)
.L8006CCD4:
/* 5A8F4 8006CCD4 E7FF0104 */  bgez       $zero, .L8006CC74
/* 5A8F8 8006CCD8 2170E001 */   addu      $t6, $t7, $zero
.L8006CCDC:
/* 5A8FC 8006CCDC 0B002105 */  bgez       $t1, .L8006CD0C
/* 5A900 8006CCE0 00000000 */   nop
/* 5A904 8006CCE4 00600948 */  mfc2       $t1, $12 /* handwritten instruction */
/* 5A908 8006CCE8 00880A48 */  mfc2       $t2, $17 /* handwritten instruction */
/* 5A90C 8006CCEC 00688948 */  mtc2       $t1, $13 /* handwritten instruction */
/* 5A910 8006CCF0 00908A48 */  mtc2       $t2, $18 /* handwritten instruction */
/* 5A914 8006CCF4 6C00298C */  lw         $t1, 0x6C($at)
/* 5A918 8006CCF8 70002A8C */  lw         $t2, 0x70($at)
/* 5A91C 8006CCFC 740029AC */  sw         $t1, 0x74($at)
/* 5A920 8006CD00 78002AAC */  sw         $t2, 0x78($at)
/* 5A924 8006CD04 07000104 */  bgez       $zero, .L8006CD24
/* 5A928 8006CD08 2178C001 */   addu      $t7, $t6, $zero
.L8006CD0C:
/* 5A92C 8006CD0C A800298C */  lw         $t1, 0xA8($at)
/* 5A930 8006CD10 AC002A8C */  lw         $t2, 0xAC($at)
/* 5A934 8006CD14 900029AC */  sw         $t1, 0x90($at)
/* 5A938 8006CD18 B6002984 */  lh         $t1, 0xB6($at)
/* 5A93C 8006CD1C 94002AAC */  sw         $t2, 0x94($at)
/* 5A940 8006CD20 9E0029A4 */  sh         $t1, 0x9E($at)
.L8006CD24:
/* 5A944 8006CD24 C000298C */  lw         $t1, 0xC0($at)
/* 5A948 8006CD28 C4002A8C */  lw         $t2, 0xC4($at)
/* 5A94C 8006CD2C A80029AC */  sw         $t1, 0xA8($at)
/* 5A950 8006CD30 CE002984 */  lh         $t1, 0xCE($at)
/* 5A954 8006CD34 AC002AAC */  sw         $t2, 0xAC($at)
/* 5A958 8006CD38 B60029A4 */  sh         $t1, 0xB6($at)
/* 5A95C 8006CD3C 09F8C002 */  jalr       $s6
/* 5A960 8006CD40 2170E001 */   addu      $t6, $t7, $zero
/* 5A964 8006CD44 00008848 */  mtc2       $t0, $0 /* handwritten instruction */
/* 5A968 8006CD48 00088348 */  mtc2       $v1, $1 /* handwritten instruction */
/* 5A96C 8006CD4C 21780002 */  addu       $t7, $s0, $zero
/* 5A970 8006CD50 21802001 */  addu       $s0, $t1, $zero
/* 5A974 8006CD54 0100184A */  RTPS
/* 5A978 8006CD58 C00028AC */  sw         $t0, 0xC0($at)
/* 5A97C 8006CD5C C40023AC */  sw         $v1, 0xC4($at)
/* 5A980 8006CD60 44002384 */  lh         $v1, 0x44($at)
/* 5A984 8006CD64 03440800 */  sra        $t0, $t0, 16
/* 5A988 8006CD68 23406800 */  subu       $t0, $v1, $t0
/* 5A98C 8006CD6C CE0028A4 */  sh         $t0, 0xCE($at)
/* 5A990 8006CD70 00600348 */  mfc2       $v1, $12 /* handwritten instruction */
/* 5A994 8006CD74 00880848 */  mfc2       $t0, $17 /* handwritten instruction */
/* 5A998 8006CD78 00680948 */  mfc2       $t1, $13 /* handwritten instruction */
/* 5A99C 8006CD7C 00900A48 */  mfc2       $t2, $18 /* handwritten instruction */
/* 5A9A0 8006CD80 6C002CC8 */  lwc2       $12, 0x6C($at)
/* 5A9A4 8006CD84 700031C8 */  lwc2       $17, 0x70($at)
/* 5A9A8 8006CD88 74002DC8 */  lwc2       $13, 0x74($at)
/* 5A9AC 8006CD8C 780032C8 */  lwc2       $18, 0x78($at)
/* 5A9B0 8006CD90 6C0023AC */  sw         $v1, 0x6C($at)
/* 5A9B4 8006CD94 700028AC */  sw         $t0, 0x70($at)
/* 5A9B8 8006CD98 740029AC */  sw         $t1, 0x74($at)
/* 5A9BC 8006CD9C 78002AAC */  sw         $t2, 0x78($at)
/* 5A9C0 8006CDA0 00700348 */  mfc2       $v1, $14 /* handwritten instruction */
/* 5A9C4 8006CDA4 00980848 */  mfc2       $t0, $19 /* handwritten instruction */
/* 5A9C8 8006CDA8 7C002EC8 */  lwc2       $14, 0x7C($at)
/* 5A9CC 8006CDAC 800033C8 */  lwc2       $19, 0x80($at)
/* 5A9D0 8006CDB0 7C0023AC */  sw         $v1, 0x7C($at)
/* 5A9D4 8006CDB4 800028AC */  sw         $t0, 0x80($at)
/* 5A9D8 8006CDB8 1C01238C */  lw         $v1, 0x11C($at)
/* 5A9DC 8006CDBC 00000848 */  mfc2       $t0, $0 /* handwritten instruction */
/* 5A9E0 8006CDC0 FFFF053C */  lui        $a1, (0xFFFF0000 >> 16)
/* 5A9E4 8006CDC4 FFFF0631 */  andi       $a2, $t0, 0xFFFF
/* 5A9E8 8006CDC8 24400501 */  and        $t0, $t0, $a1
/* 5A9EC 8006CDCC 23406800 */  subu       $t0, $v1, $t0
/* 5A9F0 8006CDD0 25400601 */  or         $t0, $t0, $a2
/* 5A9F4 8006CDD4 00008848 */  mtc2       $t0, $0 /* handwritten instruction */
/* 5A9F8 8006CDD8 00000000 */  nop
/* 5A9FC 8006CDDC 00000000 */  nop
/* 5AA00 8006CDE0 0100184A */  RTPS
/* 5AA04 8006CDE4 3AFF0104 */  bgez       $zero, .L8006CAD0
/* 5AA08 8006CDE8 00000000 */   nop
/* 5AA0C 8006CDEC 422B0B00 */  srl        $a1, $t3, 13
/* 5AA10 8006CDF0 F807A530 */  andi       $a1, $a1, 0x7F8
/* 5AA14 8006CDF4 40190B00 */  sll        $v1, $t3, 5
/* 5AA18 8006CDF8 04006104 */  bgez       $v1, .L8006CE0C
/* 5AA1C 8006CDFC 2128A100 */   addu      $a1, $a1, $at
/* 5AA20 8006CE00 4001A88C */  lw         $t0, 0x140($a1)
/* 5AA24 8006CE04 99000104 */  bgez       $zero, .L8006D06C
/* 5AA28 8006CE08 4401A38C */   lw        $v1, 0x144($a1)
.L8006CE0C:
/* 5AA2C 8006CE0C 0900C017 */  bnez       $fp, .L8006CE34
/* 5AA30 8006CE10 0200E832 */   andi      $t0, $s7, 0x2
/* 5AA34 8006CE14 0300F726 */  addiu      $s7, $s7, 0x3
/* 5AA38 8006CE18 03001827 */  addiu      $t8, $t8, 0x3
/* 5AA3C 8006CE1C FDFFE99A */  lwr        $t1, -0x3($s7)
/* 5AA40 8006CE20 78000011 */  beqz       $t0, .L8006D004
/* 5AA44 8006CE24 FDFF0A9B */   lwr       $t2, -0x3($t8)
/* 5AA48 8006CE28 0000E98A */  lwl        $t1, 0x0($s7)
/* 5AA4C 8006CE2C 75000104 */  bgez       $zero, .L8006D004
/* 5AA50 8006CE30 00000A8B */   lwl       $t2, 0x0($t8)
.L8006CE34:
/* 5AA54 8006CE34 200025AC */  sw         $a1, 0x20($at)
/* 5AA58 8006CE38 0000D48F */  lw         $s4, 0x0($fp)
/* 5AA5C 8006CE3C 0400DE27 */  addiu      $fp, $fp, 0x4
/* 5AA60 8006CE40 82191400 */  srl        $v1, $s4, 6
/* 5AA64 8006CE44 07006330 */  andi       $v1, $v1, 0x7
/* 5AA68 8006CE48 1F006838 */  xori       $t0, $v1, 0x1F
/* 5AA6C 8006CE4C 01006324 */  addiu      $v1, $v1, 0x1
/* 5AA70 8006CE50 F8FF6524 */  addiu      $a1, $v1, -0x8
/* 5AA74 8006CE54 21986302 */  addu       $s3, $s3, $v1
/* 5AA78 8006CE58 07481101 */  srav       $t1, $s1, $t0
/* 5AA7C 8006CE5C 1000601A */  blez       $s3, .L8006CEA0
/* 5AA80 8006CE60 07501201 */   srav      $t2, $s2, $t0
/* 5AA84 8006CE64 21482002 */  addu       $t1, $s1, $zero
/* 5AA88 8006CE68 21504002 */  addu       $t2, $s2, $zero
/* 5AA8C 8006CE6C 0000F18E */  lw         $s1, 0x0($s7)
/* 5AA90 8006CE70 0000128F */  lw         $s2, 0x0($t8)
/* 5AA94 8006CE74 0400F726 */  addiu      $s7, $s7, 0x4
/* 5AA98 8006CE78 04001827 */  addiu      $t8, $t8, 0x4
/* 5AA9C 8006CE7C 23187300 */  subu       $v1, $v1, $s3
/* 5AAA0 8006CE80 06307100 */  srlv       $a2, $s1, $v1
/* 5AAA4 8006CE84 06187200 */  srlv       $v1, $s2, $v1
/* 5AAA8 8006CE88 25482601 */  or         $t1, $t1, $a2
/* 5AAAC 8006CE8C 25504301 */  or         $t2, $t2, $v1
/* 5AAB0 8006CE90 07480901 */  srav       $t1, $t1, $t0
/* 5AAB4 8006CE94 07500A01 */  srav       $t2, $t2, $t0
/* 5AAB8 8006CE98 21186002 */  addu       $v1, $s3, $zero
/* 5AABC 8006CE9C E0FF7326 */  addiu      $s3, $s3, -0x20
.L8006CEA0:
/* 5AAC0 8006CEA0 04887100 */  sllv       $s1, $s1, $v1
/* 5AAC4 8006CEA4 0900A010 */  beqz       $a1, .L8006CECC
/* 5AAC8 8006CEA8 04907200 */   sllv      $s2, $s2, $v1
/* 5AACC 8006CEAC 43461400 */  sra        $t0, $s4, 25
/* 5AAD0 8006CEB0 40400800 */  sll        $t0, $t0, 1
/* 5AAD4 8006CEB4 58002380 */  lb         $v1, 0x58($at)
/* 5AAD8 8006CEB8 21482801 */  addu       $t1, $t1, $t0
/* 5AADC 8006CEBC 21482301 */  addu       $t1, $t1, $v1
/* 5AAE0 8006CEC0 5C002380 */  lb         $v1, 0x5C($at)
/* 5AAE4 8006CEC4 21504801 */  addu       $t2, $t2, $t0
/* 5AAE8 8006CEC8 21504301 */  addu       $t2, $t2, $v1
.L8006CECC:
/* 5AAEC 8006CECC 580029A0 */  sb         $t1, 0x58($at)
/* 5AAF0 8006CED0 5C002AA0 */  sb         $t2, 0x5C($at)
/* 5AAF4 8006CED4 C2181400 */  srl        $v1, $s4, 3
/* 5AAF8 8006CED8 07006330 */  andi       $v1, $v1, 0x7
/* 5AAFC 8006CEDC 1F006838 */  xori       $t0, $v1, 0x1F
/* 5AB00 8006CEE0 01006324 */  addiu      $v1, $v1, 0x1
/* 5AB04 8006CEE4 F8FF6524 */  addiu      $a1, $v1, -0x8
/* 5AB08 8006CEE8 21986302 */  addu       $s3, $s3, $v1
/* 5AB0C 8006CEEC 07481101 */  srav       $t1, $s1, $t0
/* 5AB10 8006CEF0 1000601A */  blez       $s3, .L8006CF34
/* 5AB14 8006CEF4 07501201 */   srav      $t2, $s2, $t0
/* 5AB18 8006CEF8 21482002 */  addu       $t1, $s1, $zero
/* 5AB1C 8006CEFC 21504002 */  addu       $t2, $s2, $zero
/* 5AB20 8006CF00 0000F18E */  lw         $s1, 0x0($s7)
/* 5AB24 8006CF04 0000128F */  lw         $s2, 0x0($t8)
/* 5AB28 8006CF08 0400F726 */  addiu      $s7, $s7, 0x4
/* 5AB2C 8006CF0C 04001827 */  addiu      $t8, $t8, 0x4
/* 5AB30 8006CF10 23187300 */  subu       $v1, $v1, $s3
/* 5AB34 8006CF14 06307100 */  srlv       $a2, $s1, $v1
/* 5AB38 8006CF18 06187200 */  srlv       $v1, $s2, $v1
/* 5AB3C 8006CF1C 25482601 */  or         $t1, $t1, $a2
/* 5AB40 8006CF20 25504301 */  or         $t2, $t2, $v1
/* 5AB44 8006CF24 07480901 */  srav       $t1, $t1, $t0
/* 5AB48 8006CF28 07500A01 */  srav       $t2, $t2, $t0
/* 5AB4C 8006CF2C 21186002 */  addu       $v1, $s3, $zero
/* 5AB50 8006CF30 E0FF7326 */  addiu      $s3, $s3, -0x20
.L8006CF34:
/* 5AB54 8006CF34 04887100 */  sllv       $s1, $s1, $v1
/* 5AB58 8006CF38 0900A010 */  beqz       $a1, .L8006CF60
/* 5AB5C 8006CF3C 04907200 */   sllv      $s2, $s2, $v1
/* 5AB60 8006CF40 C0411400 */  sll        $t0, $s4, 7
/* 5AB64 8006CF44 03460800 */  sra        $t0, $t0, 24
/* 5AB68 8006CF48 5A002380 */  lb         $v1, 0x5A($at)
/* 5AB6C 8006CF4C 21482801 */  addu       $t1, $t1, $t0
/* 5AB70 8006CF50 21482301 */  addu       $t1, $t1, $v1
/* 5AB74 8006CF54 5E002380 */  lb         $v1, 0x5E($at)
/* 5AB78 8006CF58 21504801 */  addu       $t2, $t2, $t0
/* 5AB7C 8006CF5C 21504301 */  addu       $t2, $t2, $v1
.L8006CF60:
/* 5AB80 8006CF60 5A0029A0 */  sb         $t1, 0x5A($at)
/* 5AB84 8006CF64 5E002AA0 */  sb         $t2, 0x5E($at)
/* 5AB88 8006CF68 07008332 */  andi       $v1, $s4, 0x7
/* 5AB8C 8006CF6C 1F006838 */  xori       $t0, $v1, 0x1F
/* 5AB90 8006CF70 01006324 */  addiu      $v1, $v1, 0x1
/* 5AB94 8006CF74 F8FF6524 */  addiu      $a1, $v1, -0x8
/* 5AB98 8006CF78 21986302 */  addu       $s3, $s3, $v1
/* 5AB9C 8006CF7C 07481101 */  srav       $t1, $s1, $t0
/* 5ABA0 8006CF80 1000601A */  blez       $s3, .L8006CFC4
/* 5ABA4 8006CF84 07501201 */   srav      $t2, $s2, $t0
/* 5ABA8 8006CF88 21482002 */  addu       $t1, $s1, $zero
/* 5ABAC 8006CF8C 21504002 */  addu       $t2, $s2, $zero
/* 5ABB0 8006CF90 0000F18E */  lw         $s1, 0x0($s7)
/* 5ABB4 8006CF94 0000128F */  lw         $s2, 0x0($t8)
/* 5ABB8 8006CF98 0400F726 */  addiu      $s7, $s7, 0x4
/* 5ABBC 8006CF9C 04001827 */  addiu      $t8, $t8, 0x4
/* 5ABC0 8006CFA0 23187300 */  subu       $v1, $v1, $s3
/* 5ABC4 8006CFA4 06307100 */  srlv       $a2, $s1, $v1
/* 5ABC8 8006CFA8 06187200 */  srlv       $v1, $s2, $v1
/* 5ABCC 8006CFAC 25482601 */  or         $t1, $t1, $a2
/* 5ABD0 8006CFB0 25504301 */  or         $t2, $t2, $v1
/* 5ABD4 8006CFB4 07480901 */  srav       $t1, $t1, $t0
/* 5ABD8 8006CFB8 07500A01 */  srav       $t2, $t2, $t0
/* 5ABDC 8006CFBC 21186002 */  addu       $v1, $s3, $zero
/* 5ABE0 8006CFC0 E0FF7326 */  addiu      $s3, $s3, -0x20
.L8006CFC4:
/* 5ABE4 8006CFC4 04887100 */  sllv       $s1, $s1, $v1
/* 5ABE8 8006CFC8 0900A010 */  beqz       $a1, .L8006CFF0
/* 5ABEC 8006CFCC 04907200 */   sllv      $s2, $s2, $v1
/* 5ABF0 8006CFD0 C0431400 */  sll        $t0, $s4, 15
/* 5ABF4 8006CFD4 03460800 */  sra        $t0, $t0, 24
/* 5ABF8 8006CFD8 59002380 */  lb         $v1, 0x59($at)
/* 5ABFC 8006CFDC 21482801 */  addu       $t1, $t1, $t0
/* 5AC00 8006CFE0 21482301 */  addu       $t1, $t1, $v1
/* 5AC04 8006CFE4 5D002380 */  lb         $v1, 0x5D($at)
/* 5AC08 8006CFE8 21504801 */  addu       $t2, $t2, $t0
/* 5AC0C 8006CFEC 21504301 */  addu       $t2, $t2, $v1
.L8006CFF0:
/* 5AC10 8006CFF0 590029A0 */  sb         $t1, 0x59($at)
/* 5AC14 8006CFF4 5D002AA0 */  sb         $t2, 0x5D($at)
/* 5AC18 8006CFF8 5800298C */  lw         $t1, 0x58($at)
/* 5AC1C 8006CFFC 5C002A8C */  lw         $t2, 0x5C($at)
/* 5AC20 8006D000 2000258C */  lw         $a1, 0x20($at)
.L8006D004:
/* 5AC24 8006D004 3000268C */  lw         $a2, 0x30($at)
/* 5AC28 8006D008 24402C01 */  and        $t0, $t1, $t4
/* 5AC2C 8006D00C 24184C01 */  and        $v1, $t2, $t4
/* 5AC30 8006D010 21400301 */  addu       $t0, $t0, $v1
/* 5AC34 8006D014 21400601 */  addu       $t0, $t0, $a2
/* 5AC38 8006D018 40400800 */  sll        $t0, $t0, 1
/* 5AC3C 8006D01C 24400D01 */  and        $t0, $t0, $t5
/* 5AC40 8006D020 3400268C */  lw         $a2, 0x34($at)
/* 5AC44 8006D024 00FF2931 */  andi       $t1, $t1, 0xFF00
/* 5AC48 8006D028 00FF4A31 */  andi       $t2, $t2, 0xFF00
/* 5AC4C 8006D02C 21182A01 */  addu       $v1, $t1, $t2
/* 5AC50 8006D030 C2190300 */  srl        $v1, $v1, 7
/* 5AC54 8006D034 21186600 */  addu       $v1, $v1, $a2
/* 5AC58 8006D038 00008848 */  mtc2       $t0, $0 /* handwritten instruction */
/* 5AC5C 8006D03C 00088348 */  mtc2       $v1, $1 /* handwritten instruction */
/* 5AC60 8006D040 00000000 */  nop
/* 5AC64 8006D044 00000000 */  nop
/* 5AC68 8006D048 12604A4A */  MVMVA      1, 1, 0, 3, 0
/* 5AC6C 8006D04C 00580348 */  mfc2       $v1, $11 /* handwritten instruction */
/* 5AC70 8006D050 00500848 */  mfc2       $t0, $10 /* handwritten instruction */
/* 5AC74 8006D054 00480948 */  mfc2       $t1, $9 /* handwritten instruction */
/* 5AC78 8006D058 00440800 */  sll        $t0, $t0, 16
/* 5AC7C 8006D05C FFFF2931 */  andi       $t1, $t1, 0xFFFF
/* 5AC80 8006D060 25400901 */  or         $t0, $t0, $t1
/* 5AC84 8006D064 4001A8AC */  sw         $t0, 0x140($a1)
/* 5AC88 8006D068 4401A3AC */  sw         $v1, 0x144($a1)
.L8006D06C:
/* 5AC8C 8006D06C C2490B00 */  srl        $t1, $t3, 7
/* 5AC90 8006D070 00510B00 */  sll        $t2, $t3, 4
/* 5AC94 8006D074 04004005 */  bltz       $t2, .L8006D088
/* 5AC98 8006D078 FC012931 */   andi      $t1, $t1, 0x1FC
/* 5AC9C 8006D07C 21483C01 */  addu       $t1, $t1, $gp
/* 5ACA0 8006D080 0800E003 */  jr         $ra
/* 5ACA4 8006D084 0000298D */   lw        $t1, 0x0($t1)
.L8006D088:
/* 5ACA8 8006D088 21482101 */  addu       $t1, $t1, $at
/* 5ACAC 8006D08C 0800E003 */  jr         $ra
/* 5ACB0 8006D090 4001298D */   lw        $t1, 0x140($t1)
.size Draw_KartBodyReflection, . - Draw_KartBodyReflection
