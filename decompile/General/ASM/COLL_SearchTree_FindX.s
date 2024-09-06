.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel COLL_SearchTree_FindX
/* C80C 8001EBEC 801F013C */  lui        $at, (0x1F80006C >> 16)
/* C810 8001EBF0 7A008010 */  beqz       $a0, .L8001EDDC
/* C814 8001EBF4 300030AC */   sw        $s0, (0x1F800030 & 0xFFFF)($at)
/* C818 8001EBF8 340031AC */  sw         $s1, (0x1F800034 & 0xFFFF)($at)
/* C81C 8001EBFC 380032AC */  sw         $s2, (0x1F800038 & 0xFFFF)($at)
/* C820 8001EC00 3C0033AC */  sw         $s3, (0x1F80003C & 0xFFFF)($at)
/* C824 8001EC04 400034AC */  sw         $s4, (0x1F800040 & 0xFFFF)($at)
/* C828 8001EC08 440035AC */  sw         $s5, (0x1F800044 & 0xFFFF)($at)
/* C82C 8001EC0C 480036AC */  sw         $s6, (0x1F800048 & 0xFFFF)($at)
/* C830 8001EC10 4C0037AC */  sw         $s7, (0x1F80004C & 0xFFFF)($at)
/* C834 8001EC14 50003CAC */  sw         $gp, (0x1F800050 & 0xFFFF)($at)
/* C838 8001EC18 54003DAC */  sw         $sp, (0x1F800054 & 0xFFFF)($at)
/* C83C 8001EC1C 58003EAC */  sw         $fp, (0x1F800058 & 0xFFFF)($at)
/* C840 8001EC20 5C003FAC */  sw         $ra, (0x1F80005C & 0xFFFF)($at)
/* C844 8001EC24 21102000 */  addu       $v0, $at, $zero
/* C848 8001EC28 21888000 */  addu       $s1, $a0, $zero
/* C84C 8001EC2C 0000B484 */  lh         $s4, 0x0($a1)
/* C850 8001EC30 0200B584 */  lh         $s5, 0x2($a1)
/* C854 8001EC34 0400B684 */  lh         $s6, 0x4($a1)
/* C858 8001EC38 0600B784 */  lh         $s7, 0x6($a1)
/* C85C 8001EC3C 0800B884 */  lh         $t8, 0x8($a1)
/* C860 8001EC40 0A00B984 */  lh         $t9, 0xA($a1)
/* C864 8001EC44 2180C000 */  addu       $s0, $a2, $zero
/* C868 8001EC48 2198E000 */  addu       $s3, $a3, $zero
/* C86C 8001EC4C 13000104 */  bgez       $zero, .L8001EC9C
/* C870 8001EC50 21902002 */   addu      $s2, $s1, $zero
.L8001EC54:
/* C874 8001EC54 6E004B84 */  lh         $t3, (0x1F80006E & 0xFFFF)($v0)
/* C878 8001EC58 FEFF4224 */  addiu      $v0, $v0, %lo(D_1F7FFFFE)
/* C87C 8001EC5C 00406331 */  andi       $v1, $t3, 0x4000
/* C880 8001EC60 FF3F6B31 */  andi       $t3, $t3, 0x3FFF
/* C884 8001EC64 40910B00 */  sll        $s2, $t3, 5
/* C888 8001EC68 0C006010 */  beqz       $v1, .L8001EC9C
/* C88C 8001EC6C 21905102 */   addu      $s2, $s2, $s1
/* C890 8001EC70 21204002 */  addu       $a0, $s2, $zero
/* C894 8001EC74 21286002 */  addu       $a1, $s3, $zero
/* C898 8001EC78 640038AC */  sw         $t8, (0x1F800064 & 0xFFFF)($at)
/* C89C 8001EC7C 680039AC */  sw         $t9, (0x1F800068 & 0xFFFF)($at)
/* C8A0 8001EC80 09F80002 */  jalr       $s0
/* C8A4 8001EC84 6C0022AC */   sw        $v0, (0x1F80006C & 0xFFFF)($at)
/* C8A8 8001EC88 801F013C */  lui        $at, (0x1F800068 >> 16)
/* C8AC 8001EC8C 6C00228C */  lw         $v0, (0x1F80006C & 0xFFFF)($at)
/* C8B0 8001EC90 6400388C */  lw         $t8, (0x1F800064 & 0xFFFF)($at)
/* C8B4 8001EC94 43000104 */  bgez       $zero, .L8001EDA4
/* C8B8 8001EC98 6800398C */   lw        $t9, (0x1F800068 & 0xFFFF)($at)
.L8001EC9C:
/* C8BC 8001EC9C 18004C8E */  lw         $t4, 0x18($s2)
/* C8C0 8001ECA0 00000000 */  nop
/* C8C4 8001ECA4 01008325 */  addiu      $v1, $t4, 0x1
/* C8C8 8001ECA8 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* C8CC 8001ECAC 1E006010 */  beqz       $v1, .L8001ED28
/* C8D0 8001ECB0 036C0C00 */   sra       $t5, $t4, 16
/* C8D4 8001ECB4 FF3F9231 */  andi       $s2, $t4, 0x3FFF
/* C8D8 8001ECB8 40911200 */  sll        $s2, $s2, 5
/* C8DC 8001ECBC 21905102 */  addu       $s2, $s2, $s1
/* C8E0 8001ECC0 0400438E */  lw         $v1, 0x4($s2)
/* C8E4 8001ECC4 0800488E */  lw         $t0, 0x8($s2)
/* C8E8 8001ECC8 034C0300 */  sra        $t1, $v1, 16
/* C8EC 8001ECCC 23483801 */  subu       $t1, $t1, $t8
/* C8F0 8001ECD0 1500201D */  bgtz       $t1, .L8001ED28
/* C8F4 8001ECD4 001C0300 */   sll       $v1, $v1, 16
/* C8F8 8001ECD8 031C0300 */  sra        $v1, $v1, 16
/* C8FC 8001ECDC 23187700 */  subu       $v1, $v1, $s7
/* C900 8001ECE0 1100601C */  bgtz       $v1, .L8001ED28
/* C904 8001ECE4 0C00438E */   lw        $v1, 0xC($s2)
/* C908 8001ECE8 034C0800 */  sra        $t1, $t0, 16
/* C90C 8001ECEC 23488902 */  subu       $t1, $s4, $t1
/* C910 8001ECF0 0D00201D */  bgtz       $t1, .L8001ED28
/* C914 8001ECF4 00440800 */   sll       $t0, $t0, 16
/* C918 8001ECF8 03440800 */  sra        $t0, $t0, 16
/* C91C 8001ECFC 23401901 */  subu       $t0, $t0, $t9
/* C920 8001ED00 0900001D */  bgtz       $t0, .L8001ED28
/* C924 8001ED04 034C0300 */   sra       $t1, $v1, 16
/* C928 8001ED08 2348C902 */  subu       $t1, $s6, $t1
/* C92C 8001ED0C 0600201D */  bgtz       $t1, .L8001ED28
/* C930 8001ED10 001C0300 */   sll       $v1, $v1, 16
/* C934 8001ED14 031C0300 */  sra        $v1, $v1, 16
/* C938 8001ED18 2318A302 */  subu       $v1, $s5, $v1
/* C93C 8001ED1C 0200601C */  bgtz       $v1, .L8001ED28
/* C940 8001ED20 70004CA4 */   sh        $t4, 0x70($v0)
/* C944 8001ED24 02004224 */  addiu      $v0, $v0, 0x2
.L8001ED28:
/* C948 8001ED28 0100A325 */  addiu      $v1, $t5, 0x1
/* C94C 8001ED2C 1D006010 */  beqz       $v1, .L8001EDA4
/* C950 8001ED30 FF3FB231 */   andi      $s2, $t5, 0x3FFF
/* C954 8001ED34 40911200 */  sll        $s2, $s2, 5
/* C958 8001ED38 21905102 */  addu       $s2, $s2, $s1
/* C95C 8001ED3C 0400438E */  lw         $v1, 0x4($s2)
/* C960 8001ED40 0800488E */  lw         $t0, 0x8($s2)
/* C964 8001ED44 034C0300 */  sra        $t1, $v1, 16
/* C968 8001ED48 23483801 */  subu       $t1, $t1, $t8
/* C96C 8001ED4C 1500201D */  bgtz       $t1, .L8001EDA4
/* C970 8001ED50 001C0300 */   sll       $v1, $v1, 16
/* C974 8001ED54 031C0300 */  sra        $v1, $v1, 16
/* C978 8001ED58 23187700 */  subu       $v1, $v1, $s7
/* C97C 8001ED5C 1100601C */  bgtz       $v1, .L8001EDA4
/* C980 8001ED60 0C00438E */   lw        $v1, 0xC($s2)
/* C984 8001ED64 034C0800 */  sra        $t1, $t0, 16
/* C988 8001ED68 23488902 */  subu       $t1, $s4, $t1
/* C98C 8001ED6C 0D00201D */  bgtz       $t1, .L8001EDA4
/* C990 8001ED70 00440800 */   sll       $t0, $t0, 16
/* C994 8001ED74 03440800 */  sra        $t0, $t0, 16
/* C998 8001ED78 23401901 */  subu       $t0, $t0, $t9
/* C99C 8001ED7C 0900001D */  bgtz       $t0, .L8001EDA4
/* C9A0 8001ED80 034C0300 */   sra       $t1, $v1, 16
/* C9A4 8001ED84 2348C902 */  subu       $t1, $s6, $t1
/* C9A8 8001ED88 0600201D */  bgtz       $t1, .L8001EDA4
/* C9AC 8001ED8C 001C0300 */   sll       $v1, $v1, 16
/* C9B0 8001ED90 031C0300 */  sra        $v1, $v1, 16
/* C9B4 8001ED94 2318A302 */  subu       $v1, $s5, $v1
/* C9B8 8001ED98 0200601C */  bgtz       $v1, .L8001EDA4
/* C9BC 8001ED9C 70004DA4 */   sh        $t5, 0x70($v0)
/* C9C0 8001EDA0 02004224 */  addiu      $v0, $v0, 0x2
.L8001EDA4:
/* C9C4 8001EDA4 ABFF4114 */  bne        $v0, $at, .L8001EC54
/* C9C8 8001EDA8 801F013C */   lui       $at, (0x1F800030 >> 16)
/* C9CC 8001EDAC 5C003F8C */  lw         $ra, (0x1F80005C & 0xFFFF)($at)
/* C9D0 8001EDB0 58003E8C */  lw         $fp, (0x1F800058 & 0xFFFF)($at)
/* C9D4 8001EDB4 54003D8C */  lw         $sp, (0x1F800054 & 0xFFFF)($at)
/* C9D8 8001EDB8 50003C8C */  lw         $gp, (0x1F800050 & 0xFFFF)($at)
/* C9DC 8001EDBC 4C00378C */  lw         $s7, (0x1F80004C & 0xFFFF)($at)
/* C9E0 8001EDC0 4800368C */  lw         $s6, (0x1F800048 & 0xFFFF)($at)
/* C9E4 8001EDC4 4400358C */  lw         $s5, (0x1F800044 & 0xFFFF)($at)
/* C9E8 8001EDC8 4000348C */  lw         $s4, (0x1F800040 & 0xFFFF)($at)
/* C9EC 8001EDCC 3C00338C */  lw         $s3, (0x1F80003C & 0xFFFF)($at)
/* C9F0 8001EDD0 3800328C */  lw         $s2, (0x1F800038 & 0xFFFF)($at)
/* C9F4 8001EDD4 3400318C */  lw         $s1, (0x1F800034 & 0xFFFF)($at)
/* C9F8 8001EDD8 3000308C */  lw         $s0, (0x1F800030 & 0xFFFF)($at)
.L8001EDDC:
/* C9FC 8001EDDC 0800E003 */  jr         $ra
/* CA00 8001EDE0 00000000 */   nop
.size COLL_SearchTree_FindX, . - COLL_SearchTree_FindX
