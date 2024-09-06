.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel VehPhysForce_OnGravity
/* 4BE34 8005E214 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 4BE38 8005E218 3000B4AF */  sw         $s4, 0x30($sp)
/* 4BE3C 8005E21C 21A08000 */  addu       $s4, $a0, $zero
/* 4BE40 8005E220 4400BFAF */  sw         $ra, 0x44($sp)
/* 4BE44 8005E224 4000BEAF */  sw         $fp, 0x40($sp)
/* 4BE48 8005E228 3C00B7AF */  sw         $s7, 0x3C($sp)
/* 4BE4C 8005E22C 3800B6AF */  sw         $s6, 0x38($sp)
/* 4BE50 8005E230 3400B5AF */  sw         $s5, 0x34($sp)
/* 4BE54 8005E234 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 4BE58 8005E238 2800B2AF */  sw         $s2, 0x28($sp)
/* 4BE5C 8005E23C 2400B1AF */  sw         $s1, 0x24($sp)
/* 4BE60 8005E240 2000B0AF */  sw         $s0, 0x20($sp)
/* 4BE64 8005E244 4C00A5AF */  sw         $a1, 0x4C($sp)
/* 4BE68 8005E248 1003858E */  lw         $a1, 0x310($s4)
/* 4BE6C 8005E24C 1403848E */  lw         $a0, 0x314($s4)
/* 4BE70 8005E250 1803878E */  lw         $a3, 0x318($s4)
/* 4BE74 8005E254 1C03868E */  lw         $a2, 0x31C($s4)
/* 4BE78 8005E258 20038886 */  lh         $t0, 0x320($s4)
/* 4BE7C 8005E25C 0000C548 */  ctc2       $a1, $0 /* handwritten instruction */
/* 4BE80 8005E260 0008C448 */  ctc2       $a0, $1 /* handwritten instruction */
/* 4BE84 8005E264 0010C748 */  ctc2       $a3, $2 /* handwritten instruction */
/* 4BE88 8005E268 0018C648 */  ctc2       $a2, $3 /* handwritten instruction */
/* 4BE8C 8005E26C 0020C848 */  ctc2       $t0, $4 /* handwritten instruction */
/* 4BE90 8005E270 FFFF093C */  lui        $t1, (0xFFFF0000 >> 16)
/* 4BE94 8005E274 FFFFA230 */  andi       $v0, $a1, 0xFFFF
/* 4BE98 8005E278 24188900 */  and        $v1, $a0, $t1
/* 4BE9C 8005E27C 25104300 */  or         $v0, $v0, $v1
/* 4BEA0 8005E280 0040C248 */  ctc2       $v0, $8 /* handwritten instruction */
/* 4BEA4 8005E284 FFFFC230 */  andi       $v0, $a2, 0xFFFF
/* 4BEA8 8005E288 2428A900 */  and        $a1, $a1, $t1
/* 4BEAC 8005E28C 25104500 */  or         $v0, $v0, $a1
/* 4BEB0 8005E290 0048C248 */  ctc2       $v0, $9 /* handwritten instruction */
/* 4BEB4 8005E294 FFFFE230 */  andi       $v0, $a3, 0xFFFF
/* 4BEB8 8005E298 2430C900 */  and        $a2, $a2, $t1
/* 4BEBC 8005E29C 25104600 */  or         $v0, $v0, $a2
/* 4BEC0 8005E2A0 0050C248 */  ctc2       $v0, $10 /* handwritten instruction */
/* 4BEC4 8005E2A4 FFFF8430 */  andi       $a0, $a0, 0xFFFF
/* 4BEC8 8005E2A8 2438E900 */  and        $a3, $a3, $t1
/* 4BECC 8005E2AC 25208700 */  or         $a0, $a0, $a3
/* 4BED0 8005E2B0 0058C448 */  ctc2       $a0, $11 /* handwritten instruction */
/* 4BED4 8005E2B4 0060C848 */  ctc2       $t0, $12 /* handwritten instruction */
/* 4BED8 8005E2B8 4C00AA8F */  lw         $t2, 0x4C($sp)
/* 4BEDC 8005E2BC 00000000 */  nop
/* 4BEE0 8005E2C0 0400428D */  lw         $v0, 0x4($t2)
/* 4BEE4 8005E2C4 00004395 */  lhu        $v1, 0x0($t2)
/* 4BEE8 8005E2C8 00140200 */  sll        $v0, $v0, 16
/* 4BEEC 8005E2CC 25186200 */  or         $v1, $v1, $v0
/* 4BEF0 8005E2D0 00008348 */  mtc2       $v1, $0 /* handwritten instruction */
/* 4BEF4 8005E2D4 08004B8D */  lw         $t3, 0x8($t2)
/* 4BEF8 8005E2D8 00000000 */  nop
/* 4BEFC 8005E2DC 00088B48 */  mtc2       $t3, $1 /* handwritten instruction */
/* 4BF00 8005E2E0 00000000 */  nop
/* 4BF04 8005E2E4 00000000 */  nop
/* 4BF08 8005E2E8 12604A4A */  MVMVA      1, 1, 0, 3, 0
/* 4BF0C 8005E2EC 00C81548 */  mfc2       $s5, $25 /* handwritten instruction */
/* 4BF10 8005E2F0 00D01E48 */  mfc2       $fp, $26 /* handwritten instruction */
/* 4BF14 8005E2F4 00D81348 */  mfc2       $s3, $27 /* handwritten instruction */
/* 4BF18 8005E2F8 16048286 */  lh         $v0, 0x416($s4)
/* 4BF1C 8005E2FC 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 4BF20 8005E300 ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 4BF24 8005E304 23480200 */  negu       $t1, $v0
/* 4BF28 8005E308 5003828E */  lw         $v0, 0x350($s4)
/* 4BF2C 8005E30C 2138C003 */  addu       $a3, $fp, $zero
/* 4BF30 8005E310 1000B3AF */  sw         $s3, 0x10($sp)
/* 4BF34 8005E314 041D638C */  lw         $v1, 0x1D04($v1)
/* 4BF38 8005E318 12004294 */  lhu        $v0, 0x12($v0)
/* 4BF3C 8005E31C 2140A002 */  addu       $t0, $s5, $zero
/* 4BF40 8005E320 02004230 */  andi       $v0, $v0, 0x2
/* 4BF44 8005E324 0C004010 */  beqz       $v0, .L8005E358
/* 4BF48 8005E328 1400A3AF */   sw        $v1, 0x14($sp)
/* 4BF4C 8005E32C EB51033C */  lui        $v1, (0x51EB851F >> 16)
/* 4BF50 8005E330 1F856334 */  ori        $v1, $v1, (0x51EB851F & 0xFFFF)
/* 4BF54 8005E334 80100900 */  sll        $v0, $t1, 2
/* 4BF58 8005E338 21104900 */  addu       $v0, $v0, $t1
/* 4BF5C 8005E33C C0100200 */  sll        $v0, $v0, 3
/* 4BF60 8005E340 21104900 */  addu       $v0, $v0, $t1
/* 4BF64 8005E344 18004300 */  mult       $v0, $v1
/* 4BF68 8005E348 C3170200 */  sra        $v0, $v0, 31
/* 4BF6C 8005E34C 10500000 */  mfhi       $t2
/* 4BF70 8005E350 43190A00 */  sra        $v1, $t2, 5
/* 4BF74 8005E354 23486200 */  subu       $t1, $v1, $v0
.L8005E358:
/* 4BF78 8005E358 1400AA8F */  lw         $t2, 0x14($sp)
/* 4BF7C 8005E35C 00000000 */  nop
/* 4BF80 8005E360 18002A01 */  mult       $t1, $t2
/* 4BF84 8005E364 12580000 */  mflo       $t3
/* 4BF88 8005E368 43110B00 */  sra        $v0, $t3, 5
/* 4BF8C 8005E36C 00140200 */  sll        $v0, $v0, 16
/* 4BF90 8005E370 00008248 */  mtc2       $v0, $0 /* handwritten instruction */
/* 4BF94 8005E374 21500000 */  addu       $t2, $zero, $zero
/* 4BF98 8005E378 00088A48 */  mtc2       $t2, $1 /* handwritten instruction */
/* 4BF9C 8005E37C 00000000 */  nop
/* 4BFA0 8005E380 00000000 */  nop
/* 4BFA4 8005E384 12604A4A */  MVMVA      1, 1, 0, 3, 0
/* 4BFA8 8005E388 00C80448 */  mfc2       $a0, $25 /* handwritten instruction */
/* 4BFAC 8005E38C 00D00548 */  mfc2       $a1, $26 /* handwritten instruction */
/* 4BFB0 8005E390 00D80348 */  mfc2       $v1, $27 /* handwritten instruction */
/* 4BFB4 8005E394 B2038986 */  lh         $t1, 0x3B2($s4)
/* 4BFB8 8005E398 03006104 */  bgez       $v1, .L8005E3A8
/* 4BFBC 8005E39C 00000000 */   nop
/* 4BFC0 8005E3A0 0500201D */  bgtz       $t1, .L8005E3B8
/* 4BFC4 8005E3A4 00000000 */   nop
.L8005E3A8:
/* 4BFC8 8005E3A8 04006018 */  blez       $v1, .L8005E3BC
/* 4BFCC 8005E3AC 00000000 */   nop
/* 4BFD0 8005E3B0 02002105 */  bgez       $t1, .L8005E3BC
/* 4BFD4 8005E3B4 00000000 */   nop
.L8005E3B8:
/* 4BFD8 8005E3B8 21180000 */  addu       $v1, $zero, $zero
.L8005E3BC:
/* 4BFDC 8005E3BC C802978E */  lw         $s7, 0x2C8($s4)
/* 4BFE0 8005E3C0 8E038686 */  lh         $a2, 0x38E($s4)
/* 4BFE4 8005E3C4 9C039686 */  lh         $s6, 0x39C($s4)
/* 4BFE8 8005E3C8 0800E232 */  andi       $v0, $s7, 0x8
/* 4BFEC 8005E3CC 09004014 */  bnez       $v0, .L8005E3F4
/* 4BFF0 8005E3D0 00000000 */   nop
/* 4BFF4 8005E3D4 0300C01A */  blez       $s6, .L8005E3E4
/* 4BFF8 8005E3D8 00000000 */   nop
/* 4BFFC 8005E3DC 0500C004 */  bltz       $a2, .L8005E3F4
/* 4C000 8005E3E0 00000000 */   nop
.L8005E3E4:
/* 4C004 8005E3E4 0500C106 */  bgez       $s6, .L8005E3FC
/* 4C008 8005E3E8 00000000 */   nop
/* 4C00C 8005E3EC 0300C018 */  blez       $a2, .L8005E3FC
/* 4C010 8005E3F0 00000000 */   nop
.L8005E3F4:
/* 4C014 8005E3F4 21200000 */  addu       $a0, $zero, $zero
/* 4C018 8005E3F8 21188000 */  addu       $v1, $a0, $zero
.L8005E3FC:
/* 4C01C 8005E3FC 21A8A402 */  addu       $s5, $s5, $a0
/* 4C020 8005E400 21F0C503 */  addu       $fp, $fp, $a1
/* 4C024 8005E404 9E038586 */  lh         $a1, 0x39E($s4)
/* 4C028 8005E408 7E048486 */  lh         $a0, 0x47E($s4)
/* 4C02C 8005E40C 21986302 */  addu       $s3, $s3, $v1
/* 4C030 8005E410 2148A400 */  addu       $t1, $a1, $a0
/* 4C034 8005E414 2A103301 */  slt        $v0, $t1, $s3
/* 4C038 8005E418 07004010 */  beqz       $v0, .L8005E438
/* 4C03C 8005E41C 43100400 */   sra       $v0, $a0, 1
/* 4C040 8005E420 1000B38F */  lw         $s3, 0x10($sp)
/* 4C044 8005E424 00000000 */  nop
/* 4C048 8005E428 2A106902 */  slt        $v0, $s3, $t1
/* 4C04C 8005E42C 02004010 */  beqz       $v0, .L8005E438
/* 4C050 8005E430 43100400 */   sra       $v0, $a0, 1
/* 4C054 8005E434 21982001 */  addu       $s3, $t1, $zero
.L8005E438:
/* 4C058 8005E438 2348A200 */  subu       $t1, $a1, $v0
/* 4C05C 8005E43C 2A106902 */  slt        $v0, $s3, $t1
/* 4C060 8005E440 07004010 */  beqz       $v0, .L8005E460
/* 4C064 8005E444 00000000 */   nop
/* 4C068 8005E448 1000B38F */  lw         $s3, 0x10($sp)
/* 4C06C 8005E44C 00000000 */  nop
/* 4C070 8005E450 2A103301 */  slt        $v0, $t1, $s3
/* 4C074 8005E454 02004010 */  beqz       $v0, .L8005E460
/* 4C078 8005E458 00000000 */   nop
/* 4C07C 8005E45C 21982001 */  addu       $s3, $t1, $zero
.L8005E460:
/* 4C080 8005E460 5803828E */  lw         $v0, 0x358($s4)
/* 4C084 8005E464 80048986 */  lh         $t1, 0x480($s4)
/* 4C088 8005E468 0400428C */  lw         $v0, 0x4($v0)
/* 4C08C 8005E46C 2A183501 */  slt        $v1, $t1, $s5
/* 4C090 8005E470 06006010 */  beqz       $v1, .L8005E48C
/* 4C094 8005E474 1800A2AF */   sw        $v0, 0x18($sp)
/* 4C098 8005E478 21A80001 */  addu       $s5, $t0, $zero
/* 4C09C 8005E47C 2A10A902 */  slt        $v0, $s5, $t1
/* 4C0A0 8005E480 03004010 */  beqz       $v0, .L8005E490
/* 4C0A4 8005E484 23180900 */   negu      $v1, $t1
/* 4C0A8 8005E488 21A82001 */  addu       $s5, $t1, $zero
.L8005E48C:
/* 4C0AC 8005E48C 23180900 */  negu       $v1, $t1
.L8005E490:
/* 4C0B0 8005E490 2A10A302 */  slt        $v0, $s5, $v1
/* 4C0B4 8005E494 04004010 */  beqz       $v0, .L8005E4A8
/* 4C0B8 8005E498 2A106800 */   slt       $v0, $v1, $t0
/* 4C0BC 8005E49C 02004010 */  beqz       $v0, .L8005E4A8
/* 4C0C0 8005E4A0 21A80001 */   addu      $s5, $t0, $zero
/* 4C0C4 8005E4A4 21A86000 */  addu       $s5, $v1, $zero
.L8005E4A8:
/* 4C0C8 8005E4A8 42048986 */  lh         $t1, 0x442($s4)
/* 4C0CC 8005E4AC 0A00C107 */  bgez       $fp, .L8005E4D8
/* 4C0D0 8005E4B0 2A103E01 */   slt       $v0, $t1, $fp
/* 4C0D4 8005E4B4 1800AB8F */  lw         $t3, 0x18($sp)
/* 4C0D8 8005E4B8 00000000 */  nop
/* 4C0DC 8005E4BC 80006231 */  andi       $v0, $t3, 0x80
/* 4C0E0 8005E4C0 04004010 */  beqz       $v0, .L8005E4D4
/* 4C0E4 8005E4C4 00FFE228 */   slti      $v0, $a3, -0x100
/* 4C0E8 8005E4C8 02004010 */  beqz       $v0, .L8005E4D4
/* 4C0EC 8005E4CC 00010924 */   addiu     $t1, $zero, 0x100
/* 4C0F0 8005E4D0 00FF0724 */  addiu      $a3, $zero, -0x100
.L8005E4D4:
/* 4C0F4 8005E4D4 2A103E01 */  slt        $v0, $t1, $fp
.L8005E4D8:
/* 4C0F8 8005E4D8 05004010 */  beqz       $v0, .L8005E4F0
/* 4C0FC 8005E4DC 2A10E900 */   slt       $v0, $a3, $t1
/* 4C100 8005E4E0 21F0E000 */  addu       $fp, $a3, $zero
/* 4C104 8005E4E4 03004010 */  beqz       $v0, .L8005E4F4
/* 4C108 8005E4E8 23180900 */   negu      $v1, $t1
/* 4C10C 8005E4EC 21F02001 */  addu       $fp, $t1, $zero
.L8005E4F0:
/* 4C110 8005E4F0 23180900 */  negu       $v1, $t1
.L8005E4F4:
/* 4C114 8005E4F4 2A10C303 */  slt        $v0, $fp, $v1
/* 4C118 8005E4F8 04004010 */  beqz       $v0, .L8005E50C
/* 4C11C 8005E4FC 2A106700 */   slt       $v0, $v1, $a3
/* 4C120 8005E500 02004010 */  beqz       $v0, .L8005E50C
/* 4C124 8005E504 21F0E000 */   addu      $fp, $a3, $zero
/* 4C128 8005E508 21F06000 */  addu       $fp, $v1, $zero
.L8005E50C:
/* 4C12C 8005E50C 76038592 */  lbu        $a1, 0x376($s4)
/* 4C130 8005E510 05000224 */  addiu      $v0, $zero, 0x5
/* 4C134 8005E514 0400A214 */  bne        $a1, $v0, .L8005E528
/* 4C138 8005E518 00000000 */   nop
/* 4C13C 8005E51C 21A80000 */  addu       $s5, $zero, $zero
/* 4C140 8005E520 4B7A0108 */  j          .L8005E92C
/* 4C144 8005E524 2198A002 */   addu      $s3, $s5, $zero
.L8005E528:
/* 4C148 8005E528 CC02828E */  lw         $v0, 0x2CC($s4)
/* 4C14C 8005E52C 00000000 */  nop
/* 4C150 8005E530 01004230 */  andi       $v0, $v0, 0x1
/* 4C154 8005E534 11004014 */  bnez       $v0, .L8005E57C
/* 4C158 8005E538 0800E232 */   andi      $v0, $s7, 0x8
/* 4C15C 8005E53C 06000224 */  addiu      $v0, $zero, 0x6
/* 4C160 8005E540 0E00A210 */  beq        $a1, $v0, .L8005E57C
/* 4C164 8005E544 0800E232 */   andi      $v0, $s7, 0x8
/* 4C168 8005E548 8E038386 */  lh         $v1, 0x38E($s4)
/* 4C16C 8005E54C C4038286 */  lh         $v0, 0x3C4($s4)
/* 4C170 8005E550 00000000 */  nop
/* 4C174 8005E554 2A104300 */  slt        $v0, $v0, $v1
/* 4C178 8005E558 F5004010 */  beqz       $v0, .L8005E930
/* 4C17C 8005E55C FFFFA232 */   andi      $v0, $s5, 0xFFFF
/* 4C180 8005E560 5C03828E */  lw         $v0, 0x35C($s4)
/* 4C184 8005E564 00000000 */  nop
/* 4C188 8005E568 0800428C */  lw         $v0, 0x8($v0)
/* 4C18C 8005E56C 00000000 */  nop
/* 4C190 8005E570 00014228 */  slti       $v0, $v0, 0x100
/* 4C194 8005E574 ED004010 */  beqz       $v0, .L8005E92C
/* 4C198 8005E578 0800E232 */   andi      $v0, $s7, 0x8
.L8005E57C:
/* 4C19C 8005E57C 1C004010 */  beqz       $v0, .L8005E5F0
/* 4C1A0 8005E580 00000000 */   nop
/* 4C1A4 8005E584 0200C104 */  bgez       $a2, .L8005E590
/* 4C1A8 8005E588 2110C000 */   addu      $v0, $a2, $zero
/* 4C1AC 8005E58C 23100200 */  negu       $v0, $v0
.L8005E590:
/* 4C1B0 8005E590 01034228 */  slti       $v0, $v0, 0x301
/* 4C1B4 8005E594 02004014 */  bnez       $v0, .L8005E5A0
/* 4C1B8 8005E598 00000000 */   nop
/* 4C1BC 8005E59C 0008F736 */  ori        $s7, $s7, 0x800
.L8005E5A0:
/* 4C1C0 8005E5A0 22048296 */  lhu        $v0, 0x422($s4)
/* 4C1C4 8005E5A4 0A058386 */  lh         $v1, 0x50A($s4)
/* 4C1C8 8005E5A8 00240200 */  sll        $a0, $v0, 16
/* 4C1CC 8005E5AC 05000224 */  addiu      $v0, $zero, 0x5
/* 4C1D0 8005E5B0 03006214 */  bne        $v1, $v0, .L8005E5C0
/* 4C1D4 8005E5B4 03840400 */   sra       $s0, $a0, 16
/* 4C1D8 8005E5B8 7A790108 */  j          .L8005E5E8
/* 4C1DC 8005E5BC 00811000 */   sll       $s0, $s0, 4
.L8005E5C0:
/* 4C1E0 8005E5C0 06000224 */  addiu      $v0, $zero, 0x6
/* 4C1E4 8005E5C4 0500A214 */  bne        $a1, $v0, .L8005E5DC
/* 4C1E8 8005E5C8 03000224 */   addiu     $v0, $zero, 0x3
/* 4C1EC 8005E5CC 40101000 */  sll        $v0, $s0, 1
/* 4C1F0 8005E5D0 21105000 */  addu       $v0, $v0, $s0
/* 4C1F4 8005E5D4 7A790108 */  j          .L8005E5E8
/* 4C1F8 8005E5D8 83800200 */   sra       $s0, $v0, 2
.L8005E5DC:
/* 4C1FC 8005E5DC 0200A214 */  bne        $a1, $v0, .L8005E5E8
/* 4C200 8005E5E0 00000000 */   nop
/* 4C204 8005E5E4 43840400 */  sra        $s0, $a0, 17
.L8005E5E8:
/* 4C208 8005E5E8 B7790108 */  j          .L8005E6DC
/* 4C20C 8005E5EC 21900002 */   addu      $s2, $s0, $zero
.L8005E5F0:
/* 4C210 8005E5F0 3100C012 */  beqz       $s6, .L8005E6B8
/* 4C214 8005E5F4 05000224 */   addiu     $v0, $zero, 0x5
/* 4C218 8005E5F8 0200C104 */  bgez       $a2, .L8005E604
/* 4C21C 8005E5FC 2110C000 */   addu      $v0, $a2, $zero
/* 4C220 8005E600 23100200 */  negu       $v0, $v0
.L8005E604:
/* 4C224 8005E604 01034228 */  slti       $v0, $v0, 0x301
/* 4C228 8005E608 13004014 */  bnez       $v0, .L8005E658
/* 4C22C 8005E60C 00000000 */   nop
/* 4C230 8005E610 0300C01A */  blez       $s6, .L8005E620
/* 4C234 8005E614 00000000 */   nop
/* 4C238 8005E618 0500C004 */  bltz       $a2, .L8005E630
/* 4C23C 8005E61C 00000000 */   nop
.L8005E620:
/* 4C240 8005E620 0E00C106 */  bgez       $s6, .L8005E65C
/* 4C244 8005E624 02000224 */   addiu     $v0, $zero, 0x2
/* 4C248 8005E628 0C00C018 */  blez       $a2, .L8005E65C
/* 4C24C 8005E62C 00000000 */   nop
.L8005E630:
/* 4C250 8005E630 0200C104 */  bgez       $a2, .L8005E63C
/* 4C254 8005E634 2110C000 */   addu      $v0, $a2, $zero
/* 4C258 8005E638 23100200 */  negu       $v0, $v0
.L8005E63C:
/* 4C25C 8005E63C 01034228 */  slti       $v0, $v0, 0x301
/* 4C260 8005E640 1A049086 */  lh         $s0, 0x41A($s4)
/* 4C264 8005E644 22049286 */  lh         $s2, 0x422($s4)
/* 4C268 8005E648 24004014 */  bnez       $v0, .L8005E6DC
/* 4C26C 8005E64C 00000000 */   nop
/* 4C270 8005E650 B7790108 */  j          .L8005E6DC
/* 4C274 8005E654 0008F736 */   ori       $s7, $s7, 0x800
.L8005E658:
/* 4C278 8005E658 02000224 */  addiu      $v0, $zero, 0x2
.L8005E65C:
/* 4C27C 8005E65C 0500A214 */  bne        $a1, $v0, .L8005E674
/* 4C280 8005E660 00000000 */   nop
/* 4C284 8005E664 24049086 */  lh         $s0, 0x424($s4)
/* 4C288 8005E668 26049286 */  lh         $s2, 0x426($s4)
/* 4C28C 8005E66C B7790108 */  j          .L8005E6DC
/* 4C290 8005E670 00000000 */   nop
.L8005E674:
/* 4C294 8005E674 0200C104 */  bgez       $a2, .L8005E680
/* 4C298 8005E678 2118C000 */   addu      $v1, $a2, $zero
/* 4C29C 8005E67C 23180300 */  negu       $v1, $v1
.L8005E680:
/* 4C2A0 8005E680 01036228 */  slti       $v0, $v1, 0x301
/* 4C2A4 8005E684 1A049086 */  lh         $s0, 0x41A($s4)
/* 4C2A8 8005E688 1C049286 */  lh         $s2, 0x41C($s4)
/* 4C2AC 8005E68C 13004014 */  bnez       $v0, .L8005E6DC
/* 4C2B0 8005E690 00000000 */   nop
/* 4C2B4 8005E694 0200C106 */  bgez       $s6, .L8005E6A0
/* 4C2B8 8005E698 2110C002 */   addu      $v0, $s6, $zero
/* 4C2BC 8005E69C 23100200 */  negu       $v0, $v0
.L8005E6A0:
/* 4C2C0 8005E6A0 43100200 */  sra        $v0, $v0, 1
/* 4C2C4 8005E6A4 2A106200 */  slt        $v0, $v1, $v0
/* 4C2C8 8005E6A8 0C004010 */  beqz       $v0, .L8005E6DC
/* 4C2CC 8005E6AC 00000000 */   nop
/* 4C2D0 8005E6B0 B7790108 */  j          .L8005E6DC
/* 4C2D4 8005E6B4 0008F736 */   ori       $s7, $s7, 0x800
.L8005E6B8:
/* 4C2D8 8005E6B8 1E049086 */  lh         $s0, 0x41E($s4)
/* 4C2DC 8005E6BC 0A058386 */  lh         $v1, 0x50A($s4)
/* 4C2E0 8005E6C0 20049286 */  lh         $s2, 0x420($s4)
/* 4C2E4 8005E6C4 05006214 */  bne        $v1, $v0, .L8005E6DC
/* 4C2E8 8005E6C8 00000000 */   nop
/* 4C2EC 8005E6CC 22048286 */  lh         $v0, 0x422($s4)
/* 4C2F0 8005E6D0 00000000 */  nop
/* 4C2F4 8005E6D4 00910200 */  sll        $s2, $v0, 4
/* 4C2F8 8005E6D8 21804002 */  addu       $s0, $s2, $zero
.L8005E6DC:
/* 4C2FC 8005E6DC 1400AA8F */  lw         $t2, 0x14($sp)
/* 4C300 8005E6E0 00000000 */  nop
/* 4C304 8005E6E4 18000A02 */  mult       $s0, $t2
/* 4C308 8005E6E8 12380000 */  mflo       $a3
/* 4C30C 8005E6EC 00000000 */  nop
/* 4C310 8005E6F0 00000000 */  nop
/* 4C314 8005E6F4 18004A02 */  mult       $s2, $t2
/* 4C318 8005E6F8 5803828E */  lw         $v0, 0x358($s4)
/* 4C31C 8005E6FC 00000000 */  nop
/* 4C320 8005E700 2000498C */  lw         $t1, 0x20($v0)
/* 4C324 8005E704 00010224 */  addiu      $v0, $zero, 0x100
/* 4C328 8005E708 43810700 */  sra        $s0, $a3, 5
/* 4C32C 8005E70C 12180000 */  mflo       $v1
/* 4C330 8005E710 09002211 */  beq        $t1, $v0, .L8005E738
/* 4C334 8005E714 43910300 */   sra       $s2, $v1, 5
/* 4C338 8005E718 18003001 */  mult       $t1, $s0
/* 4C33C 8005E71C 12180000 */  mflo       $v1
/* 4C340 8005E720 00000000 */  nop
/* 4C344 8005E724 00000000 */  nop
/* 4C348 8005E728 18003201 */  mult       $t1, $s2
/* 4C34C 8005E72C 03820300 */  sra        $s0, $v1, 8
/* 4C350 8005E730 12100000 */  mflo       $v0
/* 4C354 8005E734 03920200 */  sra        $s2, $v0, 8
.L8005E738:
/* 4C358 8005E738 14049186 */  lh         $s1, 0x414($s4)
/* 4C35C 8005E73C 00000000 */  nop
/* 4C360 8005E740 26002106 */  bgez       $s1, .L8005E7DC
/* 4C364 8005E744 C0FE0224 */   addiu     $v0, $zero, -0x140
/* 4C368 8005E748 06002216 */  bne        $s1, $v0, .L8005E764
/* 4C36C 8005E74C 00000000 */   nop
/* 4C370 8005E750 0200A106 */  bgez       $s5, .L8005E75C
/* 4C374 8005E754 2110A002 */   addu      $v0, $s5, $zero
/* 4C378 8005E758 23100200 */  negu       $v0, $v0
.L8005E75C:
/* 4C37C 8005E75C E5790108 */  j          .L8005E794
/* 4C380 8005E760 43800200 */   sra       $s0, $v0, 1
.L8005E764:
/* 4C384 8005E764 44048286 */  lh         $v0, 0x444($s4)
/* 4C388 8005E768 00000000 */  nop
/* 4C38C 8005E76C 18000202 */  mult       $s0, $v0
/* 4C390 8005E770 12500000 */  mflo       $t2
/* 4C394 8005E774 03120A00 */  sra        $v0, $t2, 8
/* 4C398 8005E778 21800202 */  addu       $s0, $s0, $v0
/* 4C39C 8005E77C 02000106 */  bgez       $s0, .L8005E788
/* 4C3A0 8005E780 00000000 */   nop
/* 4C3A4 8005E784 21800000 */  addu       $s0, $zero, $zero
.L8005E788:
/* 4C3A8 8005E788 0200A106 */  bgez       $s5, .L8005E794
/* 4C3AC 8005E78C 2110A002 */   addu      $v0, $s5, $zero
/* 4C3B0 8005E790 23100200 */  negu       $v0, $v0
.L8005E794:
/* 4C3B4 8005E794 09004018 */  blez       $v0, .L8005E7BC
/* 4C3B8 8005E798 21208002 */   addu      $a0, $s4, $zero
/* 4C3BC 8005E79C 0018F736 */  ori        $s7, $s7, 0x1800
/* 4C3C0 8005E7A0 04000524 */  addiu      $a1, $zero, 0x4
/* 4C3C4 8005E7A4 3099000C */  jal        DECOMP_GAMEPAD_ShockForce1
/* 4C3C8 8005E7A8 7F000624 */   addiu     $a2, $zero, 0x7F
/* 4C3CC 8005E7AC 21208002 */  addu       $a0, $s4, $zero
/* 4C3D0 8005E7B0 04000524 */  addiu      $a1, $zero, 0x4
/* 4C3D4 8005E7B4 1099000C */  jal        DECOMP_GAMEPAD_ShockFreq
/* 4C3D8 8005E7B8 21300000 */   addu      $a2, $zero, $zero
.L8005E7BC:
/* 4C3DC 8005E7BC 1400AB8F */  lw         $t3, 0x14($sp)
/* 4C3E0 8005E7C0 00000000 */  nop
/* 4C3E4 8005E7C4 21882B02 */  addu       $s1, $s1, $t3
/* 4C3E8 8005E7C8 0200201A */  blez       $s1, .L8005E7D4
/* 4C3EC 8005E7CC 00000000 */   nop
/* 4C3F0 8005E7D0 21880000 */  addu       $s1, $zero, $zero
.L8005E7D4:
/* 4C3F4 8005E7D4 087A0108 */  j          .L8005E820
/* 4C3F8 8005E7D8 140491A6 */   sh        $s1, 0x414($s4)
.L8005E7DC:
/* 4C3FC 8005E7DC 1100201A */  blez       $s1, .L8005E824
/* 4C400 8005E7E0 8000023C */   lui       $v0, (0x800000 >> 16)
/* 4C404 8005E7E4 1400AA8F */  lw         $t2, 0x14($sp)
/* 4C408 8005E7E8 00000000 */  nop
/* 4C40C 8005E7EC 23882A02 */  subu       $s1, $s1, $t2
/* 4C410 8005E7F0 02002106 */  bgez       $s1, .L8005E7FC
/* 4C414 8005E7F4 00000000 */   nop
/* 4C418 8005E7F8 21880000 */  addu       $s1, $zero, $zero
.L8005E7FC:
/* 4C41C 8005E7FC 44048286 */  lh         $v0, 0x444($s4)
/* 4C420 8005E800 00000000 */  nop
/* 4C424 8005E804 18000202 */  mult       $s0, $v0
/* 4C428 8005E808 12500000 */  mflo       $t2
/* 4C42C 8005E80C 03120A00 */  sra        $v0, $t2, 8
/* 4C430 8005E810 21800202 */  addu       $s0, $s0, $v0
/* 4C434 8005E814 02000106 */  bgez       $s0, .L8005E820
/* 4C438 8005E818 140491A6 */   sh        $s1, 0x414($s4)
/* 4C43C 8005E81C 21800000 */  addu       $s0, $zero, $zero
.L8005E820:
/* 4C440 8005E820 8000023C */  lui        $v0, (0x800000 >> 16)
.L8005E824:
/* 4C444 8005E824 2410E202 */  and        $v0, $s7, $v0
/* 4C448 8005E828 2B004014 */  bnez       $v0, .L8005E8D8
/* 4C44C 8005E82C 00000000 */   nop
/* 4C450 8005E830 1800AB8F */  lw         $t3, 0x18($sp)
/* 4C454 8005E834 00000000 */  nop
/* 4C458 8005E838 80006231 */  andi       $v0, $t3, 0x80
/* 4C45C 8005E83C 26004010 */  beqz       $v0, .L8005E8D8
/* 4C460 8005E840 C3101500 */   sra       $v0, $s5, 3
/* 4C464 8005E844 02004104 */  bgez       $v0, .L8005E850
/* 4C468 8005E848 21184000 */   addu      $v1, $v0, $zero
/* 4C46C 8005E84C 23180300 */  negu       $v1, $v1
.L8005E850:
/* 4C470 8005E850 2A100302 */  slt        $v0, $s0, $v1
/* 4C474 8005E854 02004010 */  beqz       $v0, .L8005E860
/* 4C478 8005E858 00000000 */   nop
/* 4C47C 8005E85C 21806000 */  addu       $s0, $v1, $zero
.L8005E860:
/* 4C480 8005E860 0C006012 */  beqz       $s3, .L8005E894
/* 4C484 8005E864 2A107602 */   slt       $v0, $s3, $s6
/* 4C488 8005E868 0900C012 */  beqz       $s6, .L8005E890
/* 4C48C 8005E86C 26107602 */   xor       $v0, $s3, $s6
/* 4C490 8005E870 08004104 */  bgez       $v0, .L8005E894
/* 4C494 8005E874 2A107602 */   slt       $v0, $s3, $s6
/* 4C498 8005E878 43101300 */  sra        $v0, $s3, 1
/* 4C49C 8005E87C 02004104 */  bgez       $v0, .L8005E888
/* 4C4A0 8005E880 21184000 */   addu      $v1, $v0, $zero
/* 4C4A4 8005E884 23180300 */  negu       $v1, $v1
.L8005E888:
/* 4C4A8 8005E888 337A0108 */  j          .L8005E8CC
/* 4C4AC 8005E88C 2A104302 */   slt       $v0, $s2, $v1
.L8005E890:
/* 4C4B0 8005E890 2A107602 */  slt        $v0, $s3, $s6
.L8005E894:
/* 4C4B4 8005E894 03004010 */  beqz       $v0, .L8005E8A4
/* 4C4B8 8005E898 2A10D302 */   slt       $v0, $s6, $s3
/* 4C4BC 8005E89C 0500601A */  blez       $s3, .L8005E8B4
/* 4C4C0 8005E8A0 00000000 */   nop
.L8005E8A4:
/* 4C4C4 8005E8A4 0C004010 */  beqz       $v0, .L8005E8D8
/* 4C4C8 8005E8A8 00000000 */   nop
/* 4C4CC 8005E8AC 0A006006 */  bltz       $s3, .L8005E8D8
/* 4C4D0 8005E8B0 00000000 */   nop
.L8005E8B4:
/* 4C4D4 8005E8B4 23107602 */  subu       $v0, $s3, $s6
/* 4C4D8 8005E8B8 02004104 */  bgez       $v0, .L8005E8C4
/* 4C4DC 8005E8BC 00000000 */   nop
/* 4C4E0 8005E8C0 23100200 */  negu       $v0, $v0
.L8005E8C4:
/* 4C4E4 8005E8C4 43180200 */  sra        $v1, $v0, 1
/* 4C4E8 8005E8C8 2A104302 */  slt        $v0, $s2, $v1
.L8005E8CC:
/* 4C4EC 8005E8CC 02004010 */  beqz       $v0, .L8005E8D8
/* 4C4F0 8005E8D0 00000000 */   nop
/* 4C4F4 8005E8D4 21906000 */  addu       $s2, $v1, $zero
.L8005E8D8:
/* 4C4F8 8005E8D8 1800AA8F */  lw         $t2, 0x18($sp)
/* 4C4FC 8005E8DC 00000000 */  nop
/* 4C500 8005E8E0 00014231 */  andi       $v0, $t2, 0x100
/* 4C504 8005E8E4 07004010 */  beqz       $v0, .L8005E904
/* 4C508 8005E8E8 40101000 */   sll       $v0, $s0, 1
/* 4C50C 8005E8EC 21105000 */  addu       $v0, $v0, $s0
/* 4C510 8005E8F0 83800200 */  sra        $s0, $v0, 2
/* 4C514 8005E8F4 2A101202 */  slt        $v0, $s0, $s2
/* 4C518 8005E8F8 03004010 */  beqz       $v0, .L8005E908
/* 4C51C 8005E8FC 2120A002 */   addu      $a0, $s5, $zero
/* 4C520 8005E900 21804002 */  addu       $s0, $s2, $zero
.L8005E904:
/* 4C524 8005E904 2120A002 */  addu       $a0, $s5, $zero
.L8005E908:
/* 4C528 8005E908 21280002 */  addu       $a1, $s0, $zero
/* 4C52C 8005E90C D563010C */  jal        DECOMP_VehCalc_InterpBySpeed
/* 4C530 8005E910 21300000 */   addu      $a2, $zero, $zero
/* 4C534 8005E914 21A84000 */  addu       $s5, $v0, $zero
/* 4C538 8005E918 21206002 */  addu       $a0, $s3, $zero
/* 4C53C 8005E91C 21284002 */  addu       $a1, $s2, $zero
/* 4C540 8005E920 D563010C */  jal        DECOMP_VehCalc_InterpBySpeed
/* 4C544 8005E924 21300000 */   addu      $a2, $zero, $zero
/* 4C548 8005E928 21984000 */  addu       $s3, $v0, $zero
.L8005E92C:
/* 4C54C 8005E92C FFFFA232 */  andi       $v0, $s5, 0xFFFF
.L8005E930:
/* 4C550 8005E930 001C1E00 */  sll        $v1, $fp, 16
/* 4C554 8005E934 25104300 */  or         $v0, $v0, $v1
/* 4C558 8005E938 00008248 */  mtc2       $v0, $0 /* handwritten instruction */
/* 4C55C 8005E93C 00089348 */  mtc2       $s3, $1 /* handwritten instruction */
/* 4C560 8005E940 00000000 */  nop
/* 4C564 8005E944 00000000 */  nop
/* 4C568 8005E948 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 4C56C 8005E94C 4C00AB8F */  lw         $t3, 0x4C($sp)
/* 4C570 8005E950 00000000 */  nop
/* 4C574 8005E954 000079E9 */  swc2       $25, 0x0($t3)
/* 4C578 8005E958 04007AE9 */  swc2       $26, 0x4($t3) /* handwritten instruction */
/* 4C57C 8005E95C 08007BE9 */  swc2       $27, 0x8($t3) /* handwritten instruction */
/* 4C580 8005E960 0800023C */  lui        $v0, (0x80000 >> 16)
/* 4C584 8005E964 2410E202 */  and        $v0, $s7, $v0
/* 4C588 8005E968 1B004014 */  bnez       $v0, .L8005E9D8
/* 4C58C 8005E96C C80297AE */   sw        $s7, 0x2C8($s4)
/* 4C590 8005E970 49048292 */  lbu        $v0, 0x449($s4)
/* 4C594 8005E974 00000000 */  nop
/* 4C598 8005E978 09004010 */  beqz       $v0, .L8005E9A0
/* 4C59C 8005E97C 00000000 */   nop
/* 4C5A0 8005E980 07006012 */  beqz       $s3, .L8005E9A0
/* 4C5A4 8005E984 00000000 */   nop
/* 4C5A8 8005E988 02006106 */  bgez       $s3, .L8005E994
/* 4C5AC 8005E98C 01000224 */   addiu     $v0, $zero, 0x1
/* 4C5B0 8005E990 FFFF0224 */  addiu      $v0, $zero, -0x1
.L8005E994:
/* 4C5B4 8005E994 E80382A6 */  sh         $v0, 0x3E8($s4)
/* 4C5B8 8005E998 767A0108 */  j          .L8005E9D8
/* 4C5BC 8005E99C 490480A2 */   sb        $zero, 0x449($s4)
.L8005E9A0:
/* 4C5C0 8005E9A0 1000AA8F */  lw         $t2, 0x10($sp)
/* 4C5C4 8005E9A4 00000000 */  nop
/* 4C5C8 8005E9A8 08004005 */  bltz       $t2, .L8005E9CC
/* 4C5CC 8005E9AC 00000000 */   nop
/* 4C5D0 8005E9B0 02006106 */  bgez       $s3, .L8005E9BC
/* 4C5D4 8005E9B4 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 4C5D8 8005E9B8 E80382A6 */  sh         $v0, 0x3E8($s4)
.L8005E9BC:
/* 4C5DC 8005E9BC 1000AB8F */  lw         $t3, 0x10($sp)
/* 4C5E0 8005E9C0 00000000 */  nop
/* 4C5E4 8005E9C4 0800601D */  bgtz       $t3, .L8005E9E8
/* 4C5E8 8005E9C8 00000000 */   nop
.L8005E9CC:
/* 4C5EC 8005E9CC 02006006 */  bltz       $s3, .L8005E9D8
/* 4C5F0 8005E9D0 01000224 */   addiu     $v0, $zero, 0x1
/* 4C5F4 8005E9D4 E80382A6 */  sh         $v0, 0x3E8($s4)
.L8005E9D8:
/* 4C5F8 8005E9D8 1000AA8F */  lw         $t2, 0x10($sp)
/* 4C5FC 8005E9DC 00000000 */  nop
/* 4C600 8005E9E0 07004005 */  bltz       $t2, .L8005EA00
/* 4C604 8005E9E4 00000000 */   nop
.L8005E9E8:
/* 4C608 8005E9E8 07006006 */  bltz       $s3, .L8005EA08
/* 4C60C 8005E9EC 00000000 */   nop
/* 4C610 8005E9F0 1000AB8F */  lw         $t3, 0x10($sp)
/* 4C614 8005E9F4 00000000 */  nop
/* 4C618 8005E9F8 0D00601D */  bgtz       $t3, .L8005EA30
/* 4C61C 8005E9FC 00000000 */   nop
.L8005EA00:
/* 4C620 8005EA00 0B00601A */  blez       $s3, .L8005EA30
/* 4C624 8005EA04 00000000 */   nop
.L8005EA08:
/* 4C628 8005EA08 08048286 */  lh         $v0, 0x408($s4)
/* 4C62C 8005EA0C 00000000 */  nop
/* 4C630 8005EA10 06004010 */  beqz       $v0, .L8005EA2C
/* 4C634 8005EA14 80020224 */   addiu     $v0, $zero, 0x280
/* 4C638 8005EA18 0A048296 */  lhu        $v0, 0x40A($s4)
/* 4C63C 8005EA1C 00000000 */  nop
/* 4C640 8005EA20 01004224 */  addiu      $v0, $v0, 0x1
/* 4C644 8005EA24 0A0482A6 */  sh         $v0, 0x40A($s4)
/* 4C648 8005EA28 80020224 */  addiu      $v0, $zero, 0x280
.L8005EA2C:
/* 4C64C 8005EA2C 080482A6 */  sh         $v0, 0x408($s4)
.L8005EA30:
/* 4C650 8005EA30 4400BF8F */  lw         $ra, 0x44($sp)
/* 4C654 8005EA34 4000BE8F */  lw         $fp, 0x40($sp)
/* 4C658 8005EA38 3C00B78F */  lw         $s7, 0x3C($sp)
/* 4C65C 8005EA3C 3800B68F */  lw         $s6, 0x38($sp)
/* 4C660 8005EA40 3400B58F */  lw         $s5, 0x34($sp)
/* 4C664 8005EA44 3000B48F */  lw         $s4, 0x30($sp)
/* 4C668 8005EA48 2C00B38F */  lw         $s3, 0x2C($sp)
/* 4C66C 8005EA4C 2800B28F */  lw         $s2, 0x28($sp)
/* 4C670 8005EA50 2400B18F */  lw         $s1, 0x24($sp)
/* 4C674 8005EA54 2000B08F */  lw         $s0, 0x20($sp)
/* 4C678 8005EA58 0800E003 */  jr         $ra
/* 4C67C 8005EA5C 4800BD27 */   addiu     $sp, $sp, 0x48
.size VehPhysForce_OnGravity, . - VehPhysForce_OnGravity
