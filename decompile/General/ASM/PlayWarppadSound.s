.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel PlayWarppadSound
/* 1C5B4 8002E994 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1C5B8 8002E998 21308000 */  addu       $a2, $a0, $zero
/* 1C5BC 8002E99C 0980043C */  lui        $a0, %hi(D_800962D0)
/* 1C5C0 8002E9A0 D0628424 */  addiu      $a0, $a0, %lo(D_800962D0)
/* 1C5C4 8002E9A4 1000BFAF */  sw         $ra, 0x10($sp)
/* 1C5C8 8002E9A8 13BA000C */  jal        CalculateVolumeFromDistance
/* 1C5CC 8002E9AC 98000524 */   addiu     $a1, $zero, 0x98
/* 1C5D0 8002E9B0 1000BF8F */  lw         $ra, 0x10($sp)
/* 1C5D4 8002E9B4 00000000 */  nop
/* 1C5D8 8002E9B8 0800E003 */  jr         $ra
/* 1C5DC 8002E9BC 1800BD27 */   addiu     $sp, $sp, 0x18
.size PlayWarppadSound, . - PlayWarppadSound
