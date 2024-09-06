.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel VehLap_UpdateProgress
/* 4A644 8005CA24 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 4A648 8005CA28 3000B2AF */  sw         $s2, 0x30($sp)
/* 4A64C 8005CA2C 21908000 */  addu       $s2, $a0, $zero
/* 4A650 8005CA30 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 4A654 8005CA34 3800B4AF */  sw         $s4, 0x38($sp)
/* 4A658 8005CA38 3400B3AF */  sw         $s3, 0x34($sp)
/* 4A65C 8005CA3C 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 4A660 8005CA40 AE004012 */  beqz       $s2, .L8005CCFC
/* 4A664 8005CA44 2800B0AF */   sw        $s0, 0x28($sp)
/* 4A668 8005CA48 C802428E */  lw         $v0, 0x2C8($s2)
/* 4A66C 8005CA4C 1000033C */  lui        $v1, (0x100000 >> 16)
/* 4A670 8005CA50 24104300 */  and        $v0, $v0, $v1
/* 4A674 8005CA54 04004010 */  beqz       $v0, .L8005CA68
/* 4A678 8005CA58 FFFF1324 */   addiu     $s3, $zero, -0x1
/* 4A67C 8005CA5C 0A065392 */  lbu        $s3, 0x60A($s2)
/* 4A680 8005CA60 A3720108 */  j          .L8005CA8C
/* 4A684 8005CA64 00000000 */   nop
.L8005CA68:
/* 4A688 8005CA68 5403448E */  lw         $a0, 0x354($s2)
/* 4A68C 8005CA6C 00000000 */  nop
/* 4A690 8005CA70 06008010 */  beqz       $a0, .L8005CA8C
/* 4A694 8005CA74 FF000224 */   addiu     $v0, $zero, 0xFF
/* 4A698 8005CA78 3E008390 */  lbu        $v1, 0x3E($a0)
/* 4A69C 8005CA7C 00000000 */  nop
/* 4A6A0 8005CA80 02006210 */  beq        $v1, $v0, .L8005CA8C
/* 4A6A4 8005CA84 00000000 */   nop
/* 4A6A8 8005CA88 3E009390 */  lbu        $s3, 0x3E($a0)
.L8005CA8C:
/* 4A6AC 8005CA8C 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 4A6B0 8005CA90 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 4A6B4 8005CA94 00000000 */  nop
/* 4A6B8 8005CA98 6001448C */  lw         $a0, 0x160($v0)
/* 4A6BC 8005CA9C 00000000 */  nop
/* 4A6C0 8005CAA0 4801828C */  lw         $v0, 0x148($a0)
/* 4A6C4 8005CAA4 00000000 */  nop
/* 4A6C8 8005CAA8 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 4A6CC 8005CAAC FF00422C */  sltiu      $v0, $v0, 0xFF
/* 4A6D0 8005CAB0 92004010 */  beqz       $v0, .L8005CCFC
/* 4A6D4 8005CAB4 00141300 */   sll       $v0, $s3, 16
/* 4A6D8 8005CAB8 031C0200 */  sra        $v1, $v0, 16
/* 4A6DC 8005CABC 8F006004 */  bltz       $v1, .L8005CCFC
/* 4A6E0 8005CAC0 40100300 */   sll       $v0, $v1, 1
/* 4A6E4 8005CAC4 21104300 */  addu       $v0, $v0, $v1
/* 4A6E8 8005CAC8 4C01848C */  lw         $a0, 0x14C($a0)
/* 4A6EC 8005CACC 80100200 */  sll        $v0, $v0, 2
/* 4A6F0 8005CAD0 21A08200 */  addu       $s4, $a0, $v0
/* 4A6F4 8005CAD4 08008292 */  lbu        $v0, 0x8($s4)
/* 4A6F8 8005CAD8 00000000 */  nop
/* 4A6FC 8005CADC 40800200 */  sll        $s0, $v0, 1
/* 4A700 8005CAE0 21800202 */  addu       $s0, $s0, $v0
/* 4A704 8005CAE4 80801000 */  sll        $s0, $s0, 2
/* 4A708 8005CAE8 21809000 */  addu       $s0, $a0, $s0
/* 4A70C 8005CAEC D402428E */  lw         $v0, 0x2D4($s2)
/* 4A710 8005CAF0 08000392 */  lbu        $v1, 0x8($s0)
/* 4A714 8005CAF4 03120200 */  sra        $v0, $v0, 8
/* 4A718 8005CAF8 1800A2A7 */  sh         $v0, 0x18($sp)
/* 4A71C 8005CAFC D802428E */  lw         $v0, 0x2D8($s2)
/* 4A720 8005CB00 00000000 */  nop
/* 4A724 8005CB04 03120200 */  sra        $v0, $v0, 8
/* 4A728 8005CB08 1A00A2A7 */  sh         $v0, 0x1A($sp)
/* 4A72C 8005CB0C DC02428E */  lw         $v0, 0x2DC($s2)
/* 4A730 8005CB10 00000000 */  nop
/* 4A734 8005CB14 03120200 */  sra        $v0, $v0, 8
/* 4A738 8005CB18 1C00A2A7 */  sh         $v0, 0x1C($sp)
/* 4A73C 8005CB1C 40100300 */  sll        $v0, $v1, 1
/* 4A740 8005CB20 21104300 */  addu       $v0, $v0, $v1
/* 4A744 8005CB24 80100200 */  sll        $v0, $v0, 2
/* 4A748 8005CB28 21208200 */  addu       $a0, $a0, $v0
/* 4A74C 8005CB2C 00000296 */  lhu        $v0, 0x0($s0)
/* 4A750 8005CB30 00008394 */  lhu        $v1, 0x0($a0)
/* 4A754 8005CB34 00000000 */  nop
/* 4A758 8005CB38 23104300 */  subu       $v0, $v0, $v1
/* 4A75C 8005CB3C 2000A2A7 */  sh         $v0, 0x20($sp)
/* 4A760 8005CB40 02000296 */  lhu        $v0, 0x2($s0)
/* 4A764 8005CB44 02008394 */  lhu        $v1, 0x2($a0)
/* 4A768 8005CB48 2000B127 */  addiu      $s1, $sp, 0x20
/* 4A76C 8005CB4C 23104300 */  subu       $v0, $v0, $v1
/* 4A770 8005CB50 2200A2A7 */  sh         $v0, 0x22($sp)
/* 4A774 8005CB54 04000296 */  lhu        $v0, 0x4($s0)
/* 4A778 8005CB58 04008394 */  lhu        $v1, 0x4($a0)
/* 4A77C 8005CB5C 21202002 */  addu       $a0, $s1, $zero
/* 4A780 8005CB60 23104300 */  subu       $v0, $v0, $v1
/* 4A784 8005CB64 DEF4000C */  jal        MATH_VectorNormalize
/* 4A788 8005CB68 2400A2A7 */   sh        $v0, 0x24($sp)
/* 4A78C 8005CB6C 1800A297 */  lhu        $v0, 0x18($sp)
/* 4A790 8005CB70 00000396 */  lhu        $v1, 0x0($s0)
/* 4A794 8005CB74 00000000 */  nop
/* 4A798 8005CB78 23104300 */  subu       $v0, $v0, $v1
/* 4A79C 8005CB7C 1000A2A7 */  sh         $v0, 0x10($sp)
/* 4A7A0 8005CB80 1A00A297 */  lhu        $v0, 0x1A($sp)
/* 4A7A4 8005CB84 02000396 */  lhu        $v1, 0x2($s0)
/* 4A7A8 8005CB88 00000000 */  nop
/* 4A7AC 8005CB8C 23104300 */  subu       $v0, $v0, $v1
/* 4A7B0 8005CB90 1C00A397 */  lhu        $v1, 0x1C($sp)
/* 4A7B4 8005CB94 1200A2A7 */  sh         $v0, 0x12($sp)
/* 4A7B8 8005CB98 04000296 */  lhu        $v0, 0x4($s0)
/* 4A7BC 8005CB9C 1000A68F */  lw         $a2, 0x10($sp)
/* 4A7C0 8005CBA0 23186200 */  subu       $v1, $v1, $v0
/* 4A7C4 8005CBA4 1400A3A7 */  sh         $v1, 0x14($sp)
/* 4A7C8 8005CBA8 0000C648 */  ctc2       $a2, $0 /* handwritten instruction */
/* 4A7CC 8005CBAC 14034296 */  lhu        $v0, 0x314($s2)
/* 4A7D0 8005CBB0 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 4A7D4 8005CBB4 00140200 */  sll        $v0, $v0, 16
/* 4A7D8 8005CBB8 43150200 */  sra        $v0, $v0, 21
/* 4A7DC 8005CBBC 00140200 */  sll        $v0, $v0, 16
/* 4A7E0 8005CBC0 25186200 */  or         $v1, $v1, $v0
/* 4A7E4 8005CBC4 0008C348 */  ctc2       $v1, $1 /* handwritten instruction */
/* 4A7E8 8005CBC8 1A034396 */  lhu        $v1, 0x31A($s2)
/* 4A7EC 8005CBCC 20034296 */  lhu        $v0, 0x320($s2)
/* 4A7F0 8005CBD0 001C0300 */  sll        $v1, $v1, 16
/* 4A7F4 8005CBD4 431D0300 */  sra        $v1, $v1, 21
/* 4A7F8 8005CBD8 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 4A7FC 8005CBDC 00140200 */  sll        $v0, $v0, 16
/* 4A800 8005CBE0 43150200 */  sra        $v0, $v0, 21
/* 4A804 8005CBE4 00140200 */  sll        $v0, $v0, 16
/* 4A808 8005CBE8 25186200 */  or         $v1, $v1, $v0
/* 4A80C 8005CBEC 0010C348 */  ctc2       $v1, $2 /* handwritten instruction */
/* 4A810 8005CBF0 000020CA */  lwc2       $0, 0x0($s1)
/* 4A814 8005CBF4 040021CA */  lwc2       $1, 0x4($s1)
/* 4A818 8005CBF8 00000000 */  nop
/* 4A81C 8005CBFC 00000000 */  nop
/* 4A820 8005CC00 1260404A */  MVMVA      0, 0, 0, 3, 0
/* 4A824 8005CC04 00C80248 */  mfc2       $v0, $25 /* handwritten instruction */
/* 4A828 8005CC08 00D00548 */  mfc2       $a1, $26 /* handwritten instruction */
/* 4A82C 8005CC0C 03130200 */  sra        $v0, $v0, 12
/* 4A830 8005CC10 06000396 */  lhu        $v1, 0x6($s0)
/* 4A834 8005CC14 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 4A838 8005CC18 ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 4A83C 8005CC1C C0180300 */  sll        $v1, $v1, 3
/* 4A840 8005CC20 21186200 */  addu       $v1, $v1, $v0
/* 4A844 8005CC24 880443AE */  sw         $v1, 0x488($s2)
/* 4A848 8005CC28 6001828C */  lw         $v0, 0x160($a0)
/* 4A84C 8005CC2C 00000000 */  nop
/* 4A850 8005CC30 4C01428C */  lw         $v0, 0x14C($v0)
/* 4A854 8005CC34 00000000 */  nop
/* 4A858 8005CC38 06004294 */  lhu        $v0, 0x6($v0)
/* 4A85C 8005CC3C 00000000 */  nop
/* 4A860 8005CC40 C0100200 */  sll        $v0, $v0, 3
/* 4A864 8005CC44 1A006200 */  div        $zero, $v1, $v0
/* 4A868 8005CC48 02004014 */  bnez       $v0, .L8005CC54
/* 4A86C 8005CC4C 00000000 */   nop
/* 4A870 8005CC50 0D000700 */  break      7
.L8005CC54:
/* 4A874 8005CC54 FFFF0124 */  addiu      $at, $zero, -0x1
/* 4A878 8005CC58 04004114 */  bne        $v0, $at, .L8005CC6C
/* 4A87C 8005CC5C 0080013C */   lui       $at, (0x80000000 >> 16)
/* 4A880 8005CC60 02006114 */  bne        $v1, $at, .L8005CC6C
/* 4A884 8005CC64 00000000 */   nop
/* 4A888 8005CC68 0D000600 */  break      6
.L8005CC6C:
/* 4A88C 8005CC6C 10200000 */  mfhi       $a0
/* 4A890 8005CC70 0500023C */  lui        $v0, (0x5A800 >> 16)
/* 4A894 8005CC74 00A84234 */  ori        $v0, $v0, (0x5A800 & 0xFFFF)
/* 4A898 8005CC78 2A104500 */  slt        $v0, $v0, $a1
/* 4A89C 8005CC7C 04004010 */  beqz       $v0, .L8005CC90
/* 4A8A0 8005CC80 880444AE */   sw        $a0, 0x488($s2)
/* 4A8A4 8005CC84 C802428E */  lw         $v0, 0x2C8($s2)
/* 4A8A8 8005CC88 27730108 */  j          .L8005CC9C
/* 4A8AC 8005CC8C 00014234 */   ori       $v0, $v0, 0x100
.L8005CC90:
/* 4A8B0 8005CC90 C802428E */  lw         $v0, 0x2C8($s2)
/* 4A8B4 8005CC94 FFFE0324 */  addiu      $v1, $zero, -0x101
/* 4A8B8 8005CC98 24104300 */  and        $v0, $v0, $v1
.L8005CC9C:
/* 4A8BC 8005CC9C C80242AE */  sw         $v0, 0x2C8($s2)
/* 4A8C0 8005CCA0 C802428E */  lw         $v0, 0x2C8($s2)
/* 4A8C4 8005CCA4 0008033C */  lui        $v1, (0x8000000 >> 16)
/* 4A8C8 8005CCA8 24104300 */  and        $v0, $v0, $v1
/* 4A8CC 8005CCAC 0A004010 */  beqz       $v0, .L8005CCD8
/* 4A8D0 8005CCB0 00141300 */   sll       $v0, $s3, 16
/* 4A8D4 8005CCB4 95044392 */  lbu        $v1, 0x495($s2)
/* 4A8D8 8005CCB8 03140200 */  sra        $v0, $v0, 16
/* 4A8DC 8005CCBC 06006210 */  beq        $v1, $v0, .L8005CCD8
/* 4A8E0 8005CCC0 FFF7033C */   lui       $v1, (0xF7FFFFFF >> 16)
/* 4A8E4 8005CCC4 C802428E */  lw         $v0, 0x2C8($s2)
/* 4A8E8 8005CCC8 FFFF6334 */  ori        $v1, $v1, (0xF7FFFFFF & 0xFFFF)
/* 4A8EC 8005CCCC 940453A2 */  sb         $s3, 0x494($s2)
/* 4A8F0 8005CCD0 24104300 */  and        $v0, $v0, $v1
/* 4A8F4 8005CCD4 C80242AE */  sw         $v0, 0x2C8($s2)
.L8005CCD8:
/* 4A8F8 8005CCD8 09008392 */  lbu        $v1, 0x9($s4)
/* 4A8FC 8005CCDC FF000224 */  addiu      $v0, $zero, 0xFF
/* 4A900 8005CCE0 05006210 */  beq        $v1, $v0, .L8005CCF8
/* 4A904 8005CCE4 0008033C */   lui       $v1, (0x8000000 >> 16)
/* 4A908 8005CCE8 C802428E */  lw         $v0, 0x2C8($s2)
/* 4A90C 8005CCEC 00000000 */  nop
/* 4A910 8005CCF0 25104300 */  or         $v0, $v0, $v1
/* 4A914 8005CCF4 C80242AE */  sw         $v0, 0x2C8($s2)
.L8005CCF8:
/* 4A918 8005CCF8 950453A2 */  sb         $s3, 0x495($s2)
.L8005CCFC:
/* 4A91C 8005CCFC 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 4A920 8005CD00 3800B48F */  lw         $s4, 0x38($sp)
/* 4A924 8005CD04 3400B38F */  lw         $s3, 0x34($sp)
/* 4A928 8005CD08 3000B28F */  lw         $s2, 0x30($sp)
/* 4A92C 8005CD0C 2C00B18F */  lw         $s1, 0x2C($sp)
/* 4A930 8005CD10 2800B08F */  lw         $s0, 0x28($sp)
/* 4A934 8005CD14 0800E003 */  jr         $ra
/* 4A938 8005CD18 4000BD27 */   addiu     $sp, $sp, 0x40
.size VehLap_UpdateProgress, . - VehLap_UpdateProgress
