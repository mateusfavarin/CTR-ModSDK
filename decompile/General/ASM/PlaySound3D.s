.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel PlaySound3D
/* 1CCFC 8002F0DC 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 1CD00 8002F0E0 7000B6AF */  sw         $s6, 0x70($sp)
/* 1CD04 8002F0E4 21B0A000 */  addu       $s6, $a1, $zero
/* 1CD08 8002F0E8 0980053C */  lui        $a1, %hi(D_8008D2AC)
/* 1CD0C 8002F0EC ACD2A58C */  lw         $a1, %lo(D_8008D2AC)($a1)
/* 1CD10 8002F0F0 7400B7AF */  sw         $s7, 0x74($sp)
/* 1CD14 8002F0F4 21B88000 */  addu       $s7, $a0, $zero
/* 1CD18 8002F0F8 6C00B5AF */  sw         $s5, 0x6C($sp)
/* 1CD1C 8002F0FC 28231524 */  addiu      $s5, $zero, 0x2328
/* 1CD20 8002F100 5C00B1AF */  sw         $s1, 0x5C($sp)
/* 1CD24 8002F104 21880000 */  addu       $s1, $zero, $zero
/* 1CD28 8002F108 7800BFAF */  sw         $ra, 0x78($sp)
/* 1CD2C 8002F10C 6800B4AF */  sw         $s4, 0x68($sp)
/* 1CD30 8002F110 6400B3AF */  sw         $s3, 0x64($sp)
/* 1CD34 8002F114 6000B2AF */  sw         $s2, 0x60($sp)
/* 1CD38 8002F118 5800B0AF */  sw         $s0, 0x58($sp)
/* 1CD3C 8002F11C A81CA290 */  lbu        $v0, 0x1CA8($a1)
/* 1CD40 8002F120 00000000 */  nop
/* 1CD44 8002F124 2A004010 */  beqz       $v0, .L8002F1D0
/* 1CD48 8002F128 21A02002 */   addu      $s4, $s1, $zero
/* 1CD4C 8002F12C 21982002 */  addu       $s3, $s1, $zero
/* 1CD50 8002F130 21902002 */  addu       $s2, $s1, $zero
.L8002F134:
/* 1CD54 8002F134 1800A427 */  addiu      $a0, $sp, 0x18
/* 1CD58 8002F138 2128B300 */  addu       $a1, $a1, $s3
/* 1CD5C 8002F13C 6801A384 */  lh         $v1, 0x168($a1)
/* 1CD60 8002F140 4400C28E */  lw         $v0, 0x44($s6)
/* 1CD64 8002F144 21209200 */  addu       $a0, $a0, $s2
/* 1CD68 8002F148 23104300 */  subu       $v0, $v0, $v1
/* 1CD6C 8002F14C 000082AC */  sw         $v0, 0x0($a0)
/* 1CD70 8002F150 6A01A384 */  lh         $v1, 0x16A($a1)
/* 1CD74 8002F154 4800C28E */  lw         $v0, 0x48($s6)
/* 1CD78 8002F158 00000000 */  nop
/* 1CD7C 8002F15C 23104300 */  subu       $v0, $v0, $v1
/* 1CD80 8002F160 040082AC */  sw         $v0, 0x4($a0)
/* 1CD84 8002F164 6C01A384 */  lh         $v1, 0x16C($a1)
/* 1CD88 8002F168 4C00C28E */  lw         $v0, 0x4C($s6)
/* 1CD8C 8002F16C 00000000 */  nop
/* 1CD90 8002F170 23104300 */  subu       $v0, $v0, $v1
/* 1CD94 8002F174 96B9000C */  jal        GTE_GetSquaredLength
/* 1CD98 8002F178 080082AC */   sw        $v0, 0x8($a0)
/* 1CD9C 8002F17C 21204000 */  addu       $a0, $v0, $zero
/* 1CDA0 8002F180 80101100 */  sll        $v0, $s1, 2
/* 1CDA4 8002F184 4800B027 */  addiu      $s0, $sp, 0x48
/* 1CDA8 8002F188 21800202 */  addu       $s0, $s0, $v0
/* 1CDAC 8002F18C 86B1010C */  jal        SquareRoot0_stub
/* 1CDB0 8002F190 000004AE */   sw        $a0, 0x0($s0)
/* 1CDB4 8002F194 21184000 */  addu       $v1, $v0, $zero
/* 1CDB8 8002F198 2B107500 */  sltu       $v0, $v1, $s5
/* 1CDBC 8002F19C 03004010 */  beqz       $v0, .L8002F1AC
/* 1CDC0 8002F1A0 000003AE */   sw        $v1, 0x0($s0)
/* 1CDC4 8002F1A4 21A86000 */  addu       $s5, $v1, $zero
/* 1CDC8 8002F1A8 21A02002 */  addu       $s4, $s1, $zero
.L8002F1AC:
/* 1CDCC 8002F1AC 10017326 */  addiu      $s3, $s3, 0x110
/* 1CDD0 8002F1B0 0980053C */  lui        $a1, %hi(D_8008D2AC)
/* 1CDD4 8002F1B4 ACD2A58C */  lw         $a1, %lo(D_8008D2AC)($a1)
/* 1CDD8 8002F1B8 00000000 */  nop
/* 1CDDC 8002F1BC A81CA290 */  lbu        $v0, 0x1CA8($a1)
/* 1CDE0 8002F1C0 01003126 */  addiu      $s1, $s1, 0x1
/* 1CDE4 8002F1C4 2A102202 */  slt        $v0, $s1, $v0
/* 1CDE8 8002F1C8 DAFF4014 */  bnez       $v0, .L8002F134
/* 1CDEC 8002F1CC 0C005226 */   addiu     $s2, $s2, 0xC
.L8002F1D0:
/* 1CDF0 8002F1D0 28230224 */  addiu      $v0, $zero, 0x2328
/* 1CDF4 8002F1D4 4600A212 */  beq        $s5, $v0, .L8002F2F0
/* 1CDF8 8002F1D8 40101400 */   sll       $v0, $s4, 1
/* 1CDFC 8002F1DC 21105400 */  addu       $v0, $v0, $s4
/* 1CE00 8002F1E0 80100200 */  sll        $v0, $v0, 2
/* 1CE04 8002F1E4 1800B027 */  addiu      $s0, $sp, 0x18
/* 1CE08 8002F1E8 21800202 */  addu       $s0, $s0, $v0
/* 1CE0C 8002F1EC 21280002 */  addu       $a1, $s0, $zero
/* 1CE10 8002F1F0 00211400 */  sll        $a0, $s4, 4
/* 1CE14 8002F1F4 21209400 */  addu       $a0, $a0, $s4
/* 1CE18 8002F1F8 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 1CE1C 8002F1FC ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 1CE20 8002F200 00210400 */  sll        $a0, $a0, 4
/* 1CE24 8002F204 21208200 */  addu       $a0, $a0, $v0
/* 1CE28 8002F208 57B9000C */  jal        GTE_AudioLR_Inst
/* 1CE2C 8002F20C D0018424 */   addiu     $a0, $a0, 0x1D0
/* 1CE30 8002F210 0800058E */  lw         $a1, 0x8($s0)
/* 1CE34 8002F214 0000048E */  lw         $a0, 0x0($s0)
/* 1CE38 8002F218 CFC5010C */  jal        ratan2
/* 1CE3C 8002F21C 23280500 */   negu      $a1, $a1
/* 1CE40 8002F220 00085024 */  addiu      $s0, $v0, 0x800
/* 1CE44 8002F224 00151000 */  sll        $v0, $s0, 20
/* 1CE48 8002F228 23100200 */  negu       $v0, $v0
/* 1CE4C 8002F22C C3850200 */  sra        $s0, $v0, 23
/* 1CE50 8002F230 8100022A */  slti       $v0, $s0, 0x81
/* 1CE54 8002F234 03004014 */  bnez       $v0, .L8002F244
/* 1CE58 8002F238 80FF022A */   slti      $v0, $s0, -0x80
/* 1CE5C 8002F23C 93BC0008 */  j          .L8002F24C
/* 1CE60 8002F240 00010224 */   addiu     $v0, $zero, 0x100
.L8002F244:
/* 1CE64 8002F244 02004010 */  beqz       $v0, .L8002F250
/* 1CE68 8002F248 00FF0224 */   addiu     $v0, $zero, -0x100
.L8002F24C:
/* 1CE6C 8002F24C 23805000 */  subu       $s0, $v0, $s0
.L8002F250:
/* 1CE70 8002F250 80001026 */  addiu      $s0, $s0, 0x80
/* 1CE74 8002F254 03000106 */  bgez       $s0, .L8002F264
/* 1CE78 8002F258 0001022A */   slti      $v0, $s0, 0x100
/* 1CE7C 8002F25C 9CBC0008 */  j          .L8002F270
/* 1CE80 8002F260 21800000 */   addu      $s0, $zero, $zero
.L8002F264:
/* 1CE84 8002F264 03004014 */  bnez       $v0, .L8002F274
/* 1CE88 8002F268 2D01A22E */   sltiu     $v0, $s5, 0x12D
/* 1CE8C 8002F26C FF001024 */  addiu      $s0, $zero, 0xFF
.L8002F270:
/* 1CE90 8002F270 2D01A22E */  sltiu      $v0, $s5, 0x12D
.L8002F274:
/* 1CE94 8002F274 08004014 */  bnez       $v0, .L8002F298
/* 1CE98 8002F278 2120A002 */   addu      $a0, $s5, $zero
/* 1CE9C 8002F27C 1000A0AF */  sw         $zero, 0x10($sp)
/* 1CEA0 8002F280 2C010524 */  addiu      $a1, $zero, 0x12C
/* 1CEA4 8002F284 28230624 */  addiu      $a2, $zero, 0x2328
/* 1CEA8 8002F288 E763010C */  jal        DECOMP_VehCalc_MapToRange
/* 1CEAC 8002F28C FF000724 */   addiu     $a3, $zero, 0xFF
/* 1CEB0 8002F290 A7BC0008 */  j          .L8002F29C
/* 1CEB4 8002F294 21304000 */   addu      $a2, $v0, $zero
.L8002F298:
/* 1CEB8 8002F298 FF000624 */  addiu      $a2, $zero, 0xFF
.L8002F29C:
/* 1CEBC 8002F29C C0101400 */  sll        $v0, $s4, 3
/* 1CEC0 8002F2A0 23105400 */  subu       $v0, $v0, $s4
/* 1CEC4 8002F2A4 C0100200 */  sll        $v0, $v0, 3
/* 1CEC8 8002F2A8 23105400 */  subu       $v0, $v0, $s4
/* 1CECC 8002F2AC 80100200 */  sll        $v0, $v0, 2
/* 1CED0 8002F2B0 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 1CED4 8002F2B4 ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 1CED8 8002F2B8 FFFFE432 */  andi       $a0, $s7, 0xFFFF
/* 1CEDC 8002F2BC 21186200 */  addu       $v1, $v1, $v0
/* 1CEE0 8002F2C0 B414628C */  lw         $v0, 0x14B4($v1)
/* 1CEE4 8002F2C4 01000524 */  addiu      $a1, $zero, 0x1
/* 1CEE8 8002F2C8 12004394 */  lhu        $v1, 0x12($v0)
/* 1CEEC 8002F2CC FF00C230 */  andi       $v0, $a2, 0xFF
/* 1CEF0 8002F2D0 00140200 */  sll        $v0, $v0, 16
/* 1CEF4 8002F2D4 FF000632 */  andi       $a2, $s0, 0xFF
/* 1CEF8 8002F2D8 0080C634 */  ori        $a2, $a2, 0x8000
/* 1CEFC 8002F2DC 80006330 */  andi       $v1, $v1, 0x80
/* 1CF00 8002F2E0 001E0300 */  sll        $v1, $v1, 24
/* 1CF04 8002F2E4 25186200 */  or         $v1, $v1, $v0
/* 1CF08 8002F2E8 34A1000C */  jal        DECOMP_OtherFX_Play_LowLevel
/* 1CF0C 8002F2EC 25306600 */   or        $a2, $v1, $a2
.L8002F2F0:
/* 1CF10 8002F2F0 7800BF8F */  lw         $ra, 0x78($sp)
/* 1CF14 8002F2F4 7400B78F */  lw         $s7, 0x74($sp)
/* 1CF18 8002F2F8 7000B68F */  lw         $s6, 0x70($sp)
/* 1CF1C 8002F2FC 6C00B58F */  lw         $s5, 0x6C($sp)
/* 1CF20 8002F300 6800B48F */  lw         $s4, 0x68($sp)
/* 1CF24 8002F304 6400B38F */  lw         $s3, 0x64($sp)
/* 1CF28 8002F308 6000B28F */  lw         $s2, 0x60($sp)
/* 1CF2C 8002F30C 5C00B18F */  lw         $s1, 0x5C($sp)
/* 1CF30 8002F310 5800B08F */  lw         $s0, 0x58($sp)
/* 1CF34 8002F314 0800E003 */  jr         $ra
/* 1CF38 8002F318 8000BD27 */   addiu     $sp, $sp, 0x80
.size PlaySound3D, . - PlaySound3D
