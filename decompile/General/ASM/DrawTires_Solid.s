.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel DrawTires_Solid
/* 5C1A8 8006E588 801F013C */  lui        $at, (0x1F800048 >> 16)
/* 5C1AC 8006E58C 000030AC */  sw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 5C1B0 8006E590 040031AC */  sw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 5C1B4 8006E594 080032AC */  sw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 5C1B8 8006E598 0C0033AC */  sw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 5C1BC 8006E59C 100034AC */  sw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 5C1C0 8006E5A0 140035AC */  sw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 5C1C4 8006E5A4 180036AC */  sw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 5C1C8 8006E5A8 1C0037AC */  sw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 5C1CC 8006E5AC 20003CAC */  sw         $gp, (0x1F800020 & 0xFFFF)($at)
/* 5C1D0 8006E5B0 24003DAC */  sw         $sp, (0x1F800024 & 0xFFFF)($at)
/* 5C1D4 8006E5B4 28003EAC */  sw         $fp, (0x1F800028 & 0xFFFF)($at)
/* 5C1D8 8006E5B8 2C003FAC */  sw         $ra, (0x1F80002C & 0xFFFF)($at)
/* 5C1DC 8006E5BC 300026AC */  sw         $a2, (0x1F800030 & 0xFFFF)($at)
/* 5C1E0 8006E5C0 FEFFC324 */  addiu      $v1, $a2, -0x2
/* 5C1E4 8006E5C4 0200601C */  bgtz       $v1, .L8006E5D0
/* 5C1E8 8006E5C8 00000324 */   addiu     $v1, $zero, 0x0
/* 5C1EC 8006E5CC 02000324 */  addiu      $v1, $zero, 0x2
.L8006E5D0:
/* 5C1F0 8006E5D0 540023AC */  sw         $v1, (0x1F800054 & 0xFFFF)($at)
/* 5C1F4 8006E5D4 07000324 */  addiu      $v1, $zero, 0x7
/* 5C1F8 8006E5D8 0980083C */  lui        $t0, %hi(D_8008A344)
/* 5C1FC 8006E5DC 44A30825 */  addiu      $t0, $t0, %lo(D_8008A344)
/* 5C200 8006E5E0 30012924 */  addiu      $t1, $at, %lo(D_1F800130)
.L8006E5E4:
/* 5C204 8006E5E4 00000A8D */  lw         $t2, 0x0($t0)
/* 5C208 8006E5E8 04000825 */  addiu      $t0, $t0, 0x4
/* 5C20C 8006E5EC 00002AAD */  sw         $t2, 0x0($t1)
/* 5C210 8006E5F0 04002925 */  addiu      $t1, $t1, 0x4
/* 5C214 8006E5F4 FBFF6014 */  bnez       $v1, .L8006E5E4
/* 5C218 8006E5F8 FFFF6324 */   addiu     $v1, $v1, -0x1
/* 5C21C 8006E5FC 0C00A28C */  lw         $v0, 0xC($a1)
/* 5C220 8006E600 1400B08C */  lw         $s0, 0x14($a1)
.L8006E604:
/* 5C224 8006E604 3400878C */  lw         $a3, 0x34($a0)
/* 5C228 8006E608 30009D8C */  lw         $sp, 0x30($a0)
/* 5C22C 8006E60C 3000268C */  lw         $a2, (0x1F800030 & 0xFFFF)($at)
/* 5C230 8006E610 5600E384 */  lh         $v1, 0x56($a3)
/* 5C234 8006E614 21F0E000 */  addu       $fp, $a3, $zero
/* 5C238 8006E618 340026AC */  sw         $a2, (0x1F800034 & 0xFFFF)($at)
/* 5C23C 8006E61C 4C0023A4 */  sh         $v1, (0x1F80004C & 0xFFFF)($at)
.L8006E620:
/* 5C240 8006E620 DC00C887 */  lh         $t0, 0xDC($fp)
/* 5C244 8006E624 DE00C987 */  lh         $t1, 0xDE($fp)
/* 5C248 8006E628 80400800 */  sll        $t0, $t0, 2
/* 5C24C 8006E62C 80480900 */  sll        $t1, $t1, 2
/* 5C250 8006E630 6C0128A4 */  sh         $t0, (0x1F80016C & 0xFFFF)($at)
/* 5C254 8006E634 6E0129A4 */  sh         $t1, (0x1F80016E & 0xFFFF)($at)
/* 5C258 8006E638 B800C88F */  lw         $t0, 0xB8($fp)
/* 5C25C 8006E63C D800C98F */  lw         $t1, 0xD8($fp)
/* 5C260 8006E640 600128AC */  sw         $t0, (0x1F800160 & 0xFFFF)($at)
/* 5C264 8006E644 40000331 */  andi       $v1, $t0, 0x40
/* 5C268 8006E648 20026010 */  beqz       $v1, .L8006EECC
/* 5C26C 8006E64C 80000331 */   andi      $v1, $t0, 0x80
/* 5C270 8006E650 54002A8C */  lw         $t2, (0x1F800054 & 0xFFFF)($at)
/* 5C274 8006E654 1D026014 */  bnez       $v1, .L8006EECC
/* 5C278 8006E658 23482A01 */   subu      $t1, $t1, $t2
/* 5C27C 8006E65C 1B02201D */  bgtz       $t1, .L8006EECC
/* 5C280 8006E660 00010331 */   andi      $v1, $t0, 0x100
/* 5C284 8006E664 802E093C */  lui        $t1, (0x2E808080 >> 16)
/* 5C288 8006E668 0000AA8F */  lw         $t2, 0x0($sp)
/* 5C28C 8006E66C 02006014 */  bnez       $v1, .L8006E678
/* 5C290 8006E670 80802935 */   ori       $t1, $t1, (0x2E808080 & 0xFFFF)
/* 5C294 8006E674 0800A98F */  lw         $t1, 0x8($sp)
.L8006E678:
/* 5C298 8006E678 38002AAC */  sw         $t2, (0x1F800038 & 0xFFFF)($at)
/* 5C29C 8006E67C 3C0029AC */  sw         $t1, (0x1F80003C & 0xFFFF)($at)
/* 5C2A0 8006E680 7400C68F */  lw         $a2, 0x74($fp)
/* 5C2A4 8006E684 1C00E384 */  lh         $v1, 0x1C($a3)
/* 5C2A8 8006E688 1002C010 */  beqz       $a2, .L8006EECC
/* 5C2AC 8006E68C 90000824 */   addiu     $t0, $zero, 0x90
/* 5C2B0 8006E690 18006800 */  mult       $v1, $t0
/* 5C2B4 8006E694 1E00E384 */  lh         $v1, 0x1E($a3)
/* 5C2B8 8006E698 40000824 */  addiu      $t0, $zero, 0x40
/* 5C2BC 8006E69C 12480000 */  mflo       $t1
/* 5C2C0 8006E6A0 034B0900 */  sra        $t1, $t1, 12
/* 5C2C4 8006E6A4 580029A4 */  sh         $t1, (0x1F800058 & 0xFFFF)($at)
/* 5C2C8 8006E6A8 18006800 */  mult       $v1, $t0
/* 5C2CC 8006E6AC 780029A4 */  sh         $t1, (0x1F800078 & 0xFFFF)($at)
/* 5C2D0 8006E6B0 22500900 */  neg        $t2, $t1 /* handwritten instruction */
/* 5C2D4 8006E6B4 68002AA4 */  sh         $t2, (0x1F800068 & 0xFFFF)($at)
/* 5C2D8 8006E6B8 88002AA4 */  sh         $t2, (0x1F800088 & 0xFFFF)($at)
/* 5C2DC 8006E6BC 00F02925 */  addiu      $t1, $t1, -0x1000
/* 5C2E0 8006E6C0 600029A4 */  sh         $t1, (0x1F800060 & 0xFFFF)($at)
/* 5C2E4 8006E6C4 800029A4 */  sh         $t1, (0x1F800080 & 0xFFFF)($at)
/* 5C2E8 8006E6C8 00104A25 */  addiu      $t2, $t2, 0x1000
/* 5C2EC 8006E6CC 70002AA4 */  sh         $t2, (0x1F800070 & 0xFFFF)($at)
/* 5C2F0 8006E6D0 90002AA4 */  sh         $t2, (0x1F800090 & 0xFFFF)($at)
/* 5C2F4 8006E6D4 2000E384 */  lh         $v1, 0x20($a3)
/* 5C2F8 8006E6D8 C7000824 */  addiu      $t0, $zero, 0xC7
/* 5C2FC 8006E6DC 12480000 */  mflo       $t1
/* 5C300 8006E6E0 034B0900 */  sra        $t1, $t1, 12
/* 5C304 8006E6E4 5A0029A4 */  sh         $t1, (0x1F80005A & 0xFFFF)($at)
/* 5C308 8006E6E8 18006800 */  mult       $v1, $t0
/* 5C30C 8006E6EC 620020A4 */  sh         $zero, (0x1F800062 & 0xFFFF)($at)
/* 5C310 8006E6F0 6A0029A4 */  sh         $t1, (0x1F80006A & 0xFFFF)($at)
/* 5C314 8006E6F4 720020A4 */  sh         $zero, (0x1F800072 & 0xFFFF)($at)
/* 5C318 8006E6F8 7A0029A4 */  sh         $t1, (0x1F80007A & 0xFFFF)($at)
/* 5C31C 8006E6FC 820020A4 */  sh         $zero, (0x1F800082 & 0xFFFF)($at)
/* 5C320 8006E700 8A0029A4 */  sh         $t1, (0x1F80008A & 0xFFFF)($at)
/* 5C324 8006E704 920020A4 */  sh         $zero, (0x1F800092 & 0xFFFF)($at)
/* 5C328 8006E708 A0FF0824 */  addiu      $t0, $zero, -0x60
/* 5C32C 8006E70C 12480000 */  mflo       $t1
/* 5C330 8006E710 034B0900 */  sra        $t1, $t1, 12
/* 5C334 8006E714 5C0029AC */  sw         $t1, (0x1F80005C & 0xFFFF)($at)
/* 5C338 8006E718 18006800 */  mult       $v1, $t0
/* 5C33C 8006E71C 6C0029AC */  sw         $t1, (0x1F80006C & 0xFFFF)($at)
/* 5C340 8006E720 12480000 */  mflo       $t1
/* 5C344 8006E724 034B0900 */  sra        $t1, $t1, 12
/* 5C348 8006E728 7C0029AC */  sw         $t1, (0x1F80007C & 0xFFFF)($at)
/* 5C34C 8006E72C 840029AC */  sw         $t1, (0x1F800084 & 0xFFFF)($at)
/* 5C350 8006E730 8C0029AC */  sw         $t1, (0x1F80008C & 0xFFFF)($at)
/* 5C354 8006E734 940029AC */  sw         $t1, (0x1F800094 & 0xFFFF)($at)
/* 5C358 8006E738 E400C38F */  lw         $v1, 0xE4($fp)
/* 5C35C 8006E73C E800C88F */  lw         $t0, 0xE8($fp)
/* 5C360 8006E740 0400A987 */  lh         $t1, 0x4($sp)
/* 5C364 8006E744 400023AC */  sw         $v1, (0x1F800040 & 0xFFFF)($at)
/* 5C368 8006E748 440028AC */  sw         $t0, (0x1F800044 & 0xFFFF)($at)
/* 5C36C 8006E74C 480029AC */  sw         $t1, (0x1F800048 & 0xFFFF)($at)
/* 5C370 8006E750 0600A987 */  lh         $t1, 0x6($sp)
/* 5C374 8006E754 CCBB010C */  jal        TRIG_AngleSinCos_r9r8r10
/* 5C378 8006E758 80480900 */   sll       $t1, $t1, 2
/* 5C37C 8006E75C 58002384 */  lh         $v1, 0x58($at)
/* 5C380 8006E760 5C00298C */  lw         $t1, 0x5C($at)
/* 5C384 8006E764 23186A00 */  subu       $v1, $v1, $t2
/* 5C388 8006E768 21482801 */  addu       $t1, $t1, $t0
/* 5C38C 8006E76C 600023A4 */  sh         $v1, 0x60($at)
/* 5C390 8006E770 640029AC */  sw         $t1, 0x64($at)
/* 5C394 8006E774 68002384 */  lh         $v1, 0x68($at)
/* 5C398 8006E778 6C00298C */  lw         $t1, 0x6C($at)
/* 5C39C 8006E77C 21186A00 */  addu       $v1, $v1, $t2
/* 5C3A0 8006E780 23482801 */  subu       $t1, $t1, $t0
/* 5C3A4 8006E784 0E00AB87 */  lh         $t3, 0xE($sp)
/* 5C3A8 8006E788 700023A4 */  sh         $v1, 0x70($at)
/* 5C3AC 8006E78C 740029AC */  sw         $t1, 0x74($at)
/* 5C3B0 8006E790 01006831 */  andi       $t0, $t3, 0x1
/* 5C3B4 8006E794 09000C24 */  addiu      $t4, $zero, 0x9
/* 5C3B8 8006E798 03000011 */  beqz       $t0, .L8006E7A8
/* 5C3BC 8006E79C 40590B00 */   sll       $t3, $t3, 5
/* 5C3C0 8006E7A0 06000C24 */  addiu      $t4, $zero, 0x6
/* 5C3C4 8006E7A4 40580B00 */  sll        $t3, $t3, 1
.L8006E7A8:
/* 5C3C8 8006E7A8 CCBB010C */  jal        TRIG_AngleSinCos_r9r8r10
/* 5C3CC 8006E7AC 21486001 */   addu      $t1, $t3, $zero
/* 5C3D0 8006E7B0 62002384 */  lh         $v1, 0x62($at)
/* 5C3D4 8006E7B4 64002984 */  lh         $t1, 0x64($at)
/* 5C3D8 8006E7B8 07508A01 */  srav       $t2, $t2, $t4
/* 5C3DC 8006E7BC 07408801 */  srav       $t0, $t0, $t4
/* 5C3E0 8006E7C0 21186A00 */  addu       $v1, $v1, $t2
/* 5C3E4 8006E7C4 21482801 */  addu       $t1, $t1, $t0
/* 5C3E8 8006E7C8 620023A4 */  sh         $v1, 0x62($at)
/* 5C3EC 8006E7CC 640029A4 */  sh         $t1, 0x64($at)
/* 5C3F0 8006E7D0 CCBB010C */  jal        TRIG_AngleSinCos_r9r8r10
/* 5C3F4 8006E7D4 00046925 */   addiu     $t1, $t3, 0x400
/* 5C3F8 8006E7D8 82002384 */  lh         $v1, 0x82($at)
/* 5C3FC 8006E7DC 84002984 */  lh         $t1, 0x84($at)
/* 5C400 8006E7E0 07508A01 */  srav       $t2, $t2, $t4
/* 5C404 8006E7E4 07408801 */  srav       $t0, $t0, $t4
/* 5C408 8006E7E8 21186A00 */  addu       $v1, $v1, $t2
/* 5C40C 8006E7EC 21482801 */  addu       $t1, $t1, $t0
/* 5C410 8006E7F0 820023A4 */  sh         $v1, 0x82($at)
/* 5C414 8006E7F4 840029A4 */  sh         $t1, 0x84($at)
/* 5C418 8006E7F8 CCBB010C */  jal        TRIG_AngleSinCos_r9r8r10
/* 5C41C 8006E7FC 00086925 */   addiu     $t1, $t3, 0x800
/* 5C420 8006E800 72002384 */  lh         $v1, 0x72($at)
/* 5C424 8006E804 74002984 */  lh         $t1, 0x74($at)
/* 5C428 8006E808 07508A01 */  srav       $t2, $t2, $t4
/* 5C42C 8006E80C 07408801 */  srav       $t0, $t0, $t4
/* 5C430 8006E810 21186A00 */  addu       $v1, $v1, $t2
/* 5C434 8006E814 21482801 */  addu       $t1, $t1, $t0
/* 5C438 8006E818 720023A4 */  sh         $v1, 0x72($at)
/* 5C43C 8006E81C 740029A4 */  sh         $t1, 0x74($at)
/* 5C440 8006E820 CCBB010C */  jal        TRIG_AngleSinCos_r9r8r10
/* 5C444 8006E824 000C6925 */   addiu     $t1, $t3, 0xC00
/* 5C448 8006E828 92002384 */  lh         $v1, 0x92($at)
/* 5C44C 8006E82C 94002984 */  lh         $t1, 0x94($at)
/* 5C450 8006E830 07508A01 */  srav       $t2, $t2, $t4
/* 5C454 8006E834 07408801 */  srav       $t0, $t0, $t4
/* 5C458 8006E838 21186A00 */  addu       $v1, $v1, $t2
/* 5C45C 8006E83C 21482801 */  addu       $t1, $t1, $t0
/* 5C460 8006E840 920023A4 */  sh         $v1, 0x92($at)
/* 5C464 8006E844 940029A4 */  sh         $t1, 0x94($at)
/* 5C468 8006E848 3000E38C */  lw         $v1, 0x30($a3)
/* 5C46C 8006E84C 3400E88C */  lw         $t0, 0x34($a3)
/* 5C470 8006E850 3800E98C */  lw         $t1, 0x38($a3)
/* 5C474 8006E854 0080C348 */  ctc2       $v1, $16 /* handwritten instruction */
/* 5C478 8006E858 0088C848 */  ctc2       $t0, $17 /* handwritten instruction */
/* 5C47C 8006E85C 0090C948 */  ctc2       $t1, $18 /* handwritten instruction */
/* 5C480 8006E860 3C00E38C */  lw         $v1, 0x3C($a3)
/* 5C484 8006E864 4000E88C */  lw         $t0, 0x40($a3)
/* 5C488 8006E868 0098C348 */  ctc2       $v1, $19 /* handwritten instruction */
/* 5C48C 8006E86C 00A0C848 */  ctc2       $t0, $20 /* handwritten instruction */
/* 5C490 8006E870 9800C38F */  lw         $v1, 0x98($fp)
/* 5C494 8006E874 9C00C88F */  lw         $t0, 0x9C($fp)
/* 5C498 8006E878 A000C98F */  lw         $t1, 0xA0($fp)
/* 5C49C 8006E87C 0040C348 */  ctc2       $v1, $8 /* handwritten instruction */
/* 5C4A0 8006E880 0048C848 */  ctc2       $t0, $9 /* handwritten instruction */
/* 5C4A4 8006E884 0050C948 */  ctc2       $t1, $10 /* handwritten instruction */
/* 5C4A8 8006E888 A400C38F */  lw         $v1, 0xA4($fp)
/* 5C4AC 8006E88C A800C88F */  lw         $t0, 0xA8($fp)
/* 5C4B0 8006E890 0058C348 */  ctc2       $v1, $11 /* handwritten instruction */
/* 5C4B4 8006E894 0060C848 */  ctc2       $t0, $12 /* handwritten instruction */
/* 5C4B8 8006E898 4400E38C */  lw         $v1, 0x44($a3)
/* 5C4BC 8006E89C 4800E88C */  lw         $t0, 0x48($a3)
/* 5C4C0 8006E8A0 4C00E98C */  lw         $t1, 0x4C($a3)
/* 5C4C4 8006E8A4 4C002A84 */  lh         $t2, 0x4C($at)
/* 5C4C8 8006E8A8 0000D784 */  lh         $s7, 0x0($a2)
/* 5C4CC 8006E8AC 0200D884 */  lh         $t8, 0x2($a2)
/* 5C4D0 8006E8B0 0400D984 */  lh         $t9, 0x4($a2)
/* 5C4D4 8006E8B4 23187700 */  subu       $v1, $v1, $s7
/* 5C4D8 8006E8B8 23401801 */  subu       $t0, $t0, $t8
/* 5C4DC 8006E8BC 23483901 */  subu       $t1, $t1, $t9
/* 5C4E0 8006E8C0 23505801 */  subu       $t2, $t2, $t8
/* 5C4E4 8006E8C4 80180300 */  sll        $v1, $v1, 2
/* 5C4E8 8006E8C8 80400800 */  sll        $t0, $t0, 2
/* 5C4EC 8006E8CC 80480900 */  sll        $t1, $t1, 2
/* 5C4F0 8006E8D0 80500A00 */  sll        $t2, $t2, 2
/* 5C4F4 8006E8D4 0028C348 */  ctc2       $v1, $5 /* handwritten instruction */
/* 5C4F8 8006E8D8 0030C848 */  ctc2       $t0, $6 /* handwritten instruction */
/* 5C4FC 8006E8DC 0038C948 */  ctc2       $t1, $7 /* handwritten instruction */
/* 5C500 8006E8E0 50002AA4 */  sh         $t2, 0x50($at)
/* 5C504 8006E8E4 30003724 */  addiu      $s7, $at, 0x30
/* 5C508 8006E8E8 18003824 */  addiu      $t8, $at, 0x18
.L8006E8EC:
/* 5C50C 8006E8EC 5800E0CA */  lwc2       $0, 0x58($s7)
/* 5C510 8006E8F0 5C00E1CA */  lwc2       $1, 0x5C($s7)
/* 5C514 8006E8F4 6000E2CA */  lwc2       $2, 0x60($s7)
/* 5C518 8006E8F8 6400E3CA */  lwc2       $3, 0x64($s7)
/* 5C51C 8006E8FC 12004C4A */  MVMVA      1, 2, 0, 0, 0
/* 5C520 8006E900 00480B48 */  mfc2       $t3, $9 /* handwritten instruction */
/* 5C524 8006E904 00500C48 */  mfc2       $t4, $10 /* handwritten instruction */
/* 5C528 8006E908 00580D48 */  mfc2       $t5, $11 /* handwritten instruction */
/* 5C52C 8006E90C 2804A04A */  SQR        0
/* 5C530 8006E910 5800EBA6 */  sh         $t3, 0x58($s7)
/* 5C534 8006E914 5A00ECA6 */  sh         $t4, 0x5A($s7)
/* 5C538 8006E918 00C80348 */  mfc2       $v1, $25 /* handwritten instruction */
/* 5C53C 8006E91C 00D00848 */  mfc2       $t0, $26 /* handwritten instruction */
/* 5C540 8006E920 00D80948 */  mfc2       $t1, $27 /* handwritten instruction */
/* 5C544 8006E924 21A86800 */  addu       $s5, $v1, $t0
/* 5C548 8006E928 E6BB010C */  jal        func_8006EF98
/* 5C54C 8006E92C 21A8A902 */   addu      $s5, $s5, $t1
/* 5C550 8006E930 01000A3C */  lui        $t2, (0x10000 >> 16)
/* 5C554 8006E934 1B005601 */  divu       $zero, $t2, $s6
/* 5C558 8006E938 12E04C4A */  MVMVA      1, 2, 1, 3, 0
/* 5C55C 8006E93C 12B00000 */  mflo       $s6
/* 5C560 8006E940 5C00EDAE */  sw         $t5, 0x5C($s7)
/* 5C564 8006E944 22B01600 */  neg        $s6, $s6 /* handwritten instruction */
/* 5C568 8006E948 18007601 */  mult       $t3, $s6
/* 5C56C 8006E94C 00480348 */  mfc2       $v1, $9 /* handwritten instruction */
/* 5C570 8006E950 00500848 */  mfc2       $t0, $10 /* handwritten instruction */
/* 5C574 8006E954 00580948 */  mfc2       $t1, $11 /* handwritten instruction */
/* 5C578 8006E958 12580000 */  mflo       $t3
/* 5C57C 8006E95C B80003A7 */  sh         $v1, 0xB8($t8)
/* 5C580 8006E960 03590B00 */  sra        $t3, $t3, 4
/* 5C584 8006E964 18009601 */  mult       $t4, $s6
/* 5C588 8006E968 98000BA7 */  sh         $t3, 0x98($t8)
/* 5C58C 8006E96C 12600000 */  mflo       $t4
/* 5C590 8006E970 03610C00 */  sra        $t4, $t4, 4
/* 5C594 8006E974 BA0008A7 */  sh         $t0, 0xBA($t8)
/* 5C598 8006E978 1800B601 */  mult       $t5, $s6
/* 5C59C 8006E97C BC0009AF */  sw         $t1, 0xBC($t8)
/* 5C5A0 8006E980 12680000 */  mflo       $t5
/* 5C5A4 8006E984 03690D00 */  sra        $t5, $t5, 4
/* 5C5A8 8006E988 FFFF6B31 */  andi       $t3, $t3, 0xFFFF
/* 5C5AC 8006E98C FFFF8C31 */  andi       $t4, $t4, 0xFFFF
/* 5C5B0 8006E990 0000CB48 */  ctc2       $t3, $0 /* handwritten instruction */
/* 5C5B4 8006E994 0010CC48 */  ctc2       $t4, $2 /* handwritten instruction */
/* 5C5B8 8006E998 0020CD48 */  ctc2       $t5, $4 /* handwritten instruction */
/* 5C5BC 8006E99C 9A000CA7 */  sh         $t4, 0x9A($t8)
/* 5C5C0 8006E9A0 9C000DAF */  sw         $t5, 0x9C($t8)
/* 5C5C4 8006E9A4 0C00784B */  OP         1
/* 5C5C8 8006E9A8 00C80B48 */  mfc2       $t3, $25 /* handwritten instruction */
/* 5C5CC 8006E9AC 00D00C48 */  mfc2       $t4, $26 /* handwritten instruction */
/* 5C5D0 8006E9B0 00D80D48 */  mfc2       $t5, $27 /* handwritten instruction */
/* 5C5D4 8006E9B4 2804A04A */  SQR        0
/* 5C5D8 8006E9B8 00C80348 */  mfc2       $v1, $25 /* handwritten instruction */
/* 5C5DC 8006E9BC 00D00848 */  mfc2       $t0, $26 /* handwritten instruction */
/* 5C5E0 8006E9C0 00D80948 */  mfc2       $t1, $27 /* handwritten instruction */
/* 5C5E4 8006E9C4 21A86800 */  addu       $s5, $v1, $t0
/* 5C5E8 8006E9C8 E6BB010C */  jal        func_8006EF98
/* 5C5EC 8006E9CC 21A8A902 */   addu      $s5, $s5, $t1
/* 5C5F0 8006E9D0 1A005601 */  div        $zero, $t2, $s6
/* 5C5F4 8006E9D4 12B00000 */  mflo       $s6
/* 5C5F8 8006E9D8 00000000 */  nop
/* 5C5FC 8006E9DC 00000000 */  nop
/* 5C600 8006E9E0 18007601 */  mult       $t3, $s6
/* 5C604 8006E9E4 12580000 */  mflo       $t3
/* 5C608 8006E9E8 03590B00 */  sra        $t3, $t3, 4
/* 5C60C 8006E9EC 00488B48 */  mtc2       $t3, $9 /* handwritten instruction */
/* 5C610 8006E9F0 18009601 */  mult       $t4, $s6
/* 5C614 8006E9F4 12600000 */  mflo       $t4
/* 5C618 8006E9F8 03610C00 */  sra        $t4, $t4, 4
/* 5C61C 8006E9FC 00508C48 */  mtc2       $t4, $10 /* handwritten instruction */
/* 5C620 8006EA00 1800B601 */  mult       $t5, $s6
/* 5C624 8006EA04 12680000 */  mflo       $t5
/* 5C628 8006EA08 03690D00 */  sra        $t5, $t5, 4
/* 5C62C 8006EA0C 00588D48 */  mtc2       $t5, $11 /* handwritten instruction */
/* 5C630 8006EA10 4800238C */  lw         $v1, 0x48($at)
/* 5C634 8006EA14 00000000 */  nop
/* 5C638 8006EA18 0C00784B */  OP         1
/* 5C63C 8006EA1C 18006301 */  mult       $t3, $v1
/* 5C640 8006EA20 12580000 */  mflo       $t3
/* 5C644 8006EA24 835C0B00 */  sra        $t3, $t3, 18
/* 5C648 8006EA28 D8000BA7 */  sh         $t3, 0xD8($t8)
/* 5C64C 8006EA2C 18008301 */  mult       $t4, $v1
/* 5C650 8006EA30 12600000 */  mflo       $t4
/* 5C654 8006EA34 83640C00 */  sra        $t4, $t4, 18
/* 5C658 8006EA38 DA000CA7 */  sh         $t4, 0xDA($t8)
/* 5C65C 8006EA3C 1800A301 */  mult       $t5, $v1
/* 5C660 8006EA40 12680000 */  mflo       $t5
/* 5C664 8006EA44 836C0D00 */  sra        $t5, $t5, 18
/* 5C668 8006EA48 DC000DA7 */  sh         $t5, 0xDC($t8)
/* 5C66C 8006EA4C 00C80B48 */  mfc2       $t3, $25 /* handwritten instruction */
/* 5C670 8006EA50 00D00C48 */  mfc2       $t4, $26 /* handwritten instruction */
/* 5C674 8006EA54 00D80D48 */  mfc2       $t5, $27 /* handwritten instruction */
/* 5C678 8006EA58 2804A04A */  SQR        0
/* 5C67C 8006EA5C 00C80348 */  mfc2       $v1, $25 /* handwritten instruction */
/* 5C680 8006EA60 00D00848 */  mfc2       $t0, $26 /* handwritten instruction */
/* 5C684 8006EA64 00D80948 */  mfc2       $t1, $27 /* handwritten instruction */
/* 5C688 8006EA68 21A86800 */  addu       $s5, $v1, $t0
/* 5C68C 8006EA6C E6BB010C */  jal        func_8006EF98
/* 5C690 8006EA70 21A8A902 */   addu      $s5, $s5, $t1
/* 5C694 8006EA74 1A005601 */  div        $zero, $t2, $s6
/* 5C698 8006EA78 12B00000 */  mflo       $s6
/* 5C69C 8006EA7C 48002A8C */  lw         $t2, 0x48($at)
/* 5C6A0 8006EA80 22B01600 */  neg        $s6, $s6 /* handwritten instruction */
/* 5C6A4 8006EA84 18005601 */  mult       $t2, $s6
/* 5C6A8 8006EA88 12B00000 */  mflo       $s6
/* 5C6AC 8006EA8C 03B31600 */  sra        $s6, $s6, 12
/* 5C6B0 8006EA90 00000000 */  nop
/* 5C6B4 8006EA94 18007601 */  mult       $t3, $s6
/* 5C6B8 8006EA98 12580000 */  mflo       $t3
/* 5C6BC 8006EA9C 835A0B00 */  sra        $t3, $t3, 10
/* 5C6C0 8006EAA0 F8000BA7 */  sh         $t3, 0xF8($t8)
/* 5C6C4 8006EAA4 18009601 */  mult       $t4, $s6
/* 5C6C8 8006EAA8 12600000 */  mflo       $t4
/* 5C6CC 8006EAAC 83620C00 */  sra        $t4, $t4, 10
/* 5C6D0 8006EAB0 FA000CA7 */  sh         $t4, 0xFA($t8)
/* 5C6D4 8006EAB4 1800B601 */  mult       $t5, $s6
/* 5C6D8 8006EAB8 12680000 */  mflo       $t5
/* 5C6DC 8006EABC 836A0D00 */  sra        $t5, $t5, 10
/* 5C6E0 8006EAC0 FC000DA7 */  sh         $t5, 0xFC($t8)
/* 5C6E4 8006EAC4 F0FFF726 */  addiu      $s7, $s7, -0x10
/* 5C6E8 8006EAC8 2318E102 */  subu       $v1, $s7, $at
/* 5C6EC 8006EACC 87FF6104 */  bgez       $v1, .L8006E8EC
/* 5C6F0 8006EAD0 F8FF1827 */   addiu     $t8, $t8, -0x8
/* 5C6F4 8006EAD4 2800C38C */  lw         $v1, 0x28($a2)
/* 5C6F8 8006EAD8 2C00C88C */  lw         $t0, 0x2C($a2)
/* 5C6FC 8006EADC 3000C98C */  lw         $t1, 0x30($a2)
/* 5C700 8006EAE0 0000C348 */  ctc2       $v1, $0 /* handwritten instruction */
/* 5C704 8006EAE4 0008C848 */  ctc2       $t0, $1 /* handwritten instruction */
/* 5C708 8006EAE8 0010C948 */  ctc2       $t1, $2 /* handwritten instruction */
/* 5C70C 8006EAEC 3400C38C */  lw         $v1, 0x34($a2)
/* 5C710 8006EAF0 3800C88C */  lw         $t0, 0x38($a2)
/* 5C714 8006EAF4 0018C348 */  ctc2       $v1, $3 /* handwritten instruction */
/* 5C718 8006EAF8 0020C848 */  ctc2       $t0, $4 /* handwritten instruction */
/* 5C71C 8006EAFC 0028C048 */  ctc2       $zero, $5 /* handwritten instruction */
/* 5C720 8006EB00 0030C048 */  ctc2       $zero, $6 /* handwritten instruction */
/* 5C724 8006EB04 0038C048 */  ctc2       $zero, $7 /* handwritten instruction */
/* 5C728 8006EB08 2000C384 */  lh         $v1, 0x20($a2)
/* 5C72C 8006EB0C 2200C884 */  lh         $t0, 0x22($a2)
/* 5C730 8006EB10 1800C98C */  lw         $t1, 0x18($a2)
/* 5C734 8006EB14 C01B0300 */  sll        $v1, $v1, 15
/* 5C738 8006EB18 C0430800 */  sll        $t0, $t0, 15
/* 5C73C 8006EB1C 00C0C348 */  ctc2       $v1, $24 /* handwritten instruction */
/* 5C740 8006EB20 00C8C848 */  ctc2       $t0, $25 /* handwritten instruction */
/* 5C744 8006EB24 00D0C948 */  ctc2       $t1, $26 /* handwritten instruction */
/* 5C748 8006EB28 30003724 */  addiu      $s7, $at, 0x30
/* 5C74C 8006EB2C 18003824 */  addiu      $t8, $at, 0x18
/* 5C750 8006EB30 0C003924 */  addiu      $t9, $at, 0xC
.L8006EB34:
/* 5C754 8006EB34 5800E386 */  lh         $v1, 0x58($s7)
/* 5C758 8006EB38 D8000887 */  lh         $t0, 0xD8($t8)
/* 5C75C 8006EB3C F8000987 */  lh         $t1, 0xF8($t8)
/* 5C760 8006EB40 23886800 */  subu       $s1, $v1, $t0
/* 5C764 8006EB44 23882902 */  subu       $s1, $s1, $t1
/* 5C768 8006EB48 FFFF3132 */  andi       $s1, $s1, 0xFFFF
/* 5C76C 8006EB4C 5A00E386 */  lh         $v1, 0x5A($s7)
/* 5C770 8006EB50 DA000887 */  lh         $t0, 0xDA($t8)
/* 5C774 8006EB54 FA000987 */  lh         $t1, 0xFA($t8)
/* 5C778 8006EB58 23906800 */  subu       $s2, $v1, $t0
/* 5C77C 8006EB5C 23904902 */  subu       $s2, $s2, $t1
/* 5C780 8006EB60 00941200 */  sll        $s2, $s2, 16
/* 5C784 8006EB64 25883202 */  or         $s1, $s1, $s2
/* 5C788 8006EB68 00009148 */  mtc2       $s1, $0 /* handwritten instruction */
/* 5C78C 8006EB6C 5C00E386 */  lh         $v1, 0x5C($s7)
/* 5C790 8006EB70 DC000887 */  lh         $t0, 0xDC($t8)
/* 5C794 8006EB74 FC000987 */  lh         $t1, 0xFC($t8)
/* 5C798 8006EB78 23906800 */  subu       $s2, $v1, $t0
/* 5C79C 8006EB7C 23904902 */  subu       $s2, $s2, $t1
/* 5C7A0 8006EB80 00089248 */  mtc2       $s2, $1 /* handwritten instruction */
/* 5C7A4 8006EB84 5800E386 */  lh         $v1, 0x58($s7)
/* 5C7A8 8006EB88 D8000887 */  lh         $t0, 0xD8($t8)
/* 5C7AC 8006EB8C F8000987 */  lh         $t1, 0xF8($t8)
/* 5C7B0 8006EB90 21886800 */  addu       $s1, $v1, $t0
/* 5C7B4 8006EB94 23882902 */  subu       $s1, $s1, $t1
/* 5C7B8 8006EB98 FFFF3132 */  andi       $s1, $s1, 0xFFFF
/* 5C7BC 8006EB9C 5A00E386 */  lh         $v1, 0x5A($s7)
/* 5C7C0 8006EBA0 DA000887 */  lh         $t0, 0xDA($t8)
/* 5C7C4 8006EBA4 FA000987 */  lh         $t1, 0xFA($t8)
/* 5C7C8 8006EBA8 21906800 */  addu       $s2, $v1, $t0
/* 5C7CC 8006EBAC 23904902 */  subu       $s2, $s2, $t1
/* 5C7D0 8006EBB0 00941200 */  sll        $s2, $s2, 16
/* 5C7D4 8006EBB4 25883202 */  or         $s1, $s1, $s2
/* 5C7D8 8006EBB8 00109148 */  mtc2       $s1, $2 /* handwritten instruction */
/* 5C7DC 8006EBBC 5C00E386 */  lh         $v1, 0x5C($s7)
/* 5C7E0 8006EBC0 DC000887 */  lh         $t0, 0xDC($t8)
/* 5C7E4 8006EBC4 FC000987 */  lh         $t1, 0xFC($t8)
/* 5C7E8 8006EBC8 21906800 */  addu       $s2, $v1, $t0
/* 5C7EC 8006EBCC 23904902 */  subu       $s2, $s2, $t1
/* 5C7F0 8006EBD0 00189248 */  mtc2       $s2, $3 /* handwritten instruction */
/* 5C7F4 8006EBD4 5800E386 */  lh         $v1, 0x58($s7)
/* 5C7F8 8006EBD8 D8000887 */  lh         $t0, 0xD8($t8)
/* 5C7FC 8006EBDC F8000987 */  lh         $t1, 0xF8($t8)
/* 5C800 8006EBE0 23886800 */  subu       $s1, $v1, $t0
/* 5C804 8006EBE4 21882902 */  addu       $s1, $s1, $t1
/* 5C808 8006EBE8 FFFF3132 */  andi       $s1, $s1, 0xFFFF
/* 5C80C 8006EBEC 5A00E386 */  lh         $v1, 0x5A($s7)
/* 5C810 8006EBF0 DA000887 */  lh         $t0, 0xDA($t8)
/* 5C814 8006EBF4 FA000987 */  lh         $t1, 0xFA($t8)
/* 5C818 8006EBF8 23906800 */  subu       $s2, $v1, $t0
/* 5C81C 8006EBFC 21904902 */  addu       $s2, $s2, $t1
/* 5C820 8006EC00 00941200 */  sll        $s2, $s2, 16
/* 5C824 8006EC04 25883202 */  or         $s1, $s1, $s2
/* 5C828 8006EC08 00209148 */  mtc2       $s1, $4 /* handwritten instruction */
/* 5C82C 8006EC0C 5C00E386 */  lh         $v1, 0x5C($s7)
/* 5C830 8006EC10 DC000887 */  lh         $t0, 0xDC($t8)
/* 5C834 8006EC14 FC000987 */  lh         $t1, 0xFC($t8)
/* 5C838 8006EC18 23906800 */  subu       $s2, $v1, $t0
/* 5C83C 8006EC1C 21904902 */  addu       $s2, $s2, $t1
/* 5C840 8006EC20 00289248 */  mtc2       $s2, $5 /* handwritten instruction */
/* 5C844 8006EC24 5800E386 */  lh         $v1, 0x58($s7)
/* 5C848 8006EC28 D8000887 */  lh         $t0, 0xD8($t8)
/* 5C84C 8006EC2C 3000284A */  RTPT
/* 5C850 8006EC30 F8000987 */  lh         $t1, 0xF8($t8)
/* 5C854 8006EC34 21886800 */  addu       $s1, $v1, $t0
/* 5C858 8006EC38 21882902 */  addu       $s1, $s1, $t1
/* 5C85C 8006EC3C FFFF3132 */  andi       $s1, $s1, 0xFFFF
/* 5C860 8006EC40 5A00E386 */  lh         $v1, 0x5A($s7)
/* 5C864 8006EC44 DA000887 */  lh         $t0, 0xDA($t8)
/* 5C868 8006EC48 FA000987 */  lh         $t1, 0xFA($t8)
/* 5C86C 8006EC4C 21906800 */  addu       $s2, $v1, $t0
/* 5C870 8006EC50 21904902 */  addu       $s2, $s2, $t1
/* 5C874 8006EC54 00941200 */  sll        $s2, $s2, 16
/* 5C878 8006EC58 25883202 */  or         $s1, $s1, $s2
/* 5C87C 8006EC5C 18012CE8 */  swc2       $12, 0x118($at)
/* 5C880 8006EC60 1C012DE8 */  swc2       $13, 0x11C($at)
/* 5C884 8006EC64 20012EE8 */  swc2       $14, 0x120($at)
/* 5C888 8006EC68 00009148 */  mtc2       $s1, $0 /* handwritten instruction */
/* 5C88C 8006EC6C 5C00E386 */  lh         $v1, 0x5C($s7)
/* 5C890 8006EC70 DC000887 */  lh         $t0, 0xDC($t8)
/* 5C894 8006EC74 FC000987 */  lh         $t1, 0xFC($t8)
/* 5C898 8006EC78 21906800 */  addu       $s2, $v1, $t0
/* 5C89C 8006EC7C 21904902 */  addu       $s2, $s2, $t1
/* 5C8A0 8006EC80 00089248 */  mtc2       $s2, $1 /* handwritten instruction */
/* 5C8A4 8006EC84 3C00288C */  lw         $t0, 0x3C($at)
/* 5C8A8 8006EC88 B800038F */  lw         $v1, 0xB8($t8)
/* 5C8AC 8006EC8C 0100184A */  RTPS
/* 5C8B0 8006EC90 040048AC */  sw         $t0, 0x4($v0)
/* 5C8B4 8006EC94 BC00088F */  lw         $t0, 0xBC($t8)
/* 5C8B8 8006EC98 5A00E986 */  lh         $t1, 0x5A($s7)
/* 5C8BC 8006EC9C 50002A84 */  lh         $t2, 0x50($at)
/* 5C8C0 8006ECA0 24012EE8 */  swc2       $14, 0x124($at)
/* 5C8C4 8006ECA4 2E00684B */  AVSZ4
/* 5C8C8 8006ECA8 23484901 */  subu       $t1, $t2, $t1
/* 5C8CC 8006ECAC 02002005 */  bltz       $t1, .L8006ECB8
/* 5C8D0 8006ECB0 40002E8C */   lw        $t6, 0x40($at)
/* 5C8D4 8006ECB4 44002E8C */  lw         $t6, 0x44($at)
.L8006ECB8:
/* 5C8D8 8006ECB8 980000CB */  lwc2       $0, 0x98($t8)
/* 5C8DC 8006ECBC 9C0001CB */  lwc2       $1, 0x9C($t8)
/* 5C8E0 8006ECC0 0040C348 */  ctc2       $v1, $8 /* handwritten instruction */
/* 5C8E4 8006ECC4 0048C848 */  ctc2       $t0, $9 /* handwritten instruction */
/* 5C8E8 8006ECC8 6C012384 */  lh         $v1, 0x16C($at)
/* 5C8EC 8006ECCC 6E012884 */  lh         $t0, 0x16E($at)
/* 5C8F0 8006ECD0 12604A4A */  MVMVA      1, 1, 0, 3, 0
/* 5C8F4 8006ECD4 00C00F48 */  mfc2       $t7, $24 /* handwritten instruction */
/* 5C8F8 8006ECD8 21186E00 */  addu       $v1, $v1, $t6
/* 5C8FC 8006ECDC 21400E01 */  addu       $t0, $t0, $t6
/* 5C900 8006ECE0 700123AC */  sw         $v1, 0x170($at)
/* 5C904 8006ECE4 740128AC */  sw         $t0, 0x174($at)
/* 5C908 8006ECE8 427C0F00 */  srl        $t7, $t7, 17
/* 5C90C 8006ECEC 80780F00 */  sll        $t7, $t7, 2
/* 5C910 8006ECF0 2178EE01 */  addu       $t7, $t7, $t6
/* 5C914 8006ECF4 00480348 */  mfc2       $v1, $9 /* handwritten instruction */
/* 5C918 8006ECF8 0980083C */  lui        $t0, %hi(D_8008A384)
/* 5C91C 8006ECFC 84A30825 */  addiu      $t0, $t0, %lo(D_8008A384)
/* 5C920 8006ED00 02006104 */  bgez       $v1, .L8006ED0C
/* 5C924 8006ED04 43190300 */   sra       $v1, $v1, 5
/* 5C928 8006ED08 22180300 */  neg        $v1, $v1 /* handwritten instruction */
.L8006ED0C:
/* 5C92C 8006ED0C 80FF6924 */  addiu      $t1, $v1, -0x80
/* 5C930 8006ED10 02002019 */  blez       $t1, .L8006ED1C
/* 5C934 8006ED14 21186800 */   addu      $v1, $v1, $t0
/* 5C938 8006ED18 80000325 */  addiu      $v1, $t0, 0x80
.L8006ED1C:
/* 5C93C 8006ED1C 00006380 */  lb         $v1, 0x0($v1)
/* 5C940 8006ED20 3800298C */  lw         $t1, 0x38($at)
/* 5C944 8006ED24 80180300 */  sll        $v1, $v1, 2
/* 5C948 8006ED28 21186900 */  addu       $v1, $v1, $t1
/* 5C94C 8006ED2C 0000638C */  lw         $v1, 0x0($v1)
/* 5C950 8006ED30 00000000 */  nop
/* 5C954 8006ED34 60006010 */  beqz       $v1, .L8006EEB8
/* 5C958 8006ED38 00000000 */   nop
/* 5C95C 8006ED3C 1400688C */  lw         $t0, 0x14($v1)
/* 5C960 8006ED40 1800698C */  lw         $t1, 0x18($v1)
/* 5C964 8006ED44 1C006A8C */  lw         $t2, 0x1C($v1)
/* 5C968 8006ED48 0C0048AC */  sw         $t0, 0xC($v0)
/* 5C96C 8006ED4C 00480848 */  mfc2       $t0, $9 /* handwritten instruction */
/* 5C970 8006ED50 140049AC */  sw         $t1, 0x14($v0)
/* 5C974 8006ED54 1C004AAC */  sw         $t2, 0x1C($v0)
/* 5C978 8006ED58 44002B8C */  lw         $t3, 0x44($at)
/* 5C97C 8006ED5C 60012C8C */  lw         $t4, 0x160($at)
/* 5C980 8006ED60 82460800 */  srl        $t0, $t0, 26
/* 5C984 8006ED64 10000831 */  andi       $t0, $t0, 0x10
/* 5C988 8006ED68 25401901 */  or         $t0, $t0, $t9
/* 5C98C 8006ED6C 3001088D */  lw         $t0, 0x130($t0)
/* 5C990 8006ED70 02540A00 */  srl        $t2, $t2, 16
/* 5C994 8006ED74 08000001 */  jr         $t0
/* 5C998 8006ED78 24004AAC */   sw        $t2, 0x24($v0)
/* 5C99C 8006ED7C 2401238C */  lw         $v1, 0x124($at)
/* 5C9A0 8006ED80 1C01288C */  lw         $t0, 0x11C($at)
/* 5C9A4 8006ED84 2001298C */  lw         $t1, 0x120($at)
/* 5C9A8 8006ED88 18012A8C */  lw         $t2, 0x118($at)
/* 5C9AC 8006ED8C 2801338C */  lw         $s3, 0x128($at)
/* 5C9B0 8006ED90 31000104 */  bgez       $zero, .L8006EE58
/* 5C9B4 8006ED94 2378F301 */   subu      $t7, $t7, $s3
/* 5C9B8 8006ED98 2001238C */  lw         $v1, 0x120($at)
/* 5C9BC 8006ED9C 1801288C */  lw         $t0, 0x118($at)
/* 5C9C0 8006EDA0 2401298C */  lw         $t1, 0x124($at)
/* 5C9C4 8006EDA4 1C012A8C */  lw         $t2, 0x11C($at)
/* 5C9C8 8006EDA8 2C01338C */  lw         $s3, 0x12C($at)
/* 5C9CC 8006EDAC 2A000104 */  bgez       $zero, .L8006EE58
/* 5C9D0 8006EDB0 2378F301 */   subu      $t7, $t7, $s3
/* 5C9D4 8006EDB4 2401238C */  lw         $v1, 0x124($at)
/* 5C9D8 8006EDB8 1C01288C */  lw         $t0, 0x11C($at)
/* 5C9DC 8006EDBC 2001298C */  lw         $t1, 0x120($at)
/* 5C9E0 8006EDC0 18012A8C */  lw         $t2, 0x118($at)
/* 5C9E4 8006EDC4 24000104 */  bgez       $zero, .L8006EE58
/* 5C9E8 8006EDC8 280120AC */   sw        $zero, 0x128($at)
/* 5C9EC 8006EDCC 2001238C */  lw         $v1, 0x120($at)
/* 5C9F0 8006EDD0 1801288C */  lw         $t0, 0x118($at)
/* 5C9F4 8006EDD4 2401298C */  lw         $t1, 0x124($at)
/* 5C9F8 8006EDD8 1C012A8C */  lw         $t2, 0x11C($at)
/* 5C9FC 8006EDDC 1E000104 */  bgez       $zero, .L8006EE58
/* 5CA00 8006EDE0 2C0120AC */   sw        $zero, 0x12C($at)
/* 5CA04 8006EDE4 1C01238C */  lw         $v1, 0x11C($at)
/* 5CA08 8006EDE8 2401288C */  lw         $t0, 0x124($at)
/* 5CA0C 8006EDEC 1801298C */  lw         $t1, 0x118($at)
/* 5CA10 8006EDF0 20012A8C */  lw         $t2, 0x120($at)
/* 5CA14 8006EDF4 2801338C */  lw         $s3, 0x128($at)
/* 5CA18 8006EDF8 17000104 */  bgez       $zero, .L8006EE58
/* 5CA1C 8006EDFC 2378F301 */   subu      $t7, $t7, $s3
/* 5CA20 8006EE00 1801238C */  lw         $v1, 0x118($at)
/* 5CA24 8006EE04 2001288C */  lw         $t0, 0x120($at)
/* 5CA28 8006EE08 1C01298C */  lw         $t1, 0x11C($at)
/* 5CA2C 8006EE0C 24012A8C */  lw         $t2, 0x124($at)
/* 5CA30 8006EE10 2C01338C */  lw         $s3, 0x12C($at)
/* 5CA34 8006EE14 10000104 */  bgez       $zero, .L8006EE58
/* 5CA38 8006EE18 2378F301 */   subu      $t7, $t7, $s3
/* 5CA3C 8006EE1C 1C01238C */  lw         $v1, 0x11C($at)
/* 5CA40 8006EE20 2401288C */  lw         $t0, 0x124($at)
/* 5CA44 8006EE24 1801298C */  lw         $t1, 0x118($at)
/* 5CA48 8006EE28 20012A8C */  lw         $t2, 0x120($at)
/* 5CA4C 8006EE2C 08001324 */  addiu      $s3, $zero, 0x8
/* 5CA50 8006EE30 2378F301 */  subu       $t7, $t7, $s3
/* 5CA54 8006EE34 08000104 */  bgez       $zero, .L8006EE58
/* 5CA58 8006EE38 280133AC */   sw        $s3, 0x128($at)
/* 5CA5C 8006EE3C 1801238C */  lw         $v1, 0x118($at)
/* 5CA60 8006EE40 2001288C */  lw         $t0, 0x120($at)
/* 5CA64 8006EE44 1C01298C */  lw         $t1, 0x11C($at)
/* 5CA68 8006EE48 24012A8C */  lw         $t2, 0x124($at)
/* 5CA6C 8006EE4C 08001324 */  addiu      $s3, $zero, 0x8
/* 5CA70 8006EE50 2378F301 */  subu       $t7, $t7, $s3
/* 5CA74 8006EE54 2C0133AC */  sw         $s3, 0x12C($at)
.L8006EE58:
/* 5CA78 8006EE58 02006E15 */  bne        $t3, $t6, .L8006EE64
/* 5CA7C 8006EE5C 00408C31 */   andi      $t4, $t4, 0x4000
/* 5CA80 8006EE60 1A008015 */  bnez       $t4, .L8006EECC
.L8006EE64:
/* 5CA84 8006EE64 080043AC */   sw        $v1, 0x8($v0)
/* 5CA88 8006EE68 100048AC */  sw         $t0, 0x10($v0)
/* 5CA8C 8006EE6C 180049AC */  sw         $t1, 0x18($v0)
/* 5CA90 8006EE70 20004AAC */  sw         $t2, 0x20($v0)
/* 5CA94 8006EE74 7001238C */  lw         $v1, 0x170($at)
/* 5CA98 8006EE78 7401288C */  lw         $t0, 0x174($at)
/* 5CA9C 8006EE7C 23486F00 */  subu       $t1, $v1, $t7
/* 5CAA0 8006EE80 02002019 */  blez       $t1, .L8006EE8C
/* 5CAA4 8006EE84 23480F01 */   subu      $t1, $t0, $t7
/* 5CAA8 8006EE88 21786000 */  addu       $t7, $v1, $zero
.L8006EE8C:
/* 5CAAC 8006EE8C 02002105 */  bgez       $t1, .L8006EE98
/* 5CAB0 8006EE90 00090A3C */   lui       $t2, (0x9000000 >> 16)
/* 5CAB4 8006EE94 21780001 */  addu       $t7, $t0, $zero
.L8006EE98:
/* 5CAB8 8006EE98 0000E38D */  lw         $v1, 0x0($t7)
/* 5CABC 8006EE9C 00420200 */  sll        $t0, $v0, 8
/* 5CAC0 8006EEA0 02420800 */  srl        $t0, $t0, 8
/* 5CAC4 8006EEA4 25186A00 */  or         $v1, $v1, $t2
/* 5CAC8 8006EEA8 000043AC */  sw         $v1, 0x0($v0)
/* 5CACC 8006EEAC 28004224 */  addiu      $v0, $v0, 0x28
/* 5CAD0 8006EEB0 0000E8AD */  sw         $t0, 0x0($t7)
/* 5CAD4 8006EEB4 01001022 */  addi       $s0, $s0, 0x1 /* handwritten instruction */
.L8006EEB8:
/* 5CAD8 8006EEB8 F0FFF726 */  addiu      $s7, $s7, -0x10
/* 5CADC 8006EEBC F8FF1827 */  addiu      $t8, $t8, -0x8
/* 5CAE0 8006EEC0 2318E102 */  subu       $v1, $s7, $at
/* 5CAE4 8006EEC4 1BFF6104 */  bgez       $v1, .L8006EB34
/* 5CAE8 8006EEC8 FCFF3927 */   addiu     $t9, $t9, -0x4
.L8006EECC:
/* 5CAEC 8006EECC 3400268C */  lw         $a2, (0x1F800034 & 0xFFFF)($at)
/* 5CAF0 8006EED0 8800DE27 */  addiu      $fp, $fp, 0x88
/* 5CAF4 8006EED4 FFFFC624 */  addiu      $a2, $a2, -0x1
/* 5CAF8 8006EED8 D1FDC01C */  bgtz       $a2, .L8006E620
/* 5CAFC 8006EEDC 340026AC */   sw        $a2, (0x1F800034 & 0xFFFF)($at)
/* 5CB00 8006EEE0 1000848C */  lw         $a0, 0x10($a0)
/* 5CB04 8006EEE4 00000000 */  nop
/* 5CB08 8006EEE8 C6FD8014 */  bnez       $a0, .L8006E604
/* 5CB0C 8006EEEC 00000000 */   nop
/* 5CB10 8006EEF0 1400B0AC */  sw         $s0, 0x14($a1)
/* 5CB14 8006EEF4 0C00A2AC */  sw         $v0, 0xC($a1)
/* 5CB18 8006EEF8 2C003F8C */  lw         $ra, (0x1F80002C & 0xFFFF)($at)
/* 5CB1C 8006EEFC 28003E8C */  lw         $fp, (0x1F800028 & 0xFFFF)($at)
/* 5CB20 8006EF00 24003D8C */  lw         $sp, (0x1F800024 & 0xFFFF)($at)
/* 5CB24 8006EF04 20003C8C */  lw         $gp, (0x1F800020 & 0xFFFF)($at)
/* 5CB28 8006EF08 1C00378C */  lw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 5CB2C 8006EF0C 1800368C */  lw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 5CB30 8006EF10 1400358C */  lw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 5CB34 8006EF14 1000348C */  lw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 5CB38 8006EF18 0C00338C */  lw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 5CB3C 8006EF1C 0800328C */  lw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 5CB40 8006EF20 0400318C */  lw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 5CB44 8006EF24 0000308C */  lw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 5CB48 8006EF28 0800E003 */  jr         $ra
/* 5CB4C 8006EF2C 00000000 */   nop
.size DrawTires_Solid, . - DrawTires_Solid
