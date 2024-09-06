.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel Draw_KartFlames
/* 596F0 8006BAD0 2C002B8C */  lw         $t3, 0x2C($at)
/* 596F4 8006BAD4 34012384 */  lh         $v1, 0x134($at)
/* 596F8 8006BAD8 36012884 */  lh         $t0, 0x136($at)
/* 596FC 8006BADC 3800258C */  lw         $a1, 0x38($at)
/* 59700 8006BAE0 425C0B00 */  srl        $t3, $t3, 17
/* 59704 8006BAE4 80580B00 */  sll        $t3, $t3, 2
/* 59708 8006BAE8 23506301 */  subu       $t2, $t3, $v1
/* 5970C 8006BAEC 03004105 */  bgez       $t2, .L8006BAFC
/* 59710 8006BAF0 23506801 */   subu      $t2, $t3, $t0
/* 59714 8006BAF4 04000104 */  bgez       $zero, .L8006BB08
/* 59718 8006BAF8 21586500 */   addu      $t3, $v1, $a1
.L8006BAFC:
/* 5971C 8006BAFC 02004019 */  blez       $t2, .L8006BB08
/* 59720 8006BB00 21586501 */   addu      $t3, $t3, $a1
/* 59724 8006BB04 21580501 */  addu       $t3, $t0, $a1
.L8006BB08:
/* 59728 8006BB08 20012A84 */  lh         $t2, 0x120($at)
/* 5972C 8006BB0C 5000268C */  lw         $a2, 0x50($at)
/* 59730 8006BB10 00A08E48 */  mtc2       $t6, $20 /* handwritten instruction */
/* 59734 8006BB14 00A88F48 */  mtc2       $t7, $21 /* handwritten instruction */
/* 59738 8006BB18 00B09048 */  mtc2       $s0, $22 /* handwritten instruction */
/* 5973C 8006BB1C 00408A48 */  mtc2       $t2, $8 /* handwritten instruction */
/* 59740 8006BB20 04004011 */  beqz       $t2, .L8006BB34
/* 59744 8006BB24 C0410B00 */   sll       $t0, $t3, 7
/* 59748 8006BB28 02000005 */  bltz       $t0, .L8006BB34
/* 5974C 8006BB2C 00000000 */   nop
/* 59750 8006BB30 2A00F84A */  DPCT
.L8006BB34:
/* 59754 8006BB34 0C00C014 */  bnez       $a2, .L8006BB68
/* 59758 8006BB38 0030033C */   lui       $v1, (0x30000000 >> 16)
/* 5975C 8006BB3C 08004CE8 */  swc2       $12, 0x8($v0)
/* 59760 8006BB40 10004DE8 */  swc2       $13, 0x10($v0)
/* 59764 8006BB44 18004EE8 */  swc2       $14, 0x18($v0)
/* 59768 8006BB48 00A00848 */  mfc2       $t0, $20 /* handwritten instruction */
/* 5976C 8006BB4C 1C000924 */  addiu      $t1, $zero, 0x1C
/* 59770 8006BB50 25186800 */  or         $v1, $v1, $t0
/* 59774 8006BB54 040043AC */  sw         $v1, 0x4($v0)
/* 59778 8006BB58 0C0055E8 */  swc2       $21, 0xC($v0)
/* 5977C 8006BB5C 140056E8 */  swc2       $22, 0x14($v0)
/* 59780 8006BB60 BBFC0104 */  bgez       $zero, .L8006AE50
/* 59784 8006BB64 0006083C */   lui       $t0, (0x6000000 >> 16)
.L8006BB68:
/* 59788 8006BB68 0000C38C */  lw         $v1, 0x0($a2)
/* 5978C 8006BB6C 0400C88C */  lw         $t0, 0x4($a2)
/* 59790 8006BB70 0800C98C */  lw         $t1, 0x8($a2)
/* 59794 8006BB74 08004CE8 */  swc2       $12, 0x8($v0)
/* 59798 8006BB78 14004DE8 */  swc2       $13, 0x14($v0)
/* 5979C 8006BB7C 20004EE8 */  swc2       $14, 0x20($v0)
/* 597A0 8006BB80 0C0043AC */  sw         $v1, 0xC($v0)
/* 597A4 8006BB84 180048AC */  sw         $t0, 0x18($v0)
/* 597A8 8006BB88 240049AC */  sw         $t1, 0x24($v0)
/* 597AC 8006BB8C 00A00948 */  mfc2       $t1, $20 /* handwritten instruction */
/* 597B0 8006BB90 6000033C */  lui        $v1, (0x600000 >> 16)
/* 597B4 8006BB94 24406800 */  and        $t0, $v1, $t0
/* 597B8 8006BB98 02006810 */  beq        $v1, $t0, .L8006BBA4
/* 597BC 8006BB9C 0034033C */   lui       $v1, (0x34000000 >> 16)
/* 597C0 8006BBA0 0036033C */  lui        $v1, (0x36000000 >> 16)
.L8006BBA4:
/* 597C4 8006BBA4 25186900 */  or         $v1, $v1, $t1
/* 597C8 8006BBA8 040043AC */  sw         $v1, 0x4($v0)
/* 597CC 8006BBAC 100055E8 */  swc2       $21, 0x10($v0)
/* 597D0 8006BBB0 1C0056E8 */  swc2       $22, 0x1C($v0)
/* 597D4 8006BBB4 28000924 */  addiu      $t1, $zero, 0x28
/* 597D8 8006BBB8 A5FC0104 */  bgez       $zero, .L8006AE50
/* 597DC 8006BBBC 0009083C */   lui       $t0, (0x9000000 >> 16)
.L8006BBC0:
/* 597E0 8006BBC0 57FC0011 */  beqz       $t0, .L8006AD20
/* 597E4 8006BBC4 04003927 */   addiu     $t9, $t9, 0x4
/* 597E8 8006BBC8 09F8C002 */  jalr       $s6
/* 597EC 8006BBCC 0C012BAC */   sw        $t3, 0x10C($at)
/* 597F0 8006BBD0 FCFF2B8F */  lw         $t3, -0x4($t9)
/* 597F4 8006BBD4 00008848 */  mtc2       $t0, $0 /* handwritten instruction */
/* 597F8 8006BBD8 00088348 */  mtc2       $v1, $1 /* handwritten instruction */
/* 597FC 8006BBDC 09F8C002 */  jalr       $s6
/* 59800 8006BBE0 21702001 */   addu      $t6, $t1, $zero
/* 59804 8006BBE4 00002B8F */  lw         $t3, 0x0($t9)
/* 59808 8006BBE8 00108848 */  mtc2       $t0, $2 /* handwritten instruction */
/* 5980C 8006BBEC 00188348 */  mtc2       $v1, $3 /* handwritten instruction */
/* 59810 8006BBF0 09F8C002 */  jalr       $s6
/* 59814 8006BBF4 21782001 */   addu      $t7, $t1, $zero
/* 59818 8006BBF8 00208848 */  mtc2       $t0, $4 /* handwritten instruction */
/* 5981C 8006BBFC 00288348 */  mtc2       $v1, $5 /* handwritten instruction */
/* 59820 8006BC00 21802001 */  addu       $s0, $t1, $zero
/* 59824 8006BC04 0C012B8C */  lw         $t3, 0x10C($at)
/* 59828 8006BC08 3000284A */  RTPT
/* 5982C 8006BC0C 04003927 */  addiu      $t9, $t9, 0x4
/* 59830 8006BC10 90002CE8 */  swc2       $12, 0x90($at)
/* 59834 8006BC14 940031E8 */  swc2       $17, 0x94($at)
/* 59838 8006BC18 A8002DE8 */  swc2       $13, 0xA8($at)
/* 5983C 8006BC1C AC0032E8 */  swc2       $18, 0xAC($at)
/* 59840 8006BC20 C0002EE8 */  swc2       $14, 0xC0($at)
/* 59844 8006BC24 C40033E8 */  swc2       $19, 0xC4($at)
/* 59848 8006BC28 1C01238C */  lw         $v1, 0x11C($at)
/* 5984C 8006BC2C 00000848 */  mfc2       $t0, $0 /* handwritten instruction */
/* 59850 8006BC30 00100948 */  mfc2       $t1, $2 /* handwritten instruction */
/* 59854 8006BC34 00200A48 */  mfc2       $t2, $4 /* handwritten instruction */
/* 59858 8006BC38 FFFF053C */  lui        $a1, (0xFFFF0000 >> 16)
/* 5985C 8006BC3C FFFF0631 */  andi       $a2, $t0, 0xFFFF
/* 59860 8006BC40 24400501 */  and        $t0, $t0, $a1
/* 59864 8006BC44 23406800 */  subu       $t0, $v1, $t0
/* 59868 8006BC48 25400601 */  or         $t0, $t0, $a2
/* 5986C 8006BC4C FFFF2631 */  andi       $a2, $t1, 0xFFFF
/* 59870 8006BC50 24482501 */  and        $t1, $t1, $a1
/* 59874 8006BC54 23486900 */  subu       $t1, $v1, $t1
/* 59878 8006BC58 25482601 */  or         $t1, $t1, $a2
/* 5987C 8006BC5C FFFF4631 */  andi       $a2, $t2, 0xFFFF
/* 59880 8006BC60 24504501 */  and        $t2, $t2, $a1
/* 59884 8006BC64 23506A00 */  subu       $t2, $v1, $t2
/* 59888 8006BC68 25504601 */  or         $t2, $t2, $a2
/* 5988C 8006BC6C 00008848 */  mtc2       $t0, $0 /* handwritten instruction */
/* 59890 8006BC70 00108948 */  mtc2       $t1, $2 /* handwritten instruction */
/* 59894 8006BC74 00208A48 */  mtc2       $t2, $4 /* handwritten instruction */
/* 59898 8006BC78 00000000 */  nop
/* 5989C 8006BC7C 00000000 */  nop
/* 598A0 8006BC80 3000284A */  RTPT
.L8006BC84:
/* 598A4 8006BC84 24002884 */  lh         $t0, 0x24($at)
/* 598A8 8006BC88 FF016631 */  andi       $a2, $t3, 0x1FF
/* 598AC 8006BC8C 0300C010 */  beqz       $a2, .L8006BC9C
/* 598B0 8006BC90 80300600 */   sll       $a2, $a2, 2
/* 598B4 8006BC94 2130DD00 */  addu       $a2, $a2, $sp
/* 598B8 8006BC98 FCFFC68C */  lw         $a2, -0x4($a2)
.L8006BC9C:
/* 598BC 8006BC9C 00800839 */  xori       $t0, $t0, 0x8000
/* 598C0 8006BCA0 240028A4 */  sh         $t0, 0x24($at)
/* 598C4 8006BCA4 500026AC */  sw         $a2, 0x50($at)
/* 598C8 8006BCA8 1C00238C */  lw         $v1, 0x1C($at)
/* 598CC 8006BCAC 00700A48 */  mfc2       $t2, $14 /* handwritten instruction */
/* 598D0 8006BCB0 00F84548 */  cfc2       $a1, $31 /* handwritten instruction */
/* 598D4 8006BCB4 C0400B00 */  sll        $t0, $t3, 3
/* 598D8 8006BCB8 402B0500 */  sll        $a1, $a1, 13
/* 598DC 8006BCBC 2900A004 */  bltz       $a1, .L8006BD64
/* 598E0 8006BCC0 80480B00 */   sll       $t1, $t3, 2
/* 598E4 8006BCC4 07000105 */  bgez       $t0, .L8006BCE4
/* 598E8 8006BCC8 24002584 */   lh        $a1, 0x24($at)
/* 598EC 8006BCCC 0600404B */  NCLIP
/* 598F0 8006BCD0 00C00848 */  mfc2       $t0, $24 /* handwritten instruction */
/* 598F4 8006BCD4 2648A900 */  xor        $t1, $a1, $t1
/* 598F8 8006BCD8 22000011 */  beqz       $t0, .L8006BD64
/* 598FC 8006BCDC 26400901 */   xor       $t0, $t0, $t1
/* 59900 8006BCE0 20000019 */  blez       $t0, .L8006BD64
.L8006BCE4:
/* 59904 8006BCE4 00600848 */   mfc2      $t0, $12 /* handwritten instruction */
/* 59908 8006BCE8 00680948 */  mfc2       $t1, $13 /* handwritten instruction */
/* 5990C 8006BCEC 24280A01 */  and        $a1, $t0, $t2
/* 59910 8006BCF0 2428A900 */  and        $a1, $a1, $t1
/* 59914 8006BCF4 2D00584B */  AVSZ3
/* 59918 8006BCF8 23400301 */  subu       $t0, $t0, $v1
/* 5991C 8006BCFC 23482301 */  subu       $t1, $t1, $v1
/* 59920 8006BD00 23504301 */  subu       $t2, $t2, $v1
/* 59924 8006BD04 25180901 */  or         $v1, $t0, $t1
/* 59928 8006BD08 27186A00 */  nor        $v1, $v1, $t2
/* 5992C 8006BD0C 25186500 */  or         $v1, $v1, $a1
/* 59930 8006BD10 14006004 */  bltz       $v1, .L8006BD64
/* 59934 8006BD14 001C0300 */   sll       $v1, $v1, 16
/* 59938 8006BD18 12006004 */  bltz       $v1, .L8006BD64
/* 5993C 8006BD1C 2C0038E8 */   swc2      $24, 0x2C($at)
/* 59940 8006BD20 98002EAC */  sw         $t6, 0x98($at)
/* 59944 8006BD24 B0002FAC */  sw         $t7, 0xB0($at)
/* 59948 8006BD28 C80030AC */  sw         $s0, 0xC8($at)
/* 5994C 8006BD2C 48002980 */  lb         $t1, 0x48($at)
/* 59950 8006BD30 4C00238C */  lw         $v1, 0x4C($at)
/* 59954 8006BD34 06702E01 */  srlv       $t6, $t6, $t1
/* 59958 8006BD38 06782F01 */  srlv       $t7, $t7, $t1
/* 5995C 8006BD3C 06803001 */  srlv       $s0, $s0, $t1
/* 59960 8006BD40 2470C301 */  and        $t6, $t6, $v1
/* 59964 8006BD44 2478E301 */  and        $t7, $t7, $v1
/* 59968 8006BD48 24800302 */  and        $s0, $s0, $v1
/* 5996C 8006BD4C 4000238C */  lw         $v1, 0x40($at)
/* 59970 8006BD50 09F8A002 */  jalr       $s5
/* 59974 8006BD54 380023AC */   sw        $v1, 0x38($at)
/* 59978 8006BD58 98002E8C */  lw         $t6, 0x98($at)
/* 5997C 8006BD5C B0002F8C */  lw         $t7, 0xB0($at)
/* 59980 8006BD60 C800308C */  lw         $s0, 0xC8($at)
.L8006BD64:
/* 59984 8006BD64 A0002CE8 */  swc2       $12, 0xA0($at)
/* 59988 8006BD68 A40031E8 */  swc2       $17, 0xA4($at)
/* 5998C 8006BD6C B8002DE8 */  swc2       $13, 0xB8($at)
/* 59990 8006BD70 BC0032E8 */  swc2       $18, 0xBC($at)
/* 59994 8006BD74 D0002EE8 */  swc2       $14, 0xD0($at)
/* 59998 8006BD78 D40033E8 */  swc2       $19, 0xD4($at)
/* 5999C 8006BD7C 90002CC8 */  lwc2       $12, 0x90($at)
/* 599A0 8006BD80 940031C8 */  lwc2       $17, 0x94($at)
/* 599A4 8006BD84 A8002DC8 */  lwc2       $13, 0xA8($at)
/* 599A8 8006BD88 AC0032C8 */  lwc2       $18, 0xAC($at)
/* 599AC 8006BD8C C0002EC8 */  lwc2       $14, 0xC0($at)
/* 599B0 8006BD90 24002884 */  lh         $t0, 0x24($at)
/* 599B4 8006BD94 C40033C8 */  lwc2       $19, 0xC4($at)
/* 599B8 8006BD98 00800839 */  xori       $t0, $t0, 0x8000
/* 599BC 8006BD9C 240028A4 */  sh         $t0, 0x24($at)
/* 599C0 8006BDA0 1C00238C */  lw         $v1, 0x1C($at)
/* 599C4 8006BDA4 00700A48 */  mfc2       $t2, $14 /* handwritten instruction */
/* 599C8 8006BDA8 00F84548 */  cfc2       $a1, $31 /* handwritten instruction */
/* 599CC 8006BDAC C0400B00 */  sll        $t0, $t3, 3
/* 599D0 8006BDB0 402B0500 */  sll        $a1, $a1, 13
/* 599D4 8006BDB4 1B00A004 */  bltz       $a1, .L8006BE24
/* 599D8 8006BDB8 80480B00 */   sll       $t1, $t3, 2
/* 599DC 8006BDBC 07000105 */  bgez       $t0, .L8006BDDC
/* 599E0 8006BDC0 24002584 */   lh        $a1, 0x24($at)
/* 599E4 8006BDC4 0600404B */  NCLIP
/* 599E8 8006BDC8 00C00848 */  mfc2       $t0, $24 /* handwritten instruction */
/* 599EC 8006BDCC 2648A900 */  xor        $t1, $a1, $t1
/* 599F0 8006BDD0 14000011 */  beqz       $t0, .L8006BE24
/* 599F4 8006BDD4 26400901 */   xor       $t0, $t0, $t1
/* 599F8 8006BDD8 12000019 */  blez       $t0, .L8006BE24
.L8006BDDC:
/* 599FC 8006BDDC 00600848 */   mfc2      $t0, $12 /* handwritten instruction */
/* 59A00 8006BDE0 00680948 */  mfc2       $t1, $13 /* handwritten instruction */
/* 59A04 8006BDE4 24280A01 */  and        $a1, $t0, $t2
/* 59A08 8006BDE8 2428A900 */  and        $a1, $a1, $t1
/* 59A0C 8006BDEC 2D00584B */  AVSZ3
/* 59A10 8006BDF0 23400301 */  subu       $t0, $t0, $v1
/* 59A14 8006BDF4 23482301 */  subu       $t1, $t1, $v1
/* 59A18 8006BDF8 23504301 */  subu       $t2, $t2, $v1
/* 59A1C 8006BDFC 25180901 */  or         $v1, $t0, $t1
/* 59A20 8006BE00 27186A00 */  nor        $v1, $v1, $t2
/* 59A24 8006BE04 25186500 */  or         $v1, $v1, $a1
/* 59A28 8006BE08 06006004 */  bltz       $v1, .L8006BE24
/* 59A2C 8006BE0C 001C0300 */   sll       $v1, $v1, 16
/* 59A30 8006BE10 04006004 */  bltz       $v1, .L8006BE24
/* 59A34 8006BE14 2C0038E8 */   swc2      $24, 0x2C($at)
/* 59A38 8006BE18 3C00238C */  lw         $v1, 0x3C($at)
/* 59A3C 8006BE1C 09F8A002 */  jalr       $s5
/* 59A40 8006BE20 380023AC */   sw        $v1, 0x38($at)
.L8006BE24:
/* 59A44 8006BE24 00002B8F */  lw         $t3, 0x0($t9)
/* 59A48 8006BE28 04003927 */  addiu      $t9, $t9, 0x4
/* 59A4C 8006BE2C 64FF6005 */  bltz       $t3, .L8006BBC0
/* 59A50 8006BE30 01006825 */   addiu     $t0, $t3, 0x1
/* 59A54 8006BE34 02440B00 */  srl        $t0, $t3, 16
/* 59A58 8006BE38 14000015 */  bnez       $t0, .L8006BE8C
/* 59A5C 8006BE3C 40480B00 */   sll       $t1, $t3, 1
/* 59A60 8006BE40 C0470B00 */  sll        $t0, $t3, 31
/* 59A64 8006BE44 C2190B00 */  srl        $v1, $t3, 7
/* 59A68 8006BE48 04000005 */  bltz       $t0, .L8006BE5C
/* 59A6C 8006BE4C FC016330 */   andi      $v1, $v1, 0x1FC
/* 59A70 8006BE50 21187C00 */  addu       $v1, $v1, $gp
/* 59A74 8006BE54 03000104 */  bgez       $zero, .L8006BE64
/* 59A78 8006BE58 00006F8C */   lw        $t7, 0x0($v1)
.L8006BE5C:
/* 59A7C 8006BE5C 21186100 */  addu       $v1, $v1, $at
/* 59A80 8006BE60 40016F8C */  lw         $t7, 0x140($v1)
.L8006BE64:
/* 59A84 8006BE64 80470B00 */  sll        $t0, $t3, 30
/* 59A88 8006BE68 04000005 */  bltz       $t0, .L8006BE7C
/* 59A8C 8006BE6C FC016331 */   andi      $v1, $t3, 0x1FC
/* 59A90 8006BE70 21187C00 */  addu       $v1, $v1, $gp
/* 59A94 8006BE74 03000104 */  bgez       $zero, .L8006BE84
/* 59A98 8006BE78 0000708C */   lw        $s0, 0x0($v1)
.L8006BE7C:
/* 59A9C 8006BE7C 21186100 */  addu       $v1, $v1, $at
/* 59AA0 8006BE80 4001708C */  lw         $s0, 0x140($v1)
.L8006BE84:
/* 59AA4 8006BE84 E7FF0104 */  bgez       $zero, .L8006BE24
/* 59AA8 8006BE88 2170E001 */   addu      $t6, $t7, $zero
.L8006BE8C:
/* 59AAC 8006BE8C 0A002105 */  bgez       $t1, .L8006BEB8
/* 59AB0 8006BE90 00000000 */   nop
/* 59AB4 8006BE94 00600948 */  mfc2       $t1, $12 /* handwritten instruction */
/* 59AB8 8006BE98 00880A48 */  mfc2       $t2, $17 /* handwritten instruction */
/* 59ABC 8006BE9C 00688948 */  mtc2       $t1, $13 /* handwritten instruction */
/* 59AC0 8006BEA0 00908A48 */  mtc2       $t2, $18 /* handwritten instruction */
/* 59AC4 8006BEA4 2178C001 */  addu       $t7, $t6, $zero
/* 59AC8 8006BEA8 A000298C */  lw         $t1, 0xA0($at)
/* 59ACC 8006BEAC A4002A8C */  lw         $t2, 0xA4($at)
/* 59AD0 8006BEB0 B80029AC */  sw         $t1, 0xB8($at)
/* 59AD4 8006BEB4 BC002AAC */  sw         $t2, 0xBC($at)
.L8006BEB8:
/* 59AD8 8006BEB8 09F8C002 */  jalr       $s6
/* 59ADC 8006BEBC 2170E001 */   addu      $t6, $t7, $zero
/* 59AE0 8006BEC0 00008848 */  mtc2       $t0, $0 /* handwritten instruction */
/* 59AE4 8006BEC4 00088348 */  mtc2       $v1, $1 /* handwritten instruction */
/* 59AE8 8006BEC8 21780002 */  addu       $t7, $s0, $zero
/* 59AEC 8006BECC 21802001 */  addu       $s0, $t1, $zero
/* 59AF0 8006BED0 0100184A */  RTPS
/* 59AF4 8006BED4 90002CE8 */  swc2       $12, 0x90($at)
/* 59AF8 8006BED8 940031E8 */  swc2       $17, 0x94($at)
/* 59AFC 8006BEDC A8002DE8 */  swc2       $13, 0xA8($at)
/* 59B00 8006BEE0 AC0032E8 */  swc2       $18, 0xAC($at)
/* 59B04 8006BEE4 C0002EE8 */  swc2       $14, 0xC0($at)
/* 59B08 8006BEE8 C40033E8 */  swc2       $19, 0xC4($at)
/* 59B0C 8006BEEC 1C01238C */  lw         $v1, 0x11C($at)
/* 59B10 8006BEF0 00000848 */  mfc2       $t0, $0 /* handwritten instruction */
/* 59B14 8006BEF4 FFFF053C */  lui        $a1, (0xFFFF0000 >> 16)
/* 59B18 8006BEF8 FFFF0631 */  andi       $a2, $t0, 0xFFFF
/* 59B1C 8006BEFC 24400501 */  and        $t0, $t0, $a1
/* 59B20 8006BF00 23406800 */  subu       $t0, $v1, $t0
/* 59B24 8006BF04 25400601 */  or         $t0, $t0, $a2
/* 59B28 8006BF08 00008848 */  mtc2       $t0, $0 /* handwritten instruction */
/* 59B2C 8006BF0C B8002DC8 */  lwc2       $13, 0xB8($at)
/* 59B30 8006BF10 BC0032C8 */  lwc2       $18, 0xBC($at)
/* 59B34 8006BF14 D0002EC8 */  lwc2       $14, 0xD0($at)
/* 59B38 8006BF18 D40033C8 */  lwc2       $19, 0xD4($at)
/* 59B3C 8006BF1C 00000000 */  nop
/* 59B40 8006BF20 00000000 */  nop
/* 59B44 8006BF24 0100184A */  RTPS
/* 59B48 8006BF28 56FF0104 */  bgez       $zero, .L8006BC84
/* 59B4C 8006BF2C 00000000 */   nop
.size Draw_KartFlames, . - Draw_KartFlames
