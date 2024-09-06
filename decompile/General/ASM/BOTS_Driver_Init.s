.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel BOTS_Driver_Init
/* 4D84 80017164 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 4D88 80017168 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 4D8C 8001716C 21988000 */  addu       $s3, $a0, $zero
/* 4D90 80017170 0980023C */  lui        $v0, %hi(D_8008CF78)
/* 4D94 80017174 78CF4224 */  addiu      $v0, $v0, %lo(D_8008CF78)
/* 4D98 80017178 21106202 */  addu       $v0, $s3, $v0
/* 4D9C 8001717C 1800B2AF */  sw         $s2, 0x18($sp)
/* 4DA0 80017180 21900000 */  addu       $s2, $zero, $zero
/* 4DA4 80017184 0980033C */  lui        $v1, %hi(D_8008DAEC)
/* 4DA8 80017188 2000BFAF */  sw         $ra, 0x20($sp)
/* 4DAC 8001718C 1400B1AF */  sw         $s1, 0x14($sp)
/* 4DB0 80017190 1000B0AF */  sw         $s0, 0x10($sp)
/* 4DB4 80017194 00004290 */  lbu        $v0, 0x0($v0)
/* 4DB8 80017198 ECDA6324 */  addiu      $v1, $v1, %lo(D_8008DAEC)
/* 4DBC 8001719C 00160200 */  sll        $v0, $v0, 24
/* 4DC0 800171A0 038E0200 */  sra        $s1, $v0, 24
/* 4DC4 800171A4 00141100 */  sll        $v0, $s1, 16
/* 4DC8 800171A8 83130200 */  sra        $v0, $v0, 14
/* 4DCC 800171AC 21104300 */  addu       $v0, $v0, $v1
/* 4DD0 800171B0 0000428C */  lw         $v0, 0x0($v0)
/* 4DD4 800171B4 21284002 */  addu       $a1, $s2, $zero
/* 4DD8 800171B8 02004284 */  lh         $v0, 0x2($v0)
/* 4DDC 800171BC 815C0008 */  j          .L80017204
/* 4DE0 800171C0 21302002 */   addu      $a2, $s1, $zero
.L800171C4:
/* 4DE4 800171C4 21884000 */  addu       $s1, $v0, $zero
/* 4DE8 800171C8 00140200 */  sll        $v0, $v0, 16
/* 4DEC 800171CC 03004104 */  bgez       $v0, .L800171DC
/* 4DF0 800171D0 001C1100 */   sll       $v1, $s1, 16
/* 4DF4 800171D4 02001124 */  addiu      $s1, $zero, 0x2
/* 4DF8 800171D8 001C1100 */  sll        $v1, $s1, 16
.L800171DC:
/* 4DFC 800171DC 00140600 */  sll        $v0, $a2, 16
/* 4E00 800171E0 0D006210 */  beq        $v1, $v0, .L80017218
/* 4E04 800171E4 03240300 */   sra       $a0, $v1, 16
/* 4E08 800171E8 0980033C */  lui        $v1, %hi(D_8008DAEC)
/* 4E0C 800171EC ECDA6324 */  addiu      $v1, $v1, %lo(D_8008DAEC)
/* 4E10 800171F0 80100400 */  sll        $v0, $a0, 2
/* 4E14 800171F4 21104300 */  addu       $v0, $v0, $v1
/* 4E18 800171F8 0000428C */  lw         $v0, 0x0($v0)
/* 4E1C 800171FC 00000000 */  nop
/* 4E20 80017200 02004284 */  lh         $v0, 0x2($v0)
.L80017204:
/* 4E24 80017204 00000000 */  nop
/* 4E28 80017208 02004228 */  slti       $v0, $v0, 0x2
/* 4E2C 8001720C EDFF4014 */  bnez       $v0, .L800171C4
/* 4E30 80017210 FFFF2226 */   addiu     $v0, $s1, -0x1
/* 4E34 80017214 01000524 */  addiu      $a1, $zero, 0x1
.L80017218:
/* 4E38 80017218 2110A000 */  addu       $v0, $a1, $zero
/* 4E3C 8001721C 36004010 */  beqz       $v0, .L800172F8
/* 4E40 80017220 2C06043C */   lui       $a0, (0x62C0101 >> 16)
/* 4E44 80017224 01018434 */  ori        $a0, $a0, (0x62C0101 & 0xFFFF)
/* 4E48 80017228 0180053C */  lui        $a1, %hi(BOTS_ThTick_Drive)
/* 4E4C 8001722C 183CA524 */  addiu      $a1, $a1, %lo(BOTS_ThTick_Drive)
/* 4E50 80017230 0180063C */  lui        $a2, %hi(D_8001000C)
/* 4E54 80017234 0C00C624 */  addiu      $a2, $a2, %lo(D_8001000C)
/* 4E58 80017238 1708010C */  jal        DECOMP_PROC_BirthWithObject
/* 4E5C 8001723C 21380000 */   addu      $a3, $zero, $zero
/* 4E60 80017240 21280000 */  addu       $a1, $zero, $zero
/* 4E64 80017244 21804000 */  addu       $s0, $v0, $zero
/* 4E68 80017248 3000128E */  lw         $s2, 0x30($s0)
/* 4E6C 8001724C 2C060624 */  addiu      $a2, $zero, 0x62C
/* 4E70 80017250 2FC6010C */  jal        memset
/* 4E74 80017254 21204002 */   addu      $a0, $s2, $zero
/* 4E78 80017258 21200002 */  addu       $a0, $s0, $zero
/* 4E7C 8001725C 4B63010C */  jal        DECOMP_VehBirth_NonGhost
/* 4E80 80017260 21286002 */   addu      $a1, $s3, $zero
/* 4E84 80017264 002C1100 */  sll        $a1, $s1, 16
/* 4E88 80017268 032C0500 */  sra        $a1, $a1, 16
/* 4E8C 8001726C 40100500 */  sll        $v0, $a1, 1
/* 4E90 80017270 21104500 */  addu       $v0, $v0, $a1
/* 4E94 80017274 80100200 */  sll        $v0, $v0, 2
/* 4E98 80017278 0980043C */  lui        $a0, %hi(D_8008DAF8)
/* 4E9C 8001727C F8DA8424 */  addiu      $a0, $a0, %lo(D_8008DAF8)
/* 4EA0 80017280 21204400 */  addu       $a0, $v0, $a0
/* 4EA4 80017284 80301300 */  sll        $a2, $s3, 2
/* 4EA8 80017288 80280500 */  sll        $a1, $a1, 2
/* 4EAC 8001728C 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 4EB0 80017290 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 4EB4 80017294 3000038E */  lw         $v1, 0x30($s0)
/* 4EB8 80017298 21104600 */  addu       $v0, $v0, $a2
/* 4EBC 8001729C EC2443AC */  sw         $v1, 0x24EC($v0)
/* 4EC0 800172A0 3F000224 */  addiu      $v0, $zero, 0x3F
/* 4EC4 800172A4 440002A6 */  sh         $v0, 0x44($s0)
/* 4EC8 800172A8 C802428E */  lw         $v0, 0x2C8($s2)
/* 4ECC 800172AC 1000033C */  lui        $v1, (0x100000 >> 16)
/* 4ED0 800172B0 B80551A6 */  sh         $s1, 0x5B8($s2)
/* 4ED4 800172B4 25104300 */  or         $v0, $v0, $v1
/* 4ED8 800172B8 C80242AE */  sw         $v0, 0x2C8($s2)
/* 4EDC 800172BC 0980023C */  lui        $v0, %hi(D_8008DAE0)
/* 4EE0 800172C0 E0DA4224 */  addiu      $v0, $v0, %lo(D_8008DAE0)
/* 4EE4 800172C4 2128A200 */  addu       $a1, $a1, $v0
/* 4EE8 800172C8 0000A28C */  lw         $v0, 0x0($a1)
/* 4EEC 800172CC 98054526 */  addiu      $a1, $s2, 0x598
/* 4EF0 800172D0 D1C5000C */  jal        DECOMP_LIST_AddFront
/* 4EF4 800172D4 A40542AE */   sw        $v0, 0x5A4($s2)
/* 4EF8 800172D8 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 4EFC 800172DC ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 4F00 800172E0 00000000 */  nop
/* 4F04 800172E4 AB1C6290 */  lbu        $v0, 0x1CAB($v1)
/* 4F08 800172E8 21204002 */  addu       $a0, $s2, $zero
/* 4F0C 800172EC 01004224 */  addiu      $v0, $v0, 0x1
/* 4F10 800172F0 0B5C000C */  jal        BOTS_GotoStartingLine
/* 4F14 800172F4 AB1C62A0 */   sb        $v0, 0x1CAB($v1)
.L800172F8:
/* 4F18 800172F8 21104002 */  addu       $v0, $s2, $zero
/* 4F1C 800172FC 2000BF8F */  lw         $ra, 0x20($sp)
/* 4F20 80017300 1C00B38F */  lw         $s3, 0x1C($sp)
/* 4F24 80017304 1800B28F */  lw         $s2, 0x18($sp)
/* 4F28 80017308 1400B18F */  lw         $s1, 0x14($sp)
/* 4F2C 8001730C 1000B08F */  lw         $s0, 0x10($sp)
/* 4F30 80017310 0800E003 */  jr         $ra
/* 4F34 80017314 2800BD27 */   addiu     $sp, $sp, 0x28
.size BOTS_Driver_Init, . - BOTS_Driver_Init
