.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel VehPhysCrash_AnyTwoCars
/* 4B024 8005D404 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 4B028 8005D408 5400B7AF */  sw         $s7, 0x54($sp)
/* 4B02C 8005D40C 21B88000 */  addu       $s7, $a0, $zero
/* 4B030 8005D410 4C00B5AF */  sw         $s5, 0x4C($sp)
/* 4B034 8005D414 21A8A000 */  addu       $s5, $a1, $zero
/* 4B038 8005D418 4400B3AF */  sw         $s3, 0x44($sp)
/* 4B03C 8005D41C 2198C000 */  addu       $s3, $a2, $zero
/* 4B040 8005D420 5800BFAF */  sw         $ra, 0x58($sp)
/* 4B044 8005D424 5000B6AF */  sw         $s6, 0x50($sp)
/* 4B048 8005D428 4800B4AF */  sw         $s4, 0x48($sp)
/* 4B04C 8005D42C 4000B2AF */  sw         $s2, 0x40($sp)
/* 4B050 8005D430 3C00B1AF */  sw         $s1, 0x3C($sp)
/* 4B054 8005D434 3800B0AF */  sw         $s0, 0x38($sp)
/* 4B058 8005D438 0C00A48E */  lw         $a0, 0xC($s5)
/* 4B05C 8005D43C 85F4000C */  jal        MATH_FastSqrt
/* 4B060 8005D440 21280000 */   addu      $a1, $zero, $zero
/* 4B064 8005D444 21304000 */  addu       $a2, $v0, $zero
/* 4B068 8005D448 2E00C010 */  beqz       $a2, .L8005D504
/* 4B06C 8005D44C 00100224 */   addiu     $v0, $zero, 0x1000
/* 4B070 8005D450 1000A486 */  lh         $a0, 0x10($s5)
/* 4B074 8005D454 00000000 */  nop
/* 4B078 8005D458 00230400 */  sll        $a0, $a0, 12
/* 4B07C 8005D45C 1A008600 */  div        $zero, $a0, $a2
/* 4B080 8005D460 0200C014 */  bnez       $a2, .L8005D46C
/* 4B084 8005D464 00000000 */   nop
/* 4B088 8005D468 0D000700 */  break      7
.L8005D46C:
/* 4B08C 8005D46C FFFF0124 */  addiu      $at, $zero, -0x1
/* 4B090 8005D470 0400C114 */  bne        $a2, $at, .L8005D484
/* 4B094 8005D474 0080013C */   lui       $at, (0x80000000 >> 16)
/* 4B098 8005D478 02008114 */  bne        $a0, $at, .L8005D484
/* 4B09C 8005D47C 00000000 */   nop
/* 4B0A0 8005D480 0D000600 */  break      6
.L8005D484:
/* 4B0A4 8005D484 12200000 */  mflo       $a0
/* 4B0A8 8005D488 1200A386 */  lh         $v1, 0x12($s5)
/* 4B0AC 8005D48C 00000000 */  nop
/* 4B0B0 8005D490 001B0300 */  sll        $v1, $v1, 12
/* 4B0B4 8005D494 1A006600 */  div        $zero, $v1, $a2
/* 4B0B8 8005D498 0200C014 */  bnez       $a2, .L8005D4A4
/* 4B0BC 8005D49C 00000000 */   nop
/* 4B0C0 8005D4A0 0D000700 */  break      7
.L8005D4A4:
/* 4B0C4 8005D4A4 FFFF0124 */  addiu      $at, $zero, -0x1
/* 4B0C8 8005D4A8 0400C114 */  bne        $a2, $at, .L8005D4BC
/* 4B0CC 8005D4AC 0080013C */   lui       $at, (0x80000000 >> 16)
/* 4B0D0 8005D4B0 02006114 */  bne        $v1, $at, .L8005D4BC
/* 4B0D4 8005D4B4 00000000 */   nop
/* 4B0D8 8005D4B8 0D000600 */  break      6
.L8005D4BC:
/* 4B0DC 8005D4BC 12180000 */  mflo       $v1
/* 4B0E0 8005D4C0 1400A286 */  lh         $v0, 0x14($s5)
/* 4B0E4 8005D4C4 00000000 */  nop
/* 4B0E8 8005D4C8 00130200 */  sll        $v0, $v0, 12
/* 4B0EC 8005D4CC 1A004600 */  div        $zero, $v0, $a2
/* 4B0F0 8005D4D0 0200C014 */  bnez       $a2, .L8005D4DC
/* 4B0F4 8005D4D4 00000000 */   nop
/* 4B0F8 8005D4D8 0D000700 */  break      7
.L8005D4DC:
/* 4B0FC 8005D4DC FFFF0124 */  addiu      $at, $zero, -0x1
/* 4B100 8005D4E0 0400C114 */  bne        $a2, $at, .L8005D4F4
/* 4B104 8005D4E4 0080013C */   lui       $at, (0x80000000 >> 16)
/* 4B108 8005D4E8 02004114 */  bne        $v0, $at, .L8005D4F4
/* 4B10C 8005D4EC 00000000 */   nop
/* 4B110 8005D4F0 0D000600 */  break      6
.L8005D4F4:
/* 4B114 8005D4F4 12100000 */  mflo       $v0
/* 4B118 8005D4F8 1800A4A6 */  sh         $a0, 0x18($s5)
/* 4B11C 8005D4FC 43750108 */  j          .L8005D50C
/* 4B120 8005D500 1A00A3A6 */   sh        $v1, 0x1A($s5)
.L8005D504:
/* 4B124 8005D504 1800A0A6 */  sh         $zero, 0x18($s5)
/* 4B128 8005D508 1A00A0A6 */  sh         $zero, 0x1A($s5)
.L8005D50C:
/* 4B12C 8005D50C 1C00A2A6 */  sh         $v0, 0x1C($s5)
/* 4B130 8005D510 0800A28E */  lw         $v0, 0x8($s5)
/* 4B134 8005D514 00000000 */  nop
/* 4B138 8005D518 3000508C */  lw         $s0, 0x30($v0)
/* 4B13C 8005D51C 00000000 */  nop
/* 4B140 8005D520 1C00028E */  lw         $v0, 0x1C($s0)
/* 4B144 8005D524 00000000 */  nop
/* 4B148 8005D528 6C00438C */  lw         $v1, 0x6C($v0)
/* 4B14C 8005D52C 4200E286 */  lh         $v0, 0x42($s7)
/* 4B150 8005D530 42006384 */  lh         $v1, 0x42($v1)
/* 4B154 8005D534 3000F68E */  lw         $s6, 0x30($s7)
/* 4B158 8005D538 21104300 */  addu       $v0, $v0, $v1
/* 4B15C 8005D53C 23904600 */  subu       $s2, $v0, $a2
/* 4B160 8005D540 E502401A */  blez       $s2, .L8005E0D8
/* 4B164 8005D544 1000033C */   lui       $v1, (0x100000 >> 16)
/* 4B168 8005D548 C802C28E */  lw         $v0, 0x2C8($s6)
/* 4B16C 8005D54C 880A80AF */  sw         $zero, 0xA88($gp) /* Failed to symbolize address 0x00000A88 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 4B170 8005D550 24104300 */  and        $v0, $v0, $v1
/* 4B174 8005D554 3E014010 */  beqz       $v0, .L8005DA50
/* 4B178 8005D558 00000000 */   nop
/* 4B17C 8005D55C C802028E */  lw         $v0, 0x2C8($s0)
/* 4B180 8005D560 00000000 */  nop
/* 4B184 8005D564 24104300 */  and        $v0, $v0, $v1
/* 4B188 8005D568 98004014 */  bnez       $v0, .L8005D7CC
/* 4B18C 8005D56C 1800B426 */   addiu     $s4, $s5, 0x18
/* 4B190 8005D570 21200002 */  addu       $a0, $s0, $zero
/* 4B194 8005D574 4178010C */  jal        DECOMP_VehPhysForce_ConvertSpeedToVec
/* 4B198 8005D578 1800A527 */   addiu     $a1, $sp, 0x18
/* 4B19C 8005D57C 7C04C386 */  lh         $v1, 0x47C($s6)
/* 4B1A0 8005D580 0000628E */  lw         $v0, 0x0($s3)
/* 4B1A4 8005D584 00000000 */  nop
/* 4B1A8 8005D588 18004300 */  mult       $v0, $v1
/* 4B1AC 8005D58C 7C040486 */  lh         $a0, 0x47C($s0)
/* 4B1B0 8005D590 12280000 */  mflo       $a1
/* 4B1B4 8005D594 1800A28F */  lw         $v0, 0x18($sp)
/* 4B1B8 8005D598 00000000 */  nop
/* 4B1BC 8005D59C 18004400 */  mult       $v0, $a0
/* 4B1C0 8005D5A0 12480000 */  mflo       $t1
/* 4B1C4 8005D5A4 21186400 */  addu       $v1, $v1, $a0
/* 4B1C8 8005D5A8 2110A900 */  addu       $v0, $a1, $t1
/* 4B1CC 8005D5AC 1A004300 */  div        $zero, $v0, $v1
/* 4B1D0 8005D5B0 02006014 */  bnez       $v1, .L8005D5BC
/* 4B1D4 8005D5B4 00000000 */   nop
/* 4B1D8 8005D5B8 0D000700 */  break      7
.L8005D5BC:
/* 4B1DC 8005D5BC FFFF0124 */  addiu      $at, $zero, -0x1
/* 4B1E0 8005D5C0 04006114 */  bne        $v1, $at, .L8005D5D4
/* 4B1E4 8005D5C4 0080013C */   lui       $at, (0x80000000 >> 16)
/* 4B1E8 8005D5C8 02004114 */  bne        $v0, $at, .L8005D5D4
/* 4B1EC 8005D5CC 00000000 */   nop
/* 4B1F0 8005D5D0 0D000600 */  break      6
.L8005D5D4:
/* 4B1F4 8005D5D4 12100000 */  mflo       $v0
/* 4B1F8 8005D5D8 00000000 */  nop
/* 4B1FC 8005D5DC 2800A2AF */  sw         $v0, 0x28($sp)
/* 4B200 8005D5E0 7C04C386 */  lh         $v1, 0x47C($s6)
/* 4B204 8005D5E4 0400628E */  lw         $v0, 0x4($s3)
/* 4B208 8005D5E8 00000000 */  nop
/* 4B20C 8005D5EC 18004300 */  mult       $v0, $v1
/* 4B210 8005D5F0 7C040486 */  lh         $a0, 0x47C($s0)
/* 4B214 8005D5F4 12280000 */  mflo       $a1
/* 4B218 8005D5F8 1C00A28F */  lw         $v0, 0x1C($sp)
/* 4B21C 8005D5FC 00000000 */  nop
/* 4B220 8005D600 18004400 */  mult       $v0, $a0
/* 4B224 8005D604 12480000 */  mflo       $t1
/* 4B228 8005D608 21186400 */  addu       $v1, $v1, $a0
/* 4B22C 8005D60C 2110A900 */  addu       $v0, $a1, $t1
/* 4B230 8005D610 1A004300 */  div        $zero, $v0, $v1
/* 4B234 8005D614 02006014 */  bnez       $v1, .L8005D620
/* 4B238 8005D618 00000000 */   nop
/* 4B23C 8005D61C 0D000700 */  break      7
.L8005D620:
/* 4B240 8005D620 FFFF0124 */  addiu      $at, $zero, -0x1
/* 4B244 8005D624 04006114 */  bne        $v1, $at, .L8005D638
/* 4B248 8005D628 0080013C */   lui       $at, (0x80000000 >> 16)
/* 4B24C 8005D62C 02004114 */  bne        $v0, $at, .L8005D638
/* 4B250 8005D630 00000000 */   nop
/* 4B254 8005D634 0D000600 */  break      6
.L8005D638:
/* 4B258 8005D638 12100000 */  mflo       $v0
/* 4B25C 8005D63C 00000000 */  nop
/* 4B260 8005D640 2C00A2AF */  sw         $v0, 0x2C($sp)
/* 4B264 8005D644 7C04C386 */  lh         $v1, 0x47C($s6)
/* 4B268 8005D648 0800628E */  lw         $v0, 0x8($s3)
/* 4B26C 8005D64C 00000000 */  nop
/* 4B270 8005D650 18004300 */  mult       $v0, $v1
/* 4B274 8005D654 7C040486 */  lh         $a0, 0x47C($s0)
/* 4B278 8005D658 12280000 */  mflo       $a1
/* 4B27C 8005D65C 2000A28F */  lw         $v0, 0x20($sp)
/* 4B280 8005D660 00000000 */  nop
/* 4B284 8005D664 18004400 */  mult       $v0, $a0
/* 4B288 8005D668 12480000 */  mflo       $t1
/* 4B28C 8005D66C 21186400 */  addu       $v1, $v1, $a0
/* 4B290 8005D670 2110A900 */  addu       $v0, $a1, $t1
/* 4B294 8005D674 1A004300 */  div        $zero, $v0, $v1
/* 4B298 8005D678 02006014 */  bnez       $v1, .L8005D684
/* 4B29C 8005D67C 00000000 */   nop
/* 4B2A0 8005D680 0D000700 */  break      7
.L8005D684:
/* 4B2A4 8005D684 FFFF0124 */  addiu      $at, $zero, -0x1
/* 4B2A8 8005D688 04006114 */  bne        $v1, $at, .L8005D69C
/* 4B2AC 8005D68C 0080013C */   lui       $at, (0x80000000 >> 16)
/* 4B2B0 8005D690 02004114 */  bne        $v0, $at, .L8005D69C
/* 4B2B4 8005D694 00000000 */   nop
/* 4B2B8 8005D698 0D000600 */  break      6
.L8005D69C:
/* 4B2BC 8005D69C 12100000 */  mflo       $v0
/* 4B2C0 8005D6A0 1800B426 */  addiu      $s4, $s5, 0x18
/* 4B2C4 8005D6A4 2800B127 */  addiu      $s1, $sp, 0x28
/* 4B2C8 8005D6A8 1800A627 */  addiu      $a2, $sp, 0x18
/* 4B2CC 8005D6AC 01000724 */  addiu      $a3, $zero, 0x1
/* 4B2D0 8005D6B0 21208002 */  addu       $a0, $s4, $zero
/* 4B2D4 8005D6B4 21282002 */  addu       $a1, $s1, $zero
/* 4B2D8 8005D6B8 D973010C */  jal        VehPhysCrash_BounceSelf
/* 4B2DC 8005D6BC 3000A2AF */   sw        $v0, 0x30($sp)
/* 4B2E0 8005D6C0 02004104 */  bgez       $v0, .L8005D6CC
/* 4B2E4 8005D6C4 21208002 */   addu      $a0, $s4, $zero
/* 4B2E8 8005D6C8 880A80AF */  sw         $zero, 0xA88($gp) /* Failed to symbolize address 0x00000A88 for %gp_rel. Make sure this address is within the recognized valid address space */
.L8005D6CC:
/* 4B2EC 8005D6CC 21282002 */  addu       $a1, $s1, $zero
/* 4B2F0 8005D6D0 21306002 */  addu       $a2, $s3, $zero
/* 4B2F4 8005D6D4 D973010C */  jal        VehPhysCrash_BounceSelf
/* 4B2F8 8005D6D8 21380000 */   addu      $a3, $zero, $zero
/* 4B2FC 8005D6DC 02004018 */  blez       $v0, .L8005D6E8
/* 4B300 8005D6E0 00000000 */   nop
/* 4B304 8005D6E4 880A80AF */  sw         $zero, 0xA88($gp) /* Failed to symbolize address 0x00000A88 for %gp_rel. Make sure this address is within the recognized valid address space */
.L8005D6E8:
/* 4B308 8005D6E8 1800A286 */  lh         $v0, 0x18($s5)
/* 4B30C 8005D6EC 00000000 */  nop
/* 4B310 8005D6F0 18005200 */  mult       $v0, $s2
/* 4B314 8005D6F4 0000628E */  lw         $v0, 0x0($s3)
/* 4B318 8005D6F8 12400000 */  mflo       $t0
/* 4B31C 8005D6FC 031A0800 */  sra        $v1, $t0, 8
/* 4B320 8005D700 21104300 */  addu       $v0, $v0, $v1
/* 4B324 8005D704 000062AE */  sw         $v0, 0x0($s3)
/* 4B328 8005D708 1A00A286 */  lh         $v0, 0x1A($s5)
/* 4B32C 8005D70C 00000000 */  nop
/* 4B330 8005D710 18005200 */  mult       $v0, $s2
/* 4B334 8005D714 0400628E */  lw         $v0, 0x4($s3)
/* 4B338 8005D718 12400000 */  mflo       $t0
/* 4B33C 8005D71C 031A0800 */  sra        $v1, $t0, 8
/* 4B340 8005D720 21104300 */  addu       $v0, $v0, $v1
/* 4B344 8005D724 040062AE */  sw         $v0, 0x4($s3)
/* 4B348 8005D728 1C00A286 */  lh         $v0, 0x1C($s5)
/* 4B34C 8005D72C 00000000 */  nop
/* 4B350 8005D730 18005200 */  mult       $v0, $s2
/* 4B354 8005D734 0800628E */  lw         $v0, 0x8($s3)
/* 4B358 8005D738 12400000 */  mflo       $t0
/* 4B35C 8005D73C 031A0800 */  sra        $v1, $t0, 8
/* 4B360 8005D740 21104300 */  addu       $v0, $v0, $v1
/* 4B364 8005D744 080062AE */  sw         $v0, 0x8($s3)
/* 4B368 8005D748 1800A286 */  lh         $v0, 0x18($s5)
/* 4B36C 8005D74C 00000000 */  nop
/* 4B370 8005D750 18005200 */  mult       $v0, $s2
/* 4B374 8005D754 1800A28F */  lw         $v0, 0x18($sp)
/* 4B378 8005D758 12400000 */  mflo       $t0
/* 4B37C 8005D75C 031A0800 */  sra        $v1, $t0, 8
/* 4B380 8005D760 23104300 */  subu       $v0, $v0, $v1
/* 4B384 8005D764 1800A2AF */  sw         $v0, 0x18($sp)
/* 4B388 8005D768 1A00A286 */  lh         $v0, 0x1A($s5)
/* 4B38C 8005D76C 00000000 */  nop
/* 4B390 8005D770 18005200 */  mult       $v0, $s2
/* 4B394 8005D774 1C00A28F */  lw         $v0, 0x1C($sp)
/* 4B398 8005D778 12400000 */  mflo       $t0
/* 4B39C 8005D77C 031A0800 */  sra        $v1, $t0, 8
/* 4B3A0 8005D780 23104300 */  subu       $v0, $v0, $v1
/* 4B3A4 8005D784 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 4B3A8 8005D788 1C00A286 */  lh         $v0, 0x1C($s5)
/* 4B3AC 8005D78C 00000000 */  nop
/* 4B3B0 8005D790 18005200 */  mult       $v0, $s2
/* 4B3B4 8005D794 2120C002 */  addu       $a0, $s6, $zero
/* 4B3B8 8005D798 21286002 */  addu       $a1, $s3, $zero
/* 4B3BC 8005D79C 2000A28F */  lw         $v0, 0x20($sp)
/* 4B3C0 8005D7A0 12400000 */  mflo       $t0
/* 4B3C4 8005D7A4 031A0800 */  sra        $v1, $t0, 8
/* 4B3C8 8005D7A8 23104300 */  subu       $v0, $v0, $v1
/* 4B3CC 8005D7AC 3474010C */  jal        VehPhysCrash_AI
/* 4B3D0 8005D7B0 2000A2AF */   sw        $v0, 0x20($sp)
/* 4B3D4 8005D7B4 21200002 */  addu       $a0, $s0, $zero
/* 4B3D8 8005D7B8 1800A527 */  addiu      $a1, $sp, 0x18
/* 4B3DC 8005D7BC 4773010C */  jal        VehPhysCrash_ConvertVecToSpeed
/* 4B3E0 8005D7C0 21300000 */   addu      $a2, $zero, $zero
/* 4B3E4 8005D7C4 36780108 */  j          .L8005E0D8
/* 4B3E8 8005D7C8 00000000 */   nop
.L8005D7CC:
/* 4B3EC 8005D7CC A003058E */  lw         $a1, 0x3A0($s0)
/* 4B3F0 8005D7D0 D805028E */  lw         $v0, 0x5D8($s0)
/* 4B3F4 8005D7D4 00000000 */  nop
/* 4B3F8 8005D7D8 2128A200 */  addu       $a1, $a1, $v0
/* 4B3FC 8005D7DC 1800A5AF */  sw         $a1, 0x18($sp)
/* 4B400 8005D7E0 A403068E */  lw         $a2, 0x3A4($s0)
/* 4B404 8005D7E4 DC05028E */  lw         $v0, 0x5DC($s0)
/* 4B408 8005D7E8 00000000 */  nop
/* 4B40C 8005D7EC 2130C200 */  addu       $a2, $a2, $v0
/* 4B410 8005D7F0 1C00A6AF */  sw         $a2, 0x1C($sp)
/* 4B414 8005D7F4 A803078E */  lw         $a3, 0x3A8($s0)
/* 4B418 8005D7F8 E005028E */  lw         $v0, 0x5E0($s0)
/* 4B41C 8005D7FC 00000000 */  nop
/* 4B420 8005D800 2138E200 */  addu       $a3, $a3, $v0
/* 4B424 8005D804 2000A7AF */  sw         $a3, 0x20($sp)
/* 4B428 8005D808 7C04C386 */  lh         $v1, 0x47C($s6)
/* 4B42C 8005D80C 0000628E */  lw         $v0, 0x0($s3)
/* 4B430 8005D810 00000000 */  nop
/* 4B434 8005D814 18004300 */  mult       $v0, $v1
/* 4B438 8005D818 12100000 */  mflo       $v0
/* 4B43C 8005D81C 7C040486 */  lh         $a0, 0x47C($s0)
/* 4B440 8005D820 00000000 */  nop
/* 4B444 8005D824 1800A400 */  mult       $a1, $a0
/* 4B448 8005D828 12480000 */  mflo       $t1
/* 4B44C 8005D82C 21186400 */  addu       $v1, $v1, $a0
/* 4B450 8005D830 21104900 */  addu       $v0, $v0, $t1
/* 4B454 8005D834 1A004300 */  div        $zero, $v0, $v1
/* 4B458 8005D838 02006014 */  bnez       $v1, .L8005D844
/* 4B45C 8005D83C 00000000 */   nop
/* 4B460 8005D840 0D000700 */  break      7
.L8005D844:
/* 4B464 8005D844 FFFF0124 */  addiu      $at, $zero, -0x1
/* 4B468 8005D848 04006114 */  bne        $v1, $at, .L8005D85C
/* 4B46C 8005D84C 0080013C */   lui       $at, (0x80000000 >> 16)
/* 4B470 8005D850 02004114 */  bne        $v0, $at, .L8005D85C
/* 4B474 8005D854 00000000 */   nop
/* 4B478 8005D858 0D000600 */  break      6
.L8005D85C:
/* 4B47C 8005D85C 12100000 */  mflo       $v0
/* 4B480 8005D860 00000000 */  nop
/* 4B484 8005D864 2800A2AF */  sw         $v0, 0x28($sp)
/* 4B488 8005D868 7C04C386 */  lh         $v1, 0x47C($s6)
/* 4B48C 8005D86C 0400628E */  lw         $v0, 0x4($s3)
/* 4B490 8005D870 00000000 */  nop
/* 4B494 8005D874 18004300 */  mult       $v0, $v1
/* 4B498 8005D878 12100000 */  mflo       $v0
/* 4B49C 8005D87C 7C040486 */  lh         $a0, 0x47C($s0)
/* 4B4A0 8005D880 00000000 */  nop
/* 4B4A4 8005D884 1800C400 */  mult       $a2, $a0
/* 4B4A8 8005D888 12480000 */  mflo       $t1
/* 4B4AC 8005D88C 21186400 */  addu       $v1, $v1, $a0
/* 4B4B0 8005D890 21104900 */  addu       $v0, $v0, $t1
/* 4B4B4 8005D894 1A004300 */  div        $zero, $v0, $v1
/* 4B4B8 8005D898 02006014 */  bnez       $v1, .L8005D8A4
/* 4B4BC 8005D89C 00000000 */   nop
/* 4B4C0 8005D8A0 0D000700 */  break      7
.L8005D8A4:
/* 4B4C4 8005D8A4 FFFF0124 */  addiu      $at, $zero, -0x1
/* 4B4C8 8005D8A8 04006114 */  bne        $v1, $at, .L8005D8BC
/* 4B4CC 8005D8AC 0080013C */   lui       $at, (0x80000000 >> 16)
/* 4B4D0 8005D8B0 02004114 */  bne        $v0, $at, .L8005D8BC
/* 4B4D4 8005D8B4 00000000 */   nop
/* 4B4D8 8005D8B8 0D000600 */  break      6
.L8005D8BC:
/* 4B4DC 8005D8BC 12100000 */  mflo       $v0
/* 4B4E0 8005D8C0 00000000 */  nop
/* 4B4E4 8005D8C4 2C00A2AF */  sw         $v0, 0x2C($sp)
/* 4B4E8 8005D8C8 7C04C386 */  lh         $v1, 0x47C($s6)
/* 4B4EC 8005D8CC 0800628E */  lw         $v0, 0x8($s3)
/* 4B4F0 8005D8D0 00000000 */  nop
/* 4B4F4 8005D8D4 18004300 */  mult       $v0, $v1
/* 4B4F8 8005D8D8 12100000 */  mflo       $v0
/* 4B4FC 8005D8DC 7C040486 */  lh         $a0, 0x47C($s0)
/* 4B500 8005D8E0 00000000 */  nop
/* 4B504 8005D8E4 1800E400 */  mult       $a3, $a0
/* 4B508 8005D8E8 12480000 */  mflo       $t1
/* 4B50C 8005D8EC 21186400 */  addu       $v1, $v1, $a0
/* 4B510 8005D8F0 21104900 */  addu       $v0, $v0, $t1
/* 4B514 8005D8F4 1A004300 */  div        $zero, $v0, $v1
/* 4B518 8005D8F8 02006014 */  bnez       $v1, .L8005D904
/* 4B51C 8005D8FC 00000000 */   nop
/* 4B520 8005D900 0D000700 */  break      7
.L8005D904:
/* 4B524 8005D904 FFFF0124 */  addiu      $at, $zero, -0x1
/* 4B528 8005D908 04006114 */  bne        $v1, $at, .L8005D91C
/* 4B52C 8005D90C 0080013C */   lui       $at, (0x80000000 >> 16)
/* 4B530 8005D910 02004114 */  bne        $v0, $at, .L8005D91C
/* 4B534 8005D914 00000000 */   nop
/* 4B538 8005D918 0D000600 */  break      6
.L8005D91C:
/* 4B53C 8005D91C 12100000 */  mflo       $v0
/* 4B540 8005D920 2800B127 */  addiu      $s1, $sp, 0x28
/* 4B544 8005D924 21282002 */  addu       $a1, $s1, $zero
/* 4B548 8005D928 1800A627 */  addiu      $a2, $sp, 0x18
/* 4B54C 8005D92C 21208002 */  addu       $a0, $s4, $zero
/* 4B550 8005D930 01000724 */  addiu      $a3, $zero, 0x1
/* 4B554 8005D934 D973010C */  jal        VehPhysCrash_BounceSelf
/* 4B558 8005D938 3000A2AF */   sw        $v0, 0x30($sp)
/* 4B55C 8005D93C 02004104 */  bgez       $v0, .L8005D948
/* 4B560 8005D940 21208002 */   addu      $a0, $s4, $zero
/* 4B564 8005D944 880A80AF */  sw         $zero, 0xA88($gp) /* Failed to symbolize address 0x00000A88 for %gp_rel. Make sure this address is within the recognized valid address space */
.L8005D948:
/* 4B568 8005D948 21282002 */  addu       $a1, $s1, $zero
/* 4B56C 8005D94C 21306002 */  addu       $a2, $s3, $zero
/* 4B570 8005D950 D973010C */  jal        VehPhysCrash_BounceSelf
/* 4B574 8005D954 21380000 */   addu      $a3, $zero, $zero
/* 4B578 8005D958 02004018 */  blez       $v0, .L8005D964
/* 4B57C 8005D95C 00000000 */   nop
/* 4B580 8005D960 880A80AF */  sw         $zero, 0xA88($gp) /* Failed to symbolize address 0x00000A88 for %gp_rel. Make sure this address is within the recognized valid address space */
.L8005D964:
/* 4B584 8005D964 1800A286 */  lh         $v0, 0x18($s5)
/* 4B588 8005D968 00000000 */  nop
/* 4B58C 8005D96C 18005200 */  mult       $v0, $s2
/* 4B590 8005D970 0000628E */  lw         $v0, 0x0($s3)
/* 4B594 8005D974 12400000 */  mflo       $t0
/* 4B598 8005D978 031A0800 */  sra        $v1, $t0, 8
/* 4B59C 8005D97C 21104300 */  addu       $v0, $v0, $v1
/* 4B5A0 8005D980 000062AE */  sw         $v0, 0x0($s3)
/* 4B5A4 8005D984 1A00A286 */  lh         $v0, 0x1A($s5)
/* 4B5A8 8005D988 00000000 */  nop
/* 4B5AC 8005D98C 18005200 */  mult       $v0, $s2
/* 4B5B0 8005D990 0400628E */  lw         $v0, 0x4($s3)
/* 4B5B4 8005D994 12400000 */  mflo       $t0
/* 4B5B8 8005D998 031A0800 */  sra        $v1, $t0, 8
/* 4B5BC 8005D99C 21104300 */  addu       $v0, $v0, $v1
/* 4B5C0 8005D9A0 040062AE */  sw         $v0, 0x4($s3)
/* 4B5C4 8005D9A4 1C00A286 */  lh         $v0, 0x1C($s5)
/* 4B5C8 8005D9A8 00000000 */  nop
/* 4B5CC 8005D9AC 18005200 */  mult       $v0, $s2
/* 4B5D0 8005D9B0 0800628E */  lw         $v0, 0x8($s3)
/* 4B5D4 8005D9B4 12400000 */  mflo       $t0
/* 4B5D8 8005D9B8 031A0800 */  sra        $v1, $t0, 8
/* 4B5DC 8005D9BC 21104300 */  addu       $v0, $v0, $v1
/* 4B5E0 8005D9C0 080062AE */  sw         $v0, 0x8($s3)
/* 4B5E4 8005D9C4 1800A286 */  lh         $v0, 0x18($s5)
/* 4B5E8 8005D9C8 00000000 */  nop
/* 4B5EC 8005D9CC 18005200 */  mult       $v0, $s2
/* 4B5F0 8005D9D0 1800A28F */  lw         $v0, 0x18($sp)
/* 4B5F4 8005D9D4 12400000 */  mflo       $t0
/* 4B5F8 8005D9D8 031A0800 */  sra        $v1, $t0, 8
/* 4B5FC 8005D9DC 23104300 */  subu       $v0, $v0, $v1
/* 4B600 8005D9E0 1800A2AF */  sw         $v0, 0x18($sp)
/* 4B604 8005D9E4 1A00A286 */  lh         $v0, 0x1A($s5)
/* 4B608 8005D9E8 00000000 */  nop
/* 4B60C 8005D9EC 18005200 */  mult       $v0, $s2
/* 4B610 8005D9F0 1C00A28F */  lw         $v0, 0x1C($sp)
/* 4B614 8005D9F4 12400000 */  mflo       $t0
/* 4B618 8005D9F8 031A0800 */  sra        $v1, $t0, 8
/* 4B61C 8005D9FC 23104300 */  subu       $v0, $v0, $v1
/* 4B620 8005DA00 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 4B624 8005DA04 1C00A286 */  lh         $v0, 0x1C($s5)
/* 4B628 8005DA08 00000000 */  nop
/* 4B62C 8005DA0C 18005200 */  mult       $v0, $s2
/* 4B630 8005DA10 21200002 */  addu       $a0, $s0, $zero
/* 4B634 8005DA14 1800A527 */  addiu      $a1, $sp, 0x18
/* 4B638 8005DA18 2000A28F */  lw         $v0, 0x20($sp)
/* 4B63C 8005DA1C 12400000 */  mflo       $t0
/* 4B640 8005DA20 031A0800 */  sra        $v1, $t0, 8
/* 4B644 8005DA24 23104300 */  subu       $v0, $v0, $v1
/* 4B648 8005DA28 3474010C */  jal        VehPhysCrash_AI
/* 4B64C 8005DA2C 2000A2AF */   sw        $v0, 0x20($sp)
/* 4B650 8005DA30 2120C002 */  addu       $a0, $s6, $zero
/* 4B654 8005DA34 3474010C */  jal        VehPhysCrash_AI
/* 4B658 8005DA38 21286002 */   addu      $a1, $s3, $zero
/* 4B65C 8005DA3C 2120C002 */  addu       $a0, $s6, $zero
/* 4B660 8005DA40 B25B000C */  jal        BOTS_CollideWithOtherAI
/* 4B664 8005DA44 21280002 */   addu      $a1, $s0, $zero
/* 4B668 8005DA48 36780108 */  j          .L8005E0D8
/* 4B66C 8005DA4C 00000000 */   nop
.L8005DA50:
/* 4B670 8005DA50 C802028E */  lw         $v0, 0x2C8($s0)
/* 4B674 8005DA54 00000000 */  nop
/* 4B678 8005DA58 24104300 */  and        $v0, $v0, $v1
/* 4B67C 8005DA5C 9C004010 */  beqz       $v0, .L8005DCD0
/* 4B680 8005DA60 1800B426 */   addiu     $s4, $s5, 0x18
/* 4B684 8005DA64 A003058E */  lw         $a1, 0x3A0($s0)
/* 4B688 8005DA68 D805028E */  lw         $v0, 0x5D8($s0)
/* 4B68C 8005DA6C 00000000 */  nop
/* 4B690 8005DA70 2128A200 */  addu       $a1, $a1, $v0
/* 4B694 8005DA74 1800A5AF */  sw         $a1, 0x18($sp)
/* 4B698 8005DA78 A403068E */  lw         $a2, 0x3A4($s0)
/* 4B69C 8005DA7C DC05028E */  lw         $v0, 0x5DC($s0)
/* 4B6A0 8005DA80 00000000 */  nop
/* 4B6A4 8005DA84 2130C200 */  addu       $a2, $a2, $v0
/* 4B6A8 8005DA88 1C00A6AF */  sw         $a2, 0x1C($sp)
/* 4B6AC 8005DA8C A803078E */  lw         $a3, 0x3A8($s0)
/* 4B6B0 8005DA90 E005028E */  lw         $v0, 0x5E0($s0)
/* 4B6B4 8005DA94 00000000 */  nop
/* 4B6B8 8005DA98 2138E200 */  addu       $a3, $a3, $v0
/* 4B6BC 8005DA9C 2000A7AF */  sw         $a3, 0x20($sp)
/* 4B6C0 8005DAA0 7C04C386 */  lh         $v1, 0x47C($s6)
/* 4B6C4 8005DAA4 0000628E */  lw         $v0, 0x0($s3)
/* 4B6C8 8005DAA8 00000000 */  nop
/* 4B6CC 8005DAAC 18004300 */  mult       $v0, $v1
/* 4B6D0 8005DAB0 12100000 */  mflo       $v0
/* 4B6D4 8005DAB4 7C040486 */  lh         $a0, 0x47C($s0)
/* 4B6D8 8005DAB8 00000000 */  nop
/* 4B6DC 8005DABC 1800A400 */  mult       $a1, $a0
/* 4B6E0 8005DAC0 12480000 */  mflo       $t1
/* 4B6E4 8005DAC4 21186400 */  addu       $v1, $v1, $a0
/* 4B6E8 8005DAC8 21104900 */  addu       $v0, $v0, $t1
/* 4B6EC 8005DACC 1A004300 */  div        $zero, $v0, $v1
/* 4B6F0 8005DAD0 02006014 */  bnez       $v1, .L8005DADC
/* 4B6F4 8005DAD4 00000000 */   nop
/* 4B6F8 8005DAD8 0D000700 */  break      7
.L8005DADC:
/* 4B6FC 8005DADC FFFF0124 */  addiu      $at, $zero, -0x1
/* 4B700 8005DAE0 04006114 */  bne        $v1, $at, .L8005DAF4
/* 4B704 8005DAE4 0080013C */   lui       $at, (0x80000000 >> 16)
/* 4B708 8005DAE8 02004114 */  bne        $v0, $at, .L8005DAF4
/* 4B70C 8005DAEC 00000000 */   nop
/* 4B710 8005DAF0 0D000600 */  break      6
.L8005DAF4:
/* 4B714 8005DAF4 12100000 */  mflo       $v0
/* 4B718 8005DAF8 00000000 */  nop
/* 4B71C 8005DAFC 2800A2AF */  sw         $v0, 0x28($sp)
/* 4B720 8005DB00 7C04C386 */  lh         $v1, 0x47C($s6)
/* 4B724 8005DB04 0400628E */  lw         $v0, 0x4($s3)
/* 4B728 8005DB08 00000000 */  nop
/* 4B72C 8005DB0C 18004300 */  mult       $v0, $v1
/* 4B730 8005DB10 12100000 */  mflo       $v0
/* 4B734 8005DB14 7C040486 */  lh         $a0, 0x47C($s0)
/* 4B738 8005DB18 00000000 */  nop
/* 4B73C 8005DB1C 1800C400 */  mult       $a2, $a0
/* 4B740 8005DB20 12480000 */  mflo       $t1
/* 4B744 8005DB24 21186400 */  addu       $v1, $v1, $a0
/* 4B748 8005DB28 21104900 */  addu       $v0, $v0, $t1
/* 4B74C 8005DB2C 1A004300 */  div        $zero, $v0, $v1
/* 4B750 8005DB30 02006014 */  bnez       $v1, .L8005DB3C
/* 4B754 8005DB34 00000000 */   nop
/* 4B758 8005DB38 0D000700 */  break      7
.L8005DB3C:
/* 4B75C 8005DB3C FFFF0124 */  addiu      $at, $zero, -0x1
/* 4B760 8005DB40 04006114 */  bne        $v1, $at, .L8005DB54
/* 4B764 8005DB44 0080013C */   lui       $at, (0x80000000 >> 16)
/* 4B768 8005DB48 02004114 */  bne        $v0, $at, .L8005DB54
/* 4B76C 8005DB4C 00000000 */   nop
/* 4B770 8005DB50 0D000600 */  break      6
.L8005DB54:
/* 4B774 8005DB54 12100000 */  mflo       $v0
/* 4B778 8005DB58 00000000 */  nop
/* 4B77C 8005DB5C 2C00A2AF */  sw         $v0, 0x2C($sp)
/* 4B780 8005DB60 7C04C386 */  lh         $v1, 0x47C($s6)
/* 4B784 8005DB64 0800628E */  lw         $v0, 0x8($s3)
/* 4B788 8005DB68 00000000 */  nop
/* 4B78C 8005DB6C 18004300 */  mult       $v0, $v1
/* 4B790 8005DB70 12100000 */  mflo       $v0
/* 4B794 8005DB74 7C040486 */  lh         $a0, 0x47C($s0)
/* 4B798 8005DB78 00000000 */  nop
/* 4B79C 8005DB7C 1800E400 */  mult       $a3, $a0
/* 4B7A0 8005DB80 12480000 */  mflo       $t1
/* 4B7A4 8005DB84 21186400 */  addu       $v1, $v1, $a0
/* 4B7A8 8005DB88 21104900 */  addu       $v0, $v0, $t1
/* 4B7AC 8005DB8C 1A004300 */  div        $zero, $v0, $v1
/* 4B7B0 8005DB90 02006014 */  bnez       $v1, .L8005DB9C
/* 4B7B4 8005DB94 00000000 */   nop
/* 4B7B8 8005DB98 0D000700 */  break      7
.L8005DB9C:
/* 4B7BC 8005DB9C FFFF0124 */  addiu      $at, $zero, -0x1
/* 4B7C0 8005DBA0 04006114 */  bne        $v1, $at, .L8005DBB4
/* 4B7C4 8005DBA4 0080013C */   lui       $at, (0x80000000 >> 16)
/* 4B7C8 8005DBA8 02004114 */  bne        $v0, $at, .L8005DBB4
/* 4B7CC 8005DBAC 00000000 */   nop
/* 4B7D0 8005DBB0 0D000600 */  break      6
.L8005DBB4:
/* 4B7D4 8005DBB4 12100000 */  mflo       $v0
/* 4B7D8 8005DBB8 2800B127 */  addiu      $s1, $sp, 0x28
/* 4B7DC 8005DBBC 21282002 */  addu       $a1, $s1, $zero
/* 4B7E0 8005DBC0 1800A627 */  addiu      $a2, $sp, 0x18
/* 4B7E4 8005DBC4 21208002 */  addu       $a0, $s4, $zero
/* 4B7E8 8005DBC8 01000724 */  addiu      $a3, $zero, 0x1
/* 4B7EC 8005DBCC D973010C */  jal        VehPhysCrash_BounceSelf
/* 4B7F0 8005DBD0 3000A2AF */   sw        $v0, 0x30($sp)
/* 4B7F4 8005DBD4 02004104 */  bgez       $v0, .L8005DBE0
/* 4B7F8 8005DBD8 21208002 */   addu      $a0, $s4, $zero
/* 4B7FC 8005DBDC 880A80AF */  sw         $zero, 0xA88($gp) /* Failed to symbolize address 0x00000A88 for %gp_rel. Make sure this address is within the recognized valid address space */
.L8005DBE0:
/* 4B800 8005DBE0 21282002 */  addu       $a1, $s1, $zero
/* 4B804 8005DBE4 21306002 */  addu       $a2, $s3, $zero
/* 4B808 8005DBE8 D973010C */  jal        VehPhysCrash_BounceSelf
/* 4B80C 8005DBEC 21380000 */   addu      $a3, $zero, $zero
/* 4B810 8005DBF0 02004018 */  blez       $v0, .L8005DBFC
/* 4B814 8005DBF4 00000000 */   nop
/* 4B818 8005DBF8 880A80AF */  sw         $zero, 0xA88($gp) /* Failed to symbolize address 0x00000A88 for %gp_rel. Make sure this address is within the recognized valid address space */
.L8005DBFC:
/* 4B81C 8005DBFC 1800A286 */  lh         $v0, 0x18($s5)
/* 4B820 8005DC00 00000000 */  nop
/* 4B824 8005DC04 18005200 */  mult       $v0, $s2
/* 4B828 8005DC08 0000628E */  lw         $v0, 0x0($s3)
/* 4B82C 8005DC0C 12400000 */  mflo       $t0
/* 4B830 8005DC10 031A0800 */  sra        $v1, $t0, 8
/* 4B834 8005DC14 21104300 */  addu       $v0, $v0, $v1
/* 4B838 8005DC18 000062AE */  sw         $v0, 0x0($s3)
/* 4B83C 8005DC1C 1A00A286 */  lh         $v0, 0x1A($s5)
/* 4B840 8005DC20 00000000 */  nop
/* 4B844 8005DC24 18005200 */  mult       $v0, $s2
/* 4B848 8005DC28 0400628E */  lw         $v0, 0x4($s3)
/* 4B84C 8005DC2C 12400000 */  mflo       $t0
/* 4B850 8005DC30 031A0800 */  sra        $v1, $t0, 8
/* 4B854 8005DC34 21104300 */  addu       $v0, $v0, $v1
/* 4B858 8005DC38 040062AE */  sw         $v0, 0x4($s3)
/* 4B85C 8005DC3C 1C00A286 */  lh         $v0, 0x1C($s5)
/* 4B860 8005DC40 00000000 */  nop
/* 4B864 8005DC44 18005200 */  mult       $v0, $s2
/* 4B868 8005DC48 0800628E */  lw         $v0, 0x8($s3)
/* 4B86C 8005DC4C 12400000 */  mflo       $t0
/* 4B870 8005DC50 031A0800 */  sra        $v1, $t0, 8
/* 4B874 8005DC54 21104300 */  addu       $v0, $v0, $v1
/* 4B878 8005DC58 080062AE */  sw         $v0, 0x8($s3)
/* 4B87C 8005DC5C 1800A286 */  lh         $v0, 0x18($s5)
/* 4B880 8005DC60 00000000 */  nop
/* 4B884 8005DC64 18005200 */  mult       $v0, $s2
/* 4B888 8005DC68 1800A28F */  lw         $v0, 0x18($sp)
/* 4B88C 8005DC6C 12400000 */  mflo       $t0
/* 4B890 8005DC70 031A0800 */  sra        $v1, $t0, 8
/* 4B894 8005DC74 23104300 */  subu       $v0, $v0, $v1
/* 4B898 8005DC78 1800A2AF */  sw         $v0, 0x18($sp)
/* 4B89C 8005DC7C 1A00A286 */  lh         $v0, 0x1A($s5)
/* 4B8A0 8005DC80 00000000 */  nop
/* 4B8A4 8005DC84 18005200 */  mult       $v0, $s2
/* 4B8A8 8005DC88 1C00A28F */  lw         $v0, 0x1C($sp)
/* 4B8AC 8005DC8C 12400000 */  mflo       $t0
/* 4B8B0 8005DC90 031A0800 */  sra        $v1, $t0, 8
/* 4B8B4 8005DC94 23104300 */  subu       $v0, $v0, $v1
/* 4B8B8 8005DC98 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 4B8BC 8005DC9C 1C00A286 */  lh         $v0, 0x1C($s5)
/* 4B8C0 8005DCA0 00000000 */  nop
/* 4B8C4 8005DCA4 18005200 */  mult       $v0, $s2
/* 4B8C8 8005DCA8 21200002 */  addu       $a0, $s0, $zero
/* 4B8CC 8005DCAC 1800A527 */  addiu      $a1, $sp, 0x18
/* 4B8D0 8005DCB0 2000A28F */  lw         $v0, 0x20($sp)
/* 4B8D4 8005DCB4 12400000 */  mflo       $t0
/* 4B8D8 8005DCB8 031A0800 */  sra        $v1, $t0, 8
/* 4B8DC 8005DCBC 23104300 */  subu       $v0, $v0, $v1
/* 4B8E0 8005DCC0 3474010C */  jal        VehPhysCrash_AI
/* 4B8E4 8005DCC4 2000A2AF */   sw        $v0, 0x20($sp)
/* 4B8E8 8005DCC8 BE770108 */  j          .L8005DEF8
/* 4B8EC 8005DCCC 00000000 */   nop
.L8005DCD0:
/* 4B8F0 8005DCD0 7C04C386 */  lh         $v1, 0x47C($s6)
/* 4B8F4 8005DCD4 0000628E */  lw         $v0, 0x0($s3)
/* 4B8F8 8005DCD8 00000000 */  nop
/* 4B8FC 8005DCDC 18004300 */  mult       $v0, $v1
/* 4B900 8005DCE0 7C040486 */  lh         $a0, 0x47C($s0)
/* 4B904 8005DCE4 12280000 */  mflo       $a1
/* 4B908 8005DCE8 8800028E */  lw         $v0, 0x88($s0)
/* 4B90C 8005DCEC 00000000 */  nop
/* 4B910 8005DCF0 18004400 */  mult       $v0, $a0
/* 4B914 8005DCF4 12480000 */  mflo       $t1
/* 4B918 8005DCF8 21186400 */  addu       $v1, $v1, $a0
/* 4B91C 8005DCFC 2110A900 */  addu       $v0, $a1, $t1
/* 4B920 8005DD00 1A004300 */  div        $zero, $v0, $v1
/* 4B924 8005DD04 02006014 */  bnez       $v1, .L8005DD10
/* 4B928 8005DD08 00000000 */   nop
/* 4B92C 8005DD0C 0D000700 */  break      7
.L8005DD10:
/* 4B930 8005DD10 FFFF0124 */  addiu      $at, $zero, -0x1
/* 4B934 8005DD14 04006114 */  bne        $v1, $at, .L8005DD28
/* 4B938 8005DD18 0080013C */   lui       $at, (0x80000000 >> 16)
/* 4B93C 8005DD1C 02004114 */  bne        $v0, $at, .L8005DD28
/* 4B940 8005DD20 00000000 */   nop
/* 4B944 8005DD24 0D000600 */  break      6
.L8005DD28:
/* 4B948 8005DD28 12100000 */  mflo       $v0
/* 4B94C 8005DD2C 00000000 */  nop
/* 4B950 8005DD30 2800A2AF */  sw         $v0, 0x28($sp)
/* 4B954 8005DD34 7C04C386 */  lh         $v1, 0x47C($s6)
/* 4B958 8005DD38 0400628E */  lw         $v0, 0x4($s3)
/* 4B95C 8005DD3C 00000000 */  nop
/* 4B960 8005DD40 18004300 */  mult       $v0, $v1
/* 4B964 8005DD44 7C040486 */  lh         $a0, 0x47C($s0)
/* 4B968 8005DD48 12280000 */  mflo       $a1
/* 4B96C 8005DD4C 8C00028E */  lw         $v0, 0x8C($s0)
/* 4B970 8005DD50 00000000 */  nop
/* 4B974 8005DD54 18004400 */  mult       $v0, $a0
/* 4B978 8005DD58 12480000 */  mflo       $t1
/* 4B97C 8005DD5C 21186400 */  addu       $v1, $v1, $a0
/* 4B980 8005DD60 2110A900 */  addu       $v0, $a1, $t1
/* 4B984 8005DD64 1A004300 */  div        $zero, $v0, $v1
/* 4B988 8005DD68 02006014 */  bnez       $v1, .L8005DD74
/* 4B98C 8005DD6C 00000000 */   nop
/* 4B990 8005DD70 0D000700 */  break      7
.L8005DD74:
/* 4B994 8005DD74 FFFF0124 */  addiu      $at, $zero, -0x1
/* 4B998 8005DD78 04006114 */  bne        $v1, $at, .L8005DD8C
/* 4B99C 8005DD7C 0080013C */   lui       $at, (0x80000000 >> 16)
/* 4B9A0 8005DD80 02004114 */  bne        $v0, $at, .L8005DD8C
/* 4B9A4 8005DD84 00000000 */   nop
/* 4B9A8 8005DD88 0D000600 */  break      6
.L8005DD8C:
/* 4B9AC 8005DD8C 12100000 */  mflo       $v0
/* 4B9B0 8005DD90 00000000 */  nop
/* 4B9B4 8005DD94 2C00A2AF */  sw         $v0, 0x2C($sp)
/* 4B9B8 8005DD98 7C04C386 */  lh         $v1, 0x47C($s6)
/* 4B9BC 8005DD9C 0800628E */  lw         $v0, 0x8($s3)
/* 4B9C0 8005DDA0 00000000 */  nop
/* 4B9C4 8005DDA4 18004300 */  mult       $v0, $v1
/* 4B9C8 8005DDA8 7C040486 */  lh         $a0, 0x47C($s0)
/* 4B9CC 8005DDAC 12280000 */  mflo       $a1
/* 4B9D0 8005DDB0 9000028E */  lw         $v0, 0x90($s0)
/* 4B9D4 8005DDB4 00000000 */  nop
/* 4B9D8 8005DDB8 18004400 */  mult       $v0, $a0
/* 4B9DC 8005DDBC 12480000 */  mflo       $t1
/* 4B9E0 8005DDC0 21186400 */  addu       $v1, $v1, $a0
/* 4B9E4 8005DDC4 2110A900 */  addu       $v0, $a1, $t1
/* 4B9E8 8005DDC8 1A004300 */  div        $zero, $v0, $v1
/* 4B9EC 8005DDCC 02006014 */  bnez       $v1, .L8005DDD8
/* 4B9F0 8005DDD0 00000000 */   nop
/* 4B9F4 8005DDD4 0D000700 */  break      7
.L8005DDD8:
/* 4B9F8 8005DDD8 FFFF0124 */  addiu      $at, $zero, -0x1
/* 4B9FC 8005DDDC 04006114 */  bne        $v1, $at, .L8005DDF0
/* 4BA00 8005DDE0 0080013C */   lui       $at, (0x80000000 >> 16)
/* 4BA04 8005DDE4 02004114 */  bne        $v0, $at, .L8005DDF0
/* 4BA08 8005DDE8 00000000 */   nop
/* 4BA0C 8005DDEC 0D000600 */  break      6
.L8005DDF0:
/* 4BA10 8005DDF0 12100000 */  mflo       $v0
/* 4BA14 8005DDF4 2800B127 */  addiu      $s1, $sp, 0x28
/* 4BA18 8005DDF8 88000626 */  addiu      $a2, $s0, 0x88
/* 4BA1C 8005DDFC 01000724 */  addiu      $a3, $zero, 0x1
/* 4BA20 8005DE00 21208002 */  addu       $a0, $s4, $zero
/* 4BA24 8005DE04 21282002 */  addu       $a1, $s1, $zero
/* 4BA28 8005DE08 D973010C */  jal        VehPhysCrash_BounceSelf
/* 4BA2C 8005DE0C 3000A2AF */   sw        $v0, 0x30($sp)
/* 4BA30 8005DE10 02004104 */  bgez       $v0, .L8005DE1C
/* 4BA34 8005DE14 21208002 */   addu      $a0, $s4, $zero
/* 4BA38 8005DE18 880A80AF */  sw         $zero, 0xA88($gp) /* Failed to symbolize address 0x00000A88 for %gp_rel. Make sure this address is within the recognized valid address space */
.L8005DE1C:
/* 4BA3C 8005DE1C 21282002 */  addu       $a1, $s1, $zero
/* 4BA40 8005DE20 21306002 */  addu       $a2, $s3, $zero
/* 4BA44 8005DE24 D973010C */  jal        VehPhysCrash_BounceSelf
/* 4BA48 8005DE28 21380000 */   addu      $a3, $zero, $zero
/* 4BA4C 8005DE2C 02004018 */  blez       $v0, .L8005DE38
/* 4BA50 8005DE30 00000000 */   nop
/* 4BA54 8005DE34 880A80AF */  sw         $zero, 0xA88($gp) /* Failed to symbolize address 0x00000A88 for %gp_rel. Make sure this address is within the recognized valid address space */
.L8005DE38:
/* 4BA58 8005DE38 1800A286 */  lh         $v0, 0x18($s5)
/* 4BA5C 8005DE3C 00000000 */  nop
/* 4BA60 8005DE40 18005200 */  mult       $v0, $s2
/* 4BA64 8005DE44 0000628E */  lw         $v0, 0x0($s3)
/* 4BA68 8005DE48 12400000 */  mflo       $t0
/* 4BA6C 8005DE4C 031A0800 */  sra        $v1, $t0, 8
/* 4BA70 8005DE50 21104300 */  addu       $v0, $v0, $v1
/* 4BA74 8005DE54 000062AE */  sw         $v0, 0x0($s3)
/* 4BA78 8005DE58 1A00A286 */  lh         $v0, 0x1A($s5)
/* 4BA7C 8005DE5C 00000000 */  nop
/* 4BA80 8005DE60 18005200 */  mult       $v0, $s2
/* 4BA84 8005DE64 0400628E */  lw         $v0, 0x4($s3)
/* 4BA88 8005DE68 12400000 */  mflo       $t0
/* 4BA8C 8005DE6C 031A0800 */  sra        $v1, $t0, 8
/* 4BA90 8005DE70 21104300 */  addu       $v0, $v0, $v1
/* 4BA94 8005DE74 040062AE */  sw         $v0, 0x4($s3)
/* 4BA98 8005DE78 1C00A286 */  lh         $v0, 0x1C($s5)
/* 4BA9C 8005DE7C 00000000 */  nop
/* 4BAA0 8005DE80 18005200 */  mult       $v0, $s2
/* 4BAA4 8005DE84 0800628E */  lw         $v0, 0x8($s3)
/* 4BAA8 8005DE88 12400000 */  mflo       $t0
/* 4BAAC 8005DE8C 031A0800 */  sra        $v1, $t0, 8
/* 4BAB0 8005DE90 21104300 */  addu       $v0, $v0, $v1
/* 4BAB4 8005DE94 080062AE */  sw         $v0, 0x8($s3)
/* 4BAB8 8005DE98 1800A286 */  lh         $v0, 0x18($s5)
/* 4BABC 8005DE9C 00000000 */  nop
/* 4BAC0 8005DEA0 18005200 */  mult       $v0, $s2
/* 4BAC4 8005DEA4 8800028E */  lw         $v0, 0x88($s0)
/* 4BAC8 8005DEA8 12400000 */  mflo       $t0
/* 4BACC 8005DEAC 031A0800 */  sra        $v1, $t0, 8
/* 4BAD0 8005DEB0 23104300 */  subu       $v0, $v0, $v1
/* 4BAD4 8005DEB4 880002AE */  sw         $v0, 0x88($s0)
/* 4BAD8 8005DEB8 1A00A286 */  lh         $v0, 0x1A($s5)
/* 4BADC 8005DEBC 00000000 */  nop
/* 4BAE0 8005DEC0 18005200 */  mult       $v0, $s2
/* 4BAE4 8005DEC4 8C00028E */  lw         $v0, 0x8C($s0)
/* 4BAE8 8005DEC8 12400000 */  mflo       $t0
/* 4BAEC 8005DECC 031A0800 */  sra        $v1, $t0, 8
/* 4BAF0 8005DED0 23104300 */  subu       $v0, $v0, $v1
/* 4BAF4 8005DED4 8C0002AE */  sw         $v0, 0x8C($s0)
/* 4BAF8 8005DED8 1C00A286 */  lh         $v0, 0x1C($s5)
/* 4BAFC 8005DEDC 00000000 */  nop
/* 4BB00 8005DEE0 18005200 */  mult       $v0, $s2
/* 4BB04 8005DEE4 9000028E */  lw         $v0, 0x90($s0)
/* 4BB08 8005DEE8 12400000 */  mflo       $t0
/* 4BB0C 8005DEEC 031A0800 */  sra        $v1, $t0, 8
/* 4BB10 8005DEF0 23104300 */  subu       $v0, $v0, $v1
/* 4BB14 8005DEF4 900002AE */  sw         $v0, 0x90($s0)
.L8005DEF8:
/* 4BB18 8005DEF8 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 4BB1C 8005DEFC ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 4BB20 8005DF00 00000000 */  nop
/* 4BB24 8005DF04 F81C438C */  lw         $v1, 0x1CF8($v0)
/* 4BB28 8005DF08 0980023C */  lui        $v0, %hi(D_8008D838)
/* 4BB2C 8005DF0C 38D8428C */  lw         $v0, %lo(D_8008D838)($v0)
/* 4BB30 8005DF10 880A848F */  lw         $a0, 0xA88($gp) /* Failed to symbolize address 0x00000A88 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 4BB34 8005DF14 23906200 */  subu       $s2, $v1, $v0
/* 4BB38 8005DF18 0300422E */  sltiu      $v0, $s2, 0x3
/* 4BB3C 8005DF1C 01005238 */  xori       $s2, $v0, 0x1
/* 4BB40 8005DF20 01028228 */  slti       $v0, $a0, 0x201
/* 4BB44 8005DF24 62004014 */  bnez       $v0, .L8005E0B0
/* 4BB48 8005DF28 18000324 */   addiu     $v1, $zero, 0x18
/* 4BB4C 8005DF2C 4400E286 */  lh         $v0, 0x44($s7)
/* 4BB50 8005DF30 00000000 */  nop
/* 4BB54 8005DF34 07004310 */  beq        $v0, $v1, .L8005DF54
/* 4BB58 8005DF38 FF000224 */   addiu     $v0, $zero, 0xFF
/* 4BB5C 8005DF3C 0800A28E */  lw         $v0, 0x8($s5)
/* 4BB60 8005DF40 00000000 */  nop
/* 4BB64 8005DF44 44004284 */  lh         $v0, 0x44($v0)
/* 4BB68 8005DF48 00000000 */  nop
/* 4BB6C 8005DF4C 2E004314 */  bne        $v0, $v1, .L8005E008
/* 4BB70 8005DF50 FF000224 */   addiu     $v0, $zero, 0xFF
.L8005DF54:
/* 4BB74 8005DF54 1000A2AF */  sw         $v0, 0x10($sp)
/* 4BB78 8005DF58 21280000 */  addu       $a1, $zero, $zero
/* 4BB7C 8005DF5C 00190624 */  addiu      $a2, $zero, 0x1900
/* 4BB80 8005DF60 E763010C */  jal        DECOMP_VehCalc_MapToRange
/* 4BB84 8005DF64 3F000724 */   addiu     $a3, $zero, 0x3F
/* 4BB88 8005DF68 27004012 */  beqz       $s2, .L8005E008
/* 4BB8C 8005DF6C 21884000 */   addu      $s1, $v0, $zero
/* 4BB90 8005DF70 7603C292 */  lbu        $v0, 0x376($s6)
/* 4BB94 8005DF74 06000324 */  addiu      $v1, $zero, 0x6
/* 4BB98 8005DF78 24004310 */  beq        $v0, $v1, .L8005E00C
/* 4BB9C 8005DF7C 21200002 */   addu      $a0, $s0, $zero
/* 4BBA0 8005DF80 2400C28E */  lw         $v0, 0x24($s6)
/* 4BBA4 8005DF84 00000000 */  nop
/* 4BBA8 8005DF88 21004014 */  bnez       $v0, .L8005E010
/* 4BBAC 8005DF8C 08000524 */   addiu     $a1, $zero, 0x8
/* 4BBB0 8005DF90 76030292 */  lbu        $v0, 0x376($s0)
/* 4BBB4 8005DF94 00000000 */  nop
/* 4BBB8 8005DF98 1D004310 */  beq        $v0, $v1, .L8005E010
/* 4BBBC 8005DF9C 00000000 */   nop
/* 4BBC0 8005DFA0 2400028E */  lw         $v0, 0x24($s0)
/* 4BBC4 8005DFA4 00000000 */  nop
/* 4BBC8 8005DFA8 19004014 */  bnez       $v0, .L8005E010
/* 4BBCC 8005DFAC 00000000 */   nop
/* 4BBD0 8005DFB0 CA02C496 */  lhu        $a0, 0x2CA($s6)
/* 4BBD4 8005DFB4 21282002 */  addu       $a1, $s1, $zero
/* 4BBD8 8005DFB8 D8B9000C */  jal        OtherFX_DriverCrashing
/* 4BBDC 8005DFBC 01008430 */   andi      $a0, $a0, 0x1
/* 4BBE0 8005DFC0 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 4BBE4 8005DFC4 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 4BBE8 8005DFC8 00000000 */  nop
/* 4BBEC 8005DFCC F81C428C */  lw         $v0, 0x1CF8($v0)
/* 4BBF0 8005DFD0 0980013C */  lui        $at, %hi(D_8008D838)
/* 4BBF4 8005DFD4 38D822AC */  sw         $v0, %lo(D_8008D838)($at)
/* 4BBF8 8005DFD8 DD00222E */  sltiu      $v0, $s1, 0xDD
/* 4BBFC 8005DFDC 0B004014 */  bnez       $v0, .L8005E00C
/* 4BC00 8005DFE0 21200002 */   addu      $a0, $s0, $zero
/* 4BC04 8005DFE4 05000424 */  addiu      $a0, $zero, 0x5
/* 4BC08 8005DFE8 0880033C */  lui        $v1, %hi(D_80086E84)
/* 4BC0C 8005DFEC 4A00C292 */  lbu        $v0, 0x4A($s6)
/* 4BC10 8005DFF0 846E6324 */  addiu      $v1, $v1, %lo(D_80086E84)
/* 4BC14 8005DFF4 40100200 */  sll        $v0, $v0, 1
/* 4BC18 8005DFF8 21104300 */  addu       $v0, $v0, $v1
/* 4BC1C 8005DFFC 00004584 */  lh         $a1, 0x0($v0)
/* 4BC20 8005E000 FAB2000C */  jal        Voiceline_RequestPlay
/* 4BC24 8005E004 10000624 */   addiu     $a2, $zero, 0x10
.L8005E008:
/* 4BC28 8005E008 21200002 */  addu       $a0, $s0, $zero
.L8005E00C:
/* 4BC2C 8005E00C 08000524 */  addiu      $a1, $zero, 0x8
.L8005E010:
/* 4BC30 8005E010 1099000C */  jal        DECOMP_GAMEPAD_ShockFreq
/* 4BC34 8005E014 21300000 */   addu      $a2, $zero, $zero
/* 4BC38 8005E018 21200002 */  addu       $a0, $s0, $zero
/* 4BC3C 8005E01C 08000524 */  addiu      $a1, $zero, 0x8
/* 4BC40 8005E020 3099000C */  jal        DECOMP_GAMEPAD_ShockForce1
/* 4BC44 8005E024 7F000624 */   addiu     $a2, $zero, 0x7F
/* 4BC48 8005E028 4B000282 */  lb         $v0, 0x4B($s0)
/* 4BC4C 8005E02C 00000000 */  nop
/* 4BC50 8005E030 03004018 */  blez       $v0, .L8005E040
/* 4BC54 8005E034 21200002 */   addu      $a0, $s0, $zero
/* 4BC58 8005E038 11780108 */  j          .L8005E044
/* 4BC5C 8005E03C 29000524 */   addiu     $a1, $zero, 0x29
.L8005E040:
/* 4BC60 8005E040 19000524 */  addiu      $a1, $zero, 0x19
.L8005E044:
/* 4BC64 8005E044 E898000C */  jal        DECOMP_GAMEPAD_JogCon1
/* 4BC68 8005E048 60000624 */   addiu     $a2, $zero, 0x60
/* 4BC6C 8005E04C 2120C002 */  addu       $a0, $s6, $zero
/* 4BC70 8005E050 08000524 */  addiu      $a1, $zero, 0x8
/* 4BC74 8005E054 1099000C */  jal        DECOMP_GAMEPAD_ShockFreq
/* 4BC78 8005E058 21300000 */   addu      $a2, $zero, $zero
/* 4BC7C 8005E05C 2120C002 */  addu       $a0, $s6, $zero
/* 4BC80 8005E060 08000524 */  addiu      $a1, $zero, 0x8
/* 4BC84 8005E064 3099000C */  jal        DECOMP_GAMEPAD_ShockForce1
/* 4BC88 8005E068 7F000624 */   addiu     $a2, $zero, 0x7F
/* 4BC8C 8005E06C 4B00C282 */  lb         $v0, 0x4B($s6)
/* 4BC90 8005E070 00000000 */  nop
/* 4BC94 8005E074 03004018 */  blez       $v0, .L8005E084
/* 4BC98 8005E078 2120C002 */   addu      $a0, $s6, $zero
/* 4BC9C 8005E07C 22780108 */  j          .L8005E088
/* 4BCA0 8005E080 29000524 */   addiu     $a1, $zero, 0x29
.L8005E084:
/* 4BCA4 8005E084 19000524 */  addiu      $a1, $zero, 0x19
.L8005E088:
/* 4BCA8 8005E088 E898000C */  jal        DECOMP_GAMEPAD_JogCon1
/* 4BCAC 8005E08C 60000624 */   addiu     $a2, $zero, 0x60
/* 4BCB0 8005E090 C802C28E */  lw         $v0, 0x2C8($s6)
/* 4BCB4 8005E094 0010033C */  lui        $v1, (0x10000000 >> 16)
/* 4BCB8 8005E098 25104300 */  or         $v0, $v0, $v1
/* 4BCBC 8005E09C C802C2AE */  sw         $v0, 0x2C8($s6)
/* 4BCC0 8005E0A0 C802028E */  lw         $v0, 0x2C8($s0)
/* 4BCC4 8005E0A4 00000000 */  nop
/* 4BCC8 8005E0A8 25104300 */  or         $v0, $v0, $v1
/* 4BCCC 8005E0AC C80202AE */  sw         $v0, 0x2C8($s0)
.L8005E0B0:
/* 4BCD0 8005E0B0 2120C002 */  addu       $a0, $s6, $zero
/* 4BCD4 8005E0B4 21280002 */  addu       $a1, $s0, $zero
/* 4BCD8 8005E0B8 21304002 */  addu       $a2, $s2, $zero
/* 4BCDC 8005E0BC 8674010C */  jal        VehPhysCrash_Attack
/* 4BCE0 8005E0C0 21380000 */   addu      $a3, $zero, $zero
/* 4BCE4 8005E0C4 21200002 */  addu       $a0, $s0, $zero
/* 4BCE8 8005E0C8 2128C002 */  addu       $a1, $s6, $zero
/* 4BCEC 8005E0CC 21304000 */  addu       $a2, $v0, $zero
/* 4BCF0 8005E0D0 8674010C */  jal        VehPhysCrash_Attack
/* 4BCF4 8005E0D4 01000724 */   addiu     $a3, $zero, 0x1
.L8005E0D8:
/* 4BCF8 8005E0D8 5800BF8F */  lw         $ra, 0x58($sp)
/* 4BCFC 8005E0DC 5400B78F */  lw         $s7, 0x54($sp)
/* 4BD00 8005E0E0 5000B68F */  lw         $s6, 0x50($sp)
/* 4BD04 8005E0E4 4C00B58F */  lw         $s5, 0x4C($sp)
/* 4BD08 8005E0E8 4800B48F */  lw         $s4, 0x48($sp)
/* 4BD0C 8005E0EC 4400B38F */  lw         $s3, 0x44($sp)
/* 4BD10 8005E0F0 4000B28F */  lw         $s2, 0x40($sp)
/* 4BD14 8005E0F4 3C00B18F */  lw         $s1, 0x3C($sp)
/* 4BD18 8005E0F8 3800B08F */  lw         $s0, 0x38($sp)
/* 4BD1C 8005E0FC 0800E003 */  jr         $ra
/* 4BD20 8005E100 6000BD27 */   addiu     $sp, $sp, 0x60
.size VehPhysCrash_AnyTwoCars, . - VehPhysCrash_AnyTwoCars
