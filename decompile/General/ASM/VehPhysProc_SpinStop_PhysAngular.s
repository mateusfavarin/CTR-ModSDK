.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel VehPhysProc_SpinStop_PhysAngular
/* 51F40 80064320 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 51F44 80064324 1000B0AF */  sw         $s0, 0x10($sp)
/* 51F48 80064328 2180A000 */  addu       $s0, $a1, $zero
/* 51F4C 8006432C 0980053C */  lui        $a1, %hi(D_8008D2AC)
/* 51F50 80064330 ACD2A58C */  lw         $a1, %lo(D_8008D2AC)($a1)
/* 51F54 80064334 1400BFAF */  sw         $ra, 0x14($sp)
/* 51F58 80064338 C0000386 */  lh         $v1, 0xC0($s0)
/* 51F5C 8006433C 041DA28C */  lw         $v0, 0x1D04($a1)
/* 51F60 80064340 00000000 */  nop
/* 51F64 80064344 18006200 */  mult       $v1, $v0
/* 51F68 80064348 21300000 */  addu       $a2, $zero, $zero
/* 51F6C 8006434C C6030496 */  lhu        $a0, 0x3C6($s0)
/* 51F70 80064350 9A030296 */  lhu        $v0, 0x39A($s0)
/* 51F74 80064354 12380000 */  mflo       $a3
/* 51F78 80064358 431B0700 */  sra        $v1, $a3, 13
/* 51F7C 8006435C 21104300 */  addu       $v0, $v0, $v1
/* 51F80 80064360 D4030396 */  lhu        $v1, 0x3D4($s0)
/* 51F84 80064364 FF0F4230 */  andi       $v0, $v0, 0xFFF
/* 51F88 80064368 9A0302A6 */  sh         $v0, 0x39A($s0)
/* 51F8C 8006436C 21104400 */  addu       $v0, $v0, $a0
/* 51F90 80064370 21186200 */  addu       $v1, $v1, $v0
/* 51F94 80064374 EE0203A6 */  sh         $v1, 0x2EE($s0)
/* 51F98 80064378 041DA58C */  lw         $a1, 0x1D04($a1)
/* 51F9C 8006437C F2020486 */  lh         $a0, 0x2F2($s0)
/* 51FA0 80064380 40290500 */  sll        $a1, $a1, 5
/* 51FA4 80064384 D563010C */  jal        DECOMP_VehCalc_InterpBySpeed
/* 51FA8 80064388 43290500 */   sra       $a1, $a1, 5
/* 51FAC 8006438C 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 51FB0 80064390 ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 51FB4 80064394 21300000 */  addu       $a2, $zero, $zero
/* 51FB8 80064398 F20202A6 */  sh         $v0, 0x2F2($s0)
/* 51FBC 8006439C 041D658C */  lw         $a1, 0x1D04($v1)
/* 51FC0 800643A0 C6030486 */  lh         $a0, 0x3C6($s0)
/* 51FC4 800643A4 C0290500 */  sll        $a1, $a1, 7
/* 51FC8 800643A8 D563010C */  jal        DECOMP_VehCalc_InterpBySpeed
/* 51FCC 800643AC 43290500 */   sra       $a1, $a1, 5
/* 51FD0 800643B0 10030426 */  addiu      $a0, $s0, 0x310
/* 51FD4 800643B4 9A030686 */  lh         $a2, 0x39A($s0)
/* 51FD8 800643B8 60030526 */  addiu      $a1, $s0, 0x360
/* 51FDC 800643BC 277E010C */  jal        VehPhysForce_RotAxisAngle
/* 51FE0 800643C0 C60302A6 */   sh        $v0, 0x3C6($s0)
/* 51FE4 800643C4 1400BF8F */  lw         $ra, 0x14($sp)
/* 51FE8 800643C8 1000B08F */  lw         $s0, 0x10($sp)
/* 51FEC 800643CC 0800E003 */  jr         $ra
/* 51FF0 800643D0 1800BD27 */   addiu     $sp, $sp, 0x18
.size VehPhysProc_SpinStop_PhysAngular, . - VehPhysProc_SpinStop_PhysAngular
