.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel VehPickupItem_MissileGetTargetDriver
/* 52BB4 80064F94 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 52BB8 80064F98 6C00B1AF */  sw         $s1, 0x6C($sp)
/* 52BBC 80064F9C 21888000 */  addu       $s1, $a0, $zero
/* 52BC0 80064FA0 7400B3AF */  sw         $s3, 0x74($sp)
/* 52BC4 80064FA4 21980000 */  addu       $s3, $zero, $zero
/* 52BC8 80064FA8 7800BFAF */  sw         $ra, 0x78($sp)
/* 52BCC 80064FAC 7000B2AF */  sw         $s2, 0x70($sp)
/* 52BD0 80064FB0 6800B0AF */  sw         $s0, 0x68($sp)
/* 52BD4 80064FB4 1C00228E */  lw         $v0, 0x1C($s1)
/* 52BD8 80064FB8 FF7F123C */  lui        $s2, (0x7FFFFFFF >> 16)
/* 52BDC 80064FBC 6C00428C */  lw         $v0, 0x6C($v0)
/* 52BE0 80064FC0 00000000 */  nop
/* 52BE4 80064FC4 44004384 */  lh         $v1, 0x44($v0)
/* 52BE8 80064FC8 18000224 */  addiu      $v0, $zero, 0x18
/* 52BEC 80064FCC 1C006214 */  bne        $v1, $v0, .L80065040
/* 52BF0 80064FD0 FFFF5236 */   ori       $s2, $s2, (0x7FFFFFFF & 0xFFFF)
/* 52BF4 80064FD4 4A002292 */  lbu        $v0, 0x4A($s1)
/* 52BF8 80064FD8 00000000 */  nop
/* 52BFC 80064FDC 00190200 */  sll        $v1, $v0, 4
/* 52C00 80064FE0 21186200 */  addu       $v1, $v1, $v0
/* 52C04 80064FE4 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 52C08 80064FE8 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 52C0C 80064FEC 00190300 */  sll        $v1, $v1, 4
/* 52C10 80064FF0 21186200 */  addu       $v1, $v1, $v0
/* 52C14 80064FF4 90016324 */  addiu      $v1, $v1, 0x190
/* 52C18 80064FF8 00006C8C */  lw         $t4, 0x0($v1)
/* 52C1C 80064FFC 04006D8C */  lw         $t5, 0x4($v1)
/* 52C20 80065000 0000CC48 */  ctc2       $t4, $0 /* handwritten instruction */
/* 52C24 80065004 0008CD48 */  ctc2       $t5, $1 /* handwritten instruction */
/* 52C28 80065008 08006C8C */  lw         $t4, 0x8($v1)
/* 52C2C 8006500C 0C006D8C */  lw         $t5, 0xC($v1)
/* 52C30 80065010 10006E8C */  lw         $t6, 0x10($v1)
/* 52C34 80065014 0010CC48 */  ctc2       $t4, $2 /* handwritten instruction */
/* 52C38 80065018 0018CD48 */  ctc2       $t5, $3 /* handwritten instruction */
/* 52C3C 8006501C 0020CE48 */  ctc2       $t6, $4 /* handwritten instruction */
/* 52C40 80065020 14006C8C */  lw         $t4, 0x14($v1)
/* 52C44 80065024 18006D8C */  lw         $t5, 0x18($v1)
/* 52C48 80065028 0028CC48 */  ctc2       $t4, $5 /* handwritten instruction */
/* 52C4C 8006502C 1C006E8C */  lw         $t6, 0x1C($v1)
/* 52C50 80065030 0030CD48 */  ctc2       $t5, $6 /* handwritten instruction */
/* 52C54 80065034 0038CE48 */  ctc2       $t6, $7 /* handwritten instruction */
/* 52C58 80065038 38940108 */  j          .L800650E0
/* 52C5C 8006503C 21300000 */   addu      $a2, $zero, $zero
.L80065040:
/* 52C60 80065040 EC022296 */  lhu        $v0, 0x2EC($s1)
/* 52C64 80065044 1800B027 */  addiu      $s0, $sp, 0x18
/* 52C68 80065048 1000A2A7 */  sh         $v0, 0x10($sp)
/* 52C6C 8006504C EE022296 */  lhu        $v0, 0x2EE($s1)
/* 52C70 80065050 21200002 */  addu       $a0, $s0, $zero
/* 52C74 80065054 1200A2A7 */  sh         $v0, 0x12($sp)
/* 52C78 80065058 F0022296 */  lhu        $v0, 0x2F0($s1)
/* 52C7C 8006505C 1000A527 */  addiu      $a1, $sp, 0x10
/* 52C80 80065060 A9B0010C */  jal        ConvertRotToMatrix
/* 52C84 80065064 1400A2A7 */   sh        $v0, 0x14($sp)
/* 52C88 80065068 D402228E */  lw         $v0, 0x2D4($s1)
/* 52C8C 8006506C 00000000 */  nop
/* 52C90 80065070 03120200 */  sra        $v0, $v0, 8
/* 52C94 80065074 2C00A2AF */  sw         $v0, 0x2C($sp)
/* 52C98 80065078 D802228E */  lw         $v0, 0x2D8($s1)
/* 52C9C 8006507C 3800A427 */  addiu      $a0, $sp, 0x38
/* 52CA0 80065080 03120200 */  sra        $v0, $v0, 8
/* 52CA4 80065084 3000A2AF */  sw         $v0, 0x30($sp)
/* 52CA8 80065088 DC02228E */  lw         $v0, 0x2DC($s1)
/* 52CAC 8006508C 21280002 */  addu       $a1, $s0, $zero
/* 52CB0 80065090 03120200 */  sra        $v0, $v0, 8
/* 52CB4 80065094 99F4000C */  jal        MATH_HitboxMatrix
/* 52CB8 80065098 3400A2AF */   sw        $v0, 0x34($sp)
/* 52CBC 8006509C 00000C8E */  lw         $t4, 0x0($s0)
/* 52CC0 800650A0 04000D8E */  lw         $t5, 0x4($s0)
/* 52CC4 800650A4 0000CC48 */  ctc2       $t4, $0 /* handwritten instruction */
/* 52CC8 800650A8 0008CD48 */  ctc2       $t5, $1 /* handwritten instruction */
/* 52CCC 800650AC 08000C8E */  lw         $t4, 0x8($s0)
/* 52CD0 800650B0 0C000D8E */  lw         $t5, 0xC($s0)
/* 52CD4 800650B4 10000E8E */  lw         $t6, 0x10($s0)
/* 52CD8 800650B8 0010CC48 */  ctc2       $t4, $2 /* handwritten instruction */
/* 52CDC 800650BC 0018CD48 */  ctc2       $t5, $3 /* handwritten instruction */
/* 52CE0 800650C0 0020CE48 */  ctc2       $t6, $4 /* handwritten instruction */
/* 52CE4 800650C4 14000C8E */  lw         $t4, 0x14($s0)
/* 52CE8 800650C8 18000D8E */  lw         $t5, 0x18($s0)
/* 52CEC 800650CC 0028CC48 */  ctc2       $t4, $5 /* handwritten instruction */
/* 52CF0 800650D0 1C000E8E */  lw         $t6, 0x1C($s0)
/* 52CF4 800650D4 0030CD48 */  ctc2       $t5, $6 /* handwritten instruction */
/* 52CF8 800650D8 0038CE48 */  ctc2       $t6, $7 /* handwritten instruction */
/* 52CFC 800650DC 21300000 */  addu       $a2, $zero, $zero
.L800650E0:
/* 52D00 800650E0 6000A727 */  addiu      $a3, $sp, 0x60
.L800650E4:
/* 52D04 800650E4 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 52D08 800650E8 ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 52D0C 800650EC 80100600 */  sll        $v0, $a2, 2
/* 52D10 800650F0 21108200 */  addu       $v0, $a0, $v0
/* 52D14 800650F4 EC24458C */  lw         $a1, 0x24EC($v0)
/* 52D18 800650F8 00000000 */  nop
/* 52D1C 800650FC 6700A010 */  beqz       $a1, .L8006529C
/* 52D20 80065100 00000000 */   nop
/* 52D24 80065104 6500B110 */  beq        $a1, $s1, .L8006529C
/* 52D28 80065108 05000224 */   addiu     $v0, $zero, 0x5
/* 52D2C 8006510C 7603A390 */  lbu        $v1, 0x376($a1)
/* 52D30 80065110 00000000 */  nop
/* 52D34 80065114 61006210 */  beq        $v1, $v0, .L8006529C
/* 52D38 80065118 00000000 */   nop
/* 52D3C 8006511C 0000828C */  lw         $v0, 0x0($a0)
/* 52D40 80065120 00000000 */  nop
/* 52D44 80065124 20004230 */  andi       $v0, $v0, 0x20
/* 52D48 80065128 06004010 */  beqz       $v0, .L80065144
/* 52D4C 8006512C 00000000 */   nop
/* 52D50 80065130 E804A38C */  lw         $v1, 0x4E8($a1)
/* 52D54 80065134 E804228E */  lw         $v0, 0x4E8($s1)
/* 52D58 80065138 00000000 */  nop
/* 52D5C 8006513C 57006210 */  beq        $v1, $v0, .L8006529C
/* 52D60 80065140 00000000 */   nop
.L80065144:
/* 52D64 80065144 2800A28C */  lw         $v0, 0x28($a1)
/* 52D68 80065148 00000000 */  nop
/* 52D6C 8006514C 53004014 */  bnez       $v0, .L8006529C
/* 52D70 80065150 00000000 */   nop
/* 52D74 80065154 1C00A28C */  lw         $v0, 0x1C($a1)
/* 52D78 80065158 00000000 */  nop
/* 52D7C 8006515C 44004294 */  lhu        $v0, 0x44($v0)
/* 52D80 80065160 00000000 */  nop
/* 52D84 80065164 5800A2A7 */  sh         $v0, 0x58($sp)
/* 52D88 80065168 1C00A28C */  lw         $v0, 0x1C($a1)
/* 52D8C 8006516C 00000000 */  nop
/* 52D90 80065170 48004294 */  lhu        $v0, 0x48($v0)
/* 52D94 80065174 00000000 */  nop
/* 52D98 80065178 5A00A2A7 */  sh         $v0, 0x5A($sp)
/* 52D9C 8006517C 1C00A28C */  lw         $v0, 0x1C($a1)
/* 52DA0 80065180 00000000 */  nop
/* 52DA4 80065184 4C004294 */  lhu        $v0, 0x4C($v0)
/* 52DA8 80065188 00000000 */  nop
/* 52DAC 8006518C 5C00A2A7 */  sh         $v0, 0x5C($sp)
/* 52DB0 80065190 5800A227 */  addiu      $v0, $sp, 0x58
/* 52DB4 80065194 000040C8 */  lwc2       $0, 0x0($v0)
/* 52DB8 80065198 040041C8 */  lwc2       $1, 0x4($v0)
/* 52DBC 8006519C 00000000 */  nop
/* 52DC0 800651A0 00000000 */  nop
/* 52DC4 800651A4 0100184A */  RTPS
/* 52DC8 800651A8 0000EEE8 */  swc2       $14, 0x0($a3)
/* 52DCC 800651AC 6400A227 */  addiu      $v0, $sp, 0x64
/* 52DD0 800651B0 00F84C48 */  cfc2       $t4, $31 /* handwritten instruction */
/* 52DD4 800651B4 00000000 */  nop
/* 52DD8 800651B8 00004CAC */  sw         $t4, 0x0($v0)
/* 52DDC 800651BC 6400A28F */  lw         $v0, 0x64($sp)
/* 52DE0 800651C0 0400033C */  lui        $v1, (0x40000 >> 16)
/* 52DE4 800651C4 24104300 */  and        $v0, $v0, $v1
/* 52DE8 800651C8 34004014 */  bnez       $v0, .L8006529C
/* 52DEC 800651CC 00000000 */   nop
/* 52DF0 800651D0 6000A487 */  lh         $a0, 0x60($sp)
/* 52DF4 800651D4 00000000 */  nop
/* 52DF8 800651D8 1F008228 */  slti       $v0, $a0, 0x1F
/* 52DFC 800651DC 2F004014 */  bnez       $v0, .L8006529C
/* 52E00 800651E0 00000000 */   nop
/* 52E04 800651E4 4A002392 */  lbu        $v1, 0x4A($s1)
/* 52E08 800651E8 00000000 */  nop
/* 52E0C 800651EC 00110300 */  sll        $v0, $v1, 4
/* 52E10 800651F0 21104300 */  addu       $v0, $v0, $v1
/* 52E14 800651F4 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 52E18 800651F8 ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 52E1C 800651FC 00110200 */  sll        $v0, $v0, 4
/* 52E20 80065200 21186200 */  addu       $v1, $v1, $v0
/* 52E24 80065204 88016284 */  lh         $v0, 0x188($v1)
/* 52E28 80065208 00000000 */  nop
/* 52E2C 8006520C E2FF4224 */  addiu      $v0, $v0, -0x1E
/* 52E30 80065210 2A108200 */  slt        $v0, $a0, $v0
/* 52E34 80065214 21004010 */  beqz       $v0, .L8006529C
/* 52E38 80065218 00000000 */   nop
/* 52E3C 8006521C 0200E294 */  lhu        $v0, 0x2($a3)
/* 52E40 80065220 00000000 */  nop
/* 52E44 80065224 00140200 */  sll        $v0, $v0, 16
/* 52E48 80065228 03240200 */  sra        $a0, $v0, 16
/* 52E4C 8006522C 15008228 */  slti       $v0, $a0, 0x15
/* 52E50 80065230 1A004014 */  bnez       $v0, .L8006529C
/* 52E54 80065234 00000000 */   nop
/* 52E58 80065238 8A016284 */  lh         $v0, 0x18A($v1)
/* 52E5C 8006523C 00000000 */  nop
/* 52E60 80065240 ECFF4224 */  addiu      $v0, $v0, -0x14
/* 52E64 80065244 2A108200 */  slt        $v0, $a0, $v0
/* 52E68 80065248 14004010 */  beqz       $v0, .L8006529C
/* 52E6C 8006524C 00000000 */   nop
/* 52E70 80065250 D402A28C */  lw         $v0, 0x2D4($a1)
/* 52E74 80065254 D402238E */  lw         $v1, 0x2D4($s1)
/* 52E78 80065258 00000000 */  nop
/* 52E7C 8006525C 23104300 */  subu       $v0, $v0, $v1
/* 52E80 80065260 03120200 */  sra        $v0, $v0, 8
/* 52E84 80065264 18004200 */  mult       $v0, $v0
/* 52E88 80065268 DC02A28C */  lw         $v0, 0x2DC($a1)
/* 52E8C 8006526C DC02238E */  lw         $v1, 0x2DC($s1)
/* 52E90 80065270 12200000 */  mflo       $a0
/* 52E94 80065274 23104300 */  subu       $v0, $v0, $v1
/* 52E98 80065278 03120200 */  sra        $v0, $v0, 8
/* 52E9C 8006527C 18004200 */  mult       $v0, $v0
/* 52EA0 80065280 12180000 */  mflo       $v1
/* 52EA4 80065284 21188300 */  addu       $v1, $a0, $v1
/* 52EA8 80065288 2A107200 */  slt        $v0, $v1, $s2
/* 52EAC 8006528C 03004010 */  beqz       $v0, .L8006529C
/* 52EB0 80065290 00000000 */   nop
/* 52EB4 80065294 21906000 */  addu       $s2, $v1, $zero
/* 52EB8 80065298 2198A000 */  addu       $s3, $a1, $zero
.L8006529C:
/* 52EBC 8006529C 0100C624 */  addiu      $a2, $a2, 0x1
/* 52EC0 800652A0 0800C228 */  slti       $v0, $a2, 0x8
/* 52EC4 800652A4 8FFF4014 */  bnez       $v0, .L800650E4
/* 52EC8 800652A8 21106002 */   addu      $v0, $s3, $zero
/* 52ECC 800652AC 7800BF8F */  lw         $ra, 0x78($sp)
/* 52ED0 800652B0 7400B38F */  lw         $s3, 0x74($sp)
/* 52ED4 800652B4 7000B28F */  lw         $s2, 0x70($sp)
/* 52ED8 800652B8 6C00B18F */  lw         $s1, 0x6C($sp)
/* 52EDC 800652BC 6800B08F */  lw         $s0, 0x68($sp)
/* 52EE0 800652C0 0800E003 */  jr         $ra
/* 52EE4 800652C4 8000BD27 */   addiu     $sp, $sp, 0x80
.size VehPickupItem_MissileGetTargetDriver, . - VehPickupItem_MissileGetTargetDriver
