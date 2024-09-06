.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel RenderBucket_Execute
/* 586C8 8006AAA8 C4FFBD27 */  addiu      $sp, $sp, -0x3C
/* 586CC 8006AAAC 1000B0AF */  sw         $s0, 0x10($sp)
/* 586D0 8006AAB0 1400B1AF */  sw         $s1, 0x14($sp)
/* 586D4 8006AAB4 1800B2AF */  sw         $s2, 0x18($sp)
/* 586D8 8006AAB8 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 586DC 8006AABC 2000B4AF */  sw         $s4, 0x20($sp)
/* 586E0 8006AAC0 2400B5AF */  sw         $s5, 0x24($sp)
/* 586E4 8006AAC4 2800B6AF */  sw         $s6, 0x28($sp)
/* 586E8 8006AAC8 2C00B7AF */  sw         $s7, 0x2C($sp)
/* 586EC 8006AACC 3000BCAF */  sw         $gp, 0x30($sp)
/* 586F0 8006AAD0 3400BEAF */  sw         $fp, 0x34($sp)
/* 586F4 8006AAD4 3800BFAF */  sw         $ra, 0x38($sp)
/* 586F8 8006AAD8 801F013C */  lui        $at, (0x1F800058 >> 16)
/* 586FC 8006AADC 00003DAC */  sw         $sp, (0x1F800000 & 0xFFFF)($at)
/* 58700 8006AAE0 0C0025AC */  sw         $a1, (0x1F80000C & 0xFFFF)($at)
/* 58704 8006AAE4 080020AC */  sw         $zero, (0x1F800008 & 0xFFFF)($at)
/* 58708 8006AAE8 00009F8C */  lw         $ra, 0x0($a0)
/* 5870C 8006AAEC 0C00A28C */  lw         $v0, 0xC($a1)
.L8006AAF0:
/* 58710 8006AAF0 0400868C */  lw         $a2, 0x4($a0)
/* 58714 8006AAF4 08008424 */  addiu      $a0, $a0, 0x8
/* 58718 8006AAF8 8C00E013 */  beqz       $ra, .L8006AD2C
/* 5871C 8006AAFC 040024AC */   sw        $a0, (0x1F800004 & 0xFFFF)($at)
/* 58720 8006AB00 7400C38C */  lw         $v1, 0x74($a2)
/* 58724 8006AB04 0800288C */  lw         $t0, (0x1F800008 & 0xFFFF)($at)
/* 58728 8006AB08 10003FAC */  sw         $ra, (0x1F800010 & 0xFFFF)($at)
/* 5872C 8006AB0C 0B006810 */  beq        $v1, $t0, .L8006AB3C
/* 58730 8006AB10 080023AC */   sw        $v1, (0x1F800008 & 0xFFFF)($at)
/* 58734 8006AB14 20006884 */  lh         $t0, 0x20($v1)
/* 58738 8006AB18 22006984 */  lh         $t1, 0x22($v1)
/* 5873C 8006AB1C 18006A8C */  lw         $t2, 0x18($v1)
/* 58740 8006AB20 1C0028A4 */  sh         $t0, (0x1F80001C & 0xFFFF)($at)
/* 58744 8006AB24 1E0029A4 */  sh         $t1, (0x1F80001E & 0xFFFF)($at)
/* 58748 8006AB28 C0430800 */  sll        $t0, $t0, 15
/* 5874C 8006AB2C C04B0900 */  sll        $t1, $t1, 15
/* 58750 8006AB30 00C0C848 */  ctc2       $t0, $24 /* handwritten instruction */
/* 58754 8006AB34 00C8C948 */  ctc2       $t1, $25 /* handwritten instruction */
/* 58758 8006AB38 00D0CA48 */  ctc2       $t2, $26 /* handwritten instruction */
.L8006AB3C:
/* 5875C 8006AB3C B800C38C */  lw         $v1, 0xB8($a2)
/* 58760 8006AB40 BC00C884 */  lh         $t0, 0xBC($a2)
/* 58764 8006AB44 40006930 */  andi       $t1, $v1, 0x40
/* 58768 8006AB48 75002011 */  beqz       $t1, .L8006AD20
/* 5876C 8006AB4C 80006930 */   andi      $t1, $v1, 0x80
/* 58770 8006AB50 73002015 */  bnez       $t1, .L8006AD20
/* 58774 8006AB54 7800CB8C */   lw        $t3, 0x78($a2)
/* 58778 8006AB58 7C00CC8C */  lw         $t4, 0x7C($a2)
/* 5877C 8006AB5C 8000CD8C */  lw         $t5, 0x80($a2)
/* 58780 8006AB60 8400CE8C */  lw         $t6, 0x84($a2)
/* 58784 8006AB64 8800CF8C */  lw         $t7, 0x88($a2)
/* 58788 8006AB68 8C00D08C */  lw         $s0, 0x8C($a2)
/* 5878C 8006AB6C 9000D18C */  lw         $s1, 0x90($a2)
/* 58790 8006AB70 9400D28C */  lw         $s2, 0x94($a2)
/* 58794 8006AB74 0000CB48 */  ctc2       $t3, $0 /* handwritten instruction */
/* 58798 8006AB78 0008CC48 */  ctc2       $t4, $1 /* handwritten instruction */
/* 5879C 8006AB7C 0010CD48 */  ctc2       $t5, $2 /* handwritten instruction */
/* 587A0 8006AB80 0018CE48 */  ctc2       $t6, $3 /* handwritten instruction */
/* 587A4 8006AB84 0020CF48 */  ctc2       $t7, $4 /* handwritten instruction */
/* 587A8 8006AB88 0028D048 */  ctc2       $s0, $5 /* handwritten instruction */
/* 587AC 8006AB8C 0030D148 */  ctc2       $s1, $6 /* handwritten instruction */
/* 587B0 8006AB90 0038D248 */  ctc2       $s2, $7 /* handwritten instruction */
/* 587B4 8006AB94 240023AC */  sw         $v1, (0x1F800024 & 0xFFFF)($at)
/* 587B8 8006AB98 200128AC */  sw         $t0, (0x1F800120 & 0xFFFF)($at)
/* 587BC 8006AB9C 00706830 */  andi       $t0, $v1, 0x7000
/* 587C0 8006ABA0 17000011 */  beqz       $t0, .L8006AC00
/* 587C4 8006ABA4 9800CB8C */   lw        $t3, 0x98($a2)
/* 587C8 8006ABA8 9C00CC8C */  lw         $t4, 0x9C($a2)
/* 587CC 8006ABAC A000CD8C */  lw         $t5, 0xA0($a2)
/* 587D0 8006ABB0 A400CE8C */  lw         $t6, 0xA4($a2)
/* 587D4 8006ABB4 A800CF8C */  lw         $t7, 0xA8($a2)
/* 587D8 8006ABB8 0040CB48 */  ctc2       $t3, $8 /* handwritten instruction */
/* 587DC 8006ABBC 0048CC48 */  ctc2       $t4, $9 /* handwritten instruction */
/* 587E0 8006ABC0 0050CD48 */  ctc2       $t5, $10 /* handwritten instruction */
/* 587E4 8006ABC4 0058CE48 */  ctc2       $t6, $11 /* handwritten instruction */
/* 587E8 8006ABC8 0060CF48 */  ctc2       $t7, $12 /* handwritten instruction */
/* 587EC 8006ABCC 6800E78F */  lw         $a3, 0x68($ra)
/* 587F0 8006ABD0 BE00C884 */  lh         $t0, 0xBE($a2)
/* 587F4 8006ABD4 5300E983 */  lb         $t1, 0x53($ra)
/* 587F8 8006ABD8 5800EA8F */  lw         $t2, 0x58($ra)
/* 587FC 8006ABDC 440028A4 */  sh         $t0, (0x1F800044 & 0xFFFF)($at)
/* 58800 8006ABE0 DA0028A4 */  sh         $t0, (0x1F8000DA & 0xFFFF)($at)
/* 58804 8006ABE4 F20028A4 */  sh         $t0, (0x1F8000F2 & 0xFFFF)($at)
/* 58808 8006ABE8 480029A0 */  sb         $t1, (0x1F800048 & 0xFFFF)($at)
/* 5880C 8006ABEC 4C002AAC */  sw         $t2, (0x1F80004C & 0xFFFF)($at)
/* 58810 8006ABF0 40440800 */  sll        $t0, $t0, 17
/* 58814 8006ABF4 1C0128AC */  sw         $t0, (0x1F80011C & 0xFFFF)($at)
/* 58818 8006ABF8 E00020AC */  sw         $zero, (0x1F8000E0 & 0xFFFF)($at)
/* 5881C 8006ABFC F80020AC */  sw         $zero, (0x1F8000F8 & 0xFFFF)($at)
.L8006AC00:
/* 58820 8006AC00 FF000C3C */  lui        $t4, (0xFF00FF >> 16)
/* 58824 8006AC04 FF008C35 */  ori        $t4, $t4, (0xFF00FF & 0xFFFF)
/* 58828 8006AC08 C400D88C */  lw         $t8, 0xC4($a2)
/* 5882C 8006AC0C C000D78C */  lw         $s7, 0xC0($a2)
/* 58830 8006AC10 F8FF0D3C */  lui        $t5, (0xFFF8FFFF >> 16)
/* 58834 8006AC14 13000013 */  beqz       $t8, .L8006AC64
/* 58838 8006AC18 FFFFAD35 */   ori       $t5, $t5, (0xFFF8FFFF & 0xFFFF)
/* 5883C 8006AC1C 0000E886 */  lh         $t0, 0x0($s7)
/* 58840 8006AC20 00000987 */  lh         $t1, 0x0($t8)
/* 58844 8006AC24 00000000 */  nop
/* 58848 8006AC28 21400901 */  addu       $t0, $t0, $t1
/* 5884C 8006AC2C 300028A4 */  sh         $t0, (0x1F800030 & 0xFFFF)($at)
/* 58850 8006AC30 0200E886 */  lh         $t0, 0x2($s7)
/* 58854 8006AC34 02000987 */  lh         $t1, 0x2($t8)
/* 58858 8006AC38 1800E38E */  lw         $v1, 0x18($s7)
/* 5885C 8006AC3C 21400901 */  addu       $t0, $t0, $t1
/* 58860 8006AC40 320028A4 */  sh         $t0, (0x1F800032 & 0xFFFF)($at)
/* 58864 8006AC44 0400E886 */  lh         $t0, 0x4($s7)
/* 58868 8006AC48 04000987 */  lh         $t1, 0x4($t8)
/* 5886C 8006AC4C 21C00303 */  addu       $t8, $t8, $v1
/* 58870 8006AC50 21400901 */  addu       $t0, $t0, $t1
/* 58874 8006AC54 40400800 */  sll        $t0, $t0, 1
/* 58878 8006AC58 340028AC */  sw         $t0, (0x1F800034 & 0xFFFF)($at)
/* 5887C 8006AC5C 0A000104 */  bgez       $zero, .L8006AC88
/* 58880 8006AC60 21B8E302 */   addu      $s7, $s7, $v1
.L8006AC64:
/* 58884 8006AC64 0000E386 */  lh         $v1, 0x0($s7)
/* 58888 8006AC68 0200E886 */  lh         $t0, 0x2($s7)
/* 5888C 8006AC6C 0400E986 */  lh         $t1, 0x4($s7)
/* 58890 8006AC70 FF7F6330 */  andi       $v1, $v1, 0x7FFF
/* 58894 8006AC74 300023A4 */  sh         $v1, (0x1F800030 & 0xFFFF)($at)
/* 58898 8006AC78 1800E38E */  lw         $v1, 0x18($s7)
/* 5889C 8006AC7C 320028A4 */  sh         $t0, (0x1F800032 & 0xFFFF)($at)
/* 588A0 8006AC80 340029AC */  sw         $t1, (0x1F800034 & 0xFFFF)($at)
/* 588A4 8006AC84 21B8E302 */  addu       $s7, $s7, $v1
.L8006AC88:
/* 588A8 8006AC88 00001324 */  addiu      $s3, $zero, 0x0
/* 588AC 8006AC8C 00001124 */  addiu      $s1, $zero, 0x0
/* 588B0 8006AC90 D400DE8C */  lw         $fp, 0xD4($a2)
/* 588B4 8006AC94 580020AC */  sw         $zero, (0x1F800058 & 0xFFFF)($at)
/* 588B8 8006AC98 C800D98C */  lw         $t9, 0xC8($a2)
/* 588BC 8006AC9C D000DC8C */  lw         $gp, 0xD0($a2)
/* 588C0 8006ACA0 00002B8F */  lw         $t3, 0x0($t9)
/* 588C4 8006ACA4 40012824 */  addiu      $t0, $at, %lo(D_1F800140)
/* 588C8 8006ACA8 05000104 */  bgez       $zero, .L8006ACC0
/* 588CC 8006ACAC 21188003 */   addu      $v1, $gp, $zero
.L8006ACB0:
/* 588D0 8006ACB0 0000698C */  lw         $t1, 0x0($v1)
/* 588D4 8006ACB4 04006324 */  addiu      $v1, $v1, 0x4
/* 588D8 8006ACB8 000009AD */  sw         $t1, 0x0($t0)
/* 588DC 8006ACBC 04000825 */  addiu      $t0, $t0, 0x4
.L8006ACC0:
/* 588E0 8006ACC0 FBFF601D */  bgtz       $t3, .L8006ACB0
/* 588E4 8006ACC4 FFFF6B25 */   addiu     $t3, $t3, -0x1
/* 588E8 8006ACC8 04002B8F */  lw         $t3, 0x4($t9)
/* 588EC 8006ACCC 08003927 */  addiu      $t9, $t9, 0x8
/* 588F0 8006ACD0 5C00E38F */  lw         $v1, 0x5C($ra)
/* 588F4 8006ACD4 CC00DD8C */  lw         $sp, 0xCC($a2)
/* 588F8 8006ACD8 09506000 */  jalr       $t2, $v1
/* 588FC 8006ACDC 6000F58F */   lw        $s5, 0x60($ra)
/* 58900 8006ACE0 F000D68C */  lw         $s6, 0xF0($a2)
/* 58904 8006ACE4 DC00C384 */  lh         $v1, 0xDC($a2)
/* 58908 8006ACE8 DE00C884 */  lh         $t0, 0xDE($a2)
/* 5890C 8006ACEC 80180300 */  sll        $v1, $v1, 2
/* 58910 8006ACF0 80400800 */  sll        $t0, $t0, 2
/* 58914 8006ACF4 340123A4 */  sh         $v1, 0x134($at)
/* 58918 8006ACF8 360128A4 */  sh         $t0, 0x136($at)
/* 5891C 8006ACFC E400C58C */  lw         $a1, 0xE4($a2)
/* 58920 8006AD00 E800C88C */  lw         $t0, 0xE8($a2)
/* 58924 8006AD04 EC00C38C */  lw         $v1, 0xEC($a2)
/* 58928 8006AD08 380025AC */  sw         $a1, 0x38($at)
/* 5892C 8006AD0C 3C0025AC */  sw         $a1, 0x3C($at)
/* 58930 8006AD10 400028AC */  sw         $t0, 0x40($at)
/* 58934 8006AD14 6400E48F */  lw         $a0, 0x64($ra)
/* 58938 8006AD18 09F86000 */  jalr       $v1
/* 5893C 8006AD1C 01006825 */   addiu     $t0, $t3, 0x1
glabel .L8006AD20
/* 58940 8006AD20 0400248C */  lw         $a0, (0x1F800004 & 0xFFFF)($at)
/* 58944 8006AD24 72FF0104 */  bgez       $zero, .L8006AAF0
/* 58948 8006AD28 00009F8C */   lw        $ra, 0x0($a0)
.L8006AD2C:
/* 5894C 8006AD2C 0C00258C */  lw         $a1, (0x1F80000C & 0xFFFF)($at)
/* 58950 8006AD30 00003D8C */  lw         $sp, (0x1F800000 & 0xFFFF)($at)
/* 58954 8006AD34 0C00A2AC */  sw         $v0, 0xC($a1)
/* 58958 8006AD38 3800BF8F */  lw         $ra, 0x38($sp)
/* 5895C 8006AD3C 3400BE8F */  lw         $fp, 0x34($sp)
/* 58960 8006AD40 3000BC8F */  lw         $gp, 0x30($sp)
/* 58964 8006AD44 2C00B78F */  lw         $s7, 0x2C($sp)
/* 58968 8006AD48 2800B68F */  lw         $s6, 0x28($sp)
/* 5896C 8006AD4C 2400B58F */  lw         $s5, 0x24($sp)
/* 58970 8006AD50 2000B48F */  lw         $s4, 0x20($sp)
/* 58974 8006AD54 1C00B38F */  lw         $s3, 0x1C($sp)
/* 58978 8006AD58 1800B28F */  lw         $s2, 0x18($sp)
/* 5897C 8006AD5C 1400B18F */  lw         $s1, 0x14($sp)
/* 58980 8006AD60 1000B08F */  lw         $s0, 0x10($sp)
/* 58984 8006AD64 0800E003 */  jr         $ra
/* 58988 8006AD68 3C00BD27 */   addiu     $sp, $sp, 0x3C
.size RenderBucket_Execute, . - RenderBucket_Execute
