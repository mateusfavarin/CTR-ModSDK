.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel Draw_KartInWaterMud
/* 59B50 8006BF30 422B0B00 */  srl        $a1, $t3, 13
/* 59B54 8006BF34 F807A530 */  andi       $a1, $a1, 0x7F8
/* 59B58 8006BF38 40190B00 */  sll        $v1, $t3, 5
/* 59B5C 8006BF3C 04006104 */  bgez       $v1, .L8006BF50
/* 59B60 8006BF40 2128A100 */   addu      $a1, $a1, $at
/* 59B64 8006BF44 4001A88C */  lw         $t0, 0x140($a1)
/* 59B68 8006BF48 6C000104 */  bgez       $zero, .L8006C0FC
/* 59B6C 8006BF4C 4401A38C */   lw        $v1, 0x144($a1)
.L8006BF50:
/* 59B70 8006BF50 0600C017 */  bnez       $fp, .L8006BF6C
/* 59B74 8006BF54 0200E832 */   andi      $t0, $s7, 0x2
/* 59B78 8006BF58 0300F726 */  addiu      $s7, $s7, 0x3
/* 59B7C 8006BF5C 50000011 */  beqz       $t0, .L8006C0A0
/* 59B80 8006BF60 FDFFE39A */   lwr       $v1, -0x3($s7)
/* 59B84 8006BF64 4E000104 */  bgez       $zero, .L8006C0A0
/* 59B88 8006BF68 0000E38A */   lwl       $v1, 0x0($s7)
.L8006BF6C:
/* 59B8C 8006BF6C 0000D48F */  lw         $s4, 0x0($fp)
/* 59B90 8006BF70 0400DE27 */  addiu      $fp, $fp, 0x4
/* 59B94 8006BF74 82191400 */  srl        $v1, $s4, 6
/* 59B98 8006BF78 07006330 */  andi       $v1, $v1, 0x7
/* 59B9C 8006BF7C 1F006838 */  xori       $t0, $v1, 0x1F
/* 59BA0 8006BF80 01006324 */  addiu      $v1, $v1, 0x1
/* 59BA4 8006BF84 F8FF6A24 */  addiu      $t2, $v1, -0x8
/* 59BA8 8006BF88 21986302 */  addu       $s3, $s3, $v1
/* 59BAC 8006BF8C 0A00601A */  blez       $s3, .L8006BFB8
/* 59BB0 8006BF90 07481101 */   srav      $t1, $s1, $t0
/* 59BB4 8006BF94 21482002 */  addu       $t1, $s1, $zero
/* 59BB8 8006BF98 0000F18E */  lw         $s1, 0x0($s7)
/* 59BBC 8006BF9C 0400F726 */  addiu      $s7, $s7, 0x4
/* 59BC0 8006BFA0 23187300 */  subu       $v1, $v1, $s3
/* 59BC4 8006BFA4 06187100 */  srlv       $v1, $s1, $v1
/* 59BC8 8006BFA8 25482301 */  or         $t1, $t1, $v1
/* 59BCC 8006BFAC 07480901 */  srav       $t1, $t1, $t0
/* 59BD0 8006BFB0 21186002 */  addu       $v1, $s3, $zero
/* 59BD4 8006BFB4 E0FF7326 */  addiu      $s3, $s3, -0x20
.L8006BFB8:
/* 59BD8 8006BFB8 06004011 */  beqz       $t2, .L8006BFD4
/* 59BDC 8006BFBC 04887100 */   sllv      $s1, $s1, $v1
/* 59BE0 8006BFC0 43461400 */  sra        $t0, $s4, 25
/* 59BE4 8006BFC4 40400800 */  sll        $t0, $t0, 1
/* 59BE8 8006BFC8 58002380 */  lb         $v1, 0x58($at)
/* 59BEC 8006BFCC 21482801 */  addu       $t1, $t1, $t0
/* 59BF0 8006BFD0 21482301 */  addu       $t1, $t1, $v1
.L8006BFD4:
/* 59BF4 8006BFD4 580029A0 */  sb         $t1, 0x58($at)
/* 59BF8 8006BFD8 C2181400 */  srl        $v1, $s4, 3
/* 59BFC 8006BFDC 07006330 */  andi       $v1, $v1, 0x7
/* 59C00 8006BFE0 1F006838 */  xori       $t0, $v1, 0x1F
/* 59C04 8006BFE4 01006324 */  addiu      $v1, $v1, 0x1
/* 59C08 8006BFE8 F8FF6A24 */  addiu      $t2, $v1, -0x8
/* 59C0C 8006BFEC 21986302 */  addu       $s3, $s3, $v1
/* 59C10 8006BFF0 0A00601A */  blez       $s3, .L8006C01C
/* 59C14 8006BFF4 07481101 */   srav      $t1, $s1, $t0
/* 59C18 8006BFF8 21482002 */  addu       $t1, $s1, $zero
/* 59C1C 8006BFFC 0000F18E */  lw         $s1, 0x0($s7)
/* 59C20 8006C000 0400F726 */  addiu      $s7, $s7, 0x4
/* 59C24 8006C004 23187300 */  subu       $v1, $v1, $s3
/* 59C28 8006C008 06187100 */  srlv       $v1, $s1, $v1
/* 59C2C 8006C00C 25482301 */  or         $t1, $t1, $v1
/* 59C30 8006C010 07480901 */  srav       $t1, $t1, $t0
/* 59C34 8006C014 21186002 */  addu       $v1, $s3, $zero
/* 59C38 8006C018 E0FF7326 */  addiu      $s3, $s3, -0x20
.L8006C01C:
/* 59C3C 8006C01C 06004011 */  beqz       $t2, .L8006C038
/* 59C40 8006C020 04887100 */   sllv      $s1, $s1, $v1
/* 59C44 8006C024 C0411400 */  sll        $t0, $s4, 7
/* 59C48 8006C028 03460800 */  sra        $t0, $t0, 24
/* 59C4C 8006C02C 5A002380 */  lb         $v1, 0x5A($at)
/* 59C50 8006C030 21482801 */  addu       $t1, $t1, $t0
/* 59C54 8006C034 21482301 */  addu       $t1, $t1, $v1
.L8006C038:
/* 59C58 8006C038 5A0029A0 */  sb         $t1, 0x5A($at)
/* 59C5C 8006C03C 07008332 */  andi       $v1, $s4, 0x7
/* 59C60 8006C040 1F006838 */  xori       $t0, $v1, 0x1F
/* 59C64 8006C044 01006324 */  addiu      $v1, $v1, 0x1
/* 59C68 8006C048 F8FF6A24 */  addiu      $t2, $v1, -0x8
/* 59C6C 8006C04C 21986302 */  addu       $s3, $s3, $v1
/* 59C70 8006C050 0A00601A */  blez       $s3, .L8006C07C
/* 59C74 8006C054 07481101 */   srav      $t1, $s1, $t0
/* 59C78 8006C058 21482002 */  addu       $t1, $s1, $zero
/* 59C7C 8006C05C 0000F18E */  lw         $s1, 0x0($s7)
/* 59C80 8006C060 0400F726 */  addiu      $s7, $s7, 0x4
/* 59C84 8006C064 23187300 */  subu       $v1, $v1, $s3
/* 59C88 8006C068 06187100 */  srlv       $v1, $s1, $v1
/* 59C8C 8006C06C 25482301 */  or         $t1, $t1, $v1
/* 59C90 8006C070 07480901 */  srav       $t1, $t1, $t0
/* 59C94 8006C074 21186002 */  addu       $v1, $s3, $zero
/* 59C98 8006C078 E0FF7326 */  addiu      $s3, $s3, -0x20
.L8006C07C:
/* 59C9C 8006C07C 06004011 */  beqz       $t2, .L8006C098
/* 59CA0 8006C080 04887100 */   sllv      $s1, $s1, $v1
/* 59CA4 8006C084 C0431400 */  sll        $t0, $s4, 15
/* 59CA8 8006C088 03460800 */  sra        $t0, $t0, 24
/* 59CAC 8006C08C 59002380 */  lb         $v1, 0x59($at)
/* 59CB0 8006C090 21482801 */  addu       $t1, $t1, $t0
/* 59CB4 8006C094 21482301 */  addu       $t1, $t1, $v1
.L8006C098:
/* 59CB8 8006C098 590029A0 */  sb         $t1, 0x59($at)
/* 59CBC 8006C09C 5800238C */  lw         $v1, 0x58($at)
.L8006C0A0:
/* 59CC0 8006C0A0 30002A8C */  lw         $t2, 0x30($at)
/* 59CC4 8006C0A4 24406C00 */  and        $t0, $v1, $t4
/* 59CC8 8006C0A8 21400A01 */  addu       $t0, $t0, $t2
/* 59CCC 8006C0AC 80400800 */  sll        $t0, $t0, 2
/* 59CD0 8006C0B0 24400D01 */  and        $t0, $t0, $t5
/* 59CD4 8006C0B4 34002A8C */  lw         $t2, 0x34($at)
/* 59CD8 8006C0B8 021A0300 */  srl        $v1, $v1, 8
/* 59CDC 8006C0BC FF006330 */  andi       $v1, $v1, 0xFF
/* 59CE0 8006C0C0 21186A00 */  addu       $v1, $v1, $t2
/* 59CE4 8006C0C4 80180300 */  sll        $v1, $v1, 2
/* 59CE8 8006C0C8 00008848 */  mtc2       $t0, $0 /* handwritten instruction */
/* 59CEC 8006C0CC 00088348 */  mtc2       $v1, $1 /* handwritten instruction */
/* 59CF0 8006C0D0 00000000 */  nop
/* 59CF4 8006C0D4 00000000 */  nop
/* 59CF8 8006C0D8 12604A4A */  MVMVA      1, 1, 0, 3, 0
/* 59CFC 8006C0DC 00580348 */  mfc2       $v1, $11 /* handwritten instruction */
/* 59D00 8006C0E0 00500848 */  mfc2       $t0, $10 /* handwritten instruction */
/* 59D04 8006C0E4 00480948 */  mfc2       $t1, $9 /* handwritten instruction */
/* 59D08 8006C0E8 00440800 */  sll        $t0, $t0, 16
/* 59D0C 8006C0EC FFFF2931 */  andi       $t1, $t1, 0xFFFF
/* 59D10 8006C0F0 25400901 */  or         $t0, $t0, $t1
/* 59D14 8006C0F4 4001A8AC */  sw         $t0, 0x140($a1)
/* 59D18 8006C0F8 4401A3AC */  sw         $v1, 0x144($a1)
.L8006C0FC:
/* 59D1C 8006C0FC C2490B00 */  srl        $t1, $t3, 7
/* 59D20 8006C100 00510B00 */  sll        $t2, $t3, 4
/* 59D24 8006C104 04004005 */  bltz       $t2, .L8006C118
/* 59D28 8006C108 FC012931 */   andi      $t1, $t1, 0x1FC
/* 59D2C 8006C10C 21483C01 */  addu       $t1, $t1, $gp
/* 59D30 8006C110 0800E003 */  jr         $ra
/* 59D34 8006C114 0000298D */   lw        $t1, 0x0($t1)
.L8006C118:
/* 59D38 8006C118 21482101 */  addu       $t1, $t1, $at
/* 59D3C 8006C11C 0800E003 */  jr         $ra
/* 59D40 8006C120 4001298D */   lw        $t1, 0x140($t1)
.size Draw_KartInWaterMud, . - Draw_KartInWaterMud
