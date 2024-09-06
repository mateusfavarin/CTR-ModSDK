.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel COLL_StartSearch_Player
/* B564 8001D944 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* B568 8001D948 4000B6AF */  sw         $s6, 0x40($sp)
/* B56C 8001D94C 21B08000 */  addu       $s6, $a0, $zero
/* B570 8001D950 3800B4AF */  sw         $s4, 0x38($sp)
/* B574 8001D954 21A0A000 */  addu       $s4, $a1, $zero
/* B578 8001D958 FEFF043C */  lui        $a0, (0xFFFEFFFF >> 16)
/* B57C 8001D95C FFFF8434 */  ori        $a0, $a0, (0xFFFEFFFF & 0xFFFF)
/* B580 8001D960 3400B3AF */  sw         $s3, 0x34($sp)
/* B584 8001D964 801F133C */  lui        $s3, (0x1F800108 >> 16)
/* B588 8001D968 08017336 */  ori        $s3, $s3, (0x1F800108 & 0xFFFF)
/* B58C 8001D96C 4400BFAF */  sw         $ra, 0x44($sp)
/* B590 8001D970 3C00B5AF */  sw         $s5, 0x3C($sp)
/* B594 8001D974 3000B2AF */  sw         $s2, 0x30($sp)
/* B598 8001D978 2C00B1AF */  sw         $s1, 0x2C($sp)
/* B59C 8001D97C 2800B0AF */  sw         $s0, 0x28($sp)
/* B5A0 8001D980 C802828E */  lw         $v0, 0x2C8($s4)
/* B5A4 8001D984 D402838E */  lw         $v1, 0x2D4($s4)
/* B5A8 8001D988 24104400 */  and        $v0, $v0, $a0
/* B5AC 8001D98C 03420300 */  sra        $t0, $v1, 8
/* B5B0 8001D990 C80282AE */  sw         $v0, 0x2C8($s4)
/* B5B4 8001D994 100068A6 */  sh         $t0, 0x10($s3)
/* B5B8 8001D998 D802828E */  lw         $v0, 0x2D8($s4)
/* B5BC 8001D99C 00000000 */  nop
/* B5C0 8001D9A0 03120200 */  sra        $v0, $v0, 8
/* B5C4 8001D9A4 80004A24 */  addiu      $t2, $v0, 0x80
/* B5C8 8001D9A8 12006AA6 */  sh         $t2, 0x12($s3)
/* B5CC 8001D9AC DC02828E */  lw         $v0, 0x2DC($s4)
/* B5D0 8001D9B0 00000000 */  nop
/* B5D4 8001D9B4 035A0200 */  sra        $t3, $v0, 8
/* B5D8 8001D9B8 14006BA6 */  sh         $t3, 0x14($s3)
/* B5DC 8001D9BC D402828E */  lw         $v0, 0x2D4($s4)
/* B5E0 8001D9C0 00000000 */  nop
/* B5E4 8001D9C4 033A0200 */  sra        $a3, $v0, 8
/* B5E8 8001D9C8 000067A6 */  sh         $a3, 0x0($s3)
/* B5EC 8001D9CC D802828E */  lw         $v0, 0x2D8($s4)
/* B5F0 8001D9D0 00000000 */  nop
/* B5F4 8001D9D4 03120200 */  sra        $v0, $v0, 8
/* B5F8 8001D9D8 00FF4624 */  addiu      $a2, $v0, -0x100
/* B5FC 8001D9DC 020066A6 */  sh         $a2, 0x2($s3)
/* B600 8001D9E0 DC02828E */  lw         $v0, 0x2DC($s4)
/* B604 8001D9E4 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* B608 8001D9E8 ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* B60C 8001D9EC 032A0200 */  sra        $a1, $v0, 8
/* B610 8001D9F0 040065A6 */  sh         $a1, 0x4($s3)
/* B614 8001D9F4 6001828C */  lw         $v0, 0x160($a0)
/* B618 8001D9F8 00000000 */  nop
/* B61C 8001D9FC 0000438C */  lw         $v1, 0x0($v0)
/* B620 8001DA00 10000224 */  addiu      $v0, $zero, 0x10
/* B624 8001DA04 280062AE */  sw         $v0, 0x28($s3)
/* B628 8001DA08 00300224 */  addiu      $v0, $zero, 0x3000
/* B62C 8001DA0C 240062AE */  sw         $v0, 0x24($s3)
/* B630 8001DA10 220060A6 */  sh         $zero, 0x22($s3)
/* B634 8001DA14 2C0063AE */  sw         $v1, 0x2C($s3)
/* B638 8001DA18 A81C8290 */  lbu        $v0, 0x1CA8($a0)
/* B63C 8001DA1C 00000000 */  nop
/* B640 8001DA20 0300422C */  sltiu      $v0, $v0, 0x3
/* B644 8001DA24 02004010 */  beqz       $v0, .L8001DA30
/* B648 8001DA28 02000224 */   addiu     $v0, $zero, 0x2
/* B64C 8001DA2C 220062A6 */  sh         $v0, 0x22($s3)
.L8001DA30:
/* B650 8001DA30 21180001 */  addu       $v1, $t0, $zero
/* B654 8001DA34 00140800 */  sll        $v0, $t0, 16
/* B658 8001DA38 037C0200 */  sra        $t7, $v0, 16
/* B65C 8001DA3C 00140700 */  sll        $v0, $a3, 16
/* B660 8001DA40 03740200 */  sra        $t6, $v0, 16
/* B664 8001DA44 2A10CF01 */  slt        $v0, $t6, $t7
/* B668 8001DA48 3E0060A6 */  sh         $zero, 0x3E($s3)
/* B66C 8001DA4C 02004010 */  beqz       $v0, .L8001DA58
/* B670 8001DA50 3C0060A6 */   sh        $zero, 0x3C($s3)
/* B674 8001DA54 2118E000 */  addu       $v1, $a3, $zero
.L8001DA58:
/* B678 8001DA58 300063A6 */  sh         $v1, 0x30($s3)
/* B67C 8001DA5C 00140A00 */  sll        $v0, $t2, 16
/* B680 8001DA60 036C0200 */  sra        $t5, $v0, 16
/* B684 8001DA64 00140600 */  sll        $v0, $a2, 16
/* B688 8001DA68 03640200 */  sra        $t4, $v0, 16
/* B68C 8001DA6C 2A108D01 */  slt        $v0, $t4, $t5
/* B690 8001DA70 02004010 */  beqz       $v0, .L8001DA7C
/* B694 8001DA74 21184001 */   addu      $v1, $t2, $zero
/* B698 8001DA78 2118C000 */  addu       $v1, $a2, $zero
.L8001DA7C:
/* B69C 8001DA7C 320063A6 */  sh         $v1, 0x32($s3)
/* B6A0 8001DA80 00140B00 */  sll        $v0, $t3, 16
/* B6A4 8001DA84 034C0200 */  sra        $t1, $v0, 16
/* B6A8 8001DA88 00140500 */  sll        $v0, $a1, 16
/* B6AC 8001DA8C 03240200 */  sra        $a0, $v0, 16
/* B6B0 8001DA90 2A108900 */  slt        $v0, $a0, $t1
/* B6B4 8001DA94 02004010 */  beqz       $v0, .L8001DAA0
/* B6B8 8001DA98 21186001 */   addu      $v1, $t3, $zero
/* B6BC 8001DA9C 2118A000 */  addu       $v1, $a1, $zero
.L8001DAA0:
/* B6C0 8001DAA0 340063A6 */  sh         $v1, 0x34($s3)
/* B6C4 8001DAA4 2A10EE01 */  slt        $v0, $t7, $t6
/* B6C8 8001DAA8 02004010 */  beqz       $v0, .L8001DAB4
/* B6CC 8001DAAC 21180001 */   addu      $v1, $t0, $zero
/* B6D0 8001DAB0 2118E000 */  addu       $v1, $a3, $zero
.L8001DAB4:
/* B6D4 8001DAB4 360063A6 */  sh         $v1, 0x36($s3)
/* B6D8 8001DAB8 2A10AC01 */  slt        $v0, $t5, $t4
/* B6DC 8001DABC 02004010 */  beqz       $v0, .L8001DAC8
/* B6E0 8001DAC0 21184001 */   addu      $v1, $t2, $zero
/* B6E4 8001DAC4 2118C000 */  addu       $v1, $a2, $zero
.L8001DAC8:
/* B6E8 8001DAC8 380063A6 */  sh         $v1, 0x38($s3)
/* B6EC 8001DACC 2A102401 */  slt        $v0, $t1, $a0
/* B6F0 8001DAD0 02004010 */  beqz       $v0, .L8001DADC
/* B6F4 8001DAD4 21186001 */   addu      $v1, $t3, $zero
/* B6F8 8001DAD8 2118A000 */  addu       $v1, $a1, $zero
.L8001DADC:
/* B6FC 8001DADC 3A0063A6 */  sh         $v1, 0x3A($s3)
/* B700 8001DAE0 1C0067A6 */  sh         $a3, 0x1C($s3)
/* B704 8001DAE4 1E0066A6 */  sh         $a2, 0x1E($s3)
/* B708 8001DAE8 200065A6 */  sh         $a1, 0x20($s3)
/* B70C 8001DAEC 5003848E */  lw         $a0, 0x350($s4)
/* B710 8001DAF0 00000000 */  nop
/* B714 8001DAF4 04008010 */  beqz       $a0, .L8001DB08
/* B718 8001DAF8 00000000 */   nop
/* B71C 8001DAFC 801F053C */  lui        $a1, (0x1F800108 >> 16)
/* B720 8001DB00 077D000C */  jal        COLL_PerQuadblock_CheckTriangles_Touching
/* B724 8001DB04 0801A534 */   ori       $a1, $a1, (0x1F800108 & 0xFFFF)
.L8001DB08:
/* B728 8001DB08 3E006286 */  lh         $v0, 0x3E($s3)
/* B72C 8001DB0C 00000000 */  nop
/* B730 8001DB10 10004014 */  bnez       $v0, .L8001DB54
/* B734 8001DB14 00000000 */   nop
/* B738 8001DB18 2C00648E */  lw         $a0, 0x2C($s3)
/* B73C 8001DB1C 00000000 */  nop
/* B740 8001DB20 0C008010 */  beqz       $a0, .L8001DB54
/* B744 8001DB24 00000000 */   nop
/* B748 8001DB28 1800848C */  lw         $a0, 0x18($a0)
/* B74C 8001DB2C 00000000 */  nop
/* B750 8001DB30 08008010 */  beqz       $a0, .L8001DB54
/* B754 8001DB34 801F053C */   lui       $a1, (0x1F800138 >> 16)
/* B758 8001DB38 3801A534 */  ori        $a1, $a1, (0x1F800138 & 0xFFFF)
/* B75C 8001DB3C 0280063C */  lui        $a2, %hi(COLL_PerBspLeaf_CheckQuadblocks_Touching)
/* B760 8001DB40 F0F5C624 */  addiu      $a2, $a2, %lo(COLL_PerBspLeaf_CheckQuadblocks_Touching)
/* B764 8001DB44 801F073C */  lui        $a3, (0x1F800108 >> 16)
/* B768 8001DB48 FB7A000C */  jal        COLL_SearchTree_FindX
/* B76C 8001DB4C 0801E734 */   ori       $a3, $a3, (0x1F800108 & 0xFFFF)
/* B770 8001DB50 3E006286 */  lh         $v0, 0x3E($s3)
.L8001DB54:
/* B774 8001DB54 3400D58E */  lw         $s5, 0x34($s6)
/* B778 8001DB58 53014010 */  beqz       $v0, .L8001E0A8
/* B77C 8001DB5C FFBF0324 */   addiu     $v1, $zero, -0x4001
/* B780 8001DB60 70006496 */  lhu        $a0, 0x70($s3)
/* B784 8001DB64 72006396 */  lhu        $v1, 0x72($s3)
/* B788 8001DB68 74006296 */  lhu        $v0, 0x74($s3)
/* B78C 8001DB6C 82210400 */  srl        $a0, $a0, 6
/* B790 8001DB70 FF008430 */  andi       $a0, $a0, 0xFF
/* B794 8001DB74 80180300 */  sll        $v1, $v1, 2
/* B798 8001DB78 00FF6330 */  andi       $v1, $v1, 0xFF00
/* B79C 8001DB7C 25208300 */  or         $a0, $a0, $v1
/* B7A0 8001DB80 82110200 */  srl        $v0, $v0, 6
/* B7A4 8001DB84 FF004230 */  andi       $v0, $v0, 0xFF
/* B7A8 8001DB88 00140200 */  sll        $v0, $v0, 16
/* B7AC 8001DB8C 4A008392 */  lbu        $v1, 0x4A($s4)
/* B7B0 8001DB90 25208200 */  or         $a0, $a0, $v0
/* B7B4 8001DB94 01006324 */  addiu      $v1, $v1, 0x1
/* B7B8 8001DB98 001E0300 */  sll        $v1, $v1, 24
/* B7BC 8001DB9C 25208300 */  or         $a0, $a0, $v1
/* B7C0 8001DBA0 7000A4AE */  sw         $a0, 0x70($s5)
/* B7C4 8001DBA4 1E006286 */  lh         $v0, 0x1E($s3)
/* B7C8 8001DBA8 AA008396 */  lhu        $v1, 0xAA($s4)
/* B7CC 8001DBAC 00120200 */  sll        $v0, $v0, 8
/* B7D0 8001DBB0 04006334 */  ori        $v1, $v1, 0x4
/* B7D4 8001DBB4 D00282AE */  sw         $v0, 0x2D0($s4)
/* B7D8 8001DBB8 AA0083A6 */  sh         $v1, 0xAA($s4)
/* B7DC 8001DBBC 8000628E */  lw         $v0, 0x80($s3)
/* B7E0 8001DBC0 00000000 */  nop
/* B7E4 8001DBC4 38004390 */  lbu        $v1, 0x38($v0)
/* B7E8 8001DBC8 0E000224 */  addiu      $v0, $zero, 0xE
/* B7EC 8001DBCC 05006210 */  beq        $v1, $v0, .L8001DBE4
/* B7F0 8001DBD0 04000224 */   addiu     $v0, $zero, 0x4
/* B7F4 8001DBD4 03006210 */  beq        $v1, $v0, .L8001DBE4
/* B7F8 8001DBD8 0D000224 */   addiu     $v0, $zero, 0xD
/* B7FC 8001DBDC 05006214 */  bne        $v1, $v0, .L8001DBF4
/* B800 8001DBE0 00000000 */   nop
.L8001DBE4:
/* B804 8001DBE4 2800A28E */  lw         $v0, 0x28($s5)
/* B808 8001DBE8 5600A0A6 */  sh         $zero, 0x56($s5)
/* B80C 8001DBEC 00204234 */  ori        $v0, $v0, 0x2000
/* B810 8001DBF0 2800A2AE */  sw         $v0, 0x28($s5)
.L8001DBF4:
/* B814 8001DBF4 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* B818 8001DBF8 ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* B81C 8001DBFC 00000000 */  nop
/* B820 8001DC00 A81C8290 */  lbu        $v0, 0x1CA8($a0)
/* B824 8001DC04 00000000 */  nop
/* B828 8001DC08 0200422C */  sltiu      $v0, $v0, 0x2
/* B82C 8001DC0C 22004010 */  beqz       $v0, .L8001DC98
/* B830 8001DC10 00000000 */   nop
/* B834 8001DC14 8000628E */  lw         $v0, 0x80($s3)
/* B838 8001DC18 00000000 */  nop
/* B83C 8001DC1C 12004394 */  lhu        $v1, 0x12($v0)
/* B840 8001DC20 00000000 */  nop
/* B844 8001DC24 00206230 */  andi       $v0, $v1, 0x2000
/* B848 8001DC28 1B004014 */  bnez       $v0, .L8001DC98
/* B84C 8001DC2C 01006230 */   andi      $v0, $v1, 0x1
/* B850 8001DC30 0A004010 */  beqz       $v0, .L8001DC5C
/* B854 8001DC34 04006230 */   andi      $v0, $v1, 0x4
/* B858 8001DC38 2800A28E */  lw         $v0, 0x28($s5)
/* B85C 8001DC3C 00000000 */  nop
/* B860 8001DC40 00404234 */  ori        $v0, $v0, 0x4000
/* B864 8001DC44 2800A2AE */  sw         $v0, 0x28($s5)
/* B868 8001DC48 6001828C */  lw         $v0, 0x160($a0)
/* B86C 8001DC4C 00000000 */  nop
/* B870 8001DC50 86014294 */  lhu        $v0, 0x186($v0)
/* B874 8001DC54 26770008 */  j          .L8001DC98
/* B878 8001DC58 5600A2A6 */   sh        $v0, 0x56($s5)
.L8001DC5C:
/* B87C 8001DC5C 0A004010 */  beqz       $v0, .L8001DC88
/* B880 8001DC60 FFBF0324 */   addiu     $v1, $zero, -0x4001
/* B884 8001DC64 2800A28E */  lw         $v0, 0x28($s5)
/* B888 8001DC68 00000000 */  nop
/* B88C 8001DC6C 00404234 */  ori        $v0, $v0, 0x4000
/* B890 8001DC70 2800A2AE */  sw         $v0, 0x28($s5)
/* B894 8001DC74 6001828C */  lw         $v0, 0x160($a0)
/* B898 8001DC78 00000000 */  nop
/* B89C 8001DC7C 84014294 */  lhu        $v0, 0x184($v0)
/* B8A0 8001DC80 26770008 */  j          .L8001DC98
/* B8A4 8001DC84 5600A2A6 */   sh        $v0, 0x56($s5)
.L8001DC88:
/* B8A8 8001DC88 2800A28E */  lw         $v0, 0x28($s5)
/* B8AC 8001DC8C 00000000 */  nop
/* B8B0 8001DC90 24104300 */  and        $v0, $v0, $v1
/* B8B4 8001DC94 2800A2AE */  sw         $v0, 0x28($s5)
.L8001DC98:
/* B8B8 8001DC98 70038286 */  lh         $v0, 0x370($s4)
/* B8BC 8001DC9C 70006396 */  lhu        $v1, 0x70($s3)
/* B8C0 8001DCA0 80900200 */  sll        $s2, $v0, 2
/* B8C4 8001DCA4 21904202 */  addu       $s2, $s2, $v0
/* B8C8 8001DCA8 001C0300 */  sll        $v1, $v1, 16
/* B8CC 8001DCAC 031C0300 */  sra        $v1, $v1, 16
/* B8D0 8001DCB0 40100300 */  sll        $v0, $v1, 1
/* B8D4 8001DCB4 21104300 */  addu       $v0, $v0, $v1
/* B8D8 8001DCB8 21904202 */  addu       $s2, $s2, $v0
/* B8DC 8001DCBC 18005202 */  mult       $s2, $s2
/* B8E0 8001DCC0 72038286 */  lh         $v0, 0x372($s4)
/* B8E4 8001DCC4 72006396 */  lhu        $v1, 0x72($s3)
/* B8E8 8001DCC8 80880200 */  sll        $s1, $v0, 2
/* B8EC 8001DCCC 21882202 */  addu       $s1, $s1, $v0
/* B8F0 8001DCD0 001C0300 */  sll        $v1, $v1, 16
/* B8F4 8001DCD4 031C0300 */  sra        $v1, $v1, 16
/* B8F8 8001DCD8 40100300 */  sll        $v0, $v1, 1
/* B8FC 8001DCDC 12300000 */  mflo       $a2
/* B900 8001DCE0 21104300 */  addu       $v0, $v0, $v1
/* B904 8001DCE4 21882202 */  addu       $s1, $s1, $v0
/* B908 8001DCE8 18003102 */  mult       $s1, $s1
/* B90C 8001DCEC 74038286 */  lh         $v0, 0x374($s4)
/* B910 8001DCF0 74006396 */  lhu        $v1, 0x74($s3)
/* B914 8001DCF4 80800200 */  sll        $s0, $v0, 2
/* B918 8001DCF8 21800202 */  addu       $s0, $s0, $v0
/* B91C 8001DCFC 001C0300 */  sll        $v1, $v1, 16
/* B920 8001DD00 031C0300 */  sra        $v1, $v1, 16
/* B924 8001DD04 40100300 */  sll        $v0, $v1, 1
/* B928 8001DD08 12200000 */  mflo       $a0
/* B92C 8001DD0C 21104300 */  addu       $v0, $v0, $v1
/* B930 8001DD10 21800202 */  addu       $s0, $s0, $v0
/* B934 8001DD14 18001002 */  mult       $s0, $s0
/* B938 8001DD18 18000524 */  addiu      $a1, $zero, 0x18
/* B93C 8001DD1C 2120C400 */  addu       $a0, $a2, $a0
/* B940 8001DD20 12180000 */  mflo       $v1
/* B944 8001DD24 1C64010C */  jal        VehCalc_FastSqrt
/* B948 8001DD28 21208300 */   addu      $a0, $a0, $v1
/* B94C 8001DD2C 02230200 */  srl        $a0, $v0, 12
/* B950 8001DD30 00931200 */  sll        $s2, $s2, 12
/* B954 8001DD34 1A004402 */  div        $zero, $s2, $a0
/* B958 8001DD38 02008014 */  bnez       $a0, .L8001DD44
/* B95C 8001DD3C 00000000 */   nop
/* B960 8001DD40 0D000700 */  break      7
.L8001DD44:
/* B964 8001DD44 FFFF0124 */  addiu      $at, $zero, -0x1
/* B968 8001DD48 04008114 */  bne        $a0, $at, .L8001DD5C
/* B96C 8001DD4C 0080013C */   lui       $at, (0x80000000 >> 16)
/* B970 8001DD50 02004116 */  bne        $s2, $at, .L8001DD5C
/* B974 8001DD54 00000000 */   nop
/* B978 8001DD58 0D000600 */  break      6
.L8001DD5C:
/* B97C 8001DD5C 12900000 */  mflo       $s2
/* B980 8001DD60 008B1100 */  sll        $s1, $s1, 12
/* B984 8001DD64 00000000 */  nop
/* B988 8001DD68 1A002402 */  div        $zero, $s1, $a0
/* B98C 8001DD6C 02008014 */  bnez       $a0, .L8001DD78
/* B990 8001DD70 00000000 */   nop
/* B994 8001DD74 0D000700 */  break      7
.L8001DD78:
/* B998 8001DD78 FFFF0124 */  addiu      $at, $zero, -0x1
/* B99C 8001DD7C 04008114 */  bne        $a0, $at, .L8001DD90
/* B9A0 8001DD80 0080013C */   lui       $at, (0x80000000 >> 16)
/* B9A4 8001DD84 02002116 */  bne        $s1, $at, .L8001DD90
/* B9A8 8001DD88 00000000 */   nop
/* B9AC 8001DD8C 0D000600 */  break      6
.L8001DD90:
/* B9B0 8001DD90 12880000 */  mflo       $s1
/* B9B4 8001DD94 00831000 */  sll        $s0, $s0, 12
/* B9B8 8001DD98 00000000 */  nop
/* B9BC 8001DD9C 1A000402 */  div        $zero, $s0, $a0
/* B9C0 8001DDA0 02008014 */  bnez       $a0, .L8001DDAC
/* B9C4 8001DDA4 00000000 */   nop
/* B9C8 8001DDA8 0D000700 */  break      7
.L8001DDAC:
/* B9CC 8001DDAC FFFF0124 */  addiu      $at, $zero, -0x1
/* B9D0 8001DDB0 04008114 */  bne        $a0, $at, .L8001DDC4
/* B9D4 8001DDB4 0080013C */   lui       $at, (0x80000000 >> 16)
/* B9D8 8001DDB8 02000116 */  bne        $s0, $at, .L8001DDC4
/* B9DC 8001DDBC 00000000 */   nop
/* B9E0 8001DDC0 0D000600 */  break      6
.L8001DDC4:
/* B9E4 8001DDC4 12800000 */  mflo       $s0
/* B9E8 8001DDC8 700392A6 */  sh         $s2, 0x370($s4)
/* B9EC 8001DDCC 720391A6 */  sh         $s1, 0x372($s4)
/* B9F0 8001DDD0 740390A6 */  sh         $s0, 0x374($s4)
/* B9F4 8001DDD4 8000628E */  lw         $v0, 0x80($s3)
/* B9F8 8001DDD8 00000000 */  nop
/* B9FC 8001DDDC 12004294 */  lhu        $v0, 0x12($v0)
/* BA00 8001DDE0 00000000 */  nop
/* BA04 8001DDE4 80004230 */  andi       $v0, $v0, 0x80
/* BA08 8001DDE8 05004010 */  beqz       $v0, .L8001DE00
/* BA0C 8001DDEC 0100033C */   lui       $v1, (0x10000 >> 16)
/* BA10 8001DDF0 C802828E */  lw         $v0, 0x2C8($s4)
/* BA14 8001DDF4 00000000 */  nop
/* BA18 8001DDF8 25104300 */  or         $v0, $v0, $v1
/* BA1C 8001DDFC C80282AE */  sw         $v0, 0x2C8($s4)
.L8001DE00:
/* BA20 8001DE00 8000628E */  lw         $v0, 0x80($s3)
/* BA24 8001DE04 00000000 */  nop
/* BA28 8001DE08 500382AE */  sw         $v0, 0x350($s4)
/* BA2C 8001DE0C D002828E */  lw         $v0, 0x2D0($s4)
/* BA30 8001DE10 D802848E */  lw         $a0, 0x2D8($s4)
/* BA34 8001DE14 00104224 */  addiu      $v0, $v0, 0x1000
/* BA38 8001DE18 2A104400 */  slt        $v0, $v0, $a0
/* BA3C 8001DE1C 09004010 */  beqz       $v0, .L8001DE44
/* BA40 8001DE20 00000000 */   nop
/* BA44 8001DE24 8000628E */  lw         $v0, 0x80($s3)
/* BA48 8001DE28 00000000 */  nop
/* BA4C 8001DE2C 38004390 */  lbu        $v1, 0x38($v0)
/* BA50 8001DE30 0E000224 */  addiu      $v0, $zero, 0xE
/* BA54 8001DE34 AB006214 */  bne        $v1, $v0, .L8001E0E4
/* BA58 8001DE38 00800234 */   ori       $v0, $zero, 0x8000
/* BA5C 8001DE3C A900801C */  bgtz       $a0, .L8001E0E4
/* BA60 8001DE40 00000000 */   nop
.L8001DE44:
/* BA64 8001DE44 8000628E */  lw         $v0, 0x80($s3)
/* BA68 8001DE48 00000000 */  nop
/* BA6C 8001DE4C 12004294 */  lhu        $v0, 0x12($v0)
/* BA70 8001DE50 00000000 */  nop
/* BA74 8001DE54 00104230 */  andi       $v0, $v0, 0x1000
/* BA78 8001DE58 09004010 */  beqz       $v0, .L8001DE80
/* BA7C 8001DE5C 00000000 */   nop
/* BA80 8001DE60 7000628E */  lw         $v0, 0x70($s3)
/* BA84 8001DE64 00000000 */  nop
/* BA88 8001DE68 A40082AE */  sw         $v0, 0xA4($s4)
/* BA8C 8001DE6C AA008296 */  lhu        $v0, 0xAA($s4)
/* BA90 8001DE70 74006396 */  lhu        $v1, 0x74($s3)
/* BA94 8001DE74 08004234 */  ori        $v0, $v0, 0x8
/* BA98 8001DE78 AA0082A6 */  sh         $v0, 0xAA($s4)
/* BA9C 8001DE7C A80083A6 */  sh         $v1, 0xA8($s4)
.L8001DE80:
/* BAA0 8001DE80 A000828E */  lw         $v0, 0xA0($s4)
/* BAA4 8001DE84 00000000 */  nop
/* BAA8 8001DE88 08004014 */  bnez       $v0, .L8001DEAC
/* BAAC 8001DE8C 00000000 */   nop
/* BAB0 8001DE90 8000628E */  lw         $v0, 0x80($s3)
/* BAB4 8001DE94 7000638E */  lw         $v1, 0x70($s3)
/* BAB8 8001DE98 A00082AE */  sw         $v0, 0xA0($s4)
/* BABC 8001DE9C 600383AE */  sw         $v1, 0x360($s4)
/* BAC0 8001DEA0 74006296 */  lhu        $v0, 0x74($s3)
/* BAC4 8001DEA4 00000000 */  nop
/* BAC8 8001DEA8 640382A6 */  sh         $v0, 0x364($s4)
.L8001DEAC:
/* BACC 8001DEAC CC00698E */  lw         $t1, 0xCC($s3)
/* BAD0 8001DEB0 00000000 */  nop
/* BAD4 8001DEB4 8B002011 */  beqz       $t1, .L8001E0E4
/* BAD8 8001DEB8 00800234 */   ori       $v0, $zero, 0x8000
/* BADC 8001DEBC D000658E */  lw         $a1, 0xD0($s3)
/* BAE0 8001DEC0 00000000 */  nop
/* BAE4 8001DEC4 8700A010 */  beqz       $a1, .L8001E0E4
/* BAE8 8001DEC8 00000000 */   nop
/* BAEC 8001DECC D400688E */  lw         $t0, 0xD4($s3)
/* BAF0 8001DED0 00000000 */  nop
/* BAF4 8001DED4 83000011 */  beqz       $t0, .L8001E0E4
/* BAF8 8001DED8 00000000 */   nop
/* BAFC 8001DEDC 0800A290 */  lbu        $v0, 0x8($a1)
/* BB00 8001DEE0 08002791 */  lbu        $a3, 0x8($t1)
/* BB04 8001DEE4 C8006486 */  lh         $a0, 0xC8($s3)
/* BB08 8001DEE8 23104700 */  subu       $v0, $v0, $a3
/* BB0C 8001DEEC 18008200 */  mult       $a0, $v0
/* BB10 8001DEF0 08000291 */  lbu        $v0, 0x8($t0)
/* BB14 8001DEF4 12680000 */  mflo       $t5
/* BB18 8001DEF8 CA006386 */  lh         $v1, 0xCA($s3)
/* BB1C 8001DEFC 23104700 */  subu       $v0, $v0, $a3
/* BB20 8001DF00 18006200 */  mult       $v1, $v0
/* BB24 8001DF04 09002691 */  lbu        $a2, 0x9($t1)
/* BB28 8001DF08 0900A290 */  lbu        $v0, 0x9($a1)
/* BB2C 8001DF0C 12600000 */  mflo       $t4
/* BB30 8001DF10 23104600 */  subu       $v0, $v0, $a2
/* BB34 8001DF14 00000000 */  nop
/* BB38 8001DF18 18008200 */  mult       $a0, $v0
/* BB3C 8001DF1C 09000291 */  lbu        $v0, 0x9($t0)
/* BB40 8001DF20 12580000 */  mflo       $t3
/* BB44 8001DF24 23104600 */  subu       $v0, $v0, $a2
/* BB48 8001DF28 00000000 */  nop
/* BB4C 8001DF2C 18006200 */  mult       $v1, $v0
/* BB50 8001DF30 0A00A290 */  lbu        $v0, 0xA($a1)
/* BB54 8001DF34 0A002591 */  lbu        $a1, 0xA($t1)
/* BB58 8001DF38 12500000 */  mflo       $t2
/* BB5C 8001DF3C 23104500 */  subu       $v0, $v0, $a1
/* BB60 8001DF40 00000000 */  nop
/* BB64 8001DF44 18008200 */  mult       $a0, $v0
/* BB68 8001DF48 0A000291 */  lbu        $v0, 0xA($t0)
/* BB6C 8001DF4C 12480000 */  mflo       $t1
/* BB70 8001DF50 23104500 */  subu       $v0, $v0, $a1
/* BB74 8001DF54 00000000 */  nop
/* BB78 8001DF58 18006200 */  mult       $v1, $v0
/* BB7C 8001DF5C 03130D00 */  sra        $v0, $t5, 12
/* BB80 8001DF60 031B0C00 */  sra        $v1, $t4, 12
/* BB84 8001DF64 21104300 */  addu       $v0, $v0, $v1
/* BB88 8001DF68 21204700 */  addu       $a0, $v0, $a3
/* BB8C 8001DF6C 03130B00 */  sra        $v0, $t3, 12
/* BB90 8001DF70 031B0A00 */  sra        $v1, $t2, 12
/* BB94 8001DF74 21104300 */  addu       $v0, $v0, $v1
/* BB98 8001DF78 21304600 */  addu       $a2, $v0, $a2
/* BB9C 8001DF7C 03130900 */  sra        $v0, $t1, 12
/* BBA0 8001DF80 12400000 */  mflo       $t0
/* BBA4 8001DF84 031B0800 */  sra        $v1, $t0, 12
/* BBA8 8001DF88 21104300 */  addu       $v0, $v0, $v1
/* BBAC 8001DF8C 02008104 */  bgez       $a0, .L8001DF98
/* BBB0 8001DF90 21284500 */   addu      $a1, $v0, $a1
/* BBB4 8001DF94 21200000 */  addu       $a0, $zero, $zero
.L8001DF98:
/* BBB8 8001DF98 00018228 */  slti       $v0, $a0, 0x100
/* BBBC 8001DF9C 02004014 */  bnez       $v0, .L8001DFA8
/* BBC0 8001DFA0 00000000 */   nop
/* BBC4 8001DFA4 FF000424 */  addiu      $a0, $zero, 0xFF
.L8001DFA8:
/* BBC8 8001DFA8 0300C104 */  bgez       $a2, .L8001DFB8
/* BBCC 8001DFAC 0001C228 */   slti      $v0, $a2, 0x100
/* BBD0 8001DFB0 21300000 */  addu       $a2, $zero, $zero
/* BBD4 8001DFB4 0001C228 */  slti       $v0, $a2, 0x100
.L8001DFB8:
/* BBD8 8001DFB8 02004014 */  bnez       $v0, .L8001DFC4
/* BBDC 8001DFBC 00000000 */   nop
/* BBE0 8001DFC0 FF000624 */  addiu      $a2, $zero, 0xFF
.L8001DFC4:
/* BBE4 8001DFC4 0300A104 */  bgez       $a1, .L8001DFD4
/* BBE8 8001DFC8 0001A228 */   slti      $v0, $a1, 0x100
/* BBEC 8001DFCC 21280000 */  addu       $a1, $zero, $zero
/* BBF0 8001DFD0 0001A228 */  slti       $v0, $a1, 0x100
.L8001DFD4:
/* BBF4 8001DFD4 02004014 */  bnez       $v0, .L8001DFE0
/* BBF8 8001DFD8 80180400 */   sll       $v1, $a0, 2
/* BBFC 8001DFDC FF000524 */  addiu      $a1, $zero, 0xFF
.L8001DFE0:
/* BC00 8001DFE0 21186400 */  addu       $v1, $v1, $a0
/* BC04 8001DFE4 80180300 */  sll        $v1, $v1, 2
/* BC08 8001DFE8 23186400 */  subu       $v1, $v1, $a0
/* BC0C 8001DFEC 80180300 */  sll        $v1, $v1, 2
/* BC10 8001DFF0 031A0300 */  sra        $v1, $v1, 8
/* BC14 8001DFF4 80200600 */  sll        $a0, $a2, 2
/* BC18 8001DFF8 21208600 */  addu       $a0, $a0, $a2
/* BC1C 8001DFFC 00110400 */  sll        $v0, $a0, 4
/* BC20 8001E000 23104400 */  subu       $v0, $v0, $a0
/* BC24 8001E004 40100200 */  sll        $v0, $v0, 1
/* BC28 8001E008 03120200 */  sra        $v0, $v0, 8
/* BC2C 8001E00C 21186200 */  addu       $v1, $v1, $v0
/* BC30 8001E010 00110500 */  sll        $v0, $a1, 4
/* BC34 8001E014 23104500 */  subu       $v0, $v0, $a1
/* BC38 8001E018 40100200 */  sll        $v0, $v0, 1
/* BC3C 8001E01C 03120200 */  sra        $v0, $v0, 8
/* BC40 8001E020 21186200 */  addu       $v1, $v1, $v0
/* BC44 8001E024 40190300 */  sll        $v1, $v1, 5
/* BC48 8001E028 000C0224 */  addiu      $v0, $zero, 0xC00
/* BC4C 8001E02C 23284300 */  subu       $a1, $v0, $v1
/* BC50 8001E030 0300A104 */  bgez       $a1, .L8001E040
/* BC54 8001E034 0110A228 */   slti      $v0, $a1, 0x1001
/* BC58 8001E038 21280000 */  addu       $a1, $zero, $zero
/* BC5C 8001E03C 0110A228 */  slti       $v0, $a1, 0x1001
.L8001E040:
/* BC60 8001E040 03004014 */  bnez       $v0, .L8001E050
/* BC64 8001E044 C0200500 */   sll       $a0, $a1, 3
/* BC68 8001E048 00100524 */  addiu      $a1, $zero, 0x1000
/* BC6C 8001E04C C0200500 */  sll        $a0, $a1, 3
.L8001E050:
/* BC70 8001E050 23208500 */  subu       $a0, $a0, $a1
/* BC74 8001E054 08058396 */  lhu        $v1, 0x508($s4)
/* BC78 8001E058 C0200400 */  sll        $a0, $a0, 3
/* BC7C 8001E05C 40100300 */  sll        $v0, $v1, 1
/* BC80 8001E060 21104300 */  addu       $v0, $v0, $v1
/* BC84 8001E064 C0100200 */  sll        $v0, $v0, 3
/* BC88 8001E068 21104300 */  addu       $v0, $v0, $v1
/* BC8C 8001E06C C0100200 */  sll        $v0, $v0, 3
/* BC90 8001E070 21104400 */  addu       $v0, $v0, $a0
/* BC94 8001E074 03120200 */  sra        $v0, $v0, 8
/* BC98 8001E078 080582A6 */  sh         $v0, 0x508($s4)
/* BC9C 8001E07C 2200A396 */  lhu        $v1, 0x22($s5)
/* BCA0 8001E080 00000000 */  nop
/* BCA4 8001E084 40100300 */  sll        $v0, $v1, 1
/* BCA8 8001E088 21104300 */  addu       $v0, $v0, $v1
/* BCAC 8001E08C C0100200 */  sll        $v0, $v0, 3
/* BCB0 8001E090 21104300 */  addu       $v0, $v0, $v1
/* BCB4 8001E094 C0100200 */  sll        $v0, $v0, 3
/* BCB8 8001E098 21104400 */  addu       $v0, $v0, $a0
/* BCBC 8001E09C 03120200 */  sra        $v0, $v0, 8
/* BCC0 8001E0A0 38780008 */  j          .L8001E0E0
/* BCC4 8001E0A4 2200A2A6 */   sh        $v0, 0x22($s5)
.L8001E0A8:
/* BCC8 8001E0A8 4A008292 */  lbu        $v0, 0x4A($s4)
/* BCCC 8001E0AC 00000000 */  nop
/* BCD0 8001E0B0 01004224 */  addiu      $v0, $v0, 0x1
/* BCD4 8001E0B4 00160200 */  sll        $v0, $v0, 24
/* BCD8 8001E0B8 00404234 */  ori        $v0, $v0, 0x4000
/* BCDC 8001E0BC 7000A2AE */  sw         $v0, 0x70($s5)
/* BCE0 8001E0C0 2800A28E */  lw         $v0, 0x28($s5)
/* BCE4 8001E0C4 00000000 */  nop
/* BCE8 8001E0C8 24104300 */  and        $v0, $v0, $v1
/* BCEC 8001E0CC 2800A2AE */  sw         $v0, 0x28($s5)
/* BCF0 8001E0D0 D802828E */  lw         $v0, 0x2D8($s4)
/* BCF4 8001E0D4 FFFF033C */  lui        $v1, (0xFFFF0000 >> 16)
/* BCF8 8001E0D8 21104300 */  addu       $v0, $v0, $v1
/* BCFC 8001E0DC D00282AE */  sw         $v0, 0x2D0($s4)
.L8001E0E0:
/* BD00 8001E0E0 00800234 */  ori        $v0, $zero, 0x8000
.L8001E0E4:
/* BD04 8001E0E4 D002838E */  lw         $v1, 0x2D0($s4)
/* BD08 8001E0E8 D802848E */  lw         $a0, 0x2D8($s4)
/* BD0C 8001E0EC 21186200 */  addu       $v1, $v1, $v0
/* BD10 8001E0F0 2A186400 */  slt        $v1, $v1, $a0
/* BD14 8001E0F4 04006010 */  beqz       $v1, .L8001E108
/* BD18 8001E0F8 00000000 */   nop
/* BD1C 8001E0FC 1A5F010C */  jal        DECOMP_VehAfterColl_GetTerrain
/* BD20 8001E100 0A000424 */   addiu     $a0, $zero, 0xA
/* BD24 8001E104 5C0382AE */  sw         $v0, 0x35C($s4)
.L8001E108:
/* BD28 8001E108 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* BD2C 8001E10C ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* BD30 8001E110 00000000 */  nop
/* BD34 8001E114 6001428C */  lw         $v0, 0x160($v0)
/* BD38 8001E118 00000000 */  nop
/* BD3C 8001E11C 0000428C */  lw         $v0, 0x0($v0)
/* BD40 8001E120 00000000 */  nop
/* BD44 8001E124 1800428C */  lw         $v0, 0x18($v0)
/* BD48 8001E128 00000000 */  nop
/* BD4C 8001E12C 06004284 */  lh         $v0, 0x6($v0)
/* BD50 8001E130 D802838E */  lw         $v1, 0x2D8($s4)
/* BD54 8001E134 C0FF4224 */  addiu      $v0, $v0, -0x40
/* BD58 8001E138 00120200 */  sll        $v0, $v0, 8
/* BD5C 8001E13C 2A186200 */  slt        $v1, $v1, $v0
/* BD60 8001E140 05006010 */  beqz       $v1, .L8001E158
/* BD64 8001E144 00000000 */   nop
/* BD68 8001E148 AA008296 */  lhu        $v0, 0xAA($s4)
/* BD6C 8001E14C 00000000 */  nop
/* BD70 8001E150 01004234 */  ori        $v0, $v0, 0x1
/* BD74 8001E154 AA0082A6 */  sh         $v0, 0xAA($s4)
.L8001E158:
/* BD78 8001E158 8C00828E */  lw         $v0, 0x8C($s4)
/* BD7C 8001E15C A403838E */  lw         $v1, 0x3A4($s4)
/* BD80 8001E160 A000848E */  lw         $a0, 0xA0($s4)
/* BD84 8001E164 00000000 */  nop
/* BD88 8001E168 1C008010 */  beqz       $a0, .L8001E1DC
/* BD8C 8001E16C 23804300 */   subu      $s0, $v0, $v1
/* BD90 8001E170 AA008296 */  lhu        $v0, 0xAA($s4)
/* BD94 8001E174 00000000 */  nop
/* BD98 8001E178 09004230 */  andi       $v0, $v0, 0x9
/* BD9C 8001E17C 17004014 */  bnez       $v0, .L8001E1DC
/* BDA0 8001E180 05000224 */   addiu     $v0, $zero, 0x5
/* BDA4 8001E184 76038392 */  lbu        $v1, 0x376($s4)
/* BDA8 8001E188 00000000 */  nop
/* BDAC 8001E18C 13006210 */  beq        $v1, $v0, .L8001E1DC
/* BDB0 8001E190 00000000 */   nop
/* BDB4 8001E194 60038396 */  lhu        $v1, 0x360($s4)
/* BDB8 8001E198 8800828E */  lw         $v0, 0x88($s4)
/* BDBC 8001E19C 62038496 */  lhu        $a0, 0x362($s4)
/* BDC0 8001E1A0 001C0300 */  sll        $v1, $v1, 16
/* BDC4 8001E1A4 431C0300 */  sra        $v1, $v1, 17
/* BDC8 8001E1A8 21104300 */  addu       $v0, $v0, $v1
/* BDCC 8001E1AC 00240400 */  sll        $a0, $a0, 16
/* BDD0 8001E1B0 43240400 */  sra        $a0, $a0, 17
/* BDD4 8001E1B4 880082AE */  sw         $v0, 0x88($s4)
/* BDD8 8001E1B8 8C00828E */  lw         $v0, 0x8C($s4)
/* BDDC 8001E1BC 64038396 */  lhu        $v1, 0x364($s4)
/* BDE0 8001E1C0 21104400 */  addu       $v0, $v0, $a0
/* BDE4 8001E1C4 001C0300 */  sll        $v1, $v1, 16
/* BDE8 8001E1C8 8C0082AE */  sw         $v0, 0x8C($s4)
/* BDEC 8001E1CC 9000828E */  lw         $v0, 0x90($s4)
/* BDF0 8001E1D0 431C0300 */  sra        $v1, $v1, 17
/* BDF4 8001E1D4 21104300 */  addu       $v0, $v0, $v1
/* BDF8 8001E1D8 900082AE */  sw         $v0, 0x90($s4)
.L8001E1DC:
/* BDFC 8001E1DC 8800828E */  lw         $v0, 0x88($s4)
/* BE00 8001E1E0 8C00838E */  lw         $v1, 0x8C($s4)
/* BE04 8001E1E4 9000848E */  lw         $a0, 0x90($s4)
/* BE08 8001E1E8 A000858E */  lw         $a1, 0xA0($s4)
/* BE0C 8001E1EC A00382AE */  sw         $v0, 0x3A0($s4)
/* BE10 8001E1F0 A40383AE */  sw         $v1, 0x3A4($s4)
/* BE14 8001E1F4 B600A010 */  beqz       $a1, .L8001E4D0
/* BE18 8001E1F8 A80384AE */   sw        $a0, 0x3A8($s4)
/* BE1C 8001E1FC 1200A494 */  lhu        $a0, 0x12($a1)
/* BE20 8001E200 00000000 */  nop
/* BE24 8001E204 00028230 */  andi       $v0, $a0, 0x200
/* BE28 8001E208 4D004014 */  bnez       $v0, .L8001E340
/* BE2C 8001E20C 05000224 */   addiu     $v0, $zero, 0x5
/* BE30 8001E210 76038392 */  lbu        $v1, 0x376($s4)
/* BE34 8001E214 00000000 */  nop
/* BE38 8001E218 5C006210 */  beq        $v1, $v0, .L8001E38C
/* BE3C 8001E21C F7FF023C */   lui       $v0, (0xFFF7FFBF >> 16)
/* BE40 8001E220 AA008796 */  lhu        $a3, 0xAA($s4)
/* BE44 8001E224 00000000 */  nop
/* BE48 8001E228 0100E230 */  andi       $v0, $a3, 0x1
/* BE4C 8001E22C 57004014 */  bnez       $v0, .L8001E38C
/* BE50 8001E230 F7FF023C */   lui       $v0, (0xFFF7FFBF >> 16)
/* BE54 8001E234 00108230 */  andi       $v0, $a0, 0x1000
/* BE58 8001E238 53004010 */  beqz       $v0, .L8001E388
/* BE5C 8001E23C FF000224 */   addiu     $v0, $zero, 0xFF
/* BE60 8001E240 3E00A390 */  lbu        $v1, 0x3E($a1)
/* BE64 8001E244 00000000 */  nop
/* BE68 8001E248 45006210 */  beq        $v1, $v0, .L8001E360
/* BE6C 8001E24C 21206000 */   addu      $a0, $v1, $zero
/* BE70 8001E250 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* BE74 8001E254 ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* BE78 8001E258 40100400 */  sll        $v0, $a0, 1
/* BE7C 8001E25C 6001638C */  lw         $v1, 0x160($v1)
/* BE80 8001E260 21104400 */  addu       $v0, $v0, $a0
/* BE84 8001E264 4C01658C */  lw         $a1, 0x14C($v1)
/* BE88 8001E268 80100200 */  sll        $v0, $v0, 2
/* BE8C 8001E26C 2130A200 */  addu       $a2, $a1, $v0
/* BE90 8001E270 C802828E */  lw         $v0, 0x2C8($s4)
/* BE94 8001E274 0001033C */  lui        $v1, (0x1000000 >> 16)
/* BE98 8001E278 24104300 */  and        $v0, $v0, $v1
/* BE9C 8001E27C 12004014 */  bnez       $v0, .L8001E2C8
/* BEA0 8001E280 00000000 */   nop
/* BEA4 8001E284 0800C290 */  lbu        $v0, 0x8($a2)
/* BEA8 8001E288 00000000 */  nop
/* BEAC 8001E28C 0200422C */  sltiu      $v0, $v0, 0x2
/* BEB0 8001E290 0D004014 */  bnez       $v0, .L8001E2C8
/* BEB4 8001E294 00000000 */   nop
/* BEB8 8001E298 0600C294 */  lhu        $v0, 0x6($a2)
/* BEBC 8001E29C 8C04848E */  lw         $a0, 0x48C($s4)
/* BEC0 8001E2A0 0600A394 */  lhu        $v1, 0x6($a1)
/* BEC4 8001E2A4 C0100200 */  sll        $v0, $v0, 3
/* BEC8 8001E2A8 23208200 */  subu       $a0, $a0, $v0
/* BECC 8001E2AC 82180300 */  srl        $v1, $v1, 2
/* BED0 8001E2B0 C0180300 */  sll        $v1, $v1, 3
/* BED4 8001E2B4 2A186400 */  slt        $v1, $v1, $a0
/* BED8 8001E2B8 03006010 */  beqz       $v1, .L8001E2C8
/* BEDC 8001E2BC 0100E234 */   ori       $v0, $a3, 0x1
/* BEE0 8001E2C0 E2780008 */  j          .L8001E388
/* BEE4 8001E2C4 AA0082A6 */   sh        $v0, 0xAA($s4)
.L8001E2C8:
/* BEE8 8001E2C8 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* BEEC 8001E2CC ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* BEF0 8001E2D0 00000000 */  nop
/* BEF4 8001E2D4 6001428C */  lw         $v0, 0x160($v0)
/* BEF8 8001E2D8 00000000 */  nop
/* BEFC 8001E2DC 4C01478C */  lw         $a3, 0x14C($v0)
/* BF00 8001E2E0 00000000 */  nop
/* BF04 8001E2E4 0600E594 */  lhu        $a1, 0x6($a3)
/* BF08 8001E2E8 0600C694 */  lhu        $a2, 0x6($a2)
/* BF0C 8001E2EC 00110500 */  sll        $v0, $a1, 4
/* BF10 8001E2F0 23104500 */  subu       $v0, $v0, $a1
/* BF14 8001E2F4 03110200 */  sra        $v0, $v0, 4
/* BF18 8001E2F8 2A10C200 */  slt        $v0, $a2, $v0
/* BF1C 8001E2FC 15004010 */  beqz       $v0, .L8001E354
/* BF20 8001E300 FF000224 */   addiu     $v0, $zero, 0xFF
/* BF24 8001E304 5403848E */  lw         $a0, 0x354($s4)
/* BF28 8001E308 00000000 */  nop
/* BF2C 8001E30C 3E008390 */  lbu        $v1, 0x3E($a0)
/* BF30 8001E310 00000000 */  nop
/* BF34 8001E314 0F006210 */  beq        $v1, $v0, .L8001E354
/* BF38 8001E318 40100300 */   sll       $v0, $v1, 1
/* BF3C 8001E31C 21104300 */  addu       $v0, $v0, $v1
/* BF40 8001E320 80100200 */  sll        $v0, $v0, 2
/* BF44 8001E324 21104700 */  addu       $v0, $v0, $a3
/* BF48 8001E328 06004294 */  lhu        $v0, 0x6($v0)
/* BF4C 8001E32C 82180500 */  srl        $v1, $a1, 2
/* BF50 8001E330 21104300 */  addu       $v0, $v0, $v1
/* BF54 8001E334 2A104600 */  slt        $v0, $v0, $a2
/* BF58 8001E338 06004010 */  beqz       $v0, .L8001E354
/* BF5C 8001E33C 00000000 */   nop
.L8001E340:
/* BF60 8001E340 AA008296 */  lhu        $v0, 0xAA($s4)
/* BF64 8001E344 00000000 */  nop
/* BF68 8001E348 01004234 */  ori        $v0, $v0, 0x1
/* BF6C 8001E34C E2780008 */  j          .L8001E388
/* BF70 8001E350 AA0082A6 */   sh        $v0, 0xAA($s4)
.L8001E354:
/* BF74 8001E354 A000828E */  lw         $v0, 0xA0($s4)
/* BF78 8001E358 E2780008 */  j          .L8001E388
/* BF7C 8001E35C 540382AE */   sw        $v0, 0x354($s4)
.L8001E360:
/* BF80 8001E360 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* BF84 8001E364 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* BF88 8001E368 00000000 */  nop
/* BF8C 8001E36C 101A428C */  lw         $v0, 0x1A10($v0)
/* BF90 8001E370 00000000 */  nop
/* BF94 8001E374 E7FF4224 */  addiu      $v0, $v0, -0x19
/* BF98 8001E378 0500422C */  sltiu      $v0, $v0, 0x5
/* BF9C 8001E37C 03004010 */  beqz       $v0, .L8001E38C
/* BFA0 8001E380 F7FF023C */   lui       $v0, (0xFFF7FFBF >> 16)
/* BFA4 8001E384 540385AE */  sw         $a1, 0x354($s4)
.L8001E388:
/* BFA8 8001E388 F7FF023C */  lui        $v0, (0xFFF7FFBF >> 16)
.L8001E38C:
/* BFAC 8001E38C C802838E */  lw         $v1, 0x2C8($s4)
/* BFB0 8001E390 AA008496 */  lhu        $a0, 0xAA($s4)
/* BFB4 8001E394 BFFF4234 */  ori        $v0, $v0, (0xFFF7FFBF & 0xFFFF)
/* BFB8 8001E398 FC0380A6 */  sh         $zero, 0x3FC($s4)
/* BFBC 8001E39C 24186200 */  and        $v1, $v1, $v0
/* BFC0 8001E3A0 08008430 */  andi       $a0, $a0, 0x8
/* BFC4 8001E3A4 4A008010 */  beqz       $a0, .L8001E4D0
/* BFC8 8001E3A8 C80283AE */   sw        $v1, 0x2C8($s4)
/* BFCC 8001E3AC 0A058386 */  lh         $v1, 0x50A($s4)
/* BFD0 8001E3B0 02000224 */  addiu      $v0, $zero, 0x2
/* BFD4 8001E3B4 09006210 */  beq        $v1, $v0, .L8001E3DC
/* BFD8 8001E3B8 0800033C */   lui       $v1, (0x80000 >> 16)
/* BFDC 8001E3BC 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* BFE0 8001E3C0 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* BFE4 8001E3C4 00000000 */  nop
/* BFE8 8001E3C8 0800428C */  lw         $v0, 0x8($v0)
/* BFEC 8001E3CC 00000000 */  nop
/* BFF0 8001E3D0 24104300 */  and        $v0, $v0, $v1
/* BFF4 8001E3D4 05004010 */  beqz       $v0, .L8001E3EC
/* BFF8 8001E3D8 06000324 */   addiu     $v1, $zero, 0x6
.L8001E3DC:
/* BFFC 8001E3DC 06000224 */  addiu      $v0, $zero, 0x6
/* C000 8001E3E0 C20082A2 */  sb         $v0, 0xC2($s4)
/* C004 8001E3E4 07790008 */  j          .L8001E41C
/* C008 8001E3E8 06000424 */   addiu     $a0, $zero, 0x6
.L8001E3EC:
/* C00C 8001E3EC A000828E */  lw         $v0, 0xA0($s4)
/* C010 8001E3F0 00000000 */  nop
/* C014 8001E3F4 38004490 */  lbu        $a0, 0x38($v0)
/* C018 8001E3F8 00000000 */  nop
/* C01C 8001E3FC 06008310 */  beq        $a0, $v1, .L8001E418
/* C020 8001E400 00000000 */   nop
/* C024 8001E404 C2008292 */  lbu        $v0, 0xC2($s4)
/* C028 8001E408 00000000 */  nop
/* C02C 8001E40C 02004314 */  bne        $v0, $v1, .L8001E418
/* C030 8001E410 C0FE0224 */   addiu     $v0, $zero, -0x140
/* C034 8001E414 140482A6 */  sh         $v0, 0x414($s4)
.L8001E418:
/* C038 8001E418 C20084A2 */  sb         $a0, 0xC2($s4)
.L8001E41C:
/* C03C 8001E41C 1A5F010C */  jal        DECOMP_VehAfterColl_GetTerrain
/* C040 8001E420 00000000 */   nop
/* C044 8001E424 580382AE */  sw         $v0, 0x358($s4)
/* C048 8001E428 5C0382AE */  sw         $v0, 0x35C($s4)
/* C04C 8001E42C A0000224 */  addiu      $v0, $zero, 0xA0
/* C050 8001E430 F40382A6 */  sh         $v0, 0x3F4($s4)
/* C054 8001E434 C802828E */  lw         $v0, 0x2C8($s4)
/* C058 8001E438 CC02838E */  lw         $v1, 0x2CC($s4)
/* C05C 8001E43C 01004234 */  ori        $v0, $v0, 0x1
/* C060 8001E440 01006330 */  andi       $v1, $v1, 0x1
/* C064 8001E444 20006014 */  bnez       $v1, .L8001E4C8
/* C068 8001E448 C80282AE */   sw        $v0, 0x2C8($s4)
/* C06C 8001E44C 02000106 */  bgez       $s0, .L8001E458
/* C070 8001E450 21200002 */   addu      $a0, $s0, $zero
/* C074 8001E454 23200400 */  negu       $a0, $a0
.L8001E458:
/* C078 8001E458 00010524 */  addiu      $a1, $zero, 0x100
/* C07C 8001E45C 003C0624 */  addiu      $a2, $zero, 0x3C00
/* C080 8001E460 78000724 */  addiu      $a3, $zero, 0x78
/* C084 8001E464 40010324 */  addiu      $v1, $zero, 0x140
/* C088 8001E468 82004234 */  ori        $v0, $v0, 0x82
/* C08C 8001E46C C80282AE */  sw         $v0, 0x2C8($s4)
/* C090 8001E470 FA000224 */  addiu      $v0, $zero, 0xFA
/* C094 8001E474 140483A6 */  sh         $v1, 0x414($s4)
/* C098 8001E478 E763010C */  jal        DECOMP_VehCalc_MapToRange
/* C09C 8001E47C 1000A2AF */   sw        $v0, 0x10($sp)
/* C0A0 8001E480 21204000 */  addu       $a0, $v0, $zero
/* C0A4 8001E484 76038392 */  lbu        $v1, 0x376($s4)
/* C0A8 8001E488 05000224 */  addiu      $v0, $zero, 0x5
/* C0AC 8001E48C 0E006210 */  beq        $v1, $v0, .L8001E4C8
/* C0B0 8001E490 FF008230 */   andi      $v0, $a0, 0xFF
/* C0B4 8001E494 00340200 */  sll        $a2, $v0, 16
/* C0B8 8001E498 C802828E */  lw         $v0, 0x2C8($s4)
/* C0BC 8001E49C 0100033C */  lui        $v1, (0x10000 >> 16)
/* C0C0 8001E4A0 24104300 */  and        $v0, $v0, $v1
/* C0C4 8001E4A4 04004010 */  beqz       $v0, .L8001E4B8
/* C0C8 8001E4A8 0001023C */   lui       $v0, (0x1008080 >> 16)
/* C0CC 8001E4AC 80804234 */  ori        $v0, $v0, (0x1008080 & 0xFFFF)
/* C0D0 8001E4B0 2F790008 */  j          .L8001E4BC
/* C0D4 8001E4B4 2530C200 */   or        $a2, $a2, $v0
.L8001E4B8:
/* C0D8 8001E4B8 8080C634 */  ori        $a2, $a2, 0x8080
.L8001E4BC:
/* C0DC 8001E4BC 07000424 */  addiu      $a0, $zero, 0x7
/* C0E0 8001E4C0 34A1000C */  jal        DECOMP_OtherFX_Play_LowLevel
/* C0E4 8001E4C4 01000524 */   addiu     $a1, $zero, 0x1
.L8001E4C8:
/* C0E8 8001E4C8 63790008 */  j          .L8001E58C
/* C0EC 8001E4CC 06000424 */   addiu     $a0, $zero, 0x6
.L8001E4D0:
/* C0F0 8001E4D0 F2038286 */  lh         $v0, 0x3F2($s4)
/* C0F4 8001E4D4 00000000 */  nop
/* C0F8 8001E4D8 05004010 */  beqz       $v0, .L8001E4F0
/* C0FC 8001E4DC 0800033C */   lui       $v1, (0x80000 >> 16)
/* C100 8001E4E0 C802828E */  lw         $v0, 0x2C8($s4)
/* C104 8001E4E4 00000000 */  nop
/* C108 8001E4E8 25104300 */  or         $v0, $v0, $v1
/* C10C 8001E4EC C80282AE */  sw         $v0, 0x2C8($s4)
.L8001E4F0:
/* C110 8001E4F0 FA038286 */  lh         $v0, 0x3FA($s4)
/* C114 8001E4F4 00000000 */  nop
/* C118 8001E4F8 05004010 */  beqz       $v0, .L8001E510
/* C11C 8001E4FC 00000000 */   nop
/* C120 8001E500 C802828E */  lw         $v0, 0x2C8($s4)
/* C124 8001E504 00000000 */  nop
/* C128 8001E508 40004234 */  ori        $v0, $v0, 0x40
/* C12C 8001E50C C80282AE */  sw         $v0, 0x2C8($s4)
.L8001E510:
/* C130 8001E510 1A5F010C */  jal        DECOMP_VehAfterColl_GetTerrain
/* C134 8001E514 0A000424 */   addiu     $a0, $zero, 0xA
/* C138 8001E518 580382AE */  sw         $v0, 0x358($s4)
/* C13C 8001E51C 0A000224 */  addiu      $v0, $zero, 0xA
/* C140 8001E520 FEFF0324 */  addiu      $v1, $zero, -0x2
/* C144 8001E524 C20082A2 */  sb         $v0, 0xC2($s4)
/* C148 8001E528 C802828E */  lw         $v0, 0x2C8($s4)
/* C14C 8001E52C 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* C150 8001E530 ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* C154 8001E534 24104300 */  and        $v0, $v0, $v1
/* C158 8001E538 C80282AE */  sw         $v0, 0x2C8($s4)
/* C15C 8001E53C FC038296 */  lhu        $v0, 0x3FC($s4)
/* C160 8001E540 041D8394 */  lhu        $v1, 0x1D04($a0)
/* C164 8001E544 00000000 */  nop
/* C168 8001E548 21104300 */  addu       $v0, $v0, $v1
/* C16C 8001E54C FC0382A6 */  sh         $v0, 0x3FC($s4)
/* C170 8001E550 F4038296 */  lhu        $v0, 0x3F4($s4)
/* C174 8001E554 041D8394 */  lhu        $v1, 0x1D04($a0)
/* C178 8001E558 00000000 */  nop
/* C17C 8001E55C 23104300 */  subu       $v0, $v0, $v1
/* C180 8001E560 F40382A6 */  sh         $v0, 0x3F4($s4)
/* C184 8001E564 00140200 */  sll        $v0, $v0, 16
/* C188 8001E568 02004104 */  bgez       $v0, .L8001E574
/* C18C 8001E56C 00000000 */   nop
/* C190 8001E570 F40380A6 */  sh         $zero, 0x3F4($s4)
.L8001E574:
/* C194 8001E574 F4038286 */  lh         $v0, 0x3F4($s4)
/* C198 8001E578 00000000 */  nop
/* C19C 8001E57C 03004014 */  bnez       $v0, .L8001E58C
/* C1A0 8001E580 07000424 */   addiu     $a0, $zero, 0x7
/* C1A4 8001E584 F20380A6 */  sh         $zero, 0x3F2($s4)
/* C1A8 8001E588 FA0380A6 */  sh         $zero, 0x3FA($s4)
.L8001E58C:
/* C1AC 8001E58C 68038286 */  lh         $v0, 0x368($s4)
/* C1B0 8001E590 00000000 */  nop
/* C1B4 8001E594 18008200 */  mult       $a0, $v0
/* C1B8 8001E598 08000324 */  addiu      $v1, $zero, 0x8
/* C1BC 8001E59C 12280000 */  mflo       $a1
/* C1C0 8001E5A0 A4008286 */  lh         $v0, 0xA4($s4)
/* C1C4 8001E5A4 23186400 */  subu       $v1, $v1, $a0
/* C1C8 8001E5A8 18006200 */  mult       $v1, $v0
/* C1CC 8001E5AC 12400000 */  mflo       $t0
/* C1D0 8001E5B0 2110A800 */  addu       $v0, $a1, $t0
/* C1D4 8001E5B4 C3100200 */  sra        $v0, $v0, 3
/* C1D8 8001E5B8 1800A2AF */  sw         $v0, 0x18($sp)
/* C1DC 8001E5BC 6A038286 */  lh         $v0, 0x36A($s4)
/* C1E0 8001E5C0 00000000 */  nop
/* C1E4 8001E5C4 18008200 */  mult       $a0, $v0
/* C1E8 8001E5C8 12280000 */  mflo       $a1
/* C1EC 8001E5CC A6008286 */  lh         $v0, 0xA6($s4)
/* C1F0 8001E5D0 00000000 */  nop
/* C1F4 8001E5D4 18006200 */  mult       $v1, $v0
/* C1F8 8001E5D8 12400000 */  mflo       $t0
/* C1FC 8001E5DC 2110A800 */  addu       $v0, $a1, $t0
/* C200 8001E5E0 C3100200 */  sra        $v0, $v0, 3
/* C204 8001E5E4 1C00A2AF */  sw         $v0, 0x1C($sp)
/* C208 8001E5E8 6C038286 */  lh         $v0, 0x36C($s4)
/* C20C 8001E5EC 00000000 */  nop
/* C210 8001E5F0 18008200 */  mult       $a0, $v0
/* C214 8001E5F4 12200000 */  mflo       $a0
/* C218 8001E5F8 A8008286 */  lh         $v0, 0xA8($s4)
/* C21C 8001E5FC 00000000 */  nop
/* C220 8001E600 18006200 */  mult       $v1, $v0
/* C224 8001E604 12180000 */  mflo       $v1
/* C228 8001E608 21108300 */  addu       $v0, $a0, $v1
/* C22C 8001E60C C3100200 */  sra        $v0, $v0, 3
/* C230 8001E610 2000A2AF */  sw         $v0, 0x20($sp)
/* C234 8001E614 0E008386 */  lh         $v1, 0xE($s4)
/* C238 8001E618 00000000 */  nop
/* C23C 8001E61C 36006018 */  blez       $v1, .L8001E6F8
/* C240 8001E620 40100300 */   sll       $v0, $v1, 1
/* C244 8001E624 21104300 */  addu       $v0, $v0, $v1
/* C248 8001E628 80280200 */  sll        $a1, $v0, 2
/* C24C 8001E62C 0880033C */  lui        $v1, %hi(D_800845A0)
/* C250 8001E630 A0456324 */  addiu      $v1, $v1, %lo(D_800845A0)
/* C254 8001E634 FF03A230 */  andi       $v0, $a1, 0x3FF
/* C258 8001E638 80100200 */  sll        $v0, $v0, 2
/* C25C 8001E63C 21104300 */  addu       $v0, $v0, $v1
/* C260 8001E640 0000438C */  lw         $v1, 0x0($v0)
/* C264 8001E644 0004A230 */  andi       $v0, $a1, 0x400
/* C268 8001E648 07004010 */  beqz       $v0, .L8001E668
/* C26C 8001E64C 00140300 */   sll       $v0, $v1, 16
/* C270 8001E650 03240200 */  sra        $a0, $v0, 16
/* C274 8001E654 0008A230 */  andi       $v0, $a1, 0x800
/* C278 8001E658 09004014 */  bnez       $v0, .L8001E680
/* C27C 8001E65C 031C0300 */   sra       $v1, $v1, 16
/* C280 8001E660 A1790008 */  j          .L8001E684
/* C284 8001E664 23200400 */   negu      $a0, $a0
.L8001E668:
/* C288 8001E668 03240300 */  sra        $a0, $v1, 16
/* C28C 8001E66C 001C0300 */  sll        $v1, $v1, 16
/* C290 8001E670 0008A230 */  andi       $v0, $a1, 0x800
/* C294 8001E674 03004010 */  beqz       $v0, .L8001E684
/* C298 8001E678 031C0300 */   sra       $v1, $v1, 16
/* C29C 8001E67C 23200400 */  negu       $a0, $a0
.L8001E680:
/* C2A0 8001E680 23180300 */  negu       $v1, $v1
.L8001E684:
/* C2A4 8001E684 40100300 */  sll        $v0, $v1, 1
/* C2A8 8001E688 21104300 */  addu       $v0, $v0, $v1
/* C2AC 8001E68C C0100200 */  sll        $v0, $v0, 3
/* C2B0 8001E690 21104300 */  addu       $v0, $v0, $v1
/* C2B4 8001E694 831A0200 */  sra        $v1, $v0, 10
/* C2B8 8001E698 40100400 */  sll        $v0, $a0, 1
/* C2BC 8001E69C 21104400 */  addu       $v0, $v0, $a0
/* C2C0 8001E6A0 C0100200 */  sll        $v0, $v0, 3
/* C2C4 8001E6A4 21104400 */  addu       $v0, $v0, $a0
/* C2C8 8001E6A8 83220200 */  sra        $a0, $v0, 10
/* C2CC 8001E6AC FFFF6230 */  andi       $v0, $v1, 0xFFFF
/* C2D0 8001E6B0 00008248 */  mtc2       $v0, $0 /* handwritten instruction */
/* C2D4 8001E6B4 00088448 */  mtc2       $a0, $1 /* handwritten instruction */
/* C2D8 8001E6B8 00000000 */  nop
/* C2DC 8001E6BC 00000000 */  nop
/* C2E0 8001E6C0 1260484A */  MVMVA      1, 0, 0, 3, 0
/* C2E4 8001E6C4 00C80348 */  mfc2       $v1, $25 /* handwritten instruction */
/* C2E8 8001E6C8 00D00548 */  mfc2       $a1, $26 /* handwritten instruction */
/* C2EC 8001E6CC 00D80448 */  mfc2       $a0, $27 /* handwritten instruction */
/* C2F0 8001E6D0 1800A28F */  lw         $v0, 0x18($sp)
/* C2F4 8001E6D4 00000000 */  nop
/* C2F8 8001E6D8 21104300 */  addu       $v0, $v0, $v1
/* C2FC 8001E6DC 1800A2AF */  sw         $v0, 0x18($sp)
/* C300 8001E6E0 1C00A28F */  lw         $v0, 0x1C($sp)
/* C304 8001E6E4 2000A38F */  lw         $v1, 0x20($sp)
/* C308 8001E6E8 21104500 */  addu       $v0, $v0, $a1
/* C30C 8001E6EC 21186400 */  addu       $v1, $v1, $a0
/* C310 8001E6F0 1C00A2AF */  sw         $v0, 0x1C($sp)
/* C314 8001E6F4 2000A3AF */  sw         $v1, 0x20($sp)
.L8001E6F8:
/* C318 8001E6F8 1800A28F */  lw         $v0, 0x18($sp)
/* C31C 8001E6FC 00000000 */  nop
/* C320 8001E700 18004200 */  mult       $v0, $v0
/* C324 8001E704 12200000 */  mflo       $a0
/* C328 8001E708 1C00A28F */  lw         $v0, 0x1C($sp)
/* C32C 8001E70C 00000000 */  nop
/* C330 8001E710 18004200 */  mult       $v0, $v0
/* C334 8001E714 12180000 */  mflo       $v1
/* C338 8001E718 2000A28F */  lw         $v0, 0x20($sp)
/* C33C 8001E71C 00000000 */  nop
/* C340 8001E720 18004200 */  mult       $v0, $v0
/* C344 8001E724 18000524 */  addiu      $a1, $zero, 0x18
/* C348 8001E728 21208300 */  addu       $a0, $a0, $v1
/* C34C 8001E72C 12400000 */  mflo       $t0
/* C350 8001E730 1C64010C */  jal        VehCalc_FastSqrt
/* C354 8001E734 21208800 */   addu      $a0, $a0, $t0
/* C358 8001E738 1800A38F */  lw         $v1, 0x18($sp)
/* C35C 8001E73C 02230200 */  srl        $a0, $v0, 12
/* C360 8001E740 001B0300 */  sll        $v1, $v1, 12
/* C364 8001E744 1A006400 */  div        $zero, $v1, $a0
/* C368 8001E748 02008014 */  bnez       $a0, .L8001E754
/* C36C 8001E74C 00000000 */   nop
/* C370 8001E750 0D000700 */  break      7
.L8001E754:
/* C374 8001E754 FFFF0124 */  addiu      $at, $zero, -0x1
/* C378 8001E758 04008114 */  bne        $a0, $at, .L8001E76C
/* C37C 8001E75C 0080013C */   lui       $at, (0x80000000 >> 16)
/* C380 8001E760 02006114 */  bne        $v1, $at, .L8001E76C
/* C384 8001E764 00000000 */   nop
/* C388 8001E768 0D000600 */  break      6
.L8001E76C:
/* C38C 8001E76C 12180000 */  mflo       $v1
/* C390 8001E770 00000000 */  nop
/* C394 8001E774 680383A6 */  sh         $v1, 0x368($s4)
/* C398 8001E778 1C00A28F */  lw         $v0, 0x1C($sp)
/* C39C 8001E77C 00000000 */  nop
/* C3A0 8001E780 00130200 */  sll        $v0, $v0, 12
/* C3A4 8001E784 1A004400 */  div        $zero, $v0, $a0
/* C3A8 8001E788 02008014 */  bnez       $a0, .L8001E794
/* C3AC 8001E78C 00000000 */   nop
/* C3B0 8001E790 0D000700 */  break      7
.L8001E794:
/* C3B4 8001E794 FFFF0124 */  addiu      $at, $zero, -0x1
/* C3B8 8001E798 04008114 */  bne        $a0, $at, .L8001E7AC
/* C3BC 8001E79C 0080013C */   lui       $at, (0x80000000 >> 16)
/* C3C0 8001E7A0 02004114 */  bne        $v0, $at, .L8001E7AC
/* C3C4 8001E7A4 00000000 */   nop
/* C3C8 8001E7A8 0D000600 */  break      6
.L8001E7AC:
/* C3CC 8001E7AC 12100000 */  mflo       $v0
/* C3D0 8001E7B0 00000000 */  nop
/* C3D4 8001E7B4 6A0382A6 */  sh         $v0, 0x36A($s4)
/* C3D8 8001E7B8 2000A28F */  lw         $v0, 0x20($sp)
/* C3DC 8001E7BC 00000000 */  nop
/* C3E0 8001E7C0 00130200 */  sll        $v0, $v0, 12
/* C3E4 8001E7C4 1A004400 */  div        $zero, $v0, $a0
/* C3E8 8001E7C8 02008014 */  bnez       $a0, .L8001E7D4
/* C3EC 8001E7CC 00000000 */   nop
/* C3F0 8001E7D0 0D000700 */  break      7
.L8001E7D4:
/* C3F4 8001E7D4 FFFF0124 */  addiu      $at, $zero, -0x1
/* C3F8 8001E7D8 04008114 */  bne        $a0, $at, .L8001E7EC
/* C3FC 8001E7DC 0080013C */   lui       $at, (0x80000000 >> 16)
/* C400 8001E7E0 02004114 */  bne        $v0, $at, .L8001E7EC
/* C404 8001E7E4 00000000 */   nop
/* C408 8001E7E8 0D000600 */  break      6
.L8001E7EC:
/* C40C 8001E7EC 12100000 */  mflo       $v0
/* C410 8001E7F0 0880033C */  lui        $v1, %hi(D_800845A0)
/* C414 8001E7F4 9A038486 */  lh         $a0, 0x39A($s4)
/* C418 8001E7F8 A0456324 */  addiu      $v1, $v1, %lo(D_800845A0)
/* C41C 8001E7FC 6C0382A6 */  sh         $v0, 0x36C($s4)
/* C420 8001E800 FF038230 */  andi       $v0, $a0, 0x3FF
/* C424 8001E804 80100200 */  sll        $v0, $v0, 2
/* C428 8001E808 21104300 */  addu       $v0, $v0, $v1
/* C42C 8001E80C 0000438C */  lw         $v1, 0x0($v0)
/* C430 8001E810 00048230 */  andi       $v0, $a0, 0x400
/* C434 8001E814 07004010 */  beqz       $v0, .L8001E834
/* C438 8001E818 00140300 */   sll       $v0, $v1, 16
/* C43C 8001E81C 032C0200 */  sra        $a1, $v0, 16
/* C440 8001E820 00088230 */  andi       $v0, $a0, 0x800
/* C444 8001E824 09004014 */  bnez       $v0, .L8001E84C
/* C448 8001E828 031C0300 */   sra       $v1, $v1, 16
/* C44C 8001E82C 147A0008 */  j          .L8001E850
/* C450 8001E830 23280500 */   negu      $a1, $a1
.L8001E834:
/* C454 8001E834 032C0300 */  sra        $a1, $v1, 16
/* C458 8001E838 001C0300 */  sll        $v1, $v1, 16
/* C45C 8001E83C 00088230 */  andi       $v0, $a0, 0x800
/* C460 8001E840 03004010 */  beqz       $v0, .L8001E850
/* C464 8001E844 031C0300 */   sra       $v1, $v1, 16
/* C468 8001E848 23280500 */  negu       $a1, $a1
.L8001E84C:
/* C46C 8001E84C 23180300 */  negu       $v1, $v1
.L8001E850:
/* C470 8001E850 68038286 */  lh         $v0, 0x368($s4)
/* C474 8001E854 00000000 */  nop
/* C478 8001E858 23100200 */  negu       $v0, $v0
/* C47C 8001E85C 18004500 */  mult       $v0, $a1
/* C480 8001E860 12200000 */  mflo       $a0
/* C484 8001E864 6C038286 */  lh         $v0, 0x36C($s4)
/* C488 8001E868 00000000 */  nop
/* C48C 8001E86C 18004300 */  mult       $v0, $v1
/* C490 8001E870 6A038586 */  lh         $a1, 0x36A($s4)
/* C494 8001E874 12180000 */  mflo       $v1
/* C498 8001E878 21208300 */  addu       $a0, $a0, $v1
/* C49C 8001E87C CFC5010C */  jal        ratan2
/* C4A0 8001E880 03230400 */   sra       $a0, $a0, 12
/* C4A4 8001E884 0E008386 */  lh         $v1, 0xE($s4)
/* C4A8 8001E888 00000000 */  nop
/* C4AC 8001E88C 16006018 */  blez       $v1, .L8001E8E8
/* C4B0 8001E890 F00282A6 */   sh        $v0, 0x2F0($s4)
/* C4B4 8001E894 77038282 */  lb         $v0, 0x377($s4)
/* C4B8 8001E898 00000000 */  nop
/* C4BC 8001E89C 02004104 */  bgez       $v0, .L8001E8A8
/* C4C0 8001E8A0 00000000 */   nop
/* C4C4 8001E8A4 23100200 */  negu       $v0, $v0
.L8001E8A8:
/* C4C8 8001E8A8 04004228 */  slti       $v0, $v0, 0x4
/* C4CC 8001E8AC 2D004010 */  beqz       $v0, .L8001E964
/* C4D0 8001E8B0 04000224 */   addiu     $v0, $zero, 0x4
/* C4D4 8001E8B4 76038392 */  lbu        $v1, 0x376($s4)
/* C4D8 8001E8B8 EE0382A6 */  sh         $v0, 0x3EE($s4)
/* C4DC 8001E8BC 03000224 */  addiu      $v0, $zero, 0x3
/* C4E0 8001E8C0 28006210 */  beq        $v1, $v0, .L8001E964
/* C4E4 8001E8C4 00000000 */   nop
/* C4E8 8001E8C8 77038282 */  lb         $v0, 0x377($s4)
/* C4EC 8001E8CC 00000000 */  nop
/* C4F0 8001E8D0 25004018 */  blez       $v0, .L8001E968
/* C4F4 8001E8D4 10000424 */   addiu     $a0, $zero, 0x10
/* C4F8 8001E8D8 1AA1000C */  jal        DECOMP_OtherFX_Play
/* C4FC 8001E8DC 01000524 */   addiu     $a1, $zero, 0x1
/* C500 8001E8E0 597A0008 */  j          .L8001E964
/* C504 8001E8E4 00000000 */   nop
.L8001E8E8:
/* C508 8001E8E8 C802828E */  lw         $v0, 0x2C8($s4)
/* C50C 8001E8EC 00000000 */  nop
/* C510 8001E8F0 01004230 */  andi       $v0, $v0, 0x1
/* C514 8001E8F4 1A004010 */  beqz       $v0, .L8001E960
/* C518 8001E8F8 00000000 */   nop
/* C51C 8001E8FC 8C038286 */  lh         $v0, 0x38C($s4)
/* C520 8001E900 00000000 */  nop
/* C524 8001E904 02004104 */  bgez       $v0, .L8001E910
/* C528 8001E908 00000000 */   nop
/* C52C 8001E90C 23100200 */  negu       $v0, $v0
.L8001E910:
/* C530 8001E910 01104228 */  slti       $v0, $v0, 0x1001
/* C534 8001E914 12004014 */  bnez       $v0, .L8001E960
/* C538 8001E918 00000000 */   nop
/* C53C 8001E91C 77038282 */  lb         $v0, 0x377($s4)
/* C540 8001E920 00000000 */  nop
/* C544 8001E924 02004104 */  bgez       $v0, .L8001E930
/* C548 8001E928 00000000 */   nop
/* C54C 8001E92C 23100200 */  negu       $v0, $v0
.L8001E930:
/* C550 8001E930 04004228 */  slti       $v0, $v0, 0x4
/* C554 8001E934 0B004010 */  beqz       $v0, .L8001E964
/* C558 8001E938 00000000 */   nop
/* C55C 8001E93C 5803828E */  lw         $v0, 0x358($s4)
/* C560 8001E940 00000000 */  nop
/* C564 8001E944 0400428C */  lw         $v0, 0x4($v0)
/* C568 8001E948 00000000 */  nop
/* C56C 8001E94C 01004230 */  andi       $v0, $v0, 0x1
/* C570 8001E950 04004010 */  beqz       $v0, .L8001E964
/* C574 8001E954 04000224 */   addiu     $v0, $zero, 0x4
/* C578 8001E958 597A0008 */  j          .L8001E964
/* C57C 8001E95C EE0382A6 */   sh        $v0, 0x3EE($s4)
.L8001E960:
/* C580 8001E960 EE0380A6 */  sh         $zero, 0x3EE($s4)
.L8001E964:
/* C584 8001E964 77038282 */  lb         $v0, 0x377($s4)
.L8001E968:
/* C588 8001E968 00000000 */  nop
/* C58C 8001E96C 02004104 */  bgez       $v0, .L8001E978
/* C590 8001E970 00000000 */   nop
/* C594 8001E974 23100200 */  negu       $v0, $v0
.L8001E978:
/* C598 8001E978 0A004228 */  slti       $v0, $v0, 0xA
/* C59C 8001E97C 02004014 */  bnez       $v0, .L8001E988
/* C5A0 8001E980 00000000 */   nop
/* C5A4 8001E984 EE0380A6 */  sh         $zero, 0x3EE($s4)
.L8001E988:
/* C5A8 8001E988 EE038286 */  lh         $v0, 0x3EE($s4)
/* C5AC 8001E98C EE038396 */  lhu        $v1, 0x3EE($s4)
/* C5B0 8001E990 06004010 */  beqz       $v0, .L8001E9AC
/* C5B4 8001E994 FFFF6324 */   addiu     $v1, $v1, -0x1
/* C5B8 8001E998 77038292 */  lbu        $v0, 0x377($s4)
/* C5BC 8001E99C EE0383A6 */  sh         $v1, 0x3EE($s4)
/* C5C0 8001E9A0 03004224 */  addiu      $v0, $v0, 0x3
/* C5C4 8001E9A4 8C7A0008 */  j          .L8001EA30
/* C5C8 8001E9A8 770382A2 */   sb        $v0, 0x377($s4)
.L8001E9AC:
/* C5CC 8001E9AC 77038282 */  lb         $v0, 0x377($s4)
/* C5D0 8001E9B0 77038392 */  lbu        $v1, 0x377($s4)
/* C5D4 8001E9B4 16004018 */  blez       $v0, .L8001EA10
/* C5D8 8001E9B8 FCFF6224 */   addiu     $v0, $v1, -0x4
/* C5DC 8001E9BC 770382A2 */  sb         $v0, 0x377($s4)
/* C5E0 8001E9C0 00160200 */  sll        $v0, $v0, 24
/* C5E4 8001E9C4 1200401C */  bgtz       $v0, .L8001EA10
/* C5E8 8001E9C8 00000000 */   nop
/* C5EC 8001E9CC 5803848E */  lw         $a0, 0x358($s4)
/* C5F0 8001E9D0 770380A2 */  sb         $zero, 0x377($s4)
/* C5F4 8001E9D4 0400828C */  lw         $v0, 0x4($a0)
/* C5F8 8001E9D8 00000000 */  nop
/* C5FC 8001E9DC 20004230 */  andi       $v0, $v0, 0x20
/* C600 8001E9E0 0B004010 */  beqz       $v0, .L8001EA10
/* C604 8001E9E4 8000063C */   lui       $a2, (0x808080 >> 16)
/* C608 8001E9E8 0100033C */  lui        $v1, (0x10000 >> 16)
/* C60C 8001E9EC C802828E */  lw         $v0, 0x2C8($s4)
/* C610 8001E9F0 32008494 */  lhu        $a0, 0x32($a0)
/* C614 8001E9F4 24104300 */  and        $v0, $v0, $v1
/* C618 8001E9F8 03004010 */  beqz       $v0, .L8001EA08
/* C61C 8001E9FC 8080C634 */   ori       $a2, $a2, (0x808080 & 0xFFFF)
/* C620 8001EA00 8001063C */  lui        $a2, (0x1808080 >> 16)
/* C624 8001EA04 8080C634 */  ori        $a2, $a2, (0x1808080 & 0xFFFF)
.L8001EA08:
/* C628 8001EA08 34A1000C */  jal        DECOMP_OtherFX_Play_LowLevel
/* C62C 8001EA0C 21280000 */   addu      $a1, $zero, $zero
.L8001EA10:
/* C630 8001EA10 77038292 */  lbu        $v0, 0x377($s4)
/* C634 8001EA14 00000000 */  nop
/* C638 8001EA18 FCFF4224 */  addiu      $v0, $v0, -0x4
/* C63C 8001EA1C 770382A2 */  sb         $v0, 0x377($s4)
/* C640 8001EA20 00160200 */  sll        $v0, $v0, 24
/* C644 8001EA24 02004104 */  bgez       $v0, .L8001EA30
/* C648 8001EA28 00000000 */   nop
/* C64C 8001EA2C 770380A2 */  sb         $zero, 0x377($s4)
.L8001EA30:
/* C650 8001EA30 D802828E */  lw         $v0, 0x2D8($s4)
/* C654 8001EA34 00000000 */  nop
/* C658 8001EA38 00804228 */  slti       $v0, $v0, -0x8000
/* C65C 8001EA3C 0F004010 */  beqz       $v0, .L8001EA7C
/* C660 8001EA40 00000000 */   nop
/* C664 8001EA44 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* C668 8001EA48 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* C66C 8001EA4C 00000000 */  nop
/* C670 8001EA50 6001428C */  lw         $v0, 0x160($v0)
/* C674 8001EA54 00000000 */  nop
/* C678 8001EA58 DC00428C */  lw         $v0, 0xDC($v0)
/* C67C 8001EA5C 00000000 */  nop
/* C680 8001EA60 02004230 */  andi       $v0, $v0, 0x2
/* C684 8001EA64 05004010 */  beqz       $v0, .L8001EA7C
/* C688 8001EA68 00000000 */   nop
/* C68C 8001EA6C AA008296 */  lhu        $v0, 0xAA($s4)
/* C690 8001EA70 00000000 */  nop
/* C694 8001EA74 01004234 */  ori        $v0, $v0, 0x1
/* C698 8001EA78 AA0082A6 */  sh         $v0, 0xAA($s4)
.L8001EA7C:
/* C69C 8001EA7C 76038392 */  lbu        $v1, 0x376($s4)
/* C6A0 8001EA80 05000224 */  addiu      $v0, $zero, 0x5
/* C6A4 8001EA84 17006210 */  beq        $v1, $v0, .L8001EAE4
/* C6A8 8001EA88 00000000 */   nop
/* C6AC 8001EA8C AA008296 */  lhu        $v0, 0xAA($s4)
/* C6B0 8001EA90 00000000 */  nop
/* C6B4 8001EA94 01004230 */  andi       $v0, $v0, 0x1
/* C6B8 8001EA98 12004010 */  beqz       $v0, .L8001EAE4
/* C6BC 8001EA9C 00000000 */   nop
/* C6C0 8001EAA0 5403828E */  lw         $v0, 0x354($s4)
/* C6C4 8001EAA4 00000000 */  nop
/* C6C8 8001EAA8 0E004010 */  beqz       $v0, .L8001EAE4
/* C6CC 8001EAAC 00000000 */   nop
/* C6D0 8001EAB0 0980023C */  lui        $v0, %hi(D_8008D000)
/* C6D4 8001EAB4 00D0428C */  lw         $v0, %lo(D_8008D000)($v0)
/* C6D8 8001EAB8 00000000 */  nop
/* C6DC 8001EABC 00104230 */  andi       $v0, $v0, 0x1000
/* C6E0 8001EAC0 08004014 */  bnez       $v0, .L8001EAE4
/* C6E4 8001EAC4 00000000 */   nop
/* C6E8 8001EAC8 BC00828E */  lw         $v0, 0xBC($s4)
/* C6EC 8001EACC 00000000 */  nop
/* C6F0 8001EAD0 08004230 */  andi       $v0, $v0, 0x8
/* C6F4 8001EAD4 03004014 */  bnez       $v0, .L8001EAE4
/* C6F8 8001EAD8 2120C002 */   addu      $a0, $s6, $zero
/* C6FC 8001EADC 6C9C010C */  jal        DECOMP_VehStuckProc_MaskGrab_Init
/* C700 8001EAE0 21288002 */   addu      $a1, $s4, $zero
.L8001EAE4:
/* C704 8001EAE4 4400BF8F */  lw         $ra, 0x44($sp)
/* C708 8001EAE8 4000B68F */  lw         $s6, 0x40($sp)
/* C70C 8001EAEC 3C00B58F */  lw         $s5, 0x3C($sp)
/* C710 8001EAF0 3800B48F */  lw         $s4, 0x38($sp)
/* C714 8001EAF4 3400B38F */  lw         $s3, 0x34($sp)
/* C718 8001EAF8 3000B28F */  lw         $s2, 0x30($sp)
/* C71C 8001EAFC 2C00B18F */  lw         $s1, 0x2C($sp)
/* C720 8001EB00 2800B08F */  lw         $s0, 0x28($sp)
/* C724 8001EB04 0800E003 */  jr         $ra
/* C728 8001EB08 4800BD27 */   addiu     $sp, $sp, 0x48
.size COLL_StartSearch_Player, . - COLL_StartSearch_Player
