.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel VehPhysForce_TranslateMatrix
/* 4CA54 8005EE34 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 4CA58 8005EE38 2000B2AF */  sw         $s2, 0x20($sp)
/* 4CA5C 8005EE3C 2190A000 */  addu       $s2, $a1, $zero
/* 4CA60 8005EE40 0A000224 */  addiu      $v0, $zero, 0xA
/* 4CA64 8005EE44 2800BFAF */  sw         $ra, 0x28($sp)
/* 4CA68 8005EE48 2400B3AF */  sw         $s3, 0x24($sp)
/* 4CA6C 8005EE4C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 4CA70 8005EE50 1800B0AF */  sw         $s0, 0x18($sp)
/* 4CA74 8005EE54 76034392 */  lbu        $v1, 0x376($s2)
/* 4CA78 8005EE58 3400938C */  lw         $s3, 0x34($a0)
/* 4CA7C 8005EE5C BD006210 */  beq        $v1, $v0, .L8005F154
/* 4CA80 8005EE60 05000224 */   addiu     $v0, $zero, 0x5
/* 4CA84 8005EE64 1C006214 */  bne        $v1, $v0, .L8005EED8
/* 4CA88 8005EE68 00000000 */   nop
/* 4CA8C 8005EE6C C802428E */  lw         $v0, 0x2C8($s2)
/* 4CA90 8005EE70 00000000 */  nop
/* 4CA94 8005EE74 01004230 */  andi       $v0, $v0, 0x1
/* 4CA98 8005EE78 17004014 */  bnez       $v0, .L8005EED8
/* 4CA9C 8005EE7C 00000000 */   nop
/* 4CAA0 8005EE80 0C044296 */  lhu        $v0, 0x40C($s2)
/* 4CAA4 8005EE84 00000000 */  nop
/* 4CAA8 8005EE88 CC0C4224 */  addiu      $v0, $v0, 0xCCC
/* 4CAAC 8005EE8C 1E0062A6 */  sh         $v0, 0x1E($s3)
/* 4CAB0 8005EE90 0C044386 */  lh         $v1, 0x40C($s2)
/* 4CAB4 8005EE94 00000000 */  nop
/* 4CAB8 8005EE98 80100300 */  sll        $v0, $v1, 2
/* 4CABC 8005EE9C 21104300 */  addu       $v0, $v0, $v1
/* 4CAC0 8005EEA0 C0100200 */  sll        $v0, $v0, 3
/* 4CAC4 8005EEA4 02004104 */  bgez       $v0, .L8005EEB0
/* 4CAC8 8005EEA8 00000000 */   nop
/* 4CACC 8005EEAC FF004224 */  addiu      $v0, $v0, 0xFF
.L8005EEB0:
/* 4CAD0 8005EEB0 03120200 */  sra        $v0, $v0, 8
/* 4CAD4 8005EEB4 CC0C0324 */  addiu      $v1, $zero, 0xCCC
/* 4CAD8 8005EEB8 23806200 */  subu       $s0, $v1, $v0
/* 4CADC 8005EEBC 0004022A */  slti       $v0, $s0, 0x400
/* 4CAE0 8005EEC0 02004010 */  beqz       $v0, .L8005EECC
/* 4CAE4 8005EEC4 00000000 */   nop
/* 4CAE8 8005EEC8 00041024 */  addiu      $s0, $zero, 0x400
.L8005EECC:
/* 4CAEC 8005EECC 1C0070A6 */  sh         $s0, 0x1C($s3)
/* 4CAF0 8005EED0 557C0108 */  j          .L8005F154
/* 4CAF4 8005EED4 200070A6 */   sh        $s0, 0x20($s3)
.L8005EED8:
/* 4CAF8 8005EED8 C802458E */  lw         $a1, 0x2C8($s2)
/* 4CAFC 8005EEDC 90035186 */  lh         $s1, 0x390($s2)
/* 4CB00 8005EEE0 0004A230 */  andi       $v0, $a1, 0x400
/* 4CB04 8005EEE4 23004014 */  bnez       $v0, .L8005EF74
/* 4CB08 8005EEE8 E0FC1024 */   addiu     $s0, $zero, -0x320
/* 4CB0C 8005EEEC 10044486 */  lh         $a0, 0x410($s2)
/* 4CB10 8005EEF0 C0181100 */  sll        $v1, $s1, 3
/* 4CB14 8005EEF4 23187100 */  subu       $v1, $v1, $s1
/* 4CB18 8005EEF8 C0100400 */  sll        $v0, $a0, 3
/* 4CB1C 8005EEFC 21104400 */  addu       $v0, $v0, $a0
/* 4CB20 8005EF00 21104300 */  addu       $v0, $v0, $v1
/* 4CB24 8005EF04 03110200 */  sra        $v0, $v0, 4
/* 4CB28 8005EF08 23808200 */  subu       $s0, $a0, $v0
/* 4CB2C 8005EF0C 80801000 */  sll        $s0, $s0, 2
/* 4CB30 8005EF10 02000106 */  bgez       $s0, .L8005EF1C
/* 4CB34 8005EF14 21100002 */   addu      $v0, $s0, $zero
/* 4CB38 8005EF18 23100200 */  negu       $v0, $v0
.L8005EF1C:
/* 4CB3C 8005EF1C 60094228 */  slti       $v0, $v0, 0x960
/* 4CB40 8005EF20 02004010 */  beqz       $v0, .L8005EF2C
/* 4CB44 8005EF24 00000000 */   nop
/* 4CB48 8005EF28 21800000 */  addu       $s0, $zero, $zero
.L8005EF2C:
/* 4CB4C 8005EF2C CC02428E */  lw         $v0, 0x2CC($s2)
/* 4CB50 8005EF30 00000000 */  nop
/* 4CB54 8005EF34 2510A200 */  or         $v0, $a1, $v0
/* 4CB58 8005EF38 02004230 */  andi       $v0, $v0, 0x2
/* 4CB5C 8005EF3C 05004010 */  beqz       $v0, .L8005EF54
/* 4CB60 8005EF40 C0F9022A */   slti      $v0, $s0, -0x640
/* 4CB64 8005EF44 08004010 */  beqz       $v0, .L8005EF68
/* 4CB68 8005EF48 2103022A */   slti      $v0, $s0, 0x321
/* 4CB6C 8005EF4C D97B0108 */  j          .L8005EF64
/* 4CB70 8005EF50 C0F91024 */   addiu     $s0, $zero, -0x640
.L8005EF54:
/* 4CB74 8005EF54 E0FC022A */  slti       $v0, $s0, -0x320
/* 4CB78 8005EF58 03004010 */  beqz       $v0, .L8005EF68
/* 4CB7C 8005EF5C 2103022A */   slti      $v0, $s0, 0x321
/* 4CB80 8005EF60 E0FC1024 */  addiu      $s0, $zero, -0x320
.L8005EF64:
/* 4CB84 8005EF64 2103022A */  slti       $v0, $s0, 0x321
.L8005EF68:
/* 4CB88 8005EF68 02004014 */  bnez       $v0, .L8005EF74
/* 4CB8C 8005EF6C 00000000 */   nop
/* 4CB90 8005EF70 20031024 */  addiu      $s0, $zero, 0x320
.L8005EF74:
/* 4CB94 8005EF74 0E004286 */  lh         $v0, 0xE($s2)
/* 4CB98 8005EF78 0E004396 */  lhu        $v1, 0xE($s2)
/* 4CB9C 8005EF7C 06004018 */  blez       $v0, .L8005EF98
/* 4CBA0 8005EF80 80006230 */   andi      $v0, $v1, 0x80
/* 4CBA4 8005EF84 04004014 */  bnez       $v0, .L8005EF98
/* 4CBA8 8005EF88 E1FC022A */   slti      $v0, $s0, -0x31F
/* 4CBAC 8005EF8C 02004014 */  bnez       $v0, .L8005EF98
/* 4CBB0 8005EF90 00000000 */   nop
/* 4CBB4 8005EF94 E0FC1024 */  addiu      $s0, $zero, -0x320
.L8005EF98:
/* 4CBB8 8005EF98 C802428E */  lw         $v0, 0x2C8($s2)
/* 4CBBC 8005EF9C 00000000 */  nop
/* 4CBC0 8005EFA0 01004230 */  andi       $v0, $v0, 0x1
/* 4CBC4 8005EFA4 0F004014 */  bnez       $v0, .L8005EFE4
/* 4CBC8 8005EFA8 00000000 */   nop
/* 4CBCC 8005EFAC 0D002106 */  bgez       $s1, .L8005EFE4
/* 4CBD0 8005EFB0 20030224 */   addiu     $v0, $zero, 0x320
/* 4CBD4 8005EFB4 1000A2AF */  sw         $v0, 0x10($sp)
/* 4CBD8 8005EFB8 23201100 */  negu       $a0, $s1
/* 4CBDC 8005EFBC 21280000 */  addu       $a1, $zero, $zero
/* 4CBE0 8005EFC0 000A0624 */  addiu      $a2, $zero, 0xA00
/* 4CBE4 8005EFC4 E763010C */  jal        DECOMP_VehCalc_MapToRange
/* 4CBE8 8005EFC8 80020724 */   addiu     $a3, $zero, 0x280
/* 4CBEC 8005EFCC 21184000 */  addu       $v1, $v0, $zero
/* 4CBF0 8005EFD0 2A100302 */  slt        $v0, $s0, $v1
/* 4CBF4 8005EFD4 02004010 */  beqz       $v0, .L8005EFE0
/* 4CBF8 8005EFD8 00000000 */   nop
/* 4CBFC 8005EFDC 21806000 */  addu       $s0, $v1, $zero
.L8005EFE0:
/* 4CC00 8005EFE0 100451A6 */  sh         $s1, 0x410($s2)
.L8005EFE4:
/* 4CC04 8005EFE4 1800428E */  lw         $v0, 0x18($s2)
/* 4CC08 8005EFE8 00000000 */  nop
/* 4CC0C 8005EFEC 08004010 */  beqz       $v0, .L8005F010
/* 4CC10 8005EFF0 00000000 */   nop
/* 4CC14 8005EFF4 1E004384 */  lh         $v1, 0x1E($v0)
/* 4CC18 8005EFF8 00000000 */  nop
/* 4CC1C 8005EFFC C4096228 */  slti       $v0, $v1, 0x9C4
/* 4CC20 8005F000 03004010 */  beqz       $v0, .L8005F010
/* 4CC24 8005F004 00F86224 */   addiu     $v0, $v1, -0x800
/* 4CC28 8005F008 40100200 */  sll        $v0, $v0, 1
/* 4CC2C 8005F00C 21800202 */  addu       $s0, $s0, $v0
.L8005F010:
/* 4CC30 8005F010 0C044286 */  lh         $v0, 0x40C($s2)
/* 4CC34 8005F014 02000106 */  bgez       $s0, .L8005F020
/* 4CC38 8005F018 21180002 */   addu      $v1, $s0, $zero
/* 4CC3C 8005F01C 23180300 */  negu       $v1, $v1
.L8005F020:
/* 4CC40 8005F020 02004104 */  bgez       $v0, .L8005F02C
/* 4CC44 8005F024 00000000 */   nop
/* 4CC48 8005F028 23100200 */  negu       $v0, $v0
.L8005F02C:
/* 4CC4C 8005F02C 2A104300 */  slt        $v0, $v0, $v1
/* 4CC50 8005F030 02004010 */  beqz       $v0, .L8005F03C
/* 4CC54 8005F034 2C010524 */   addiu     $a1, $zero, 0x12C
/* 4CC58 8005F038 0C0450A6 */  sh         $s0, 0x40C($s2)
.L8005F03C:
/* 4CC5C 8005F03C 0C044486 */  lh         $a0, 0x40C($s2)
/* 4CC60 8005F040 D563010C */  jal        DECOMP_VehCalc_InterpBySpeed
/* 4CC64 8005F044 21300000 */   addu      $a2, $zero, $zero
/* 4CC68 8005F048 0C0442A6 */  sh         $v0, 0x40C($s2)
/* 4CC6C 8005F04C C0101100 */  sll        $v0, $s1, 3
/* 4CC70 8005F050 10044486 */  lh         $a0, 0x410($s2)
/* 4CC74 8005F054 23105100 */  subu       $v0, $v0, $s1
/* 4CC78 8005F058 C0180400 */  sll        $v1, $a0, 3
/* 4CC7C 8005F05C 21186400 */  addu       $v1, $v1, $a0
/* 4CC80 8005F060 21186200 */  addu       $v1, $v1, $v0
/* 4CC84 8005F064 04044286 */  lh         $v0, 0x404($s2)
/* 4CC88 8005F068 03190300 */  sra        $v1, $v1, 4
/* 4CC8C 8005F06C 03004010 */  beqz       $v0, .L8005F07C
/* 4CC90 8005F070 100443A6 */   sh        $v1, 0x410($s2)
/* 4CC94 8005F074 3B7C0108 */  j          .L8005F0EC
/* 4CC98 8005F078 1E0060A6 */   sh        $zero, 0x1E($s3)
.L8005F07C:
/* 4CC9C 8005F07C 1E006486 */  lh         $a0, 0x1E($s3)
/* 4CCA0 8005F080 00000000 */  nop
/* 4CCA4 8005F084 15008014 */  bnez       $a0, .L8005F0DC
/* 4CCA8 8005F088 A0000524 */   addiu     $a1, $zero, 0xA0
/* 4CCAC 8005F08C 1C00428E */  lw         $v0, 0x1C($s2)
/* 4CCB0 8005F090 00000000 */  nop
/* 4CCB4 8005F094 6C00428C */  lw         $v0, 0x6C($v0)
/* 4CCB8 8005F098 00000000 */  nop
/* 4CCBC 8005F09C 44004384 */  lh         $v1, 0x44($v0)
/* 4CCC0 8005F0A0 18000224 */  addiu      $v0, $zero, 0x18
/* 4CCC4 8005F0A4 05006214 */  bne        $v1, $v0, .L8005F0BC
/* 4CCC8 8005F0A8 5B000424 */   addiu     $a0, $zero, 0x5B
/* 4CCCC 8005F0AC CA024696 */  lhu        $a2, 0x2CA($s2)
/* 4CCD0 8005F0B0 01000524 */  addiu      $a1, $zero, 0x1
/* 4CCD4 8005F0B4 25A1000C */  jal        DECOMP_OtherFX_Play_Echo
/* 4CCD8 8005F0B8 2430C500 */   and       $a2, $a2, $a1
.L8005F0BC:
/* 4CCDC 8005F0BC 0C044296 */  lhu        $v0, 0x40C($s2)
/* 4CCE0 8005F0C0 00000000 */  nop
/* 4CCE4 8005F0C4 CC0C4224 */  addiu      $v0, $v0, 0xCCC
/* 4CCE8 8005F0C8 1E0062A6 */  sh         $v0, 0x1E($s3)
/* 4CCEC 8005F0CC 05000224 */  addiu      $v0, $zero, 0x5
/* 4CCF0 8005F0D0 4C0042A2 */  sb         $v0, 0x4C($s2)
/* 4CCF4 8005F0D4 3B7C0108 */  j          .L8005F0EC
/* 4CCF8 8005F0D8 4D0040A2 */   sb        $zero, 0x4D($s2)
.L8005F0DC:
/* 4CCFC 8005F0DC 0C044686 */  lh         $a2, 0x40C($s2)
/* 4CD00 8005F0E0 D563010C */  jal        DECOMP_VehCalc_InterpBySpeed
/* 4CD04 8005F0E4 CC0CC624 */   addiu     $a2, $a2, 0xCCC
/* 4CD08 8005F0E8 1E0062A6 */  sh         $v0, 0x1E($s3)
.L8005F0EC:
/* 4CD0C 8005F0EC 0C044386 */  lh         $v1, 0x40C($s2)
/* 4CD10 8005F0F0 1C006486 */  lh         $a0, 0x1C($s3)
/* 4CD14 8005F0F4 80100300 */  sll        $v0, $v1, 2
/* 4CD18 8005F0F8 21104300 */  addu       $v0, $v0, $v1
/* 4CD1C 8005F0FC 40110200 */  sll        $v0, $v0, 5
/* 4CD20 8005F100 02004104 */  bgez       $v0, .L8005F10C
/* 4CD24 8005F104 A0000524 */   addiu     $a1, $zero, 0xA0
/* 4CD28 8005F108 FF004224 */  addiu      $v0, $v0, 0xFF
.L8005F10C:
/* 4CD2C 8005F10C 03320200 */  sra        $a2, $v0, 8
/* 4CD30 8005F110 CC0C1024 */  addiu      $s0, $zero, 0xCCC
/* 4CD34 8005F114 D563010C */  jal        DECOMP_VehCalc_InterpBySpeed
/* 4CD38 8005F118 23300602 */   subu      $a2, $s0, $a2
/* 4CD3C 8005F11C 1C0062A6 */  sh         $v0, 0x1C($s3)
/* 4CD40 8005F120 0C044386 */  lh         $v1, 0x40C($s2)
/* 4CD44 8005F124 20006486 */  lh         $a0, 0x20($s3)
/* 4CD48 8005F128 80100300 */  sll        $v0, $v1, 2
/* 4CD4C 8005F12C 21104300 */  addu       $v0, $v0, $v1
/* 4CD50 8005F130 40110200 */  sll        $v0, $v0, 5
/* 4CD54 8005F134 02004104 */  bgez       $v0, .L8005F140
/* 4CD58 8005F138 00000000 */   nop
/* 4CD5C 8005F13C FF004224 */  addiu      $v0, $v0, 0xFF
.L8005F140:
/* 4CD60 8005F140 A0000524 */  addiu      $a1, $zero, 0xA0
/* 4CD64 8005F144 03320200 */  sra        $a2, $v0, 8
/* 4CD68 8005F148 D563010C */  jal        DECOMP_VehCalc_InterpBySpeed
/* 4CD6C 8005F14C 23300602 */   subu      $a2, $s0, $a2
/* 4CD70 8005F150 200062A6 */  sh         $v0, 0x20($s3)
.L8005F154:
/* 4CD74 8005F154 30034426 */  addiu      $a0, $s2, 0x330
/* 4CD78 8005F158 EE024686 */  lh         $a2, 0x2EE($s2)
/* 4CD7C 8005F15C 277E010C */  jal        VehPhysForce_RotAxisAngle
/* 4CD80 8005F160 68034526 */   addiu     $a1, $s2, 0x368
/* 4CD84 8005F164 E2034286 */  lh         $v0, 0x3E2($s2)
/* 4CD88 8005F168 00000000 */  nop
/* 4CD8C 8005F16C 48004010 */  beqz       $v0, .L8005F290
/* 4CD90 8005F170 00000000 */   nop
/* 4CD94 8005F174 9E034286 */  lh         $v0, 0x39E($s2)
/* 4CD98 8005F178 2C044386 */  lh         $v1, 0x42C($s2)
/* 4CD9C 8005F17C 00000000 */  nop
/* 4CDA0 8005F180 2A104300 */  slt        $v0, $v0, $v1
/* 4CDA4 8005F184 42004014 */  bnez       $v0, .L8005F290
/* 4CDA8 8005F188 00000000 */   nop
/* 4CDAC 8005F18C C802428E */  lw         $v0, 0x2C8($s2)
/* 4CDB0 8005F190 00000000 */  nop
/* 4CDB4 8005F194 80004230 */  andi       $v0, $v0, 0x80
/* 4CDB8 8005F198 3D004014 */  bnez       $v0, .L8005F290
/* 4CDBC 8005F19C 01000424 */   addiu     $a0, $zero, 0x1
/* 4CDC0 8005F1A0 4C004392 */  lbu        $v1, 0x4C($s2)
/* 4CDC4 8005F1A4 00000000 */  nop
/* 4CDC8 8005F1A8 0F006410 */  beq        $v1, $a0, .L8005F1E8
/* 4CDCC 8005F1AC 02006228 */   slti      $v0, $v1, 0x2
/* 4CDD0 8005F1B0 05004010 */  beqz       $v0, .L8005F1C8
/* 4CDD4 8005F1B4 02000224 */   addiu     $v0, $zero, 0x2
/* 4CDD8 8005F1B8 09006010 */  beqz       $v1, .L8005F1E0
/* 4CDDC 8005F1BC 05000224 */   addiu     $v0, $zero, 0x5
/* 4CDE0 8005F1C0 E97C0108 */  j          .L8005F3A4
/* 4CDE4 8005F1C4 00000000 */   nop
.L8005F1C8:
/* 4CDE8 8005F1C8 74006210 */  beq        $v1, $v0, .L8005F39C
/* 4CDEC 8005F1CC 03000224 */   addiu     $v0, $zero, 0x3
/* 4CDF0 8005F1D0 10006210 */  beq        $v1, $v0, .L8005F214
/* 4CDF4 8005F1D4 0880023C */   lui       $v0, %hi(D_80087EF4)
/* 4CDF8 8005F1D8 E77C0108 */  j          .L8005F39C
/* 4CDFC 8005F1DC 00000000 */   nop
.L8005F1E0:
/* 4CE00 8005F1E0 E67C0108 */  j          .L8005F398
/* 4CE04 8005F1E4 4C0044A2 */   sb        $a0, 0x4C($s2)
.L8005F1E8:
/* 4CE08 8005F1E8 4D004292 */  lbu        $v0, 0x4D($s2)
/* 4CE0C 8005F1EC 0880033C */  lui        $v1, %hi(D_80087F00)
/* 4CE10 8005F1F0 01004224 */  addiu      $v0, $v0, 0x1
/* 4CE14 8005F1F4 4D0042A2 */  sb         $v0, 0x4D($s2)
/* 4CE18 8005F1F8 007F638C */  lw         $v1, %lo(D_80087F00)($v1)
/* 4CE1C 8005F1FC FF004230 */  andi       $v0, $v0, 0xFF
/* 4CE20 8005F200 2A104300 */  slt        $v0, $v0, $v1
/* 4CE24 8005F204 65004014 */  bnez       $v0, .L8005F39C
/* 4CE28 8005F208 02000224 */   addiu     $v0, $zero, 0x2
/* 4CE2C 8005F20C E67C0108 */  j          .L8005F398
/* 4CE30 8005F210 4C0042A2 */   sb        $v0, 0x4C($s2)
.L8005F214:
/* 4CE34 8005F214 F47E4524 */  addiu      $a1, $v0, %lo(D_80087EF4)
/* 4CE38 8005F218 4D004392 */  lbu        $v1, 0x4D($s2)
/* 4CE3C 8005F21C 1C00A28C */  lw         $v0, 0x1C($a1)
/* 4CE40 8005F220 001A0300 */  sll        $v1, $v1, 8
/* 4CE44 8005F224 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 4CE48 8005F228 1A006200 */  div        $zero, $v1, $v0
/* 4CE4C 8005F22C 02004014 */  bnez       $v0, .L8005F238
/* 4CE50 8005F230 00000000 */   nop
/* 4CE54 8005F234 0D000700 */  break      7
.L8005F238:
/* 4CE58 8005F238 FFFF0124 */  addiu      $at, $zero, -0x1
/* 4CE5C 8005F23C 04004114 */  bne        $v0, $at, .L8005F250
/* 4CE60 8005F240 0080013C */   lui       $at, (0x80000000 >> 16)
/* 4CE64 8005F244 02006114 */  bne        $v1, $at, .L8005F250
/* 4CE68 8005F248 00000000 */   nop
/* 4CE6C 8005F24C 0D000600 */  break      6
.L8005F250:
/* 4CE70 8005F250 12180000 */  mflo       $v1
/* 4CE74 8005F254 00010224 */  addiu      $v0, $zero, 0x100
/* 4CE78 8005F258 23804300 */  subu       $s0, $v0, $v1
/* 4CE7C 8005F25C 03000106 */  bgez       $s0, .L8005F26C
/* 4CE80 8005F260 0101022A */   slti      $v0, $s0, 0x101
/* 4CE84 8005F264 21800000 */  addu       $s0, $zero, $zero
/* 4CE88 8005F268 0101022A */  slti       $v0, $s0, 0x101
.L8005F26C:
/* 4CE8C 8005F26C 02004014 */  bnez       $v0, .L8005F278
/* 4CE90 8005F270 00000000 */   nop
/* 4CE94 8005F274 00011024 */  addiu      $s0, $zero, 0x100
.L8005F278:
/* 4CE98 8005F278 0C00A28C */  lw         $v0, 0xC($a1)
/* 4CE9C 8005F27C 00000000 */  nop
/* 4CEA0 8005F280 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 4CEA4 8005F284 18000202 */  mult       $s0, $v0
/* 4CEA8 8005F288 D57C0108 */  j          .L8005F354
/* 4CEAC 8005F28C 4C0044A2 */   sb        $a0, 0x4C($s2)
.L8005F290:
/* 4CEB0 8005F290 4C004292 */  lbu        $v0, 0x4C($s2)
/* 4CEB4 8005F294 00000000 */  nop
/* 4CEB8 8005F298 40004010 */  beqz       $v0, .L8005F39C
/* 4CEBC 8005F29C 21184000 */   addu      $v1, $v0, $zero
/* 4CEC0 8005F2A0 02000224 */  addiu      $v0, $zero, 0x2
/* 4CEC4 8005F2A4 2F006210 */  beq        $v1, $v0, .L8005F364
/* 4CEC8 8005F2A8 03006228 */   slti      $v0, $v1, 0x3
/* 4CECC 8005F2AC 05004010 */  beqz       $v0, .L8005F2C4
/* 4CED0 8005F2B0 01000224 */   addiu     $v0, $zero, 0x1
/* 4CED4 8005F2B4 08006210 */  beq        $v1, $v0, .L8005F2D8
/* 4CED8 8005F2B8 0880023C */   lui       $v0, %hi(D_80087EF4)
/* 4CEDC 8005F2BC E77C0108 */  j          .L8005F39C
/* 4CEE0 8005F2C0 00000000 */   nop
.L8005F2C4:
/* 4CEE4 8005F2C4 03000224 */  addiu      $v0, $zero, 0x3
/* 4CEE8 8005F2C8 29006210 */  beq        $v1, $v0, .L8005F370
/* 4CEEC 8005F2CC 0880033C */   lui       $v1, %hi(D_80087F10)
/* 4CEF0 8005F2D0 E77C0108 */  j          .L8005F39C
/* 4CEF4 8005F2D4 00000000 */   nop
.L8005F2D8:
/* 4CEF8 8005F2D8 F47E4424 */  addiu      $a0, $v0, %lo(D_80087EF4)
/* 4CEFC 8005F2DC 4D004392 */  lbu        $v1, 0x4D($s2)
/* 4CF00 8005F2E0 0C00828C */  lw         $v0, 0xC($a0)
/* 4CF04 8005F2E4 001A0300 */  sll        $v1, $v1, 8
/* 4CF08 8005F2E8 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 4CF0C 8005F2EC 1A006200 */  div        $zero, $v1, $v0
/* 4CF10 8005F2F0 02004014 */  bnez       $v0, .L8005F2FC
/* 4CF14 8005F2F4 00000000 */   nop
/* 4CF18 8005F2F8 0D000700 */  break      7
.L8005F2FC:
/* 4CF1C 8005F2FC FFFF0124 */  addiu      $at, $zero, -0x1
/* 4CF20 8005F300 04004114 */  bne        $v0, $at, .L8005F314
/* 4CF24 8005F304 0080013C */   lui       $at, (0x80000000 >> 16)
/* 4CF28 8005F308 02006114 */  bne        $v1, $at, .L8005F314
/* 4CF2C 8005F30C 00000000 */   nop
/* 4CF30 8005F310 0D000600 */  break      6
.L8005F314:
/* 4CF34 8005F314 12180000 */  mflo       $v1
/* 4CF38 8005F318 00010224 */  addiu      $v0, $zero, 0x100
/* 4CF3C 8005F31C 23804300 */  subu       $s0, $v0, $v1
/* 4CF40 8005F320 03000106 */  bgez       $s0, .L8005F330
/* 4CF44 8005F324 0101022A */   slti      $v0, $s0, 0x101
/* 4CF48 8005F328 21800000 */  addu       $s0, $zero, $zero
/* 4CF4C 8005F32C 0101022A */  slti       $v0, $s0, 0x101
.L8005F330:
/* 4CF50 8005F330 02004014 */  bnez       $v0, .L8005F33C
/* 4CF54 8005F334 00000000 */   nop
/* 4CF58 8005F338 00011024 */  addiu      $s0, $zero, 0x100
.L8005F33C:
/* 4CF5C 8005F33C 1C00828C */  lw         $v0, 0x1C($a0)
/* 4CF60 8005F340 00000000 */  nop
/* 4CF64 8005F344 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 4CF68 8005F348 18000202 */  mult       $s0, $v0
/* 4CF6C 8005F34C 03000224 */  addiu      $v0, $zero, 0x3
/* 4CF70 8005F350 4C0042A2 */  sb         $v0, 0x4C($s2)
.L8005F354:
/* 4CF74 8005F354 12400000 */  mflo       $t0
/* 4CF78 8005F358 03820800 */  sra        $s0, $t0, 8
/* 4CF7C 8005F35C E77C0108 */  j          .L8005F39C
/* 4CF80 8005F360 4D0050A2 */   sb        $s0, 0x4D($s2)
.L8005F364:
/* 4CF84 8005F364 03000224 */  addiu      $v0, $zero, 0x3
/* 4CF88 8005F368 E67C0108 */  j          .L8005F398
/* 4CF8C 8005F36C 4C0042A2 */   sb        $v0, 0x4C($s2)
.L8005F370:
/* 4CF90 8005F370 4D004292 */  lbu        $v0, 0x4D($s2)
/* 4CF94 8005F374 00000000 */  nop
/* 4CF98 8005F378 01004224 */  addiu      $v0, $v0, 0x1
/* 4CF9C 8005F37C 4D0042A2 */  sb         $v0, 0x4D($s2)
/* 4CFA0 8005F380 107F638C */  lw         $v1, %lo(D_80087F10)($v1)
/* 4CFA4 8005F384 FF004230 */  andi       $v0, $v0, 0xFF
/* 4CFA8 8005F388 2A104300 */  slt        $v0, $v0, $v1
/* 4CFAC 8005F38C 03004014 */  bnez       $v0, .L8005F39C
/* 4CFB0 8005F390 00000000 */   nop
/* 4CFB4 8005F394 4C0040A2 */  sb         $zero, 0x4C($s2)
.L8005F398:
/* 4CFB8 8005F398 4D0040A2 */  sb         $zero, 0x4D($s2)
.L8005F39C:
/* 4CFBC 8005F39C 4C004392 */  lbu        $v1, 0x4C($s2)
/* 4CFC0 8005F3A0 05000224 */  addiu      $v0, $zero, 0x5
.L8005F3A4:
/* 4CFC4 8005F3A4 0C006214 */  bne        $v1, $v0, .L8005F3D8
/* 4CFC8 8005F3A8 0880033C */   lui       $v1, %hi(D_80087F20)
/* 4CFCC 8005F3AC 4D004292 */  lbu        $v0, 0x4D($s2)
/* 4CFD0 8005F3B0 00000000 */  nop
/* 4CFD4 8005F3B4 01004224 */  addiu      $v0, $v0, 0x1
/* 4CFD8 8005F3B8 4D0042A2 */  sb         $v0, 0x4D($s2)
/* 4CFDC 8005F3BC 207F638C */  lw         $v1, %lo(D_80087F20)($v1)
/* 4CFE0 8005F3C0 FF004230 */  andi       $v0, $v0, 0xFF
/* 4CFE4 8005F3C4 2A104300 */  slt        $v0, $v0, $v1
/* 4CFE8 8005F3C8 03004014 */  bnez       $v0, .L8005F3D8
/* 4CFEC 8005F3CC 00000000 */   nop
/* 4CFF0 8005F3D0 4C0040A2 */  sb         $zero, 0x4C($s2)
/* 4CFF4 8005F3D4 4D0040A2 */  sb         $zero, 0x4D($s2)
.L8005F3D8:
/* 4CFF8 8005F3D8 4C004292 */  lbu        $v0, 0x4C($s2)
/* 4CFFC 8005F3DC 00000000 */  nop
/* 4D000 8005F3E0 37004010 */  beqz       $v0, .L8005F4C0
/* 4D004 8005F3E4 30006426 */   addiu     $a0, $s3, 0x30
/* 4D008 8005F3E8 30035126 */  addiu      $s1, $s2, 0x330
/* 4D00C 8005F3EC 21184000 */  addu       $v1, $v0, $zero
/* 4D010 8005F3F0 21282002 */  addu       $a1, $s1, $zero
/* 4D014 8005F3F4 C0180300 */  sll        $v1, $v1, 3
/* 4D018 8005F3F8 0880023C */  lui        $v0, %hi(D_80087EF4)
/* 4D01C 8005F3FC F47E4224 */  addiu      $v0, $v0, %lo(D_80087EF4)
/* 4D020 8005F400 21186200 */  addu       $v1, $v1, $v0
/* 4D024 8005F404 4D004292 */  lbu        $v0, 0x4D($s2)
/* 4D028 8005F408 0000708C */  lw         $s0, 0x0($v1)
/* 4D02C 8005F40C 40110200 */  sll        $v0, $v0, 5
/* 4D030 8005F410 21800202 */  addu       $s0, $s0, $v0
/* 4D034 8005F414 ECB0010C */  jal        MatrixRotate
/* 4D038 8005F418 08000626 */   addiu     $a2, $s0, 0x8
/* 4D03C 8005F41C 00002C8E */  lw         $t4, 0x0($s1)
/* 4D040 8005F420 04002D8E */  lw         $t5, 0x4($s1)
/* 4D044 8005F424 0000CC48 */  ctc2       $t4, $0 /* handwritten instruction */
/* 4D048 8005F428 0008CD48 */  ctc2       $t5, $1 /* handwritten instruction */
/* 4D04C 8005F42C 08002C8E */  lw         $t4, 0x8($s1)
/* 4D050 8005F430 0C002D8E */  lw         $t5, 0xC($s1)
/* 4D054 8005F434 10002E8E */  lw         $t6, 0x10($s1)
/* 4D058 8005F438 0010CC48 */  ctc2       $t4, $2 /* handwritten instruction */
/* 4D05C 8005F43C 0018CD48 */  ctc2       $t5, $3 /* handwritten instruction */
/* 4D060 8005F440 0020CE48 */  ctc2       $t6, $4 /* handwritten instruction */
/* 4D064 8005F444 02000286 */  lh         $v0, 0x2($s0)
/* 4D068 8005F448 00000396 */  lhu        $v1, 0x0($s0)
/* 4D06C 8005F44C 00140200 */  sll        $v0, $v0, 16
/* 4D070 8005F450 25186200 */  or         $v1, $v1, $v0
/* 4D074 8005F454 00008348 */  mtc2       $v1, $0 /* handwritten instruction */
/* 4D078 8005F458 04001096 */  lhu        $s0, 0x4($s0)
/* 4D07C 8005F45C 00000000 */  nop
/* 4D080 8005F460 00089048 */  mtc2       $s0, $1 /* handwritten instruction */
/* 4D084 8005F464 00000000 */  nop
/* 4D088 8005F468 00000000 */  nop
/* 4D08C 8005F46C 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 4D090 8005F470 00C80348 */  mfc2       $v1, $25 /* handwritten instruction */
/* 4D094 8005F474 00D01148 */  mfc2       $s1, $26 /* handwritten instruction */
/* 4D098 8005F478 00D80548 */  mfc2       $a1, $27 /* handwritten instruction */
/* 4D09C 8005F47C D402428E */  lw         $v0, 0x2D4($s2)
/* 4D0A0 8005F480 00000000 */  nop
/* 4D0A4 8005F484 21104300 */  addu       $v0, $v0, $v1
/* 4D0A8 8005F488 03120200 */  sra        $v0, $v0, 8
/* 4D0AC 8005F48C 440062AE */  sw         $v0, 0x44($s3)
/* 4D0B0 8005F490 D802438E */  lw         $v1, 0x2D8($s2)
/* 4D0B4 8005F494 77034482 */  lb         $a0, 0x377($s2)
/* 4D0B8 8005F498 21187100 */  addu       $v1, $v1, $s1
/* 4D0BC 8005F49C 031A0300 */  sra        $v1, $v1, 8
/* 4D0C0 8005F4A0 40100400 */  sll        $v0, $a0, 1
/* 4D0C4 8005F4A4 21104400 */  addu       $v0, $v0, $a0
/* 4D0C8 8005F4A8 C3100200 */  sra        $v0, $v0, 3
/* 4D0CC 8005F4AC 21186200 */  addu       $v1, $v1, $v0
/* 4D0D0 8005F4B0 480063AE */  sw         $v1, 0x48($s3)
/* 4D0D4 8005F4B4 DC02428E */  lw         $v0, 0x2DC($s2)
/* 4D0D8 8005F4B8 4C7D0108 */  j          .L8005F530
/* 4D0DC 8005F4BC 21104500 */   addu      $v0, $v0, $a1
.L8005F4C0:
/* 4D0E0 8005F4C0 3003428E */  lw         $v0, 0x330($s2)
/* 4D0E4 8005F4C4 00000000 */  nop
/* 4D0E8 8005F4C8 300062AE */  sw         $v0, 0x30($s3)
/* 4D0EC 8005F4CC 3403428E */  lw         $v0, 0x334($s2)
/* 4D0F0 8005F4D0 00000000 */  nop
/* 4D0F4 8005F4D4 340062AE */  sw         $v0, 0x34($s3)
/* 4D0F8 8005F4D8 3803428E */  lw         $v0, 0x338($s2)
/* 4D0FC 8005F4DC 00000000 */  nop
/* 4D100 8005F4E0 380062AE */  sw         $v0, 0x38($s3)
/* 4D104 8005F4E4 3C03428E */  lw         $v0, 0x33C($s2)
/* 4D108 8005F4E8 00000000 */  nop
/* 4D10C 8005F4EC 3C0062AE */  sw         $v0, 0x3C($s3)
/* 4D110 8005F4F0 40034296 */  lhu        $v0, 0x340($s2)
/* 4D114 8005F4F4 00000000 */  nop
/* 4D118 8005F4F8 400062A6 */  sh         $v0, 0x40($s3)
/* 4D11C 8005F4FC D402428E */  lw         $v0, 0x2D4($s2)
/* 4D120 8005F500 00000000 */  nop
/* 4D124 8005F504 03120200 */  sra        $v0, $v0, 8
/* 4D128 8005F508 440062AE */  sw         $v0, 0x44($s3)
/* 4D12C 8005F50C D802438E */  lw         $v1, 0x2D8($s2)
/* 4D130 8005F510 77034482 */  lb         $a0, 0x377($s2)
/* 4D134 8005F514 031A0300 */  sra        $v1, $v1, 8
/* 4D138 8005F518 40100400 */  sll        $v0, $a0, 1
/* 4D13C 8005F51C 21104400 */  addu       $v0, $v0, $a0
/* 4D140 8005F520 C3100200 */  sra        $v0, $v0, 3
/* 4D144 8005F524 21186200 */  addu       $v1, $v1, $v0
/* 4D148 8005F528 480063AE */  sw         $v1, 0x48($s3)
/* 4D14C 8005F52C DC02428E */  lw         $v0, 0x2DC($s2)
.L8005F530:
/* 4D150 8005F530 00000000 */  nop
/* 4D154 8005F534 03120200 */  sra        $v0, $v0, 8
/* 4D158 8005F538 4C0062AE */  sw         $v0, 0x4C($s3)
/* 4D15C 8005F53C 04044286 */  lh         $v0, 0x404($s2)
/* 4D160 8005F540 00000000 */  nop
/* 4D164 8005F544 1F004010 */  beqz       $v0, .L8005F5C4
/* 4D168 8005F548 00000000 */   nop
/* 4D16C 8005F54C 68034386 */  lh         $v1, 0x368($s2)
/* 4D170 8005F550 00000000 */  nop
/* 4D174 8005F554 80100300 */  sll        $v0, $v1, 2
/* 4D178 8005F558 21104300 */  addu       $v0, $v0, $v1
/* 4D17C 8005F55C 80100200 */  sll        $v0, $v0, 2
/* 4D180 8005F560 23104300 */  subu       $v0, $v0, $v1
/* 4D184 8005F564 4400638E */  lw         $v1, 0x44($s3)
/* 4D188 8005F568 03130200 */  sra        $v0, $v0, 12
/* 4D18C 8005F56C 21186200 */  addu       $v1, $v1, $v0
/* 4D190 8005F570 440063AE */  sw         $v1, 0x44($s3)
/* 4D194 8005F574 6A034386 */  lh         $v1, 0x36A($s2)
/* 4D198 8005F578 00000000 */  nop
/* 4D19C 8005F57C 80100300 */  sll        $v0, $v1, 2
/* 4D1A0 8005F580 21104300 */  addu       $v0, $v0, $v1
/* 4D1A4 8005F584 80100200 */  sll        $v0, $v0, 2
/* 4D1A8 8005F588 23104300 */  subu       $v0, $v0, $v1
/* 4D1AC 8005F58C 4800638E */  lw         $v1, 0x48($s3)
/* 4D1B0 8005F590 03130200 */  sra        $v0, $v0, 12
/* 4D1B4 8005F594 21186200 */  addu       $v1, $v1, $v0
/* 4D1B8 8005F598 480063AE */  sw         $v1, 0x48($s3)
/* 4D1BC 8005F59C 6C034386 */  lh         $v1, 0x36C($s2)
/* 4D1C0 8005F5A0 00000000 */  nop
/* 4D1C4 8005F5A4 80100300 */  sll        $v0, $v1, 2
/* 4D1C8 8005F5A8 21104300 */  addu       $v0, $v0, $v1
/* 4D1CC 8005F5AC 80100200 */  sll        $v0, $v0, 2
/* 4D1D0 8005F5B0 23104300 */  subu       $v0, $v0, $v1
/* 4D1D4 8005F5B4 4C00638E */  lw         $v1, 0x4C($s3)
/* 4D1D8 8005F5B8 03130200 */  sra        $v0, $v0, 12
/* 4D1DC 8005F5BC 21186200 */  addu       $v1, $v1, $v0
/* 4D1E0 8005F5C0 4C0063AE */  sw         $v1, 0x4C($s3)
.L8005F5C4:
/* 4D1E4 8005F5C4 4800628E */  lw         $v0, 0x48($s3)
/* 4D1E8 8005F5C8 00000000 */  nop
/* 4D1EC 8005F5CC 98004104 */  bgez       $v0, .L8005F830
/* 4D1F0 8005F5D0 00000000 */   nop
/* 4D1F4 8005F5D4 B1FF4228 */  slti       $v0, $v0, -0x4F
/* 4D1F8 8005F5D8 94004014 */  bnez       $v0, .L8005F82C
/* 4D1FC 8005F5DC 00000000 */   nop
/* 4D200 8005F5E0 2800628E */  lw         $v0, 0x28($s3)
/* 4D204 8005F5E4 00000000 */  nop
/* 4D208 8005F5E8 00204230 */  andi       $v0, $v0, 0x2000
/* 4D20C 8005F5EC 8F004010 */  beqz       $v0, .L8005F82C
/* 4D210 8005F5F0 00000000 */   nop
/* 4D214 8005F5F4 F804518E */  lw         $s1, 0x4F8($s2)
/* 4D218 8005F5F8 00000000 */  nop
/* 4D21C 8005F5FC A0002012 */  beqz       $s1, .L8005F880
/* 4D220 8005F600 7FFF0324 */   addiu     $v1, $zero, -0x81
/* 4D224 8005F604 2800228E */  lw         $v0, 0x28($s1)
/* 4D228 8005F608 00000000 */  nop
/* 4D22C 8005F60C 24104300 */  and        $v0, $v0, $v1
/* 4D230 8005F610 280022AE */  sw         $v0, 0x28($s1)
/* 4D234 8005F614 50006292 */  lbu        $v0, 0x50($s3)
/* 4D238 8005F618 00000000 */  nop
/* 4D23C 8005F61C 01004224 */  addiu      $v0, $v0, 0x1
/* 4D240 8005F620 500022A2 */  sb         $v0, 0x50($s1)
/* 4D244 8005F624 51006292 */  lbu        $v0, 0x51($s3)
/* 4D248 8005F628 00000000 */  nop
/* 4D24C 8005F62C FFFF4224 */  addiu      $v0, $v0, -0x1
/* 4D250 8005F630 510022A2 */  sb         $v0, 0x51($s1)
/* 4D254 8005F634 4400628E */  lw         $v0, 0x44($s3)
/* 4D258 8005F638 480020AE */  sw         $zero, 0x48($s1)
/* 4D25C 8005F63C 440022AE */  sw         $v0, 0x44($s1)
/* 4D260 8005F640 4C00628E */  lw         $v0, 0x4C($s3)
/* 4D264 8005F644 0880033C */  lui        $v1, %hi(D_800845A0)
/* 4D268 8005F648 4C0022AE */  sw         $v0, 0x4C($s1)
/* 4D26C 8005F64C 9A035086 */  lh         $s0, 0x39A($s2)
/* 4D270 8005F650 A0456324 */  addiu      $v1, $v1, %lo(D_800845A0)
/* 4D274 8005F654 FF030232 */  andi       $v0, $s0, 0x3FF
/* 4D278 8005F658 80100200 */  sll        $v0, $v0, 2
/* 4D27C 8005F65C 21104300 */  addu       $v0, $v0, $v1
/* 4D280 8005F660 0000438C */  lw         $v1, 0x0($v0)
/* 4D284 8005F664 00040232 */  andi       $v0, $s0, 0x400
/* 4D288 8005F668 07004010 */  beqz       $v0, .L8005F688
/* 4D28C 8005F66C 00140300 */   sll       $v0, $v1, 16
/* 4D290 8005F670 03240200 */  sra        $a0, $v0, 16
/* 4D294 8005F674 00080232 */  andi       $v0, $s0, 0x800
/* 4D298 8005F678 09004014 */  bnez       $v0, .L8005F6A0
/* 4D29C 8005F67C 031C0300 */   sra       $v1, $v1, 16
/* 4D2A0 8005F680 A97D0108 */  j          .L8005F6A4
/* 4D2A4 8005F684 23200400 */   negu      $a0, $a0
.L8005F688:
/* 4D2A8 8005F688 03240300 */  sra        $a0, $v1, 16
/* 4D2AC 8005F68C 001C0300 */  sll        $v1, $v1, 16
/* 4D2B0 8005F690 00080232 */  andi       $v0, $s0, 0x800
/* 4D2B4 8005F694 03004010 */  beqz       $v0, .L8005F6A4
/* 4D2B8 8005F698 031C0300 */   sra       $v1, $v1, 16
/* 4D2BC 8005F69C 23200400 */  negu       $a0, $a0
.L8005F6A0:
/* 4D2C0 8005F6A0 23180300 */  negu       $v1, $v1
.L8005F6A4:
/* 4D2C4 8005F6A4 00100524 */  addiu      $a1, $zero, 0x1000
/* 4D2C8 8005F6A8 23100300 */  negu       $v0, $v1
/* 4D2CC 8005F6AC 300024AE */  sw         $a0, 0x30($s1)
/* 4D2D0 8005F6B0 340023AE */  sw         $v1, 0x34($s1)
/* 4D2D4 8005F6B4 380025AE */  sw         $a1, 0x38($s1)
/* 4D2D8 8005F6B8 3C0022AE */  sw         $v0, 0x3C($s1)
/* 4D2DC 8005F6BC 400024A6 */  sh         $a0, 0x40($s1)
/* 4D2E0 8005F6C0 FC044286 */  lh         $v0, 0x4FC($s2)
/* 4D2E4 8005F6C4 00000000 */  nop
/* 4D2E8 8005F6C8 30004014 */  bnez       $v0, .L8005F78C
/* 4D2EC 8005F6CC 00000000 */   nop
/* 4D2F0 8005F6D0 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 4D2F4 8005F6D4 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 4D2F8 8005F6D8 FC0445A6 */  sh         $a1, 0x4FC($s2)
/* 4D2FC 8005F6DC A81C4290 */  lbu        $v0, 0x1CA8($v0)
/* 4D300 8005F6E0 00000000 */  nop
/* 4D304 8005F6E4 0200422C */  sltiu      $v0, $v0, 0x2
/* 4D308 8005F6E8 4A004010 */  beqz       $v0, .L8005F814
/* 4D30C 8005F6EC 00000000 */   nop
/* 4D310 8005F6F0 8C034286 */  lh         $v0, 0x38C($s2)
/* 4D314 8005F6F4 00000000 */  nop
/* 4D318 8005F6F8 02004104 */  bgez       $v0, .L8005F704
/* 4D31C 8005F6FC 00000000 */   nop
/* 4D320 8005F700 23100200 */  negu       $v0, $v0
.L8005F704:
/* 4D324 8005F704 010C4228 */  slti       $v0, $v0, 0xC01
/* 4D328 8005F708 42004014 */  bnez       $v0, .L8005F814
/* 4D32C 8005F70C 00000000 */   nop
/* 4D330 8005F710 E402428E */  lw         $v0, 0x2E4($s2)
/* 4D334 8005F714 00000000 */  nop
/* 4D338 8005F718 01FE4228 */  slti       $v0, $v0, -0x1FF
/* 4D33C 8005F71C 3D004014 */  bnez       $v0, .L8005F814
/* 4D340 8005F720 0A001024 */   addiu     $s0, $zero, 0xA
/* 4D344 8005F724 0980133C */  lui        $s3, %hi(D_80089A94)
.L8005F728:
/* 4D348 8005F728 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 4D34C 8005F72C ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 4D350 8005F730 21200000 */  addu       $a0, $zero, $zero
/* 4D354 8005F734 3821458C */  lw         $a1, 0x2138($v0)
/* 4D358 8005F738 C200010C */  jal        Particle_Init
/* 4D35C 8005F73C 949A6626 */   addiu     $a2, $s3, %lo(D_80089A94)
/* 4D360 8005F740 21184000 */  addu       $v1, $v0, $zero
/* 4D364 8005F744 0C006010 */  beqz       $v1, .L8005F778
/* 4D368 8005F748 00000000 */   nop
/* 4D36C 8005F74C 1C00428E */  lw         $v0, 0x1C($s2)
/* 4D370 8005F750 00000000 */  nop
/* 4D374 8005F754 50004290 */  lbu        $v0, 0x50($v0)
/* 4D378 8005F758 00000000 */  nop
/* 4D37C 8005F75C 180062A0 */  sb         $v0, 0x18($v1)
/* 4D380 8005F760 1C00428E */  lw         $v0, 0x1C($s2)
/* 4D384 8005F764 00000000 */  nop
/* 4D388 8005F768 200062AC */  sw         $v0, 0x20($v1)
/* 4D38C 8005F76C 4A004292 */  lbu        $v0, 0x4A($s2)
/* 4D390 8005F770 00000000 */  nop
/* 4D394 8005F774 190062A0 */  sb         $v0, 0x19($v1)
.L8005F778:
/* 4D398 8005F778 FFFF1026 */  addiu      $s0, $s0, -0x1
/* 4D39C 8005F77C 25000012 */  beqz       $s0, .L8005F814
/* 4D3A0 8005F780 00000000 */   nop
/* 4D3A4 8005F784 CA7D0108 */  j          .L8005F728
/* 4D3A8 8005F788 00000000 */   nop
.L8005F78C:
/* 4D3AC 8005F78C 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 4D3B0 8005F790 ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 4D3B4 8005F794 00000000 */  nop
/* 4D3B8 8005F798 A81C6290 */  lbu        $v0, 0x1CA8($v1)
/* 4D3BC 8005F79C 00000000 */  nop
/* 4D3C0 8005F7A0 0200422C */  sltiu      $v0, $v0, 0x2
/* 4D3C4 8005F7A4 1B004010 */  beqz       $v0, .L8005F814
/* 4D3C8 8005F7A8 00000000 */   nop
/* 4D3CC 8005F7AC 8C034286 */  lh         $v0, 0x38C($s2)
/* 4D3D0 8005F7B0 00000000 */  nop
/* 4D3D4 8005F7B4 02004104 */  bgez       $v0, .L8005F7C0
/* 4D3D8 8005F7B8 00000000 */   nop
/* 4D3DC 8005F7BC 23100200 */  negu       $v0, $v0
.L8005F7C0:
/* 4D3E0 8005F7C0 010C4228 */  slti       $v0, $v0, 0xC01
/* 4D3E4 8005F7C4 13004014 */  bnez       $v0, .L8005F814
/* 4D3E8 8005F7C8 21200000 */   addu      $a0, $zero, $zero
/* 4D3EC 8005F7CC 3821658C */  lw         $a1, 0x2138($v1)
/* 4D3F0 8005F7D0 0980063C */  lui        $a2, %hi(D_80089A94)
/* 4D3F4 8005F7D4 C200010C */  jal        Particle_Init
/* 4D3F8 8005F7D8 949AC624 */   addiu     $a2, $a2, %lo(D_80089A94)
/* 4D3FC 8005F7DC 21184000 */  addu       $v1, $v0, $zero
/* 4D400 8005F7E0 0C006010 */  beqz       $v1, .L8005F814
/* 4D404 8005F7E4 00000000 */   nop
/* 4D408 8005F7E8 1C00428E */  lw         $v0, 0x1C($s2)
/* 4D40C 8005F7EC 00000000 */  nop
/* 4D410 8005F7F0 50004290 */  lbu        $v0, 0x50($v0)
/* 4D414 8005F7F4 00000000 */  nop
/* 4D418 8005F7F8 180062A0 */  sb         $v0, 0x18($v1)
/* 4D41C 8005F7FC 1C00428E */  lw         $v0, 0x1C($s2)
/* 4D420 8005F800 00000000 */  nop
/* 4D424 8005F804 200062AC */  sw         $v0, 0x20($v1)
/* 4D428 8005F808 4A004292 */  lbu        $v0, 0x4A($s2)
/* 4D42C 8005F80C 00000000 */  nop
/* 4D430 8005F810 190062A0 */  sb         $v0, 0x19($v1)
.L8005F814:
/* 4D434 8005F814 FC044296 */  lhu        $v0, 0x4FC($s2)
/* 4D438 8005F818 00000000 */  nop
/* 4D43C 8005F81C 1C0022A6 */  sh         $v0, 0x1C($s1)
/* 4D440 8005F820 FC044296 */  lhu        $v0, 0x4FC($s2)
/* 4D444 8005F824 207E0108 */  j          .L8005F880
/* 4D448 8005F828 200022A6 */   sh        $v0, 0x20($s1)
.L8005F82C:
/* 4D44C 8005F82C 4800628E */  lw         $v0, %lo(D_80090048)($s3)
.L8005F830:
/* 4D450 8005F830 00000000 */  nop
/* 4D454 8005F834 05004018 */  blez       $v0, .L8005F84C
/* 4D458 8005F838 FFDF0324 */   addiu     $v1, $zero, -0x2001
/* 4D45C 8005F83C 2800628E */  lw         $v0, %lo(D_80090028)($s3)
/* 4D460 8005F840 00000000 */  nop
/* 4D464 8005F844 24104300 */  and        $v0, $v0, $v1
/* 4D468 8005F848 280062AE */  sw         $v0, %lo(D_80090028)($s3)
.L8005F84C:
/* 4D46C 8005F84C F804438E */  lw         $v1, 0x4F8($s2)
/* 4D470 8005F850 00000000 */  nop
/* 4D474 8005F854 0A006010 */  beqz       $v1, .L8005F880
/* 4D478 8005F858 00000000 */   nop
/* 4D47C 8005F85C 2800628C */  lw         $v0, 0x28($v1)
/* 4D480 8005F860 00000000 */  nop
/* 4D484 8005F864 80004234 */  ori        $v0, $v0, 0x80
/* 4D488 8005F868 280062AC */  sw         $v0, 0x28($v1)
/* 4D48C 8005F86C FC0440A6 */  sh         $zero, 0x4FC($s2)
/* 4D490 8005F870 1C0060A4 */  sh         $zero, 0x1C($v1)
/* 4D494 8005F874 FC044296 */  lhu        $v0, 0x4FC($s2)
/* 4D498 8005F878 00000000 */  nop
/* 4D49C 8005F87C 200062A4 */  sh         $v0, 0x20($v1)
.L8005F880:
/* 4D4A0 8005F880 2800BF8F */  lw         $ra, 0x28($sp)
/* 4D4A4 8005F884 2400B38F */  lw         $s3, 0x24($sp)
/* 4D4A8 8005F888 2000B28F */  lw         $s2, 0x20($sp)
/* 4D4AC 8005F88C 1C00B18F */  lw         $s1, 0x1C($sp)
/* 4D4B0 8005F890 1800B08F */  lw         $s0, 0x18($sp)
/* 4D4B4 8005F894 0800E003 */  jr         $ra
/* 4D4B8 8005F898 3000BD27 */   addiu     $sp, $sp, 0x30
.size VehPhysForce_TranslateMatrix, . - VehPhysForce_TranslateMatrix
