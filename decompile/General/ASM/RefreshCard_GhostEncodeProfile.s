.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel RefreshCard_GhostEncodeProfile
/* 34850 80046C30 B8FEBD27 */  addiu      $sp, $sp, -0x148
/* 34854 80046C34 3001B4AF */  sw         $s4, 0x130($sp)
/* 34858 80046C38 21A0E000 */  addu       $s4, $a3, $zero
/* 3485C 80046C3C 3401B5AF */  sw         $s5, 0x134($sp)
/* 34860 80046C40 21A88000 */  addu       $s5, $a0, $zero
/* 34864 80046C44 3C01B7AF */  sw         $s7, 0x13C($sp)
/* 34868 80046C48 21B8C000 */  addu       $s7, $a2, $zero
/* 3486C 80046C4C 1001A5A7 */  sh         $a1, 0x110($sp)
/* 34870 80046C50 002C0500 */  sll        $a1, $a1, 16
/* 34874 80046C54 032C0500 */  sra        $a1, $a1, 16
/* 34878 80046C58 3801B6AF */  sw         $s6, 0x138($sp)
/* 3487C 80046C5C 0880163C */  lui        $s6, %hi(D_80085A30)
/* 34880 80046C60 2401B1AF */  sw         $s1, 0x124($sp)
/* 34884 80046C64 305AD126 */  addiu      $s1, $s6, %lo(D_80085A30)
/* 34888 80046C68 0A80023C */  lui        $v0, %hi(D_8009AA60)
/* 3488C 80046C6C 4001BEAF */  sw         $fp, 0x140($sp)
/* 34890 80046C70 60AA5E24 */  addiu      $fp, $v0, %lo(D_8009AA60)
/* 34894 80046C74 4401BFAF */  sw         $ra, 0x144($sp)
/* 34898 80046C78 2C01B3AF */  sw         $s3, 0x12C($sp)
/* 3489C 80046C7C 2801B2AF */  sw         $s2, 0x128($sp)
/* 348A0 80046C80 2001B0AF */  sw         $s0, 0x120($sp)
/* 348A4 80046C84 1801A5AF */  sw         $a1, 0x118($sp)
/* 348A8 80046C88 0800023C */  lui        $v0, (0x8C9FF >> 16)
.L80046C8C:
/* 348AC 80046C8C FFC94234 */  ori        $v0, $v0, (0x8C9FF & 0xFFFF)
/* 348B0 80046C90 2A105400 */  slt        $v0, $v0, $s4
/* 348B4 80046C94 03004010 */  beqz       $v0, .L80046CA4
/* 348B8 80046C98 01001324 */   addiu     $s3, $zero, 0x1
/* 348BC 80046C9C 0800143C */  lui        $s4, (0x8C9FF >> 16)
/* 348C0 80046CA0 FFC99436 */  ori        $s4, $s4, (0x8C9FF & 0xFFFF)
.L80046CA4:
/* 348C4 80046CA4 00841700 */  sll        $s0, $s7, 16
/* 348C8 80046CA8 03831000 */  sra        $s0, $s0, 12
/* 348CC 80046CAC 1801A88F */  lw         $t0, 0x118($sp)
/* 348D0 80046CB0 40121400 */  sll        $v0, $s4, 9
/* 348D4 80046CB4 25801001 */  or         $s0, $t0, $s0
/* 348D8 80046CB8 25800202 */  or         $s0, $s0, $v0
/* 348DC 80046CBC 40171500 */  sll        $v0, $s5, 29
/* 348E0 80046CC0 25800202 */  or         $s0, $s0, $v0
/* 348E4 80046CC4 D81A010C */  jal        RefreshCard_GhostEncodeByte
/* 348E8 80046CC8 3F000432 */   andi      $a0, $s0, 0x3F
/* 348EC 80046CCC 82211000 */  srl        $a0, $s0, 6
/* 348F0 80046CD0 3F008430 */  andi       $a0, $a0, 0x3F
/* 348F4 80046CD4 D81A010C */  jal        RefreshCard_GhostEncodeByte
/* 348F8 80046CD8 0D0022A2 */   sb        $v0, 0xD($s1)
/* 348FC 80046CDC 02231000 */  srl        $a0, $s0, 12
/* 34900 80046CE0 3F008430 */  andi       $a0, $a0, 0x3F
/* 34904 80046CE4 D81A010C */  jal        RefreshCard_GhostEncodeByte
/* 34908 80046CE8 0E0022A2 */   sb        $v0, 0xE($s1)
/* 3490C 80046CEC 82241000 */  srl        $a0, $s0, 18
/* 34910 80046CF0 3F008430 */  andi       $a0, $a0, 0x3F
/* 34914 80046CF4 D81A010C */  jal        RefreshCard_GhostEncodeByte
/* 34918 80046CF8 0F0022A2 */   sb        $v0, 0xF($s1)
/* 3491C 80046CFC 02261000 */  srl        $a0, $s0, 24
/* 34920 80046D00 3F008430 */  andi       $a0, $a0, 0x3F
/* 34924 80046D04 D81A010C */  jal        RefreshCard_GhostEncodeByte
/* 34928 80046D08 100022A2 */   sb        $v0, 0x10($s1)
/* 3492C 80046D0C 82271000 */  srl        $a0, $s0, 30
/* 34930 80046D10 D81A010C */  jal        RefreshCard_GhostEncodeByte
/* 34934 80046D14 110022A2 */   sb        $v0, 0x11($s1)
/* 34938 80046D18 0A80033C */  lui        $v1, %hi(D_8009AA30)
/* 3493C 80046D1C 30AA6424 */  addiu      $a0, $v1, %lo(D_8009AA30)
/* 34940 80046D20 2C008384 */  lh         $v1, 0x2C($a0)
/* 34944 80046D24 21800000 */  addu       $s0, $zero, $zero
/* 34948 80046D28 120022A2 */  sb         $v0, 0x12($s1)
/* 3494C 80046D2C 17006018 */  blez       $v1, .L80046D8C
/* 34950 80046D30 130020A2 */   sb        $zero, 0x13($s1)
/* 34954 80046D34 21908000 */  addu       $s2, $a0, $zero
/* 34958 80046D38 305AC426 */  addiu      $a0, $s6, %lo(D_80085A30)
.L80046D3C:
/* 3495C 80046D3C 00141000 */  sll        $v0, $s0, 16
/* 34960 80046D40 03140200 */  sra        $v0, $v0, 16
/* 34964 80046D44 40280200 */  sll        $a1, $v0, 1
/* 34968 80046D48 2128A200 */  addu       $a1, $a1, $v0
/* 3496C 80046D4C 80280500 */  sll        $a1, $a1, 2
/* 34970 80046D50 2128A200 */  addu       $a1, $a1, $v0
/* 34974 80046D54 80280500 */  sll        $a1, $a1, 2
/* 34978 80046D58 33C6010C */  jal        strcmp
/* 3497C 80046D5C 2128BE00 */   addu      $a1, $a1, $fp
/* 34980 80046D60 03004014 */  bnez       $v0, .L80046D70
/* 34984 80046D64 01000226 */   addiu     $v0, $s0, 0x1
/* 34988 80046D68 631B0108 */  j          .L80046D8C
/* 3498C 80046D6C 21980000 */   addu      $s3, $zero, $zero
.L80046D70:
/* 34990 80046D70 21804000 */  addu       $s0, $v0, $zero
/* 34994 80046D74 00140200 */  sll        $v0, $v0, 16
/* 34998 80046D78 2C004386 */  lh         $v1, 0x2C($s2)
/* 3499C 80046D7C 03140200 */  sra        $v0, $v0, 16
/* 349A0 80046D80 2A104300 */  slt        $v0, $v0, $v1
/* 349A4 80046D84 EDFF4014 */  bnez       $v0, .L80046D3C
/* 349A8 80046D88 305AC426 */   addiu     $a0, $s6, %lo(D_80085A30)
.L80046D8C:
/* 349AC 80046D8C 0100A226 */  addiu      $v0, $s5, 0x1
/* 349B0 80046D90 07005530 */  andi       $s5, $v0, 0x7
/* 349B4 80046D94 21106002 */  addu       $v0, $s3, $zero
/* 349B8 80046D98 BCFF4010 */  beqz       $v0, .L80046C8C
/* 349BC 80046D9C 0800023C */   lui       $v0, (0x8C9FF >> 16)
/* 349C0 80046DA0 1000A0A3 */  sb         $zero, 0x10($sp)
/* 349C4 80046DA4 32DF010C */  jal        strlen
/* 349C8 80046DA8 1000A427 */   addiu     $a0, $sp, 0x10
/* 349CC 80046DAC 0880053C */  lui        $a1, %hi(D_80083A80)
/* 349D0 80046DB0 803AA524 */  addiu      $a1, $a1, %lo(D_80083A80)
/* 349D4 80046DB4 00241700 */  sll        $a0, $s7, 16
/* 349D8 80046DB8 03240400 */  sra        $a0, $a0, 16
/* 349DC 80046DBC 40180400 */  sll        $v1, $a0, 1
/* 349E0 80046DC0 21186400 */  addu       $v1, $v1, $a0
/* 349E4 80046DC4 C0180300 */  sll        $v1, $v1, 3
/* 349E8 80046DC8 21186500 */  addu       $v1, $v1, $a1
/* 349EC 80046DCC 1000B027 */  addiu      $s0, $sp, 0x10
/* 349F0 80046DD0 08006384 */  lh         $v1, 0x8($v1)
/* 349F4 80046DD4 0980043C */  lui        $a0, %hi(D_8008D878)
/* 349F8 80046DD8 78D8848C */  lw         $a0, %lo(D_8008D878)($a0)
/* 349FC 80046DDC 80180300 */  sll        $v1, $v1, 2
/* 34A00 80046DE0 21186400 */  addu       $v1, $v1, $a0
/* 34A04 80046DE4 0000658C */  lw         $a1, 0x0($v1)
/* 34A08 80046DE8 F6E2010C */  jal        strcat
/* 34A0C 80046DEC 21200202 */   addu      $a0, $s0, $v0
/* 34A10 80046DF0 21200002 */  addu       $a0, $s0, $zero
/* 34A14 80046DF4 0980113C */  lui        $s1, %hi(D_8008D46C)
/* 34A18 80046DF8 6CD43126 */  addiu      $s1, $s1, %lo(D_8008D46C)
/* 34A1C 80046DFC F6E2010C */  jal        strcat
/* 34A20 80046E00 21282002 */   addu      $a1, $s1, $zero
/* 34A24 80046E04 32DF010C */  jal        strlen
/* 34A28 80046E08 21200002 */   addu      $a0, $s0, $zero
/* 34A2C 80046E0C 0880043C */  lui        $a0, %hi(D_80086D84)
/* 34A30 80046E10 1001A997 */  lhu        $t1, 0x110($sp)
/* 34A34 80046E14 846D8424 */  addiu      $a0, $a0, %lo(D_80086D84)
/* 34A38 80046E18 001C0900 */  sll        $v1, $t1, 16
/* 34A3C 80046E1C 031B0300 */  sra        $v1, $v1, 12
/* 34A40 80046E20 21186400 */  addu       $v1, $v1, $a0
/* 34A44 80046E24 06006384 */  lh         $v1, 0x6($v1)
/* 34A48 80046E28 0980043C */  lui        $a0, %hi(D_8008D878)
/* 34A4C 80046E2C 78D8848C */  lw         $a0, %lo(D_8008D878)($a0)
/* 34A50 80046E30 80180300 */  sll        $v1, $v1, 2
/* 34A54 80046E34 21186400 */  addu       $v1, $v1, $a0
/* 34A58 80046E38 0000658C */  lw         $a1, 0x0($v1)
/* 34A5C 80046E3C F6E2010C */  jal        strcat
/* 34A60 80046E40 21200202 */   addu      $a0, $s0, $v0
/* 34A64 80046E44 21200002 */  addu       $a0, $s0, $zero
/* 34A68 80046E48 F6E2010C */  jal        strcat
/* 34A6C 80046E4C 21282002 */   addu      $a1, $s1, $zero
/* 34A70 80046E50 FE13010C */  jal        DECOMP_RECTMENU_DrawTime
/* 34A74 80046E54 21208002 */   addu      $a0, $s4, $zero
/* 34A78 80046E58 21200002 */  addu       $a0, $s0, $zero
/* 34A7C 80046E5C F6E2010C */  jal        strcat
/* 34A80 80046E60 21284000 */   addu      $a1, $v0, $zero
/* 34A84 80046E64 9000B127 */  addiu      $s1, $sp, 0x90
/* 34A88 80046E68 21202002 */  addu       $a0, $s1, $zero
/* 34A8C 80046E6C 8D88000C */  jal        CTR_ScrambleGhostString
/* 34A90 80046E70 21280002 */   addu      $a1, $s0, $zero
/* 34A94 80046E74 0A80023C */  lui        $v0, %hi(D_800992A4)
/* 34A98 80046E78 A4924224 */  addiu      $v0, $v0, %lo(D_800992A4)
/* 34A9C 80046E7C 03004330 */  andi       $v1, $v0, 0x3
/* 34AA0 80046E80 16006010 */  beqz       $v1, .L80046EDC
/* 34AA4 80046E84 C000A327 */   addiu     $v1, $sp, 0xC0
.L80046E88:
/* 34AA8 80046E88 03002A8A */  lwl        $t2, 0x3($s1)
/* 34AAC 80046E8C 00002A9A */  lwr        $t2, 0x0($s1)
/* 34AB0 80046E90 07002B8A */  lwl        $t3, 0x7($s1)
/* 34AB4 80046E94 04002B9A */  lwr        $t3, 0x4($s1)
/* 34AB8 80046E98 0B00288A */  lwl        $t0, 0xB($s1)
/* 34ABC 80046E9C 0800289A */  lwr        $t0, 0x8($s1)
/* 34AC0 80046EA0 0F00298A */  lwl        $t1, 0xF($s1)
/* 34AC4 80046EA4 0C00299A */  lwr        $t1, 0xC($s1)
/* 34AC8 80046EA8 03004AA8 */  swl        $t2, 0x3($v0)
/* 34ACC 80046EAC 00004AB8 */  swr        $t2, 0x0($v0)
/* 34AD0 80046EB0 07004BA8 */  swl        $t3, 0x7($v0)
/* 34AD4 80046EB4 04004BB8 */  swr        $t3, 0x4($v0)
/* 34AD8 80046EB8 0B0048A8 */  swl        $t0, 0xB($v0)
/* 34ADC 80046EBC 080048B8 */  swr        $t0, 0x8($v0)
/* 34AE0 80046EC0 0F0049A8 */  swl        $t1, 0xF($v0)
/* 34AE4 80046EC4 0C0049B8 */  swr        $t1, 0xC($v0)
/* 34AE8 80046EC8 10003126 */  addiu      $s1, $s1, 0x10
/* 34AEC 80046ECC EEFF2316 */  bne        $s1, $v1, .L80046E88
/* 34AF0 80046ED0 10004224 */   addiu     $v0, $v0, 0x10
/* 34AF4 80046ED4 C21B0108 */  j          .L80046F08
/* 34AF8 80046ED8 00000000 */   nop
.L80046EDC:
/* 34AFC 80046EDC 00002A8E */  lw         $t2, 0x0($s1)
/* 34B00 80046EE0 04002B8E */  lw         $t3, 0x4($s1)
/* 34B04 80046EE4 0800288E */  lw         $t0, 0x8($s1)
/* 34B08 80046EE8 0C00298E */  lw         $t1, 0xC($s1)
/* 34B0C 80046EEC 00004AAC */  sw         $t2, 0x0($v0)
/* 34B10 80046EF0 04004BAC */  sw         $t3, 0x4($v0)
/* 34B14 80046EF4 080048AC */  sw         $t0, 0x8($v0)
/* 34B18 80046EF8 0C0049AC */  sw         $t1, 0xC($v0)
/* 34B1C 80046EFC 10003126 */  addiu      $s1, $s1, 0x10
/* 34B20 80046F00 F6FF2316 */  bne        $s1, $v1, .L80046EDC
/* 34B24 80046F04 10004224 */   addiu     $v0, $v0, 0x10
.L80046F08:
/* 34B28 80046F08 03002A8A */  lwl        $t2, 0x3($s1)
/* 34B2C 80046F0C 00002A9A */  lwr        $t2, 0x0($s1)
/* 34B30 80046F10 07002B8A */  lwl        $t3, 0x7($s1)
/* 34B34 80046F14 04002B9A */  lwr        $t3, 0x4($s1)
/* 34B38 80046F18 0B00288A */  lwl        $t0, 0xB($s1)
/* 34B3C 80046F1C 0800289A */  lwr        $t0, 0x8($s1)
/* 34B40 80046F20 0C002982 */  lb         $t1, 0xC($s1)
/* 34B44 80046F24 03004AA8 */  swl        $t2, 0x3($v0)
/* 34B48 80046F28 00004AB8 */  swr        $t2, 0x0($v0)
/* 34B4C 80046F2C 07004BA8 */  swl        $t3, 0x7($v0)
/* 34B50 80046F30 04004BB8 */  swr        $t3, 0x4($v0)
/* 34B54 80046F34 0B0048A8 */  swl        $t0, 0xB($v0)
/* 34B58 80046F38 080048B8 */  swr        $t0, 0x8($v0)
/* 34B5C 80046F3C 0C0049A0 */  sb         $t1, 0xC($v0)
/* 34B60 80046F40 0D002A82 */  lb         $t2, 0xD($s1)
/* 34B64 80046F44 00000000 */  nop
/* 34B68 80046F48 0D004AA0 */  sb         $t2, 0xD($v0)
/* 34B6C 80046F4C 0A80023C */  lui        $v0, %hi(D_8009ABCC)
/* 34B70 80046F50 0880033C */  lui        $v1, %hi(D_80085A30)
/* 34B74 80046F54 305A6924 */  addiu      $t1, $v1, %lo(D_80085A30)
/* 34B78 80046F58 CCAB4824 */  addiu      $t0, $v0, %lo(D_8009ABCC)
/* 34B7C 80046F5C 00002A8D */  lw         $t2, 0x0($t1)
/* 34B80 80046F60 04002B8D */  lw         $t3, 0x4($t1)
/* 34B84 80046F64 00000AAD */  sw         $t2, 0x0($t0)
/* 34B88 80046F68 04000BAD */  sw         $t3, 0x4($t0)
/* 34B8C 80046F6C 08002A8D */  lw         $t2, 0x8($t1)
/* 34B90 80046F70 0C002B8D */  lw         $t3, 0xC($t1)
/* 34B94 80046F74 08000AAD */  sw         $t2, 0x8($t0)
/* 34B98 80046F78 0C000BAD */  sw         $t3, 0xC($t0)
/* 34B9C 80046F7C 10002A8D */  lw         $t2, 0x10($t1)
/* 34BA0 80046F80 14002B81 */  lb         $t3, 0x14($t1)
/* 34BA4 80046F84 10000AAD */  sw         $t2, 0x10($t0)
/* 34BA8 80046F88 14000BA1 */  sb         $t3, 0x14($t0)
/* 34BAC 80046F8C 5801A38F */  lw         $v1, 0x158($sp)
/* 34BB0 80046F90 CCAB4224 */  addiu      $v0, $v0, %lo(D_8009ABCC)
/* 34BB4 80046F94 03006A88 */  lwl        $t2, 0x3($v1)
/* 34BB8 80046F98 00006A98 */  lwr        $t2, 0x0($v1)
/* 34BBC 80046F9C 07006B88 */  lwl        $t3, 0x7($v1)
/* 34BC0 80046FA0 04006B98 */  lwr        $t3, 0x4($v1)
/* 34BC4 80046FA4 0B006888 */  lwl        $t0, 0xB($v1)
/* 34BC8 80046FA8 08006898 */  lwr        $t0, 0x8($v1)
/* 34BCC 80046FAC 0F006988 */  lwl        $t1, 0xF($v1)
/* 34BD0 80046FB0 0C006998 */  lwr        $t1, 0xC($v1)
/* 34BD4 80046FB4 18004AA8 */  swl        $t2, 0x18($v0)
/* 34BD8 80046FB8 15004AB8 */  swr        $t2, 0x15($v0)
/* 34BDC 80046FBC 1C004BA8 */  swl        $t3, 0x1C($v0)
/* 34BE0 80046FC0 19004BB8 */  swr        $t3, 0x19($v0)
/* 34BE4 80046FC4 200048A8 */  swl        $t0, 0x20($v0)
/* 34BE8 80046FC8 1D0048B8 */  swr        $t0, 0x1D($v0)
/* 34BEC 80046FCC 240049A8 */  swl        $t1, 0x24($v0)
/* 34BF0 80046FD0 210049B8 */  swr        $t1, 0x21($v0)
/* 34BF4 80046FD4 10006A80 */  lb         $t2, 0x10($v1)
/* 34BF8 80046FD8 00000000 */  nop
/* 34BFC 80046FDC 25004AA0 */  sb         $t2, 0x25($v0)
/* 34C00 80046FE0 64FE4224 */  addiu      $v0, $v0, -0x19C
/* 34C04 80046FE4 01000324 */  addiu      $v1, $zero, 0x1
/* 34C08 80046FE8 C20143A0 */  sb         $v1, 0x1C2($v0)
/* 34C0C 80046FEC C40157A4 */  sh         $s7, 0x1C4($v0)
/* 34C10 80046FF0 1001AA97 */  lhu        $t2, 0x110($sp)
/* 34C14 80046FF4 00000000 */  nop
/* 34C18 80046FF8 C6014AA4 */  sh         $t2, 0x1C6($v0)
/* 34C1C 80046FFC C80155A4 */  sh         $s5, 0x1C8($v0)
/* 34C20 80047000 CC0154AC */  sw         $s4, 0x1CC($v0)
/* 34C24 80047004 4401BF8F */  lw         $ra, 0x144($sp)
/* 34C28 80047008 4001BE8F */  lw         $fp, 0x140($sp)
/* 34C2C 8004700C 3C01B78F */  lw         $s7, 0x13C($sp)
/* 34C30 80047010 3801B68F */  lw         $s6, 0x138($sp)
/* 34C34 80047014 3401B58F */  lw         $s5, 0x134($sp)
/* 34C38 80047018 3001B48F */  lw         $s4, 0x130($sp)
/* 34C3C 8004701C 2C01B38F */  lw         $s3, 0x12C($sp)
/* 34C40 80047020 2801B28F */  lw         $s2, 0x128($sp)
/* 34C44 80047024 2401B18F */  lw         $s1, 0x124($sp)
/* 34C48 80047028 2001B08F */  lw         $s0, 0x120($sp)
/* 34C4C 8004702C 0800E003 */  jr         $ra
/* 34C50 80047030 4801BD27 */   addiu     $sp, $sp, 0x148
.size RefreshCard_GhostEncodeProfile, . - RefreshCard_GhostEncodeProfile
