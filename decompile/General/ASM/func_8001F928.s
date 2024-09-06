.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel func_8001F928
/* D548 8001F928 06008384 */  lh         $v1, 0x6($a0)
/* D54C 8001F92C 10008E84 */  lh         $t6, 0x10($a0)
/* D550 8001F930 12008F84 */  lh         $t7, 0x12($a0)
/* D554 8001F934 14009884 */  lh         $t8, 0x14($a0)
/* D558 8001F938 03000824 */  addiu      $t0, $zero, 0x3
/* D55C 8001F93C 1C006814 */  bne        $v1, $t0, .L8001F9B0
/* D560 8001F940 01000824 */   addiu     $t0, $zero, 0x1
/* D564 8001F944 0400AB84 */  lh         $t3, 0x4($a1)
/* D568 8001F948 0400CD84 */  lh         $t5, 0x4($a2)
/* D56C 8001F94C 0400F184 */  lh         $s1, 0x4($a3)
/* D570 8001F950 2368AB01 */  subu       $t5, $t5, $t3
/* D574 8001F954 23882B02 */  subu       $s1, $s1, $t3
/* D578 8001F958 23580B03 */  subu       $t3, $t8, $t3
/* D57C 8001F95C 0200A105 */  bgez       $t5, .L8001F968
/* D580 8001F960 2118A001 */   addu      $v1, $t5, $zero
/* D584 8001F964 22180D00 */  neg        $v1, $t5 /* handwritten instruction */
.L8001F968:
/* D588 8001F968 02002106 */  bgez       $s1, .L8001F974
/* D58C 8001F96C 21402002 */   addu      $t0, $s1, $zero
/* D590 8001F970 22401100 */  neg        $t0, $s1 /* handwritten instruction */
.L8001F974:
/* D594 8001F974 23486800 */  subu       $t1, $v1, $t0
/* D598 8001F978 06002105 */  bgez       $t1, .L8001F994
/* D59C 8001F97C 2118A001 */   addu      $v1, $t5, $zero
/* D5A0 8001F980 21682002 */  addu       $t5, $s1, $zero
/* D5A4 8001F984 21886000 */  addu       $s1, $v1, $zero
/* D5A8 8001F988 2118C000 */  addu       $v1, $a2, $zero
/* D5AC 8001F98C 2130E000 */  addu       $a2, $a3, $zero
/* D5B0 8001F990 21386000 */  addu       $a3, $v1, $zero
.L8001F994:
/* D5B4 8001F994 0000AC84 */  lh         $t4, 0x0($a1)
/* D5B8 8001F998 0000D084 */  lh         $s0, 0x0($a2)
/* D5BC 8001F99C 0000F284 */  lh         $s2, 0x0($a3)
/* D5C0 8001F9A0 23800C02 */  subu       $s0, $s0, $t4
/* D5C4 8001F9A4 23904C02 */  subu       $s2, $s2, $t4
/* D5C8 8001F9A8 37000104 */  bgez       $zero, .L8001FA88
/* D5CC 8001F9AC 2360CC01 */   subu      $t4, $t6, $t4
.L8001F9B0:
/* D5D0 8001F9B0 1B006814 */  bne        $v1, $t0, .L8001FA20
/* D5D4 8001F9B4 0000AB84 */   lh        $t3, 0x0($a1)
/* D5D8 8001F9B8 0000CD84 */  lh         $t5, 0x0($a2)
/* D5DC 8001F9BC 0000F184 */  lh         $s1, 0x0($a3)
/* D5E0 8001F9C0 2368AB01 */  subu       $t5, $t5, $t3
/* D5E4 8001F9C4 23882B02 */  subu       $s1, $s1, $t3
/* D5E8 8001F9C8 2358CB01 */  subu       $t3, $t6, $t3
/* D5EC 8001F9CC 0200A105 */  bgez       $t5, .L8001F9D8
/* D5F0 8001F9D0 2118A001 */   addu      $v1, $t5, $zero
/* D5F4 8001F9D4 22180D00 */  neg        $v1, $t5 /* handwritten instruction */
.L8001F9D8:
/* D5F8 8001F9D8 02002106 */  bgez       $s1, .L8001F9E4
/* D5FC 8001F9DC 21402002 */   addu      $t0, $s1, $zero
/* D600 8001F9E0 22401100 */  neg        $t0, $s1 /* handwritten instruction */
.L8001F9E4:
/* D604 8001F9E4 23486800 */  subu       $t1, $v1, $t0
/* D608 8001F9E8 06002105 */  bgez       $t1, .L8001FA04
/* D60C 8001F9EC 2118A001 */   addu      $v1, $t5, $zero
/* D610 8001F9F0 21682002 */  addu       $t5, $s1, $zero
/* D614 8001F9F4 21886000 */  addu       $s1, $v1, $zero
/* D618 8001F9F8 2118C000 */  addu       $v1, $a2, $zero
/* D61C 8001F9FC 2130E000 */  addu       $a2, $a3, $zero
/* D620 8001FA00 21386000 */  addu       $a3, $v1, $zero
.L8001FA04:
/* D624 8001FA04 0200AC84 */  lh         $t4, 0x2($a1)
/* D628 8001FA08 0200D084 */  lh         $s0, 0x2($a2)
/* D62C 8001FA0C 0200F284 */  lh         $s2, 0x2($a3)
/* D630 8001FA10 23800C02 */  subu       $s0, $s0, $t4
/* D634 8001FA14 23904C02 */  subu       $s2, $s2, $t4
/* D638 8001FA18 1B000104 */  bgez       $zero, .L8001FA88
/* D63C 8001FA1C 2360EC01 */   subu      $t4, $t7, $t4
.L8001FA20:
/* D640 8001FA20 0200AB84 */  lh         $t3, 0x2($a1)
/* D644 8001FA24 0200CD84 */  lh         $t5, 0x2($a2)
/* D648 8001FA28 0200F184 */  lh         $s1, 0x2($a3)
/* D64C 8001FA2C 2368AB01 */  subu       $t5, $t5, $t3
/* D650 8001FA30 23882B02 */  subu       $s1, $s1, $t3
/* D654 8001FA34 2358EB01 */  subu       $t3, $t7, $t3
/* D658 8001FA38 0200A105 */  bgez       $t5, .L8001FA44
/* D65C 8001FA3C 2118A001 */   addu      $v1, $t5, $zero
/* D660 8001FA40 22180D00 */  neg        $v1, $t5 /* handwritten instruction */
.L8001FA44:
/* D664 8001FA44 02002106 */  bgez       $s1, .L8001FA50
/* D668 8001FA48 21402002 */   addu      $t0, $s1, $zero
/* D66C 8001FA4C 22401100 */  neg        $t0, $s1 /* handwritten instruction */
.L8001FA50:
/* D670 8001FA50 23486800 */  subu       $t1, $v1, $t0
/* D674 8001FA54 06002105 */  bgez       $t1, .L8001FA70
/* D678 8001FA58 2118A001 */   addu      $v1, $t5, $zero
/* D67C 8001FA5C 21682002 */  addu       $t5, $s1, $zero
/* D680 8001FA60 21886000 */  addu       $s1, $v1, $zero
/* D684 8001FA64 2118C000 */  addu       $v1, $a2, $zero
/* D688 8001FA68 2130E000 */  addu       $a2, $a3, $zero
/* D68C 8001FA6C 21386000 */  addu       $a3, $v1, $zero
.L8001FA70:
/* D690 8001FA70 0400AC84 */  lh         $t4, 0x4($a1)
/* D694 8001FA74 0400D084 */  lh         $s0, 0x4($a2)
/* D698 8001FA78 0400F284 */  lh         $s2, 0x4($a3)
/* D69C 8001FA7C 23800C02 */  subu       $s0, $s0, $t4
/* D6A0 8001FA80 23904C02 */  subu       $s2, $s2, $t4
/* D6A4 8001FA84 23600C03 */  subu       $t4, $t8, $t4
.L8001FA88:
/* D6A8 8001FA88 00F00E24 */  addiu      $t6, $zero, -0x1000
/* D6AC 8001FA8C 00F00F24 */  addiu      $t7, $zero, -0x1000
/* D6B0 8001FA90 1C00A011 */  beqz       $t5, .L8001FB04
/* D6B4 8001FA94 18004D02 */   mult      $s2, $t5
/* D6B8 8001FA98 12180000 */  mflo       $v1
/* D6BC 8001FA9C 00000000 */  nop
/* D6C0 8001FAA0 00000000 */  nop
/* D6C4 8001FAA4 18003002 */  mult       $s1, $s0
/* D6C8 8001FAA8 12400000 */  mflo       $t0
/* D6CC 8001FAAC 23186800 */  subu       $v1, $v1, $t0
/* D6D0 8001FAB0 83190300 */  sra        $v1, $v1, 6
/* D6D4 8001FAB4 1F006010 */  beqz       $v1, .L8001FB34
/* D6D8 8001FAB8 18008D01 */   mult      $t4, $t5
/* D6DC 8001FABC 12400000 */  mflo       $t0
/* D6E0 8001FAC0 00000000 */  nop
/* D6E4 8001FAC4 00000000 */  nop
/* D6E8 8001FAC8 18007001 */  mult       $t3, $s0
/* D6EC 8001FACC 12480000 */  mflo       $t1
/* D6F0 8001FAD0 23400901 */  subu       $t0, $t0, $t1
/* D6F4 8001FAD4 80410800 */  sll        $t0, $t0, 6
/* D6F8 8001FAD8 1A000301 */  div        $zero, $t0, $v1
/* D6FC 8001FADC 12780000 */  mflo       $t7
/* D700 8001FAE0 1400A011 */  beqz       $t5, .L8001FB34
/* D704 8001FAE4 00000000 */   nop
/* D708 8001FAE8 1800F101 */  mult       $t7, $s1
/* D70C 8001FAEC 12400000 */  mflo       $t0
/* D710 8001FAF0 001B0B00 */  sll        $v1, $t3, 12
/* D714 8001FAF4 23186800 */  subu       $v1, $v1, $t0
/* D718 8001FAF8 1A006D00 */  div        $zero, $v1, $t5
/* D71C 8001FAFC 0D000104 */  bgez       $zero, .L8001FB34
/* D720 8001FB00 12700000 */   mflo      $t6
.L8001FB04:
/* D724 8001FB04 4C002012 */  beqz       $s1, .L8001FC38
/* D728 8001FB08 001B0B00 */   sll       $v1, $t3, 12
/* D72C 8001FB0C 1A007100 */  div        $zero, $v1, $s1
/* D730 8001FB10 12780000 */  mflo       $t7
/* D734 8001FB14 07000012 */  beqz       $s0, .L8001FB34
/* D738 8001FB18 00000000 */   nop
/* D73C 8001FB1C 1800F201 */  mult       $t7, $s2
/* D740 8001FB20 12400000 */  mflo       $t0
/* D744 8001FB24 001B0C00 */  sll        $v1, $t4, 12
/* D748 8001FB28 23186800 */  subu       $v1, $v1, $t0
/* D74C 8001FB2C 1A007000 */  div        $zero, $v1, $s0
/* D750 8001FB30 12700000 */  mflo       $t6
.L8001FB34:
/* D754 8001FB34 0010C325 */  addiu      $v1, $t6, 0x1000
/* D758 8001FB38 3F006010 */  beqz       $v1, .L8001FC38
/* D75C 8001FB3C 0010E825 */   addiu     $t0, $t7, 0x1000
/* D760 8001FB40 3D006010 */  beqz       $v1, .L8001FC38
/* D764 8001FB44 2150CF01 */   addu      $t2, $t6, $t7
/* D768 8001FB48 1900C105 */  bgez       $t6, .L8001FBB0
/* D76C 8001FB4C 00000000 */   nop
/* D770 8001FB50 0800E005 */  bltz       $t7, .L8001FB74
/* D774 8001FB54 00F04A25 */   addiu     $t2, $t2, -0x1000
/* D778 8001FB58 0C004005 */  bltz       $t2, .L8001FB8C
/* D77C 8001FB5C 04000224 */   addiu     $v0, $zero, 0x4
/* D780 8001FB60 0000E38C */  lw         $v1, 0x0($a3)
/* D784 8001FB64 0400E884 */  lh         $t0, 0x4($a3)
/* D788 8001FB68 000083AC */  sw         $v1, 0x0($a0)
/* D78C 8001FB6C 0800E003 */  jr         $ra
/* D790 8001FB70 040088A4 */   sh        $t0, 0x4($a0)
.L8001FB74:
/* D794 8001FB74 0000A38C */  lw         $v1, 0x0($a1)
/* D798 8001FB78 0400A884 */  lh         $t0, 0x4($a1)
/* D79C 8001FB7C 000083AC */  sw         $v1, 0x0($a0)
/* D7A0 8001FB80 040088A4 */  sh         $t0, 0x4($a0)
/* D7A4 8001FB84 0800E003 */  jr         $ra
/* D7A8 8001FB88 00000224 */   addiu     $v0, $zero, 0x0
.L8001FB8C:
/* D7AC 8001FB8C ECFFBD27 */  addiu      $sp, $sp, -0x14
/* D7B0 8001FB90 1000BFAF */  sw         $ra, 0x10($sp)
/* D7B4 8001FB94 2130E000 */  addu       $a2, $a3, $zero
/* D7B8 8001FB98 797B000C */  jal        func_8001EDE4
/* D7BC 8001FB9C 10008724 */   addiu     $a3, $a0, 0x10
/* D7C0 8001FBA0 1000BF8F */  lw         $ra, 0x10($sp)
/* D7C4 8001FBA4 1400BD27 */  addiu      $sp, $sp, 0x14
/* D7C8 8001FBA8 0800E003 */  jr         $ra
/* D7CC 8001FBAC 05000224 */   addiu     $v0, $zero, 0x5
.L8001FBB0:
/* D7D0 8001FBB0 1000E105 */  bgez       $t7, .L8001FBF4
/* D7D4 8001FBB4 00F04A25 */   addiu     $t2, $t2, -0x1000
/* D7D8 8001FBB8 06004005 */  bltz       $t2, .L8001FBD4
/* D7DC 8001FBBC 02000224 */   addiu     $v0, $zero, 0x2
/* D7E0 8001FBC0 0000C38C */  lw         $v1, 0x0($a2)
/* D7E4 8001FBC4 0400C884 */  lh         $t0, 0x4($a2)
/* D7E8 8001FBC8 000083AC */  sw         $v1, 0x0($a0)
/* D7EC 8001FBCC 0800E003 */  jr         $ra
/* D7F0 8001FBD0 040088A4 */   sh        $t0, 0x4($a0)
.L8001FBD4:
/* D7F4 8001FBD4 ECFFBD27 */  addiu      $sp, $sp, -0x14
/* D7F8 8001FBD8 1000BFAF */  sw         $ra, 0x10($sp)
/* D7FC 8001FBDC 797B000C */  jal        func_8001EDE4
/* D800 8001FBE0 10008724 */   addiu     $a3, $a0, 0x10
/* D804 8001FBE4 1000BF8F */  lw         $ra, 0x10($sp)
/* D808 8001FBE8 1400BD27 */  addiu      $sp, $sp, 0x14
/* D80C 8001FBEC 0800E003 */  jr         $ra
/* D810 8001FBF0 01000224 */   addiu     $v0, $zero, 0x1
.L8001FBF4:
/* D814 8001FBF4 0600401D */  bgtz       $t2, .L8001FC10
/* D818 8001FBF8 06000224 */   addiu     $v0, $zero, 0x6
/* D81C 8001FBFC 1000838C */  lw         $v1, 0x10($a0)
/* D820 8001FC00 14008884 */  lh         $t0, 0x14($a0)
/* D824 8001FC04 000083AC */  sw         $v1, 0x0($a0)
/* D828 8001FC08 0800E003 */  jr         $ra
/* D82C 8001FC0C 040088A4 */   sh        $t0, 0x4($a0)
.L8001FC10:
/* D830 8001FC10 ECFFBD27 */  addiu      $sp, $sp, -0x14
/* D834 8001FC14 1000BFAF */  sw         $ra, 0x10($sp)
/* D838 8001FC18 2128C000 */  addu       $a1, $a2, $zero
/* D83C 8001FC1C 2130E000 */  addu       $a2, $a3, $zero
/* D840 8001FC20 797B000C */  jal        func_8001EDE4
/* D844 8001FC24 10008724 */   addiu     $a3, $a0, 0x10
/* D848 8001FC28 1000BF8F */  lw         $ra, 0x10($sp)
/* D84C 8001FC2C 1400BD27 */  addiu      $sp, $sp, 0x14
/* D850 8001FC30 0800E003 */  jr         $ra
/* D854 8001FC34 03000224 */   addiu     $v0, $zero, 0x3
.L8001FC38:
/* D858 8001FC38 0800E003 */  jr         $ra
/* D85C 8001FC3C FFFF0224 */   addiu     $v0, $zero, -0x1
.size func_8001F928, . - func_8001F928
