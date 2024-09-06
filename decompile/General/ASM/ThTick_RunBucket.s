.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel ThTick_RunBucket
/* 5F208 800715E8 801F013C */  lui        $at, (0x1F8000E0 >> 16)
/* 5F20C 800715EC B00030AC */  sw         $s0, (0x1F8000B0 & 0xFFFF)($at)
/* 5F210 800715F0 B40031AC */  sw         $s1, (0x1F8000B4 & 0xFFFF)($at)
/* 5F214 800715F4 B80032AC */  sw         $s2, (0x1F8000B8 & 0xFFFF)($at)
/* 5F218 800715F8 BC0033AC */  sw         $s3, (0x1F8000BC & 0xFFFF)($at)
/* 5F21C 800715FC C00034AC */  sw         $s4, (0x1F8000C0 & 0xFFFF)($at)
/* 5F220 80071600 C40035AC */  sw         $s5, (0x1F8000C4 & 0xFFFF)($at)
/* 5F224 80071604 C80036AC */  sw         $s6, (0x1F8000C8 & 0xFFFF)($at)
/* 5F228 80071608 CC0037AC */  sw         $s7, (0x1F8000CC & 0xFFFF)($at)
/* 5F22C 8007160C D0003CAC */  sw         $gp, (0x1F8000D0 & 0xFFFF)($at)
/* 5F230 80071610 D4003DAC */  sw         $sp, (0x1F8000D4 & 0xFFFF)($at)
/* 5F234 80071614 D8003EAC */  sw         $fp, (0x1F8000D8 & 0xFFFF)($at)
/* 5F238 80071618 DC003FAC */  sw         $ra, (0x1F8000DC & 0xFFFF)($at)
/* 5F23C 8007161C E80024AC */  sw         $a0, (0x1F8000E8 & 0xFFFF)($at)
/* 5F240 80071620 04002224 */  addiu      $v0, $at, %lo(D_1F800004)
/* 5F244 80071624 E40022AC */  sw         $v0, (0x1F8000E4 & 0xFFFF)($at)
glabel .L80071628
/* 5F248 80071628 E400448C */  lw         $a0, 0xE4($v0)
/* 5F24C 8007162C FCFF4224 */  addiu      $v0, $v0, -0x4
/* 5F250 80071630 23184100 */  subu       $v1, $v0, $at
/* 5F254 80071634 1F006004 */  bltz       $v1, .L800716B4
/* 5F258 80071638 E40022AC */   sw        $v0, (0x1F8000E4 & 0xFFFF)($at)
/* 5F25C 8007163C 1000838C */  lw         $v1, 0x10($a0)
/* 5F260 80071640 1800888C */  lw         $t0, 0x18($a0)
/* 5F264 80071644 02006010 */  beqz       $v1, .L80071650
/* 5F268 80071648 E80043AC */   sw        $v1, 0xE8($v0)
/* 5F26C 8007164C 04004224 */  addiu      $v0, $v0, 0x4
.L80071650:
/* 5F270 80071650 F5FF0005 */  bltz       $t0, .L80071628
/* 5F274 80071654 E40022AC */   sw        $v0, (0x1F8000E4 & 0xFFFF)($at)
/* 5F278 80071658 0B000015 */  bnez       $t0, .L80071688
/* 5F27C 8007165C FFFF0825 */   addiu     $t0, $t0, -0x1
/* 5F280 80071660 2C00838C */  lw         $v1, 0x2C($a0)
/* 5F284 80071664 00000000 */  nop
/* 5F288 80071668 0A006010 */  beqz       $v1, ThTick_FastRET
/* 5F28C 8007166C 00000000 */   nop
/* 5F290 80071670 09F86000 */  jalr       $v1
/* 5F294 80071674 E00024AC */   sw        $a0, (0x1F8000E0 & 0xFFFF)($at)
/* 5F298 80071678 801F013C */  lui        $at, (0x1F8000E0 >> 16)
/* 5F29C 8007167C E000248C */  lw         $a0, (0x1F8000E0 & 0xFFFF)($at)
/* 5F2A0 80071680 04000104 */  bgez       $zero, ThTick_FastRET
/* 5F2A4 80071684 00000000 */   nop
.L80071688:
/* 5F2A8 80071688 E7FF0104 */  bgez       $zero, .L80071628
/* 5F2AC 8007168C 180088AC */   sw        $t0, 0x18($a0)
/* 5F2B0 80071690 2C0085AC */  sw         $a1, 0x2C($a0)
.size ThTick_RunBucket, . - ThTick_RunBucket
