.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel RenderWeather
/* 5D5C8 8006F9A8 801F013C */  lui        $at, (0x1F80002C >> 16)
/* 5D5CC 8006F9AC 000030AC */  sw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 5D5D0 8006F9B0 040031AC */  sw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 5D5D4 8006F9B4 080032AC */  sw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 5D5D8 8006F9B8 0C0033AC */  sw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 5D5DC 8006F9BC 100034AC */  sw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 5D5E0 8006F9C0 140035AC */  sw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 5D5E4 8006F9C4 180036AC */  sw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 5D5E8 8006F9C8 1C0037AC */  sw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 5D5EC 8006F9CC 20003CAC */  sw         $gp, (0x1F800020 & 0xFFFF)($at)
/* 5D5F0 8006F9D0 24003DAC */  sw         $sp, (0x1F800024 & 0xFFFF)($at)
/* 5D5F4 8006F9D4 28003EAC */  sw         $fp, (0x1F800028 & 0xFFFF)($at)
/* 5D5F8 8006F9D8 2C003FAC */  sw         $ra, (0x1F80002C & 0xFFFF)($at)
/* 5D5FC 8006F9DC 1000BE8F */  lw         $fp, 0x10($sp)
/* 5D600 8006F9E0 0028C048 */  ctc2       $zero, $5 /* handwritten instruction */
/* 5D604 8006F9E4 0030C048 */  ctc2       $zero, $6 /* handwritten instruction */
/* 5D608 8006F9E8 0038C048 */  ctc2       $zero, $7 /* handwritten instruction */
/* 5D60C 8006F9EC FFFFE724 */  addiu      $a3, $a3, -0x1
/* 5D610 8006F9F0 0C00A28C */  lw         $v0, 0xC($a1)
/* 5D614 8006F9F4 28008B8C */  lw         $t3, 0x28($a0)
/* 5D618 8006F9F8 2C008C8C */  lw         $t4, 0x2C($a0)
/* 5D61C 8006F9FC 30008D8C */  lw         $t5, 0x30($a0)
/* 5D620 8006FA00 34008E8C */  lw         $t6, 0x34($a0)
/* 5D624 8006FA04 38008F8C */  lw         $t7, 0x38($a0)
/* 5D628 8006FA08 0000CB48 */  ctc2       $t3, $0 /* handwritten instruction */
/* 5D62C 8006FA0C 08009084 */  lh         $s0, 0x8($a0)
/* 5D630 8006FA10 0008CC48 */  ctc2       $t4, $1 /* handwritten instruction */
/* 5D634 8006FA14 0010CD48 */  ctc2       $t5, $2 /* handwritten instruction */
/* 5D638 8006FA18 0018CE48 */  ctc2       $t6, $3 /* handwritten instruction */
/* 5D63C 8006FA1C 82BF010C */  jal        TRIG_AngleSinCos_r16r17r18
/* 5D640 8006FA20 0020CF48 */   ctc2      $t7, $4 /* handwritten instruction */
/* 5D644 8006FA24 83901200 */  sra        $s2, $s2, 2
/* 5D648 8006FA28 83881100 */  sra        $s1, $s1, 2
/* 5D64C 8006FA2C 00045226 */  addiu      $s2, $s2, 0x400
/* 5D650 8006FA30 00043126 */  addiu      $s1, $s1, 0x400
/* 5D654 8006FA34 0004033C */  lui        $v1, (0x4000000 >> 16)
/* 5D658 8006FA38 25187100 */  or         $v1, $v1, $s1
/* 5D65C 8006FA3C 380023AC */  sw         $v1, 0x38($at)
/* 5D660 8006FA40 3C0032AC */  sw         $s2, 0x3C($at)
/* 5D664 8006FA44 20008384 */  lh         $v1, 0x20($a0)
/* 5D668 8006FA48 22008884 */  lh         $t0, 0x22($a0)
/* 5D66C 8006FA4C 1800898C */  lw         $t1, 0x18($a0)
/* 5D670 8006FA50 20008C8C */  lw         $t4, 0x20($a0)
/* 5D674 8006FA54 F4008B8C */  lw         $t3, 0xF4($a0)
/* 5D678 8006FA58 C01B0300 */  sll        $v1, $v1, 15
/* 5D67C 8006FA5C C0430800 */  sll        $t0, $t0, 15
/* 5D680 8006FA60 00C0C348 */  ctc2       $v1, $24 /* handwritten instruction */
/* 5D684 8006FA64 00C8C848 */  ctc2       $t0, $25 /* handwritten instruction */
/* 5D688 8006FA68 00D0C948 */  ctc2       $t1, $26 /* handwritten instruction */
/* 5D68C 8006FA6C 0000CF8C */  lw         $t7, 0x0($a2)
/* 5D690 8006FA70 0F00C017 */  bnez       $fp, .L8006FAB0
/* 5D694 8006FA74 0400C394 */   lhu       $v1, 0x4($a2)
/* 5D698 8006FA78 0600C894 */  lhu        $t0, 0x6($a2)
/* 5D69C 8006FA7C 0C006F10 */  beq        $v1, $t7, .L8006FAB0
/* 5D6A0 8006FA80 23486F00 */   subu      $t1, $v1, $t7
/* 5D6A4 8006FA84 05002105 */  bgez       $t1, .L8006FA9C
/* 5D6A8 8006FA88 21502801 */   addu      $t2, $t1, $t0
/* 5D6AC 8006FA8C 07004019 */  blez       $t2, .L8006FAAC
/* 5D6B0 8006FA90 2378E801 */   subu      $t7, $t7, $t0
/* 5D6B4 8006FA94 05000104 */  bgez       $zero, .L8006FAAC
/* 5D6B8 8006FA98 21786000 */   addu      $t7, $v1, $zero
.L8006FA9C:
/* 5D6BC 8006FA9C 23502801 */  subu       $t2, $t1, $t0
/* 5D6C0 8006FAA0 02004105 */  bgez       $t2, .L8006FAAC
/* 5D6C4 8006FAA4 2178E801 */   addu      $t7, $t7, $t0
/* 5D6C8 8006FAA8 21786000 */  addu       $t7, $v1, $zero
.L8006FAAC:
/* 5D6CC 8006FAAC 0000CFAC */  sw         $t7, 0x0($a2)
.L8006FAB0:
/* 5D6D0 8006FAB0 0800D38C */  lw         $s3, 0x8($a2)
/* 5D6D4 8006FAB4 0C00D48C */  lw         $s4, 0xC($a2)
/* 5D6D8 8006FAB8 FEFF0D3C */  lui        $t5, (0xFFFEFFFF >> 16)
/* 5D6DC 8006FABC FFFFAD35 */  ori        $t5, $t5, (0xFFFEFFFF & 0xFFFF)
/* 5D6E0 8006FAC0 FE070E3C */  lui        $t6, (0x7FE07FF >> 16)
/* 5D6E4 8006FAC4 FF07CE35 */  ori        $t6, $t6, (0x7FE07FF & 0xFFFF)
/* 5D6E8 8006FAC8 1000D78C */  lw         $s7, 0x10($a2)
/* 5D6EC 8006FACC 1400D88C */  lw         $t8, 0x14($a2)
/* 5D6F0 8006FAD0 24B8ED02 */  and        $s7, $s7, $t5
/* 5D6F4 8006FAD4 21A87702 */  addu       $s5, $s3, $s7
/* 5D6F8 8006FAD8 21B09802 */  addu       $s6, $s4, $t8
/* 5D6FC 8006FADC 0300C017 */  bnez       $fp, .L8006FAEC
/* 5D700 8006FAE0 24A8AD02 */   and       $s5, $s5, $t5
/* 5D704 8006FAE4 0800D5AC */  sw         $s5, 0x8($a2)
/* 5D708 8006FAE8 0C00D6AC */  sw         $s6, 0xC($a2)
.L8006FAEC:
/* 5D70C 8006FAEC 43B81700 */  sra        $s7, $s7, 1
/* 5D710 8006FAF0 43C01800 */  sra        $t8, $t8, 1
/* 5D714 8006FAF4 24B8ED02 */  and        $s7, $s7, $t5
/* 5D718 8006FAF8 21987702 */  addu       $s3, $s3, $s7
/* 5D71C 8006FAFC 24986D02 */  and        $s3, $s3, $t5
/* 5D720 8006FB00 21A09802 */  addu       $s4, $s4, $t8
/* 5D724 8006FB04 0000838C */  lw         $v1, 0x0($a0)
/* 5D728 8006FB08 04008884 */  lh         $t0, 0x4($a0)
/* 5D72C 8006FB0C 1800C98C */  lw         $t1, 0x18($a2)
/* 5D730 8006FB10 1C00CA84 */  lh         $t2, 0x1C($a2)
/* 5D734 8006FB14 0300C017 */  bnez       $fp, .L8006FB24
/* 5D738 8006FB18 24186D00 */   and       $v1, $v1, $t5
/* 5D73C 8006FB1C 1800C3AC */  sw         $v1, 0x18($a2)
/* 5D740 8006FB20 1C00C8A4 */  sh         $t0, 0x1C($a2)
.L8006FB24:
/* 5D744 8006FB24 23486900 */  subu       $t1, $v1, $t1
/* 5D748 8006FB28 23500A01 */  subu       $t2, $t0, $t2
/* 5D74C 8006FB2C 03BD0900 */  sra        $s7, $t1, 20
/* 5D750 8006FB30 40BC1700 */  sll        $s7, $s7, 17
/* 5D754 8006FB34 004C0900 */  sll        $t1, $t1, 16
/* 5D758 8006FB38 C34C0900 */  sra        $t1, $t1, 19
/* 5D75C 8006FB3C FFFF2931 */  andi       $t1, $t1, 0xFFFF
/* 5D760 8006FB40 25483701 */  or         $t1, $t1, $s7
/* 5D764 8006FB44 C3500A00 */  sra        $t2, $t2, 3
/* 5D768 8006FB48 23486900 */  subu       $t1, $v1, $t1
/* 5D76C 8006FB4C 23500A01 */  subu       $t2, $t0, $t2
/* 5D770 8006FB50 24482D01 */  and        $t1, $t1, $t5
/* 5D774 8006FB54 23986902 */  subu       $s3, $s3, $t1
/* 5D778 8006FB58 23A8A302 */  subu       $s5, $s5, $v1
/* 5D77C 8006FB5C 24986D02 */  and        $s3, $s3, $t5
/* 5D780 8006FB60 24A8AD02 */  and        $s5, $s5, $t5
/* 5D784 8006FB64 21987102 */  addu       $s3, $s3, $s1
/* 5D788 8006FB68 21A8B102 */  addu       $s5, $s5, $s1
/* 5D78C 8006FB6C 24986D02 */  and        $s3, $s3, $t5
/* 5D790 8006FB70 24A8AD02 */  and        $s5, $s5, $t5
/* 5D794 8006FB74 23A08A02 */  subu       $s4, $s4, $t2
/* 5D798 8006FB78 23B0C802 */  subu       $s6, $s6, $t0
/* 5D79C 8006FB7C 21A09202 */  addu       $s4, $s4, $s2
/* 5D7A0 8006FB80 21B0D202 */  addu       $s6, $s6, $s2
/* 5D7A4 8006FB84 23B8B302 */  subu       $s7, $s5, $s3
/* 5D7A8 8006FB88 23C0D402 */  subu       $t8, $s6, $s4
/* 5D7AC 8006FB8C 2000C38C */  lw         $v1, 0x20($a2)
/* 5D7B0 8006FB90 2400C88C */  lw         $t0, 0x24($a2)
/* 5D7B4 8006FB94 2C00C98C */  lw         $t1, 0x2C($a2)
/* 5D7B8 8006FB98 2800D28C */  lw         $s2, 0x28($a2)
/* 5D7BC 8006FB9C 80480900 */  sll        $t1, $t1, 2
/* 5D7C0 8006FBA0 21586901 */  addu       $t3, $t3, $t1
/* 5D7C4 8006FBA4 0052093C */  lui        $t1, (0x52000000 >> 16)
/* 5D7C8 8006FBA8 25186900 */  or         $v1, $v1, $t1
/* 5D7CC 8006FBAC 300023AC */  sw         $v1, 0x30($at)
/* 5D7D0 8006FBB0 340028AC */  sw         $t0, 0x34($at)
/* 5D7D4 8006FBB4 1230103C */  lui        $s0, (0x30125400 >> 16)
/* 5D7D8 8006FBB8 00541036 */  ori        $s0, $s0, (0x30125400 & 0xFFFF)
/* 5D7DC 8006FBBC 3549113C */  lui        $s1, (0x493583FE >> 16)
/* 5D7E0 8006FBC0 58000104 */  bgez       $zero, .L8006FD24
/* 5D7E4 8006FBC4 FE833136 */   ori       $s1, $s1, (0x493583FE & 0xFFFF)
.L8006FBC8:
/* 5D7E8 8006FBC8 25403C03 */  or         $t0, $t9, $gp
/* 5D7EC 8006FBCC 3800298C */  lw         $t1, 0x38($at)
/* 5D7F0 8006FBD0 21181301 */  addu       $v1, $t0, $s3
/* 5D7F4 8006FBD4 21401501 */  addu       $t0, $t0, $s5
/* 5D7F8 8006FBD8 24186E00 */  and        $v1, $v1, $t6
/* 5D7FC 8006FBDC 24400E01 */  and        $t0, $t0, $t6
/* 5D800 8006FBE0 23186900 */  subu       $v1, $v1, $t1
/* 5D804 8006FBE4 23400901 */  subu       $t0, $t0, $t1
/* 5D808 8006FBE8 23480301 */  subu       $t1, $t0, $v1
/* 5D80C 8006FBEC 4D003715 */  bne        $t1, $s7, .L8006FD24
/* 5D810 8006FBF0 24186D00 */   and       $v1, $v1, $t5
/* 5D814 8006FBF4 24400D01 */  and        $t0, $t0, $t5
/* 5D818 8006FBF8 00008348 */  mtc2       $v1, $0 /* handwritten instruction */
/* 5D81C 8006FBFC 00108848 */  mtc2       $t0, $2 /* handwritten instruction */
/* 5D820 8006FC00 00208848 */  mtc2       $t0, $4 /* handwritten instruction */
/* 5D824 8006FC04 42551D00 */  srl        $t2, $sp, 21
/* 5D828 8006FC08 21405401 */  addu       $t0, $t2, $s4
/* 5D82C 8006FC0C 21485601 */  addu       $t1, $t2, $s6
/* 5D830 8006FC10 FF070831 */  andi       $t0, $t0, 0x7FF
/* 5D834 8006FC14 FF072931 */  andi       $t1, $t1, 0x7FF
/* 5D838 8006FC18 23502801 */  subu       $t2, $t1, $t0
/* 5D83C 8006FC1C 3C00238C */  lw         $v1, 0x3C($at)
/* 5D840 8006FC20 40005815 */  bne        $t2, $t8, .L8006FD24
/* 5D844 8006FC24 23400301 */   subu      $t0, $t0, $v1
/* 5D848 8006FC28 23482301 */  subu       $t1, $t1, $v1
/* 5D84C 8006FC2C 00088848 */  mtc2       $t0, $1 /* handwritten instruction */
/* 5D850 8006FC30 00188948 */  mtc2       $t1, $3 /* handwritten instruction */
/* 5D854 8006FC34 00288948 */  mtc2       $t1, $5 /* handwritten instruction */
/* 5D858 8006FC38 001E1100 */  sll        $v1, $s1, 24
/* 5D85C 8006FC3C 028A1100 */  srl        $s1, $s1, 8
/* 5D860 8006FC40 3000284A */  RTPT
/* 5D864 8006FC44 21C81102 */  addu       $t9, $s0, $s1
/* 5D868 8006FC48 02821000 */  srl        $s0, $s0, 8
/* 5D86C 8006FC4C 25800302 */  or         $s0, $s0, $v1
/* 5D870 8006FC50 021A1000 */  srl        $v1, $s0, 8
/* 5D874 8006FC54 21C82303 */  addu       $t9, $t9, $v1
/* 5D878 8006FC58 00CE1900 */  sll        $t9, $t9, 24
/* 5D87C 8006FC5C 25883902 */  or         $s1, $s1, $t9
/* 5D880 8006FC60 001E1100 */  sll        $v1, $s1, 24
/* 5D884 8006FC64 028A1100 */  srl        $s1, $s1, 8
/* 5D888 8006FC68 21E01102 */  addu       $gp, $s0, $s1
/* 5D88C 8006FC6C 02821000 */  srl        $s0, $s0, 8
/* 5D890 8006FC70 25800302 */  or         $s0, $s0, $v1
/* 5D894 8006FC74 021A1000 */  srl        $v1, $s0, 8
/* 5D898 8006FC78 21E08303 */  addu       $gp, $gp, $v1
/* 5D89C 8006FC7C 00E61C00 */  sll        $gp, $gp, 24
/* 5D8A0 8006FC80 25883C02 */  or         $s1, $s1, $gp
/* 5D8A4 8006FC84 001E1100 */  sll        $v1, $s1, 24
/* 5D8A8 8006FC88 028A1100 */  srl        $s1, $s1, 8
/* 5D8AC 8006FC8C 21E81102 */  addu       $sp, $s0, $s1
/* 5D8B0 8006FC90 02821000 */  srl        $s0, $s0, 8
/* 5D8B4 8006FC94 25800302 */  or         $s0, $s0, $v1
/* 5D8B8 8006FC98 021A1000 */  srl        $v1, $s0, 8
/* 5D8BC 8006FC9C 21E8A303 */  addu       $sp, $sp, $v1
/* 5D8C0 8006FCA0 00EE1D00 */  sll        $sp, $sp, 24
/* 5D8C4 8006FCA4 25883D02 */  or         $s1, $s1, $sp
/* 5D8C8 8006FCA8 43CD1900 */  sra        $t9, $t9, 21
/* 5D8CC 8006FCAC 43E11C00 */  sra        $gp, $gp, 5
/* 5D8D0 8006FCB0 FFFF3933 */  andi       $t9, $t9, 0xFFFF
/* 5D8D4 8006FCB4 00600348 */  mfc2       $v1, $12 /* handwritten instruction */
/* 5D8D8 8006FCB8 00F84948 */  cfc2       $t1, $31 /* handwritten instruction */
/* 5D8DC 8006FCBC 00680848 */  mfc2       $t0, $13 /* handwritten instruction */
/* 5D8E0 8006FCC0 804B0900 */  sll        $t1, $t1, 14
/* 5D8E4 8006FCC4 35002005 */  bltz       $t1, .L8006FD9C
/* 5D8E8 8006FCC8 24486800 */   and       $t1, $v1, $t0
/* 5D8EC 8006FCCC 23186C00 */  subu       $v1, $v1, $t4
/* 5D8F0 8006FCD0 23400C01 */  subu       $t0, $t0, $t4
/* 5D8F4 8006FCD4 27186800 */  nor        $v1, $v1, $t0
/* 5D8F8 8006FCD8 25186900 */  or         $v1, $v1, $t1
/* 5D8FC 8006FCDC 2F006004 */  bltz       $v1, .L8006FD9C
/* 5D900 8006FCE0 001C0300 */   sll       $v1, $v1, 16
/* 5D904 8006FCE4 2D006004 */  bltz       $v1, .L8006FD9C
/* 5D908 8006FCE8 3000238C */   lw        $v1, 0x30($at)
/* 5D90C 8006FCEC 3400288C */  lw         $t0, 0x34($at)
/* 5D910 8006FCF0 040043AC */  sw         $v1, 0x4($v0)
/* 5D914 8006FCF4 0C0048AC */  sw         $t0, 0xC($v0)
/* 5D918 8006FCF8 00006A8D */  lw         $t2, 0x0($t3)
/* 5D91C 8006FCFC 001A0200 */  sll        $v1, $v0, 8
/* 5D920 8006FD00 021A0300 */  srl        $v1, $v1, 8
/* 5D924 8006FD04 0004093C */  lui        $t1, (0x4000000 >> 16)
/* 5D928 8006FD08 25504901 */  or         $t2, $t2, $t1
/* 5D92C 8006FD0C 00004AAC */  sw         $t2, 0x0($v0)
/* 5D930 8006FD10 08004CE8 */  swc2       $12, 0x8($v0)
/* 5D934 8006FD14 10004DE8 */  swc2       $13, 0x10($v0)
/* 5D938 8006FD18 000063AD */  sw         $v1, 0x0($t3)
/* 5D93C 8006FD1C 1F000104 */  bgez       $zero, .L8006FD9C
/* 5D940 8006FD20 14004224 */   addiu     $v0, $v0, 0x14
.L8006FD24:
/* 5D944 8006FD24 001E1100 */  sll        $v1, $s1, 24
/* 5D948 8006FD28 028A1100 */  srl        $s1, $s1, 8
/* 5D94C 8006FD2C 21C81102 */  addu       $t9, $s0, $s1
/* 5D950 8006FD30 02821000 */  srl        $s0, $s0, 8
/* 5D954 8006FD34 25800302 */  or         $s0, $s0, $v1
/* 5D958 8006FD38 021A1000 */  srl        $v1, $s0, 8
/* 5D95C 8006FD3C 21C82303 */  addu       $t9, $t9, $v1
/* 5D960 8006FD40 00CE1900 */  sll        $t9, $t9, 24
/* 5D964 8006FD44 25883902 */  or         $s1, $s1, $t9
/* 5D968 8006FD48 001E1100 */  sll        $v1, $s1, 24
/* 5D96C 8006FD4C 028A1100 */  srl        $s1, $s1, 8
/* 5D970 8006FD50 21E01102 */  addu       $gp, $s0, $s1
/* 5D974 8006FD54 02821000 */  srl        $s0, $s0, 8
/* 5D978 8006FD58 25800302 */  or         $s0, $s0, $v1
/* 5D97C 8006FD5C 021A1000 */  srl        $v1, $s0, 8
/* 5D980 8006FD60 21E08303 */  addu       $gp, $gp, $v1
/* 5D984 8006FD64 00E61C00 */  sll        $gp, $gp, 24
/* 5D988 8006FD68 25883C02 */  or         $s1, $s1, $gp
/* 5D98C 8006FD6C 001E1100 */  sll        $v1, $s1, 24
/* 5D990 8006FD70 028A1100 */  srl        $s1, $s1, 8
/* 5D994 8006FD74 21E81102 */  addu       $sp, $s0, $s1
/* 5D998 8006FD78 02821000 */  srl        $s0, $s0, 8
/* 5D99C 8006FD7C 25800302 */  or         $s0, $s0, $v1
/* 5D9A0 8006FD80 021A1000 */  srl        $v1, $s0, 8
/* 5D9A4 8006FD84 21E8A303 */  addu       $sp, $sp, $v1
/* 5D9A8 8006FD88 00EE1D00 */  sll        $sp, $sp, 24
/* 5D9AC 8006FD8C 25883D02 */  or         $s1, $s1, $sp
/* 5D9B0 8006FD90 43CD1900 */  sra        $t9, $t9, 21
/* 5D9B4 8006FD94 43E11C00 */  sra        $gp, $gp, 5
/* 5D9B8 8006FD98 FFFF3933 */  andi       $t9, $t9, 0xFFFF
.L8006FD9C:
/* 5D9BC 8006FD9C 8AFFE015 */  bnez       $t7, .L8006FBC8
/* 5D9C0 8006FDA0 FFFFEF25 */   addiu     $t7, $t7, -0x1
/* 5D9C4 8006FDA4 040052AC */  sw         $s2, 0x4($v0)
/* 5D9C8 8006FDA8 080040AC */  sw         $zero, 0x8($v0)
/* 5D9CC 8006FDAC 00006A8D */  lw         $t2, 0x0($t3)
/* 5D9D0 8006FDB0 001A0200 */  sll        $v1, $v0, 8
/* 5D9D4 8006FDB4 0002093C */  lui        $t1, (0x2000000 >> 16)
/* 5D9D8 8006FDB8 25504901 */  or         $t2, $t2, $t1
/* 5D9DC 8006FDBC 00004AAC */  sw         $t2, 0x0($v0)
/* 5D9E0 8006FDC0 021A0300 */  srl        $v1, $v1, 8
/* 5D9E4 8006FDC4 000063AD */  sw         $v1, 0x0($t3)
/* 5D9E8 8006FDC8 0C004224 */  addiu      $v0, $v0, 0xC
/* 5D9EC 8006FDCC 0C00A2AC */  sw         $v0, 0xC($a1)
/* 5D9F0 8006FDD0 2C003F8C */  lw         $ra, 0x2C($at)
/* 5D9F4 8006FDD4 28003E8C */  lw         $fp, 0x28($at)
/* 5D9F8 8006FDD8 24003D8C */  lw         $sp, 0x24($at)
/* 5D9FC 8006FDDC 20003C8C */  lw         $gp, 0x20($at)
/* 5DA00 8006FDE0 1C00378C */  lw         $s7, 0x1C($at)
/* 5DA04 8006FDE4 1800368C */  lw         $s6, 0x18($at)
/* 5DA08 8006FDE8 1400358C */  lw         $s5, 0x14($at)
/* 5DA0C 8006FDEC 1000348C */  lw         $s4, 0x10($at)
/* 5DA10 8006FDF0 0C00338C */  lw         $s3, 0xC($at)
/* 5DA14 8006FDF4 0800328C */  lw         $s2, 0x8($at)
/* 5DA18 8006FDF8 0400318C */  lw         $s1, 0x4($at)
/* 5DA1C 8006FDFC 0000308C */  lw         $s0, 0x0($at)
/* 5DA20 8006FE00 0800E003 */  jr         $ra
/* 5DA24 8006FE04 00000000 */   nop
.size RenderWeather, . - RenderWeather
