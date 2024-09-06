.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel DecalMP_02
/* 11260 80023640 21588000 */  addu       $t3, $a0, $zero
/* 11264 80023644 A8056925 */  addiu      $t1, $t3, 0x5A8
/* 11268 80023648 21500000 */  addu       $t2, $zero, $zero
/* 1126C 8002364C AE056525 */  addiu      $a1, $t3, 0x5AE
.L80023650:
/* 11270 80023650 0200A38C */  lw         $v1, 0x2($a1)
/* 11274 80023654 00000000 */  nop
/* 11278 80023658 48006010 */  beqz       $v1, .L8002377C
/* 1127C 8002365C 00000000 */   nop
/* 11280 80023660 1A01A680 */  lb         $a2, 0x11A($a1)
/* 11284 80023664 00000000 */  nop
/* 11288 80023668 00110600 */  sll        $v0, $a2, 4
/* 1128C 8002366C 21104600 */  addu       $v0, $v0, $a2
/* 11290 80023670 C0100200 */  sll        $v0, $v0, 3
/* 11294 80023674 74004224 */  addiu      $v0, $v0, 0x74
/* 11298 80023678 21206200 */  addu       $a0, $v1, $v0
/* 1129C 8002367C 4400828C */  lw         $v0, 0x44($a0)
/* 112A0 80023680 40010324 */  addiu      $v1, $zero, 0x140
/* 112A4 80023684 40014230 */  andi       $v0, $v0, 0x140
/* 112A8 80023688 36004314 */  bne        $v0, $v1, .L80023764
/* 112AC 8002368C E8030224 */   addiu     $v0, $zero, 0x3E8
/* 112B0 80023690 0E01A28C */  lw         $v0, 0x10E($a1)
/* 112B4 80023694 00002885 */  lh         $t0, 0x0($t1)
/* 112B8 80023698 C3180200 */  sra        $v1, $v0, 3
/* 112BC 8002369C 02006228 */  slti       $v0, $v1, 0x2
/* 112C0 800236A0 02004010 */  beqz       $v0, .L800236AC
/* 112C4 800236A4 E8030229 */   slti      $v0, $t0, 0x3E8
/* 112C8 800236A8 02000324 */  addiu      $v1, $zero, 0x2
.L800236AC:
/* 112CC 800236AC 0E004010 */  beqz       $v0, .L800236E8
/* 112D0 800236B0 2A106800 */   slt       $v0, $v1, $t0
/* 112D4 800236B4 06004014 */  bnez       $v0, .L800236D0
/* 112D8 800236B8 00000000 */   nop
/* 112DC 800236BC 0E00A38C */  lw         $v1, 0xE($a1)
/* 112E0 800236C0 6400828C */  lw         $v0, 0x64($a0)
/* 112E4 800236C4 00000000 */  nop
/* 112E8 800236C8 1C006210 */  beq        $v1, $v0, .L8002373C
/* 112EC 800236CC 00000000 */   nop
.L800236D0:
/* 112F0 800236D0 EC1C628D */  lw         $v0, 0x1CEC($t3)
/* 112F4 800236D4 00000000 */  nop
/* 112F8 800236D8 26104A00 */  xor        $v0, $v0, $t2
/* 112FC 800236DC 01004230 */  andi       $v0, $v0, 0x1
/* 11300 800236E0 16004010 */  beqz       $v0, .L8002373C
/* 11304 800236E4 00000000 */   nop
.L800236E8:
/* 11308 800236E8 0601A78C */  lw         $a3, 0x106($a1)
/* 1130C 800236EC 01000224 */  addiu      $v0, $zero, 0x1
/* 11310 800236F0 1700E010 */  beqz       $a3, .L80023750
/* 11314 800236F4 0000A2A4 */   sh        $v0, 0x0($a1)
/* 11318 800236F8 0A01A28C */  lw         $v0, 0x10A($a1)
/* 1131C 800236FC 00000000 */  nop
/* 11320 80023700 13004010 */  beqz       $v0, .L80023750
/* 11324 80023704 00190600 */   sll       $v1, $a2, 4
/* 11328 80023708 21186600 */  addu       $v1, $v1, $a2
/* 1132C 8002370C 00190300 */  sll        $v1, $v1, 4
/* 11330 80023710 21186301 */  addu       $v1, $t3, $v1
/* 11334 80023714 5C02628C */  lw         $v0, 0x25C($v1)
/* 11338 80023718 FF00043C */  lui        $a0, (0xFFFFFF >> 16)
/* 1133C 8002371C FC0F428C */  lw         $v0, 0xFFC($v0)
/* 11340 80023720 FFFF8434 */  ori        $a0, $a0, (0xFFFFFF & 0xFFFF)
/* 11344 80023724 0000E2AC */  sw         $v0, 0x0($a3)
/* 11348 80023728 0A01A28C */  lw         $v0, 0x10A($a1)
/* 1134C 8002372C 5C02638C */  lw         $v1, 0x25C($v1)
/* 11350 80023730 24104400 */  and        $v0, $v0, $a0
/* 11354 80023734 D48D0008 */  j          .L80023750
/* 11358 80023738 FC0F62AC */   sw        $v0, 0xFFC($v1)
.L8002373C:
/* 1135C 8002373C 4400828C */  lw         $v0, 0x44($a0)
/* 11360 80023740 00000000 */  nop
/* 11364 80023744 80004234 */  ori        $v0, $v0, 0x80
/* 11368 80023748 440082AC */  sw         $v0, 0x44($a0)
/* 1136C 8002374C 0000A0A4 */  sh         $zero, 0x0($a1)
.L80023750:
/* 11370 80023750 0000628D */  lw         $v0, 0x0($t3)
/* 11374 80023754 00000000 */  nop
/* 11378 80023758 0F004230 */  andi       $v0, $v0, 0xF
/* 1137C 8002375C 02004014 */  bnez       $v0, .L80023768
/* 11380 80023760 01000225 */   addiu     $v0, $t0, 0x1
.L80023764:
/* 11384 80023764 000022A5 */  sh         $v0, 0x0($t1)
.L80023768:
/* 11388 80023768 01004A25 */  addiu      $t2, $t2, 0x1
/* 1138C 8002376C 2801A524 */  addiu      $a1, $a1, 0x128
/* 11390 80023770 0C004229 */  slti       $v0, $t2, 0xC
/* 11394 80023774 B6FF4014 */  bnez       $v0, .L80023650
/* 11398 80023778 28012925 */   addiu     $t1, $t1, 0x128
.L8002377C:
/* 1139C 8002377C 0800E003 */  jr         $ra
/* 113A0 80023780 00000000 */   nop
.size DecalMP_02, . - DecalMP_02
