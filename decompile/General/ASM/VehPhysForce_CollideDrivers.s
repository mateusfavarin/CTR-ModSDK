.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel VehPhysForce_CollideDrivers
/* 4C7CC 8005EBAC B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 4C7D0 8005EBB0 4800B2AF */  sw         $s2, 0x48($sp)
/* 4C7D4 8005EBB4 21908000 */  addu       $s2, $a0, $zero
/* 4C7D8 8005EBB8 4000B0AF */  sw         $s0, 0x40($sp)
/* 4C7DC 8005EBBC 2180A000 */  addu       $s0, $a1, $zero
/* 4C7E0 8005EBC0 4C00BFAF */  sw         $ra, 0x4C($sp)
/* 4C7E4 8005EBC4 4400B1AF */  sw         $s1, 0x44($sp)
/* 4C7E8 8005EBC8 CC030486 */  lh         $a0, 0x3CC($s0)
/* 4C7EC 8005EBCC CE030586 */  lh         $a1, 0x3CE($s0)
/* 4C7F0 8005EBD0 8C00038E */  lw         $v1, 0x8C($s0)
/* 4C7F4 8005EBD4 8800028E */  lw         $v0, 0x88($s0)
/* 4C7F8 8005EBD8 23186500 */  subu       $v1, $v1, $a1
/* 4C7FC 8005EBDC 8C0003AE */  sw         $v1, 0x8C($s0)
/* 4C800 8005EBE0 D0030386 */  lh         $v1, 0x3D0($s0)
/* 4C804 8005EBE4 23104400 */  subu       $v0, $v0, $a0
/* 4C808 8005EBE8 880002AE */  sw         $v0, 0x88($s0)
/* 4C80C 8005EBEC 9000028E */  lw         $v0, 0x90($s0)
/* 4C810 8005EBF0 BC00118E */  lw         $s1, 0xBC($s0)
/* 4C814 8005EBF4 23104300 */  subu       $v0, $v0, $v1
/* 4C818 8005EBF8 900002AE */  sw         $v0, 0x90($s0)
/* 4C81C 8005EBFC 00402232 */  andi       $v0, $s1, 0x4000
/* 4C820 8005EC00 06004010 */  beqz       $v0, .L8005EC1C
/* 4C824 8005EC04 02002232 */   andi      $v0, $s1, 0x2
/* 4C828 8005EC08 AA000296 */  lhu        $v0, 0xAA($s0)
/* 4C82C 8005EC0C 00000000 */  nop
/* 4C830 8005EC10 01004234 */  ori        $v0, $v0, 0x1
/* 4C834 8005EC14 AA0002A6 */  sh         $v0, 0xAA($s0)
/* 4C838 8005EC18 02002232 */  andi       $v0, $s1, 0x2
.L8005EC1C:
/* 4C83C 8005EC1C 0C004014 */  bnez       $v0, .L8005EC50
/* 4C840 8005EC20 21200002 */   addu      $a0, $s0, $zero
/* 4C844 8005EC24 01002232 */  andi       $v0, $s1, 0x1
/* 4C848 8005EC28 11004010 */  beqz       $v0, .L8005EC70
/* 4C84C 8005EC2C 1000033C */   lui       $v1, (0x100000 >> 16)
/* 4C850 8005EC30 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 4C854 8005EC34 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 4C858 8005EC38 00000000 */  nop
/* 4C85C 8005EC3C 0800428C */  lw         $v0, 0x8($v0)
/* 4C860 8005EC40 00000000 */  nop
/* 4C864 8005EC44 24104300 */  and        $v0, $v0, $v1
/* 4C868 8005EC48 05004010 */  beqz       $v0, .L8005EC60
/* 4C86C 8005EC4C C0030524 */   addiu     $a1, $zero, 0x3C0
.L8005EC50:
/* 4C870 8005EC50 78000524 */  addiu      $a1, $zero, 0x78
/* 4C874 8005EC54 05000624 */  addiu      $a2, $zero, 0x5
/* 4C878 8005EC58 1A7B0108 */  j          .L8005EC68
/* 4C87C 8005EC5C 00080724 */   addiu     $a3, $zero, 0x800
.L8005EC60:
/* 4C880 8005EC60 05000624 */  addiu      $a2, $zero, 0x5
/* 4C884 8005EC64 00010724 */  addiu      $a3, $zero, 0x100
.L8005EC68:
/* 4C888 8005EC68 FF6A010C */  jal        DECOMP_VehFire_Increment
/* 4C88C 8005EC6C 00000000 */   nop
.L8005EC70:
/* 4C890 8005EC70 00802232 */  andi       $v0, $s1, 0x8000
/* 4C894 8005EC74 08004010 */  beqz       $v0, .L8005EC98
/* 4C898 8005EC78 FFDF0424 */   addiu     $a0, $zero, -0x2001
/* 4C89C 8005EC7C 3400438E */  lw         $v1, 0x34($s2)
/* 4C8A0 8005EC80 00000000 */  nop
/* 4C8A4 8005EC84 2800628C */  lw         $v0, 0x28($v1)
/* 4C8A8 8005EC88 560060A4 */  sh         $zero, 0x56($v1)
/* 4C8AC 8005EC8C 00204234 */  ori        $v0, $v0, 0x2000
/* 4C8B0 8005EC90 2C7B0108 */  j          .L8005ECB0
/* 4C8B4 8005EC94 280062AC */   sw        $v0, 0x28($v1)
.L8005EC98:
/* 4C8B8 8005EC98 3400428E */  lw         $v0, 0x34($s2)
/* 4C8BC 8005EC9C 00000000 */  nop
/* 4C8C0 8005ECA0 2800438C */  lw         $v1, 0x28($v0)
/* 4C8C4 8005ECA4 00000000 */  nop
/* 4C8C8 8005ECA8 24186400 */  and        $v1, $v1, $a0
/* 4C8CC 8005ECAC 280043AC */  sw         $v1, 0x28($v0)
.L8005ECB0:
/* 4C8D0 8005ECB0 1C00428E */  lw         $v0, 0x1C($s2)
/* 4C8D4 8005ECB4 00000000 */  nop
/* 4C8D8 8005ECB8 00104230 */  andi       $v0, $v0, 0x1000
/* 4C8DC 8005ECBC 29004014 */  bnez       $v0, .L8005ED64
/* 4C8E0 8005ECC0 FF7F033C */   lui       $v1, (0x7FFFFFFF >> 16)
/* 4C8E4 8005ECC4 D402028E */  lw         $v0, 0x2D4($s0)
/* 4C8E8 8005ECC8 00000000 */  nop
/* 4C8EC 8005ECCC 03120200 */  sra        $v0, $v0, 8
/* 4C8F0 8005ECD0 1000A2A7 */  sh         $v0, 0x10($sp)
/* 4C8F4 8005ECD4 D802028E */  lw         $v0, 0x2D8($s0)
/* 4C8F8 8005ECD8 00000000 */  nop
/* 4C8FC 8005ECDC 03120200 */  sra        $v0, $v0, 8
/* 4C900 8005ECE0 1200A2A7 */  sh         $v0, 0x12($sp)
/* 4C904 8005ECE4 DC02028E */  lw         $v0, 0x2DC($s0)
/* 4C908 8005ECE8 FFFF6334 */  ori        $v1, $v1, (0x7FFFFFFF & 0xFFFF)
/* 4C90C 8005ECEC 1C00A3AF */  sw         $v1, 0x1C($sp)
/* 4C910 8005ECF0 1800A0AF */  sw         $zero, 0x18($sp)
/* 4C914 8005ECF4 03120200 */  sra        $v0, $v0, 8
/* 4C918 8005ECF8 1400A2A7 */  sh         $v0, 0x14($sp)
/* 4C91C 8005ECFC 1000448E */  lw         $a0, 0x10($s2)
/* 4C920 8005ED00 D208010C */  jal        DECOMP_PROC_CollidePointWithBucket
/* 4C924 8005ED04 1000A527 */   addiu     $a1, $sp, 0x10
/* 4C928 8005ED08 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 4C92C 8005ED0C ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 4C930 8005ED10 00000000 */  nop
/* 4C934 8005ED14 401B448C */  lw         $a0, 0x1B40($v0)
/* 4C938 8005ED18 D208010C */  jal        DECOMP_PROC_CollidePointWithBucket
/* 4C93C 8005ED1C 1000A527 */   addiu     $a1, $sp, 0x10
/* 4C940 8005ED20 1800A38F */  lw         $v1, 0x18($sp)
/* 4C944 8005ED24 00000000 */  nop
/* 4C948 8005ED28 0E006010 */  beqz       $v1, .L8005ED64
/* 4C94C 8005ED2C 00000000 */   nop
/* 4C950 8005ED30 42004286 */  lh         $v0, 0x42($s2)
/* 4C954 8005ED34 42006384 */  lh         $v1, 0x42($v1)
/* 4C958 8005ED38 00000000 */  nop
/* 4C95C 8005ED3C 21104300 */  addu       $v0, $v0, $v1
/* 4C960 8005ED40 18004200 */  mult       $v0, $v0
/* 4C964 8005ED44 1C00A28F */  lw         $v0, 0x1C($sp)
/* 4C968 8005ED48 12500000 */  mflo       $t2
/* 4C96C 8005ED4C 2A104A00 */  slt        $v0, $v0, $t2
/* 4C970 8005ED50 04004010 */  beqz       $v0, .L8005ED64
/* 4C974 8005ED54 21204002 */   addu      $a0, $s2, $zero
/* 4C978 8005ED58 1000A527 */  addiu      $a1, $sp, 0x10
/* 4C97C 8005ED5C 0175010C */  jal        VehPhysCrash_AnyTwoCars
/* 4C980 8005ED60 88000626 */   addiu     $a2, $s0, 0x88
.L8005ED64:
/* 4C984 8005ED64 AA000296 */  lhu        $v0, 0xAA($s0)
/* 4C988 8005ED68 00000000 */  nop
/* 4C98C 8005ED6C 02004230 */  andi       $v0, $v0, 0x2
/* 4C990 8005ED70 2A004010 */  beqz       $v0, .L8005EE1C
/* 4C994 8005ED74 00000000 */   nop
/* 4C998 8005ED78 D402028E */  lw         $v0, 0x2D4($s0)
/* 4C99C 8005ED7C AC000386 */  lh         $v1, 0xAC($s0)
/* 4C9A0 8005ED80 B4000486 */  lh         $a0, 0xB4($s0)
/* 4C9A4 8005ED84 03120200 */  sra        $v0, $v0, 8
/* 4C9A8 8005ED88 23304300 */  subu       $a2, $v0, $v1
/* 4C9AC 8005ED8C 18008600 */  mult       $a0, $a2
/* 4C9B0 8005ED90 AE000886 */  lh         $t0, 0xAE($s0)
/* 4C9B4 8005ED94 D002028E */  lw         $v0, 0x2D0($s0)
/* 4C9B8 8005ED98 B6000386 */  lh         $v1, 0xB6($s0)
/* 4C9BC 8005ED9C 03120200 */  sra        $v0, $v0, 8
/* 4C9C0 8005EDA0 12480000 */  mflo       $t1
/* 4C9C4 8005EDA4 23104800 */  subu       $v0, $v0, $t0
/* 4C9C8 8005EDA8 04004424 */  addiu      $a0, $v0, 0x4
/* 4C9CC 8005EDAC 18006400 */  mult       $v1, $a0
/* 4C9D0 8005EDB0 DC02028E */  lw         $v0, 0x2DC($s0)
/* 4C9D4 8005EDB4 00000000 */  nop
/* 4C9D8 8005EDB8 03120200 */  sra        $v0, $v0, 8
/* 4C9DC 8005EDBC B0000386 */  lh         $v1, 0xB0($s0)
/* 4C9E0 8005EDC0 12380000 */  mflo       $a3
/* 4C9E4 8005EDC4 B8000486 */  lh         $a0, 0xB8($s0)
/* 4C9E8 8005EDC8 23284300 */  subu       $a1, $v0, $v1
/* 4C9EC 8005EDCC 18008500 */  mult       $a0, $a1
/* 4C9F0 8005EDD0 21102701 */  addu       $v0, $t1, $a3
/* 4C9F4 8005EDD4 12180000 */  mflo       $v1
/* 4C9F8 8005EDD8 21104300 */  addu       $v0, $v0, $v1
/* 4C9FC 8005EDDC 0F004104 */  bgez       $v0, .L8005EE1C
/* 4CA00 8005EDE0 80310600 */   sll       $a2, $a2, 6
/* 4CA04 8005EDE4 80290500 */  sll        $a1, $a1, 6
/* 4CA08 8005EDE8 D802038E */  lw         $v1, 0x2D8($s0)
/* 4CA0C 8005EDEC 8800028E */  lw         $v0, 0x88($s0)
/* 4CA10 8005EDF0 031A0300 */  sra        $v1, $v1, 8
/* 4CA14 8005EDF4 23186800 */  subu       $v1, $v1, $t0
/* 4CA18 8005EDF8 80210300 */  sll        $a0, $v1, 6
/* 4CA1C 8005EDFC 21104600 */  addu       $v0, $v0, $a2
/* 4CA20 8005EE00 880002AE */  sw         $v0, 0x88($s0)
/* 4CA24 8005EE04 8C00028E */  lw         $v0, 0x8C($s0)
/* 4CA28 8005EE08 9000038E */  lw         $v1, 0x90($s0)
/* 4CA2C 8005EE0C 21104400 */  addu       $v0, $v0, $a0
/* 4CA30 8005EE10 21186500 */  addu       $v1, $v1, $a1
/* 4CA34 8005EE14 8C0002AE */  sw         $v0, 0x8C($s0)
/* 4CA38 8005EE18 900003AE */  sw         $v1, 0x90($s0)
.L8005EE1C:
/* 4CA3C 8005EE1C 4C00BF8F */  lw         $ra, 0x4C($sp)
/* 4CA40 8005EE20 4800B28F */  lw         $s2, 0x48($sp)
/* 4CA44 8005EE24 4400B18F */  lw         $s1, 0x44($sp)
/* 4CA48 8005EE28 4000B08F */  lw         $s0, 0x40($sp)
/* 4CA4C 8005EE2C 0800E003 */  jr         $ra
/* 4CA50 8005EE30 5000BD27 */   addiu     $sp, $sp, 0x50
.size VehPhysForce_CollideDrivers, . - VehPhysForce_CollideDrivers
