.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel Level_RandomFX
/* 1C6D8 8002EAB8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1C6DC 8002EABC 1000B0AF */  sw         $s0, 0x10($sp)
/* 1C6E0 8002EAC0 21808000 */  addu       $s0, $a0, $zero
/* 1C6E4 8002EAC4 2140A000 */  addu       $t0, $a1, $zero
/* 1C6E8 8002EAC8 1800B2AF */  sw         $s2, 0x18($sp)
/* 1C6EC 8002EACC 2190C000 */  addu       $s2, $a2, $zero
/* 1C6F0 8002EAD0 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 1C6F4 8002EAD4 1400B1AF */  sw         $s1, 0x14($sp)
/* 1C6F8 8002EAD8 0000028E */  lw         $v0, 0x0($s0)
/* 1C6FC 8002EADC 00000000 */  nop
/* 1C700 8002EAE0 04004018 */  blez       $v0, .L8002EAF4
/* 1C704 8002EAE4 2188E000 */   addu      $s1, $a3, $zero
/* 1C708 8002EAE8 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 1C70C 8002EAEC 000002AE */  sw         $v0, 0x0($s0)
/* 1C710 8002EAF0 0000028E */  lw         $v0, 0x0($s0)
.L8002EAF4:
/* 1C714 8002EAF4 00000000 */  nop
/* 1C718 8002EAF8 34004014 */  bnez       $v0, .L8002EBCC
/* 1C71C 8002EAFC EB51053C */   lui       $a1, (0x51EB851F >> 16)
/* 1C720 8002EB00 0980023C */  lui        $v0, %hi(D_8008D058)
/* 1C724 8002EB04 58D0428C */  lw         $v0, %lo(D_8008D058)($v0)
/* 1C728 8002EB08 1F85A534 */  ori        $a1, $a1, (0x51EB851F & 0xFFFF)
/* 1C72C 8002EB0C C2180200 */  srl        $v1, $v0, 3
/* 1C730 8002EB10 40170200 */  sll        $v0, $v0, 29
/* 1C734 8002EB14 21186200 */  addu       $v1, $v1, $v0
/* 1C738 8002EB18 80200300 */  sll        $a0, $v1, 2
/* 1C73C 8002EB1C 21208300 */  addu       $a0, $a0, $v1
/* 1C740 8002EB20 01008424 */  addiu      $a0, $a0, 0x1
/* 1C744 8002EB24 19008500 */  multu      $a0, $a1
/* 1C748 8002EB28 10180000 */  mfhi       $v1
/* 1C74C 8002EB2C 42190300 */  srl        $v1, $v1, 5
/* 1C750 8002EB30 40100300 */  sll        $v0, $v1, 1
/* 1C754 8002EB34 21104300 */  addu       $v0, $v0, $v1
/* 1C758 8002EB38 C0100200 */  sll        $v0, $v0, 3
/* 1C75C 8002EB3C 21104300 */  addu       $v0, $v0, $v1
/* 1C760 8002EB40 80100200 */  sll        $v0, $v0, 2
/* 1C764 8002EB44 23108200 */  subu       $v0, $a0, $v0
/* 1C768 8002EB48 3000A38F */  lw         $v1, 0x30($sp)
/* 1C76C 8002EB4C 64004224 */  addiu      $v0, $v0, 0x64
/* 1C770 8002EB50 18004300 */  mult       $v0, $v1
/* 1C774 8002EB54 21280000 */  addu       $a1, $zero, $zero
/* 1C778 8002EB58 0980013C */  lui        $at, %hi(D_8008D058)
/* 1C77C 8002EB5C 58D024AC */  sw         $a0, %lo(D_8008D058)($at)
/* 1C780 8002EB60 FFFF0431 */  andi       $a0, $t0, 0xFFFF
/* 1C784 8002EB64 0001023C */  lui        $v0, (0x1008080 >> 16)
/* 1C788 8002EB68 80804234 */  ori        $v0, $v0, (0x1008080 & 0xFFFF)
/* 1C78C 8002EB6C 12180000 */  mflo       $v1
/* 1C790 8002EB70 02320300 */  srl        $a2, $v1, 8
/* 1C794 8002EB74 FF00C630 */  andi       $a2, $a2, 0xFF
/* 1C798 8002EB78 00340600 */  sll        $a2, $a2, 16
/* 1C79C 8002EB7C 34A1000C */  jal        DECOMP_OtherFX_Play_LowLevel
/* 1C7A0 8002EB80 2530C200 */   or        $a2, $a2, $v0
/* 1C7A4 8002EB84 0980023C */  lui        $v0, %hi(D_8008D058)
/* 1C7A8 8002EB88 58D0428C */  lw         $v0, %lo(D_8008D058)($v0)
/* 1C7AC 8002EB8C 00000000 */  nop
/* 1C7B0 8002EB90 C2180200 */  srl        $v1, $v0, 3
/* 1C7B4 8002EB94 40170200 */  sll        $v0, $v0, 29
/* 1C7B8 8002EB98 21186200 */  addu       $v1, $v1, $v0
/* 1C7BC 8002EB9C 80100300 */  sll        $v0, $v1, 2
/* 1C7C0 8002EBA0 21104300 */  addu       $v0, $v0, $v1
/* 1C7C4 8002EBA4 01004224 */  addiu      $v0, $v0, 0x1
/* 1C7C8 8002EBA8 1B005100 */  divu       $zero, $v0, $s1
/* 1C7CC 8002EBAC 02002016 */  bnez       $s1, .L8002EBB8
/* 1C7D0 8002EBB0 00000000 */   nop
/* 1C7D4 8002EBB4 0D000700 */  break      7
.L8002EBB8:
/* 1C7D8 8002EBB8 10180000 */  mfhi       $v1
/* 1C7DC 8002EBBC 0980013C */  lui        $at, %hi(D_8008D058)
/* 1C7E0 8002EBC0 58D022AC */  sw         $v0, %lo(D_8008D058)($at)
/* 1C7E4 8002EBC4 21187200 */  addu       $v1, $v1, $s2
/* 1C7E8 8002EBC8 000003AE */  sw         $v1, 0x0($s0)
.L8002EBCC:
/* 1C7EC 8002EBCC 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 1C7F0 8002EBD0 1800B28F */  lw         $s2, 0x18($sp)
/* 1C7F4 8002EBD4 1400B18F */  lw         $s1, 0x14($sp)
/* 1C7F8 8002EBD8 1000B08F */  lw         $s0, 0x10($sp)
/* 1C7FC 8002EBDC 0800E003 */  jr         $ra
/* 1C800 8002EBE0 2000BD27 */   addiu     $sp, $sp, 0x20
.size Level_RandomFX, . - Level_RandomFX
