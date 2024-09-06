.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel AnimateWater4P
/* 5B670 8006DA50 801F013C */  lui        $at, (0x1F800000 >> 16)
/* 5B674 8006DA54 000030AC */  sw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 5B678 8006DA58 040031AC */  sw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 5B67C 8006DA5C 080032AC */  sw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 5B680 8006DA60 0C0033AC */  sw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 5B684 8006DA64 100034AC */  sw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 5B688 8006DA68 140035AC */  sw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 5B68C 8006DA6C 180036AC */  sw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 5B690 8006DA70 1C0037AC */  sw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 5B694 8006DA74 20003CAC */  sw         $gp, (0x1F800020 & 0xFFFF)($at)
/* 5B698 8006DA78 24003DAC */  sw         $sp, (0x1F800024 & 0xFFFF)($at)
/* 5B69C 8006DA7C 28003FAC */  sw         $ra, (0x1F800028 & 0xFFFF)($at)
/* 5B6A0 8006DA80 1000B88F */  lw         $t8, 0x10($sp)
/* 5B6A4 8006DA84 1400B98F */  lw         $t9, 0x14($sp)
/* 5B6A8 8006DA88 1800BC8F */  lw         $gp, 0x18($sp)
/* 5B6AC 8006DA8C 1C00BD8F */  lw         $sp, 0x1C($sp)
/* 5B6B0 8006DA90 F8FFC624 */  addiu      $a2, $a2, -0x8
/* 5B6B4 8006DA94 1C000324 */  addiu      $v1, $zero, 0x1C
/* 5B6B8 8006DA98 C2400400 */  srl        $t0, $a0, 3
/* 5B6BC 8006DA9C 1B000301 */  divu       $zero, $t0, $v1
/* 5B6C0 8006DAA0 0000E794 */  lhu        $a3, 0x0($a3)
/* 5B6C4 8006DAA4 10400000 */  mfhi       $t0
/* 5B6C8 8006DAA8 07008930 */  andi       $t1, $a0, 0x7
/* 5B6CC 8006DAAC 404A0900 */  sll        $t1, $t1, 9
/* 5B6D0 8006DAB0 00408948 */  mtc2       $t1, $8 /* handwritten instruction */
/* 5B6D4 8006DAB4 01000925 */  addiu      $t1, $t0, 0x1
/* 5B6D8 8006DAB8 1B002301 */  divu       $zero, $t1, $v1
/* 5B6DC 8006DABC 00000D8F */  lw         $t5, 0x0($t8)
/* 5B6E0 8006DAC0 04001827 */  addiu      $t8, $t8, 0x4
/* 5B6E4 8006DAC4 0000238F */  lw         $v1, 0x0($t9)
/* 5B6E8 8006DAC8 04003927 */  addiu      $t9, $t9, 0x4
/* 5B6EC 8006DACC 2568A301 */  or         $t5, $t5, $v1
/* 5B6F0 8006DAD0 0000838F */  lw         $v1, 0x0($gp)
/* 5B6F4 8006DAD4 04009C27 */  addiu      $gp, $gp, %lo(D_4)
/* 5B6F8 8006DAD8 2568A301 */  or         $t5, $t5, $v1
/* 5B6FC 8006DADC 0000A38F */  lw         $v1, 0x0($sp)
/* 5B700 8006DAE0 0400BD27 */  addiu      $sp, $sp, 0x4
/* 5B704 8006DAE4 2568A301 */  or         $t5, $t5, $v1
/* 5B708 8006DAE8 40580800 */  sll        $t3, $t0, 1
/* 5B70C 8006DAEC 10480000 */  mfhi       $t1
/* 5B710 8006DAF0 20000E24 */  addiu      $t6, $zero, 0x20
/* 5B714 8006DAF4 03000104 */  bgez       $zero, .L8006DB04
/* 5B718 8006DAF8 40600900 */   sll       $t4, $t1, 1
.L8006DAFC:
/* 5B71C 8006DAFC DFB6010C */  jal        AnimateWaterVertex
/* 5B720 8006DB00 0800C624 */   addiu     $a2, $a2, 0x8
.L8006DB04:
/* 5B724 8006DB04 1000A010 */  beqz       $a1, .L8006DB48
/* 5B728 8006DB08 FFFFA524 */   addiu     $a1, $a1, -0x1
/* 5B72C 8006DB0C FBFFC015 */  bnez       $t6, .L8006DAFC
/* 5B730 8006DB10 FFFFCE25 */   addiu     $t6, $t6, -0x1
/* 5B734 8006DB14 00000D8F */  lw         $t5, 0x0($t8)
/* 5B738 8006DB18 04001827 */  addiu      $t8, $t8, 0x4
/* 5B73C 8006DB1C 0000238F */  lw         $v1, 0x0($t9)
/* 5B740 8006DB20 04003927 */  addiu      $t9, $t9, 0x4
/* 5B744 8006DB24 2568A301 */  or         $t5, $t5, $v1
/* 5B748 8006DB28 0000838F */  lw         $v1, 0x0($gp)
/* 5B74C 8006DB2C 04009C27 */  addiu      $gp, $gp, %lo(D_4)
/* 5B750 8006DB30 2568A301 */  or         $t5, $t5, $v1
/* 5B754 8006DB34 0000A38F */  lw         $v1, 0x0($sp)
/* 5B758 8006DB38 0400BD27 */  addiu      $sp, $sp, 0x4
/* 5B75C 8006DB3C 2568A301 */  or         $t5, $t5, $v1
/* 5B760 8006DB40 EEFF0104 */  bgez       $zero, .L8006DAFC
/* 5B764 8006DB44 1F000E24 */   addiu     $t6, $zero, 0x1F
.L8006DB48:
/* 5B768 8006DB48 28003F8C */  lw         $ra, (0x1F800028 & 0xFFFF)($at)
/* 5B76C 8006DB4C 24003D8C */  lw         $sp, (0x1F800024 & 0xFFFF)($at)
/* 5B770 8006DB50 20003C8C */  lw         $gp, (0x1F800020 & 0xFFFF)($at)
/* 5B774 8006DB54 1C00378C */  lw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 5B778 8006DB58 1800368C */  lw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 5B77C 8006DB5C 1400358C */  lw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 5B780 8006DB60 1000348C */  lw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 5B784 8006DB64 0C00338C */  lw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 5B788 8006DB68 0800328C */  lw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 5B78C 8006DB6C 0400318C */  lw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 5B790 8006DB70 0000308C */  lw         $s0, (0x1F800000 & 0xFFFF)($at)
glabel .L8006DB74
/* 5B794 8006DB74 0800E003 */  jr         $ra
/* 5B798 8006DB78 00000000 */   nop
.size AnimateWater4P, . - AnimateWater4P
