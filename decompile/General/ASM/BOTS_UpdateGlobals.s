.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel BOTS_UpdateGlobals
/* F94 80013374 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* F98 80013378 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* F9C 8001337C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* FA0 80013380 1000BFAF */  sw         $ra, 0x10($sp)
/* FA4 80013384 AB1C4290 */  lbu        $v0, 0x1CAB($v0)
/* FA8 80013388 00000000 */  nop
/* FAC 8001338C 04004010 */  beqz       $v0, .L800133A0
/* FB0 80013390 21280000 */   addu      $a1, $zero, $zero
/* FB4 80013394 CABF000C */  jal        EngineSound_NearestAIs
/* FB8 80013398 00000000 */   nop
/* FBC 8001339C 21280000 */  addu       $a1, $zero, $zero
.L800133A0:
/* FC0 800133A0 07000424 */  addiu      $a0, $zero, 0x7
/* FC4 800133A4 0980063C */  lui        $a2, %hi(D_8008D2AC)
/* FC8 800133A8 ACD2C68C */  lw         $a2, %lo(D_8008D2AC)($a2)
/* FCC 800133AC 2C07828F */  lw         $v0, 0x72C($gp) /* Failed to symbolize address 0x0000072C for %gp_rel. Make sure this address is within the recognized valid address space */
/* FD0 800133B0 1000073C */  lui        $a3, (0x100000 >> 16)
/* FD4 800133B4 080780AF */  sw         $zero, 0x708($gp) /* Failed to symbolize address 0x00000708 for %gp_rel. Make sure this address is within the recognized valid address space */
/* FD8 800133B8 240780AF */  sw         $zero, 0x724($gp) /* Failed to symbolize address 0x00000724 for %gp_rel. Make sure this address is within the recognized valid address space */
/* FDC 800133BC 01004224 */  addiu      $v0, $v0, 0x1
/* FE0 800133C0 2C0782AF */  sw         $v0, 0x72C($gp) /* Failed to symbolize address 0x0000072C for %gp_rel. Make sure this address is within the recognized valid address space */
/* FE4 800133C4 00140400 */  sll        $v0, $a0, 16
.L800133C8:
/* FE8 800133C8 83130200 */  sra        $v0, $v0, 14
/* FEC 800133CC 2110C200 */  addu       $v0, $a2, $v0
/* FF0 800133D0 0C25438C */  lw         $v1, 0x250C($v0)
/* FF4 800133D4 00000000 */  nop
/* FF8 800133D8 0D006010 */  beqz       $v1, .L80013410
/* FFC 800133DC FFFF8224 */   addiu     $v0, $a0, -0x1
/* 1000 800133E0 C802628C */  lw         $v0, 0x2C8($v1)
/* 1004 800133E4 00000000 */  nop
/* 1008 800133E8 24104700 */  and        $v0, $v0, $a3
/* 100C 800133EC 06004010 */  beqz       $v0, .L80013408
/* 1010 800133F0 00000000 */   nop
/* 1014 800133F4 240783AF */  sw         $v1, 0x724($gp) /* Failed to symbolize address 0x00000724 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 1018 800133F8 0500A014 */  bnez       $a1, .L80013410
/* 101C 800133FC FFFF8224 */   addiu     $v0, $a0, -0x1
/* 1020 80013400 044D0008 */  j          .L80013410
/* 1024 80013404 21286000 */   addu      $a1, $v1, $zero
.L80013408:
/* 1028 80013408 080783AF */  sw         $v1, 0x708($gp) /* Failed to symbolize address 0x00000708 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 102C 8001340C FFFF8224 */  addiu      $v0, $a0, -0x1
.L80013410:
/* 1030 80013410 21204000 */  addu       $a0, $v0, $zero
/* 1034 80013414 00140200 */  sll        $v0, $v0, 16
/* 1038 80013418 EBFF4104 */  bgez       $v0, .L800133C8
/* 103C 8001341C 00140400 */   sll       $v0, $a0, 16
/* 1040 80013420 0807828F */  lw         $v0, 0x708($gp) /* Failed to symbolize address 0x00000708 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 1044 80013424 00000000 */  nop
/* 1048 80013428 02004014 */  bnez       $v0, .L80013434
/* 104C 8001342C 00000000 */   nop
/* 1050 80013430 080785AF */  sw         $a1, 0x708($gp) /* Failed to symbolize address 0x00000708 for %gp_rel. Make sure this address is within the recognized valid address space */
.L80013434:
/* 1054 80013434 1000BF8F */  lw         $ra, 0x10($sp)
/* 1058 80013438 00000000 */  nop
/* 105C 8001343C 0800E003 */  jr         $ra
/* 1060 80013440 1800BD27 */   addiu     $sp, $sp, 0x18
.size BOTS_UpdateGlobals, . - BOTS_UpdateGlobals
