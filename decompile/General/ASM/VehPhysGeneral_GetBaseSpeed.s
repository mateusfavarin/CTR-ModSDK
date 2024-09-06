.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel VehPhysGeneral_GetBaseSpeed
/* 4F0A8 80061488 21308000 */  addu       $a2, $a0, $zero
/* 4F0AC 8006148C 3000C780 */  lb         $a3, 0x30($a2)
/* 4F0B0 80061490 00000000 */  nop
/* 4F0B4 80061494 0A00E228 */  slti       $v0, $a3, 0xA
/* 4F0B8 80061498 02004014 */  bnez       $v0, .L800614A4
/* 4F0BC 8006149C 00000000 */   nop
/* 4F0C0 800614A0 09000724 */  addiu      $a3, $zero, 0x9
.L800614A4:
/* 4F0C4 800614A4 3500C880 */  lb         $t0, 0x35($a2)
/* 4F0C8 800614A8 00000000 */  nop
/* 4F0CC 800614AC 06000229 */  slti       $v0, $t0, 0x6
/* 4F0D0 800614B0 02004014 */  bnez       $v0, .L800614BC
/* 4F0D4 800614B4 6666043C */   lui       $a0, (0x66666667 >> 16)
/* 4F0D8 800614B8 05000824 */  addiu      $t0, $zero, 0x5
.L800614BC:
/* 4F0DC 800614BC 2E04C284 */  lh         $v0, 0x42E($a2)
/* 4F0E0 800614C0 2C04C584 */  lh         $a1, 0x42C($a2)
/* 4F0E4 800614C4 67668434 */  ori        $a0, $a0, (0x66666667 & 0xFFFF)
/* 4F0E8 800614C8 23104500 */  subu       $v0, $v0, $a1
/* 4F0EC 800614CC 00130200 */  sll        $v0, $v0, 12
/* 4F0F0 800614D0 18004400 */  mult       $v0, $a0
/* 4F0F4 800614D4 C3170200 */  sra        $v0, $v0, 31
/* 4F0F8 800614D8 10180000 */  mfhi       $v1
/* 4F0FC 800614DC 43180300 */  sra        $v1, $v1, 1
/* 4F100 800614E0 23186200 */  subu       $v1, $v1, $v0
/* 4F104 800614E4 FFFF6324 */  addiu      $v1, $v1, -0x1
/* 4F108 800614E8 1800E300 */  mult       $a3, $v1
/* 4F10C 800614EC 12100000 */  mflo       $v0
/* 4F110 800614F0 00000000 */  nop
/* 4F114 800614F4 00000000 */  nop
/* 4F118 800614F8 18004400 */  mult       $v0, $a0
/* 4F11C 800614FC 10380000 */  mfhi       $a3
/* 4F120 80061500 00000000 */  nop
/* 4F124 80061504 00000000 */  nop
/* 4F128 80061508 18000301 */  mult       $t0, $v1
/* 4F12C 8006150C C3170200 */  sra        $v0, $v0, 31
/* 4F130 80061510 83180700 */  sra        $v1, $a3, 2
/* 4F134 80061514 23386200 */  subu       $a3, $v1, $v0
/* 4F138 80061518 12400000 */  mflo       $t0
/* 4F13C 8006151C 2110E800 */  addu       $v0, $a3, $t0
/* 4F140 80061520 033B0200 */  sra        $a3, $v0, 12
/* 4F144 80061524 C802C28C */  lw         $v0, 0x2C8($a2)
/* 4F148 80061528 8000033C */  lui        $v1, (0x800000 >> 16)
/* 4F14C 8006152C 24104300 */  and        $v0, $v0, $v1
/* 4F150 80061530 04004010 */  beqz       $v0, .L80061544
/* 4F154 80061534 00000000 */   nop
/* 4F158 80061538 3604C284 */  lh         $v0, 0x436($a2)
/* 4F15C 8006153C 00000000 */  nop
/* 4F160 80061540 2138E200 */  addu       $a3, $a3, $v0
.L80061544:
/* 4F164 80061544 E203C284 */  lh         $v0, 0x3E2($a2)
/* 4F168 80061548 00000000 */  nop
/* 4F16C 8006154C 10004010 */  beqz       $v0, .L80061590
/* 4F170 80061550 00000000 */   nop
/* 4F174 80061554 3004C484 */  lh         $a0, 0x430($a2)
/* 4F178 80061558 E403C384 */  lh         $v1, 0x3E4($a2)
/* 4F17C 8006155C 3204C284 */  lh         $v0, 0x432($a2)
/* 4F180 80061560 00000000 */  nop
/* 4F184 80061564 23104400 */  subu       $v0, $v0, $a0
/* 4F188 80061568 40100200 */  sll        $v0, $v0, 1
/* 4F18C 8006156C 21208200 */  addu       $a0, $a0, $v0
/* 4F190 80061570 23208300 */  subu       $a0, $a0, $v1
/* 4F194 80061574 02008104 */  bgez       $a0, .L80061580
/* 4F198 80061578 2128A300 */   addu      $a1, $a1, $v1
/* 4F19C 8006157C 21200000 */  addu       $a0, $zero, $zero
.L80061580:
/* 4F1A0 80061580 2A108700 */  slt        $v0, $a0, $a3
/* 4F1A4 80061584 02004010 */  beqz       $v0, .L80061590
/* 4F1A8 80061588 00000000 */   nop
/* 4F1AC 8006158C 21388000 */  addu       $a3, $a0, $zero
.L80061590:
/* 4F1B0 80061590 2128A700 */  addu       $a1, $a1, $a3
/* 4F1B4 80061594 1800C28C */  lw         $v0, 0x18($a2)
/* 4F1B8 80061598 00000000 */  nop
/* 4F1BC 8006159C 05004010 */  beqz       $v0, .L800615B4
/* 4F1C0 800615A0 21380000 */   addu      $a3, $zero, $zero
/* 4F1C4 800615A4 3804C294 */  lhu        $v0, 0x438($a2)
/* 4F1C8 800615A8 00000000 */  nop
/* 4F1CC 800615AC 00140200 */  sll        $v0, $v0, 16
/* 4F1D0 800615B0 433C0200 */  sra        $a3, $v0, 17
.L800615B4:
/* 4F1D4 800615B4 0204C284 */  lh         $v0, 0x402($a2)
/* 4F1D8 800615B8 00000000 */  nop
/* 4F1DC 800615BC 09004014 */  bnez       $v0, .L800615E4
/* 4F1E0 800615C0 00000000 */   nop
/* 4F1E4 800615C4 0404C284 */  lh         $v0, 0x404($a2)
/* 4F1E8 800615C8 00000000 */  nop
/* 4F1EC 800615CC 05004014 */  bnez       $v0, .L800615E4
/* 4F1F0 800615D0 00000000 */   nop
/* 4F1F4 800615D4 0A05C284 */  lh         $v0, 0x50A($a2)
/* 4F1F8 800615D8 00000000 */  nop
/* 4F1FC 800615DC 02004014 */  bnez       $v0, .L800615E8
/* 4F200 800615E0 00000000 */   nop
.L800615E4:
/* 4F204 800615E4 3804C784 */  lh         $a3, 0x438($a2)
.L800615E8:
/* 4F208 800615E8 0C00C284 */  lh         $v0, 0xC($a2)
/* 4F20C 800615EC 00000000 */  nop
/* 4F210 800615F0 0B004010 */  beqz       $v0, .L80061620
/* 4F214 800615F4 14000224 */   addiu     $v0, $zero, 0x14
/* 4F218 800615F8 8204C384 */  lh         $v1, 0x482($a2)
/* 4F21C 800615FC 3804C484 */  lh         $a0, 0x438($a2)
/* 4F220 80061600 23104300 */  subu       $v0, $v0, $v1
/* 4F224 80061604 18008200 */  mult       $a0, $v0
/* 4F228 80061608 12480000 */  mflo       $t1
/* 4F22C 8006160C 03210900 */  sra        $a0, $t1, 4
/* 4F230 80061610 2A10E400 */  slt        $v0, $a3, $a0
/* 4F234 80061614 02004010 */  beqz       $v0, .L80061620
/* 4F238 80061618 00000000 */   nop
/* 4F23C 8006161C 21388000 */  addu       $a3, $a0, $zero
.L80061620:
/* 4F240 80061620 2328A700 */  subu       $a1, $a1, $a3
/* 4F244 80061624 0164A228 */  slti       $v0, $a1, 0x6401
/* 4F248 80061628 02004014 */  bnez       $v0, .L80061634
/* 4F24C 8006162C 00000000 */   nop
/* 4F250 80061630 00640524 */  addiu      $a1, $zero, 0x6400
.L80061634:
/* 4F254 80061634 0800E003 */  jr         $ra
/* 4F258 80061638 2110A000 */   addu      $v0, $a1, $zero
.size VehPhysGeneral_GetBaseSpeed, . - VehPhysGeneral_GetBaseSpeed
