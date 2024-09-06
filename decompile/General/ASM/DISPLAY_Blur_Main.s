.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel DISPLAY_Blur_Main
/* 1196C 80023D4C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 11970 80023D50 1400B1AF */  sw         $s1, 0x14($sp)
/* 11974 80023D54 2188A000 */  addu       $s1, $a1, $zero
/* 11978 80023D58 0980053C */  lui        $a1, %hi(D_8008D2AC)
/* 1197C 80023D5C ACD2A58C */  lw         $a1, %lo(D_8008D2AC)($a1)
/* 11980 80023D60 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 11984 80023D64 21988000 */  addu       $s3, $a0, $zero
/* 11988 80023D68 2400BFAF */  sw         $ra, 0x24($sp)
/* 1198C 80023D6C 2000B4AF */  sw         $s4, 0x20($sp)
/* 11990 80023D70 1800B2AF */  sw         $s2, 0x18($sp)
/* 11994 80023D74 1000B0AF */  sw         $s0, 0x10($sp)
/* 11998 80023D78 1000B48C */  lw         $s4, 0x10($a1)
/* 1199C 80023D7C 00000000 */  nop
/* 119A0 80023D80 8000908E */  lw         $s0, 0x80($s4)
/* 119A4 80023D84 5D00201A */  blez       $s1, .L80023EFC
/* 119A8 80023D88 801F123C */   lui       $s2, (0x1F800002 >> 16)
/* 119AC 80023D8C 01000324 */  addiu      $v1, $zero, 0x1
/* 119B0 80023D90 0C00A28C */  lw         $v0, 0xC($a1)
/* 119B4 80023D94 08016482 */  lb         $a0, 0x108($s3)
/* 119B8 80023D98 23186200 */  subu       $v1, $v1, $v0
/* 119BC 80023D9C 80100300 */  sll        $v0, $v1, 2
/* 119C0 80023DA0 21104300 */  addu       $v0, $v0, $v1
/* 119C4 80023DA4 C0100200 */  sll        $v0, $v0, 3
/* 119C8 80023DA8 21104300 */  addu       $v0, $v0, $v1
/* 119CC 80023DAC 80100200 */  sll        $v0, $v0, 2
/* 119D0 80023DB0 2110A200 */  addu       $v0, $a1, $v0
/* 119D4 80023DB4 88004290 */  lbu        $v0, 0x88($v0)
/* 119D8 80023DB8 00000000 */  nop
/* 119DC 80023DBC 07108200 */  srav       $v0, $v0, $a0
/* 119E0 80023DC0 01004230 */  andi       $v0, $v0, 0x1
/* 119E4 80023DC4 4D004010 */  beqz       $v0, .L80023EFC
/* 119E8 80023DC8 00000000 */   nop
/* 119EC 80023DCC EC1CA28C */  lw         $v0, 0x1CEC($a1)
/* 119F0 80023DD0 00000000 */  nop
/* 119F4 80023DD4 21184400 */  addu       $v1, $v0, $a0
/* 119F8 80023DD8 01008230 */  andi       $v0, $a0, 0x1
/* 119FC 80023DDC 02004010 */  beqz       $v0, .L80023DE8
/* 11A00 80023DE0 00000000 */   nop
/* 11A04 80023DE4 23180300 */  negu       $v1, $v1
.L80023DE8:
/* 11A08 80023DE8 40200300 */  sll        $a0, $v1, 1
/* 11A0C 80023DEC 21208300 */  addu       $a0, $a0, $v1
/* 11A10 80023DF0 C0200400 */  sll        $a0, $a0, 3
/* 11A14 80023DF4 21208300 */  addu       $a0, $a0, $v1
/* 11A18 80023DF8 61F4000C */  jal        DECOMP_MATH_Sin
/* 11A1C 80023DFC 80200400 */   sll       $a0, $a0, 2
/* 11A20 80023E00 21484000 */  addu       $t1, $v0, $zero
/* 11A24 80023E04 03002105 */  bgez       $t1, .L80023E14
/* 11A28 80023E08 83100900 */   sra       $v0, $t1, 2
/* 11A2C 80023E0C 23480900 */  negu       $t1, $t1
/* 11A30 80023E10 83100900 */  sra        $v0, $t1, 2
.L80023E14:
/* 11A34 80023E14 00044924 */  addiu      $t1, $v0, 0x400
/* 11A38 80023E18 0010222A */  slti       $v0, $s1, 0x1000
/* 11A3C 80023E1C 03004010 */  beqz       $v0, .L80023E2C
/* 11A40 80023E20 18003101 */   mult      $t1, $s1
/* 11A44 80023E24 12500000 */  mflo       $t2
/* 11A48 80023E28 034B0A00 */  sra        $t1, $t2, 12
.L80023E2C:
/* 11A4C 80023E2C 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 11A50 80023E30 ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 11A54 80023E34 00000000 */  nop
/* 11A58 80023E38 0C00628C */  lw         $v0, 0xC($v1)
/* 11A5C 80023E3C FF00043C */  lui        $a0, (0xFFFFFF >> 16)
/* 11A60 80023E40 80100200 */  sll        $v0, $v0, 2
/* 11A64 80023E44 21186200 */  addu       $v1, $v1, $v0
/* 11A68 80023E48 C818628C */  lw         $v0, 0x18C8($v1)
/* 11A6C 80023E4C FFFF8434 */  ori        $a0, $a0, (0xFFFFFF & 0xFFFF)
/* 11A70 80023E50 0000518C */  lw         $s1, 0x0($v0)
/* 11A74 80023E54 24200402 */  and        $a0, $s0, $a0
/* 11A78 80023E58 000044AC */  sw         $a0, 0x0($v0)
/* 11A7C 80023E5C 1C006596 */  lhu        $a1, 0x1C($s3)
/* 11A80 80023E60 21200002 */  addu       $a0, $s0, $zero
/* 11A84 80023E64 080045A6 */  sh         $a1, (0x1F800008 & 0xFFFF)($s2)
/* 11A88 80023E68 1E006896 */  lhu        $t0, 0x1E($s3)
/* 11A8C 80023E6C C0100900 */  sll        $v0, $t1, 3
/* 11A90 80023E70 0A0048A6 */  sh         $t0, (0x1F80000A & 0xFFFF)($s2)
/* 11A94 80023E74 20006696 */  lhu        $a2, 0x20($s3)
/* 11A98 80023E78 21104900 */  addu       $v0, $v0, $t1
/* 11A9C 80023E7C 0C0046A6 */  sh         $a2, (0x1F80000C & 0xFFFF)($s2)
/* 11AA0 80023E80 22006796 */  lhu        $a3, 0x22($s3)
/* 11AA4 80023E84 03130200 */  sra        $v0, $v0, 12
/* 11AA8 80023E88 0E0047A6 */  sh         $a3, (0x1F80000E & 0xFFFF)($s2)
/* 11AAC 80023E8C 5C008396 */  lhu        $v1, 0x5C($s4)
/* 11AB0 80023E90 02004224 */  addiu      $v0, $v0, 0x2
/* 11AB4 80023E94 21186500 */  addu       $v1, $v1, $a1
/* 11AB8 80023E98 21186200 */  addu       $v1, $v1, $v0
/* 11ABC 80023E9C 40100200 */  sll        $v0, $v0, 1
/* 11AC0 80023EA0 2330C200 */  subu       $a2, $a2, $v0
/* 11AC4 80023EA4 40100900 */  sll        $v0, $t1, 1
/* 11AC8 80023EA8 21104900 */  addu       $v0, $v0, $t1
/* 11ACC 80023EAC 40100200 */  sll        $v0, $v0, 1
/* 11AD0 80023EB0 03130200 */  sra        $v0, $v0, 12
/* 11AD4 80023EB4 02004224 */  addiu      $v0, $v0, 0x2
/* 11AD8 80023EB8 000043A6 */  sh         $v1, (0x1F800000 & 0xFFFF)($s2)
/* 11ADC 80023EBC 40180200 */  sll        $v1, $v0, 1
/* 11AE0 80023EC0 5E008596 */  lhu        $a1, 0x5E($s4)
/* 11AE4 80023EC4 2338E300 */  subu       $a3, $a3, $v1
/* 11AE8 80023EC8 040046A6 */  sh         $a2, (0x1F800004 & 0xFFFF)($s2)
/* 11AEC 80023ECC 060047A6 */  sh         $a3, (0x1F800006 & 0xFFFF)($s2)
/* 11AF0 80023ED0 2128A800 */  addu       $a1, $a1, $t0
/* 11AF4 80023ED4 2128A200 */  addu       $a1, $a1, $v0
/* 11AF8 80023ED8 020045A6 */  sh         $a1, (0x1F800002 & 0xFFFF)($s2)
/* 11AFC 80023EDC 908E000C */  jal        DISPLAY_Blur_SubFunc
/* 11B00 80023EE0 801F053C */   lui       $a1, (0x1F800000 >> 16)
/* 11B04 80023EE4 D8FF5024 */  addiu      $s0, $v0, -0x28
/* 11B08 80023EE8 0009023C */  lui        $v0, (0x9000000 >> 16)
/* 11B0C 80023EEC 25102202 */  or         $v0, $s1, $v0
/* 11B10 80023EF0 000002AE */  sw         $v0, 0x0($s0)
/* 11B14 80023EF4 F08F0008 */  j          .L80023FC0
/* 11B18 80023EF8 28001026 */   addiu     $s0, $s0, 0x28
.L80023EFC:
/* 11B1C 80023EFC 00E1043C */  lui        $a0, (0xE1000A20 >> 16)
/* 11B20 80023F00 200A8434 */  ori        $a0, $a0, (0xE1000A20 & 0xFFFF)
/* 11B24 80023F04 00E6033C */  lui        $v1, (0xE6000001 >> 16)
/* 11B28 80023F08 01006334 */  ori        $v1, $v1, (0xE6000001 & 0xFFFF)
/* 11B2C 80023F0C 00E1023C */  lui        $v0, (0xE1000A00 >> 16)
/* 11B30 80023F10 000A4234 */  ori        $v0, $v0, (0xE1000A00 & 0xFFFF)
/* 11B34 80023F14 200002AE */  sw         $v0, 0x20($s0)
/* 11B38 80023F18 00E6023C */  lui        $v0, (0xE6000000 >> 16)
/* 11B3C 80023F1C 040004AE */  sw         $a0, 0x4($s0)
/* 11B40 80023F20 080003AE */  sw         $v1, 0x8($s0)
/* 11B44 80023F24 240002AE */  sw         $v0, 0x24($s0)
/* 11B48 80023F28 1E006386 */  lh         $v1, 0x1E($s3)
/* 11B4C 80023F2C 1C006686 */  lh         $a2, 0x1C($s3)
/* 11B50 80023F30 20006486 */  lh         $a0, 0x20($s3)
/* 11B54 80023F34 22006586 */  lh         $a1, 0x22($s3)
/* 11B58 80023F38 001C0300 */  sll        $v1, $v1, 16
/* 11B5C 80023F3C 2510C300 */  or         $v0, $a2, $v1
/* 11B60 80023F40 2120C400 */  addu       $a0, $a2, $a0
/* 11B64 80023F44 100002AE */  sw         $v0, 0x10($s0)
/* 11B68 80023F48 25108300 */  or         $v0, $a0, $v1
/* 11B6C 80023F4C 002C0500 */  sll        $a1, $a1, 16
/* 11B70 80023F50 21186500 */  addu       $v1, $v1, $a1
/* 11B74 80023F54 2530C300 */  or         $a2, $a2, $v1
/* 11B78 80023F58 25208300 */  or         $a0, $a0, $v1
/* 11B7C 80023F5C 21280002 */  addu       $a1, $s0, $zero
/* 11B80 80023F60 140002AE */  sw         $v0, 0x14($s0)
/* 11B84 80023F64 180006AE */  sw         $a2, 0x18($s0)
/* 11B88 80023F68 04002106 */  bgez       $s1, .L80023F7C
/* 11B8C 80023F6C 1C0004AE */   sw        $a0, 0x1C($s0)
/* 11B90 80023F70 FF2A023C */  lui        $v0, (0x2AFFFFFF >> 16)
/* 11B94 80023F74 E08F0008 */  j          .L80023F80
/* 11B98 80023F78 FFFF4234 */   ori       $v0, $v0, (0x2AFFFFFF & 0xFFFF)
.L80023F7C:
/* 11B9C 80023F7C 002A023C */  lui        $v0, (0x2A000000 >> 16)
.L80023F80:
/* 11BA0 80023F80 0C0002AE */  sw         $v0, 0xC($s0)
/* 11BA4 80023F84 FF00043C */  lui        $a0, (0xFFFFFF >> 16)
/* 11BA8 80023F88 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 11BAC 80023F8C ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 11BB0 80023F90 FFFF8434 */  ori        $a0, $a0, (0xFFFFFF & 0xFFFF)
/* 11BB4 80023F94 0C00628C */  lw         $v0, 0xC($v1)
/* 11BB8 80023F98 28001026 */  addiu      $s0, $s0, 0x28
/* 11BBC 80023F9C 80100200 */  sll        $v0, $v0, 2
/* 11BC0 80023FA0 21186200 */  addu       $v1, $v1, $v0
/* 11BC4 80023FA4 C818718C */  lw         $s1, 0x18C8($v1)
/* 11BC8 80023FA8 2420A400 */  and        $a0, $a1, $a0
/* 11BCC 80023FAC 0000228E */  lw         $v0, 0x0($s1)
/* 11BD0 80023FB0 0009033C */  lui        $v1, (0x9000000 >> 16)
/* 11BD4 80023FB4 25104300 */  or         $v0, $v0, $v1
/* 11BD8 80023FB8 0000A2AC */  sw         $v0, 0x0($a1)
/* 11BDC 80023FBC 000024AE */  sw         $a0, 0x0($s1)
.L80023FC0:
/* 11BE0 80023FC0 01000224 */  addiu      $v0, $zero, 0x1
/* 11BE4 80023FC4 800090AE */  sw         $s0, 0x80($s4)
/* 11BE8 80023FC8 08016482 */  lb         $a0, 0x108($s3)
/* 11BEC 80023FCC 70008392 */  lbu        $v1, 0x70($s4)
/* 11BF0 80023FD0 04108200 */  sllv       $v0, $v0, $a0
/* 11BF4 80023FD4 25186200 */  or         $v1, $v1, $v0
/* 11BF8 80023FD8 700083A2 */  sb         $v1, 0x70($s4)
/* 11BFC 80023FDC 2400BF8F */  lw         $ra, 0x24($sp)
/* 11C00 80023FE0 2000B48F */  lw         $s4, 0x20($sp)
/* 11C04 80023FE4 1C00B38F */  lw         $s3, 0x1C($sp)
/* 11C08 80023FE8 1800B28F */  lw         $s2, 0x18($sp)
/* 11C0C 80023FEC 1400B18F */  lw         $s1, 0x14($sp)
/* 11C10 80023FF0 1000B08F */  lw         $s0, 0x10($sp)
/* 11C14 80023FF4 0800E003 */  jr         $ra
/* 11C18 80023FF8 2800BD27 */   addiu     $sp, $sp, 0x28
.size DISPLAY_Blur_Main, . - DISPLAY_Blur_Main
