.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel VehPhysProc_SpinStop_PhysLinear
/* 51F14 800642F4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 51F18 800642F8 1000B0AF */  sw         $s0, 0x10($sp)
/* 51F1C 800642FC 1400BFAF */  sw         $ra, 0x14($sp)
/* 51F20 80064300 0786010C */  jal        DECOMP_VehPhysProc_Driving_PhysLinear
/* 51F24 80064304 2180A000 */   addu      $s0, $a1, $zero
/* 51F28 80064308 9C0300A6 */  sh         $zero, 0x39C($s0)
/* 51F2C 8006430C 9E0300A6 */  sh         $zero, 0x39E($s0)
/* 51F30 80064310 1400BF8F */  lw         $ra, 0x14($sp)
/* 51F34 80064314 1000B08F */  lw         $s0, 0x10($sp)
/* 51F38 80064318 0800E003 */  jr         $ra
/* 51F3C 8006431C 1800BD27 */   addiu     $sp, $sp, 0x18
.size VehPhysProc_SpinStop_PhysLinear, . - VehPhysProc_SpinStop_PhysLinear
