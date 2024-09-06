.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel PushBuffer_SetFrustumPlane
/* 30A70 80042E50 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 30A74 80042E54 2800B6AF */  sw         $s6, 0x28($sp)
/* 30A78 80042E58 21B08000 */  addu       $s6, $a0, $zero
/* 30A7C 80042E5C 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 30A80 80042E60 2400B5AF */  sw         $s5, 0x24($sp)
/* 30A84 80042E64 2000B4AF */  sw         $s4, 0x20($sp)
/* 30A88 80042E68 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 30A8C 80042E6C 1800B2AF */  sw         $s2, 0x18($sp)
/* 30A90 80042E70 1400B1AF */  sw         $s1, 0x14($sp)
/* 30A94 80042E74 1000B0AF */  sw         $s0, 0x10($sp)
/* 30A98 80042E78 0000D584 */  lh         $s5, 0x0($a2)
/* 30A9C 80042E7C 0000E284 */  lh         $v0, 0x0($a3)
/* 30AA0 80042E80 0200D384 */  lh         $s3, 0x2($a2)
/* 30AA4 80042E84 0400D484 */  lh         $s4, 0x4($a2)
/* 30AA8 80042E88 23105500 */  subu       $v0, $v0, $s5
/* 30AAC 80042E8C 0000C248 */  ctc2       $v0, $0 /* handwritten instruction */
/* 30AB0 80042E90 0200E284 */  lh         $v0, 0x2($a3)
/* 30AB4 80042E94 00000000 */  nop
/* 30AB8 80042E98 23105300 */  subu       $v0, $v0, $s3
/* 30ABC 80042E9C 0010C248 */  ctc2       $v0, $2 /* handwritten instruction */
/* 30AC0 80042EA0 0400E284 */  lh         $v0, 0x4($a3)
/* 30AC4 80042EA4 00000000 */  nop
/* 30AC8 80042EA8 23105400 */  subu       $v0, $v0, $s4
/* 30ACC 80042EAC 0020C248 */  ctc2       $v0, $4 /* handwritten instruction */
/* 30AD0 80042EB0 0000A284 */  lh         $v0, 0x0($a1)
/* 30AD4 80042EB4 00000000 */  nop
/* 30AD8 80042EB8 23105500 */  subu       $v0, $v0, $s5
/* 30ADC 80042EBC 00488248 */  mtc2       $v0, $9 /* handwritten instruction */
/* 30AE0 80042EC0 0200A284 */  lh         $v0, 0x2($a1)
/* 30AE4 80042EC4 00000000 */  nop
/* 30AE8 80042EC8 23105300 */  subu       $v0, $v0, $s3
/* 30AEC 80042ECC 00508248 */  mtc2       $v0, $10 /* handwritten instruction */
/* 30AF0 80042ED0 0400A284 */  lh         $v0, 0x4($a1)
/* 30AF4 80042ED4 00000000 */  nop
/* 30AF8 80042ED8 23105400 */  subu       $v0, $v0, $s4
/* 30AFC 80042EDC 00588248 */  mtc2       $v0, $11 /* handwritten instruction */
/* 30B00 80042EE0 00000000 */  nop
/* 30B04 80042EE4 00000000 */  nop
/* 30B08 80042EE8 0C00704B */  OP         0
/* 30B0C 80042EEC 00C81048 */  mfc2       $s0, $25 /* handwritten instruction */
/* 30B10 80042EF0 00D01148 */  mfc2       $s1, $26 /* handwritten instruction */
/* 30B14 80042EF4 00D81248 */  mfc2       $s2, $27 /* handwritten instruction */
/* 30B18 80042EF8 02000106 */  bgez       $s0, .L80042F04
/* 30B1C 80042EFC 21100002 */   addu      $v0, $s0, $zero
/* 30B20 80042F00 23100200 */  negu       $v0, $v0
.L80042F04:
/* 30B24 80042F04 00F08248 */  mtc2       $v0, $30 /* handwritten instruction */
/* 30B28 80042F08 00000000 */  nop
/* 30B2C 80042F0C 00000000 */  nop
/* 30B30 80042F10 00F80448 */  mfc2       $a0, $31 /* handwritten instruction */
/* 30B34 80042F14 02002106 */  bgez       $s1, .L80042F20
/* 30B38 80042F18 21102002 */   addu      $v0, $s1, $zero
/* 30B3C 80042F1C 23100200 */  negu       $v0, $v0
.L80042F20:
/* 30B40 80042F20 00F08248 */  mtc2       $v0, $30 /* handwritten instruction */
/* 30B44 80042F24 00000000 */  nop
/* 30B48 80042F28 00000000 */  nop
/* 30B4C 80042F2C 00F80348 */  mfc2       $v1, $31 /* handwritten instruction */
/* 30B50 80042F30 00000000 */  nop
/* 30B54 80042F34 2A106400 */  slt        $v0, $v1, $a0
/* 30B58 80042F38 02004010 */  beqz       $v0, .L80042F44
/* 30B5C 80042F3C 00000000 */   nop
/* 30B60 80042F40 21206000 */  addu       $a0, $v1, $zero
.L80042F44:
/* 30B64 80042F44 02004106 */  bgez       $s2, .L80042F50
/* 30B68 80042F48 21104002 */   addu      $v0, $s2, $zero
/* 30B6C 80042F4C 23100200 */  negu       $v0, $v0
.L80042F50:
/* 30B70 80042F50 00F08248 */  mtc2       $v0, $30 /* handwritten instruction */
/* 30B74 80042F54 00000000 */  nop
/* 30B78 80042F58 00000000 */  nop
/* 30B7C 80042F5C 00F80348 */  mfc2       $v1, $31 /* handwritten instruction */
/* 30B80 80042F60 00000000 */  nop
/* 30B84 80042F64 2A106400 */  slt        $v0, $v1, $a0
/* 30B88 80042F68 03004010 */  beqz       $v0, .L80042F78
/* 30B8C 80042F6C 12008228 */   slti      $v0, $a0, 0x12
/* 30B90 80042F70 21206000 */  addu       $a0, $v1, $zero
/* 30B94 80042F74 12008228 */  slti       $v0, $a0, 0x12
.L80042F78:
/* 30B98 80042F78 05004010 */  beqz       $v0, .L80042F90
/* 30B9C 80042F7C 12000224 */   addiu     $v0, $zero, 0x12
/* 30BA0 80042F80 23204400 */  subu       $a0, $v0, $a0
/* 30BA4 80042F84 07809000 */  srav       $s0, $s0, $a0
/* 30BA8 80042F88 07889100 */  srav       $s1, $s1, $a0
/* 30BAC 80042F8C 07909200 */  srav       $s2, $s2, $a0
.L80042F90:
/* 30BB0 80042F90 18001002 */  mult       $s0, $s0
/* 30BB4 80042F94 12180000 */  mflo       $v1
/* 30BB8 80042F98 00000000 */  nop
/* 30BBC 80042F9C 00000000 */  nop
/* 30BC0 80042FA0 18003102 */  mult       $s1, $s1
/* 30BC4 80042FA4 12480000 */  mflo       $t1
/* 30BC8 80042FA8 00000000 */  nop
/* 30BCC 80042FAC 00000000 */  nop
/* 30BD0 80042FB0 18005202 */  mult       $s2, $s2
/* 30BD4 80042FB4 21206900 */  addu       $a0, $v1, $t1
/* 30BD8 80042FB8 12100000 */  mflo       $v0
/* 30BDC 80042FBC 86B1010C */  jal        SquareRoot0_stub
/* 30BE0 80042FC0 21208200 */   addu      $a0, $a0, $v0
/* 30BE4 80042FC4 21184000 */  addu       $v1, $v0, $zero
/* 30BE8 80042FC8 26006010 */  beqz       $v1, .L80043064
/* 30BEC 80042FCC 00131000 */   sll       $v0, $s0, 12
/* 30BF0 80042FD0 1A004300 */  div        $zero, $v0, $v1
/* 30BF4 80042FD4 02006014 */  bnez       $v1, .L80042FE0
/* 30BF8 80042FD8 00000000 */   nop
/* 30BFC 80042FDC 0D000700 */  break      7
.L80042FE0:
/* 30C00 80042FE0 FFFF0124 */  addiu      $at, $zero, -0x1
/* 30C04 80042FE4 04006114 */  bne        $v1, $at, .L80042FF8
/* 30C08 80042FE8 0080013C */   lui       $at, (0x80000000 >> 16)
/* 30C0C 80042FEC 02004114 */  bne        $v0, $at, .L80042FF8
/* 30C10 80042FF0 00000000 */   nop
/* 30C14 80042FF4 0D000600 */  break      6
.L80042FF8:
/* 30C18 80042FF8 12800000 */  mflo       $s0
/* 30C1C 80042FFC 00131100 */  sll        $v0, $s1, 12
/* 30C20 80043000 00000000 */  nop
/* 30C24 80043004 1A004300 */  div        $zero, $v0, $v1
/* 30C28 80043008 02006014 */  bnez       $v1, .L80043014
/* 30C2C 8004300C 00000000 */   nop
/* 30C30 80043010 0D000700 */  break      7
.L80043014:
/* 30C34 80043014 FFFF0124 */  addiu      $at, $zero, -0x1
/* 30C38 80043018 04006114 */  bne        $v1, $at, .L8004302C
/* 30C3C 8004301C 0080013C */   lui       $at, (0x80000000 >> 16)
/* 30C40 80043020 02004114 */  bne        $v0, $at, .L8004302C
/* 30C44 80043024 00000000 */   nop
/* 30C48 80043028 0D000600 */  break      6
.L8004302C:
/* 30C4C 8004302C 12880000 */  mflo       $s1
/* 30C50 80043030 00131200 */  sll        $v0, $s2, 12
/* 30C54 80043034 00000000 */  nop
/* 30C58 80043038 1A004300 */  div        $zero, $v0, $v1
/* 30C5C 8004303C 02006014 */  bnez       $v1, .L80043048
/* 30C60 80043040 00000000 */   nop
/* 30C64 80043044 0D000700 */  break      7
.L80043048:
/* 30C68 80043048 FFFF0124 */  addiu      $at, $zero, -0x1
/* 30C6C 8004304C 04006114 */  bne        $v1, $at, .L80043060
/* 30C70 80043050 0080013C */   lui       $at, (0x80000000 >> 16)
/* 30C74 80043054 02004114 */  bne        $v0, $at, .L80043060
/* 30C78 80043058 00000000 */   nop
/* 30C7C 8004305C 0D000600 */  break      6
.L80043060:
/* 30C80 80043060 12900000 */  mflo       $s2
.L80043064:
/* 30C84 80043064 00000000 */  nop
/* 30C88 80043068 00000000 */  nop
/* 30C8C 8004306C 18001502 */  mult       $s0, $s5
/* 30C90 80043070 12100000 */  mflo       $v0
/* 30C94 80043074 00000000 */  nop
/* 30C98 80043078 00000000 */  nop
/* 30C9C 8004307C 18003302 */  mult       $s1, $s3
/* 30CA0 80043080 12480000 */  mflo       $t1
/* 30CA4 80043084 00000000 */  nop
/* 30CA8 80043088 00000000 */  nop
/* 30CAC 8004308C 18005402 */  mult       $s2, $s4
/* 30CB0 80043090 C21F1000 */  srl        $v1, $s0, 31
/* 30CB4 80043094 0000D0A6 */  sh         $s0, 0x0($s6)
/* 30CB8 80043098 0200D1A6 */  sh         $s1, 0x2($s6)
/* 30CBC 8004309C 0400D2A6 */  sh         $s2, 0x4($s6)
/* 30CC0 800430A0 21104900 */  addu       $v0, $v0, $t1
/* 30CC4 800430A4 12200000 */  mflo       $a0
/* 30CC8 800430A8 21104400 */  addu       $v0, $v0, $a0
/* 30CCC 800430AC 43130200 */  sra        $v0, $v0, 13
/* 30CD0 800430B0 02002106 */  bgez       $s1, .L800430BC
/* 30CD4 800430B4 0600C2A6 */   sh        $v0, 0x6($s6)
/* 30CD8 800430B8 02006334 */  ori        $v1, $v1, 0x2
.L800430BC:
/* 30CDC 800430BC 02004106 */  bgez       $s2, .L800430C8
/* 30CE0 800430C0 21106000 */   addu      $v0, $v1, $zero
/* 30CE4 800430C4 04004234 */  ori        $v0, $v0, 0x4
.L800430C8:
/* 30CE8 800430C8 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 30CEC 800430CC 2800B68F */  lw         $s6, 0x28($sp)
/* 30CF0 800430D0 2400B58F */  lw         $s5, 0x24($sp)
/* 30CF4 800430D4 2000B48F */  lw         $s4, 0x20($sp)
/* 30CF8 800430D8 1C00B38F */  lw         $s3, 0x1C($sp)
/* 30CFC 800430DC 1800B28F */  lw         $s2, 0x18($sp)
/* 30D00 800430E0 1400B18F */  lw         $s1, 0x14($sp)
/* 30D04 800430E4 1000B08F */  lw         $s0, 0x10($sp)
/* 30D08 800430E8 0800E003 */  jr         $ra
/* 30D0C 800430EC 3000BD27 */   addiu     $sp, $sp, 0x30
.size PushBuffer_SetFrustumPlane, . - PushBuffer_SetFrustumPlane
