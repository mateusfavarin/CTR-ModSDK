.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel MainFreeze_MenuPtrOptions
/* 2677C 80038B5C 4403828F */  lw         $v0, 0x344($gp) /* Failed to symbolize address 0x00000344 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26780 80038B60 38FFBD27 */  addiu      $sp, $sp, -0xC8
/* 26784 80038B64 C400BFAF */  sw         $ra, 0xC4($sp)
/* 26788 80038B68 C000BEAF */  sw         $fp, 0xC0($sp)
/* 2678C 80038B6C BC00B7AF */  sw         $s7, 0xBC($sp)
/* 26790 80038B70 B800B6AF */  sw         $s6, 0xB8($sp)
/* 26794 80038B74 B400B5AF */  sw         $s5, 0xB4($sp)
/* 26798 80038B78 B000B4AF */  sw         $s4, 0xB0($sp)
/* 2679C 80038B7C AC00B3AF */  sw         $s3, 0xAC($sp)
/* 267A0 80038B80 A800B2AF */  sw         $s2, 0xA8($sp)
/* 267A4 80038B84 A400B1AF */  sw         $s1, 0xA4($sp)
/* 267A8 80038B88 A000B0AF */  sw         $s0, 0xA0($sp)
/* 267AC 80038B8C 5000A4AF */  sw         $a0, 0x50($sp)
/* 267B0 80038B90 5800A0A7 */  sh         $zero, 0x58($sp)
/* 267B4 80038B94 D1024290 */  lbu        $v0, 0x2D1($v0)
/* 267B8 80038B98 7000A0A7 */  sh         $zero, 0x70($sp)
/* 267BC 80038B9C 80004238 */  xori       $v0, $v0, 0x80
/* 267C0 80038BA0 0100422C */  sltiu      $v0, $v0, 0x1
/* 267C4 80038BA4 40100200 */  sll        $v0, $v0, 1
/* 267C8 80038BA8 7FE6000C */  jal        DECOMP_MainFreeze_SafeAdvDestroy
/* 267CC 80038BAC 8000A2A7 */   sh        $v0, 0x80($sp)
/* 267D0 80038BB0 F8088387 */  lh         $v1, 0x8F8($gp) /* Failed to symbolize address 0x000008F8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 267D4 80038BB4 21880000 */  addu       $s1, $zero, $zero
/* 267D8 80038BB8 05006010 */  beqz       $v1, .L80038BD0
/* 267DC 80038BBC 7800A0A7 */   sh        $zero, 0x78($sp)
/* 267E0 80038BC0 68DF000C */  jal        MainFreeze_ConfigSetupEntry
/* 267E4 80038BC4 00000000 */   nop
/* 267E8 80038BC8 36E60008 */  j          .L800398D8
/* 267EC 80038BCC 00000000 */   nop
.L80038BD0:
/* 267F0 80038BD0 4003828F */  lw         $v0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 267F4 80038BD4 00000000 */  nop
/* 267F8 80038BD8 A81C4290 */  lbu        $v0, 0x1CA8($v0)
/* 267FC 80038BDC 00000000 */  nop
/* 26800 80038BE0 2A106200 */  slt        $v0, $v1, $v0
/* 26804 80038BE4 3A004010 */  beqz       $v0, .L80038CD0
/* 26808 80038BE8 21900000 */   addu      $s2, $zero, $zero
/* 2680C 80038BEC 4403868F */  lw         $a2, 0x344($gp) /* Failed to symbolize address 0x00000344 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26810 80038BF0 2800A527 */  addiu      $a1, $sp, 0x28
/* 26814 80038BF4 00141200 */  sll        $v0, $s2, 16
.L80038BF8:
/* 26818 80038BF8 03240200 */  sra        $a0, $v0, 16
/* 2681C 80038BFC 80100400 */  sll        $v0, $a0, 2
/* 26820 80038C00 21104400 */  addu       $v0, $v0, $a0
/* 26824 80038C04 00110200 */  sll        $v0, $v0, 4
/* 26828 80038C08 2110C200 */  addu       $v0, $a2, $v0
/* 2682C 80038C0C 2000438C */  lw         $v1, 0x20($v0)
/* 26830 80038C10 00000000 */  nop
/* 26834 80038C14 18006010 */  beqz       $v1, .L80038C78
/* 26838 80038C18 00000000 */   nop
/* 2683C 80038C1C 00006290 */  lbu        $v0, 0x0($v1)
/* 26840 80038C20 00000000 */  nop
/* 26844 80038C24 14004014 */  bnez       $v0, .L80038C78
/* 26848 80038C28 E3000224 */   addiu     $v0, $zero, 0xE3
/* 2684C 80038C2C 01006390 */  lbu        $v1, 0x1($v1)
/* 26850 80038C30 00000000 */  nop
/* 26854 80038C34 03006210 */  beq        $v1, $v0, .L80038C44
/* 26858 80038C38 23000224 */   addiu     $v0, $zero, 0x23
/* 2685C 80038C3C 0E006214 */  bne        $v1, $v0, .L80038C78
/* 26860 80038C40 00000000 */   nop
.L80038C44:
/* 26864 80038C44 7800A297 */  lhu        $v0, 0x78($sp)
/* 26868 80038C48 01000324 */  addiu      $v1, $zero, 0x1
/* 2686C 80038C4C 21484000 */  addu       $t1, $v0, $zero
/* 26870 80038C50 01002925 */  addiu      $t1, $t1, 0x1
/* 26874 80038C54 00140200 */  sll        $v0, $v0, 16
/* 26878 80038C58 C3130200 */  sra        $v0, $v0, 15
/* 2687C 80038C5C 2110A203 */  addu       $v0, $sp, $v0
/* 26880 80038C60 7800A9A7 */  sh         $t1, 0x78($sp)
/* 26884 80038C64 180052A4 */  sh         $s2, 0x18($v0)
/* 26888 80038C68 40100400 */  sll        $v0, $a0, 1
/* 2688C 80038C6C 2110A200 */  addu       $v0, $a1, $v0
/* 26890 80038C70 2BE30008 */  j          .L80038CAC
/* 26894 80038C74 000043A4 */   sh        $v1, 0x0($v0)
.L80038C78:
/* 26898 80038C78 7000A297 */  lhu        $v0, 0x70($sp)
/* 2689C 80038C7C 00000000 */  nop
/* 268A0 80038C80 21484000 */  addu       $t1, $v0, $zero
/* 268A4 80038C84 01002925 */  addiu      $t1, $t1, 0x1
/* 268A8 80038C88 00140200 */  sll        $v0, $v0, 16
/* 268AC 80038C8C C3130200 */  sra        $v0, $v0, 15
/* 268B0 80038C90 2110A203 */  addu       $v0, $sp, $v0
/* 268B4 80038C94 7000A9A7 */  sh         $t1, 0x70($sp)
/* 268B8 80038C98 200052A4 */  sh         $s2, 0x20($v0)
/* 268BC 80038C9C 00141200 */  sll        $v0, $s2, 16
/* 268C0 80038CA0 C3130200 */  sra        $v0, $v0, 15
/* 268C4 80038CA4 2110A200 */  addu       $v0, $a1, $v0
/* 268C8 80038CA8 000040A4 */  sh         $zero, 0x0($v0)
.L80038CAC:
/* 268CC 80038CAC 01004226 */  addiu      $v0, $s2, 0x1
/* 268D0 80038CB0 21904000 */  addu       $s2, $v0, $zero
/* 268D4 80038CB4 4003838F */  lw         $v1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 268D8 80038CB8 00140200 */  sll        $v0, $v0, 16
/* 268DC 80038CBC A81C6390 */  lbu        $v1, 0x1CA8($v1)
/* 268E0 80038CC0 03140200 */  sra        $v0, $v0, 16
/* 268E4 80038CC4 2A104300 */  slt        $v0, $v0, $v1
/* 268E8 80038CC8 CBFF4014 */  bnez       $v0, .L80038BF8
/* 268EC 80038CCC 00141200 */   sll       $v0, $s2, 16
.L80038CD0:
/* 268F0 80038CD0 7000A997 */  lhu        $t1, 0x70($sp)
/* 268F4 80038CD4 00000000 */  nop
/* 268F8 80038CD8 00140900 */  sll        $v0, $t1, 16
/* 268FC 80038CDC 03240200 */  sra        $a0, $v0, 16
/* 26900 80038CE0 05008010 */  beqz       $a0, .L80038CF8
/* 26904 80038CE4 21280000 */   addu      $a1, $zero, $zero
/* 26908 80038CE8 7800A997 */  lhu        $t1, 0x78($sp)
/* 2690C 80038CEC 00000000 */  nop
/* 26910 80038CF0 00140900 */  sll        $v0, $t1, 16
/* 26914 80038CF4 2B280200 */  sltu       $a1, $zero, $v0
.L80038CF8:
/* 26918 80038CF8 4003828F */  lw         $v0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2691C 80038CFC 04000324 */  addiu      $v1, $zero, 0x4
/* 26920 80038D00 A81C4290 */  lbu        $v0, 0x1CA8($v0)
/* 26924 80038D04 23186500 */  subu       $v1, $v1, $a1
/* 26928 80038D08 23186200 */  subu       $v1, $v1, $v0
/* 2692C 80038D0C 80100300 */  sll        $v0, $v1, 2
/* 26930 80038D10 21104300 */  addu       $v0, $v0, $v1
/* 26934 80038D14 40100200 */  sll        $v0, $v0, 1
/* 26938 80038D18 07008010 */  beqz       $a0, .L80038D38
/* 2693C 80038D1C 6000A2A7 */   sh        $v0, 0x60($sp)
/* 26940 80038D20 01008324 */  addiu      $v1, $a0, 0x1
/* 26944 80038D24 80100300 */  sll        $v0, $v1, 2
/* 26948 80038D28 21104300 */  addu       $v0, $v0, $v1
/* 2694C 80038D2C 40100200 */  sll        $v0, $v0, 1
/* 26950 80038D30 4FE30008 */  j          .L80038D3C
/* 26954 80038D34 6800A2A7 */   sh        $v0, 0x68($sp)
.L80038D38:
/* 26958 80038D38 6800A0A7 */  sh         $zero, 0x68($sp)
.L80038D3C:
/* 2695C 80038D3C 6000A997 */  lhu        $t1, 0x60($sp)
/* 26960 80038D40 00000000 */  nop
/* 26964 80038D44 00140900 */  sll        $v0, $t1, 16
/* 26968 80038D48 43BC0200 */  sra        $s7, $v0, 17
/* 2696C 80038D4C 0880023C */  lui        $v0, %hi(D_80084344)
/* 26970 80038D50 44434324 */  addiu      $v1, $v0, %lo(D_80084344)
/* 26974 80038D54 77000224 */  addiu      $v0, $zero, 0x77
/* 26978 80038D58 23104900 */  subu       $v0, $v0, $t1
/* 2697C 80038D5C 200062A4 */  sh         $v0, 0x20($v1)
/* 26980 80038D60 7000A997 */  lhu        $t1, 0x70($sp)
/* 26984 80038D64 00000000 */  nop
/* 26988 80038D68 00140900 */  sll        $v0, $t1, 16
/* 2698C 80038D6C 03140200 */  sra        $v0, $v0, 16
/* 26990 80038D70 14004018 */  blez       $v0, .L80038DC4
/* 26994 80038D74 21900000 */   addu      $s2, $zero, $zero
/* 26998 80038D78 21306000 */  addu       $a2, $v1, $zero
/* 2699C 80038D7C 21284000 */  addu       $a1, $v0, $zero
/* 269A0 80038D80 001C1200 */  sll        $v1, $s2, 16
.L80038D84:
/* 269A4 80038D84 031C0300 */  sra        $v1, $v1, 16
/* 269A8 80038D88 04006424 */  addiu      $a0, $v1, 0x4
/* 269AC 80038D8C 80200400 */  sll        $a0, $a0, 2
/* 269B0 80038D90 21208600 */  addu       $a0, $a0, $a2
/* 269B4 80038D94 80100300 */  sll        $v0, $v1, 2
/* 269B8 80038D98 21104300 */  addu       $v0, $v0, $v1
/* 269BC 80038D9C 40100200 */  sll        $v0, $v0, 1
/* 269C0 80038DA0 4F004224 */  addiu      $v0, $v0, 0x4F
/* 269C4 80038DA4 000082A4 */  sh         $v0, 0x0($a0)
/* 269C8 80038DA8 01004226 */  addiu      $v0, $s2, 0x1
/* 269CC 80038DAC 21904000 */  addu       $s2, $v0, $zero
/* 269D0 80038DB0 00140200 */  sll        $v0, $v0, 16
/* 269D4 80038DB4 03140200 */  sra        $v0, $v0, 16
/* 269D8 80038DB8 2A104500 */  slt        $v0, $v0, $a1
/* 269DC 80038DBC F1FF4014 */  bnez       $v0, .L80038D84
/* 269E0 80038DC0 001C1200 */   sll       $v1, $s2, 16
.L80038DC4:
/* 269E4 80038DC4 7800A997 */  lhu        $t1, 0x78($sp)
/* 269E8 80038DC8 00000000 */  nop
/* 269EC 80038DCC 00240900 */  sll        $a0, $t1, 16
/* 269F0 80038DD0 1E008018 */  blez       $a0, .L80038E4C
/* 269F4 80038DD4 21900000 */   addu      $s2, $zero, $zero
/* 269F8 80038DD8 0880023C */  lui        $v0, %hi(D_80084344)
/* 269FC 80038DDC 7000A997 */  lhu        $t1, 0x70($sp)
/* 26A00 80038DE0 44434824 */  addiu      $t0, $v0, %lo(D_80084344)
/* 26A04 80038DE4 00140900 */  sll        $v0, $t1, 16
/* 26A08 80038DE8 033C0200 */  sra        $a3, $v0, 16
/* 26A0C 80038DEC 21280000 */  addu       $a1, $zero, $zero
.L80038DF0:
/* 26A10 80038DF0 001C1200 */  sll        $v1, $s2, 16
/* 26A14 80038DF4 031C0300 */  sra        $v1, $v1, 16
/* 26A18 80038DF8 04006224 */  addiu      $v0, $v1, 0x4
/* 26A1C 80038DFC 2110E200 */  addu       $v0, $a3, $v0
/* 26A20 80038E00 80100200 */  sll        $v0, $v0, 2
/* 26A24 80038E04 21304800 */  addu       $a2, $v0, $t0
/* 26A28 80038E08 0200E010 */  beqz       $a3, .L80038E14
/* 26A2C 80038E0C 21106700 */   addu      $v0, $v1, $a3
/* 26A30 80038E10 2B280400 */  sltu       $a1, $zero, $a0
.L80038E14:
/* 26A34 80038E14 21104500 */  addu       $v0, $v0, $a1
/* 26A38 80038E18 80180200 */  sll        $v1, $v0, 2
/* 26A3C 80038E1C 21186200 */  addu       $v1, $v1, $v0
/* 26A40 80038E20 40180300 */  sll        $v1, $v1, 1
/* 26A44 80038E24 4F006324 */  addiu      $v1, $v1, 0x4F
/* 26A48 80038E28 01004226 */  addiu      $v0, $s2, 0x1
/* 26A4C 80038E2C 21904000 */  addu       $s2, $v0, $zero
/* 26A50 80038E30 0000C3A4 */  sh         $v1, 0x0($a2)
/* 26A54 80038E34 7800A997 */  lhu        $t1, 0x78($sp)
/* 26A58 80038E38 00140200 */  sll        $v0, $v0, 16
/* 26A5C 80038E3C 00240900 */  sll        $a0, $t1, 16
/* 26A60 80038E40 2A104400 */  slt        $v0, $v0, $a0
/* 26A64 80038E44 EAFF4014 */  bnez       $v0, .L80038DF0
/* 26A68 80038E48 21280000 */   addu      $a1, $zero, $zero
.L80038E4C:
/* 26A6C 80038E4C 5000A98F */  lw         $t1, 0x50($sp)
/* 26A70 80038E50 00000000 */  nop
/* 26A74 80038E54 14002295 */  lhu        $v0, 0x14($t1)
/* 26A78 80038E58 4003838F */  lw         $v1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26A7C 80038E5C FFFE4430 */  andi       $a0, $v0, 0xFEFF
/* 26A80 80038E60 140024A5 */  sh         $a0, 0x14($t1)
/* 26A84 80038E64 A81C6290 */  lbu        $v0, 0x1CA8($v1)
/* 26A88 80038E68 00000000 */  nop
/* 26A8C 80038E6C 0300422C */  sltiu      $v0, $v0, 0x3
/* 26A90 80038E70 02004014 */  bnez       $v0, .L80038E7C
/* 26A94 80038E74 00018234 */   ori       $v0, $a0, 0x100
/* 26A98 80038E78 140022A5 */  sh         $v0, 0x14($t1)
.L80038E7C:
/* 26A9C 80038E7C 0980033C */  lui        $v1, %hi(D_8008D950)
/* 26AA0 80038E80 50D9638C */  lw         $v1, %lo(D_8008D950)($v1)
/* 26AA4 80038E84 00000000 */  nop
/* 26AA8 80038E88 01006230 */  andi       $v0, $v1, 0x1
/* 26AAC 80038E8C 16004010 */  beqz       $v0, .L80038EE8
/* 26AB0 80038E90 21200000 */   addu      $a0, $zero, $zero
/* 26AB4 80038E94 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 26AB8 80038E98 01000524 */   addiu     $a1, $zero, 0x1
/* 26ABC 80038E9C 5000A98F */  lw         $t1, 0x50($sp)
/* 26AC0 80038EA0 00000000 */  nop
/* 26AC4 80038EA4 1A002295 */  lhu        $v0, 0x1A($t1)
/* 26AC8 80038EA8 00000000 */  nop
/* 26ACC 80038EAC FFFF4224 */  addiu      $v0, $v0, -0x1
/* 26AD0 80038EB0 1A0022A5 */  sh         $v0, 0x1A($t1)
/* 26AD4 80038EB4 00140200 */  sll        $v0, $v0, 16
/* 26AD8 80038EB8 031C0200 */  sra        $v1, $v0, 16
/* 26ADC 80038EBC 25006004 */  bltz       $v1, .L80038F54
/* 26AE0 80038EC0 07000224 */   addiu     $v0, $zero, 0x7
/* 26AE4 80038EC4 A7006214 */  bne        $v1, $v0, .L80039164
/* 26AE8 80038EC8 21900000 */   addu      $s2, $zero, $zero
/* 26AEC 80038ECC 4003828F */  lw         $v0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26AF0 80038ED0 00000000 */  nop
/* 26AF4 80038ED4 A81C4290 */  lbu        $v0, 0x1CA8($v0)
/* 26AF8 80038ED8 5000A98F */  lw         $t1, 0x50($sp)
/* 26AFC 80038EDC 03004224 */  addiu      $v0, $v0, 0x3
/* 26B00 80038EE0 59E40008 */  j          .L80039164
/* 26B04 80038EE4 1A0022A5 */   sh        $v0, 0x1A($t1)
.L80038EE8:
/* 26B08 80038EE8 02006230 */  andi       $v0, $v1, 0x2
/* 26B0C 80038EEC 1C004010 */  beqz       $v0, .L80038F60
/* 26B10 80038EF0 00000000 */   nop
/* 26B14 80038EF4 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 26B18 80038EF8 01000524 */   addiu     $a1, $zero, 0x1
/* 26B1C 80038EFC 5000A98F */  lw         $t1, 0x50($sp)
/* 26B20 80038F00 00000000 */  nop
/* 26B24 80038F04 1A002295 */  lhu        $v0, 0x1A($t1)
/* 26B28 80038F08 00000000 */  nop
/* 26B2C 80038F0C 01004224 */  addiu      $v0, $v0, 0x1
/* 26B30 80038F10 1A0022A5 */  sh         $v0, 0x1A($t1)
/* 26B34 80038F14 00140200 */  sll        $v0, $v0, 16
/* 26B38 80038F18 031C0200 */  sra        $v1, $v0, 16
/* 26B3C 80038F1C 09006228 */  slti       $v0, $v1, 0x9
/* 26B40 80038F20 03004014 */  bnez       $v0, .L80038F30
/* 26B44 80038F24 00000000 */   nop
/* 26B48 80038F28 58E40008 */  j          .L80039160
/* 26B4C 80038F2C 1A0020A5 */   sh        $zero, 0x1A($t1)
.L80038F30:
/* 26B50 80038F30 4003828F */  lw         $v0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26B54 80038F34 00000000 */  nop
/* 26B58 80038F38 A81C4290 */  lbu        $v0, 0x1CA8($v0)
/* 26B5C 80038F3C 00000000 */  nop
/* 26B60 80038F40 04004224 */  addiu      $v0, $v0, 0x4
/* 26B64 80038F44 2A106200 */  slt        $v0, $v1, $v0
/* 26B68 80038F48 86004014 */  bnez       $v0, .L80039164
/* 26B6C 80038F4C 21900000 */   addu      $s2, $zero, $zero
/* 26B70 80038F50 5000A98F */  lw         $t1, 0x50($sp)
.L80038F54:
/* 26B74 80038F54 08000224 */  addiu      $v0, $zero, 0x8
/* 26B78 80038F58 58E40008 */  j          .L80039160
/* 26B7C 80038F5C 1A0022A5 */   sh        $v0, 0x1A($t1)
.L80038F60:
/* 26B80 80038F60 5000A98F */  lw         $t1, 0x50($sp)
/* 26B84 80038F64 00000000 */  nop
/* 26B88 80038F68 1A002385 */  lh         $v1, 0x1A($t1)
/* 26B8C 80038F6C 00000000 */  nop
/* 26B90 80038F70 0900622C */  sltiu      $v0, $v1, 0x9
/* 26B94 80038F74 7A004010 */  beqz       $v0, .L80039160
/* 26B98 80038F78 0180023C */   lui       $v0, %hi(jtbl_8001151C_ctr)
/* 26B9C 80038F7C 1C154224 */  addiu      $v0, $v0, %lo(jtbl_8001151C_ctr)
/* 26BA0 80038F80 80180300 */  sll        $v1, $v1, 2
/* 26BA4 80038F84 21186200 */  addu       $v1, $v1, $v0
/* 26BA8 80038F88 0000628C */  lw         $v0, 0x0($v1)
/* 26BAC 80038F8C 00000000 */  nop
/* 26BB0 80038F90 08004000 */  jr         $v0
/* 26BB4 80038F94 00000000 */   nop
/* 26BB8 80038F98 5000A98F */  lw         $t1, 0x50($sp)
/* 26BBC 80038F9C 00000000 */  nop
/* 26BC0 80038FA0 1A003085 */  lh         $s0, 0x1A($t1)
/* 26BC4 80038FA4 01000524 */  addiu      $a1, $zero, 0x1
/* 26BC8 80038FA8 82AC000C */  jal        DECOMP_OptionsMenu_TestSound
/* 26BCC 80038FAC 21200002 */   addu      $a0, $s0, $zero
/* 26BD0 80038FB0 0980033C */  lui        $v1, %hi(D_8008D974)
/* 26BD4 80038FB4 74D9638C */  lw         $v1, %lo(D_8008D974)($v1)
/* 26BD8 80038FB8 00000000 */  nop
/* 26BDC 80038FBC 04006230 */  andi       $v0, $v1, 0x4
/* 26BE0 80038FC0 0C004010 */  beqz       $v0, .L80038FF4
/* 26BE4 80038FC4 08006230 */   andi      $v0, $v1, 0x8
/* 26BE8 80038FC8 38AC000C */  jal        DECOMP_howl_VolumeGet
/* 26BEC 80038FCC 21200002 */   addu      $a0, $s0, $zero
/* 26BF0 80038FD0 FF004230 */  andi       $v0, $v0, 0xFF
/* 26BF4 80038FD4 FCFF4224 */  addiu      $v0, $v0, -0x4
/* 26BF8 80038FD8 02004104 */  bgez       $v0, .L80038FE4
/* 26BFC 80038FDC 21200002 */   addu      $a0, $s0, $zero
/* 26C00 80038FE0 21100000 */  addu       $v0, $zero, $zero
.L80038FE4:
/* 26C04 80038FE4 4CAC000C */  jal        DECOMP_howl_VolumeSet
/* 26C08 80038FE8 FF004530 */   andi      $a1, $v0, 0xFF
/* 26C0C 80038FEC 59E40008 */  j          .L80039164
/* 26C10 80038FF0 21900000 */   addu      $s2, $zero, $zero
.L80038FF4:
/* 26C14 80038FF4 5B004010 */  beqz       $v0, .L80039164
/* 26C18 80038FF8 21900000 */   addu      $s2, $zero, $zero
/* 26C1C 80038FFC 38AC000C */  jal        DECOMP_howl_VolumeGet
/* 26C20 80039000 21200002 */   addu      $a0, $s0, $zero
/* 26C24 80039004 FF004530 */  andi       $a1, $v0, 0xFF
/* 26C28 80039008 0400A524 */  addiu      $a1, $a1, 0x4
/* 26C2C 8003900C 0001A228 */  slti       $v0, $a1, 0x100
/* 26C30 80039010 02004014 */  bnez       $v0, .L8003901C
/* 26C34 80039014 21200002 */   addu      $a0, $s0, $zero
/* 26C38 80039018 FF000524 */  addiu      $a1, $zero, 0xFF
.L8003901C:
/* 26C3C 8003901C 4CAC000C */  jal        DECOMP_howl_VolumeSet
/* 26C40 80039020 FF00A530 */   andi      $a1, $a1, 0xFF
/* 26C44 80039024 59E40008 */  j          .L80039164
/* 26C48 80039028 21900000 */   addu      $s2, $zero, $zero
/* 26C4C 8003902C 21200000 */  addu       $a0, $zero, $zero
/* 26C50 80039030 82AC000C */  jal        DECOMP_OptionsMenu_TestSound
/* 26C54 80039034 21288000 */   addu      $a1, $a0, $zero
/* 26C58 80039038 0980023C */  lui        $v0, %hi(D_8008D950)
/* 26C5C 8003903C 50D9428C */  lw         $v0, %lo(D_8008D950)($v0)
/* 26C60 80039040 00000000 */  nop
/* 26C64 80039044 50004230 */  andi       $v0, $v0, 0x50
/* 26C68 80039048 45004010 */  beqz       $v0, .L80039160
/* 26C6C 8003904C 01000424 */   addiu     $a0, $zero, 0x1
/* 26C70 80039050 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 26C74 80039054 21288000 */   addu      $a1, $a0, $zero
/* 26C78 80039058 7CAC000C */  jal        DECOMP_howl_ModeGet
/* 26C7C 8003905C 21900000 */   addu      $s2, $zero, $zero
/* 26C80 80039060 FF004230 */  andi       $v0, $v0, 0xFF
/* 26C84 80039064 7FAC000C */  jal        DECOMP_howl_ModeSet
/* 26C88 80039068 0100442C */   sltiu     $a0, $v0, 0x1
/* 26C8C 8003906C 5AE40008 */  j          .L80039168
/* 26C90 80039070 0880023C */   lui       $v0, %hi(D_80084328)
/* 26C94 80039074 21200000 */  addu       $a0, $zero, $zero
/* 26C98 80039078 82AC000C */  jal        DECOMP_OptionsMenu_TestSound
/* 26C9C 8003907C 21288000 */   addu      $a1, $a0, $zero
/* 26CA0 80039080 0980023C */  lui        $v0, %hi(D_8008D950)
/* 26CA4 80039084 50D9428C */  lw         $v0, %lo(D_8008D950)($v0)
/* 26CA8 80039088 00000000 */  nop
/* 26CAC 8003908C 50004230 */  andi       $v0, $v0, 0x50
/* 26CB0 80039090 33004010 */  beqz       $v0, .L80039160
/* 26CB4 80039094 01000424 */   addiu     $a0, $zero, 0x1
/* 26CB8 80039098 5000A98F */  lw         $t1, 0x50($sp)
/* 26CBC 8003909C 00000000 */  nop
/* 26CC0 800390A0 1A003095 */  lhu        $s0, 0x1A($t1)
/* 26CC4 800390A4 21288000 */  addu       $a1, $a0, $zero
/* 26CC8 800390A8 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 26CCC 800390AC FCFF1026 */   addiu     $s0, $s0, -0x4
/* 26CD0 800390B0 00841000 */  sll        $s0, $s0, 16
/* 26CD4 800390B4 7000A997 */  lhu        $t1, 0x70($sp)
/* 26CD8 800390B8 03841000 */  sra        $s0, $s0, 16
/* 26CDC 800390BC 00140900 */  sll        $v0, $t1, 16
/* 26CE0 800390C0 031C0200 */  sra        $v1, $v0, 16
/* 26CE4 800390C4 2A100302 */  slt        $v0, $s0, $v1
/* 26CE8 800390C8 0B004014 */  bnez       $v0, .L800390F8
/* 26CEC 800390CC 0880043C */   lui       $a0, %hi(D_8008430C)
/* 26CF0 800390D0 23100302 */  subu       $v0, $s0, $v1
/* 26CF4 800390D4 40100200 */  sll        $v0, $v0, 1
/* 26CF8 800390D8 2110A203 */  addu       $v0, $sp, $v0
/* 26CFC 800390DC 18004394 */  lhu        $v1, 0x18($v0)
/* 26D00 800390E0 01000224 */  addiu      $v0, $zero, 0x1
/* 26D04 800390E4 F80882A7 */  sh         $v0, 0x8F8($gp) /* Failed to symbolize address 0x000008F8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26D08 800390E8 2C0980A7 */  sh         $zero, 0x92C($gp) /* Failed to symbolize address 0x0000092C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26D0C 800390EC 100983A7 */  sh         $v1, 0x910($gp) /* Failed to symbolize address 0x00000910 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26D10 800390F0 59E40008 */  j          .L80039164
/* 26D14 800390F4 21900000 */   addu      $s2, $zero, $zero
.L800390F8:
/* 26D18 800390F8 40101000 */  sll        $v0, $s0, 1
/* 26D1C 800390FC 2110A203 */  addu       $v0, $sp, $v0
/* 26D20 80039100 0C438424 */  addiu      $a0, $a0, %lo(D_8008430C)
/* 26D24 80039104 20004384 */  lh         $v1, 0x20($v0)
/* 26D28 80039108 4003858F */  lw         $a1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26D2C 8003910C 80180300 */  sll        $v1, $v1, 2
/* 26D30 80039110 21186400 */  addu       $v1, $v1, $a0
/* 26D34 80039114 0000A28C */  lw         $v0, 0x0($a1)
/* 26D38 80039118 0000638C */  lw         $v1, 0x0($v1)
/* 26D3C 8003911C 00000000 */  nop
/* 26D40 80039120 26104300 */  xor        $v0, $v0, $v1
/* 26D44 80039124 58E40008 */  j          .L80039160
/* 26D48 80039128 0000A2AC */   sw        $v0, 0x0($a1)
/* 26D4C 8003912C 21200000 */  addu       $a0, $zero, $zero
/* 26D50 80039130 82AC000C */  jal        DECOMP_OptionsMenu_TestSound
/* 26D54 80039134 21288000 */   addu      $a1, $a0, $zero
/* 26D58 80039138 0980023C */  lui        $v0, %hi(D_8008D950)
/* 26D5C 8003913C 50D9428C */  lw         $v0, %lo(D_8008D950)($v0)
/* 26D60 80039140 00000000 */  nop
/* 26D64 80039144 50004230 */  andi       $v0, $v0, 0x50
/* 26D68 80039148 05004010 */  beqz       $v0, .L80039160
/* 26D6C 8003914C 01000424 */   addiu     $a0, $zero, 0x1
/* 26D70 80039150 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 26D74 80039154 21288000 */   addu      $a1, $a0, $zero
/* 26D78 80039158 01000924 */  addiu      $t1, $zero, 0x1
/* 26D7C 8003915C 5800A9A7 */  sh         $t1, 0x58($sp)
.L80039160:
/* 26D80 80039160 21900000 */  addu       $s2, $zero, $zero
.L80039164:
/* 26D84 80039164 0880023C */  lui        $v0, %hi(D_80084328)
.L80039168:
/* 26D88 80039168 28435024 */  addiu      $s0, $v0, %lo(D_80084328)
/* 26D8C 8003916C 00141200 */  sll        $v0, $s2, 16
.L80039170:
/* 26D90 80039170 C3130200 */  sra        $v0, $v0, 15
/* 26D94 80039174 21105000 */  addu       $v0, $v0, $s0
/* 26D98 80039178 00004284 */  lh         $v0, 0x0($v0)
/* 26D9C 8003917C 0C09838F */  lw         $v1, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26DA0 80039180 80100200 */  sll        $v0, $v0, 2
/* 26DA4 80039184 21104300 */  addu       $v0, $v0, $v1
/* 26DA8 80039188 0000448C */  lw         $a0, 0x0($v0)
/* 26DAC 8003918C 3489000C */  jal        DECOMP_DecalFont_GetLineWidth
/* 26DB0 80039190 02000524 */   addiu     $a1, $zero, 0x2
/* 26DB4 80039194 21204000 */  addu       $a0, $v0, $zero
/* 26DB8 80039198 001C0400 */  sll        $v1, $a0, 16
/* 26DBC 8003919C 00141100 */  sll        $v0, $s1, 16
/* 26DC0 800391A0 2A104300 */  slt        $v0, $v0, $v1
/* 26DC4 800391A4 02004010 */  beqz       $v0, .L800391B0
/* 26DC8 800391A8 00000000 */   nop
/* 26DCC 800391AC 21888000 */  addu       $s1, $a0, $zero
.L800391B0:
/* 26DD0 800391B0 01005226 */  addiu      $s2, $s2, 0x1
/* 26DD4 800391B4 FFFF4232 */  andi       $v0, $s2, 0xFFFF
/* 26DD8 800391B8 0300422C */  sltiu      $v0, $v0, 0x3
/* 26DDC 800391BC ECFF4014 */  bnez       $v0, .L80039170
/* 26DE0 800391C0 00141200 */   sll       $v0, $s2, 16
/* 26DE4 800391C4 00010524 */  addiu      $a1, $zero, 0x100
/* 26DE8 800391C8 1A00E626 */  addiu      $a2, $s7, 0x1A
/* 26DEC 800391CC 00340600 */  sll        $a2, $a2, 16
/* 26DF0 800391D0 03340600 */  sra        $a2, $a2, 16
/* 26DF4 800391D4 01000724 */  addiu      $a3, $zero, 0x1
/* 26DF8 800391D8 21900000 */  addu       $s2, $zero, $zero
/* 26DFC 800391DC 0C09838F */  lw         $v1, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26E00 800391E0 00800224 */  addiu      $v0, $zero, -0x8000
/* 26E04 800391E4 1000A2AF */  sw         $v0, 0x10($sp)
/* 26E08 800391E8 1005648C */  lw         $a0, 0x510($v1)
/* 26E0C 800391EC 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 26E10 800391F0 3000BE27 */   addiu     $fp, $sp, 0x30
/* 26E14 800391F4 1E002326 */  addiu      $v1, $s1, 0x1E
/* 26E18 800391F8 21B06000 */  addu       $s6, $v1, $zero
/* 26E1C 800391FC 7C010224 */  addiu      $v0, $zero, 0x17C
/* 26E20 80039200 23104300 */  subu       $v0, $v0, $v1
/* 26E24 80039204 9000A2A7 */  sh         $v0, 0x90($sp)
/* 26E28 80039208 00140200 */  sll        $v0, $v0, 16
/* 26E2C 8003920C 03140200 */  sra        $v0, $v0, 16
/* 26E30 80039210 FBFF4224 */  addiu      $v0, $v0, -0x5
/* 26E34 80039214 9800A2AF */  sw         $v0, 0x98($sp)
/* 26E38 80039218 00141200 */  sll        $v0, $s2, 16
.L8003921C:
/* 26E3C 8003921C 03A40200 */  sra        $s4, $v0, 16
/* 26E40 80039220 21208002 */  addu       $a0, $s4, $zero
/* 26E44 80039224 80101400 */  sll        $v0, $s4, 2
/* 26E48 80039228 21105400 */  addu       $v0, $v0, $s4
/* 26E4C 8003922C 38AC000C */  jal        DECOMP_howl_VolumeGet
/* 26E50 80039230 40A80200 */   sll       $s5, $v0, 1
/* 26E54 80039234 9800A98F */  lw         $t1, 0x98($sp)
/* 26E58 80039238 FF004230 */  andi       $v0, $v0, 0xFF
/* 26E5C 8003923C 18004900 */  mult       $v0, $t1
/* 26E60 80039240 12100000 */  mflo       $v0
/* 26E64 80039244 02004104 */  bgez       $v0, .L80039250
/* 26E68 80039248 2198F502 */   addu      $s3, $s7, $s5
/* 26E6C 8003924C FF004224 */  addiu      $v0, $v0, 0xFF
.L80039250:
/* 26E70 80039250 2120C003 */  addu       $a0, $fp, $zero
/* 26E74 80039254 03820200 */  sra        $s0, $v0, 8
/* 26E78 80039258 38001026 */  addiu      $s0, $s0, 0x38
/* 26E7C 8003925C 2180D002 */  addu       $s0, $s6, $s0
/* 26E80 80039260 01000226 */  addiu      $v0, $s0, 0x1
/* 26E84 80039264 4003838F */  lw         $v1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26E88 80039268 30007126 */  addiu      $s1, $s3, 0x30
/* 26E8C 8003926C 3000A2A7 */  sh         $v0, 0x30($sp)
/* 26E90 80039270 03000224 */  addiu      $v0, $zero, 0x3
/* 26E94 80039274 3400A2A7 */  sh         $v0, 0x34($sp)
/* 26E98 80039278 0A000224 */  addiu      $v0, $zero, 0xA
/* 26E9C 8003927C 3200B1A7 */  sh         $s1, 0x32($sp)
/* 26EA0 80039280 3600A2A7 */  sh         $v0, 0x36($sp)
/* 26EA4 80039284 1000678C */  lw         $a3, 0x10($v1)
/* 26EA8 80039288 0880053C */  lui        $a1, %hi(D_8008433C)
/* 26EAC 8003928C 3C43A524 */  addiu      $a1, $a1, %lo(D_8008433C)
/* 26EB0 80039290 A000E68C */  lw         $a2, 0xA0($a3)
/* 26EB4 80039294 2586000C */  jal        DECOMP_CTR_Box_DrawSolidBox
/* 26EB8 80039298 7400E724 */   addiu     $a3, $a3, 0x74
/* 26EBC 8003929C 2120C003 */  addu       $a0, $fp, $zero
/* 26EC0 800392A0 2F006226 */  addiu      $v0, $s3, 0x2F
/* 26EC4 800392A4 3200A2A7 */  sh         $v0, 0x32($sp)
/* 26EC8 800392A8 05000224 */  addiu      $v0, $zero, 0x5
/* 26ECC 800392AC 3400A2A7 */  sh         $v0, 0x34($sp)
/* 26ED0 800392B0 0C000224 */  addiu      $v0, $zero, 0xC
/* 26ED4 800392B4 0880093C */  lui        $t1, %hi(D_8008433C)
/* 26ED8 800392B8 4003838F */  lw         $v1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26EDC 800392BC 3C432925 */  addiu      $t1, $t1, %lo(D_8008433C)
/* 26EE0 800392C0 3000B0A7 */  sh         $s0, 0x30($sp)
/* 26EE4 800392C4 3600A2A7 */  sh         $v0, 0x36($sp)
/* 26EE8 800392C8 1000678C */  lw         $a3, 0x10($v1)
/* 26EEC 800392CC 04002525 */  addiu      $a1, $t1, 0x4
/* 26EF0 800392D0 A000E68C */  lw         $a2, 0xA0($a3)
/* 26EF4 800392D4 2586000C */  jal        DECOMP_CTR_Box_DrawSolidBox
/* 26EF8 800392D8 7400E724 */   addiu     $a3, $a3, 0x74
/* 26EFC 800392DC 3800A427 */  addiu      $a0, $sp, 0x38
/* 26F00 800392E0 3800C226 */  addiu      $v0, $s6, 0x38
/* 26F04 800392E4 9000A997 */  lhu        $t1, 0x90($sp)
/* 26F08 800392E8 4003858F */  lw         $a1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26F0C 800392EC 3A006326 */  addiu      $v1, $s3, 0x3A
/* 26F10 800392F0 3800A2A7 */  sh         $v0, 0x38($sp)
/* 26F14 800392F4 3A00A3A7 */  sh         $v1, 0x3A($sp)
/* 26F18 800392F8 3E00B1A7 */  sh         $s1, 0x3E($sp)
/* 26F1C 800392FC 4200A3A7 */  sh         $v1, 0x42($sp)
/* 26F20 80039300 38002225 */  addiu      $v0, $t1, 0x38
/* 26F24 80039304 2110C202 */  addu       $v0, $s6, $v0
/* 26F28 80039308 0880093C */  lui        $t1, %hi(D_8008433C)
/* 26F2C 8003930C 3C432925 */  addiu      $t1, $t1, %lo(D_8008433C)
/* 26F30 80039310 3C00A2A7 */  sh         $v0, 0x3C($sp)
/* 26F34 80039314 4000A2A7 */  sh         $v0, 0x40($sp)
/* 26F38 80039318 1000A78C */  lw         $a3, 0x10($a1)
/* 26F3C 8003931C F4FF2525 */  addiu      $a1, $t1, -0xC
/* 26F40 80039320 A000E68C */  lw         $a2, 0xA0($a3)
/* 26F44 80039324 FA14010C */  jal        DECOMP_RECTMENU_DrawRwdTriangle
/* 26F48 80039328 7400E724 */   addiu     $a3, $a3, 0x74
/* 26F4C 8003932C 4C000524 */  addiu      $a1, $zero, 0x4C
/* 26F50 80039330 0880023C */  lui        $v0, %hi(D_80084328)
/* 26F54 80039334 28434224 */  addiu      $v0, $v0, %lo(D_80084328)
/* 26F58 80039338 40181400 */  sll        $v1, $s4, 1
/* 26F5C 8003933C 21186200 */  addu       $v1, $v1, $v0
/* 26F60 80039340 3200E626 */  addiu      $a2, $s7, 0x32
/* 26F64 80039344 2130A602 */  addu       $a2, $s5, $a2
/* 26F68 80039348 00340600 */  sll        $a2, $a2, 16
/* 26F6C 8003934C 00006284 */  lh         $v0, 0x0($v1)
/* 26F70 80039350 0C09838F */  lw         $v1, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26F74 80039354 03340600 */  sra        $a2, $a2, 16
/* 26F78 80039358 1000A0AF */  sw         $zero, 0x10($sp)
/* 26F7C 8003935C 80100200 */  sll        $v0, $v0, 2
/* 26F80 80039360 21104300 */  addu       $v0, $v0, $v1
/* 26F84 80039364 0000448C */  lw         $a0, 0x0($v0)
/* 26F88 80039368 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 26F8C 8003936C 02000724 */   addiu     $a3, $zero, 0x2
/* 26F90 80039370 01004226 */  addiu      $v0, $s2, 0x1
/* 26F94 80039374 21904000 */  addu       $s2, $v0, $zero
/* 26F98 80039378 00140200 */  sll        $v0, $v0, 16
/* 26F9C 8003937C 03140200 */  sra        $v0, $v0, 16
/* 26FA0 80039380 03004228 */  slti       $v0, $v0, 0x3
/* 26FA4 80039384 A5FF4014 */  bnez       $v0, .L8003921C
/* 26FA8 80039388 00141200 */   sll       $v0, $s2, 16
/* 26FAC 8003938C 4C000524 */  addiu      $a1, $zero, 0x4C
/* 26FB0 80039390 5000E626 */  addiu      $a2, $s7, 0x50
/* 26FB4 80039394 00340600 */  sll        $a2, $a2, 16
/* 26FB8 80039398 0C09828F */  lw         $v0, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26FBC 8003939C 03340600 */  sra        $a2, $a2, 16
/* 26FC0 800393A0 1000A0AF */  sw         $zero, 0x10($sp)
/* 26FC4 800393A4 3005448C */  lw         $a0, 0x530($v0)
/* 26FC8 800393A8 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 26FCC 800393AC 02000724 */   addiu     $a3, $zero, 0x2
/* 26FD0 800393B0 7CAC000C */  jal        DECOMP_howl_ModeGet
/* 26FD4 800393B4 00000000 */   nop
/* 26FD8 800393B8 FF004230 */  andi       $v0, $v0, 0xFF
/* 26FDC 800393BC 04004014 */  bnez       $v0, .L800393D0
/* 26FE0 800393C0 00000000 */   nop
/* 26FE4 800393C4 0C09828F */  lw         $v0, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26FE8 800393C8 F7E40008 */  j          .L800393DC
/* 26FEC 800393CC 34054424 */   addiu     $a0, $v0, 0x534
.L800393D0:
/* 26FF0 800393D0 0C09828F */  lw         $v0, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26FF4 800393D4 00000000 */  nop
/* 26FF8 800393D8 38054424 */  addiu      $a0, $v0, 0x538
.L800393DC:
/* 26FFC 800393DC B4010524 */  addiu      $a1, $zero, 0x1B4
/* 27000 800393E0 5000E626 */  addiu      $a2, $s7, 0x50
/* 27004 800393E4 00340600 */  sll        $a2, $a2, 16
/* 27008 800393E8 03340600 */  sra        $a2, $a2, 16
/* 2700C 800393EC 04400224 */  addiu      $v0, $zero, 0x4004
/* 27010 800393F0 1000A2AF */  sw         $v0, 0x10($sp)
/* 27014 800393F4 0000848C */  lw         $a0, 0x0($a0)
/* 27018 800393F8 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 2701C 800393FC 02000724 */   addiu     $a3, $zero, 0x2
/* 27020 80039400 7000A997 */  lhu        $t1, 0x70($sp)
/* 27024 80039404 00000000 */  nop
/* 27028 80039408 00140900 */  sll        $v0, $t1, 16
/* 2702C 8003940C 038C0200 */  sra        $s1, $v0, 16
/* 27030 80039410 9A002012 */  beqz       $s1, .L8003967C
/* 27034 80039414 4C000524 */   addiu     $a1, $zero, 0x4C
/* 27038 80039418 5A00E626 */  addiu      $a2, $s7, 0x5A
/* 2703C 8003941C 00340600 */  sll        $a2, $a2, 16
/* 27040 80039420 0C09828F */  lw         $v0, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 27044 80039424 03340600 */  sra        $a2, $a2, 16
/* 27048 80039428 1000A0AF */  sw         $zero, 0x10($sp)
/* 2704C 8003942C 2805448C */  lw         $a0, 0x528($v0)
/* 27050 80039430 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 27054 80039434 02000724 */   addiu     $a3, $zero, 0x2
/* 27058 80039438 0880023C */  lui        $v0, %hi(D_8008431C)
/* 2705C 8003943C 1C435424 */  addiu      $s4, $v0, %lo(D_8008431C)
/* 27060 80039440 04008286 */  lh         $v0, 0x4($s4)
/* 27064 80039444 0C09838F */  lw         $v1, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 27068 80039448 80100200 */  sll        $v0, $v0, 2
/* 2706C 8003944C 21104300 */  addu       $v0, $v0, $v1
/* 27070 80039450 0000448C */  lw         $a0, 0x0($v0)
/* 27074 80039454 3489000C */  jal        DECOMP_DecalFont_GetLineWidth
/* 27078 80039458 02000524 */   addiu     $a1, $zero, 0x2
/* 2707C 8003945C 0C09838F */  lw         $v1, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 27080 80039460 02000524 */  addiu      $a1, $zero, 0x2
/* 27084 80039464 1805648C */  lw         $a0, 0x518($v1)
/* 27088 80039468 3489000C */  jal        DECOMP_DecalFont_GetLineWidth
/* 2708C 8003946C 21984000 */   addu      $s3, $v0, $zero
/* 27090 80039470 0C09838F */  lw         $v1, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 27094 80039474 02000524 */  addiu      $a1, $zero, 0x2
/* 27098 80039478 1405648C */  lw         $a0, 0x514($v1)
/* 2709C 8003947C 3489000C */  jal        DECOMP_DecalFont_GetLineWidth
/* 270A0 80039480 21804000 */   addu      $s0, $v0, $zero
/* 270A4 80039484 21204000 */  addu       $a0, $v0, $zero
/* 270A8 80039488 00140400 */  sll        $v0, $a0, 16
/* 270AC 8003948C 001C1000 */  sll        $v1, $s0, 16
/* 270B0 80039490 2A104300 */  slt        $v0, $v0, $v1
/* 270B4 80039494 02004010 */  beqz       $v0, .L800394A0
/* 270B8 80039498 21900000 */   addu      $s2, $zero, $zero
/* 270BC 8003949C 21200002 */  addu       $a0, $s0, $zero
.L800394A0:
/* 270C0 800394A0 21106402 */  addu       $v0, $s3, $a0
/* 270C4 800394A4 0A004224 */  addiu      $v0, $v0, 0xA
/* 270C8 800394A8 00140200 */  sll        $v0, $v0, 16
/* 270CC 800394AC 031C0200 */  sra        $v1, $v0, 16
/* 270D0 800394B0 C2170200 */  srl        $v0, $v0, 31
/* 270D4 800394B4 21186200 */  addu       $v1, $v1, $v0
/* 270D8 800394B8 43180300 */  sra        $v1, $v1, 1
/* 270DC 800394BC 00010224 */  addiu      $v0, $zero, 0x100
/* 270E0 800394C0 23104300 */  subu       $v0, $v0, $v1
/* 270E4 800394C4 6D00201A */  blez       $s1, .L8003967C
/* 270E8 800394C8 21B04000 */   addu      $s6, $v0, $zero
/* 270EC 800394CC 21F08002 */  addu       $fp, $s4, $zero
/* 270F0 800394D0 00140200 */  sll        $v0, $v0, 16
/* 270F4 800394D4 03AC0200 */  sra        $s5, $v0, 16
/* 270F8 800394D8 0880023C */  lui        $v0, %hi(D_8008430C)
/* 270FC 800394DC 0C435424 */  addiu      $s4, $v0, %lo(D_8008430C)
/* 27100 800394E0 00141200 */  sll        $v0, $s2, 16
.L800394E4:
/* 27104 800394E4 C3130200 */  sra        $v0, $v0, 15
/* 27108 800394E8 2110A203 */  addu       $v0, $sp, $v0
/* 2710C 800394EC 21880000 */  addu       $s1, $zero, $zero
/* 27110 800394F0 20005094 */  lhu        $s0, 0x20($v0)
/* 27114 800394F4 8000A997 */  lhu        $t1, 0x80($sp)
/* 27118 800394F8 00141000 */  sll        $v0, $s0, 16
/* 2711C 800394FC 03140200 */  sra        $v0, $v0, 16
/* 27120 80039500 80180200 */  sll        $v1, $v0, 2
/* 27124 80039504 21186200 */  addu       $v1, $v1, $v0
/* 27128 80039508 4403828F */  lw         $v0, 0x344($gp) /* Failed to symbolize address 0x00000344 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2712C 8003950C 00190300 */  sll        $v1, $v1, 4
/* 27130 80039510 21104300 */  addu       $v0, $v0, $v1
/* 27134 80039514 2000428C */  lw         $v0, 0x20($v0)
/* 27138 80039518 00000000 */  nop
/* 2713C 8003951C 05004010 */  beqz       $v0, .L80039534
/* 27140 80039520 21180902 */   addu      $v1, $s0, $t1
/* 27144 80039524 00004290 */  lbu        $v0, 0x0($v0)
/* 27148 80039528 00000000 */  nop
/* 2714C 8003952C 03004010 */  beqz       $v0, .L8003953C
/* 27150 80039530 00140300 */   sll       $v0, $v1, 16
.L80039534:
/* 27154 80039534 01001124 */  addiu      $s1, $zero, 0x1
/* 27158 80039538 00140300 */  sll        $v0, $v1, 16
.L8003953C:
/* 2715C 8003953C C3130200 */  sra        $v0, $v0, 15
/* 27160 80039540 21105E00 */  addu       $v0, $v0, $fp
/* 27164 80039544 00004284 */  lh         $v0, 0x0($v0)
/* 27168 80039548 0C09838F */  lw         $v1, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2716C 8003954C 80100200 */  sll        $v0, $v0, 2
/* 27170 80039550 21204300 */  addu       $a0, $v0, $v1
/* 27174 80039554 001C1200 */  sll        $v1, $s2, 16
/* 27178 80039558 031C0300 */  sra        $v1, $v1, 16
/* 2717C 8003955C 80100300 */  sll        $v0, $v1, 2
/* 27180 80039560 21104300 */  addu       $v0, $v0, $v1
/* 27184 80039564 40100200 */  sll        $v0, $v0, 1
/* 27188 80039568 6400E326 */  addiu      $v1, $s7, 0x64
/* 2718C 8003956C 21104300 */  addu       $v0, $v0, $v1
/* 27190 80039570 00140200 */  sll        $v0, $v0, 16
/* 27194 80039574 03340200 */  sra        $a2, $v0, 16
/* 27198 80039578 21102002 */  addu       $v0, $s1, $zero
/* 2719C 8003957C 03004010 */  beqz       $v0, .L8003958C
/* 271A0 80039580 17000224 */   addiu     $v0, $zero, 0x17
/* 271A4 80039584 64E50008 */  j          .L80039590
/* 271A8 80039588 1000A2AF */   sw        $v0, 0x10($sp)
.L8003958C:
/* 271AC 8003958C 1000A0AF */  sw         $zero, 0x10($sp)
.L80039590:
/* 271B0 80039590 2128A002 */  addu       $a1, $s5, $zero
/* 271B4 80039594 0000848C */  lw         $a0, 0x0($a0)
/* 271B8 80039598 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 271BC 8003959C 02000724 */   addiu     $a3, $zero, 0x2
/* 271C0 800395A0 001C1000 */  sll        $v1, $s0, 16
/* 271C4 800395A4 831B0300 */  sra        $v1, $v1, 14
/* 271C8 800395A8 21187400 */  addu       $v1, $v1, $s4
/* 271CC 800395AC 4003828F */  lw         $v0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 271D0 800395B0 0000638C */  lw         $v1, 0x0($v1)
/* 271D4 800395B4 0000428C */  lw         $v0, 0x0($v0)
/* 271D8 800395B8 00000000 */  nop
/* 271DC 800395BC 24104300 */  and        $v0, $v0, $v1
/* 271E0 800395C0 04004010 */  beqz       $v0, .L800395D4
/* 271E4 800395C4 00000000 */   nop
/* 271E8 800395C8 0C09828F */  lw         $v0, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 271EC 800395CC 78E50008 */  j          .L800395E0
/* 271F0 800395D0 18054424 */   addiu     $a0, $v0, 0x518
.L800395D4:
/* 271F4 800395D4 0C09828F */  lw         $v0, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 271F8 800395D8 00000000 */  nop
/* 271FC 800395DC 14054424 */  addiu      $a0, $v0, 0x514
.L800395E0:
/* 27200 800395E0 2110D302 */  addu       $v0, $s6, $s3
/* 27204 800395E4 0A004224 */  addiu      $v0, $v0, 0xA
/* 27208 800395E8 00140200 */  sll        $v0, $v0, 16
/* 2720C 800395EC 032C0200 */  sra        $a1, $v0, 16
/* 27210 800395F0 001C1200 */  sll        $v1, $s2, 16
/* 27214 800395F4 031C0300 */  sra        $v1, $v1, 16
/* 27218 800395F8 80100300 */  sll        $v0, $v1, 2
/* 2721C 800395FC 21104300 */  addu       $v0, $v0, $v1
/* 27220 80039600 40100200 */  sll        $v0, $v0, 1
/* 27224 80039604 6400E326 */  addiu      $v1, $s7, 0x64
/* 27228 80039608 21104300 */  addu       $v0, $v0, $v1
/* 2722C 8003960C 00140200 */  sll        $v0, $v0, 16
/* 27230 80039610 03340200 */  sra        $a2, $v0, 16
/* 27234 80039614 21102002 */  addu       $v0, $s1, $zero
/* 27238 80039618 0C004014 */  bnez       $v0, .L8003964C
/* 2723C 8003961C 17000224 */   addiu     $v0, $zero, 0x17
/* 27240 80039620 001C1000 */  sll        $v1, $s0, 16
/* 27244 80039624 831B0300 */  sra        $v1, $v1, 14
/* 27248 80039628 21187400 */  addu       $v1, $v1, $s4
/* 2724C 8003962C 4003828F */  lw         $v0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 27250 80039630 0000638C */  lw         $v1, 0x0($v1)
/* 27254 80039634 0000428C */  lw         $v0, 0x0($v0)
/* 27258 80039638 00000000 */  nop
/* 2725C 8003963C 24104300 */  and        $v0, $v0, $v1
/* 27260 80039640 02004014 */  bnez       $v0, .L8003964C
/* 27264 80039644 03000224 */   addiu     $v0, $zero, 0x3
/* 27268 80039648 04000224 */  addiu      $v0, $zero, 0x4
.L8003964C:
/* 2726C 8003964C 1000A2AF */  sw         $v0, 0x10($sp)
/* 27270 80039650 0000848C */  lw         $a0, 0x0($a0)
/* 27274 80039654 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 27278 80039658 02000724 */   addiu     $a3, $zero, 0x2
/* 2727C 8003965C 01004226 */  addiu      $v0, $s2, 0x1
/* 27280 80039660 21904000 */  addu       $s2, $v0, $zero
/* 27284 80039664 7000A997 */  lhu        $t1, 0x70($sp)
/* 27288 80039668 00140200 */  sll        $v0, $v0, 16
/* 2728C 8003966C 001C0900 */  sll        $v1, $t1, 16
/* 27290 80039670 2A104300 */  slt        $v0, $v0, $v1
/* 27294 80039674 9BFF4014 */  bnez       $v0, .L800394E4
/* 27298 80039678 00141200 */   sll       $v0, $s2, 16
.L8003967C:
/* 2729C 8003967C 7800A997 */  lhu        $t1, 0x78($sp)
/* 272A0 80039680 00000000 */  nop
/* 272A4 80039684 00140900 */  sll        $v0, $t1, 16
/* 272A8 80039688 03840200 */  sra        $s0, $v0, 16
/* 272AC 8003968C 33000012 */  beqz       $s0, .L8003975C
/* 272B0 80039690 02000724 */   addiu     $a3, $zero, 0x2
/* 272B4 80039694 4C000524 */  addiu      $a1, $zero, 0x4C
/* 272B8 80039698 5A00E626 */  addiu      $a2, $s7, 0x5A
/* 272BC 8003969C 6800A997 */  lhu        $t1, 0x68($sp)
/* 272C0 800396A0 0C09828F */  lw         $v0, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 272C4 800396A4 21900000 */  addu       $s2, $zero, $zero
/* 272C8 800396A8 1000A0AF */  sw         $zero, 0x10($sp)
/* 272CC 800396AC 21302601 */  addu       $a2, $t1, $a2
/* 272D0 800396B0 00340600 */  sll        $a2, $a2, 16
/* 272D4 800396B4 4005448C */  lw         $a0, 0x540($v0)
/* 272D8 800396B8 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 272DC 800396BC 03340600 */   sra       $a2, $a2, 16
/* 272E0 800396C0 2600001A */  blez       $s0, .L8003975C
/* 272E4 800396C4 0880023C */   lui       $v0, %hi(D_8008431C)
/* 272E8 800396C8 1C435124 */  addiu      $s1, $v0, %lo(D_8008431C)
.L800396CC:
/* 272EC 800396CC 00010524 */  addiu      $a1, $zero, 0x100
/* 272F0 800396D0 001C1200 */  sll        $v1, $s2, 16
/* 272F4 800396D4 031C0300 */  sra        $v1, $v1, 16
/* 272F8 800396D8 40100300 */  sll        $v0, $v1, 1
/* 272FC 800396DC 2110A203 */  addu       $v0, $sp, $v0
/* 27300 800396E0 80300300 */  sll        $a2, $v1, 2
/* 27304 800396E4 2130C300 */  addu       $a2, $a2, $v1
/* 27308 800396E8 40300600 */  sll        $a2, $a2, 1
/* 2730C 800396EC 6400C624 */  addiu      $a2, $a2, 0x64
/* 27310 800396F0 02000724 */  addiu      $a3, $zero, 0x2
/* 27314 800396F4 6800A997 */  lhu        $t1, 0x68($sp)
/* 27318 800396F8 18004294 */  lhu        $v0, 0x18($v0)
/* 2731C 800396FC 21302601 */  addu       $a2, $t1, $a2
/* 27320 80039700 2130E602 */  addu       $a2, $s7, $a2
/* 27324 80039704 8000A997 */  lhu        $t1, 0x80($sp)
/* 27328 80039708 00340600 */  sll        $a2, $a2, 16
/* 2732C 8003970C 21104900 */  addu       $v0, $v0, $t1
/* 27330 80039710 00140200 */  sll        $v0, $v0, 16
/* 27334 80039714 C3130200 */  sra        $v0, $v0, 15
/* 27338 80039718 21105100 */  addu       $v0, $v0, $s1
/* 2733C 8003971C 00004384 */  lh         $v1, 0x0($v0)
/* 27340 80039720 00800224 */  addiu      $v0, $zero, -0x8000
/* 27344 80039724 1000A2AF */  sw         $v0, 0x10($sp)
/* 27348 80039728 0C09828F */  lw         $v0, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2734C 8003972C 80180300 */  sll        $v1, $v1, 2
/* 27350 80039730 21186200 */  addu       $v1, $v1, $v0
/* 27354 80039734 0000648C */  lw         $a0, 0x0($v1)
/* 27358 80039738 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 2735C 8003973C 03340600 */   sra       $a2, $a2, 16
/* 27360 80039740 01004226 */  addiu      $v0, $s2, 0x1
/* 27364 80039744 21904000 */  addu       $s2, $v0, $zero
/* 27368 80039748 00140200 */  sll        $v0, $v0, 16
/* 2736C 8003974C 03140200 */  sra        $v0, $v0, 16
/* 27370 80039750 2A105000 */  slt        $v0, $v0, $s0
/* 27374 80039754 DDFF4014 */  bnez       $v0, .L800396CC
/* 27378 80039758 00000000 */   nop
.L8003975C:
/* 2737C 8003975C 4C000524 */  addiu      $a1, $zero, 0x4C
/* 27380 80039760 8C00E626 */  addiu      $a2, $s7, 0x8C
/* 27384 80039764 6000A997 */  lhu        $t1, 0x60($sp)
/* 27388 80039768 0C09828F */  lw         $v0, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2738C 8003976C 02000724 */  addiu      $a3, $zero, 0x2
/* 27390 80039770 1000A0AF */  sw         $zero, 0x10($sp)
/* 27394 80039774 2330C900 */  subu       $a2, $a2, $t1
/* 27398 80039778 00340600 */  sll        $a2, $a2, 16
/* 2739C 8003977C 2C05448C */  lw         $a0, 0x52C($v0)
/* 273A0 80039780 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 273A4 80039784 03340600 */   sra       $a2, $a2, 16
/* 273A8 80039788 4A000224 */  addiu      $v0, $zero, 0x4A
/* 273AC 8003978C 4800A2A7 */  sh         $v0, 0x48($sp)
/* 273B0 80039790 6C010224 */  addiu      $v0, $zero, 0x16C
/* 273B4 80039794 5000A98F */  lw         $t1, 0x50($sp)
/* 273B8 80039798 0880033C */  lui        $v1, %hi(D_80084344)
/* 273BC 8003979C 4C00A2A7 */  sh         $v0, 0x4C($sp)
/* 273C0 800397A0 1A002285 */  lh         $v0, 0x1A($t1)
/* 273C4 800397A4 44436324 */  addiu      $v1, $v1, %lo(D_80084344)
/* 273C8 800397A8 80100200 */  sll        $v0, $v0, 2
/* 273CC 800397AC 21104300 */  addu       $v0, $v0, $v1
/* 273D0 800397B0 00004294 */  lhu        $v0, 0x0($v0)
/* 273D4 800397B4 1400F126 */  addiu      $s1, $s7, 0x14
/* 273D8 800397B8 21105100 */  addu       $v0, $v0, $s1
/* 273DC 800397BC 4A00A2A7 */  sh         $v0, 0x4A($sp)
/* 273E0 800397C0 1A002285 */  lh         $v0, 0x1A($t1)
/* 273E4 800397C4 4800B027 */  addiu      $s0, $sp, 0x48
/* 273E8 800397C8 80100200 */  sll        $v0, $v0, 2
/* 273EC 800397CC 21104300 */  addu       $v0, $v0, $v1
/* 273F0 800397D0 02004294 */  lhu        $v0, 0x2($v0)
/* 273F4 800397D4 4003838F */  lw         $v1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 273F8 800397D8 21200002 */  addu       $a0, $s0, $zero
/* 273FC 800397DC 4E00A2A7 */  sh         $v0, 0x4E($sp)
/* 27400 800397E0 1000638C */  lw         $v1, 0x10($v1)
/* 27404 800397E4 0980053C */  lui        $a1, %hi(D_8008D94C)
/* 27408 800397E8 4CD9A524 */  addiu      $a1, $a1, %lo(D_8008D94C)
/* 2740C 800397EC 74006224 */  addiu      $v0, $v1, 0x74
/* 27410 800397F0 1000A2AF */  sw         $v0, 0x10($sp)
/* 27414 800397F4 A000678C */  lw         $a3, 0xA0($v1)
/* 27418 800397F8 DF85000C */  jal        DECOMP_CTR_Box_DrawClearBox
/* 2741C 800397FC 01000624 */   addiu     $a2, $zero, 0x1
/* 27420 80039800 21200002 */  addu       $a0, $s0, $zero
/* 27424 80039804 4003838F */  lw         $v1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 27428 80039808 42000224 */  addiu      $v0, $zero, 0x42
/* 2742C 8003980C 4800A2A7 */  sh         $v0, 0x48($sp)
/* 27430 80039810 2B00E226 */  addiu      $v0, $s7, 0x2B
/* 27434 80039814 4A00A2A7 */  sh         $v0, 0x4A($sp)
/* 27438 80039818 7C010224 */  addiu      $v0, $zero, 0x17C
/* 2743C 8003981C 4C00A2A7 */  sh         $v0, 0x4C($sp)
/* 27440 80039820 02000224 */  addiu      $v0, $zero, 0x2
/* 27444 80039824 4E00A2A7 */  sh         $v0, 0x4E($sp)
/* 27448 80039828 1000628C */  lw         $v0, 0x10($v1)
/* 2744C 8003982C 0980053C */  lui        $a1, %hi(D_8008D438)
/* 27450 80039830 38D4A524 */  addiu      $a1, $a1, %lo(D_8008D438)
/* 27454 80039834 A000478C */  lw         $a3, 0xA0($v0)
/* 27458 80039838 E413010C */  jal        DECOMP_RECTMENU_DrawOuterRect_Edge
/* 2745C 8003983C 20000624 */   addiu     $a2, $zero, 0x20
/* 27460 80039840 4003838F */  lw         $v1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 27464 80039844 6000A997 */  lhu        $t1, 0x60($sp)
/* 27468 80039848 38000224 */  addiu      $v0, $zero, 0x38
/* 2746C 8003984C 4800A2A7 */  sh         $v0, 0x48($sp)
/* 27470 80039850 90010224 */  addiu      $v0, $zero, 0x190
/* 27474 80039854 4C00A2A7 */  sh         $v0, 0x4C($sp)
/* 27478 80039858 87000224 */  addiu      $v0, $zero, 0x87
/* 2747C 8003985C 4A00B1A7 */  sh         $s1, 0x4A($sp)
/* 27480 80039860 23104900 */  subu       $v0, $v0, $t1
/* 27484 80039864 4E00A2A7 */  sh         $v0, 0x4E($sp)
/* 27488 80039868 1000628C */  lw         $v0, 0x10($v1)
/* 2748C 8003986C 21200002 */  addu       $a0, $s0, $zero
/* 27490 80039870 A000468C */  lw         $a2, 0xA0($v0)
/* 27494 80039874 EC15010C */  jal        DECOMP_RECTMENU_DrawInnerRect
/* 27498 80039878 04000524 */   addiu     $a1, $zero, 0x4
/* 2749C 8003987C 5800A997 */  lhu        $t1, 0x58($sp)
/* 274A0 80039880 00000000 */  nop
/* 274A4 80039884 21102001 */  addu       $v0, $t1, $zero
/* 274A8 80039888 08004014 */  bnez       $v0, .L800398AC
/* 274AC 8003988C 01000424 */   addiu     $a0, $zero, 0x1
/* 274B0 80039890 0400033C */  lui        $v1, (0x41020 >> 16)
/* 274B4 80039894 0980023C */  lui        $v0, %hi(D_8008D950)
/* 274B8 80039898 50D9428C */  lw         $v0, %lo(D_8008D950)($v0)
/* 274BC 8003989C 20106334 */  ori        $v1, $v1, (0x41020 & 0xFFFF)
/* 274C0 800398A0 24104300 */  and        $v0, $v0, $v1
/* 274C4 800398A4 0C004010 */  beqz       $v0, .L800398D8
/* 274C8 800398A8 00000000 */   nop
.L800398AC:
/* 274CC 800398AC 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 274D0 800398B0 21288000 */   addu      $a1, $a0, $zero
/* 274D4 800398B4 21200000 */  addu       $a0, $zero, $zero
/* 274D8 800398B8 82AC000C */  jal        DECOMP_OptionsMenu_TestSound
/* 274DC 800398BC 21288000 */   addu      $a1, $a0, $zero
/* 274E0 800398C0 0119010C */  jal        DECOMP_RECTMENU_ClearInput
/* 274E4 800398C4 00000000 */   nop
/* 274E8 800398C8 73E7000C */  jal        DECOMP_MainFreeze_GetMenuPtr
/* 274EC 800398CC 00000000 */   nop
/* 274F0 800398D0 0980013C */  lui        $at, %hi(D_8008D924)
/* 274F4 800398D4 24D922AC */  sw         $v0, %lo(D_8008D924)($at)
.L800398D8:
/* 274F8 800398D8 C400BF8F */  lw         $ra, 0xC4($sp)
/* 274FC 800398DC C000BE8F */  lw         $fp, 0xC0($sp)
/* 27500 800398E0 BC00B78F */  lw         $s7, 0xBC($sp)
/* 27504 800398E4 B800B68F */  lw         $s6, 0xB8($sp)
/* 27508 800398E8 B400B58F */  lw         $s5, 0xB4($sp)
/* 2750C 800398EC B000B48F */  lw         $s4, 0xB0($sp)
/* 27510 800398F0 AC00B38F */  lw         $s3, 0xAC($sp)
/* 27514 800398F4 A800B28F */  lw         $s2, 0xA8($sp)
/* 27518 800398F8 A400B18F */  lw         $s1, 0xA4($sp)
/* 2751C 800398FC A000B08F */  lw         $s0, 0xA0($sp)
/* 27520 80039900 0800E003 */  jr         $ra
/* 27524 80039904 C800BD27 */   addiu     $sp, $sp, 0xC8
.size MainFreeze_MenuPtrOptions, . - MainFreeze_MenuPtrOptions
