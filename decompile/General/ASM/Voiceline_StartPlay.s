.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel Voiceline_StartPlay
/* 1AB48 8002CF28 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1AB4C 8002CF2C 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 1AB50 8002CF30 ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 1AB54 8002CF34 0980023C */  lui        $v0, %hi(D_80096194)
/* 1AB58 8002CF38 1800BFAF */  sw         $ra, 0x18($sp)
/* 1AB5C 8002CF3C 1400B1AF */  sw         $s1, 0x14($sp)
/* 1AB60 8002CF40 1000B0AF */  sw         $s0, 0x10($sp)
/* 1AB64 8002CF44 94614924 */  addiu      $t1, $v0, %lo(D_80096194)
/* 1AB68 8002CF48 0000868C */  lw         $a2, 0x0($a0)
/* 1AB6C 8002CF4C 0400878C */  lw         $a3, 0x4($a0)
/* 1AB70 8002CF50 0800888C */  lw         $t0, 0x8($a0)
/* 1AB74 8002CF54 000026AD */  sw         $a2, 0x0($t1)
/* 1AB78 8002CF58 040027AD */  sw         $a3, 0x4($t1)
/* 1AB7C 8002CF5C 080028AD */  sw         $t0, 0x8($t1)
/* 1AB80 8002CF60 0C00868C */  lw         $a2, 0xC($a0)
/* 1AB84 8002CF64 00000000 */  nop
/* 1AB88 8002CF68 0C0026AD */  sw         $a2, 0xC($t1)
/* 1AB8C 8002CF6C 0000628C */  lw         $v0, 0x0($v1)
/* 1AB90 8002CF70 00000000 */  nop
/* 1AB94 8002CF74 1D004104 */  bgez       $v0, .L8002CFEC
/* 1AB98 8002CF78 0880023C */   lui       $v0, %hi(D_800838DC)
/* 1AB9C 8002CF7C 08008294 */  lhu        $v0, 0x8($a0)
/* 1ABA0 8002CF80 00000000 */  nop
/* 1ABA4 8002CF84 F6FF4224 */  addiu      $v0, $v0, -0xA
/* 1ABA8 8002CF88 0600422C */  sltiu      $v0, $v0, 0x6
/* 1ABAC 8002CF8C 17004010 */  beqz       $v0, .L8002CFEC
/* 1ABB0 8002CF90 0880023C */   lui       $v0, %hi(D_800838DC)
/* 1ABB4 8002CF94 0A008390 */  lbu        $v1, 0xA($a0)
/* 1ABB8 8002CF98 00000000 */  nop
/* 1ABBC 8002CF9C F8FF6224 */  addiu      $v0, $v1, -0x8
/* 1ABC0 8002CFA0 0400422C */  sltiu      $v0, $v0, 0x4
/* 1ABC4 8002CFA4 03004014 */  bnez       $v0, .L8002CFB4
/* 1ABC8 8002CFA8 0F000224 */   addiu     $v0, $zero, 0xF
/* 1ABCC 8002CFAC 0F006214 */  bne        $v1, $v0, .L8002CFEC
/* 1ABD0 8002CFB0 0880023C */   lui       $v0, %hi(D_800838DC)
.L8002CFB4:
/* 1ABD4 8002CFB4 0980023C */  lui        $v0, %hi(D_8008D058)
/* 1ABD8 8002CFB8 58D0428C */  lw         $v0, %lo(D_8008D058)($v0)
/* 1ABDC 8002CFBC 00000000 */  nop
/* 1ABE0 8002CFC0 C2180200 */  srl        $v1, $v0, 3
/* 1ABE4 8002CFC4 40170200 */  sll        $v0, $v0, 29
/* 1ABE8 8002CFC8 21186200 */  addu       $v1, $v1, $v0
/* 1ABEC 8002CFCC 80100300 */  sll        $v0, $v1, 2
/* 1ABF0 8002CFD0 21104300 */  addu       $v0, $v0, $v1
/* 1ABF4 8002CFD4 01004224 */  addiu      $v0, $v0, 0x1
/* 1ABF8 8002CFD8 03004330 */  andi       $v1, $v0, 0x3
/* 1ABFC 8002CFDC 0980013C */  lui        $at, %hi(D_8008D058)
/* 1AC00 8002CFE0 58D022AC */  sw         $v0, %lo(D_8008D058)($at)
/* 1AC04 8002CFE4 FFB30008 */  j          .L8002CFFC
/* 1AC08 8002CFE8 04006524 */   addiu     $a1, $v1, 0x4
.L8002CFEC:
/* 1AC0C 8002CFEC 08008384 */  lh         $v1, 0x8($a0)
/* 1AC10 8002CFF0 DC384224 */  addiu      $v0, $v0, %lo(D_800838DC)
/* 1AC14 8002CFF4 21186200 */  addu       $v1, $v1, $v0
/* 1AC18 8002CFF8 00006590 */  lbu        $a1, 0x0($v1)
.L8002CFFC:
/* 1AC1C 8002CFFC 0880033C */  lui        $v1, %hi(D_8008389C)
/* 1AC20 8002D000 0A008290 */  lbu        $v0, 0xA($a0)
/* 1AC24 8002D004 9C386324 */  addiu      $v1, $v1, %lo(D_8008389C)
/* 1AC28 8002D008 80100200 */  sll        $v0, $v0, 2
/* 1AC2C 8002D00C 21104300 */  addu       $v0, $v0, $v1
/* 1AC30 8002D010 0000438C */  lw         $v1, 0x0($v0)
/* 1AC34 8002D014 C0100500 */  sll        $v0, $a1, 3
/* 1AC38 8002D018 21806200 */  addu       $s0, $v1, $v0
/* 1AC3C 8002D01C 04000496 */  lhu        $a0, 0x4($s0)
/* 1AC40 8002D020 00000000 */  nop
/* 1AC44 8002D024 2D008010 */  beqz       $a0, .L8002D0DC
/* 1AC48 8002D028 00000000 */   nop
/* 1AC4C 8002D02C 0980023C */  lui        $v0, %hi(D_8008D058)
/* 1AC50 8002D030 58D0428C */  lw         $v0, %lo(D_8008D058)($v0)
/* 1AC54 8002D034 00000000 */  nop
/* 1AC58 8002D038 C2180200 */  srl        $v1, $v0, 3
/* 1AC5C 8002D03C 40170200 */  sll        $v0, $v0, 29
/* 1AC60 8002D040 21186200 */  addu       $v1, $v1, $v0
/* 1AC64 8002D044 80100300 */  sll        $v0, $v1, 2
/* 1AC68 8002D048 21104300 */  addu       $v0, $v0, $v1
/* 1AC6C 8002D04C 01004224 */  addiu      $v0, $v0, 0x1
/* 1AC70 8002D050 1B004400 */  divu       $zero, $v0, $a0
/* 1AC74 8002D054 02008014 */  bnez       $a0, .L8002D060
/* 1AC78 8002D058 00000000 */   nop
/* 1AC7C 8002D05C 0D000700 */  break      7
.L8002D060:
/* 1AC80 8002D060 10200000 */  mfhi       $a0
/* 1AC84 8002D064 0000038E */  lw         $v1, 0x0($s0)
/* 1AC88 8002D068 0980013C */  lui        $at, %hi(D_8008D058)
/* 1AC8C 8002D06C 58D022AC */  sw         $v0, %lo(D_8008D058)($at)
/* 1AC90 8002D070 40880400 */  sll        $s1, $a0, 1
/* 1AC94 8002D074 21182302 */  addu       $v1, $s1, $v1
/* 1AC98 8002D078 00006594 */  lhu        $a1, 0x0($v1)
/* 1AC9C 8002D07C 6D73000C */  jal        DECOMP_CDSYS_XAPlay
/* 1ACA0 8002D080 02000424 */   addiu     $a0, $zero, 0x2
/* 1ACA4 8002D084 12004010 */  beqz       $v0, .L8002D0D0
/* 1ACA8 8002D088 1E000224 */   addiu     $v0, $zero, 0x1E
/* 1ACAC 8002D08C 0000028E */  lw         $v0, 0x0($s0)
/* 1ACB0 8002D090 00000000 */  nop
/* 1ACB4 8002D094 21102202 */  addu       $v0, $s1, $v0
/* 1ACB8 8002D098 00004594 */  lhu        $a1, 0x0($v0)
/* 1ACBC 8002D09C 4873000C */  jal        DECOMP_CDSYS_XAGetTrackLength
/* 1ACC0 8002D0A0 02000424 */   addiu     $a0, $zero, 0x2
/* 1ACC4 8002D0A4 6666033C */  lui        $v1, (0x66666667 >> 16)
/* 1ACC8 8002D0A8 67666334 */  ori        $v1, $v1, (0x66666667 & 0xFFFF)
/* 1ACCC 8002D0AC 18004300 */  mult       $v0, $v1
/* 1ACD0 8002D0B0 C3170200 */  sra        $v0, $v0, 31
/* 1ACD4 8002D0B4 10300000 */  mfhi       $a2
/* 1ACD8 8002D0B8 43180600 */  sra        $v1, $a2, 1
/* 1ACDC 8002D0BC 23186200 */  subu       $v1, $v1, $v0
/* 1ACE0 8002D0C0 1E006324 */  addiu      $v1, $v1, 0x1E
/* 1ACE4 8002D0C4 820883A7 */  sh         $v1, 0x882($gp) /* Failed to symbolize address 0x00000882 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 1ACE8 8002D0C8 39B40008 */  j          .L8002D0E4
/* 1ACEC 8002D0CC 00000000 */   nop
.L8002D0D0:
/* 1ACF0 8002D0D0 820882A7 */  sh         $v0, 0x882($gp) /* Failed to symbolize address 0x00000882 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 1ACF4 8002D0D4 39B40008 */  j          .L8002D0E4
/* 1ACF8 8002D0D8 00000000 */   nop
.L8002D0DC:
/* 1ACFC 8002D0DC D1B2000C */  jal        DECOMP_Voiceline_StopAll
/* 1AD00 8002D0E0 00000000 */   nop
.L8002D0E4:
/* 1AD04 8002D0E4 1800BF8F */  lw         $ra, 0x18($sp)
/* 1AD08 8002D0E8 1400B18F */  lw         $s1, 0x14($sp)
/* 1AD0C 8002D0EC 1000B08F */  lw         $s0, 0x10($sp)
/* 1AD10 8002D0F0 0800E003 */  jr         $ra
/* 1AD14 8002D0F4 2000BD27 */   addiu     $sp, $sp, 0x20
.size Voiceline_StartPlay, . - Voiceline_StartPlay
