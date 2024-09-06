.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel VehPhysCrash_BounceSelf
/* 4AB84 8005CF64 21588000 */  addu       $t3, $a0, $zero
/* 4AB88 8005CF68 2168A000 */  addu       $t5, $a1, $zero
/* 4AB8C 8005CF6C 0000C48C */  lw         $a0, 0x0($a2)
/* 4AB90 8005CF70 0000A28D */  lw         $v0, 0x0($t5)
/* 4AB94 8005CF74 00006385 */  lh         $v1, 0x0($t3)
/* 4AB98 8005CF78 23508200 */  subu       $t2, $a0, $v0
/* 4AB9C 8005CF7C 18004301 */  mult       $t2, $v1
/* 4ABA0 8005CF80 0400C48C */  lw         $a0, 0x4($a2)
/* 4ABA4 8005CF84 0400A28D */  lw         $v0, 0x4($t5)
/* 4ABA8 8005CF88 12400000 */  mflo       $t0
/* 4ABAC 8005CF8C 02006385 */  lh         $v1, 0x2($t3)
/* 4ABB0 8005CF90 23488200 */  subu       $t1, $a0, $v0
/* 4ABB4 8005CF94 18002301 */  mult       $t1, $v1
/* 4ABB8 8005CF98 0800C48C */  lw         $a0, 0x8($a2)
/* 4ABBC 8005CF9C 0800A28D */  lw         $v0, 0x8($t5)
/* 4ABC0 8005CFA0 12280000 */  mflo       $a1
/* 4ABC4 8005CFA4 04006385 */  lh         $v1, 0x4($t3)
/* 4ABC8 8005CFA8 23608200 */  subu       $t4, $a0, $v0
/* 4ABCC 8005CFAC 18008301 */  mult       $t4, $v1
/* 4ABD0 8005CFB0 21100501 */  addu       $v0, $t0, $a1
/* 4ABD4 8005CFB4 12180000 */  mflo       $v1
/* 4ABD8 8005CFB8 21104300 */  addu       $v0, $v0, $v1
/* 4ABDC 8005CFBC 0500E010 */  beqz       $a3, .L8005CFD4
/* 4ABE0 8005CFC0 03430200 */   sra       $t0, $v0, 12
/* 4ABE4 8005CFC4 0500001D */  bgtz       $t0, .L8005CFDC
/* 4ABE8 8005CFC8 00000000 */   nop
.L8005CFCC:
/* 4ABEC 8005CFCC 0800E003 */  jr         $ra
/* 4ABF0 8005CFD0 21100000 */   addu      $v0, $zero, $zero
.L8005CFD4:
/* 4ABF4 8005CFD4 FDFF0105 */  bgez       $t0, .L8005CFCC
/* 4ABF8 8005CFD8 00000000 */   nop
.L8005CFDC:
/* 4ABFC 8005CFDC 880A828F */  lw         $v0, 0xA88($gp) /* Failed to symbolize address 0x00000A88 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 4AC00 8005CFE0 02000105 */  bgez       $t0, .L8005CFEC
/* 4AC04 8005CFE4 21180001 */   addu      $v1, $t0, $zero
/* 4AC08 8005CFE8 23180300 */  negu       $v1, $v1
.L8005CFEC:
/* 4AC0C 8005CFEC 2A104300 */  slt        $v0, $v0, $v1
/* 4AC10 8005CFF0 02004010 */  beqz       $v0, .L8005CFFC
/* 4AC14 8005CFF4 00000000 */   nop
/* 4AC18 8005CFF8 880A83AF */  sw         $v1, 0xA88($gp) /* Failed to symbolize address 0x00000A88 for %gp_rel. Make sure this address is within the recognized valid address space */
.L8005CFFC:
/* 4AC1C 8005CFFC 00006485 */  lh         $a0, 0x0($t3)
/* 4AC20 8005D000 00000000 */  nop
/* 4AC24 8005D004 18000401 */  mult       $t0, $a0
/* 4AC28 8005D008 12200000 */  mflo       $a0
/* 4AC2C 8005D00C AA2A023C */  lui        $v0, (0x2AAAAAAB >> 16)
/* 4AC30 8005D010 ABAA4234 */  ori        $v0, $v0, (0x2AAAAAAB & 0xFFFF)
/* 4AC34 8005D014 18008200 */  mult       $a0, $v0
/* 4AC38 8005D018 10380000 */  mfhi       $a3
/* 4AC3C 8005D01C 02006385 */  lh         $v1, 0x2($t3)
/* 4AC40 8005D020 00000000 */  nop
/* 4AC44 8005D024 18000301 */  mult       $t0, $v1
/* 4AC48 8005D028 12180000 */  mflo       $v1
/* 4AC4C 8005D02C 04006585 */  lh         $a1, 0x4($t3)
/* 4AC50 8005D030 00000000 */  nop
/* 4AC54 8005D034 18000501 */  mult       $t0, $a1
/* 4AC58 8005D038 12280000 */  mflo       $a1
/* 4AC5C 8005D03C 00000000 */  nop
/* 4AC60 8005D040 00000000 */  nop
/* 4AC64 8005D044 18006200 */  mult       $v1, $v0
/* 4AC68 8005D048 10580000 */  mfhi       $t3
/* 4AC6C 8005D04C C3270400 */  sra        $a0, $a0, 31
/* 4AC70 8005D050 00000000 */  nop
/* 4AC74 8005D054 1800A200 */  mult       $a1, $v0
/* 4AC78 8005D058 C31F0300 */  sra        $v1, $v1, 31
/* 4AC7C 8005D05C 43120700 */  sra        $v0, $a3, 9
/* 4AC80 8005D060 23104400 */  subu       $v0, $v0, $a0
/* 4AC84 8005D064 23504201 */  subu       $t2, $t2, $v0
/* 4AC88 8005D068 43120B00 */  sra        $v0, $t3, 9
/* 4AC8C 8005D06C 23104300 */  subu       $v0, $v0, $v1
/* 4AC90 8005D070 23482201 */  subu       $t1, $t1, $v0
/* 4AC94 8005D074 0000A28D */  lw         $v0, 0x0($t5)
/* 4AC98 8005D078 C32F0500 */  sra        $a1, $a1, 31
/* 4AC9C 8005D07C 21104201 */  addu       $v0, $t2, $v0
/* 4ACA0 8005D080 0000C2AC */  sw         $v0, 0x0($a2)
/* 4ACA4 8005D084 10400000 */  mfhi       $t0
/* 4ACA8 8005D088 431A0800 */  sra        $v1, $t0, 9
/* 4ACAC 8005D08C 23186500 */  subu       $v1, $v1, $a1
/* 4ACB0 8005D090 23608301 */  subu       $t4, $t4, $v1
/* 4ACB4 8005D094 0400A38D */  lw         $v1, 0x4($t5)
/* 4ACB8 8005D098 0400C28C */  lw         $v0, 0x4($a2)
/* 4ACBC 8005D09C 21482301 */  addu       $t1, $t1, $v1
/* 4ACC0 8005D0A0 2A104900 */  slt        $v0, $v0, $t1
/* 4ACC4 8005D0A4 04004010 */  beqz       $v0, .L8005D0B8
/* 4ACC8 8005D0A8 01322229 */   slti      $v0, $t1, 0x3201
/* 4ACCC 8005D0AC 02004014 */  bnez       $v0, .L8005D0B8
/* 4ACD0 8005D0B0 00000000 */   nop
/* 4ACD4 8005D0B4 00320924 */  addiu      $t1, $zero, 0x3200
.L8005D0B8:
/* 4ACD8 8005D0B8 0400C9AC */  sw         $t1, 0x4($a2)
/* 4ACDC 8005D0BC 0800A38D */  lw         $v1, 0x8($t5)
/* 4ACE0 8005D0C0 21100000 */  addu       $v0, $zero, $zero
/* 4ACE4 8005D0C4 21188301 */  addu       $v1, $t4, $v1
/* 4ACE8 8005D0C8 0800E003 */  jr         $ra
/* 4ACEC 8005D0CC 0800C3AC */   sw        $v1, 0x8($a2)
.size VehPhysCrash_BounceSelf, . - VehPhysCrash_BounceSelf
