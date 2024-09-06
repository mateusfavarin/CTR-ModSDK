.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel RedBeaker_RenderRain
/* 5B850 8006DC30 801F013C */  lui        $at, (0x1F800000 >> 16)
/* 5B854 8006DC34 000030AC */  sw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 5B858 8006DC38 040031AC */  sw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 5B85C 8006DC3C 080032AC */  sw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 5B860 8006DC40 0C0033AC */  sw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 5B864 8006DC44 100034AC */  sw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 5B868 8006DC48 140035AC */  sw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 5B86C 8006DC4C 180036AC */  sw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 5B870 8006DC50 1C0037AC */  sw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 5B874 8006DC54 20003CAC */  sw         $gp, (0x1F800020 & 0xFFFF)($at)
/* 5B878 8006DC58 24003DAC */  sw         $sp, (0x1F800024 & 0xFFFF)($at)
/* 5B87C 8006DC5C 28003EAC */  sw         $fp, (0x1F800028 & 0xFFFF)($at)
/* 5B880 8006DC60 2C003FAC */  sw         $ra, (0x1F80002C & 0xFFFF)($at)
/* 5B884 8006DC64 1000BE8F */  lw         $fp, 0x10($sp)
/* 5B888 8006DC68 0C00A28C */  lw         $v0, 0xC($a1)
/* 5B88C 8006DC6C 0C00C68C */  lw         $a2, 0xC($a2)
/* 5B890 8006DC70 FFFFE724 */  addiu      $a3, $a3, -0x1
/* 5B894 8006DC74 00001224 */  addiu      $s2, $zero, 0x0
/* 5B898 8006DC78 6D01C010 */  beqz       $a2, .L8006E230
/* 5B89C 8006DC7C 380026AC */   sw        $a2, (0x1F800038 & 0xFFFF)($at)
/* 5B8A0 8006DC80 480020AC */  sw         $zero, (0x1F800048 & 0xFFFF)($at)
/* 5B8A4 8006DC84 4C0020AC */  sw         $zero, (0x1F80004C & 0xFFFF)($at)
/* 5B8A8 8006DC88 0002033C */  lui        $v1, (0x2000080 >> 16)
/* 5B8AC 8006DC8C 80006334 */  ori        $v1, $v1, (0x2000080 & 0xFFFF)
/* 5B8B0 8006DC90 300023AC */  sw         $v1, (0x1F800030 & 0xFFFF)($at)
.L8006DC94:
/* 5B8B4 8006DC94 2800838C */  lw         $v1, 0x28($a0)
/* 5B8B8 8006DC98 2C00888C */  lw         $t0, 0x2C($a0)
/* 5B8BC 8006DC9C 3000898C */  lw         $t1, 0x30($a0)
/* 5B8C0 8006DCA0 0000C348 */  ctc2       $v1, $0 /* handwritten instruction */
/* 5B8C4 8006DCA4 0008C848 */  ctc2       $t0, $1 /* handwritten instruction */
/* 5B8C8 8006DCA8 0010C948 */  ctc2       $t1, $2 /* handwritten instruction */
/* 5B8CC 8006DCAC 3400838C */  lw         $v1, 0x34($a0)
/* 5B8D0 8006DCB0 3800888C */  lw         $t0, 0x38($a0)
/* 5B8D4 8006DCB4 0018C348 */  ctc2       $v1, $3 /* handwritten instruction */
/* 5B8D8 8006DCB8 0020C848 */  ctc2       $t0, $4 /* handwritten instruction */
/* 5B8DC 8006DCBC 3800268C */  lw         $a2, (0x1F800038 & 0xFFFF)($at)
/* 5B8E0 8006DCC0 20008384 */  lh         $v1, 0x20($a0)
/* 5B8E4 8006DCC4 22008884 */  lh         $t0, 0x22($a0)
/* 5B8E8 8006DCC8 1800898C */  lw         $t1, 0x18($a0)
/* 5B8EC 8006DCCC 20008C8C */  lw         $t4, 0x20($a0)
/* 5B8F0 8006DCD0 F4008B8C */  lw         $t3, 0xF4($a0)
/* 5B8F4 8006DCD4 C01B0300 */  sll        $v1, $v1, 15
/* 5B8F8 8006DCD8 C0430800 */  sll        $t0, $t0, 15
/* 5B8FC 8006DCDC 00C0C348 */  ctc2       $v1, $24 /* handwritten instruction */
/* 5B900 8006DCE0 00C8C848 */  ctc2       $t0, $25 /* handwritten instruction */
/* 5B904 8006DCE4 00D0C948 */  ctc2       $t1, $26 /* handwritten instruction */
/* 5B908 8006DCE8 34002BAC */  sw         $t3, (0x1F800034 & 0xFFFF)($at)
.L8006DCEC:
/* 5B90C 8006DCEC 4C01C010 */  beqz       $a2, .L8006E220
/* 5B910 8006DCF0 2400CA8C */   lw        $t2, 0x24($a2)
/* 5B914 8006DCF4 0800CF8C */  lw         $t7, 0x8($a2)
/* 5B918 8006DCF8 46014011 */  beqz       $t2, .L8006E214
/* 5B91C 8006DCFC 0C00D38C */   lw        $s3, 0xC($a2)
/* 5B920 8006DD00 1000D484 */  lh         $s4, 0x10($a2)
/* 5B924 8006DD04 FEFF0D3C */  lui        $t5, (0xFFFEFFFF >> 16)
/* 5B928 8006DD08 FFFFAD35 */  ori        $t5, $t5, (0xFFFEFFFF & 0xFFFF)
/* 5B92C 8006DD0C FE010E3C */  lui        $t6, (0x1FE00FF >> 16)
/* 5B930 8006DD10 FF00CE35 */  ori        $t6, $t6, (0x1FE00FF & 0xFFFF)
/* 5B934 8006DD14 1400D78C */  lw         $s7, 0x14($a2)
/* 5B938 8006DD18 1800D884 */  lh         $t8, 0x18($a2)
/* 5B93C 8006DD1C 24B8ED02 */  and        $s7, $s7, $t5
/* 5B940 8006DD20 21A87702 */  addu       $s5, $s3, $s7
/* 5B944 8006DD24 21B09802 */  addu       $s6, $s4, $t8
/* 5B948 8006DD28 0300C017 */  bnez       $fp, .L8006DD38
/* 5B94C 8006DD2C 24A8AD02 */   and       $s5, $s5, $t5
/* 5B950 8006DD30 0C00D5AC */  sw         $s5, 0xC($a2)
/* 5B954 8006DD34 1000D6AC */  sw         $s6, 0x10($a2)
.L8006DD38:
/* 5B958 8006DD38 21505201 */  addu       $t2, $t2, $s2
/* 5B95C 8006DD3C 8C004385 */  lh         $v1, 0x8C($t2)
/* 5B960 8006DD40 90004985 */  lh         $t1, 0x90($t2)
/* 5B964 8006DD44 94004885 */  lh         $t0, 0x94($t2)
/* 5B968 8006DD48 0028C348 */  ctc2       $v1, $5 /* handwritten instruction */
/* 5B96C 8006DD4C 0030C948 */  ctc2       $t1, $6 /* handwritten instruction */
/* 5B970 8006DD50 0038C848 */  ctc2       $t0, $7 /* handwritten instruction */
/* 5B974 8006DD54 004C0900 */  sll        $t1, $t1, 16
/* 5B978 8006DD58 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 5B97C 8006DD5C 25186900 */  or         $v1, $v1, $t1
/* 5B980 8006DD60 2C010005 */  bltz       $t0, .L8006E214
/* 5B984 8006DD64 00F40925 */   addiu     $t1, $t0, -0xC00
/* 5B988 8006DD68 2A012105 */  bgez       $t1, .L8006E214
/* 5B98C 8006DD6C 00FC0925 */   addiu     $t1, $t0, -0x400
/* 5B990 8006DD70 02002105 */  bgez       $t1, .L8006DD7C
/* 5B994 8006DD74 C2480900 */   srl       $t1, $t1, 3
/* 5B998 8006DD78 00000924 */  addiu      $t1, $zero, 0x0
.L8006DD7C:
/* 5B99C 8006DD7C FF002931 */  andi       $t1, $t1, 0xFF
/* 5B9A0 8006DD80 FF000324 */  addiu      $v1, $zero, 0xFF
/* 5B9A4 8006DD84 23486900 */  subu       $t1, $v1, $t1
/* 5B9A8 8006DD88 4C0029A0 */  sb         $t1, (0x1F80004C & 0xFFFF)($at)
/* 5B9AC 8006DD8C 4D0029A0 */  sb         $t1, (0x1F80004D & 0xFFFF)($at)
/* 5B9B0 8006DD90 4E0029A0 */  sb         $t1, (0x1F80004E & 0xFFFF)($at)
/* 5B9B4 8006DD94 4A0029A0 */  sb         $t1, (0x1F80004A & 0xFFFF)($at)
/* 5B9B8 8006DD98 83180900 */  sra        $v1, $t1, 2
/* 5B9BC 8006DD9C 23482301 */  subu       $t1, $t1, $v1
/* 5B9C0 8006DDA0 480029A0 */  sb         $t1, (0x1F800048 & 0xFFFF)($at)
/* 5B9C4 8006DDA4 490029A0 */  sb         $t1, (0x1F800049 & 0xFFFF)($at)
/* 5B9C8 8006DDA8 50004A81 */  lb         $t2, 0x50($t2)
/* 5B9CC 8006DDAC 34002B8C */  lw         $t3, (0x1F800034 & 0xFFFF)($at)
/* 5B9D0 8006DDB0 FAFF4A25 */  addiu      $t2, $t2, -0x6
/* 5B9D4 8006DDB4 83490800 */  sra        $t1, $t0, 6
/* 5B9D8 8006DDB8 43480900 */  sra        $t1, $t1, 1
/* 5B9DC 8006DDBC 21482A01 */  addu       $t1, $t1, $t2
/* 5B9E0 8006DDC0 02002105 */  bgez       $t1, .L8006DDCC
/* 5B9E4 8006DDC4 80480900 */   sll       $t1, $t1, 2
/* 5B9E8 8006DDC8 00000924 */  addiu      $t1, $zero, 0x0
.L8006DDCC:
/* 5B9EC 8006DDCC 00F02A25 */  addiu      $t2, $t1, -0x1000
/* 5B9F0 8006DDD0 02004005 */  bltz       $t2, .L8006DDDC
/* 5B9F4 8006DDD4 00000000 */   nop
/* 5B9F8 8006DDD8 FC0F0924 */  addiu      $t1, $zero, 0xFFC
.L8006DDDC:
/* 5B9FC 8006DDDC 21586901 */  addu       $t3, $t3, $t1
/* 5BA00 8006DDE0 1230103C */  lui        $s0, (0x30125400 >> 16)
/* 5BA04 8006DDE4 00541036 */  ori        $s0, $s0, (0x30125400 & 0xFFFF)
/* 5BA08 8006DDE8 3549113C */  lui        $s1, (0x493583FE >> 16)
/* 5BA0C 8006DDEC 56000104 */  bgez       $zero, .L8006DF48
/* 5BA10 8006DDF0 FE833136 */   ori       $s1, $s1, (0x493583FE & 0xFFFF)
.L8006DDF4:
/* 5BA14 8006DDF4 25403C03 */  or         $t0, $t9, $gp
/* 5BA18 8006DDF8 3000298C */  lw         $t1, (0x1F800030 & 0xFFFF)($at)
/* 5BA1C 8006DDFC 21181301 */  addu       $v1, $t0, $s3
/* 5BA20 8006DE00 21401501 */  addu       $t0, $t0, $s5
/* 5BA24 8006DE04 24186E00 */  and        $v1, $v1, $t6
/* 5BA28 8006DE08 24400E01 */  and        $t0, $t0, $t6
/* 5BA2C 8006DE0C 23186900 */  subu       $v1, $v1, $t1
/* 5BA30 8006DE10 23400901 */  subu       $t0, $t0, $t1
/* 5BA34 8006DE14 23480301 */  subu       $t1, $t0, $v1
/* 5BA38 8006DE18 4B003715 */  bne        $t1, $s7, .L8006DF48
/* 5BA3C 8006DE1C 24186D00 */   and       $v1, $v1, $t5
/* 5BA40 8006DE20 24400D01 */  and        $t0, $t0, $t5
/* 5BA44 8006DE24 00008348 */  mtc2       $v1, $0 /* handwritten instruction */
/* 5BA48 8006DE28 00108848 */  mtc2       $t0, $2 /* handwritten instruction */
/* 5BA4C 8006DE2C 00208848 */  mtc2       $t0, $4 /* handwritten instruction */
/* 5BA50 8006DE30 C3551D00 */  sra        $t2, $sp, 23
/* 5BA54 8006DE34 21405401 */  addu       $t0, $t2, $s4
/* 5BA58 8006DE38 21485601 */  addu       $t1, $t2, $s6
/* 5BA5C 8006DE3C FF000831 */  andi       $t0, $t0, 0xFF
/* 5BA60 8006DE40 FF002931 */  andi       $t1, $t1, 0xFF
/* 5BA64 8006DE44 23502801 */  subu       $t2, $t1, $t0
/* 5BA68 8006DE48 3F005815 */  bne        $t2, $t8, .L8006DF48
/* 5BA6C 8006DE4C 80FF0825 */   addiu     $t0, $t0, -0x80
/* 5BA70 8006DE50 80FF2925 */  addiu      $t1, $t1, -0x80
/* 5BA74 8006DE54 00088848 */  mtc2       $t0, $1 /* handwritten instruction */
/* 5BA78 8006DE58 00188948 */  mtc2       $t1, $3 /* handwritten instruction */
/* 5BA7C 8006DE5C 00288948 */  mtc2       $t1, $5 /* handwritten instruction */
/* 5BA80 8006DE60 001E1100 */  sll        $v1, $s1, 24
/* 5BA84 8006DE64 028A1100 */  srl        $s1, $s1, 8
/* 5BA88 8006DE68 3000284A */  RTPT
/* 5BA8C 8006DE6C 21C81102 */  addu       $t9, $s0, $s1
/* 5BA90 8006DE70 02821000 */  srl        $s0, $s0, 8
/* 5BA94 8006DE74 25800302 */  or         $s0, $s0, $v1
/* 5BA98 8006DE78 021A1000 */  srl        $v1, $s0, 8
/* 5BA9C 8006DE7C 21C82303 */  addu       $t9, $t9, $v1
/* 5BAA0 8006DE80 00CE1900 */  sll        $t9, $t9, 24
/* 5BAA4 8006DE84 25883902 */  or         $s1, $s1, $t9
/* 5BAA8 8006DE88 001E1100 */  sll        $v1, $s1, 24
/* 5BAAC 8006DE8C 028A1100 */  srl        $s1, $s1, 8
/* 5BAB0 8006DE90 21E01102 */  addu       $gp, $s0, $s1
/* 5BAB4 8006DE94 02821000 */  srl        $s0, $s0, 8
/* 5BAB8 8006DE98 25800302 */  or         $s0, $s0, $v1
/* 5BABC 8006DE9C 021A1000 */  srl        $v1, $s0, 8
/* 5BAC0 8006DEA0 21E08303 */  addu       $gp, $gp, $v1
/* 5BAC4 8006DEA4 00E61C00 */  sll        $gp, $gp, 24
/* 5BAC8 8006DEA8 25883C02 */  or         $s1, $s1, $gp
/* 5BACC 8006DEAC 001E1100 */  sll        $v1, $s1, 24
/* 5BAD0 8006DEB0 028A1100 */  srl        $s1, $s1, 8
/* 5BAD4 8006DEB4 21E81102 */  addu       $sp, $s0, $s1
/* 5BAD8 8006DEB8 02821000 */  srl        $s0, $s0, 8
/* 5BADC 8006DEBC 25800302 */  or         $s0, $s0, $v1
/* 5BAE0 8006DEC0 021A1000 */  srl        $v1, $s0, 8
/* 5BAE4 8006DEC4 21E8A303 */  addu       $sp, $sp, $v1
/* 5BAE8 8006DEC8 00EE1D00 */  sll        $sp, $sp, 24
/* 5BAEC 8006DECC 25883D02 */  or         $s1, $s1, $sp
/* 5BAF0 8006DED0 03CE1900 */  sra        $t9, $t9, 24
/* 5BAF4 8006DED4 C3E11C00 */  sra        $gp, $gp, 7
/* 5BAF8 8006DED8 FFFF3933 */  andi       $t9, $t9, 0xFFFF
/* 5BAFC 8006DEDC 00600348 */  mfc2       $v1, $12 /* handwritten instruction */
/* 5BB00 8006DEE0 00F84948 */  cfc2       $t1, $31 /* handwritten instruction */
/* 5BB04 8006DEE4 00680848 */  mfc2       $t0, $13 /* handwritten instruction */
/* 5BB08 8006DEE8 804B0900 */  sll        $t1, $t1, 14
/* 5BB0C 8006DEEC 16002005 */  bltz       $t1, .L8006DF48
/* 5BB10 8006DEF0 24486800 */   and       $t1, $v1, $t0
/* 5BB14 8006DEF4 23186C00 */  subu       $v1, $v1, $t4
/* 5BB18 8006DEF8 23400C01 */  subu       $t0, $t0, $t4
/* 5BB1C 8006DEFC 27186800 */  nor        $v1, $v1, $t0
/* 5BB20 8006DF00 25186900 */  or         $v1, $v1, $t1
/* 5BB24 8006DF04 10006004 */  bltz       $v1, .L8006DF48
/* 5BB28 8006DF08 001C0300 */   sll       $v1, $v1, 16
/* 5BB2C 8006DF0C 0E006004 */  bltz       $v1, .L8006DF48
/* 5BB30 8006DF10 0052033C */   lui       $v1, (0x52000000 >> 16)
/* 5BB34 8006DF14 4800288C */  lw         $t0, (0x1F800048 & 0xFFFF)($at)
/* 5BB38 8006DF18 040043AC */  sw         $v1, 0x4($v0)
/* 5BB3C 8006DF1C 0C0048AC */  sw         $t0, 0xC($v0)
/* 5BB40 8006DF20 00006A8D */  lw         $t2, 0x0($t3)
/* 5BB44 8006DF24 001A0200 */  sll        $v1, $v0, 8
/* 5BB48 8006DF28 021A0300 */  srl        $v1, $v1, 8
/* 5BB4C 8006DF2C 0004093C */  lui        $t1, (0x4000000 >> 16)
/* 5BB50 8006DF30 25504901 */  or         $t2, $t2, $t1
/* 5BB54 8006DF34 00004AAC */  sw         $t2, 0x0($v0)
/* 5BB58 8006DF38 08004CE8 */  swc2       $12, 0x8($v0)
/* 5BB5C 8006DF3C 10004DE8 */  swc2       $13, 0x10($v0)
/* 5BB60 8006DF40 000063AD */  sw         $v1, 0x0($t3)
/* 5BB64 8006DF44 14004224 */  addiu      $v0, $v0, 0x14
.L8006DF48:
/* 5BB68 8006DF48 001E1100 */  sll        $v1, $s1, 24
/* 5BB6C 8006DF4C 028A1100 */  srl        $s1, $s1, 8
/* 5BB70 8006DF50 21C81102 */  addu       $t9, $s0, $s1
/* 5BB74 8006DF54 02821000 */  srl        $s0, $s0, 8
/* 5BB78 8006DF58 25800302 */  or         $s0, $s0, $v1
/* 5BB7C 8006DF5C 021A1000 */  srl        $v1, $s0, 8
/* 5BB80 8006DF60 21C82303 */  addu       $t9, $t9, $v1
/* 5BB84 8006DF64 00CE1900 */  sll        $t9, $t9, 24
/* 5BB88 8006DF68 25883902 */  or         $s1, $s1, $t9
/* 5BB8C 8006DF6C 001E1100 */  sll        $v1, $s1, 24
/* 5BB90 8006DF70 028A1100 */  srl        $s1, $s1, 8
/* 5BB94 8006DF74 21E01102 */  addu       $gp, $s0, $s1
/* 5BB98 8006DF78 02821000 */  srl        $s0, $s0, 8
/* 5BB9C 8006DF7C 25800302 */  or         $s0, $s0, $v1
/* 5BBA0 8006DF80 021A1000 */  srl        $v1, $s0, 8
/* 5BBA4 8006DF84 21E08303 */  addu       $gp, $gp, $v1
/* 5BBA8 8006DF88 00E61C00 */  sll        $gp, $gp, 24
/* 5BBAC 8006DF8C 25883C02 */  or         $s1, $s1, $gp
/* 5BBB0 8006DF90 001E1100 */  sll        $v1, $s1, 24
/* 5BBB4 8006DF94 028A1100 */  srl        $s1, $s1, 8
/* 5BBB8 8006DF98 21E81102 */  addu       $sp, $s0, $s1
/* 5BBBC 8006DF9C 02821000 */  srl        $s0, $s0, 8
/* 5BBC0 8006DFA0 25800302 */  or         $s0, $s0, $v1
/* 5BBC4 8006DFA4 021A1000 */  srl        $v1, $s0, 8
/* 5BBC8 8006DFA8 21E8A303 */  addu       $sp, $sp, $v1
/* 5BBCC 8006DFAC 00EE1D00 */  sll        $sp, $sp, 24
/* 5BBD0 8006DFB0 25883D02 */  or         $s1, $s1, $sp
/* 5BBD4 8006DFB4 03CE1900 */  sra        $t9, $t9, 24
/* 5BBD8 8006DFB8 C3E11C00 */  sra        $gp, $gp, 7
/* 5BBDC 8006DFBC FFFF3933 */  andi       $t9, $t9, 0xFFFF
/* 5BBE0 8006DFC0 8CFFE015 */  bnez       $t7, .L8006DDF4
/* 5BBE4 8006DFC4 FFFFEF25 */   addiu     $t7, $t7, -0x1
/* 5BBE8 8006DFC8 0800CF8C */  lw         $t7, 0x8($a2)
/* 5BBEC 8006DFCC 00E1033C */  lui        $v1, (0xE1000A20 >> 16)
/* 5BBF0 8006DFD0 200A6334 */  ori        $v1, $v1, (0xE1000A20 & 0xFFFF)
/* 5BBF4 8006DFD4 040043AC */  sw         $v1, 0x4($v0)
/* 5BBF8 8006DFD8 080040AC */  sw         $zero, 0x8($v0)
/* 5BBFC 8006DFDC 00006A8D */  lw         $t2, 0x0($t3)
/* 5BC00 8006DFE0 001A0200 */  sll        $v1, $v0, 8
/* 5BC04 8006DFE4 0002093C */  lui        $t1, (0x2000000 >> 16)
/* 5BC08 8006DFE8 25504901 */  or         $t2, $t2, $t1
/* 5BC0C 8006DFEC 00004AAC */  sw         $t2, 0x0($v0)
/* 5BC10 8006DFF0 021A0300 */  srl        $v1, $v1, 8
/* 5BC14 8006DFF4 000063AD */  sw         $v1, 0x0($t3)
/* 5BC18 8006DFF8 0C004224 */  addiu      $v0, $v0, 0xC
/* 5BC1C 8006DFFC 1230103C */  lui        $s0, (0x30125400 >> 16)
/* 5BC20 8006E000 00541036 */  ori        $s0, $s0, (0x30125400 & 0xFFFF)
/* 5BC24 8006E004 3549113C */  lui        $s1, (0x493583FE >> 16)
/* 5BC28 8006E008 56000104 */  bgez       $zero, .L8006E164
/* 5BC2C 8006E00C FE833136 */   ori       $s1, $s1, (0x493583FE & 0xFFFF)
.L8006E010:
/* 5BC30 8006E010 25403C03 */  or         $t0, $t9, $gp
/* 5BC34 8006E014 3000298C */  lw         $t1, (0x1F800030 & 0xFFFF)($at)
/* 5BC38 8006E018 21181301 */  addu       $v1, $t0, $s3
/* 5BC3C 8006E01C 21401501 */  addu       $t0, $t0, $s5
/* 5BC40 8006E020 24186E00 */  and        $v1, $v1, $t6
/* 5BC44 8006E024 24400E01 */  and        $t0, $t0, $t6
/* 5BC48 8006E028 23186900 */  subu       $v1, $v1, $t1
/* 5BC4C 8006E02C 23400901 */  subu       $t0, $t0, $t1
/* 5BC50 8006E030 23480301 */  subu       $t1, $t0, $v1
/* 5BC54 8006E034 4B003715 */  bne        $t1, $s7, .L8006E164
/* 5BC58 8006E038 24186D00 */   and       $v1, $v1, $t5
/* 5BC5C 8006E03C 24400D01 */  and        $t0, $t0, $t5
/* 5BC60 8006E040 00008348 */  mtc2       $v1, $0 /* handwritten instruction */
/* 5BC64 8006E044 00108848 */  mtc2       $t0, $2 /* handwritten instruction */
/* 5BC68 8006E048 00208848 */  mtc2       $t0, $4 /* handwritten instruction */
/* 5BC6C 8006E04C C3551D00 */  sra        $t2, $sp, 23
/* 5BC70 8006E050 21405401 */  addu       $t0, $t2, $s4
/* 5BC74 8006E054 21485601 */  addu       $t1, $t2, $s6
/* 5BC78 8006E058 FF000831 */  andi       $t0, $t0, 0xFF
/* 5BC7C 8006E05C FF002931 */  andi       $t1, $t1, 0xFF
/* 5BC80 8006E060 23502801 */  subu       $t2, $t1, $t0
/* 5BC84 8006E064 3F005815 */  bne        $t2, $t8, .L8006E164
/* 5BC88 8006E068 80FF0825 */   addiu     $t0, $t0, -0x80
/* 5BC8C 8006E06C 80FF2925 */  addiu      $t1, $t1, -0x80
/* 5BC90 8006E070 00088848 */  mtc2       $t0, $1 /* handwritten instruction */
/* 5BC94 8006E074 00188948 */  mtc2       $t1, $3 /* handwritten instruction */
/* 5BC98 8006E078 00288948 */  mtc2       $t1, $5 /* handwritten instruction */
/* 5BC9C 8006E07C 001E1100 */  sll        $v1, $s1, 24
/* 5BCA0 8006E080 028A1100 */  srl        $s1, $s1, 8
/* 5BCA4 8006E084 3000284A */  RTPT
/* 5BCA8 8006E088 21C81102 */  addu       $t9, $s0, $s1
/* 5BCAC 8006E08C 02821000 */  srl        $s0, $s0, 8
/* 5BCB0 8006E090 25800302 */  or         $s0, $s0, $v1
/* 5BCB4 8006E094 021A1000 */  srl        $v1, $s0, 8
/* 5BCB8 8006E098 21C82303 */  addu       $t9, $t9, $v1
/* 5BCBC 8006E09C 00CE1900 */  sll        $t9, $t9, 24
/* 5BCC0 8006E0A0 25883902 */  or         $s1, $s1, $t9
/* 5BCC4 8006E0A4 001E1100 */  sll        $v1, $s1, 24
/* 5BCC8 8006E0A8 028A1100 */  srl        $s1, $s1, 8
/* 5BCCC 8006E0AC 21E01102 */  addu       $gp, $s0, $s1
/* 5BCD0 8006E0B0 02821000 */  srl        $s0, $s0, 8
/* 5BCD4 8006E0B4 25800302 */  or         $s0, $s0, $v1
/* 5BCD8 8006E0B8 021A1000 */  srl        $v1, $s0, 8
/* 5BCDC 8006E0BC 21E08303 */  addu       $gp, $gp, $v1
/* 5BCE0 8006E0C0 00E61C00 */  sll        $gp, $gp, 24
/* 5BCE4 8006E0C4 25883C02 */  or         $s1, $s1, $gp
/* 5BCE8 8006E0C8 001E1100 */  sll        $v1, $s1, 24
/* 5BCEC 8006E0CC 028A1100 */  srl        $s1, $s1, 8
/* 5BCF0 8006E0D0 21E81102 */  addu       $sp, $s0, $s1
/* 5BCF4 8006E0D4 02821000 */  srl        $s0, $s0, 8
/* 5BCF8 8006E0D8 25800302 */  or         $s0, $s0, $v1
/* 5BCFC 8006E0DC 021A1000 */  srl        $v1, $s0, 8
/* 5BD00 8006E0E0 21E8A303 */  addu       $sp, $sp, $v1
/* 5BD04 8006E0E4 00EE1D00 */  sll        $sp, $sp, 24
/* 5BD08 8006E0E8 25883D02 */  or         $s1, $s1, $sp
/* 5BD0C 8006E0EC 03CE1900 */  sra        $t9, $t9, 24
/* 5BD10 8006E0F0 C3E11C00 */  sra        $gp, $gp, 7
/* 5BD14 8006E0F4 FFFF3933 */  andi       $t9, $t9, 0xFFFF
/* 5BD18 8006E0F8 00600348 */  mfc2       $v1, $12 /* handwritten instruction */
/* 5BD1C 8006E0FC 00F84948 */  cfc2       $t1, $31 /* handwritten instruction */
/* 5BD20 8006E100 00680848 */  mfc2       $t0, $13 /* handwritten instruction */
/* 5BD24 8006E104 804B0900 */  sll        $t1, $t1, 14
/* 5BD28 8006E108 16002005 */  bltz       $t1, .L8006E164
/* 5BD2C 8006E10C 24486800 */   and       $t1, $v1, $t0
/* 5BD30 8006E110 23186C00 */  subu       $v1, $v1, $t4
/* 5BD34 8006E114 23400C01 */  subu       $t0, $t0, $t4
/* 5BD38 8006E118 27186800 */  nor        $v1, $v1, $t0
/* 5BD3C 8006E11C 25186900 */  or         $v1, $v1, $t1
/* 5BD40 8006E120 10006004 */  bltz       $v1, .L8006E164
/* 5BD44 8006E124 001C0300 */   sll       $v1, $v1, 16
/* 5BD48 8006E128 0E006004 */  bltz       $v1, .L8006E164
/* 5BD4C 8006E12C 0052033C */   lui       $v1, (0x52000000 >> 16)
/* 5BD50 8006E130 4C00288C */  lw         $t0, (0x1F80004C & 0xFFFF)($at)
/* 5BD54 8006E134 040043AC */  sw         $v1, 0x4($v0)
/* 5BD58 8006E138 0C0048AC */  sw         $t0, 0xC($v0)
/* 5BD5C 8006E13C 00006A8D */  lw         $t2, 0x0($t3)
/* 5BD60 8006E140 001A0200 */  sll        $v1, $v0, 8
/* 5BD64 8006E144 021A0300 */  srl        $v1, $v1, 8
/* 5BD68 8006E148 0004093C */  lui        $t1, (0x4000000 >> 16)
/* 5BD6C 8006E14C 25504901 */  or         $t2, $t2, $t1
/* 5BD70 8006E150 00004AAC */  sw         $t2, 0x0($v0)
/* 5BD74 8006E154 08004CE8 */  swc2       $12, 0x8($v0)
/* 5BD78 8006E158 10004DE8 */  swc2       $13, 0x10($v0)
/* 5BD7C 8006E15C 000063AD */  sw         $v1, 0x0($t3)
/* 5BD80 8006E160 14004224 */  addiu      $v0, $v0, 0x14
.L8006E164:
/* 5BD84 8006E164 001E1100 */  sll        $v1, $s1, 24
/* 5BD88 8006E168 028A1100 */  srl        $s1, $s1, 8
/* 5BD8C 8006E16C 21C81102 */  addu       $t9, $s0, $s1
/* 5BD90 8006E170 02821000 */  srl        $s0, $s0, 8
/* 5BD94 8006E174 25800302 */  or         $s0, $s0, $v1
/* 5BD98 8006E178 021A1000 */  srl        $v1, $s0, 8
/* 5BD9C 8006E17C 21C82303 */  addu       $t9, $t9, $v1
/* 5BDA0 8006E180 00CE1900 */  sll        $t9, $t9, 24
/* 5BDA4 8006E184 25883902 */  or         $s1, $s1, $t9
/* 5BDA8 8006E188 001E1100 */  sll        $v1, $s1, 24
/* 5BDAC 8006E18C 028A1100 */  srl        $s1, $s1, 8
/* 5BDB0 8006E190 21E01102 */  addu       $gp, $s0, $s1
/* 5BDB4 8006E194 02821000 */  srl        $s0, $s0, 8
/* 5BDB8 8006E198 25800302 */  or         $s0, $s0, $v1
/* 5BDBC 8006E19C 021A1000 */  srl        $v1, $s0, 8
/* 5BDC0 8006E1A0 21E08303 */  addu       $gp, $gp, $v1
/* 5BDC4 8006E1A4 00E61C00 */  sll        $gp, $gp, 24
/* 5BDC8 8006E1A8 25883C02 */  or         $s1, $s1, $gp
/* 5BDCC 8006E1AC 001E1100 */  sll        $v1, $s1, 24
/* 5BDD0 8006E1B0 028A1100 */  srl        $s1, $s1, 8
/* 5BDD4 8006E1B4 21E81102 */  addu       $sp, $s0, $s1
/* 5BDD8 8006E1B8 02821000 */  srl        $s0, $s0, 8
/* 5BDDC 8006E1BC 25800302 */  or         $s0, $s0, $v1
/* 5BDE0 8006E1C0 021A1000 */  srl        $v1, $s0, 8
/* 5BDE4 8006E1C4 21E8A303 */  addu       $sp, $sp, $v1
/* 5BDE8 8006E1C8 00EE1D00 */  sll        $sp, $sp, 24
/* 5BDEC 8006E1CC 25883D02 */  or         $s1, $s1, $sp
/* 5BDF0 8006E1D0 03CE1900 */  sra        $t9, $t9, 24
/* 5BDF4 8006E1D4 C3E11C00 */  sra        $gp, $gp, 7
/* 5BDF8 8006E1D8 FFFF3933 */  andi       $t9, $t9, 0xFFFF
/* 5BDFC 8006E1DC 8CFFE015 */  bnez       $t7, .L8006E010
/* 5BE00 8006E1E0 FFFFEF25 */   addiu     $t7, $t7, -0x1
/* 5BE04 8006E1E4 00E1033C */  lui        $v1, (0xE1000A40 >> 16)
/* 5BE08 8006E1E8 400A6334 */  ori        $v1, $v1, (0xE1000A40 & 0xFFFF)
/* 5BE0C 8006E1EC 040043AC */  sw         $v1, 0x4($v0)
/* 5BE10 8006E1F0 080040AC */  sw         $zero, 0x8($v0)
/* 5BE14 8006E1F4 00006A8D */  lw         $t2, 0x0($t3)
/* 5BE18 8006E1F8 001A0200 */  sll        $v1, $v0, 8
/* 5BE1C 8006E1FC 0002093C */  lui        $t1, (0x2000000 >> 16)
/* 5BE20 8006E200 25504901 */  or         $t2, $t2, $t1
/* 5BE24 8006E204 00004AAC */  sw         $t2, 0x0($v0)
/* 5BE28 8006E208 021A0300 */  srl        $v1, $v1, 8
/* 5BE2C 8006E20C 000063AD */  sw         $v1, 0x0($t3)
/* 5BE30 8006E210 0C004224 */  addiu      $v0, $v0, 0xC
.L8006E214:
/* 5BE34 8006E214 0000C68C */  lw         $a2, 0x0($a2)
/* 5BE38 8006E218 B4FE0104 */  bgez       $zero, .L8006DCEC
/* 5BE3C 8006E21C 00000000 */   nop
.L8006E220:
/* 5BE40 8006E220 10018424 */  addiu      $a0, $a0, 0x110
/* 5BE44 8006E224 88005226 */  addiu      $s2, $s2, 0x88
/* 5BE48 8006E228 9AFEE014 */  bnez       $a3, .L8006DC94
/* 5BE4C 8006E22C FFFFE724 */   addiu     $a3, $a3, -0x1
.L8006E230:
/* 5BE50 8006E230 0C00A2AC */  sw         $v0, 0xC($a1)
/* 5BE54 8006E234 2C003F8C */  lw         $ra, (0x1F80002C & 0xFFFF)($at)
/* 5BE58 8006E238 28003E8C */  lw         $fp, (0x1F800028 & 0xFFFF)($at)
/* 5BE5C 8006E23C 24003D8C */  lw         $sp, (0x1F800024 & 0xFFFF)($at)
/* 5BE60 8006E240 20003C8C */  lw         $gp, (0x1F800020 & 0xFFFF)($at)
/* 5BE64 8006E244 1C00378C */  lw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 5BE68 8006E248 1800368C */  lw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 5BE6C 8006E24C 1400358C */  lw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 5BE70 8006E250 1000348C */  lw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 5BE74 8006E254 0C00338C */  lw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 5BE78 8006E258 0800328C */  lw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 5BE7C 8006E25C 0400318C */  lw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 5BE80 8006E260 0000308C */  lw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 5BE84 8006E264 0800E003 */  jr         $ra
/* 5BE88 8006E268 00000000 */   nop
.size RedBeaker_RenderRain, . - RedBeaker_RenderRain
