.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel UI_VsQuipAssignAll
/* 4281C 80054BFC 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 42820 80054C00 ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 42824 80054C04 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 42828 80054C08 5C00BFAF */  sw         $ra, 0x5C($sp)
/* 4282C 80054C0C 5800BEAF */  sw         $fp, 0x58($sp)
/* 42830 80054C10 5400B7AF */  sw         $s7, 0x54($sp)
/* 42834 80054C14 5000B6AF */  sw         $s6, 0x50($sp)
/* 42838 80054C18 4C00B5AF */  sw         $s5, 0x4C($sp)
/* 4283C 80054C1C 4800B4AF */  sw         $s4, 0x48($sp)
/* 42840 80054C20 4400B3AF */  sw         $s3, 0x44($sp)
/* 42844 80054C24 4000B2AF */  sw         $s2, 0x40($sp)
/* 42848 80054C28 3C00B1AF */  sw         $s1, 0x3C($sp)
/* 4284C 80054C2C 3800B0AF */  sw         $s0, 0x38($sp)
/* 42850 80054C30 A81C6290 */  lbu        $v0, 0x1CA8($v1)
/* 42854 80054C34 00000000 */  nop
/* 42858 80054C38 0200422C */  sltiu      $v0, $v0, 0x2
/* 4285C 80054C3C 21014014 */  bnez       $v0, .L800550C4
/* 42860 80054C40 3400A0AF */   sw        $zero, 0x34($sp)
/* 42864 80054C44 0000628C */  lw         $v0, 0x0($v1)
/* 42868 80054C48 00000000 */  nop
/* 4286C 80054C4C 20004230 */  andi       $v0, $v0, 0x20
/* 42870 80054C50 04004010 */  beqz       $v0, .L80054C64
/* 42874 80054C54 0880023C */   lui       $v0, %hi(D_80086C0C)
/* 42878 80054C58 0C6C4624 */  addiu      $a2, $v0, %lo(D_80086C0C)
/* 4287C 80054C5C 1C530108 */  j          .L80054C70
/* 42880 80054C60 2001C824 */   addiu     $t0, $a2, 0x120
.L80054C64:
/* 42884 80054C64 0880023C */  lui        $v0, %hi(D_8008664C)
/* 42888 80054C68 4C664624 */  addiu      $a2, $v0, %lo(D_8008664C)
/* 4288C 80054C6C A803C824 */  addiu      $t0, $a2, 0x3A8
.L80054C70:
/* 42890 80054C70 3000A8AF */  sw         $t0, 0x30($sp)
/* 42894 80054C74 3000A88F */  lw         $t0, 0x30($sp)
/* 42898 80054C78 21B0C000 */  addu       $s6, $a2, $zero
/* 4289C 80054C7C 2B10C802 */  sltu       $v0, $s6, $t0
/* 428A0 80054C80 18004010 */  beqz       $v0, .L80054CE4
/* 428A4 80054C84 21200000 */   addu      $a0, $zero, $zero
/* 428A8 80054C88 0400C526 */  addiu      $a1, $s6, 0x4
.L80054C8C:
/* 428AC 80054C8C 0000C48E */  lw         $a0, 0x0($s6)
/* 428B0 80054C90 0000A28C */  lw         $v0, 0x0($a1)
/* 428B4 80054C94 00000000 */  nop
/* 428B8 80054C98 2B108200 */  sltu       $v0, $a0, $v0
/* 428BC 80054C9C 0B004010 */  beqz       $v0, .L80054CCC
/* 428C0 80054CA0 00000000 */   nop
/* 428C4 80054CA4 04008324 */  addiu      $v1, $a0, 0x4
.L80054CA8:
/* 428C8 80054CA8 0000628C */  lw         $v0, 0x0($v1)
/* 428CC 80054CAC 08008424 */  addiu      $a0, $a0, 0x8
/* 428D0 80054CB0 01004224 */  addiu      $v0, $v0, 0x1
/* 428D4 80054CB4 000062AC */  sw         $v0, 0x0($v1)
/* 428D8 80054CB8 0000A28C */  lw         $v0, 0x0($a1)
/* 428DC 80054CBC 00000000 */  nop
/* 428E0 80054CC0 2B108200 */  sltu       $v0, $a0, $v0
/* 428E4 80054CC4 F8FF4014 */  bnez       $v0, .L80054CA8
/* 428E8 80054CC8 08006324 */   addiu     $v1, $v1, 0x8
.L80054CCC:
/* 428EC 80054CCC 3000A88F */  lw         $t0, 0x30($sp)
/* 428F0 80054CD0 1800D626 */  addiu      $s6, $s6, 0x18
/* 428F4 80054CD4 2B10C802 */  sltu       $v0, $s6, $t0
/* 428F8 80054CD8 ECFF4014 */  bnez       $v0, .L80054C8C
/* 428FC 80054CDC 1800A524 */   addiu     $a1, $a1, 0x18
/* 42900 80054CE0 21200000 */  addu       $a0, $zero, $zero
.L80054CE4:
/* 42904 80054CE4 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 42908 80054CE8 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 4290C 80054CEC 21F08000 */  addu       $fp, $a0, $zero
/* 42910 80054CF0 2C1B558C */  lw         $s5, 0x1B2C($v0)
/* 42914 80054CF4 00000000 */  nop
/* 42918 80054CF8 2700A012 */  beqz       $s5, .L80054D98
/* 4291C 80054CFC 21B88000 */   addu      $s7, $a0, $zero
/* 42920 80054D00 21284000 */  addu       $a1, $v0, $zero
/* 42924 80054D04 1000A727 */  addiu      $a3, $sp, 0x10
.L80054D08:
/* 42928 80054D08 3000B08E */  lw         $s0, 0x30($s5)
/* 4292C 80054D0C 00000000 */  nop
/* 42930 80054D10 6C0500AE */  sw         $zero, 0x56C($s0)
/* 42934 80054D14 0000A28C */  lw         $v0, 0x0($a1)
/* 42938 80054D18 00000000 */  nop
/* 4293C 80054D1C 00404230 */  andi       $v0, $v0, 0x4000
/* 42940 80054D20 08004010 */  beqz       $v0, .L80054D44
/* 42944 80054D24 00000000 */   nop
/* 42948 80054D28 E804028E */  lw         $v0, 0x4E8($s0)
/* 4294C 80054D2C 00000000 */  nop
/* 42950 80054D30 80100200 */  sll        $v0, $v0, 2
/* 42954 80054D34 2110A200 */  addu       $v0, $a1, $v0
/* 42958 80054D38 901D438C */  lw         $v1, 0x1D90($v0)
/* 4295C 80054D3C 52530108 */  j          .L80054D48
/* 42960 80054D40 00000000 */   nop
.L80054D44:
/* 42964 80054D44 E404038E */  lw         $v1, 0x4E4($s0)
.L80054D48:
/* 42968 80054D48 4A000292 */  lbu        $v0, 0x4A($s0)
/* 4296C 80054D4C 00000000 */  nop
/* 42970 80054D50 80100200 */  sll        $v0, $v0, 2
/* 42974 80054D54 2110E200 */  addu       $v0, $a3, $v0
/* 42978 80054D58 000043AC */  sw         $v1, 0x0($v0)
/* 4297C 80054D5C 2A108300 */  slt        $v0, $a0, $v1
/* 42980 80054D60 05004010 */  beqz       $v0, .L80054D78
/* 42984 80054D64 00000000 */   nop
/* 42988 80054D68 21F08000 */  addu       $fp, $a0, $zero
/* 4298C 80054D6C 21B80002 */  addu       $s7, $s0, $zero
/* 42990 80054D70 62530108 */  j          .L80054D88
/* 42994 80054D74 21206000 */   addu      $a0, $v1, $zero
.L80054D78:
/* 42998 80054D78 03006414 */  bne        $v1, $a0, .L80054D88
/* 4299C 80054D7C 00000000 */   nop
/* 429A0 80054D80 21F08000 */  addu       $fp, $a0, $zero
/* 429A4 80054D84 21B80000 */  addu       $s7, $zero, $zero
.L80054D88:
/* 429A8 80054D88 1000B58E */  lw         $s5, 0x10($s5)
/* 429AC 80054D8C 00000000 */  nop
/* 429B0 80054D90 DDFFA016 */  bnez       $s5, .L80054D08
/* 429B4 80054D94 00000000 */   nop
.L80054D98:
/* 429B8 80054D98 3000A88F */  lw         $t0, 0x30($sp)
/* 429BC 80054D9C 21B0C000 */  addu       $s6, $a2, $zero
/* 429C0 80054DA0 2B10C802 */  sltu       $v0, $s6, $t0
/* 429C4 80054DA4 C7004010 */  beqz       $v0, .L800550C4
/* 429C8 80054DA8 0A00D326 */   addiu     $s3, $s6, 0xA
.L80054DAC:
/* 429CC 80054DAC FEFF6386 */  lh         $v1, -0x2($s3)
/* 429D0 80054DB0 05000224 */  addiu      $v0, $zero, 0x5
/* 429D4 80054DB4 03006214 */  bne        $v1, $v0, .L80054DC4
/* 429D8 80054DB8 21A00000 */   addu      $s4, $zero, $zero
/* 429DC 80054DBC FF7F143C */  lui        $s4, (0x7FFFFFFF >> 16)
/* 429E0 80054DC0 FFFF9436 */  ori        $s4, $s4, (0x7FFFFFFF & 0xFFFF)
.L80054DC4:
/* 429E4 80054DC4 00006296 */  lhu        $v0, 0x0($s3)
/* 429E8 80054DC8 0200728E */  lw         $s2, 0x2($s3)
/* 429EC 80054DCC 01004230 */  andi       $v0, $v0, 0x1
/* 429F0 80054DD0 0B004010 */  beqz       $v0, .L80054E00
/* 429F4 80054DD4 21880000 */   addu      $s1, $zero, $zero
/* 429F8 80054DD8 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 429FC 80054DDC ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 42A00 80054DE0 00000000 */  nop
/* 42A04 80054DE4 331D4280 */  lb         $v0, 0x1D33($v0)
/* 42A08 80054DE8 00000000 */  nop
/* 42A0C 80054DEC 02004104 */  bgez       $v0, .L80054DF8
/* 42A10 80054DF0 00000000 */   nop
/* 42A14 80054DF4 23100200 */  negu       $v0, $v0
.L80054DF8:
/* 42A18 80054DF8 18004202 */  mult       $s2, $v0
/* 42A1C 80054DFC 12900000 */  mflo       $s2
.L80054E00:
/* 42A20 80054E00 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 42A24 80054E04 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 42A28 80054E08 00000000 */  nop
/* 42A2C 80054E0C 2C1B558C */  lw         $s5, 0x1B2C($v0)
/* 42A30 80054E10 00000000 */  nop
/* 42A34 80054E14 A100A012 */  beqz       $s5, .L8005509C
/* 42A38 80054E18 00000000 */   nop
.L80054E1C:
/* 42A3C 80054E1C FEFF6386 */  lh         $v1, -0x2($s3)
/* 42A40 80054E20 3000B08E */  lw         $s0, 0x30($s5)
/* 42A44 80054E24 0A00622C */  sltiu      $v0, $v1, 0xA
/* 42A48 80054E28 8D004010 */  beqz       $v0, .L80055060
/* 42A4C 80054E2C 80100300 */   sll       $v0, $v1, 2
/* 42A50 80054E30 0180083C */  lui        $t0, %hi(jtbl_80011718_ctr)
/* 42A54 80054E34 18170825 */  addiu      $t0, $t0, %lo(jtbl_80011718_ctr)
/* 42A58 80054E38 21104800 */  addu       $v0, $v0, $t0
/* 42A5C 80054E3C 0000428C */  lw         $v0, 0x0($v0)
/* 42A60 80054E40 00000000 */  nop
/* 42A64 80054E44 08004000 */  jr         $v0
/* 42A68 80054E48 00000000 */   nop
/* 42A6C 80054E4C 05004012 */  beqz       $s2, .L80054E64
/* 42A70 80054E50 01000224 */   addiu     $v0, $zero, 0x1
/* 42A74 80054E54 07004212 */  beq        $s2, $v0, .L80054E74
/* 42A78 80054E58 00000000 */   nop
/* 42A7C 80054E5C 18540108 */  j          .L80055060
/* 42A80 80054E60 00000000 */   nop
.L80054E64:
/* 42A84 80054E64 7E001716 */  bne        $s0, $s7, .L80055060
/* 42A88 80054E68 00000000 */   nop
/* 42A8C 80054E6C 18540108 */  j          .L80055060
/* 42A90 80054E70 2188E002 */   addu      $s1, $s7, $zero
.L80054E74:
/* 42A94 80054E74 7A00C013 */  beqz       $fp, .L80055060
/* 42A98 80054E78 00000000 */   nop
/* 42A9C 80054E7C 4A000292 */  lbu        $v0, 0x4A($s0)
/* 42AA0 80054E80 00000000 */  nop
/* 42AA4 80054E84 80100200 */  sll        $v0, $v0, 2
/* 42AA8 80054E88 2110A203 */  addu       $v0, $sp, $v0
/* 42AAC 80054E8C 1000428C */  lw         $v0, 0x10($v0)
/* 42AB0 80054E90 00000000 */  nop
/* 42AB4 80054E94 72005E14 */  bne        $v0, $fp, .L80055060
/* 42AB8 80054E98 00000000 */   nop
/* 42ABC 80054E9C 18540108 */  j          .L80055060
/* 42AC0 80054EA0 21880002 */   addu      $s1, $s0, $zero
/* 42AC4 80054EA4 0600658E */  lw         $a1, 0x6($s3)
/* 42AC8 80054EA8 0A00668E */  lw         $a2, 0xA($s3)
/* 42ACC 80054EAC 8252010C */  jal        UI_VsQuipReadDriver
/* 42AD0 80054EB0 21200002 */   addu      $a0, $s0, $zero
/* 42AD4 80054EB4 59050392 */  lbu        $v1, 0x559($s0)
/* 42AD8 80054EB8 00000000 */  nop
/* 42ADC 80054EBC 68004314 */  bne        $v0, $v1, .L80055060
/* 42AE0 80054EC0 00000000 */   nop
/* 42AE4 80054EC4 18540108 */  j          .L80055060
/* 42AE8 80054EC8 21880002 */   addu      $s1, $s0, $zero
/* 42AEC 80054ECC 0600658E */  lw         $a1, 0x6($s3)
/* 42AF0 80054ED0 0A00668E */  lw         $a2, 0xA($s3)
/* 42AF4 80054ED4 8252010C */  jal        UI_VsQuipReadDriver
/* 42AF8 80054ED8 21200002 */   addu      $a0, $s0, $zero
/* 42AFC 80054EDC 60005214 */  bne        $v0, $s2, .L80055060
/* 42B00 80054EE0 00000000 */   nop
/* 42B04 80054EE4 18540108 */  j          .L80055060
/* 42B08 80054EE8 21880002 */   addu      $s1, $s0, $zero
/* 42B0C 80054EEC 0600658E */  lw         $a1, 0x6($s3)
/* 42B10 80054EF0 0A00668E */  lw         $a2, 0xA($s3)
/* 42B14 80054EF4 8252010C */  jal        UI_VsQuipReadDriver
/* 42B18 80054EF8 21200002 */   addu      $a0, $s0, $zero
/* 42B1C 80054EFC 21184000 */  addu       $v1, $v0, $zero
/* 42B20 80054F00 2A104302 */  slt        $v0, $s2, $v1
/* 42B24 80054F04 0F004010 */  beqz       $v0, .L80054F44
/* 42B28 80054F08 00000000 */   nop
/* 42B2C 80054F0C CF530108 */  j          .L80054F3C
/* 42B30 80054F10 21880002 */   addu      $s1, $s0, $zero
/* 42B34 80054F14 0600658E */  lw         $a1, 0x6($s3)
/* 42B38 80054F18 0A00668E */  lw         $a2, 0xA($s3)
/* 42B3C 80054F1C 8252010C */  jal        UI_VsQuipReadDriver
/* 42B40 80054F20 21200002 */   addu      $a0, $s0, $zero
/* 42B44 80054F24 21184000 */  addu       $v1, $v0, $zero
/* 42B48 80054F28 4D006004 */  bltz       $v1, .L80055060
/* 42B4C 80054F2C 2A107200 */   slt       $v0, $v1, $s2
/* 42B50 80054F30 04004010 */  beqz       $v0, .L80054F44
/* 42B54 80054F34 00000000 */   nop
/* 42B58 80054F38 21880002 */  addu       $s1, $s0, $zero
.L80054F3C:
/* 42B5C 80054F3C 18540108 */  j          .L80055060
/* 42B60 80054F40 21906000 */   addu      $s2, $v1, $zero
.L80054F44:
/* 42B64 80054F44 46007214 */  bne        $v1, $s2, .L80055060
/* 42B68 80054F48 00000000 */   nop
/* 42B6C 80054F4C 18540108 */  j          .L80055060
/* 42B70 80054F50 21880000 */   addu      $s1, $zero, $zero
/* 42B74 80054F54 0600658E */  lw         $a1, 0x6($s3)
/* 42B78 80054F58 0A00668E */  lw         $a2, 0xA($s3)
/* 42B7C 80054F5C 8252010C */  jal        UI_VsQuipReadDriver
/* 42B80 80054F60 21200002 */   addu      $a0, $s0, $zero
/* 42B84 80054F64 21184000 */  addu       $v1, $v0, $zero
/* 42B88 80054F68 23207400 */  subu       $a0, $v1, $s4
/* 42B8C 80054F6C 2A104402 */  slt        $v0, $s2, $a0
/* 42B90 80054F70 10004014 */  bnez       $v0, .L80054FB4
/* 42B94 80054F74 23101200 */   negu      $v0, $s2
/* 42B98 80054F78 2A104400 */  slt        $v0, $v0, $a0
/* 42B9C 80054F7C 38004010 */  beqz       $v0, .L80055060
/* 42BA0 80054F80 2A108302 */   slt       $v0, $s4, $v1
/* 42BA4 80054F84 F4530108 */  j          .L80054FD0
/* 42BA8 80054F88 21880000 */   addu      $s1, $zero, $zero
/* 42BAC 80054F8C 0600658E */  lw         $a1, 0x6($s3)
/* 42BB0 80054F90 0A00668E */  lw         $a2, 0xA($s3)
/* 42BB4 80054F94 8252010C */  jal        UI_VsQuipReadDriver
/* 42BB8 80054F98 21200002 */   addu      $a0, $s0, $zero
/* 42BBC 80054F9C 21184000 */  addu       $v1, $v0, $zero
/* 42BC0 80054FA0 2F006004 */  bltz       $v1, .L80055060
/* 42BC4 80054FA4 23208302 */   subu      $a0, $s4, $v1
/* 42BC8 80054FA8 2A104402 */  slt        $v0, $s2, $a0
/* 42BCC 80054FAC 04004010 */  beqz       $v0, .L80054FC0
/* 42BD0 80054FB0 23101200 */   negu      $v0, $s2
.L80054FB4:
/* 42BD4 80054FB4 21A06000 */  addu       $s4, $v1, $zero
/* 42BD8 80054FB8 18540108 */  j          .L80055060
/* 42BDC 80054FBC 21880002 */   addu      $s1, $s0, $zero
.L80054FC0:
/* 42BE0 80054FC0 2A104400 */  slt        $v0, $v0, $a0
/* 42BE4 80054FC4 26004010 */  beqz       $v0, .L80055060
/* 42BE8 80054FC8 2A107400 */   slt       $v0, $v1, $s4
/* 42BEC 80054FCC 21880000 */  addu       $s1, $zero, $zero
.L80054FD0:
/* 42BF0 80054FD0 23004010 */  beqz       $v0, .L80055060
/* 42BF4 80054FD4 00000000 */   nop
/* 42BF8 80054FD8 18540108 */  j          .L80055060
/* 42BFC 80054FDC 21A06000 */   addu      $s4, $v1, $zero
/* 42C00 80054FE0 21280000 */  addu       $a1, $zero, $zero
/* 42C04 80054FE4 23301200 */  negu       $a2, $s2
/* 42C08 80054FE8 21100502 */  addu       $v0, $s0, $a1
.L80054FEC:
/* 42C0C 80054FEC 60054390 */  lbu        $v1, 0x560($v0)
/* 42C10 80054FF0 00000000 */  nop
/* 42C14 80054FF4 23207400 */  subu       $a0, $v1, $s4
/* 42C18 80054FF8 2A104402 */  slt        $v0, $s2, $a0
/* 42C1C 80054FFC 05004010 */  beqz       $v0, .L80055014
/* 42C20 80055000 2A10C400 */   slt       $v0, $a2, $a0
/* 42C24 80055004 21A06000 */  addu       $s4, $v1, $zero
/* 42C28 80055008 21880002 */  addu       $s1, $s0, $zero
/* 42C2C 8005500C 0A540108 */  j          .L80055028
/* 42C30 80055010 3400A5AF */   sw        $a1, 0x34($sp)
.L80055014:
/* 42C34 80055014 04004010 */  beqz       $v0, .L80055028
/* 42C38 80055018 2A108302 */   slt       $v0, $s4, $v1
/* 42C3C 8005501C 02004010 */  beqz       $v0, .L80055028
/* 42C40 80055020 21880000 */   addu      $s1, $zero, $zero
/* 42C44 80055024 21A06000 */  addu       $s4, $v1, $zero
.L80055028:
/* 42C48 80055028 0100A524 */  addiu      $a1, $a1, 0x1
/* 42C4C 8005502C 0800A228 */  slti       $v0, $a1, 0x8
/* 42C50 80055030 EEFF4014 */  bnez       $v0, .L80054FEC
/* 42C54 80055034 21100502 */   addu      $v0, $s0, $a1
/* 42C58 80055038 18540108 */  j          .L80055060
/* 42C5C 8005503C 00000000 */   nop
/* 42C60 80055040 6C05028E */  lw         $v0, 0x56C($s0)
/* 42C64 80055044 00000000 */  nop
/* 42C68 80055048 05004014 */  bnez       $v0, .L80055060
/* 42C6C 8005504C 21200002 */   addu      $a0, $s0, $zero
/* 42C70 80055050 2128C002 */  addu       $a1, $s6, $zero
/* 42C74 80055054 2130E002 */  addu       $a2, $s7, $zero
/* 42C78 80055058 9E52010C */  jal        UI_VsQuipAssign
/* 42C7C 8005505C 21380000 */   addu      $a3, $zero, $zero
.L80055060:
/* 42C80 80055060 0A002012 */  beqz       $s1, .L8005508C
/* 42C84 80055064 00000000 */   nop
/* 42C88 80055068 00006296 */  lhu        $v0, 0x0($s3)
/* 42C8C 8005506C 00000000 */  nop
/* 42C90 80055070 0C004230 */  andi       $v0, $v0, 0xC
/* 42C94 80055074 05004010 */  beqz       $v0, .L8005508C
/* 42C98 80055078 21202002 */   addu      $a0, $s1, $zero
/* 42C9C 8005507C 2128C002 */  addu       $a1, $s6, $zero
/* 42CA0 80055080 3400A78F */  lw         $a3, 0x34($sp)
/* 42CA4 80055084 9E52010C */  jal        UI_VsQuipAssign
/* 42CA8 80055088 2130E002 */   addu      $a2, $s7, $zero
.L8005508C:
/* 42CAC 8005508C 1000B58E */  lw         $s5, 0x10($s5)
/* 42CB0 80055090 00000000 */  nop
/* 42CB4 80055094 61FFA016 */  bnez       $s5, .L80054E1C
/* 42CB8 80055098 00000000 */   nop
.L8005509C:
/* 42CBC 8005509C 21202002 */  addu       $a0, $s1, $zero
/* 42CC0 800550A0 2128C002 */  addu       $a1, $s6, $zero
/* 42CC4 800550A4 3400A78F */  lw         $a3, 0x34($sp)
/* 42CC8 800550A8 9E52010C */  jal        UI_VsQuipAssign
/* 42CCC 800550AC 2130E002 */   addu      $a2, $s7, $zero
/* 42CD0 800550B0 3000A88F */  lw         $t0, 0x30($sp)
/* 42CD4 800550B4 1800D626 */  addiu      $s6, $s6, 0x18
/* 42CD8 800550B8 2B10C802 */  sltu       $v0, $s6, $t0
/* 42CDC 800550BC 3BFF4014 */  bnez       $v0, .L80054DAC
/* 42CE0 800550C0 18007326 */   addiu     $s3, $s3, 0x18
.L800550C4:
/* 42CE4 800550C4 5C00BF8F */  lw         $ra, 0x5C($sp)
/* 42CE8 800550C8 5800BE8F */  lw         $fp, 0x58($sp)
/* 42CEC 800550CC 5400B78F */  lw         $s7, 0x54($sp)
/* 42CF0 800550D0 5000B68F */  lw         $s6, 0x50($sp)
/* 42CF4 800550D4 4C00B58F */  lw         $s5, 0x4C($sp)
/* 42CF8 800550D8 4800B48F */  lw         $s4, 0x48($sp)
/* 42CFC 800550DC 4400B38F */  lw         $s3, 0x44($sp)
/* 42D00 800550E0 4000B28F */  lw         $s2, 0x40($sp)
/* 42D04 800550E4 3C00B18F */  lw         $s1, 0x3C($sp)
/* 42D08 800550E8 3800B08F */  lw         $s0, 0x38($sp)
/* 42D0C 800550EC 0800E003 */  jr         $ra
/* 42D10 800550F0 6000BD27 */   addiu     $sp, $sp, 0x60
.size UI_VsQuipAssignAll, . - UI_VsQuipAssignAll
