.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel RenderLists_Init1P2P
/* 5DA90 8006FE70 801F013C */  lui        $at, (0x1F8000B0 >> 16)
/* 5DA94 8006FE74 300030AC */  sw         $s0, (0x1F800030 & 0xFFFF)($at)
/* 5DA98 8006FE78 340031AC */  sw         $s1, (0x1F800034 & 0xFFFF)($at)
/* 5DA9C 8006FE7C 380032AC */  sw         $s2, (0x1F800038 & 0xFFFF)($at)
/* 5DAA0 8006FE80 3C0033AC */  sw         $s3, (0x1F80003C & 0xFFFF)($at)
/* 5DAA4 8006FE84 400034AC */  sw         $s4, (0x1F800040 & 0xFFFF)($at)
/* 5DAA8 8006FE88 440035AC */  sw         $s5, (0x1F800044 & 0xFFFF)($at)
/* 5DAAC 8006FE8C 480036AC */  sw         $s6, (0x1F800048 & 0xFFFF)($at)
/* 5DAB0 8006FE90 4C0037AC */  sw         $s7, (0x1F80004C & 0xFFFF)($at)
/* 5DAB4 8006FE94 50003CAC */  sw         $gp, (0x1F800050 & 0xFFFF)($at)
/* 5DAB8 8006FE98 54003DAC */  sw         $sp, (0x1F800054 & 0xFFFF)($at)
/* 5DABC 8006FE9C 58003EAC */  sw         $fp, (0x1F800058 & 0xFFFF)($at)
/* 5DAC0 8006FEA0 5C003FAC */  sw         $ra, (0x1F80005C & 0xFFFF)($at)
/* 5DAC4 8006FEA4 800020AC */  sw         $zero, (0x1F800080 & 0xFFFF)($at)
/* 5DAC8 8006FEA8 21102000 */  addu       $v0, $at, $zero
/* 5DACC 8006FEAC 1400A88F */  lw         $t0, 0x14($sp)
/* 5DAD0 8006FEB0 1000AA8F */  lw         $t2, 0x10($sp)
/* 5DAD4 8006FEB4 FFFF0325 */  addiu      $v1, $t0, -0x1
/* 5DAD8 8006FEB8 02006010 */  beqz       $v1, .L8006FEC4
/* 5DADC 8006FEBC 1800298C */   lw        $t1, (0x1F800018 & 0xFFFF)($at)
/* 5DAE0 8006FEC0 40150924 */  addiu      $t1, $zero, 0x1540
.L8006FEC4:
/* 5DAE4 8006FEC4 00000000 */  nop
/* 5DAE8 8006FEC8 A40029AC */  sw         $t1, (0x1F8000A4 & 0xFFFF)($at)
/* 5DAEC 8006FECC 2800CB8C */  lw         $t3, 0x28($a2)
/* 5DAF0 8006FED0 2C00CC8C */  lw         $t4, 0x2C($a2)
/* 5DAF4 8006FED4 3000CD8C */  lw         $t5, 0x30($a2)
/* 5DAF8 8006FED8 3400CE8C */  lw         $t6, 0x34($a2)
/* 5DAFC 8006FEDC 3800CF8C */  lw         $t7, 0x38($a2)
/* 5DB00 8006FEE0 3C00D08C */  lw         $s0, 0x3C($a2)
/* 5DB04 8006FEE4 4000D18C */  lw         $s1, 0x40($a2)
/* 5DB08 8006FEE8 4400D28C */  lw         $s2, 0x44($a2)
/* 5DB0C 8006FEEC 0000CB48 */  ctc2       $t3, $0 /* handwritten instruction */
/* 5DB10 8006FEF0 0008CC48 */  ctc2       $t4, $1 /* handwritten instruction */
/* 5DB14 8006FEF4 0010CD48 */  ctc2       $t5, $2 /* handwritten instruction */
/* 5DB18 8006FEF8 0018CE48 */  ctc2       $t6, $3 /* handwritten instruction */
/* 5DB1C 8006FEFC 0020CF48 */  ctc2       $t7, $4 /* handwritten instruction */
/* 5DB20 8006FF00 0028D048 */  ctc2       $s0, $5 /* handwritten instruction */
/* 5DB24 8006FF04 0030D148 */  ctc2       $s1, $6 /* handwritten instruction */
/* 5DB28 8006FF08 0038D248 */  ctc2       $s2, $7 /* handwritten instruction */
/* 5DB2C 8006FF0C 2000C384 */  lh         $v1, 0x20($a2)
/* 5DB30 8006FF10 2200C884 */  lh         $t0, 0x22($a2)
/* 5DB34 8006FF14 1800C98C */  lw         $t1, 0x18($a2)
/* 5DB38 8006FF18 C01B0300 */  sll        $v1, $v1, 15
/* 5DB3C 8006FF1C C0430800 */  sll        $t0, $t0, 15
/* 5DB40 8006FF20 00C0C348 */  ctc2       $v1, $24 /* handwritten instruction */
/* 5DB44 8006FF24 00C8C848 */  ctc2       $t0, $25 /* handwritten instruction */
/* 5DB48 8006FF28 00D0C948 */  ctc2       $t1, $26 /* handwritten instruction */
/* 5DB4C 8006FF2C A800C624 */  addiu      $a2, $a2, 0xA8
/* 5DB50 8006FF30 4000CB84 */  lh         $t3, 0x40($a2)
/* 5DB54 8006FF34 4200CC84 */  lh         $t4, 0x42($a2)
/* 5DB58 8006FF38 4400CD84 */  lh         $t5, 0x44($a2)
/* 5DB5C 8006FF3C 4600CE84 */  lh         $t6, 0x46($a2)
/* 5DB60 8006FF40 4800CF84 */  lh         $t7, 0x48($a2)
/* 5DB64 8006FF44 4A00D084 */  lh         $s0, 0x4A($a2)
/* 5DB68 8006FF48 0000C38C */  lw         $v1, 0x0($a2)
/* 5DB6C 8006FF4C 0400C88C */  lw         $t0, 0x4($a2)
/* 5DB70 8006FF50 600023AC */  sw         $v1, (0x1F800060 & 0xFFFF)($at)
/* 5DB74 8006FF54 640028AC */  sw         $t0, (0x1F800064 & 0xFFFF)($at)
/* 5DB78 8006FF58 0800C38C */  lw         $v1, 0x8($a2)
/* 5DB7C 8006FF5C 0C00C88C */  lw         $t0, 0xC($a2)
/* 5DB80 8006FF60 680023AC */  sw         $v1, (0x1F800068 & 0xFFFF)($at)
/* 5DB84 8006FF64 6C0028AC */  sw         $t0, (0x1F80006C & 0xFFFF)($at)
/* 5DB88 8006FF68 1000C38C */  lw         $v1, 0x10($a2)
/* 5DB8C 8006FF6C 1400C88C */  lw         $t0, 0x14($a2)
/* 5DB90 8006FF70 700023AC */  sw         $v1, (0x1F800070 & 0xFFFF)($at)
/* 5DB94 8006FF74 740028AC */  sw         $t0, (0x1F800074 & 0xFFFF)($at)
/* 5DB98 8006FF78 1800C38C */  lw         $v1, 0x18($a2)
/* 5DB9C 8006FF7C 1C00C88C */  lw         $t0, 0x1C($a2)
/* 5DBA0 8006FF80 780023AC */  sw         $v1, (0x1F800078 & 0xFFFF)($at)
/* 5DBA4 8006FF84 7C0028AC */  sw         $t0, (0x1F80007C & 0xFFFF)($at)
/* 5DBA8 8006FF88 21908000 */  addu       $s2, $a0, $zero
/* 5DBAC 8006FF8C 2800C38C */  lw         $v1, 0x28($a2)
/* 5DBB0 8006FF90 2C00C88C */  lw         $t0, 0x2C($a2)
/* 5DBB4 8006FF94 3000C98C */  lw         $t1, 0x30($a2)
/* 5DBB8 8006FF98 80180300 */  sll        $v1, $v1, 2
/* 5DBBC 8006FF9C 80400800 */  sll        $t0, $t0, 2
/* 5DBC0 8006FFA0 80480900 */  sll        $t1, $t1, 2
/* 5DBC4 8006FFA4 21186100 */  addu       $v1, $v1, $at
/* 5DBC8 8006FFA8 21400101 */  addu       $t0, $t0, $at
/* 5DBCC 8006FFAC 21482101 */  addu       $t1, $t1, $at
/* 5DBD0 8006FFB0 8400638C */  lw         $v1, (0x1F800084 & 0xFFFF)($v1)
/* 5DBD4 8006FFB4 8400088D */  lw         $t0, (0x1F800084 & 0xFFFF)($t0)
/* 5DBD8 8006FFB8 8400298D */  lw         $t1, (0x1F800084 & 0xFFFF)($t1)
/* 5DBDC 8006FFBC AC0023AC */  sw         $v1, (0x1F8000AC & 0xFFFF)($at)
/* 5DBE0 8006FFC0 B00028AC */  sw         $t0, (0x1F8000B0 & 0xFFFF)($at)
/* 5DBE4 8006FFC4 B40029AC */  sw         $t1, (0x1F8000B4 & 0xFFFF)($at)
/* 5DBE8 8006FFC8 3400C38C */  lw         $v1, 0x34($a2)
/* 5DBEC 8006FFCC 3C00C88C */  lw         $t0, 0x3C($a2)
/* 5DBF0 8006FFD0 80180300 */  sll        $v1, $v1, 2
/* 5DBF4 8006FFD4 80400800 */  sll        $t0, $t0, 2
/* 5DBF8 8006FFD8 21186100 */  addu       $v1, $v1, $at
/* 5DBFC 8006FFDC 21400101 */  addu       $t0, $t0, $at
/* 5DC00 8006FFE0 8400638C */  lw         $v1, (0x1F800084 & 0xFFFF)($v1)
/* 5DC04 8006FFE4 8400088D */  lw         $t0, (0x1F800084 & 0xFFFF)($t0)
/* 5DC08 8006FFE8 B80023AC */  sw         $v1, (0x1F8000B8 & 0xFFFF)($at)
/* 5DC0C 8006FFEC 40000104 */  bgez       $zero, .L800700F0
/* 5DC10 8006FFF0 C00028AC */   sw        $t0, (0x1F8000C0 & 0xFFFF)($at)
.L8006FFF4:
/* 5DC14 8006FFF4 C0005384 */  lh         $s3, (0x1F8000C0 & 0xFFFF)($v0)
/* 5DC18 8006FFF8 F0FF4224 */  addiu      $v0, $v0, %lo(D_1F7FFFF0)
/* 5DC1C 8006FFFC 00406332 */  andi       $v1, $s3, 0x4000
/* 5DC20 80070000 FF3F7332 */  andi       $s3, $s3, 0x3FFF
/* 5DC24 80070004 40911300 */  sll        $s2, $s3, 5
/* 5DC28 80070008 39006010 */  beqz       $v1, .L800700F0
/* 5DC2C 8007000C 21904402 */   addu      $s2, $s2, $a0
/* 5DC30 80070010 00005186 */  lh         $s1, 0x0($s2)
/* 5DC34 80070014 B000378C */  lw         $s7, (0x1F8000B0 & 0xFFFF)($at)
/* 5DC38 80070018 A1C0010C */  jal        func_80070284
/* 5DC3C 8007001C 08001824 */   addiu     $t8, $zero, 0x8
/* 5DC40 80070020 8700201F */  bgtz       $t9, .L80070240
/* 5DC44 80070024 B800378C */   lw        $s7, 0xB8($at)
/* 5DC48 80070028 A1C0010C */  jal        func_80070284
/* 5DC4C 8007002C 18001824 */   addiu     $t8, $zero, 0x18
/* 5DC50 80070030 8300201F */  bgtz       $t9, .L80070240
/* 5DC54 80070034 AC00378C */   lw        $s7, 0xAC($at)
/* 5DC58 80070038 A1C0010C */  jal        func_80070284
/* 5DC5C 8007003C 00001824 */   addiu     $t8, $zero, 0x0
/* 5DC60 80070040 7F00201F */  bgtz       $t9, .L80070240
/* 5DC64 80070044 B400378C */   lw        $s7, 0xB4($at)
/* 5DC68 80070048 A1C0010C */  jal        func_80070284
/* 5DC6C 8007004C 10001824 */   addiu     $t8, $zero, 0x10
/* 5DC70 80070050 7B00201F */  bgtz       $t9, .L80070240
/* 5DC74 80070054 02002332 */   andi      $v1, $s1, 0x2
/* 5DC78 80070058 1C006014 */  bnez       $v1, .L800700CC
/* 5DC7C 8007005C 2400F820 */   addi      $t8, $a3, 0x24 /* handwritten instruction */
/* 5DC80 80070060 20002332 */  andi       $v1, $s1, 0x20
/* 5DC84 80070064 19006014 */  bnez       $v1, .L800700CC
/* 5DC88 80070068 0C00F820 */   addi      $t8, $a3, 0xC /* handwritten instruction */
/* 5DC8C 8007006C C000378C */  lw         $s7, 0xC0($at)
/* 5DC90 80070070 C2C0010C */  jal        func_80070308
/* 5DC94 80070074 00000000 */   nop
/* 5DC98 80070078 A400238C */  lw         $v1, 0xA4($at)
/* 5DC9C 8007007C 00009C48 */  mtc2       $gp, $0 /* handwritten instruction */
/* 5DCA0 80070080 00089E48 */  mtc2       $fp, $1 /* handwritten instruction */
/* 5DCA4 80070084 00000000 */  nop
/* 5DCA8 80070088 00000000 */  nop
/* 5DCAC 8007008C 0100184A */  RTPS
/* 5DCB0 80070090 00980848 */  mfc2       $t0, $19 /* handwritten instruction */
/* 5DCB4 80070094 00000000 */  nop
/* 5DCB8 80070098 23480301 */  subu       $t1, $t0, $v1
/* 5DCBC 8007009C 0B00201D */  bgtz       $t1, .L800700CC
/* 5DCC0 800700A0 2800F820 */   addi      $t8, $a3, 0x28 /* handwritten instruction */
/* 5DCC4 800700A4 80002332 */  andi       $v1, $s1, 0x80
/* 5DCC8 800700A8 08006014 */  bnez       $v1, .L800700CC
/* 5DCCC 800700AC 0400F820 */   addi      $t8, $a3, 0x4 /* handwritten instruction */
/* 5DCD0 800700B0 08002332 */  andi       $v1, $s1, 0x8
/* 5DCD4 800700B4 05006014 */  bnez       $v1, .L800700CC
/* 5DCD8 800700B8 1C00F820 */   addi      $t8, $a3, 0x1C /* handwritten instruction */
/* 5DCDC 800700BC 10002332 */  andi       $v1, $s1, 0x10
/* 5DCE0 800700C0 02006014 */  bnez       $v1, .L800700CC
/* 5DCE4 800700C4 1400F820 */   addi      $t8, $a3, 0x14 /* handwritten instruction */
/* 5DCE8 800700C8 0C00F820 */  addi       $t8, $a3, 0xC /* handwritten instruction */
.L800700CC:
/* 5DCEC 800700CC C0981300 */  sll        $s3, $s3, 3
/* 5DCF0 800700D0 21986A02 */  addu       $s3, $s3, $t2
/* 5DCF4 800700D4 0000178F */  lw         $s7, 0x0($t8)
/* 5DCF8 800700D8 000013AF */  sw         $s3, 0x0($t8)
/* 5DCFC 800700DC 8000238C */  lw         $v1, 0x80($at)
/* 5DD00 800700E0 000077AE */  sw         $s7, 0x0($s3)
/* 5DD04 800700E4 01006324 */  addiu      $v1, $v1, 0x1
/* 5DD08 800700E8 55000104 */  bgez       $zero, .L80070240
/* 5DD0C 800700EC 800023AC */   sw        $v1, 0x80($at)
.L800700F0:
/* 5DD10 800700F0 1800558E */  lw         $s5, 0x18($s2)
/* 5DD14 800700F4 00000000 */  nop
/* 5DD18 800700F8 0080B332 */  andi       $s3, $s5, 0x8000
/* 5DD1C 800700FC 28006016 */  bnez       $s3, .L800701A0
/* 5DD20 80070100 03B41500 */   sra       $s6, $s5, 16
/* 5DD24 80070104 C2181500 */  srl        $v1, $s5, 3
/* 5DD28 80070108 FC076330 */  andi       $v1, $v1, 0x7FC
/* 5DD2C 8007010C 21186500 */  addu       $v1, $v1, $a1
/* 5DD30 80070110 0000748C */  lw         $s4, 0x0($v1)
/* 5DD34 80070114 1F00B332 */  andi       $s3, $s5, 0x1F
/* 5DD38 80070118 04A07402 */  sllv       $s4, $s4, $s3
/* 5DD3C 8007011C 20008106 */  bgez       $s4, .L800701A0
/* 5DD40 80070120 FF3FB232 */   andi      $s2, $s5, 0x3FFF
/* 5DD44 80070124 40911200 */  sll        $s2, $s2, 5
/* 5DD48 80070128 21904402 */  addu       $s2, $s2, $a0
/* 5DD4C 8007012C 0400438E */  lw         $v1, 0x4($s2)
/* 5DD50 80070130 0800488E */  lw         $t0, 0x8($s2)
/* 5DD54 80070134 034C0300 */  sra        $t1, $v1, 16
/* 5DD58 80070138 23482F01 */  subu       $t1, $t1, $t7
/* 5DD5C 8007013C 1800201D */  bgtz       $t1, .L800701A0
/* 5DD60 80070140 004C0300 */   sll       $t1, $v1, 16
/* 5DD64 80070144 034C0900 */  sra        $t1, $t1, 16
/* 5DD68 80070148 23482E01 */  subu       $t1, $t1, $t6
/* 5DD6C 8007014C 1400201D */  bgtz       $t1, .L800701A0
/* 5DD70 80070150 D40043AC */   sw        $v1, 0xD4($v0)
/* 5DD74 80070154 0C00438E */  lw         $v1, 0xC($s2)
/* 5DD78 80070158 034C0800 */  sra        $t1, $t0, 16
/* 5DD7C 8007015C 23486901 */  subu       $t1, $t3, $t1
/* 5DD80 80070160 0F00201D */  bgtz       $t1, .L800701A0
/* 5DD84 80070164 004C0800 */   sll       $t1, $t0, 16
/* 5DD88 80070168 034C0900 */  sra        $t1, $t1, 16
/* 5DD8C 8007016C 23483001 */  subu       $t1, $t1, $s0
/* 5DD90 80070170 0B00201D */  bgtz       $t1, .L800701A0
/* 5DD94 80070174 034C0300 */   sra       $t1, $v1, 16
/* 5DD98 80070178 2348A901 */  subu       $t1, $t5, $t1
/* 5DD9C 8007017C 0800201D */  bgtz       $t1, .L800701A0
/* 5DDA0 80070180 004C0300 */   sll       $t1, $v1, 16
/* 5DDA4 80070184 034C0900 */  sra        $t1, $t1, 16
/* 5DDA8 80070188 23488901 */  subu       $t1, $t4, $t1
/* 5DDAC 8007018C 0400201D */  bgtz       $t1, .L800701A0
/* 5DDB0 80070190 D80048AC */   sw        $t0, 0xD8($v0)
/* 5DDB4 80070194 DC0043AC */  sw         $v1, 0xDC($v0)
/* 5DDB8 80070198 D00055A4 */  sh         $s5, 0xD0($v0)
/* 5DDBC 8007019C 10004224 */  addiu      $v0, $v0, 0x10
.L800701A0:
/* 5DDC0 800701A0 2700C006 */  bltz       $s6, .L80070240
/* 5DDC4 800701A4 C2181600 */   srl       $v1, $s6, 3
/* 5DDC8 800701A8 FC076330 */  andi       $v1, $v1, 0x7FC
/* 5DDCC 800701AC 21186500 */  addu       $v1, $v1, $a1
/* 5DDD0 800701B0 0000748C */  lw         $s4, 0x0($v1)
/* 5DDD4 800701B4 1F00D332 */  andi       $s3, $s6, 0x1F
/* 5DDD8 800701B8 04A07402 */  sllv       $s4, $s4, $s3
/* 5DDDC 800701BC 20008106 */  bgez       $s4, .L80070240
/* 5DDE0 800701C0 FF3FD232 */   andi      $s2, $s6, 0x3FFF
/* 5DDE4 800701C4 40911200 */  sll        $s2, $s2, 5
/* 5DDE8 800701C8 21904402 */  addu       $s2, $s2, $a0
/* 5DDEC 800701CC 0400438E */  lw         $v1, 0x4($s2)
/* 5DDF0 800701D0 0800488E */  lw         $t0, 0x8($s2)
/* 5DDF4 800701D4 034C0300 */  sra        $t1, $v1, 16
/* 5DDF8 800701D8 23482F01 */  subu       $t1, $t1, $t7
/* 5DDFC 800701DC 1800201D */  bgtz       $t1, .L80070240
/* 5DE00 800701E0 004C0300 */   sll       $t1, $v1, 16
/* 5DE04 800701E4 034C0900 */  sra        $t1, $t1, 16
/* 5DE08 800701E8 23482E01 */  subu       $t1, $t1, $t6
/* 5DE0C 800701EC 1400201D */  bgtz       $t1, .L80070240
/* 5DE10 800701F0 D40043AC */   sw        $v1, 0xD4($v0)
/* 5DE14 800701F4 0C00438E */  lw         $v1, 0xC($s2)
/* 5DE18 800701F8 034C0800 */  sra        $t1, $t0, 16
/* 5DE1C 800701FC 23486901 */  subu       $t1, $t3, $t1
/* 5DE20 80070200 0F00201D */  bgtz       $t1, .L80070240
/* 5DE24 80070204 004C0800 */   sll       $t1, $t0, 16
/* 5DE28 80070208 034C0900 */  sra        $t1, $t1, 16
/* 5DE2C 8007020C 23483001 */  subu       $t1, $t1, $s0
/* 5DE30 80070210 0B00201D */  bgtz       $t1, .L80070240
/* 5DE34 80070214 034C0300 */   sra       $t1, $v1, 16
/* 5DE38 80070218 2348A901 */  subu       $t1, $t5, $t1
/* 5DE3C 8007021C 0800201D */  bgtz       $t1, .L80070240
/* 5DE40 80070220 004C0300 */   sll       $t1, $v1, 16
/* 5DE44 80070224 034C0900 */  sra        $t1, $t1, 16
/* 5DE48 80070228 23488901 */  subu       $t1, $t4, $t1
/* 5DE4C 8007022C 0400201D */  bgtz       $t1, .L80070240
/* 5DE50 80070230 D80048AC */   sw        $t0, 0xD8($v0)
/* 5DE54 80070234 DC0043AC */  sw         $v1, 0xDC($v0)
/* 5DE58 80070238 D00056A4 */  sh         $s6, 0xD0($v0)
/* 5DE5C 8007023C 10004224 */  addiu      $v0, $v0, 0x10
.L80070240:
/* 5DE60 80070240 6CFF4114 */  bne        $v0, $at, .L8006FFF4
/* 5DE64 80070244 00000000 */   nop
/* 5DE68 80070248 8000228C */  lw         $v0, (0x1F800080 & 0xFFFF)($at)
/* 5DE6C 8007024C 5C003F8C */  lw         $ra, (0x1F80005C & 0xFFFF)($at)
/* 5DE70 80070250 58003E8C */  lw         $fp, (0x1F800058 & 0xFFFF)($at)
/* 5DE74 80070254 54003D8C */  lw         $sp, (0x1F800054 & 0xFFFF)($at)
/* 5DE78 80070258 50003C8C */  lw         $gp, (0x1F800050 & 0xFFFF)($at)
/* 5DE7C 8007025C 4C00378C */  lw         $s7, (0x1F80004C & 0xFFFF)($at)
/* 5DE80 80070260 4800368C */  lw         $s6, (0x1F800048 & 0xFFFF)($at)
/* 5DE84 80070264 4400358C */  lw         $s5, (0x1F800044 & 0xFFFF)($at)
/* 5DE88 80070268 4000348C */  lw         $s4, (0x1F800040 & 0xFFFF)($at)
/* 5DE8C 8007026C 3C00338C */  lw         $s3, (0x1F80003C & 0xFFFF)($at)
/* 5DE90 80070270 3800328C */  lw         $s2, (0x1F800038 & 0xFFFF)($at)
/* 5DE94 80070274 3400318C */  lw         $s1, (0x1F800034 & 0xFFFF)($at)
/* 5DE98 80070278 3000308C */  lw         $s0, (0x1F800030 & 0xFFFF)($at)
/* 5DE9C 8007027C 0800E003 */  jr         $ra
/* 5DEA0 80070280 00000000 */   nop
.size RenderLists_Init1P2P, . - RenderLists_Init1P2P
