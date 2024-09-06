.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel Particle_UpdateList
/* 2CB1C 8003EEFC C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 2CB20 8003EF00 2800B6AF */  sw         $s6, 0x28($sp)
/* 2CB24 8003EF04 21B08000 */  addu       $s6, $a0, $zero
/* 2CB28 8003EF08 1400B1AF */  sw         $s1, 0x14($sp)
/* 2CB2C 8003EF0C 2188A000 */  addu       $s1, $a1, $zero
/* 2CB30 8003EF10 3400BFAF */  sw         $ra, 0x34($sp)
/* 2CB34 8003EF14 3000BEAF */  sw         $fp, 0x30($sp)
/* 2CB38 8003EF18 2C00B7AF */  sw         $s7, 0x2C($sp)
/* 2CB3C 8003EF1C 2400B5AF */  sw         $s5, 0x24($sp)
/* 2CB40 8003EF20 2000B4AF */  sw         $s4, 0x20($sp)
/* 2CB44 8003EF24 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 2CB48 8003EF28 1800B2AF */  sw         $s2, 0x18($sp)
/* 2CB4C 8003EF2C 35012012 */  beqz       $s1, .L8003F404
/* 2CB50 8003EF30 1000B0AF */   sw        $s0, 0x10($sp)
/* 2CB54 8003EF34 0180023C */  lui        $v0, %hi(jtbl_800115E4_ctr)
/* 2CB58 8003EF38 E4155E24 */  addiu      $fp, $v0, %lo(jtbl_800115E4_ctr)
/* 2CB5C 8003EF3C FFFF0324 */  addiu      $v1, $zero, -0x1
.L8003EF40:
/* 2CB60 8003EF40 10002296 */  lhu        $v0, 0x10($s1)
/* 2CB64 8003EF44 0000378E */  lw         $s7, 0x0($s1)
/* 2CB68 8003EF48 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 2CB6C 8003EF4C 100022A6 */  sh         $v0, 0x10($s1)
/* 2CB70 8003EF50 00140200 */  sll        $v0, $v0, 16
/* 2CB74 8003EF54 03140200 */  sra        $v0, $v0, 16
/* 2CB78 8003EF58 E0004310 */  beq        $v0, $v1, .L8003F2DC
/* 2CB7C 8003EF5C 00000000 */   nop
/* 2CB80 8003EF60 12003596 */  lhu        $s5, 0x12($s1)
/* 2CB84 8003EF64 00000000 */  nop
/* 2CB88 8003EF68 0800A232 */  andi       $v0, $s5, 0x8
/* 2CB8C 8003EF6C DB004014 */  bnez       $v0, .L8003F2DC
/* 2CB90 8003EF70 0010A232 */   andi      $v0, $s5, 0x1000
/* 2CB94 8003EF74 0C004010 */  beqz       $v0, .L8003EFA8
/* 2CB98 8003EF78 00000000 */   nop
/* 2CB9C 8003EF7C 2400228E */  lw         $v0, 0x24($s1)
/* 2CBA0 8003EF80 2C00238E */  lw         $v1, 0x2C($s1)
/* 2CBA4 8003EF84 3400248E */  lw         $a0, 0x34($s1)
/* 2CBA8 8003EF88 3C0022AE */  sw         $v0, 0x3C($s1)
/* 2CBAC 8003EF8C 0040A232 */  andi       $v0, $s5, 0x4000
/* 2CBB0 8003EF90 540023AE */  sw         $v1, 0x54($s1)
/* 2CBB4 8003EF94 04004014 */  bnez       $v0, .L8003EFA8
/* 2CBB8 8003EF98 440024AE */   sw        $a0, 0x44($s1)
/* 2CBBC 8003EF9C 7800228E */  lw         $v0, 0x78($s1)
/* 2CBC0 8003EFA0 00000000 */  nop
/* 2CBC4 8003EFA4 740022AE */  sw         $v0, 0x74($s1)
.L8003EFA8:
/* 2CBC8 8003EFA8 1400338E */  lw         $s3, 0x14($s1)
/* 2CBCC 8003EFAC 0400308E */  lw         $s0, 0x4($s1)
/* 2CBD0 8003EFB0 97006012 */  beqz       $s3, .L8003F210
/* 2CBD4 8003EFB4 24003426 */   addiu     $s4, $s1, 0x24
/* 2CBD8 8003EFB8 28003226 */  addiu      $s2, $s1, 0x28
.L8003EFBC:
/* 2CBDC 8003EFBC 01006232 */  andi       $v0, $s3, 0x1
/* 2CBE0 8003EFC0 8C004010 */  beqz       $v0, .L8003F1F4
/* 2CBE4 8003EFC4 00000000 */   nop
/* 2CBE8 8003EFC8 00004386 */  lh         $v1, 0x0($s2)
/* 2CBEC 8003EFCC 0000828E */  lw         $v0, 0x0($s4)
/* 2CBF0 8003EFD0 00000000 */  nop
/* 2CBF4 8003EFD4 21104300 */  addu       $v0, $v0, $v1
/* 2CBF8 8003EFD8 000082AE */  sw         $v0, 0x0($s4)
/* 2CBFC 8003EFDC 00004396 */  lhu        $v1, 0x0($s2)
/* 2CC00 8003EFE0 02004296 */  lhu        $v0, 0x2($s2)
/* 2CC04 8003EFE4 00000000 */  nop
/* 2CC08 8003EFE8 21186200 */  addu       $v1, $v1, $v0
/* 2CC0C 8003EFEC 03141300 */  sra        $v0, $s3, 16
/* 2CC10 8003EFF0 01004230 */  andi       $v0, $v0, 0x1
/* 2CC14 8003EFF4 7F004010 */  beqz       $v0, .L8003F1F4
/* 2CC18 8003EFF8 000043A6 */   sh        $v1, 0x0($s2)
/* 2CC1C 8003EFFC 7D000012 */  beqz       $s0, .L8003F1F4
/* 2CC20 8003F000 00000000 */   nop
/* 2CC24 8003F004 08000496 */  lhu        $a0, 0x8($s0)
/* 2CC28 8003F008 00000000 */  nop
/* 2CC2C 8003F00C 08008230 */  andi       $v0, $a0, 0x8
/* 2CC30 8003F010 0D004014 */  bnez       $v0, .L8003F048
/* 2CC34 8003F014 10008230 */   andi      $v0, $a0, 0x10
/* 2CC38 8003F018 06004010 */  beqz       $v0, .L8003F034
/* 2CC3C 8003F01C 00000000 */   nop
/* 2CC40 8003F020 0A000296 */  lhu        $v0, 0xA($s0)
/* 2CC44 8003F024 00000000 */  nop
/* 2CC48 8003F028 23106200 */  subu       $v0, $v1, $v0
/* 2CC4C 8003F02C 12FC0008 */  j          .L8003F048
/* 2CC50 8003F030 000042A6 */   sh        $v0, 0x0($s2)
.L8003F034:
/* 2CC54 8003F034 0A000386 */  lh         $v1, 0xA($s0)
/* 2CC58 8003F038 0000828E */  lw         $v0, 0x0($s4)
/* 2CC5C 8003F03C 00000000 */  nop
/* 2CC60 8003F040 23104300 */  subu       $v0, $v0, $v1
/* 2CC64 8003F044 000082AE */  sw         $v0, 0x0($s4)
.L8003F048:
/* 2CC68 8003F048 08000396 */  lhu        $v1, 0x8($s0)
/* 2CC6C 8003F04C 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 2CC70 8003F050 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 2CC74 8003F054 07006330 */  andi       $v1, $v1, 0x7
/* 2CC78 8003F058 F01C448C */  lw         $a0, 0x1CF0($v0)
/* 2CC7C 8003F05C 0700622C */  sltiu      $v0, $v1, 0x7
/* 2CC80 8003F060 43004010 */  beqz       $v0, .L8003F170
/* 2CC84 8003F064 80100300 */   sll       $v0, $v1, 2
/* 2CC88 8003F068 21105E00 */  addu       $v0, $v0, $fp
/* 2CC8C 8003F06C 0000428C */  lw         $v0, 0x0($v0)
/* 2CC90 8003F070 00000000 */  nop
/* 2CC94 8003F074 08004000 */  jr         $v0
/* 2CC98 8003F078 00000000 */   nop
/* 2CC9C 8003F07C 0E000286 */  lh         $v0, 0xE($s0)
/* 2CCA0 8003F080 0C000396 */  lhu        $v1, 0xC($s0)
/* 2CCA4 8003F084 21208200 */  addu       $a0, $a0, $v0
/* 2CCA8 8003F088 18006400 */  mult       $v1, $a0
/* 2CCAC 8003F08C 12300000 */  mflo       $a2
/* 2CCB0 8003F090 61F4000C */  jal        DECOMP_MATH_Sin
/* 2CCB4 8003F094 43210600 */   sra       $a0, $a2, 5
/* 2CCB8 8003F098 5CFC0008 */  j          .L8003F170
/* 2CCBC 8003F09C 21204000 */   addu      $a0, $v0, $zero
/* 2CCC0 8003F0A0 0E000286 */  lh         $v0, 0xE($s0)
/* 2CCC4 8003F0A4 0C000396 */  lhu        $v1, 0xC($s0)
/* 2CCC8 8003F0A8 21208200 */  addu       $a0, $a0, $v0
/* 2CCCC 8003F0AC 18006400 */  mult       $v1, $a0
/* 2CCD0 8003F0B0 12300000 */  mflo       $a2
/* 2CCD4 8003F0B4 61F4000C */  jal        DECOMP_MATH_Sin
/* 2CCD8 8003F0B8 83210600 */   sra       $a0, $a2, 6
/* 2CCDC 8003F0BC 02004104 */  bgez       $v0, .L8003F0C8
/* 2CCE0 8003F0C0 21204000 */   addu      $a0, $v0, $zero
/* 2CCE4 8003F0C4 23200400 */  negu       $a0, $a0
.L8003F0C8:
/* 2CCE8 8003F0C8 5BFC0008 */  j          .L8003F16C
/* 2CCEC 8003F0CC 40200400 */   sll       $a0, $a0, 1
/* 2CCF0 8003F0D0 0E000286 */  lh         $v0, 0xE($s0)
/* 2CCF4 8003F0D4 0C000396 */  lhu        $v1, 0xC($s0)
/* 2CCF8 8003F0D8 21208200 */  addu       $a0, $a0, $v0
/* 2CCFC 8003F0DC 18006400 */  mult       $v1, $a0
/* 2CD00 8003F0E0 12300000 */  mflo       $a2
/* 2CD04 8003F0E4 03210600 */  sra        $a0, $a2, 4
/* 2CD08 8003F0E8 5BFC0008 */  j          .L8003F16C
/* 2CD0C 8003F0EC FF1F8430 */   andi      $a0, $a0, 0x1FFF
/* 2CD10 8003F0F0 0E000286 */  lh         $v0, 0xE($s0)
/* 2CD14 8003F0F4 0C000396 */  lhu        $v1, 0xC($s0)
/* 2CD18 8003F0F8 21208200 */  addu       $a0, $a0, $v0
/* 2CD1C 8003F0FC 18006400 */  mult       $v1, $a0
/* 2CD20 8003F100 12300000 */  mflo       $a2
/* 2CD24 8003F104 C3200600 */  sra        $a0, $a2, 3
/* 2CD28 8003F108 FF3F8430 */  andi       $a0, $a0, 0x3FFF
/* 2CD2C 8003F10C 01208228 */  slti       $v0, $a0, 0x2001
/* 2CD30 8003F110 16004014 */  bnez       $v0, .L8003F16C
/* 2CD34 8003F114 00400224 */   addiu     $v0, $zero, 0x4000
/* 2CD38 8003F118 5BFC0008 */  j          .L8003F16C
/* 2CD3C 8003F11C 23204400 */   subu      $a0, $v0, $a0
/* 2CD40 8003F120 0E000286 */  lh         $v0, 0xE($s0)
/* 2CD44 8003F124 0C000396 */  lhu        $v1, 0xC($s0)
/* 2CD48 8003F128 21208200 */  addu       $a0, $a0, $v0
/* 2CD4C 8003F12C 18006400 */  mult       $v1, $a0
/* 2CD50 8003F130 12300000 */  mflo       $a2
/* 2CD54 8003F134 83210600 */  sra        $a0, $a2, 6
/* 2CD58 8003F138 00048230 */  andi       $v0, $a0, 0x400
/* 2CD5C 8003F13C 0C004010 */  beqz       $v0, .L8003F170
/* 2CD60 8003F140 00F00424 */   addiu     $a0, $zero, -0x1000
/* 2CD64 8003F144 5CFC0008 */  j          .L8003F170
/* 2CD68 8003F148 00100424 */   addiu     $a0, $zero, 0x1000
/* 2CD6C 8003F14C 8AFA000C */  jal        DECOMP_MixRNG_Scramble
/* 2CD70 8003F150 00000000 */   nop
/* 2CD74 8003F154 5BFC0008 */  j          .L8003F16C
/* 2CD78 8003F158 C3200200 */   sra       $a0, $v0, 3
/* 2CD7C 8003F15C 0A000486 */  lh         $a0, 0xA($s0)
/* 2CD80 8003F160 ABFA000C */  jal        MixRNG_GetValue
/* 2CD84 8003F164 00000000 */   nop
/* 2CD88 8003F168 C3200200 */  sra        $a0, $v0, 3
.L8003F16C:
/* 2CD8C 8003F16C 00F08424 */  addiu      $a0, $a0, -0x1000
.L8003F170:
/* 2CD90 8003F170 12000286 */  lh         $v0, 0x12($s0)
/* 2CD94 8003F174 10000396 */  lhu        $v1, 0x10($s0)
/* 2CD98 8003F178 21208200 */  addu       $a0, $a0, $v0
/* 2CD9C 8003F17C 18008300 */  mult       $a0, $v1
/* 2CDA0 8003F180 16000386 */  lh         $v1, 0x16($s0)
/* 2CDA4 8003F184 12300000 */  mflo       $a2
/* 2CDA8 8003F188 03230600 */  sra        $a0, $a2, 12
/* 2CDAC 8003F18C 2A106400 */  slt        $v0, $v1, $a0
/* 2CDB0 8003F190 02004010 */  beqz       $v0, .L8003F19C
/* 2CDB4 8003F194 00000000 */   nop
/* 2CDB8 8003F198 21206000 */  addu       $a0, $v1, $zero
.L8003F19C:
/* 2CDBC 8003F19C 14000386 */  lh         $v1, 0x14($s0)
/* 2CDC0 8003F1A0 00000000 */  nop
/* 2CDC4 8003F1A4 2A108300 */  slt        $v0, $a0, $v1
/* 2CDC8 8003F1A8 02004010 */  beqz       $v0, .L8003F1B4
/* 2CDCC 8003F1AC 00000000 */   nop
/* 2CDD0 8003F1B0 21206000 */  addu       $a0, $v1, $zero
.L8003F1B4:
/* 2CDD4 8003F1B4 08000296 */  lhu        $v0, 0x8($s0)
/* 2CDD8 8003F1B8 00000000 */  nop
/* 2CDDC 8003F1BC 10004230 */  andi       $v0, $v0, 0x10
/* 2CDE0 8003F1C0 06004010 */  beqz       $v0, .L8003F1DC
/* 2CDE4 8003F1C4 00000000 */   nop
/* 2CDE8 8003F1C8 00004296 */  lhu        $v0, 0x0($s2)
/* 2CDEC 8003F1CC 00000000 */  nop
/* 2CDF0 8003F1D0 21104400 */  addu       $v0, $v0, $a0
/* 2CDF4 8003F1D4 7BFC0008 */  j          .L8003F1EC
/* 2CDF8 8003F1D8 000042A6 */   sh        $v0, 0x0($s2)
.L8003F1DC:
/* 2CDFC 8003F1DC 0000828E */  lw         $v0, 0x0($s4)
/* 2CE00 8003F1E0 00000000 */  nop
/* 2CE04 8003F1E4 21104400 */  addu       $v0, $v0, $a0
/* 2CE08 8003F1E8 000082AE */  sw         $v0, 0x0($s4)
.L8003F1EC:
/* 2CE0C 8003F1EC 0A0004A6 */  sh         $a0, 0xA($s0)
/* 2CE10 8003F1F0 0000108E */  lw         $s0, 0x0($s0)
.L8003F1F4:
/* 2CE14 8003F1F4 08005226 */  addiu      $s2, $s2, 0x8
/* 2CE18 8003F1F8 FEFF023C */  lui        $v0, (0xFFFEFFFF >> 16)
/* 2CE1C 8003F1FC FFFF4234 */  ori        $v0, $v0, (0xFFFEFFFF & 0xFFFF)
/* 2CE20 8003F200 24106202 */  and        $v0, $s3, $v0
/* 2CE24 8003F204 43980200 */  sra        $s3, $v0, 1
/* 2CE28 8003F208 6CFF6016 */  bnez       $s3, .L8003EFBC
/* 2CE2C 8003F20C 08009426 */   addiu     $s4, $s4, 0x8
.L8003F210:
/* 2CE30 8003F210 1C00228E */  lw         $v0, 0x1C($s1)
/* 2CE34 8003F214 00000000 */  nop
/* 2CE38 8003F218 03004010 */  beqz       $v0, .L8003F228
/* 2CE3C 8003F21C 00000000 */   nop
/* 2CE40 8003F220 09F84000 */  jalr       $v0
/* 2CE44 8003F224 21202002 */   addu      $a0, $s1, $zero
.L8003F228:
/* 2CE48 8003F228 14003396 */  lhu        $s3, 0x14($s1)
/* 2CE4C 8003F22C 0100A232 */  andi       $v0, $s5, 0x1
/* 2CE50 8003F230 0D004010 */  beqz       $v0, .L8003F268
/* 2CE54 8003F234 20006232 */   andi      $v0, $s3, 0x20
/* 2CE58 8003F238 05004010 */  beqz       $v0, .L8003F250
/* 2CE5C 8003F23C 40006232 */   andi      $v0, $s3, 0x40
/* 2CE60 8003F240 4C00228E */  lw         $v0, 0x4C($s1)
/* 2CE64 8003F244 00000000 */  nop
/* 2CE68 8003F248 24004018 */  blez       $v0, .L8003F2DC
/* 2CE6C 8003F24C 40006232 */   andi      $v0, $s3, 0x40
.L8003F250:
/* 2CE70 8003F250 06004010 */  beqz       $v0, .L8003F26C
/* 2CE74 8003F254 0200A232 */   andi      $v0, $s5, 0x2
/* 2CE78 8003F258 5400228E */  lw         $v0, 0x54($s1)
/* 2CE7C 8003F25C 00000000 */  nop
/* 2CE80 8003F260 1E004018 */  blez       $v0, .L8003F2DC
/* 2CE84 8003F264 00000000 */   nop
.L8003F268:
/* 2CE88 8003F268 0200A232 */  andi       $v0, $s5, 0x2
.L8003F26C:
/* 2CE8C 8003F26C 2B004010 */  beqz       $v0, .L8003F31C
/* 2CE90 8003F270 80006232 */   andi      $v0, $s3, 0x80
/* 2CE94 8003F274 06004010 */  beqz       $v0, .L8003F290
/* 2CE98 8003F278 21180000 */   addu      $v1, $zero, $zero
/* 2CE9C 8003F27C 5C00228E */  lw         $v0, 0x5C($s1)
/* 2CEA0 8003F280 00000000 */  nop
/* 2CEA4 8003F284 02004018 */  blez       $v0, .L8003F290
/* 2CEA8 8003F288 00000000 */   nop
/* 2CEAC 8003F28C 21184000 */  addu       $v1, $v0, $zero
.L8003F290:
/* 2CEB0 8003F290 00016232 */  andi       $v0, $s3, 0x100
/* 2CEB4 8003F294 07004010 */  beqz       $v0, .L8003F2B4
/* 2CEB8 8003F298 00026232 */   andi      $v0, $s3, 0x200
/* 2CEBC 8003F29C 6400228E */  lw         $v0, 0x64($s1)
/* 2CEC0 8003F2A0 00000000 */  nop
/* 2CEC4 8003F2A4 02004018 */  blez       $v0, .L8003F2B0
/* 2CEC8 8003F2A8 00000000 */   nop
/* 2CECC 8003F2AC 25186200 */  or         $v1, $v1, $v0
.L8003F2B0:
/* 2CED0 8003F2B0 00026232 */  andi       $v0, $s3, 0x200
.L8003F2B4:
/* 2CED4 8003F2B4 07004010 */  beqz       $v0, .L8003F2D4
/* 2CED8 8003F2B8 00086228 */   slti      $v0, $v1, 0x800
/* 2CEDC 8003F2BC 6C00228E */  lw         $v0, 0x6C($s1)
/* 2CEE0 8003F2C0 00000000 */  nop
/* 2CEE4 8003F2C4 02004018 */  blez       $v0, .L8003F2D0
/* 2CEE8 8003F2C8 00000000 */   nop
/* 2CEEC 8003F2CC 25186200 */  or         $v1, $v1, $v0
.L8003F2D0:
/* 2CEF0 8003F2D0 00086228 */  slti       $v0, $v1, 0x800
.L8003F2D4:
/* 2CEF4 8003F2D4 11004010 */  beqz       $v0, .L8003F31C
/* 2CEF8 8003F2D8 00000000 */   nop
.L8003F2DC:
/* 2CEFC 8003F2DC ACFB000C */  jal        DECOMP_Particle_OnDestroy
/* 2CF00 8003F2E0 21202002 */   addu      $a0, $s1, $zero
/* 2CF04 8003F2E4 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 2CF08 8003F2E8 ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 2CF0C 8003F2EC 21282002 */  addu       $a1, $s1, $zero
/* 2CF10 8003F2F0 D1C5000C */  jal        DECOMP_LIST_AddFront
/* 2CF14 8003F2F4 98198424 */   addiu     $a0, $a0, 0x1998
/* 2CF18 8003F2F8 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 2CF1C 8003F2FC ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 2CF20 8003F300 00000000 */  nop
/* 2CF24 8003F304 A41C628C */  lw         $v0, 0x1CA4($v1)
/* 2CF28 8003F308 00000000 */  nop
/* 2CF2C 8003F30C FFFF4224 */  addiu      $v0, $v0, -0x1
/* 2CF30 8003F310 A41C62AC */  sw         $v0, 0x1CA4($v1)
/* 2CF34 8003F314 FEFC0008 */  j          .L8003F3F8
/* 2CF38 8003F318 0000D7AE */   sw        $s7, 0x0($s6)
.L8003F31C:
/* 2CF3C 8003F31C 14002296 */  lhu        $v0, 0x14($s1)
/* 2CF40 8003F320 00000000 */  nop
/* 2CF44 8003F324 00044230 */  andi       $v0, $v0, 0x400
/* 2CF48 8003F328 33004010 */  beqz       $v0, .L8003F3F8
/* 2CF4C 8003F32C 21B02002 */   addu      $s6, $s1, $zero
/* 2CF50 8003F330 0C00248E */  lw         $a0, 0xC($s1)
/* 2CF54 8003F334 00000000 */  nop
/* 2CF58 8003F338 2F008010 */  beqz       $a0, .L8003F3F8
/* 2CF5C 8003F33C 00000000 */   nop
/* 2CF60 8003F340 7400258E */  lw         $a1, 0x74($s1)
/* 2CF64 8003F344 00000000 */  nop
/* 2CF68 8003F348 0F00A104 */  bgez       $a1, .L8003F388
/* 2CF6C 8003F34C 00000000 */   nop
/* 2CF70 8003F350 12002396 */  lhu        $v1, 0x12($s1)
/* 2CF74 8003F354 00000000 */  nop
/* 2CF78 8003F358 00016230 */  andi       $v0, $v1, 0x100
/* 2CF7C 8003F35C 06004010 */  beqz       $v0, .L8003F378
/* 2CF80 8003F360 00026230 */   andi      $v0, $v1, 0x200
/* 2CF84 8003F364 12008284 */  lh         $v0, 0x12($a0)
/* 2CF88 8003F368 00000000 */  nop
/* 2CF8C 8003F36C 00120200 */  sll        $v0, $v0, 8
/* 2CF90 8003F370 FCFC0008 */  j          .L8003F3F0
/* 2CF94 8003F374 2128A200 */   addu      $a1, $a1, $v0
.L8003F378:
/* 2CF98 8003F378 12004014 */  bnez       $v0, .L8003F3C4
/* 2CF9C 8003F37C 00000000 */   nop
/* 2CFA0 8003F380 FCFC0008 */  j          .L8003F3F0
/* 2CFA4 8003F384 21280000 */   addu      $a1, $zero, $zero
.L8003F388:
/* 2CFA8 8003F388 12008284 */  lh         $v0, 0x12($a0)
/* 2CFAC 8003F38C 00000000 */  nop
/* 2CFB0 8003F390 00220200 */  sll        $a0, $v0, 8
/* 2CFB4 8003F394 2A10A400 */  slt        $v0, $a1, $a0
/* 2CFB8 8003F398 17004014 */  bnez       $v0, .L8003F3F8
/* 2CFBC 8003F39C 21B02002 */   addu      $s6, $s1, $zero
/* 2CFC0 8003F3A0 12002396 */  lhu        $v1, 0x12($s1)
/* 2CFC4 8003F3A4 00000000 */  nop
/* 2CFC8 8003F3A8 00016230 */  andi       $v0, $v1, 0x100
/* 2CFCC 8003F3AC 03004010 */  beqz       $v0, .L8003F3BC
/* 2CFD0 8003F3B0 00026230 */   andi      $v0, $v1, 0x200
/* 2CFD4 8003F3B4 FCFC0008 */  j          .L8003F3F0
/* 2CFD8 8003F3B8 2328A400 */   subu      $a1, $a1, $a0
.L8003F3BC:
/* 2CFDC 8003F3BC 0B004010 */  beqz       $v0, .L8003F3EC
/* 2CFE0 8003F3C0 00000000 */   nop
.L8003F3C4:
/* 2CFE4 8003F3C4 78002286 */  lh         $v0, 0x78($s1)
/* 2CFE8 8003F3C8 7A002396 */  lhu        $v1, 0x7A($s1)
/* 2CFEC 8003F3CC 40100200 */  sll        $v0, $v0, 1
/* 2CFF0 8003F3D0 2328A200 */  subu       $a1, $a1, $v0
/* 2CFF4 8003F3D4 78002296 */  lhu        $v0, 0x78($s1)
/* 2CFF8 8003F3D8 23180300 */  negu       $v1, $v1
/* 2CFFC 8003F3DC 7A0023A6 */  sh         $v1, 0x7A($s1)
/* 2D000 8003F3E0 23100200 */  negu       $v0, $v0
/* 2D004 8003F3E4 FCFC0008 */  j          .L8003F3F0
/* 2D008 8003F3E8 780022A6 */   sh        $v0, 0x78($s1)
.L8003F3EC:
/* 2D00C 8003F3EC FFFF8524 */  addiu      $a1, $a0, -0x1
.L8003F3F0:
/* 2D010 8003F3F0 740025AE */  sw         $a1, 0x74($s1)
/* 2D014 8003F3F4 21B02002 */  addu       $s6, $s1, $zero
.L8003F3F8:
/* 2D018 8003F3F8 2188E002 */  addu       $s1, $s7, $zero
/* 2D01C 8003F3FC D0FE2016 */  bnez       $s1, .L8003EF40
/* 2D020 8003F400 FFFF0324 */   addiu     $v1, $zero, -0x1
.L8003F404:
/* 2D024 8003F404 3400BF8F */  lw         $ra, 0x34($sp)
/* 2D028 8003F408 3000BE8F */  lw         $fp, 0x30($sp)
/* 2D02C 8003F40C 2C00B78F */  lw         $s7, 0x2C($sp)
/* 2D030 8003F410 2800B68F */  lw         $s6, 0x28($sp)
/* 2D034 8003F414 2400B58F */  lw         $s5, 0x24($sp)
/* 2D038 8003F418 2000B48F */  lw         $s4, 0x20($sp)
/* 2D03C 8003F41C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 2D040 8003F420 1800B28F */  lw         $s2, 0x18($sp)
/* 2D044 8003F424 1400B18F */  lw         $s1, 0x14($sp)
/* 2D048 8003F428 1000B08F */  lw         $s0, 0x10($sp)
/* 2D04C 8003F42C 0800E003 */  jr         $ra
/* 2D050 8003F430 3800BD27 */   addiu     $sp, $sp, 0x38
.size Particle_UpdateList, . - Particle_UpdateList
