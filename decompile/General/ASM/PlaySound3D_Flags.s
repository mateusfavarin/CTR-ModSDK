.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel PlaySound3D_Flags
/* 1CF3C 8002F31C 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 1CF40 8002F320 7400B7AF */  sw         $s7, 0x74($sp)
/* 1CF44 8002F324 21B88000 */  addu       $s7, $a0, $zero
/* 1CF48 8002F328 7800BEAF */  sw         $fp, 0x78($sp)
/* 1CF4C 8002F32C 21F0A000 */  addu       $fp, $a1, $zero
/* 1CF50 8002F330 7000B6AF */  sw         $s6, 0x70($sp)
/* 1CF54 8002F334 21B0C000 */  addu       $s6, $a2, $zero
/* 1CF58 8002F338 7C00BFAF */  sw         $ra, 0x7C($sp)
/* 1CF5C 8002F33C 6C00B5AF */  sw         $s5, 0x6C($sp)
/* 1CF60 8002F340 6800B4AF */  sw         $s4, 0x68($sp)
/* 1CF64 8002F344 6400B3AF */  sw         $s3, 0x64($sp)
/* 1CF68 8002F348 6000B2AF */  sw         $s2, 0x60($sp)
/* 1CF6C 8002F34C 5C00B1AF */  sw         $s1, 0x5C($sp)
/* 1CF70 8002F350 5800B0AF */  sw         $s0, 0x58($sp)
/* 1CF74 8002F354 0000E48E */  lw         $a0, 0x0($s7)
/* 1CF78 8002F358 00000000 */  nop
/* 1CF7C 8002F35C 07008010 */  beqz       $a0, .L8002F37C
/* 1CF80 8002F360 21A00000 */   addu      $s4, $zero, $zero
/* 1CF84 8002F364 FFFF8230 */  andi       $v0, $a0, 0xFFFF
/* 1CF88 8002F368 05005E10 */  beq        $v0, $fp, .L8002F380
/* 1CF8C 8002F36C FFFF0224 */   addiu     $v0, $zero, -0x1
/* 1CF90 8002F370 02A2000C */  jal        DECOMP_OtherFX_Stop1
/* 1CF94 8002F374 00000000 */   nop
/* 1CF98 8002F378 0000E0AE */  sw         $zero, 0x0($s7)
.L8002F37C:
/* 1CF9C 8002F37C FFFF0224 */  addiu      $v0, $zero, -0x1
.L8002F380:
/* 1CFA0 8002F380 9000C213 */  beq        $fp, $v0, .L8002F5C4
/* 1CFA4 8002F384 28231524 */   addiu     $s5, $zero, 0x2328
/* 1CFA8 8002F388 0980053C */  lui        $a1, %hi(D_8008D2AC)
/* 1CFAC 8002F38C ACD2A58C */  lw         $a1, %lo(D_8008D2AC)($a1)
/* 1CFB0 8002F390 00000000 */  nop
/* 1CFB4 8002F394 A81CA290 */  lbu        $v0, 0x1CA8($a1)
/* 1CFB8 8002F398 00000000 */  nop
/* 1CFBC 8002F39C 2A004010 */  beqz       $v0, .L8002F448
/* 1CFC0 8002F3A0 21880000 */   addu      $s1, $zero, $zero
/* 1CFC4 8002F3A4 21982002 */  addu       $s3, $s1, $zero
/* 1CFC8 8002F3A8 21902002 */  addu       $s2, $s1, $zero
.L8002F3AC:
/* 1CFCC 8002F3AC 1800A427 */  addiu      $a0, $sp, 0x18
/* 1CFD0 8002F3B0 2128B300 */  addu       $a1, $a1, $s3
/* 1CFD4 8002F3B4 6801A384 */  lh         $v1, 0x168($a1)
/* 1CFD8 8002F3B8 4400C28E */  lw         $v0, 0x44($s6)
/* 1CFDC 8002F3BC 21209200 */  addu       $a0, $a0, $s2
/* 1CFE0 8002F3C0 23104300 */  subu       $v0, $v0, $v1
/* 1CFE4 8002F3C4 000082AC */  sw         $v0, 0x0($a0)
/* 1CFE8 8002F3C8 6A01A384 */  lh         $v1, 0x16A($a1)
/* 1CFEC 8002F3CC 4800C28E */  lw         $v0, 0x48($s6)
/* 1CFF0 8002F3D0 00000000 */  nop
/* 1CFF4 8002F3D4 23104300 */  subu       $v0, $v0, $v1
/* 1CFF8 8002F3D8 040082AC */  sw         $v0, 0x4($a0)
/* 1CFFC 8002F3DC 6C01A384 */  lh         $v1, 0x16C($a1)
/* 1D000 8002F3E0 4C00C28E */  lw         $v0, 0x4C($s6)
/* 1D004 8002F3E4 00000000 */  nop
/* 1D008 8002F3E8 23104300 */  subu       $v0, $v0, $v1
/* 1D00C 8002F3EC 96B9000C */  jal        GTE_GetSquaredLength
/* 1D010 8002F3F0 080082AC */   sw        $v0, 0x8($a0)
/* 1D014 8002F3F4 21204000 */  addu       $a0, $v0, $zero
/* 1D018 8002F3F8 80101100 */  sll        $v0, $s1, 2
/* 1D01C 8002F3FC 4800B027 */  addiu      $s0, $sp, 0x48
/* 1D020 8002F400 21800202 */  addu       $s0, $s0, $v0
/* 1D024 8002F404 86B1010C */  jal        SquareRoot0_stub
/* 1D028 8002F408 000004AE */   sw        $a0, 0x0($s0)
/* 1D02C 8002F40C 21184000 */  addu       $v1, $v0, $zero
/* 1D030 8002F410 2B107500 */  sltu       $v0, $v1, $s5
/* 1D034 8002F414 03004010 */  beqz       $v0, .L8002F424
/* 1D038 8002F418 000003AE */   sw        $v1, 0x0($s0)
/* 1D03C 8002F41C 21A86000 */  addu       $s5, $v1, $zero
/* 1D040 8002F420 21A02002 */  addu       $s4, $s1, $zero
.L8002F424:
/* 1D044 8002F424 10017326 */  addiu      $s3, $s3, 0x110
/* 1D048 8002F428 0980053C */  lui        $a1, %hi(D_8008D2AC)
/* 1D04C 8002F42C ACD2A58C */  lw         $a1, %lo(D_8008D2AC)($a1)
/* 1D050 8002F430 00000000 */  nop
/* 1D054 8002F434 A81CA290 */  lbu        $v0, 0x1CA8($a1)
/* 1D058 8002F438 01003126 */  addiu      $s1, $s1, 0x1
/* 1D05C 8002F43C 2A102202 */  slt        $v0, $s1, $v0
/* 1D060 8002F440 DAFF4014 */  bnez       $v0, .L8002F3AC
/* 1D064 8002F444 0C005226 */   addiu     $s2, $s2, 0xC
.L8002F448:
/* 1D068 8002F448 28230224 */  addiu      $v0, $zero, 0x2328
/* 1D06C 8002F44C 5D00A212 */  beq        $s5, $v0, .L8002F5C4
/* 1D070 8002F450 40101400 */   sll       $v0, $s4, 1
/* 1D074 8002F454 21105400 */  addu       $v0, $v0, $s4
/* 1D078 8002F458 80100200 */  sll        $v0, $v0, 2
/* 1D07C 8002F45C 1800B027 */  addiu      $s0, $sp, 0x18
/* 1D080 8002F460 21800202 */  addu       $s0, $s0, $v0
/* 1D084 8002F464 21280002 */  addu       $a1, $s0, $zero
/* 1D088 8002F468 00211400 */  sll        $a0, $s4, 4
/* 1D08C 8002F46C 21209400 */  addu       $a0, $a0, $s4
/* 1D090 8002F470 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 1D094 8002F474 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 1D098 8002F478 00210400 */  sll        $a0, $a0, 4
/* 1D09C 8002F47C 21208200 */  addu       $a0, $a0, $v0
/* 1D0A0 8002F480 57B9000C */  jal        GTE_AudioLR_Inst
/* 1D0A4 8002F484 D0018424 */   addiu     $a0, $a0, 0x1D0
/* 1D0A8 8002F488 0800058E */  lw         $a1, 0x8($s0)
/* 1D0AC 8002F48C 0000048E */  lw         $a0, 0x0($s0)
/* 1D0B0 8002F490 CFC5010C */  jal        ratan2
/* 1D0B4 8002F494 23280500 */   negu      $a1, $a1
/* 1D0B8 8002F498 00085024 */  addiu      $s0, $v0, 0x800
/* 1D0BC 8002F49C 00151000 */  sll        $v0, $s0, 20
/* 1D0C0 8002F4A0 23100200 */  negu       $v0, $v0
/* 1D0C4 8002F4A4 C3850200 */  sra        $s0, $v0, 23
/* 1D0C8 8002F4A8 8100022A */  slti       $v0, $s0, 0x81
/* 1D0CC 8002F4AC 03004014 */  bnez       $v0, .L8002F4BC
/* 1D0D0 8002F4B0 80FF022A */   slti      $v0, $s0, -0x80
/* 1D0D4 8002F4B4 31BD0008 */  j          .L8002F4C4
/* 1D0D8 8002F4B8 00010224 */   addiu     $v0, $zero, 0x100
.L8002F4BC:
/* 1D0DC 8002F4BC 02004010 */  beqz       $v0, .L8002F4C8
/* 1D0E0 8002F4C0 00FF0224 */   addiu     $v0, $zero, -0x100
.L8002F4C4:
/* 1D0E4 8002F4C4 23805000 */  subu       $s0, $v0, $s0
.L8002F4C8:
/* 1D0E8 8002F4C8 80001026 */  addiu      $s0, $s0, 0x80
/* 1D0EC 8002F4CC 03000106 */  bgez       $s0, .L8002F4DC
/* 1D0F0 8002F4D0 0001022A */   slti      $v0, $s0, 0x100
/* 1D0F4 8002F4D4 3ABD0008 */  j          .L8002F4E8
/* 1D0F8 8002F4D8 21800000 */   addu      $s0, $zero, $zero
.L8002F4DC:
/* 1D0FC 8002F4DC 03004014 */  bnez       $v0, .L8002F4EC
/* 1D100 8002F4E0 2D01A22E */   sltiu     $v0, $s5, 0x12D
/* 1D104 8002F4E4 FF001024 */  addiu      $s0, $zero, 0xFF
.L8002F4E8:
/* 1D108 8002F4E8 2D01A22E */  sltiu      $v0, $s5, 0x12D
.L8002F4EC:
/* 1D10C 8002F4EC 08004014 */  bnez       $v0, .L8002F510
/* 1D110 8002F4F0 2120A002 */   addu      $a0, $s5, $zero
/* 1D114 8002F4F4 1000A0AF */  sw         $zero, 0x10($sp)
/* 1D118 8002F4F8 2C010524 */  addiu      $a1, $zero, 0x12C
/* 1D11C 8002F4FC 28230624 */  addiu      $a2, $zero, 0x2328
/* 1D120 8002F500 E763010C */  jal        DECOMP_VehCalc_MapToRange
/* 1D124 8002F504 FF000724 */   addiu     $a3, $zero, 0xFF
/* 1D128 8002F508 45BD0008 */  j          .L8002F514
/* 1D12C 8002F50C 21304000 */   addu      $a2, $v0, $zero
.L8002F510:
/* 1D130 8002F510 FF000624 */  addiu      $a2, $zero, 0xFF
.L8002F514:
/* 1D134 8002F514 0000E48E */  lw         $a0, 0x0($s7)
/* 1D138 8002F518 00000000 */  nop
/* 1D13C 8002F51C 17008014 */  bnez       $a0, .L8002F57C
/* 1D140 8002F520 C0101400 */   sll       $v0, $s4, 3
/* 1D144 8002F524 23105400 */  subu       $v0, $v0, $s4
/* 1D148 8002F528 C0100200 */  sll        $v0, $v0, 3
/* 1D14C 8002F52C 23105400 */  subu       $v0, $v0, $s4
/* 1D150 8002F530 80100200 */  sll        $v0, $v0, 2
/* 1D154 8002F534 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 1D158 8002F538 ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 1D15C 8002F53C FFFFC433 */  andi       $a0, $fp, 0xFFFF
/* 1D160 8002F540 21186200 */  addu       $v1, $v1, $v0
/* 1D164 8002F544 B414628C */  lw         $v0, 0x14B4($v1)
/* 1D168 8002F548 21280000 */  addu       $a1, $zero, $zero
/* 1D16C 8002F54C 12004394 */  lhu        $v1, 0x12($v0)
/* 1D170 8002F550 FF00C230 */  andi       $v0, $a2, 0xFF
/* 1D174 8002F554 00140200 */  sll        $v0, $v0, 16
/* 1D178 8002F558 FF000632 */  andi       $a2, $s0, 0xFF
/* 1D17C 8002F55C 0080C634 */  ori        $a2, $a2, 0x8000
/* 1D180 8002F560 80006330 */  andi       $v1, $v1, 0x80
/* 1D184 8002F564 001E0300 */  sll        $v1, $v1, 24
/* 1D188 8002F568 25186200 */  or         $v1, $v1, $v0
/* 1D18C 8002F56C 34A1000C */  jal        DECOMP_OtherFX_Play_LowLevel
/* 1D190 8002F570 25306600 */   or        $a2, $v1, $a2
/* 1D194 8002F574 71BD0008 */  j          .L8002F5C4
/* 1D198 8002F578 0000E2AE */   sw        $v0, 0x0($s7)
.L8002F57C:
/* 1D19C 8002F57C 23105400 */  subu       $v0, $v0, $s4
/* 1D1A0 8002F580 C0100200 */  sll        $v0, $v0, 3
/* 1D1A4 8002F584 23105400 */  subu       $v0, $v0, $s4
/* 1D1A8 8002F588 80100200 */  sll        $v0, $v0, 2
/* 1D1AC 8002F58C 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 1D1B0 8002F590 ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 1D1B4 8002F594 FF000532 */  andi       $a1, $s0, 0xFF
/* 1D1B8 8002F598 21186200 */  addu       $v1, $v1, $v0
/* 1D1BC 8002F59C B414628C */  lw         $v0, 0x14B4($v1)
/* 1D1C0 8002F5A0 0080A534 */  ori        $a1, $a1, 0x8000
/* 1D1C4 8002F5A4 12004394 */  lhu        $v1, 0x12($v0)
/* 1D1C8 8002F5A8 FF00C230 */  andi       $v0, $a2, 0xFF
/* 1D1CC 8002F5AC 00140200 */  sll        $v0, $v0, 16
/* 1D1D0 8002F5B0 80006330 */  andi       $v1, $v1, 0x80
/* 1D1D4 8002F5B4 001E0300 */  sll        $v1, $v1, 24
/* 1D1D8 8002F5B8 25186200 */  or         $v1, $v1, $v0
/* 1D1DC 8002F5BC A4A1000C */  jal        DECOMP_OtherFX_Modify
/* 1D1E0 8002F5C0 25286500 */   or        $a1, $v1, $a1
.L8002F5C4:
/* 1D1E4 8002F5C4 7C00BF8F */  lw         $ra, 0x7C($sp)
/* 1D1E8 8002F5C8 7800BE8F */  lw         $fp, 0x78($sp)
/* 1D1EC 8002F5CC 7400B78F */  lw         $s7, 0x74($sp)
/* 1D1F0 8002F5D0 7000B68F */  lw         $s6, 0x70($sp)
/* 1D1F4 8002F5D4 6C00B58F */  lw         $s5, 0x6C($sp)
/* 1D1F8 8002F5D8 6800B48F */  lw         $s4, 0x68($sp)
/* 1D1FC 8002F5DC 6400B38F */  lw         $s3, 0x64($sp)
/* 1D200 8002F5E0 6000B28F */  lw         $s2, 0x60($sp)
/* 1D204 8002F5E4 5C00B18F */  lw         $s1, 0x5C($sp)
/* 1D208 8002F5E8 5800B08F */  lw         $s0, 0x58($sp)
/* 1D20C 8002F5EC 0800E003 */  jr         $ra
/* 1D210 8002F5F0 8000BD27 */   addiu     $sp, $sp, 0x80
.size PlaySound3D_Flags, . - PlaySound3D_Flags
