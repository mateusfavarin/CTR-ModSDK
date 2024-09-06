.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel EngineSound_AI
/* 1D884 8002FC64 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 1D888 8002FC68 2400B3AF */  sw         $s3, 0x24($sp)
/* 1D88C 8002FC6C 4C00B38F */  lw         $s3, 0x4C($sp)
/* 1D890 8002FC70 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 1D894 8002FC74 21888000 */  addu       $s1, $a0, $zero
/* 1D898 8002FC78 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 1D89C 8002FC7C 21A8A000 */  addu       $s5, $a1, $zero
/* 1D8A0 8002FC80 2800B4AF */  sw         $s4, 0x28($sp)
/* 1D8A4 8002FC84 21A0C000 */  addu       $s4, $a2, $zero
/* 1D8A8 8002FC88 1800B0AF */  sw         $s0, 0x18($sp)
/* 1D8AC 8002FC8C 3000BFAF */  sw         $ra, 0x30($sp)
/* 1D8B0 8002FC90 2000B2AF */  sw         $s2, 0x20($sp)
/* 1D8B4 8002FC94 2E042386 */  lh         $v1, 0x42E($s1)
/* 1D8B8 8002FC98 CC02228E */  lw         $v0, 0x2CC($s1)
/* 1D8BC 8002FC9C 02006104 */  bgez       $v1, .L8002FCA8
/* 1D8C0 8002FCA0 21406000 */   addu      $t0, $v1, $zero
/* 1D8C4 8002FCA4 23400800 */  negu       $t0, $t0
.L8002FCA8:
/* 1D8C8 8002FCA8 01004230 */  andi       $v0, $v0, 0x1
/* 1D8CC 8002FCAC 0D004010 */  beqz       $v0, .L8002FCE4
/* 1D8D0 8002FCB0 2180E000 */   addu      $s0, $a3, $zero
/* 1D8D4 8002FCB4 76032392 */  lbu        $v1, 0x376($s1)
/* 1D8D8 8002FCB8 02000224 */  addiu      $v0, $zero, 0x2
/* 1D8DC 8002FCBC 09006210 */  beq        $v1, $v0, .L8002FCE4
/* 1D8E0 8002FCC0 00000000 */   nop
/* 1D8E4 8002FCC4 8E032286 */  lh         $v0, 0x38E($s1)
/* 1D8E8 8002FCC8 00000000 */  nop
/* 1D8EC 8002FCCC 02004104 */  bgez       $v0, .L8002FCD8
/* 1D8F0 8002FCD0 00000000 */   nop
/* 1D8F4 8002FCD4 23100200 */  negu       $v0, $v0
.L8002FCD8:
/* 1D8F8 8002FCD8 21100201 */  addu       $v0, $t0, $v0
/* 1D8FC 8002FCDC 3ABF0008 */  j          .L8002FCE8
/* 1D900 8002FCE0 43400200 */   sra       $t0, $v0, 1
.L8002FCE4:
/* 1D904 8002FCE4 000F0825 */  addiu      $t0, $t0, 0xF00
.L8002FCE8:
/* 1D908 8002FCE8 B8032286 */  lh         $v0, 0x3B8($s1)
/* 1D90C 8002FCEC 00000000 */  nop
/* 1D910 8002FCF0 23100201 */  subu       $v0, $t0, $v0
/* 1D914 8002FCF4 02004104 */  bgez       $v0, .L8002FD00
/* 1D918 8002FCF8 00000000 */   nop
/* 1D91C 8002FCFC 23100200 */  negu       $v0, $v0
.L8002FD00:
/* 1D920 8002FD00 01064228 */  slti       $v0, $v0, 0x601
/* 1D924 8002FD04 0D004014 */  bnez       $v0, .L8002FD3C
/* 1D928 8002FD08 00000000 */   nop
/* 1D92C 8002FD0C B6032296 */  lhu        $v0, 0x3B6($s1)
/* 1D930 8002FD10 00000000 */  nop
/* 1D934 8002FD14 D0074224 */  addiu      $v0, $v0, 0x7D0
/* 1D938 8002FD18 B60322A6 */  sh         $v0, 0x3B6($s1)
/* 1D93C 8002FD1C 00140200 */  sll        $v0, $v0, 16
/* 1D940 8002FD20 03140200 */  sra        $v0, $v0, 16
/* 1D944 8002FD24 B1364228 */  slti       $v0, $v0, 0x36B1
/* 1D948 8002FD28 16004014 */  bnez       $v0, .L8002FD84
/* 1D94C 8002FD2C 21280000 */   addu      $a1, $zero, $zero
/* 1D950 8002FD30 B0360224 */  addiu      $v0, $zero, 0x36B0
/* 1D954 8002FD34 61BF0008 */  j          .L8002FD84
/* 1D958 8002FD38 B60322A6 */   sh        $v0, 0x3B6($s1)
.L8002FD3C:
/* 1D95C 8002FD3C B6032296 */  lhu        $v0, 0x3B6($s1)
/* 1D960 8002FD40 76032392 */  lbu        $v1, 0x376($s1)
/* 1D964 8002FD44 0CFE4424 */  addiu      $a0, $v0, -0x1F4
/* 1D968 8002FD48 02000224 */  addiu      $v0, $zero, 0x2
/* 1D96C 8002FD4C 08006214 */  bne        $v1, $v0, .L8002FD70
/* 1D970 8002FD50 B60324A6 */   sh        $a0, 0x3B6($s1)
/* 1D974 8002FD54 00140400 */  sll        $v0, $a0, 16
/* 1D978 8002FD58 03140200 */  sra        $v0, $v0, 16
/* 1D97C 8002FD5C D0074228 */  slti       $v0, $v0, 0x7D0
/* 1D980 8002FD60 07004010 */  beqz       $v0, .L8002FD80
/* 1D984 8002FD64 D0070224 */   addiu     $v0, $zero, 0x7D0
/* 1D988 8002FD68 60BF0008 */  j          .L8002FD80
/* 1D98C 8002FD6C B60322A6 */   sh        $v0, 0x3B6($s1)
.L8002FD70:
/* 1D990 8002FD70 00140400 */  sll        $v0, $a0, 16
/* 1D994 8002FD74 03004104 */  bgez       $v0, .L8002FD84
/* 1D998 8002FD78 21280000 */   addu      $a1, $zero, $zero
/* 1D99C 8002FD7C B60320A6 */  sh         $zero, 0x3B6($s1)
.L8002FD80:
/* 1D9A0 8002FD80 21280000 */  addu       $a1, $zero, $zero
.L8002FD84:
/* 1D9A4 8002FD84 82000724 */  addiu      $a3, $zero, 0x82
/* 1D9A8 8002FD88 B6032486 */  lh         $a0, 0x3B6($s1)
/* 1D9AC 8002FD8C B8032286 */  lh         $v0, 0x3B8($s1)
/* 1D9B0 8002FD90 2E042686 */  lh         $a2, 0x42E($s1)
/* 1D9B4 8002FD94 40180200 */  sll        $v1, $v0, 1
/* 1D9B8 8002FD98 21186200 */  addu       $v1, $v1, $v0
/* 1D9BC 8002FD9C 00190300 */  sll        $v1, $v1, 4
/* 1D9C0 8002FDA0 23186200 */  subu       $v1, $v1, $v0
/* 1D9C4 8002FDA4 C0180300 */  sll        $v1, $v1, 3
/* 1D9C8 8002FDA8 23186200 */  subu       $v1, $v1, $v0
/* 1D9CC 8002FDAC 00110800 */  sll        $v0, $t0, 4
/* 1D9D0 8002FDB0 21104800 */  addu       $v0, $v0, $t0
/* 1D9D4 8002FDB4 C0100200 */  sll        $v0, $v0, 3
/* 1D9D8 8002FDB8 21104800 */  addu       $v0, $v0, $t0
/* 1D9DC 8002FDBC 21104300 */  addu       $v0, $v0, $v1
/* 1D9E0 8002FDC0 42120200 */  srl        $v0, $v0, 9
/* 1D9E4 8002FDC4 B80322A6 */  sh         $v0, 0x3B8($s1)
/* 1D9E8 8002FDC8 E6000224 */  addiu      $v0, $zero, 0xE6
/* 1D9EC 8002FDCC E763010C */  jal        DECOMP_VehCalc_MapToRange
/* 1D9F0 8002FDD0 1000A2AF */   sw        $v0, 0x10($sp)
/* 1D9F4 8002FDD4 21384000 */  addu       $a3, $v0, $zero
/* 1D9F8 8002FDD8 D007022A */  slti       $v0, $s0, 0x7D0
/* 1D9FC 8002FDDC 0A004010 */  beqz       $v0, .L8002FE08
/* 1DA00 8002FDE0 C900022A */   slti      $v0, $s0, 0xC9
/* 1DA04 8002FDE4 09004014 */  bnez       $v0, .L8002FE0C
/* 1DA08 8002FDE8 2190E000 */   addu      $s2, $a3, $zero
/* 1DA0C 8002FDEC 1000A0AF */  sw         $zero, 0x10($sp)
/* 1DA10 8002FDF0 21200002 */  addu       $a0, $s0, $zero
/* 1DA14 8002FDF4 C8000524 */  addiu      $a1, $zero, 0xC8
/* 1DA18 8002FDF8 E763010C */  jal        DECOMP_VehCalc_MapToRange
/* 1DA1C 8002FDFC D0070624 */   addiu     $a2, $zero, 0x7D0
/* 1DA20 8002FE00 83BF0008 */  j          .L8002FE0C
/* 1DA24 8002FE04 21904000 */   addu      $s2, $v0, $zero
.L8002FE08:
/* 1DA28 8002FE08 21900000 */  addu       $s2, $zero, $zero
.L8002FE0C:
/* 1DA2C 8002FE0C 21204002 */  addu       $a0, $s2, $zero
/* 1DA30 8002FE10 80801400 */  sll        $s0, $s4, 2
/* 1DA34 8002FE14 0980023C */  lui        $v0, %hi(D_8008D818)
/* 1DA38 8002FE18 18D84224 */  addiu      $v0, $v0, %lo(D_8008D818)
/* 1DA3C 8002FE1C 21800202 */  addu       $s0, $s0, $v0
/* 1DA40 8002FE20 0000058E */  lw         $a1, 0x0($s0)
/* 1DA44 8002FE24 0ABF000C */  jal        EngineSound_VolumeAdjust
/* 1DA48 8002FE28 0A000624 */   addiu     $a2, $zero, 0xA
/* 1DA4C 8002FE2C 21904000 */  addu       $s2, $v0, $zero
/* 1DA50 8002FE30 21280000 */  addu       $a1, $zero, $zero
/* 1DA54 8002FE34 3C000724 */  addiu      $a3, $zero, 0x3C
/* 1DA58 8002FE38 000012AE */  sw         $s2, 0x0($s0)
/* 1DA5C 8002FE3C B8032486 */  lh         $a0, 0x3B8($s1)
/* 1DA60 8002FE40 2E042686 */  lh         $a2, 0x42E($s1)
/* 1DA64 8002FE44 AA000224 */  addiu      $v0, $zero, 0xAA
/* 1DA68 8002FE48 E763010C */  jal        DECOMP_VehCalc_MapToRange
/* 1DA6C 8002FE4C 1000A2AF */   sw        $v0, 0x10($sp)
/* 1DA70 8002FE50 21284000 */  addu       $a1, $v0, $zero
/* 1DA74 8002FE54 4800A28F */  lw         $v0, 0x48($sp)
/* 1DA78 8002FE58 00000000 */  nop
/* 1DA7C 8002FE5C C3180200 */  sra        $v1, $v0, 3
/* 1DA80 8002FE60 ECFF6228 */  slti       $v0, $v1, -0x14
/* 1DA84 8002FE64 03004010 */  beqz       $v0, .L8002FE74
/* 1DA88 8002FE68 15006228 */   slti      $v0, $v1, 0x15
/* 1DA8C 8002FE6C A0BF0008 */  j          .L8002FE80
/* 1DA90 8002FE70 ECFF0324 */   addiu     $v1, $zero, -0x14
.L8002FE74:
/* 1DA94 8002FE74 02004014 */  bnez       $v0, .L8002FE80
/* 1DA98 8002FE78 00000000 */   nop
/* 1DA9C 8002FE7C 14000324 */  addiu      $v1, $zero, 0x14
.L8002FE80:
/* 1DAA0 8002FE80 2328A300 */  subu       $a1, $a1, $v1
/* 1DAA4 8002FE84 0300A104 */  bgez       $a1, .L8002FE94
/* 1DAA8 8002FE88 0001A228 */   slti      $v0, $a1, 0x100
/* 1DAAC 8002FE8C A8BF0008 */  j          .L8002FEA0
/* 1DAB0 8002FE90 21280000 */   addu      $a1, $zero, $zero
.L8002FE94:
/* 1DAB4 8002FE94 02004014 */  bnez       $v0, .L8002FEA0
/* 1DAB8 8002FE98 00000000 */   nop
/* 1DABC 8002FE9C FF000524 */  addiu      $a1, $zero, 0xFF
.L8002FEA0:
/* 1DAC0 8002FEA0 03006106 */  bgez       $s3, .L8002FEB0
/* 1DAC4 8002FEA4 0001622A */   slti      $v0, $s3, 0x100
/* 1DAC8 8002FEA8 AFBF0008 */  j          .L8002FEBC
/* 1DACC 8002FEAC 21980000 */   addu      $s3, $zero, $zero
.L8002FEB0:
/* 1DAD0 8002FEB0 03004014 */  bnez       $v0, .L8002FEC0
/* 1DAD4 8002FEB4 10008226 */   addiu     $v0, $s4, 0x10
/* 1DAD8 8002FEB8 FF001324 */  addiu      $s3, $zero, 0xFF
.L8002FEBC:
/* 1DADC 8002FEBC 10008226 */  addiu      $v0, $s4, 0x10
.L8002FEC0:
/* 1DAE0 8002FEC0 FFFF4430 */  andi       $a0, $v0, 0xFFFF
/* 1DAE4 8002FEC4 FF004232 */  andi       $v0, $s2, 0xFF
/* 1DAE8 8002FEC8 003C0200 */  sll        $a3, $v0, 16
/* 1DAEC 8002FECC FF00A230 */  andi       $v0, $a1, 0xFF
/* 1DAF0 8002FED0 00320200 */  sll        $a2, $v0, 8
/* 1DAF4 8002FED4 C802A28E */  lw         $v0, 0x2C8($s5)
/* 1DAF8 8002FED8 0100033C */  lui        $v1, (0x10000 >> 16)
/* 1DAFC 8002FEDC 24104300 */  and        $v0, $v0, $v1
/* 1DB00 8002FEE0 05004010 */  beqz       $v0, .L8002FEF8
/* 1DB04 8002FEE4 FF006532 */   andi      $a1, $s3, 0xFF
/* 1DB08 8002FEE8 0001023C */  lui        $v0, (0x1000000 >> 16)
/* 1DB0C 8002FEEC 2510C200 */  or         $v0, $a2, $v0
/* 1DB10 8002FEF0 BFBF0008 */  j          .L8002FEFC
/* 1DB14 8002FEF4 2510E200 */   or        $v0, $a3, $v0
.L8002FEF8:
/* 1DB18 8002FEF8 2510E600 */  or         $v0, $a3, $a2
.L8002FEFC:
/* 1DB1C 8002FEFC 6CA2000C */  jal        DECOMP_EngineAudio_Recalculate
/* 1DB20 8002FF00 25284500 */   or        $a1, $v0, $a1
/* 1DB24 8002FF04 3000BF8F */  lw         $ra, 0x30($sp)
/* 1DB28 8002FF08 2C00B58F */  lw         $s5, 0x2C($sp)
/* 1DB2C 8002FF0C 2800B48F */  lw         $s4, 0x28($sp)
/* 1DB30 8002FF10 2400B38F */  lw         $s3, 0x24($sp)
/* 1DB34 8002FF14 2000B28F */  lw         $s2, 0x20($sp)
/* 1DB38 8002FF18 1C00B18F */  lw         $s1, 0x1C($sp)
/* 1DB3C 8002FF1C 1800B08F */  lw         $s0, 0x18($sp)
/* 1DB40 8002FF20 0800E003 */  jr         $ra
/* 1DB44 8002FF24 3800BD27 */   addiu     $sp, $sp, 0x38
.size EngineSound_AI, . - EngineSound_AI
