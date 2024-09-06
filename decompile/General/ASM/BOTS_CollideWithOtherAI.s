.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel BOTS_CollideWithOtherAI
/* 4AE8 80016EC8 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 4AEC 80016ECC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 4AF0 80016ED0 21888000 */  addu       $s1, $a0, $zero
/* 4AF4 80016ED4 2000B2AF */  sw         $s2, 0x20($sp)
/* 4AF8 80016ED8 2190A000 */  addu       $s2, $a1, $zero
/* 4AFC 80016EDC 2800BFAF */  sw         $ra, 0x28($sp)
/* 4B00 80016EE0 2400B3AF */  sw         $s3, 0x24($sp)
/* 4B04 80016EE4 1800B0AF */  sw         $s0, 0x18($sp)
/* 4B08 80016EE8 82042286 */  lh         $v0, 0x482($s1)
/* 4B0C 80016EEC 82044386 */  lh         $v1, 0x482($s2)
/* 4B10 80016EF0 00000000 */  nop
/* 4B14 80016EF4 2A104300 */  slt        $v0, $v0, $v1
/* 4B18 80016EF8 03004010 */  beqz       $v0, .L80016F08
/* 4B1C 80016EFC 21102002 */   addu      $v0, $s1, $zero
/* 4B20 80016F00 21884002 */  addu       $s1, $s2, $zero
/* 4B24 80016F04 21904000 */  addu       $s2, $v0, $zero
.L80016F08:
/* 4B28 80016F08 B005228E */  lw         $v0, 0x5B0($s1)
/* 4B2C 80016F0C 00000000 */  nop
/* 4B30 80016F10 01004230 */  andi       $v0, $v0, 0x1
/* 4B34 80016F14 04004010 */  beqz       $v0, .L80016F28
/* 4B38 80016F18 0C063326 */   addiu     $s3, $s1, 0x60C
/* 4B3C 80016F1C A405308E */  lw         $s0, 0x5A4($s1)
/* 4B40 80016F20 D95B0008 */  j          .L80016F64
/* 4B44 80016F24 00000000 */   nop
.L80016F28:
/* 4B48 80016F28 0980023C */  lui        $v0, %hi(D_8008DAEC)
/* 4B4C 80016F2C B8052386 */  lh         $v1, 0x5B8($s1)
/* 4B50 80016F30 ECDA4224 */  addiu      $v0, $v0, %lo(D_8008DAEC)
/* 4B54 80016F34 80180300 */  sll        $v1, $v1, 2
/* 4B58 80016F38 21106200 */  addu       $v0, $v1, $v0
/* 4B5C 80016F3C 0000428C */  lw         $v0, 0x0($v0)
/* 4B60 80016F40 A405338E */  lw         $s3, 0x5A4($s1)
/* 4B64 80016F44 0800428C */  lw         $v0, 0x8($v0)
/* 4B68 80016F48 14007026 */  addiu      $s0, $s3, 0x14
/* 4B6C 80016F4C 2B100202 */  sltu       $v0, $s0, $v0
/* 4B70 80016F50 04004014 */  bnez       $v0, .L80016F64
/* 4B74 80016F54 0980023C */   lui       $v0, %hi(D_8008DAE0)
/* 4B78 80016F58 E0DA4224 */  addiu      $v0, $v0, %lo(D_8008DAE0)
/* 4B7C 80016F5C 21106200 */  addu       $v0, $v1, $v0
/* 4B80 80016F60 0000508C */  lw         $s0, 0x0($v0)
.L80016F64:
/* 4B84 80016F64 D402228E */  lw         $v0, 0x2D4($s1)
/* 4B88 80016F68 21200002 */  addu       $a0, $s0, $zero
/* 4B8C 80016F6C 03120200 */  sra        $v0, $v0, 8
/* 4B90 80016F70 1000A2A7 */  sh         $v0, 0x10($sp)
/* 4B94 80016F74 D802228E */  lw         $v0, 0x2D8($s1)
/* 4B98 80016F78 21286002 */  addu       $a1, $s3, $zero
/* 4B9C 80016F7C 03120200 */  sra        $v0, $v0, 8
/* 4BA0 80016F80 1200A2A7 */  sh         $v0, 0x12($sp)
/* 4BA4 80016F84 DC02228E */  lw         $v0, 0x2DC($s1)
/* 4BA8 80016F88 1000A627 */  addiu      $a2, $sp, 0x10
/* 4BAC 80016F8C 03120200 */  sra        $v0, $v0, 8
/* 4BB0 80016F90 956C000C */  jal        CAM_MapRange_PosPoints
/* 4BB4 80016F94 1400A2A7 */   sh        $v0, 0x14($sp)
/* 4BB8 80016F98 21200002 */  addu       $a0, $s0, $zero
/* 4BBC 80016F9C D402438E */  lw         $v1, 0x2D4($s2)
/* 4BC0 80016FA0 21286002 */  addu       $a1, $s3, $zero
/* 4BC4 80016FA4 031A0300 */  sra        $v1, $v1, 8
/* 4BC8 80016FA8 1000A3A7 */  sh         $v1, 0x10($sp)
/* 4BCC 80016FAC D802438E */  lw         $v1, 0x2D8($s2)
/* 4BD0 80016FB0 1000A627 */  addiu      $a2, $sp, 0x10
/* 4BD4 80016FB4 031A0300 */  sra        $v1, $v1, 8
/* 4BD8 80016FB8 1200A3A7 */  sh         $v1, 0x12($sp)
/* 4BDC 80016FBC DC02438E */  lw         $v1, 0x2DC($s2)
/* 4BE0 80016FC0 21804000 */  addu       $s0, $v0, $zero
/* 4BE4 80016FC4 031A0300 */  sra        $v1, $v1, 8
/* 4BE8 80016FC8 956C000C */  jal        CAM_MapRange_PosPoints
/* 4BEC 80016FCC 1400A3A7 */   sh        $v1, 0x14($sp)
/* 4BF0 80016FD0 2A800202 */  slt        $s0, $s0, $v0
/* 4BF4 80016FD4 08000012 */  beqz       $s0, .L80016FF8
/* 4BF8 80016FD8 00000000 */   nop
/* 4BFC 80016FDC D405428E */  lw         $v0, 0x5D4($s2)
/* 4C00 80016FE0 00000000 */  nop
/* 4C04 80016FE4 48F44224 */  addiu      $v0, $v0, -0xBB8
/* 4C08 80016FE8 09004104 */  bgez       $v0, .L80017010
/* 4C0C 80016FEC D40522AE */   sw        $v0, 0x5D4($s1)
/* 4C10 80016FF0 045C0008 */  j          .L80017010
/* 4C14 80016FF4 D40520AE */   sw        $zero, 0x5D4($s1)
.L80016FF8:
/* 4C18 80016FF8 D405228E */  lw         $v0, 0x5D4($s1)
/* 4C1C 80016FFC 00000000 */  nop
/* 4C20 80017000 48F44224 */  addiu      $v0, $v0, -0xBB8
/* 4C24 80017004 02004104 */  bgez       $v0, .L80017010
/* 4C28 80017008 D40542AE */   sw        $v0, 0x5D4($s2)
/* 4C2C 8001700C D40540AE */  sw         $zero, 0x5D4($s2)
.L80017010:
/* 4C30 80017010 2800BF8F */  lw         $ra, 0x28($sp)
/* 4C34 80017014 2400B38F */  lw         $s3, 0x24($sp)
/* 4C38 80017018 2000B28F */  lw         $s2, 0x20($sp)
/* 4C3C 8001701C 1C00B18F */  lw         $s1, 0x1C($sp)
/* 4C40 80017020 1800B08F */  lw         $s0, 0x18($sp)
/* 4C44 80017024 0800E003 */  jr         $ra
/* 4C48 80017028 3000BD27 */   addiu     $sp, $sp, 0x30
.size BOTS_CollideWithOtherAI, . - BOTS_CollideWithOtherAI
