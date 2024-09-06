.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel DrawTires_Reflection
/* 5CC24 8006F004 801F013C */  lui        $at, (0x1F800048 >> 16)
/* 5CC28 8006F008 000030AC */  sw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 5CC2C 8006F00C 040031AC */  sw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 5CC30 8006F010 080032AC */  sw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 5CC34 8006F014 0C0033AC */  sw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 5CC38 8006F018 100034AC */  sw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 5CC3C 8006F01C 140035AC */  sw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 5CC40 8006F020 180036AC */  sw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 5CC44 8006F024 1C0037AC */  sw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 5CC48 8006F028 20003CAC */  sw         $gp, (0x1F800020 & 0xFFFF)($at)
/* 5CC4C 8006F02C 24003DAC */  sw         $sp, (0x1F800024 & 0xFFFF)($at)
/* 5CC50 8006F030 28003EAC */  sw         $fp, (0x1F800028 & 0xFFFF)($at)
/* 5CC54 8006F034 2C003FAC */  sw         $ra, (0x1F80002C & 0xFFFF)($at)
/* 5CC58 8006F038 300026AC */  sw         $a2, (0x1F800030 & 0xFFFF)($at)
/* 5CC5C 8006F03C FEFFC324 */  addiu      $v1, $a2, -0x2
/* 5CC60 8006F040 0200601C */  bgtz       $v1, .L8006F04C
/* 5CC64 8006F044 00000324 */   addiu     $v1, $zero, 0x0
/* 5CC68 8006F048 02000324 */  addiu      $v1, $zero, 0x2
.L8006F04C:
/* 5CC6C 8006F04C 540023AC */  sw         $v1, (0x1F800054 & 0xFFFF)($at)
/* 5CC70 8006F050 07000324 */  addiu      $v1, $zero, 0x7
/* 5CC74 8006F054 0980083C */  lui        $t0, %hi(D_8008A364)
/* 5CC78 8006F058 64A30825 */  addiu      $t0, $t0, %lo(D_8008A364)
/* 5CC7C 8006F05C 30012924 */  addiu      $t1, $at, %lo(D_1F800130)
.L8006F060:
/* 5CC80 8006F060 00000A8D */  lw         $t2, 0x0($t0)
/* 5CC84 8006F064 04000825 */  addiu      $t0, $t0, 0x4
/* 5CC88 8006F068 00002AAD */  sw         $t2, 0x0($t1)
/* 5CC8C 8006F06C 04002925 */  addiu      $t1, $t1, 0x4
/* 5CC90 8006F070 FBFF6014 */  bnez       $v1, .L8006F060
/* 5CC94 8006F074 FFFF6324 */   addiu     $v1, $v1, -0x1
/* 5CC98 8006F078 0C00A28C */  lw         $v0, 0xC($a1)
/* 5CC9C 8006F07C 1400B08C */  lw         $s0, 0x14($a1)
.L8006F080:
/* 5CCA0 8006F080 3400878C */  lw         $a3, 0x34($a0)
/* 5CCA4 8006F084 30009D8C */  lw         $sp, 0x30($a0)
/* 5CCA8 8006F088 3000268C */  lw         $a2, (0x1F800030 & 0xFFFF)($at)
/* 5CCAC 8006F08C 5600E384 */  lh         $v1, 0x56($a3)
/* 5CCB0 8006F090 21F0E000 */  addu       $fp, $a3, $zero
/* 5CCB4 8006F094 340026AC */  sw         $a2, (0x1F800034 & 0xFFFF)($at)
/* 5CCB8 8006F098 4C0023A4 */  sh         $v1, (0x1F80004C & 0xFFFF)($at)
.L8006F09C:
/* 5CCBC 8006F09C DC00C887 */  lh         $t0, 0xDC($fp)
/* 5CCC0 8006F0A0 DE00C987 */  lh         $t1, 0xDE($fp)
/* 5CCC4 8006F0A4 80400800 */  sll        $t0, $t0, 2
/* 5CCC8 8006F0A8 80480900 */  sll        $t1, $t1, 2
/* 5CCCC 8006F0AC 6C0128A4 */  sh         $t0, (0x1F80016C & 0xFFFF)($at)
/* 5CCD0 8006F0B0 6E0129A4 */  sh         $t1, (0x1F80016E & 0xFFFF)($at)
/* 5CCD4 8006F0B4 B800C88F */  lw         $t0, 0xB8($fp)
/* 5CCD8 8006F0B8 D800C98F */  lw         $t1, 0xD8($fp)
/* 5CCDC 8006F0BC 600128AC */  sw         $t0, (0x1F800160 & 0xFFFF)($at)
/* 5CCE0 8006F0C0 40000331 */  andi       $v1, $t0, 0x40
/* 5CCE4 8006F0C4 1F026010 */  beqz       $v1, .L8006F944
/* 5CCE8 8006F0C8 00400331 */   andi      $v1, $t0, 0x4000
/* 5CCEC 8006F0CC 54002A8C */  lw         $t2, (0x1F800054 & 0xFFFF)($at)
/* 5CCF0 8006F0D0 1C026010 */  beqz       $v1, .L8006F944
/* 5CCF4 8006F0D4 23482A01 */   subu      $t1, $t1, $t2
/* 5CCF8 8006F0D8 1A02201D */  bgtz       $t1, .L8006F944
/* 5CCFC 8006F0DC 7400C68F */   lw        $a2, 0x74($fp)
/* 5CD00 8006F0E0 1C00E384 */  lh         $v1, 0x1C($a3)
/* 5CD04 8006F0E4 1702C010 */  beqz       $a2, .L8006F944
/* 5CD08 8006F0E8 00010331 */   andi      $v1, $t0, 0x100
/* 5CD0C 8006F0EC 802E093C */  lui        $t1, (0x2E808080 >> 16)
/* 5CD10 8006F0F0 0000AA8F */  lw         $t2, 0x0($sp)
/* 5CD14 8006F0F4 02006014 */  bnez       $v1, .L8006F100
/* 5CD18 8006F0F8 80802935 */   ori       $t1, $t1, (0x2E808080 & 0xFFFF)
/* 5CD1C 8006F0FC 0800A98F */  lw         $t1, 0x8($sp)
.L8006F100:
/* 5CD20 8006F100 38002AAC */  sw         $t2, (0x1F800038 & 0xFFFF)($at)
/* 5CD24 8006F104 3C0029AC */  sw         $t1, (0x1F80003C & 0xFFFF)($at)
/* 5CD28 8006F108 90000824 */  addiu      $t0, $zero, 0x90
/* 5CD2C 8006F10C 18006800 */  mult       $v1, $t0
/* 5CD30 8006F110 1E00E384 */  lh         $v1, 0x1E($a3)
/* 5CD34 8006F114 40000824 */  addiu      $t0, $zero, 0x40
/* 5CD38 8006F118 12480000 */  mflo       $t1
/* 5CD3C 8006F11C 034B0900 */  sra        $t1, $t1, 12
/* 5CD40 8006F120 580029A4 */  sh         $t1, (0x1F800058 & 0xFFFF)($at)
/* 5CD44 8006F124 18006800 */  mult       $v1, $t0
/* 5CD48 8006F128 780029A4 */  sh         $t1, (0x1F800078 & 0xFFFF)($at)
/* 5CD4C 8006F12C 22500900 */  neg        $t2, $t1 /* handwritten instruction */
/* 5CD50 8006F130 68002AA4 */  sh         $t2, (0x1F800068 & 0xFFFF)($at)
/* 5CD54 8006F134 88002AA4 */  sh         $t2, (0x1F800088 & 0xFFFF)($at)
/* 5CD58 8006F138 00F02925 */  addiu      $t1, $t1, -0x1000
/* 5CD5C 8006F13C 600029A4 */  sh         $t1, (0x1F800060 & 0xFFFF)($at)
/* 5CD60 8006F140 800029A4 */  sh         $t1, (0x1F800080 & 0xFFFF)($at)
/* 5CD64 8006F144 00104A25 */  addiu      $t2, $t2, 0x1000
/* 5CD68 8006F148 70002AA4 */  sh         $t2, (0x1F800070 & 0xFFFF)($at)
/* 5CD6C 8006F14C 90002AA4 */  sh         $t2, (0x1F800090 & 0xFFFF)($at)
/* 5CD70 8006F150 2000E384 */  lh         $v1, 0x20($a3)
/* 5CD74 8006F154 C7000824 */  addiu      $t0, $zero, 0xC7
/* 5CD78 8006F158 12480000 */  mflo       $t1
/* 5CD7C 8006F15C 034B0900 */  sra        $t1, $t1, 12
/* 5CD80 8006F160 5A0029A4 */  sh         $t1, (0x1F80005A & 0xFFFF)($at)
/* 5CD84 8006F164 18006800 */  mult       $v1, $t0
/* 5CD88 8006F168 620020A4 */  sh         $zero, (0x1F800062 & 0xFFFF)($at)
/* 5CD8C 8006F16C 6A0029A4 */  sh         $t1, (0x1F80006A & 0xFFFF)($at)
/* 5CD90 8006F170 720020A4 */  sh         $zero, (0x1F800072 & 0xFFFF)($at)
/* 5CD94 8006F174 7A0029A4 */  sh         $t1, (0x1F80007A & 0xFFFF)($at)
/* 5CD98 8006F178 820020A4 */  sh         $zero, (0x1F800082 & 0xFFFF)($at)
/* 5CD9C 8006F17C 8A0029A4 */  sh         $t1, (0x1F80008A & 0xFFFF)($at)
/* 5CDA0 8006F180 920020A4 */  sh         $zero, (0x1F800092 & 0xFFFF)($at)
/* 5CDA4 8006F184 A0FF0824 */  addiu      $t0, $zero, -0x60
/* 5CDA8 8006F188 12480000 */  mflo       $t1
/* 5CDAC 8006F18C 034B0900 */  sra        $t1, $t1, 12
/* 5CDB0 8006F190 5C0029AC */  sw         $t1, (0x1F80005C & 0xFFFF)($at)
/* 5CDB4 8006F194 18006800 */  mult       $v1, $t0
/* 5CDB8 8006F198 6C0029AC */  sw         $t1, (0x1F80006C & 0xFFFF)($at)
/* 5CDBC 8006F19C 12480000 */  mflo       $t1
/* 5CDC0 8006F1A0 034B0900 */  sra        $t1, $t1, 12
/* 5CDC4 8006F1A4 7C0029AC */  sw         $t1, (0x1F80007C & 0xFFFF)($at)
/* 5CDC8 8006F1A8 840029AC */  sw         $t1, (0x1F800084 & 0xFFFF)($at)
/* 5CDCC 8006F1AC 8C0029AC */  sw         $t1, (0x1F80008C & 0xFFFF)($at)
/* 5CDD0 8006F1B0 940029AC */  sw         $t1, (0x1F800094 & 0xFFFF)($at)
/* 5CDD4 8006F1B4 E400C38F */  lw         $v1, 0xE4($fp)
/* 5CDD8 8006F1B8 E800C88F */  lw         $t0, 0xE8($fp)
/* 5CDDC 8006F1BC 0400A987 */  lh         $t1, 0x4($sp)
/* 5CDE0 8006F1C0 400023AC */  sw         $v1, (0x1F800040 & 0xFFFF)($at)
/* 5CDE4 8006F1C4 440028AC */  sw         $t0, (0x1F800044 & 0xFFFF)($at)
/* 5CDE8 8006F1C8 480029AC */  sw         $t1, (0x1F800048 & 0xFFFF)($at)
/* 5CDEC 8006F1CC 0600A987 */  lh         $t1, 0x6($sp)
/* 5CDF0 8006F1D0 CCBB010C */  jal        TRIG_AngleSinCos_r9r8r10
/* 5CDF4 8006F1D4 80480900 */   sll       $t1, $t1, 2
/* 5CDF8 8006F1D8 58002384 */  lh         $v1, 0x58($at)
/* 5CDFC 8006F1DC 5C00298C */  lw         $t1, 0x5C($at)
/* 5CE00 8006F1E0 23186A00 */  subu       $v1, $v1, $t2
/* 5CE04 8006F1E4 21482801 */  addu       $t1, $t1, $t0
/* 5CE08 8006F1E8 600023A4 */  sh         $v1, 0x60($at)
/* 5CE0C 8006F1EC 640029AC */  sw         $t1, 0x64($at)
/* 5CE10 8006F1F0 68002384 */  lh         $v1, 0x68($at)
/* 5CE14 8006F1F4 6C00298C */  lw         $t1, 0x6C($at)
/* 5CE18 8006F1F8 21186A00 */  addu       $v1, $v1, $t2
/* 5CE1C 8006F1FC 23482801 */  subu       $t1, $t1, $t0
/* 5CE20 8006F200 0E00AB87 */  lh         $t3, 0xE($sp)
/* 5CE24 8006F204 700023A4 */  sh         $v1, 0x70($at)
/* 5CE28 8006F208 740029AC */  sw         $t1, 0x74($at)
/* 5CE2C 8006F20C 01006831 */  andi       $t0, $t3, 0x1
/* 5CE30 8006F210 09000C24 */  addiu      $t4, $zero, 0x9
/* 5CE34 8006F214 03000011 */  beqz       $t0, .L8006F224
/* 5CE38 8006F218 40590B00 */   sll       $t3, $t3, 5
/* 5CE3C 8006F21C 06000C24 */  addiu      $t4, $zero, 0x6
/* 5CE40 8006F220 40580B00 */  sll        $t3, $t3, 1
.L8006F224:
/* 5CE44 8006F224 CCBB010C */  jal        TRIG_AngleSinCos_r9r8r10
/* 5CE48 8006F228 21486001 */   addu      $t1, $t3, $zero
/* 5CE4C 8006F22C 62002384 */  lh         $v1, 0x62($at)
/* 5CE50 8006F230 64002984 */  lh         $t1, 0x64($at)
/* 5CE54 8006F234 07508A01 */  srav       $t2, $t2, $t4
/* 5CE58 8006F238 07408801 */  srav       $t0, $t0, $t4
/* 5CE5C 8006F23C 21186A00 */  addu       $v1, $v1, $t2
/* 5CE60 8006F240 21482801 */  addu       $t1, $t1, $t0
/* 5CE64 8006F244 620023A4 */  sh         $v1, 0x62($at)
/* 5CE68 8006F248 640029A4 */  sh         $t1, 0x64($at)
/* 5CE6C 8006F24C CCBB010C */  jal        TRIG_AngleSinCos_r9r8r10
/* 5CE70 8006F250 00046925 */   addiu     $t1, $t3, 0x400
/* 5CE74 8006F254 82002384 */  lh         $v1, 0x82($at)
/* 5CE78 8006F258 84002984 */  lh         $t1, 0x84($at)
/* 5CE7C 8006F25C 07508A01 */  srav       $t2, $t2, $t4
/* 5CE80 8006F260 07408801 */  srav       $t0, $t0, $t4
/* 5CE84 8006F264 21186A00 */  addu       $v1, $v1, $t2
/* 5CE88 8006F268 21482801 */  addu       $t1, $t1, $t0
/* 5CE8C 8006F26C 820023A4 */  sh         $v1, 0x82($at)
/* 5CE90 8006F270 840029A4 */  sh         $t1, 0x84($at)
/* 5CE94 8006F274 CCBB010C */  jal        TRIG_AngleSinCos_r9r8r10
/* 5CE98 8006F278 00086925 */   addiu     $t1, $t3, 0x800
/* 5CE9C 8006F27C 72002384 */  lh         $v1, 0x72($at)
/* 5CEA0 8006F280 74002984 */  lh         $t1, 0x74($at)
/* 5CEA4 8006F284 07508A01 */  srav       $t2, $t2, $t4
/* 5CEA8 8006F288 07408801 */  srav       $t0, $t0, $t4
/* 5CEAC 8006F28C 21186A00 */  addu       $v1, $v1, $t2
/* 5CEB0 8006F290 21482801 */  addu       $t1, $t1, $t0
/* 5CEB4 8006F294 720023A4 */  sh         $v1, 0x72($at)
/* 5CEB8 8006F298 740029A4 */  sh         $t1, 0x74($at)
/* 5CEBC 8006F29C CCBB010C */  jal        TRIG_AngleSinCos_r9r8r10
/* 5CEC0 8006F2A0 000C6925 */   addiu     $t1, $t3, 0xC00
/* 5CEC4 8006F2A4 92002384 */  lh         $v1, 0x92($at)
/* 5CEC8 8006F2A8 94002984 */  lh         $t1, 0x94($at)
/* 5CECC 8006F2AC 07508A01 */  srav       $t2, $t2, $t4
/* 5CED0 8006F2B0 07408801 */  srav       $t0, $t0, $t4
/* 5CED4 8006F2B4 21186A00 */  addu       $v1, $v1, $t2
/* 5CED8 8006F2B8 21482801 */  addu       $t1, $t1, $t0
/* 5CEDC 8006F2BC 920023A4 */  sh         $v1, 0x92($at)
/* 5CEE0 8006F2C0 940029A4 */  sh         $t1, 0x94($at)
/* 5CEE4 8006F2C4 3000E38C */  lw         $v1, 0x30($a3)
/* 5CEE8 8006F2C8 3400E88C */  lw         $t0, 0x34($a3)
/* 5CEEC 8006F2CC 3800E98C */  lw         $t1, 0x38($a3)
/* 5CEF0 8006F2D0 0080C348 */  ctc2       $v1, $16 /* handwritten instruction */
/* 5CEF4 8006F2D4 0088C848 */  ctc2       $t0, $17 /* handwritten instruction */
/* 5CEF8 8006F2D8 0090C948 */  ctc2       $t1, $18 /* handwritten instruction */
/* 5CEFC 8006F2DC 3C00E38C */  lw         $v1, 0x3C($a3)
/* 5CF00 8006F2E0 4000E88C */  lw         $t0, 0x40($a3)
/* 5CF04 8006F2E4 0098C348 */  ctc2       $v1, $19 /* handwritten instruction */
/* 5CF08 8006F2E8 00A0C848 */  ctc2       $t0, $20 /* handwritten instruction */
/* 5CF0C 8006F2EC 9800C38F */  lw         $v1, 0x98($fp)
/* 5CF10 8006F2F0 9C00C88F */  lw         $t0, 0x9C($fp)
/* 5CF14 8006F2F4 A000C98F */  lw         $t1, 0xA0($fp)
/* 5CF18 8006F2F8 0040C348 */  ctc2       $v1, $8 /* handwritten instruction */
/* 5CF1C 8006F2FC 0048C848 */  ctc2       $t0, $9 /* handwritten instruction */
/* 5CF20 8006F300 0050C948 */  ctc2       $t1, $10 /* handwritten instruction */
/* 5CF24 8006F304 A400C38F */  lw         $v1, 0xA4($fp)
/* 5CF28 8006F308 A800C88F */  lw         $t0, 0xA8($fp)
/* 5CF2C 8006F30C 0058C348 */  ctc2       $v1, $11 /* handwritten instruction */
/* 5CF30 8006F310 0060C848 */  ctc2       $t0, $12 /* handwritten instruction */
/* 5CF34 8006F314 4400E38C */  lw         $v1, 0x44($a3)
/* 5CF38 8006F318 4800E88C */  lw         $t0, 0x48($a3)
/* 5CF3C 8006F31C 4C00E98C */  lw         $t1, 0x4C($a3)
/* 5CF40 8006F320 4C002A84 */  lh         $t2, 0x4C($at)
/* 5CF44 8006F324 0000D784 */  lh         $s7, 0x0($a2)
/* 5CF48 8006F328 0200D884 */  lh         $t8, 0x2($a2)
/* 5CF4C 8006F32C 0400D984 */  lh         $t9, 0x4($a2)
/* 5CF50 8006F330 23187700 */  subu       $v1, $v1, $s7
/* 5CF54 8006F334 23401801 */  subu       $t0, $t0, $t8
/* 5CF58 8006F338 23483901 */  subu       $t1, $t1, $t9
/* 5CF5C 8006F33C 23505801 */  subu       $t2, $t2, $t8
/* 5CF60 8006F340 80180300 */  sll        $v1, $v1, 2
/* 5CF64 8006F344 80400800 */  sll        $t0, $t0, 2
/* 5CF68 8006F348 80480900 */  sll        $t1, $t1, 2
/* 5CF6C 8006F34C 80500A00 */  sll        $t2, $t2, 2
/* 5CF70 8006F350 0028C348 */  ctc2       $v1, $5 /* handwritten instruction */
/* 5CF74 8006F354 0030C848 */  ctc2       $t0, $6 /* handwritten instruction */
/* 5CF78 8006F358 0038C948 */  ctc2       $t1, $7 /* handwritten instruction */
/* 5CF7C 8006F35C 50002AA4 */  sh         $t2, 0x50($at)
/* 5CF80 8006F360 30003724 */  addiu      $s7, $at, 0x30
/* 5CF84 8006F364 18003824 */  addiu      $t8, $at, 0x18
.L8006F368:
/* 5CF88 8006F368 5800E0CA */  lwc2       $0, 0x58($s7)
/* 5CF8C 8006F36C 5C00E1CA */  lwc2       $1, 0x5C($s7)
/* 5CF90 8006F370 6000E2CA */  lwc2       $2, 0x60($s7)
/* 5CF94 8006F374 6400E3CA */  lwc2       $3, 0x64($s7)
/* 5CF98 8006F378 12004C4A */  MVMVA      1, 2, 0, 0, 0
/* 5CF9C 8006F37C 50002A84 */  lh         $t2, 0x50($at)
/* 5CFA0 8006F380 00480B48 */  mfc2       $t3, $9 /* handwritten instruction */
/* 5CFA4 8006F384 00500C48 */  mfc2       $t4, $10 /* handwritten instruction */
/* 5CFA8 8006F388 00580D48 */  mfc2       $t5, $11 /* handwritten instruction */
/* 5CFAC 8006F38C 23608A01 */  subu       $t4, $t4, $t2
/* 5CFB0 8006F390 23604C01 */  subu       $t4, $t2, $t4
/* 5CFB4 8006F394 2804A04A */  SQR        0
/* 5CFB8 8006F398 5800EBA6 */  sh         $t3, 0x58($s7)
/* 5CFBC 8006F39C 5A00ECA6 */  sh         $t4, 0x5A($s7)
/* 5CFC0 8006F3A0 00C80348 */  mfc2       $v1, $25 /* handwritten instruction */
/* 5CFC4 8006F3A4 00D00848 */  mfc2       $t0, $26 /* handwritten instruction */
/* 5CFC8 8006F3A8 00D80948 */  mfc2       $t1, $27 /* handwritten instruction */
/* 5CFCC 8006F3AC 21A86800 */  addu       $s5, $v1, $t0
/* 5CFD0 8006F3B0 E6BB010C */  jal        func_8006EF98
/* 5CFD4 8006F3B4 21A8A902 */   addu      $s5, $s5, $t1
/* 5CFD8 8006F3B8 01000A3C */  lui        $t2, (0x10000 >> 16)
/* 5CFDC 8006F3BC 1B005601 */  divu       $zero, $t2, $s6
/* 5CFE0 8006F3C0 12E04C4A */  MVMVA      1, 2, 1, 3, 0
/* 5CFE4 8006F3C4 12B00000 */  mflo       $s6
/* 5CFE8 8006F3C8 5C00EDAE */  sw         $t5, 0x5C($s7)
/* 5CFEC 8006F3CC 22B01600 */  neg        $s6, $s6 /* handwritten instruction */
/* 5CFF0 8006F3D0 18007601 */  mult       $t3, $s6
/* 5CFF4 8006F3D4 00480348 */  mfc2       $v1, $9 /* handwritten instruction */
/* 5CFF8 8006F3D8 00500848 */  mfc2       $t0, $10 /* handwritten instruction */
/* 5CFFC 8006F3DC 00580948 */  mfc2       $t1, $11 /* handwritten instruction */
/* 5D000 8006F3E0 22400800 */  neg        $t0, $t0 /* handwritten instruction */
/* 5D004 8006F3E4 12580000 */  mflo       $t3
/* 5D008 8006F3E8 B80003A7 */  sh         $v1, 0xB8($t8)
/* 5D00C 8006F3EC 03590B00 */  sra        $t3, $t3, 4
/* 5D010 8006F3F0 18009601 */  mult       $t4, $s6
/* 5D014 8006F3F4 98000BA7 */  sh         $t3, 0x98($t8)
/* 5D018 8006F3F8 12600000 */  mflo       $t4
/* 5D01C 8006F3FC 03610C00 */  sra        $t4, $t4, 4
/* 5D020 8006F400 BA0008A7 */  sh         $t0, 0xBA($t8)
/* 5D024 8006F404 1800B601 */  mult       $t5, $s6
/* 5D028 8006F408 BC0009AF */  sw         $t1, 0xBC($t8)
/* 5D02C 8006F40C 12680000 */  mflo       $t5
/* 5D030 8006F410 03690D00 */  sra        $t5, $t5, 4
/* 5D034 8006F414 FFFF6B31 */  andi       $t3, $t3, 0xFFFF
/* 5D038 8006F418 FFFF8C31 */  andi       $t4, $t4, 0xFFFF
/* 5D03C 8006F41C 0000CB48 */  ctc2       $t3, $0 /* handwritten instruction */
/* 5D040 8006F420 0010CC48 */  ctc2       $t4, $2 /* handwritten instruction */
/* 5D044 8006F424 0020CD48 */  ctc2       $t5, $4 /* handwritten instruction */
/* 5D048 8006F428 9A000CA7 */  sh         $t4, 0x9A($t8)
/* 5D04C 8006F42C 9C000DAF */  sw         $t5, 0x9C($t8)
/* 5D050 8006F430 0C00784B */  OP         1
/* 5D054 8006F434 00C80B48 */  mfc2       $t3, $25 /* handwritten instruction */
/* 5D058 8006F438 00D00C48 */  mfc2       $t4, $26 /* handwritten instruction */
/* 5D05C 8006F43C 00D80D48 */  mfc2       $t5, $27 /* handwritten instruction */
/* 5D060 8006F440 2804A04A */  SQR        0
/* 5D064 8006F444 00C80348 */  mfc2       $v1, $25 /* handwritten instruction */
/* 5D068 8006F448 00D00848 */  mfc2       $t0, $26 /* handwritten instruction */
/* 5D06C 8006F44C 00D80948 */  mfc2       $t1, $27 /* handwritten instruction */
/* 5D070 8006F450 21A86800 */  addu       $s5, $v1, $t0
/* 5D074 8006F454 E6BB010C */  jal        func_8006EF98
/* 5D078 8006F458 21A8A902 */   addu      $s5, $s5, $t1
/* 5D07C 8006F45C 1A005601 */  div        $zero, $t2, $s6
/* 5D080 8006F460 12B00000 */  mflo       $s6
/* 5D084 8006F464 00000000 */  nop
/* 5D088 8006F468 00000000 */  nop
/* 5D08C 8006F46C 18007601 */  mult       $t3, $s6
/* 5D090 8006F470 12580000 */  mflo       $t3
/* 5D094 8006F474 03590B00 */  sra        $t3, $t3, 4
/* 5D098 8006F478 00488B48 */  mtc2       $t3, $9 /* handwritten instruction */
/* 5D09C 8006F47C 18009601 */  mult       $t4, $s6
/* 5D0A0 8006F480 12600000 */  mflo       $t4
/* 5D0A4 8006F484 03610C00 */  sra        $t4, $t4, 4
/* 5D0A8 8006F488 00508C48 */  mtc2       $t4, $10 /* handwritten instruction */
/* 5D0AC 8006F48C 1800B601 */  mult       $t5, $s6
/* 5D0B0 8006F490 12680000 */  mflo       $t5
/* 5D0B4 8006F494 03690D00 */  sra        $t5, $t5, 4
/* 5D0B8 8006F498 00588D48 */  mtc2       $t5, $11 /* handwritten instruction */
/* 5D0BC 8006F49C 4800238C */  lw         $v1, 0x48($at)
/* 5D0C0 8006F4A0 00000000 */  nop
/* 5D0C4 8006F4A4 0C00784B */  OP         1
/* 5D0C8 8006F4A8 18006301 */  mult       $t3, $v1
/* 5D0CC 8006F4AC 12580000 */  mflo       $t3
/* 5D0D0 8006F4B0 835C0B00 */  sra        $t3, $t3, 18
/* 5D0D4 8006F4B4 D8000BA7 */  sh         $t3, 0xD8($t8)
/* 5D0D8 8006F4B8 18008301 */  mult       $t4, $v1
/* 5D0DC 8006F4BC 12600000 */  mflo       $t4
/* 5D0E0 8006F4C0 83640C00 */  sra        $t4, $t4, 18
/* 5D0E4 8006F4C4 DA000CA7 */  sh         $t4, 0xDA($t8)
/* 5D0E8 8006F4C8 1800A301 */  mult       $t5, $v1
/* 5D0EC 8006F4CC 12680000 */  mflo       $t5
/* 5D0F0 8006F4D0 836C0D00 */  sra        $t5, $t5, 18
/* 5D0F4 8006F4D4 DC000DA7 */  sh         $t5, 0xDC($t8)
/* 5D0F8 8006F4D8 00C80B48 */  mfc2       $t3, $25 /* handwritten instruction */
/* 5D0FC 8006F4DC 00D00C48 */  mfc2       $t4, $26 /* handwritten instruction */
/* 5D100 8006F4E0 00D80D48 */  mfc2       $t5, $27 /* handwritten instruction */
/* 5D104 8006F4E4 2804A04A */  SQR        0
/* 5D108 8006F4E8 00C80348 */  mfc2       $v1, $25 /* handwritten instruction */
/* 5D10C 8006F4EC 00D00848 */  mfc2       $t0, $26 /* handwritten instruction */
/* 5D110 8006F4F0 00D80948 */  mfc2       $t1, $27 /* handwritten instruction */
/* 5D114 8006F4F4 21A86800 */  addu       $s5, $v1, $t0
/* 5D118 8006F4F8 E6BB010C */  jal        func_8006EF98
/* 5D11C 8006F4FC 21A8A902 */   addu      $s5, $s5, $t1
/* 5D120 8006F500 1A005601 */  div        $zero, $t2, $s6
/* 5D124 8006F504 12B00000 */  mflo       $s6
/* 5D128 8006F508 48002A8C */  lw         $t2, 0x48($at)
/* 5D12C 8006F50C 22B01600 */  neg        $s6, $s6 /* handwritten instruction */
/* 5D130 8006F510 18005601 */  mult       $t2, $s6
/* 5D134 8006F514 12B00000 */  mflo       $s6
/* 5D138 8006F518 03B31600 */  sra        $s6, $s6, 12
/* 5D13C 8006F51C 00000000 */  nop
/* 5D140 8006F520 18007601 */  mult       $t3, $s6
/* 5D144 8006F524 12580000 */  mflo       $t3
/* 5D148 8006F528 835A0B00 */  sra        $t3, $t3, 10
/* 5D14C 8006F52C F8000BA7 */  sh         $t3, 0xF8($t8)
/* 5D150 8006F530 18009601 */  mult       $t4, $s6
/* 5D154 8006F534 12600000 */  mflo       $t4
/* 5D158 8006F538 83620C00 */  sra        $t4, $t4, 10
/* 5D15C 8006F53C FA000CA7 */  sh         $t4, 0xFA($t8)
/* 5D160 8006F540 1800B601 */  mult       $t5, $s6
/* 5D164 8006F544 12680000 */  mflo       $t5
/* 5D168 8006F548 836A0D00 */  sra        $t5, $t5, 10
/* 5D16C 8006F54C FC000DA7 */  sh         $t5, 0xFC($t8)
/* 5D170 8006F550 F0FFF726 */  addiu      $s7, $s7, -0x10
/* 5D174 8006F554 2318E102 */  subu       $v1, $s7, $at
/* 5D178 8006F558 83FF6104 */  bgez       $v1, .L8006F368
/* 5D17C 8006F55C F8FF1827 */   addiu     $t8, $t8, -0x8
/* 5D180 8006F560 2800C38C */  lw         $v1, 0x28($a2)
/* 5D184 8006F564 2C00C88C */  lw         $t0, 0x2C($a2)
/* 5D188 8006F568 3000C98C */  lw         $t1, 0x30($a2)
/* 5D18C 8006F56C 0000C348 */  ctc2       $v1, $0 /* handwritten instruction */
/* 5D190 8006F570 0008C848 */  ctc2       $t0, $1 /* handwritten instruction */
/* 5D194 8006F574 0010C948 */  ctc2       $t1, $2 /* handwritten instruction */
/* 5D198 8006F578 3400C38C */  lw         $v1, 0x34($a2)
/* 5D19C 8006F57C 3800C88C */  lw         $t0, 0x38($a2)
/* 5D1A0 8006F580 0018C348 */  ctc2       $v1, $3 /* handwritten instruction */
/* 5D1A4 8006F584 0020C848 */  ctc2       $t0, $4 /* handwritten instruction */
/* 5D1A8 8006F588 0028C048 */  ctc2       $zero, $5 /* handwritten instruction */
/* 5D1AC 8006F58C 0030C048 */  ctc2       $zero, $6 /* handwritten instruction */
/* 5D1B0 8006F590 0038C048 */  ctc2       $zero, $7 /* handwritten instruction */
/* 5D1B4 8006F594 2000C384 */  lh         $v1, 0x20($a2)
/* 5D1B8 8006F598 2200C884 */  lh         $t0, 0x22($a2)
/* 5D1BC 8006F59C 1800C98C */  lw         $t1, 0x18($a2)
/* 5D1C0 8006F5A0 C01B0300 */  sll        $v1, $v1, 15
/* 5D1C4 8006F5A4 C0430800 */  sll        $t0, $t0, 15
/* 5D1C8 8006F5A8 00C0C348 */  ctc2       $v1, $24 /* handwritten instruction */
/* 5D1CC 8006F5AC 00C8C848 */  ctc2       $t0, $25 /* handwritten instruction */
/* 5D1D0 8006F5B0 00D0C948 */  ctc2       $t1, $26 /* handwritten instruction */
/* 5D1D4 8006F5B4 30003724 */  addiu      $s7, $at, 0x30
/* 5D1D8 8006F5B8 18003824 */  addiu      $t8, $at, 0x18
/* 5D1DC 8006F5BC 0C003924 */  addiu      $t9, $at, 0xC
.L8006F5C0:
/* 5D1E0 8006F5C0 5800E386 */  lh         $v1, 0x58($s7)
/* 5D1E4 8006F5C4 D8000887 */  lh         $t0, 0xD8($t8)
/* 5D1E8 8006F5C8 F8000987 */  lh         $t1, 0xF8($t8)
/* 5D1EC 8006F5CC 23886800 */  subu       $s1, $v1, $t0
/* 5D1F0 8006F5D0 23882902 */  subu       $s1, $s1, $t1
/* 5D1F4 8006F5D4 FFFF3132 */  andi       $s1, $s1, 0xFFFF
/* 5D1F8 8006F5D8 5A00E386 */  lh         $v1, 0x5A($s7)
/* 5D1FC 8006F5DC DA000887 */  lh         $t0, 0xDA($t8)
/* 5D200 8006F5E0 FA000987 */  lh         $t1, 0xFA($t8)
/* 5D204 8006F5E4 23906800 */  subu       $s2, $v1, $t0
/* 5D208 8006F5E8 23904902 */  subu       $s2, $s2, $t1
/* 5D20C 8006F5EC 00941200 */  sll        $s2, $s2, 16
/* 5D210 8006F5F0 25883202 */  or         $s1, $s1, $s2
/* 5D214 8006F5F4 00009148 */  mtc2       $s1, $0 /* handwritten instruction */
/* 5D218 8006F5F8 5C00E386 */  lh         $v1, 0x5C($s7)
/* 5D21C 8006F5FC DC000887 */  lh         $t0, 0xDC($t8)
/* 5D220 8006F600 FC000987 */  lh         $t1, 0xFC($t8)
/* 5D224 8006F604 23906800 */  subu       $s2, $v1, $t0
/* 5D228 8006F608 23904902 */  subu       $s2, $s2, $t1
/* 5D22C 8006F60C 00089248 */  mtc2       $s2, $1 /* handwritten instruction */
/* 5D230 8006F610 5800E386 */  lh         $v1, 0x58($s7)
/* 5D234 8006F614 D8000887 */  lh         $t0, 0xD8($t8)
/* 5D238 8006F618 F8000987 */  lh         $t1, 0xF8($t8)
/* 5D23C 8006F61C 21886800 */  addu       $s1, $v1, $t0
/* 5D240 8006F620 23882902 */  subu       $s1, $s1, $t1
/* 5D244 8006F624 FFFF3132 */  andi       $s1, $s1, 0xFFFF
/* 5D248 8006F628 5A00E386 */  lh         $v1, 0x5A($s7)
/* 5D24C 8006F62C DA000887 */  lh         $t0, 0xDA($t8)
/* 5D250 8006F630 FA000987 */  lh         $t1, 0xFA($t8)
/* 5D254 8006F634 21906800 */  addu       $s2, $v1, $t0
/* 5D258 8006F638 23904902 */  subu       $s2, $s2, $t1
/* 5D25C 8006F63C 00941200 */  sll        $s2, $s2, 16
/* 5D260 8006F640 25883202 */  or         $s1, $s1, $s2
/* 5D264 8006F644 00109148 */  mtc2       $s1, $2 /* handwritten instruction */
/* 5D268 8006F648 5C00E386 */  lh         $v1, 0x5C($s7)
/* 5D26C 8006F64C DC000887 */  lh         $t0, 0xDC($t8)
/* 5D270 8006F650 FC000987 */  lh         $t1, 0xFC($t8)
/* 5D274 8006F654 21906800 */  addu       $s2, $v1, $t0
/* 5D278 8006F658 23904902 */  subu       $s2, $s2, $t1
/* 5D27C 8006F65C 00189248 */  mtc2       $s2, $3 /* handwritten instruction */
/* 5D280 8006F660 5800E386 */  lh         $v1, 0x58($s7)
/* 5D284 8006F664 D8000887 */  lh         $t0, 0xD8($t8)
/* 5D288 8006F668 F8000987 */  lh         $t1, 0xF8($t8)
/* 5D28C 8006F66C 23886800 */  subu       $s1, $v1, $t0
/* 5D290 8006F670 21882902 */  addu       $s1, $s1, $t1
/* 5D294 8006F674 FFFF3132 */  andi       $s1, $s1, 0xFFFF
/* 5D298 8006F678 5A00E386 */  lh         $v1, 0x5A($s7)
/* 5D29C 8006F67C DA000887 */  lh         $t0, 0xDA($t8)
/* 5D2A0 8006F680 FA000987 */  lh         $t1, 0xFA($t8)
/* 5D2A4 8006F684 23906800 */  subu       $s2, $v1, $t0
/* 5D2A8 8006F688 21904902 */  addu       $s2, $s2, $t1
/* 5D2AC 8006F68C 00941200 */  sll        $s2, $s2, 16
/* 5D2B0 8006F690 25883202 */  or         $s1, $s1, $s2
/* 5D2B4 8006F694 00209148 */  mtc2       $s1, $4 /* handwritten instruction */
/* 5D2B8 8006F698 5C00E386 */  lh         $v1, 0x5C($s7)
/* 5D2BC 8006F69C DC000887 */  lh         $t0, 0xDC($t8)
/* 5D2C0 8006F6A0 FC000987 */  lh         $t1, 0xFC($t8)
/* 5D2C4 8006F6A4 23906800 */  subu       $s2, $v1, $t0
/* 5D2C8 8006F6A8 21904902 */  addu       $s2, $s2, $t1
/* 5D2CC 8006F6AC 00289248 */  mtc2       $s2, $5 /* handwritten instruction */
/* 5D2D0 8006F6B0 5800E386 */  lh         $v1, 0x58($s7)
/* 5D2D4 8006F6B4 D8000887 */  lh         $t0, 0xD8($t8)
/* 5D2D8 8006F6B8 3000284A */  RTPT
/* 5D2DC 8006F6BC F8000987 */  lh         $t1, 0xF8($t8)
/* 5D2E0 8006F6C0 21886800 */  addu       $s1, $v1, $t0
/* 5D2E4 8006F6C4 21882902 */  addu       $s1, $s1, $t1
/* 5D2E8 8006F6C8 FFFF3132 */  andi       $s1, $s1, 0xFFFF
/* 5D2EC 8006F6CC 5A00E386 */  lh         $v1, 0x5A($s7)
/* 5D2F0 8006F6D0 DA000887 */  lh         $t0, 0xDA($t8)
/* 5D2F4 8006F6D4 FA000987 */  lh         $t1, 0xFA($t8)
/* 5D2F8 8006F6D8 21906800 */  addu       $s2, $v1, $t0
/* 5D2FC 8006F6DC 21904902 */  addu       $s2, $s2, $t1
/* 5D300 8006F6E0 00941200 */  sll        $s2, $s2, 16
/* 5D304 8006F6E4 25883202 */  or         $s1, $s1, $s2
/* 5D308 8006F6E8 1C012CE8 */  swc2       $12, 0x11C($at)
/* 5D30C 8006F6EC 18012DE8 */  swc2       $13, 0x118($at)
/* 5D310 8006F6F0 24012EE8 */  swc2       $14, 0x124($at)
/* 5D314 8006F6F4 00009148 */  mtc2       $s1, $0 /* handwritten instruction */
/* 5D318 8006F6F8 5C00E386 */  lh         $v1, 0x5C($s7)
/* 5D31C 8006F6FC DC000887 */  lh         $t0, 0xDC($t8)
/* 5D320 8006F700 FC000987 */  lh         $t1, 0xFC($t8)
/* 5D324 8006F704 21906800 */  addu       $s2, $v1, $t0
/* 5D328 8006F708 21904902 */  addu       $s2, $s2, $t1
/* 5D32C 8006F70C 00089248 */  mtc2       $s2, $1 /* handwritten instruction */
/* 5D330 8006F710 3C00288C */  lw         $t0, 0x3C($at)
/* 5D334 8006F714 B800038F */  lw         $v1, 0xB8($t8)
/* 5D338 8006F718 0100184A */  RTPS
/* 5D33C 8006F71C 040048AC */  sw         $t0, 0x4($v0)
/* 5D340 8006F720 BC00088F */  lw         $t0, 0xBC($t8)
/* 5D344 8006F724 20012EE8 */  swc2       $14, 0x120($at)
/* 5D348 8006F728 2E00684B */  AVSZ4
/* 5D34C 8006F72C 60012A8C */  lw         $t2, 0x160($at)
/* 5D350 8006F730 44002E8C */  lw         $t6, 0x44($at)
/* 5D354 8006F734 00C00F48 */  mfc2       $t7, $24 /* handwritten instruction */
/* 5D358 8006F738 980000CB */  lwc2       $0, 0x98($t8)
/* 5D35C 8006F73C 9C0001CB */  lwc2       $1, 0x9C($t8)
/* 5D360 8006F740 0040C348 */  ctc2       $v1, $8 /* handwritten instruction */
/* 5D364 8006F744 0048C848 */  ctc2       $t0, $9 /* handwritten instruction */
/* 5D368 8006F748 6C012384 */  lh         $v1, 0x16C($at)
/* 5D36C 8006F74C 6E012884 */  lh         $t0, 0x16E($at)
/* 5D370 8006F750 12604A4A */  MVMVA      1, 1, 0, 3, 0
/* 5D374 8006F754 21186E00 */  addu       $v1, $v1, $t6
/* 5D378 8006F758 21400E01 */  addu       $t0, $t0, $t6
/* 5D37C 8006F75C 700123AC */  sw         $v1, 0x170($at)
/* 5D380 8006F760 740128AC */  sw         $t0, 0x174($at)
/* 5D384 8006F764 427C0F00 */  srl        $t7, $t7, 17
/* 5D388 8006F768 80780F00 */  sll        $t7, $t7, 2
/* 5D38C 8006F76C 2178EE01 */  addu       $t7, $t7, $t6
/* 5D390 8006F770 00480348 */  mfc2       $v1, $9 /* handwritten instruction */
/* 5D394 8006F774 0980083C */  lui        $t0, %hi(D_8008A384)
/* 5D398 8006F778 84A30825 */  addiu      $t0, $t0, %lo(D_8008A384)
/* 5D39C 8006F77C 02006104 */  bgez       $v1, .L8006F788
/* 5D3A0 8006F780 43190300 */   sra       $v1, $v1, 5
/* 5D3A4 8006F784 22180300 */  neg        $v1, $v1 /* handwritten instruction */
.L8006F788:
/* 5D3A8 8006F788 80FF6924 */  addiu      $t1, $v1, -0x80
/* 5D3AC 8006F78C 02002019 */  blez       $t1, .L8006F798
/* 5D3B0 8006F790 21186800 */   addu      $v1, $v1, $t0
/* 5D3B4 8006F794 80000325 */  addiu      $v1, $t0, 0x80
.L8006F798:
/* 5D3B8 8006F798 00006380 */  lb         $v1, 0x0($v1)
/* 5D3BC 8006F79C 3800298C */  lw         $t1, 0x38($at)
/* 5D3C0 8006F7A0 80180300 */  sll        $v1, $v1, 2
/* 5D3C4 8006F7A4 21186900 */  addu       $v1, $v1, $t1
/* 5D3C8 8006F7A8 0000638C */  lw         $v1, 0x0($v1)
/* 5D3CC 8006F7AC 00000000 */  nop
/* 5D3D0 8006F7B0 5F006010 */  beqz       $v1, .L8006F930
/* 5D3D4 8006F7B4 00000000 */   nop
/* 5D3D8 8006F7B8 1400688C */  lw         $t0, 0x14($v1)
/* 5D3DC 8006F7BC 1800698C */  lw         $t1, 0x18($v1)
/* 5D3E0 8006F7C0 1C006A8C */  lw         $t2, 0x1C($v1)
/* 5D3E4 8006F7C4 0C0048AC */  sw         $t0, 0xC($v0)
/* 5D3E8 8006F7C8 00480848 */  mfc2       $t0, $9 /* handwritten instruction */
/* 5D3EC 8006F7CC 140049AC */  sw         $t1, 0x14($v0)
/* 5D3F0 8006F7D0 1C004AAC */  sw         $t2, 0x1C($v0)
/* 5D3F4 8006F7D4 5A00EB86 */  lh         $t3, 0x5A($s7)
/* 5D3F8 8006F7D8 50002C84 */  lh         $t4, 0x50($at)
/* 5D3FC 8006F7DC 82460800 */  srl        $t0, $t0, 26
/* 5D400 8006F7E0 10000831 */  andi       $t0, $t0, 0x10
/* 5D404 8006F7E4 25401901 */  or         $t0, $t0, $t9
/* 5D408 8006F7E8 3001088D */  lw         $t0, 0x130($t0)
/* 5D40C 8006F7EC 02540A00 */  srl        $t2, $t2, 16
/* 5D410 8006F7F0 08000001 */  jr         $t0
/* 5D414 8006F7F4 24004AAC */   sw        $t2, 0x24($v0)
/* 5D418 8006F7F8 2401238C */  lw         $v1, 0x124($at)
/* 5D41C 8006F7FC 1C01288C */  lw         $t0, 0x11C($at)
/* 5D420 8006F800 2001298C */  lw         $t1, 0x120($at)
/* 5D424 8006F804 18012A8C */  lw         $t2, 0x118($at)
/* 5D428 8006F808 2801338C */  lw         $s3, 0x128($at)
/* 5D42C 8006F80C 31000104 */  bgez       $zero, .L8006F8D4
/* 5D430 8006F810 2378F301 */   subu      $t7, $t7, $s3
/* 5D434 8006F814 2001238C */  lw         $v1, 0x120($at)
/* 5D438 8006F818 1801288C */  lw         $t0, 0x118($at)
/* 5D43C 8006F81C 2401298C */  lw         $t1, 0x124($at)
/* 5D440 8006F820 1C012A8C */  lw         $t2, 0x11C($at)
/* 5D444 8006F824 2C01338C */  lw         $s3, 0x12C($at)
/* 5D448 8006F828 2A000104 */  bgez       $zero, .L8006F8D4
/* 5D44C 8006F82C 2378F301 */   subu      $t7, $t7, $s3
/* 5D450 8006F830 2401238C */  lw         $v1, 0x124($at)
/* 5D454 8006F834 1C01288C */  lw         $t0, 0x11C($at)
/* 5D458 8006F838 2001298C */  lw         $t1, 0x120($at)
/* 5D45C 8006F83C 18012A8C */  lw         $t2, 0x118($at)
/* 5D460 8006F840 24000104 */  bgez       $zero, .L8006F8D4
/* 5D464 8006F844 280120AC */   sw        $zero, 0x128($at)
/* 5D468 8006F848 2001238C */  lw         $v1, 0x120($at)
/* 5D46C 8006F84C 1801288C */  lw         $t0, 0x118($at)
/* 5D470 8006F850 2401298C */  lw         $t1, 0x124($at)
/* 5D474 8006F854 1C012A8C */  lw         $t2, 0x11C($at)
/* 5D478 8006F858 1E000104 */  bgez       $zero, .L8006F8D4
/* 5D47C 8006F85C 2C0120AC */   sw        $zero, 0x12C($at)
/* 5D480 8006F860 1C01238C */  lw         $v1, 0x11C($at)
/* 5D484 8006F864 2401288C */  lw         $t0, 0x124($at)
/* 5D488 8006F868 1801298C */  lw         $t1, 0x118($at)
/* 5D48C 8006F86C 20012A8C */  lw         $t2, 0x120($at)
/* 5D490 8006F870 2801338C */  lw         $s3, 0x128($at)
/* 5D494 8006F874 17000104 */  bgez       $zero, .L8006F8D4
/* 5D498 8006F878 2378F301 */   subu      $t7, $t7, $s3
/* 5D49C 8006F87C 1801238C */  lw         $v1, 0x118($at)
/* 5D4A0 8006F880 2001288C */  lw         $t0, 0x120($at)
/* 5D4A4 8006F884 1C01298C */  lw         $t1, 0x11C($at)
/* 5D4A8 8006F888 24012A8C */  lw         $t2, 0x124($at)
/* 5D4AC 8006F88C 2C01338C */  lw         $s3, 0x12C($at)
/* 5D4B0 8006F890 10000104 */  bgez       $zero, .L8006F8D4
/* 5D4B4 8006F894 2378F301 */   subu      $t7, $t7, $s3
/* 5D4B8 8006F898 1C01238C */  lw         $v1, 0x11C($at)
/* 5D4BC 8006F89C 2401288C */  lw         $t0, 0x124($at)
/* 5D4C0 8006F8A0 1801298C */  lw         $t1, 0x118($at)
/* 5D4C4 8006F8A4 20012A8C */  lw         $t2, 0x120($at)
/* 5D4C8 8006F8A8 08001324 */  addiu      $s3, $zero, 0x8
/* 5D4CC 8006F8AC 2378F301 */  subu       $t7, $t7, $s3
/* 5D4D0 8006F8B0 08000104 */  bgez       $zero, .L8006F8D4
/* 5D4D4 8006F8B4 280133AC */   sw        $s3, 0x128($at)
/* 5D4D8 8006F8B8 1801238C */  lw         $v1, 0x118($at)
/* 5D4DC 8006F8BC 2001288C */  lw         $t0, 0x120($at)
/* 5D4E0 8006F8C0 1C01298C */  lw         $t1, 0x11C($at)
/* 5D4E4 8006F8C4 24012A8C */  lw         $t2, 0x124($at)
/* 5D4E8 8006F8C8 08001324 */  addiu      $s3, $zero, 0x8
/* 5D4EC 8006F8CC 2378F301 */  subu       $t7, $t7, $s3
/* 5D4F0 8006F8D0 2C0133AC */  sw         $s3, 0x12C($at)
.L8006F8D4:
/* 5D4F4 8006F8D4 23588B01 */  subu       $t3, $t4, $t3
/* 5D4F8 8006F8D8 15006005 */  bltz       $t3, .L8006F930
/* 5D4FC 8006F8DC 080043AC */   sw        $v1, 0x8($v0)
/* 5D500 8006F8E0 100048AC */  sw         $t0, 0x10($v0)
/* 5D504 8006F8E4 180049AC */  sw         $t1, 0x18($v0)
/* 5D508 8006F8E8 20004AAC */  sw         $t2, 0x20($v0)
/* 5D50C 8006F8EC 7001238C */  lw         $v1, 0x170($at)
/* 5D510 8006F8F0 7401288C */  lw         $t0, 0x174($at)
/* 5D514 8006F8F4 23486F00 */  subu       $t1, $v1, $t7
/* 5D518 8006F8F8 02002019 */  blez       $t1, .L8006F904
/* 5D51C 8006F8FC 23480F01 */   subu      $t1, $t0, $t7
/* 5D520 8006F900 21786000 */  addu       $t7, $v1, $zero
.L8006F904:
/* 5D524 8006F904 02002105 */  bgez       $t1, .L8006F910
/* 5D528 8006F908 00090A3C */   lui       $t2, (0x9000000 >> 16)
/* 5D52C 8006F90C 21780001 */  addu       $t7, $t0, $zero
.L8006F910:
/* 5D530 8006F910 0000E38D */  lw         $v1, 0x0($t7)
/* 5D534 8006F914 00420200 */  sll        $t0, $v0, 8
/* 5D538 8006F918 02420800 */  srl        $t0, $t0, 8
/* 5D53C 8006F91C 25186A00 */  or         $v1, $v1, $t2
/* 5D540 8006F920 000043AC */  sw         $v1, 0x0($v0)
/* 5D544 8006F924 28004224 */  addiu      $v0, $v0, 0x28
/* 5D548 8006F928 0000E8AD */  sw         $t0, 0x0($t7)
/* 5D54C 8006F92C 01001022 */  addi       $s0, $s0, 0x1 /* handwritten instruction */
.L8006F930:
/* 5D550 8006F930 F0FFF726 */  addiu      $s7, $s7, -0x10
/* 5D554 8006F934 F8FF1827 */  addiu      $t8, $t8, -0x8
/* 5D558 8006F938 2318E102 */  subu       $v1, $s7, $at
/* 5D55C 8006F93C 20FF6104 */  bgez       $v1, .L8006F5C0
/* 5D560 8006F940 FCFF3927 */   addiu     $t9, $t9, -0x4
.L8006F944:
/* 5D564 8006F944 3400268C */  lw         $a2, (0x1F800034 & 0xFFFF)($at)
/* 5D568 8006F948 8800DE27 */  addiu      $fp, $fp, 0x88
/* 5D56C 8006F94C FFFFC624 */  addiu      $a2, $a2, -0x1
/* 5D570 8006F950 D2FDC01C */  bgtz       $a2, .L8006F09C
/* 5D574 8006F954 340026AC */   sw        $a2, (0x1F800034 & 0xFFFF)($at)
/* 5D578 8006F958 1000848C */  lw         $a0, 0x10($a0)
/* 5D57C 8006F95C 00000000 */  nop
/* 5D580 8006F960 C7FD8014 */  bnez       $a0, .L8006F080
/* 5D584 8006F964 00000000 */   nop
/* 5D588 8006F968 1400B0AC */  sw         $s0, 0x14($a1)
/* 5D58C 8006F96C 0C00A2AC */  sw         $v0, 0xC($a1)
/* 5D590 8006F970 2C003F8C */  lw         $ra, (0x1F80002C & 0xFFFF)($at)
/* 5D594 8006F974 28003E8C */  lw         $fp, (0x1F800028 & 0xFFFF)($at)
/* 5D598 8006F978 24003D8C */  lw         $sp, (0x1F800024 & 0xFFFF)($at)
/* 5D59C 8006F97C 20003C8C */  lw         $gp, (0x1F800020 & 0xFFFF)($at)
/* 5D5A0 8006F980 1C00378C */  lw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 5D5A4 8006F984 1800368C */  lw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 5D5A8 8006F988 1400358C */  lw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 5D5AC 8006F98C 1000348C */  lw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 5D5B0 8006F990 0C00338C */  lw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 5D5B4 8006F994 0800328C */  lw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 5D5B8 8006F998 0400318C */  lw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 5D5BC 8006F99C 0000308C */  lw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 5D5C0 8006F9A0 0800E003 */  jr         $ra
/* 5D5C4 8006F9A4 00000000 */   nop
.size DrawTires_Reflection, . - DrawTires_Reflection
