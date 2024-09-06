.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel FLARE_ThTick
/* 1286C 80024C4C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 12870 80024C50 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 12874 80024C54 2800B4AF */  sw         $s4, 0x28($sp)
/* 12878 80024C58 2400B3AF */  sw         $s3, 0x24($sp)
/* 1287C 80024C5C 2000B2AF */  sw         $s2, 0x20($sp)
/* 12880 80024C60 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 12884 80024C64 1800B0AF */  sw         $s0, 0x18($sp)
/* 12888 80024C68 3000938C */  lw         $s3, 0x30($a0)
/* 1288C 80024C6C 00000000 */  nop
/* 12890 80024C70 0000728E */  lw         $s2, 0x0($s3)
/* 12894 80024C74 00000000 */  nop
/* 12898 80024C78 01004226 */  addiu      $v0, $s2, 0x1
/* 1289C 80024C7C 000062AE */  sw         $v0, 0x0($s3)
/* 128A0 80024C80 1400422A */  slti       $v0, $s2, 0x14
/* 128A4 80024C84 06004014 */  bnez       $v0, .L80024CA0
/* 128A8 80024C88 00000000 */   nop
/* 128AC 80024C8C 1C00828C */  lw         $v0, 0x1C($a0)
/* 128B0 80024C90 00000000 */  nop
/* 128B4 80024C94 00084234 */  ori        $v0, $v0, 0x800
/* 128B8 80024C98 46940008 */  j          .L80025118
/* 128BC 80024C9C 1C0082AC */   sw        $v0, 0x1C($a0)
.L80024CA0:
/* 128C0 80024CA0 0980103C */  lui        $s0, %hi(D_8008D2AC)
/* 128C4 80024CA4 ACD2108E */  lw         $s0, %lo(D_8008D2AC)($s0)
/* 128C8 80024CA8 00000000 */  nop
/* 128CC 80024CAC 1000028E */  lw         $v0, 0x10($s0)
/* 128D0 80024CB0 00000000 */  nop
/* 128D4 80024CB4 8000518C */  lw         $s1, 0x80($v0)
/* 128D8 80024CB8 8400438C */  lw         $v1, 0x84($v0)
/* 128DC 80024CBC D0002226 */  addiu      $v0, $s1, 0xD0
/* 128E0 80024CC0 2B104300 */  sltu       $v0, $v0, $v1
/* 128E4 80024CC4 14014010 */  beqz       $v0, .L80025118
/* 128E8 80024CC8 68011426 */   addiu     $s4, $s0, 0x168
/* 128EC 80024CCC 440A010C */  jal        DECOMP_PushBuffer_SetPsyqGeom
/* 128F0 80024CD0 21208002 */   addu      $a0, $s4, $zero
/* 128F4 80024CD4 58D5010C */  jal        SetLightMatrix
/* 128F8 80024CD8 90010426 */   addiu     $a0, $s0, 0x190
/* 128FC 80024CDC 04006286 */  lh         $v0, 0x4($s3)
/* 12900 80024CE0 7C00838E */  lw         $v1, 0x7C($s4)
/* 12904 80024CE4 8000848E */  lw         $a0, 0x80($s4)
/* 12908 80024CE8 23104300 */  subu       $v0, $v0, $v1
/* 1290C 80024CEC 80100200 */  sll        $v0, $v0, 2
/* 12910 80024CF0 06006386 */  lh         $v1, 0x6($s3)
/* 12914 80024CF4 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 12918 80024CF8 23186400 */  subu       $v1, $v1, $a0
/* 1291C 80024CFC 801C0300 */  sll        $v1, $v1, 18
/* 12920 80024D00 25104300 */  or         $v0, $v0, $v1
/* 12924 80024D04 00008248 */  mtc2       $v0, $0 /* handwritten instruction */
/* 12928 80024D08 08006286 */  lh         $v0, 0x8($s3)
/* 1292C 80024D0C 8400838E */  lw         $v1, 0x84($s4)
/* 12930 80024D10 00000000 */  nop
/* 12934 80024D14 23104300 */  subu       $v0, $v0, $v1
/* 12938 80024D18 80100200 */  sll        $v0, $v0, 2
/* 1293C 80024D1C 00088248 */  mtc2       $v0, $1 /* handwritten instruction */
/* 12940 80024D20 00000000 */  nop
/* 12944 80024D24 00000000 */  nop
/* 12948 80024D28 12604A4A */  MVMVA      1, 1, 0, 3, 0
/* 1294C 80024D2C 00C80C48 */  mfc2       $t4, $25 /* handwritten instruction */
/* 12950 80024D30 00D00D48 */  mfc2       $t5, $26 /* handwritten instruction */
/* 12954 80024D34 00D80E48 */  mfc2       $t6, $27 /* handwritten instruction */
/* 12958 80024D38 0028CC48 */  ctc2       $t4, $5 /* handwritten instruction */
/* 1295C 80024D3C 0030CD48 */  ctc2       $t5, $6 /* handwritten instruction */
/* 12960 80024D40 0038CE48 */  ctc2       $t6, $7 /* handwritten instruction */
/* 12964 80024D44 0200422A */  slti       $v0, $s2, 0x2
/* 12968 80024D48 07004010 */  beqz       $v0, .L80024D68
/* 1296C 80024D4C 00200224 */   addiu     $v0, $zero, 0x2000
/* 12970 80024D50 1000A2AF */  sw         $v0, 0x10($sp)
/* 12974 80024D54 21204002 */  addu       $a0, $s2, $zero
/* 12978 80024D58 21280000 */  addu       $a1, $zero, $zero
/* 1297C 80024D5C 02000624 */  addiu      $a2, $zero, 0x2
/* 12980 80024D60 71930008 */  j          .L80024DC4
/* 12984 80024D64 00040724 */   addiu     $a3, $zero, 0x400
.L80024D68:
/* 12988 80024D68 0400422A */  slti       $v0, $s2, 0x4
/* 1298C 80024D6C 07004010 */  beqz       $v0, .L80024D8C
/* 12990 80024D70 000C0224 */   addiu     $v0, $zero, 0xC00
/* 12994 80024D74 1000A2AF */  sw         $v0, 0x10($sp)
/* 12998 80024D78 21204002 */  addu       $a0, $s2, $zero
/* 1299C 80024D7C 02000524 */  addiu      $a1, $zero, 0x2
/* 129A0 80024D80 04000624 */  addiu      $a2, $zero, 0x4
/* 129A4 80024D84 71930008 */  j          .L80024DC4
/* 129A8 80024D88 00200724 */   addiu     $a3, $zero, 0x2000
.L80024D8C:
/* 129AC 80024D8C 0800422A */  slti       $v0, $s2, 0x8
/* 129B0 80024D90 07004010 */  beqz       $v0, .L80024DB0
/* 129B4 80024D94 66020224 */   addiu     $v0, $zero, 0x266
/* 129B8 80024D98 1000A2AF */  sw         $v0, 0x10($sp)
/* 129BC 80024D9C 21204002 */  addu       $a0, $s2, $zero
/* 129C0 80024DA0 04000524 */  addiu      $a1, $zero, 0x4
/* 129C4 80024DA4 08000624 */  addiu      $a2, $zero, 0x8
/* 129C8 80024DA8 71930008 */  j          .L80024DC4
/* 129CC 80024DAC 000C0724 */   addiu     $a3, $zero, 0xC00
.L80024DB0:
/* 129D0 80024DB0 1000A0AF */  sw         $zero, 0x10($sp)
/* 129D4 80024DB4 21204002 */  addu       $a0, $s2, $zero
/* 129D8 80024DB8 08000524 */  addiu      $a1, $zero, 0x8
/* 129DC 80024DBC 14000624 */  addiu      $a2, $zero, 0x14
/* 129E0 80024DC0 66020724 */  addiu      $a3, $zero, 0x266
.L80024DC4:
/* 129E4 80024DC4 E763010C */  jal        DECOMP_VehCalc_MapToRange
/* 129E8 80024DC8 6666103C */   lui       $s0, (0x66666667 >> 16)
/* 129EC 80024DCC 21904000 */  addu       $s2, $v0, $zero
/* 129F0 80024DD0 0000648E */  lw         $a0, 0x0($s3)
/* 129F4 80024DD4 67661036 */  ori        $s0, $s0, (0x66666667 & 0xFFFF)
/* 129F8 80024DD8 00230400 */  sll        $a0, $a0, 12
/* 129FC 80024DDC 18009000 */  mult       $a0, $s0
/* 12A00 80024DE0 C3270400 */  sra        $a0, $a0, 31
/* 12A04 80024DE4 10180000 */  mfhi       $v1
/* 12A08 80024DE8 C3100300 */  sra        $v0, $v1, 3
/* 12A0C 80024DEC 61F4000C */  jal        DECOMP_MATH_Sin
/* 12A10 80024DF0 23204400 */   subu      $a0, $v0, $a0
/* 12A14 80024DF4 0000648E */  lw         $a0, 0x0($s3)
/* 12A18 80024DF8 00000000 */  nop
/* 12A1C 80024DFC 00230400 */  sll        $a0, $a0, 12
/* 12A20 80024E00 18009000 */  mult       $a0, $s0
/* 12A24 80024E04 10180000 */  mfhi       $v1
/* 12A28 80024E08 00000000 */  nop
/* 12A2C 80024E0C 00000000 */  nop
/* 12A30 80024E10 18005200 */  mult       $v0, $s2
/* 12A34 80024E14 C3270400 */  sra        $a0, $a0, 31
/* 12A38 80024E18 C3100300 */  sra        $v0, $v1, 3
/* 12A3C 80024E1C 23204400 */  subu       $a0, $v0, $a0
/* 12A40 80024E20 12400000 */  mflo       $t0
/* 12A44 80024E24 70F4000C */  jal        DECOMP_MATH_Cos
/* 12A48 80024E28 03830800 */   sra       $s0, $t0, 12
/* 12A4C 80024E2C 18005200 */  mult       $v0, $s2
/* 12A50 80024E30 8888033C */  lui        $v1, (0x88888889 >> 16)
/* 12A54 80024E34 89886334 */  ori        $v1, $v1, (0x88888889 & 0xFFFF)
/* 12A58 80024E38 12400000 */  mflo       $t0
/* 12A5C 80024E3C 032B0800 */  sra        $a1, $t0, 12
/* 12A60 80024E40 40120500 */  sll        $v0, $a1, 9
/* 12A64 80024E44 18004300 */  mult       $v0, $v1
/* 12A68 80024E48 10400000 */  mfhi       $t0
/* 12A6C 80024E4C 40221000 */  sll        $a0, $s0, 9
/* 12A70 80024E50 00000000 */  nop
/* 12A74 80024E54 18008300 */  mult       $a0, $v1
/* 12A78 80024E58 34002A26 */  addiu      $t2, $s1, 0x34
/* 12A7C 80024E5C 68002B26 */  addiu      $t3, $s1, 0x68
/* 12A80 80024E60 9C002C26 */  addiu      $t4, $s1, 0x9C
/* 12A84 80024E64 21180201 */  addu       $v1, $t0, $v0
/* 12A88 80024E68 C3190300 */  sra        $v1, $v1, 7
/* 12A8C 80024E6C C3170200 */  sra        $v0, $v0, 31
/* 12A90 80024E70 23186200 */  subu       $v1, $v1, $v0
/* 12A94 80024E74 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 12A98 80024E78 10300000 */  mfhi       $a2
/* 12A9C 80024E7C 2110C400 */  addu       $v0, $a2, $a0
/* 12AA0 80024E80 C3110200 */  sra        $v0, $v0, 7
/* 12AA4 80024E84 C3270400 */  sra        $a0, $a0, 31
/* 12AA8 80024E88 23104400 */  subu       $v0, $v0, $a0
/* 12AAC 80024E8C 23100200 */  negu       $v0, $v0
/* 12AB0 80024E90 00140200 */  sll        $v0, $v0, 16
/* 12AB4 80024E94 25186200 */  or         $v1, $v1, $v0
/* 12AB8 80024E98 0000C348 */  ctc2       $v1, $0 /* handwritten instruction */
/* 12ABC 80024E9C 00841000 */  sll        $s0, $s0, 16
/* 12AC0 80024EA0 0008D048 */  ctc2       $s0, $1 /* handwritten instruction */
/* 12AC4 80024EA4 FFFFA530 */  andi       $a1, $a1, 0xFFFF
/* 12AC8 80024EA8 0010C548 */  ctc2       $a1, $2 /* handwritten instruction */
/* 12ACC 80024EAC 21780000 */  addu       $t7, $zero, $zero
/* 12AD0 80024EB0 0018CF48 */  ctc2       $t7, $3 /* handwritten instruction */
/* 12AD4 80024EB4 0020D248 */  ctc2       $s2, $4 /* handwritten instruction */
/* 12AD8 80024EB8 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 12ADC 80024EBC ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 12AE0 80024EC0 00000000 */  nop
/* 12AE4 80024EC4 0821448C */  lw         $a0, 0x2108($v0)
/* 12AE8 80024EC8 00000000 */  nop
/* 12AEC 80024ECC 92008010 */  beqz       $a0, .L80025118
/* 12AF0 80024ED0 9FFF023C */   lui       $v0, (0xFF9FFFFF >> 16)
/* 12AF4 80024ED4 FFFF4234 */  ori        $v0, $v0, (0xFF9FFFFF & 0xFFFF)
/* 12AF8 80024ED8 1800838C */  lw         $v1, 0x18($a0)
/* 12AFC 80024EDC 1400868C */  lw         $a2, 0x14($a0)
/* 12B00 80024EE0 1C008784 */  lh         $a3, 0x1C($a0)
/* 12B04 80024EE4 1E008884 */  lh         $t0, 0x1E($a0)
/* 12B08 80024EE8 24186200 */  and        $v1, $v1, $v0
/* 12B0C 80024EEC 2000023C */  lui        $v0, (0x200000 >> 16)
/* 12B10 80024EF0 25186200 */  or         $v1, $v1, $v0
/* 12B14 80024EF4 00088F48 */  mtc2       $t7, $1 /* handwritten instruction */
/* 12B18 80024EF8 00188F48 */  mtc2       $t7, $3 /* handwritten instruction */
/* 12B1C 80024EFC 00288F48 */  mtc2       $t7, $5 /* handwritten instruction */
/* 12B20 80024F00 67FE0F3C */  lui        $t7, (0xFE67FE67 >> 16)
/* 12B24 80024F04 67FEEF35 */  ori        $t7, $t7, (0xFE67FE67 & 0xFFFF)
/* 12B28 80024F08 00008F48 */  mtc2       $t7, $0 /* handwritten instruction */
/* 12B2C 80024F0C 67FE0F3C */  lui        $t7, (0xFE670000 >> 16)
/* 12B30 80024F10 00108F48 */  mtc2       $t7, $2 /* handwritten instruction */
/* 12B34 80024F14 67FE0F3C */  lui        $t7, (0xFE670199 >> 16)
/* 12B38 80024F18 9901EF35 */  ori        $t7, $t7, (0xFE670199 & 0xFFFF)
/* 12B3C 80024F1C 00208F48 */  mtc2       $t7, $4 /* handwritten instruction */
/* 12B40 80024F20 00000000 */  nop
/* 12B44 80024F24 00000000 */  nop
/* 12B48 80024F28 3000284A */  RTPT
/* 12B4C 80024F2C 7F00053C */  lui        $a1, (0x7F7F7F >> 16)
/* 12B50 80024F30 7F7FA534 */  ori        $a1, $a1, (0x7F7F7F & 0xFFFF)
/* 12B54 80024F34 003E043C */  lui        $a0, (0x3E000000 >> 16)
/* 12B58 80024F38 08002226 */  addiu      $v0, $s1, 0x8
/* 12B5C 80024F3C 0C0026AE */  sw         $a2, 0xC($s1)
/* 12B60 80024F40 180023AE */  sw         $v1, 0x18($s1)
/* 12B64 80024F44 240027A6 */  sh         $a3, 0x24($s1)
/* 12B68 80024F48 300028A6 */  sh         $t0, 0x30($s1)
/* 12B6C 80024F4C 0C0046AD */  sw         $a2, 0xC($t2)
/* 12B70 80024F50 180043AD */  sw         $v1, 0x18($t2)
/* 12B74 80024F54 240047A5 */  sh         $a3, 0x24($t2)
/* 12B78 80024F58 300048A5 */  sh         $t0, 0x30($t2)
/* 12B7C 80024F5C 00004CE8 */  swc2       $12, 0x0($v0)
/* 12B80 80024F60 14002226 */  addiu      $v0, $s1, 0x14
/* 12B84 80024F64 00004DE8 */  swc2       $13, 0x0($v0)
/* 12B88 80024F68 48002226 */  addiu      $v0, $s1, 0x48
/* 12B8C 80024F6C 00004DE8 */  swc2       $13, 0x0($v0)
/* 12B90 80024F70 3C002226 */  addiu      $v0, $s1, 0x3C
/* 12B94 80024F74 00004EE8 */  swc2       $14, 0x0($v0)
/* 12B98 80024F78 67FE0F34 */  ori        $t7, $zero, 0xFE67
/* 12B9C 80024F7C 00008F48 */  mtc2       $t7, $0 /* handwritten instruction */
/* 12BA0 80024F80 21780000 */  addu       $t7, $zero, $zero
/* 12BA4 80024F84 00108F48 */  mtc2       $t7, $2 /* handwritten instruction */
/* 12BA8 80024F88 99010F24 */  addiu      $t7, $zero, 0x199
/* 12BAC 80024F8C 00208F48 */  mtc2       $t7, $4 /* handwritten instruction */
/* 12BB0 80024F90 00000000 */  nop
/* 12BB4 80024F94 00000000 */  nop
/* 12BB8 80024F98 3000284A */  RTPT
/* 12BBC 80024F9C 20002226 */  addiu      $v0, $s1, 0x20
/* 12BC0 80024FA0 040024AE */  sw         $a0, 0x4($s1)
/* 12BC4 80024FA4 100020AE */  sw         $zero, 0x10($s1)
/* 12BC8 80024FA8 1C0020AE */  sw         $zero, 0x1C($s1)
/* 12BCC 80024FAC 280025AE */  sw         $a1, 0x28($s1)
/* 12BD0 80024FB0 040044AD */  sw         $a0, 0x4($t2)
/* 12BD4 80024FB4 100040AD */  sw         $zero, 0x10($t2)
/* 12BD8 80024FB8 1C0040AD */  sw         $zero, 0x1C($t2)
/* 12BDC 80024FBC 280045AD */  sw         $a1, 0x28($t2)
/* 12BE0 80024FC0 0C0066AD */  sw         $a2, 0xC($t3)
/* 12BE4 80024FC4 180063AD */  sw         $v1, 0x18($t3)
/* 12BE8 80024FC8 240067A5 */  sh         $a3, 0x24($t3)
/* 12BEC 80024FCC 300068A5 */  sh         $t0, 0x30($t3)
/* 12BF0 80024FD0 00004CE8 */  swc2       $12, 0x0($v0)
/* 12BF4 80024FD4 2C002226 */  addiu      $v0, $s1, 0x2C
/* 12BF8 80024FD8 00004DE8 */  swc2       $13, 0x0($v0)
/* 12BFC 80024FDC 60002226 */  addiu      $v0, $s1, 0x60
/* 12C00 80024FE0 00004DE8 */  swc2       $13, 0x0($v0)
/* 12C04 80024FE4 54002226 */  addiu      $v0, $s1, 0x54
/* 12C08 80024FE8 00004EE8 */  swc2       $14, 0x0($v0)
/* 12C0C 80024FEC 88002226 */  addiu      $v0, $s1, 0x88
/* 12C10 80024FF0 00004CE8 */  swc2       $12, 0x0($v0)
/* 12C14 80024FF4 94002226 */  addiu      $v0, $s1, 0x94
/* 12C18 80024FF8 00004DE8 */  swc2       $13, 0x0($v0)
/* 12C1C 80024FFC C8002226 */  addiu      $v0, $s1, 0xC8
/* 12C20 80025000 00004DE8 */  swc2       $13, 0x0($v0)
/* 12C24 80025004 BC002226 */  addiu      $v0, $s1, 0xBC
/* 12C28 80025008 00004EE8 */  swc2       $14, 0x0($v0)
/* 12C2C 8002500C 00900948 */  mfc2       $t1, $18 /* handwritten instruction */
/* 12C30 80025010 99010F3C */  lui        $t7, (0x199FE67 >> 16)
/* 12C34 80025014 67FEEF35 */  ori        $t7, $t7, (0x199FE67 & 0xFFFF)
/* 12C38 80025018 00008F48 */  mtc2       $t7, $0 /* handwritten instruction */
/* 12C3C 8002501C 99010F3C */  lui        $t7, (0x1990000 >> 16)
/* 12C40 80025020 00108F48 */  mtc2       $t7, $2 /* handwritten instruction */
/* 12C44 80025024 99010F3C */  lui        $t7, (0x1990199 >> 16)
/* 12C48 80025028 9901EF35 */  ori        $t7, $t7, (0x1990199 & 0xFFFF)
/* 12C4C 8002502C 00208F48 */  mtc2       $t7, $4 /* handwritten instruction */
/* 12C50 80025030 00000000 */  nop
/* 12C54 80025034 00000000 */  nop
/* 12C58 80025038 3000284A */  RTPT
/* 12C5C 8002503C 70002226 */  addiu      $v0, $s1, 0x70
/* 12C60 80025040 040064AD */  sw         $a0, 0x4($t3)
/* 12C64 80025044 100060AD */  sw         $zero, 0x10($t3)
/* 12C68 80025048 1C0060AD */  sw         $zero, 0x1C($t3)
/* 12C6C 8002504C 280065AD */  sw         $a1, 0x28($t3)
/* 12C70 80025050 040084AD */  sw         $a0, 0x4($t4)
/* 12C74 80025054 100080AD */  sw         $zero, 0x10($t4)
/* 12C78 80025058 1C0080AD */  sw         $zero, 0x1C($t4)
/* 12C7C 8002505C 280085AD */  sw         $a1, 0x28($t4)
/* 12C80 80025060 0C0086AD */  sw         $a2, 0xC($t4)
/* 12C84 80025064 180083AD */  sw         $v1, 0x18($t4)
/* 12C88 80025068 240087A5 */  sh         $a3, 0x24($t4)
/* 12C8C 8002506C 300088A5 */  sh         $t0, 0x30($t4)
/* 12C90 80025070 00004CE8 */  swc2       $12, 0x0($v0)
/* 12C94 80025074 7C002226 */  addiu      $v0, $s1, 0x7C
/* 12C98 80025078 00004DE8 */  swc2       $13, 0x0($v0)
/* 12C9C 8002507C B0002226 */  addiu      $v0, $s1, 0xB0
/* 12CA0 80025080 00004DE8 */  swc2       $13, 0x0($v0)
/* 12CA4 80025084 A4002226 */  addiu      $v0, $s1, 0xA4
/* 12CA8 80025088 00004EE8 */  swc2       $14, 0x0($v0)
/* 12CAC 8002508C FF00043C */  lui        $a0, (0xFFFFFF >> 16)
/* 12CB0 80025090 FFFF8434 */  ori        $a0, $a0, (0xFFFFFF & 0xFFFF)
/* 12CB4 80025094 034A0900 */  sra        $t1, $t1, 8
/* 12CB8 80025098 FEFF2925 */  addiu      $t1, $t1, -0x2
/* 12CBC 8002509C 24104401 */  and        $v0, $t2, $a0
/* 12CC0 800250A0 000C053C */  lui        $a1, (0xC000000 >> 16)
/* 12CC4 800250A4 25104500 */  or         $v0, $v0, $a1
/* 12CC8 800250A8 000022AE */  sw         $v0, 0x0($s1)
/* 12CCC 800250AC 24106401 */  and        $v0, $t3, $a0
/* 12CD0 800250B0 25104500 */  or         $v0, $v0, $a1
/* 12CD4 800250B4 340022AE */  sw         $v0, 0x34($s1)
/* 12CD8 800250B8 24108401 */  and        $v0, $t4, $a0
/* 12CDC 800250BC 25104500 */  or         $v0, $v0, $a1
/* 12CE0 800250C0 02002105 */  bgez       $t1, .L800250CC
/* 12CE4 800250C4 680022AE */   sw        $v0, 0x68($s1)
/* 12CE8 800250C8 21480000 */  addu       $t1, $zero, $zero
.L800250CC:
/* 12CEC 800250CC 00042229 */  slti       $v0, $t1, 0x400
/* 12CF0 800250D0 02004014 */  bnez       $v0, .L800250DC
/* 12CF4 800250D4 00000000 */   nop
/* 12CF8 800250D8 FF030924 */  addiu      $t1, $zero, 0x3FF
.L800250DC:
/* 12CFC 800250DC F400838E */  lw         $v1, 0xF4($s4)
/* 12D00 800250E0 80100900 */  sll        $v0, $t1, 2
/* 12D04 800250E4 21186200 */  addu       $v1, $v1, $v0
/* 12D08 800250E8 0000628C */  lw         $v0, 0x0($v1)
/* 12D0C 800250EC 00000000 */  nop
/* 12D10 800250F0 25104500 */  or         $v0, $v0, $a1
/* 12D14 800250F4 9C0022AE */  sw         $v0, 0x9C($s1)
/* 12D18 800250F8 24102402 */  and        $v0, $s1, $a0
/* 12D1C 800250FC 000062AC */  sw         $v0, 0x0($v1)
/* 12D20 80025100 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 12D24 80025104 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 12D28 80025108 00000000 */  nop
/* 12D2C 8002510C 1000438C */  lw         $v1, 0x10($v0)
/* 12D30 80025110 D0002226 */  addiu      $v0, $s1, 0xD0
/* 12D34 80025114 800062AC */  sw         $v0, 0x80($v1)
.L80025118:
/* 12D38 80025118 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 12D3C 8002511C 2800B48F */  lw         $s4, 0x28($sp)
/* 12D40 80025120 2400B38F */  lw         $s3, 0x24($sp)
/* 12D44 80025124 2000B28F */  lw         $s2, 0x20($sp)
/* 12D48 80025128 1C00B18F */  lw         $s1, 0x1C($sp)
/* 12D4C 8002512C 1800B08F */  lw         $s0, 0x18($sp)
/* 12D50 80025130 0800E003 */  jr         $ra
/* 12D54 80025134 3000BD27 */   addiu     $sp, $sp, 0x30
.size FLARE_ThTick, . - FLARE_ThTick
