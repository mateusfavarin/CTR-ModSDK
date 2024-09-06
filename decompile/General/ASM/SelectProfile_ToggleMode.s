.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel SelectProfile_ToggleMode
/* 36A4C 80048E2C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 36A50 80048E30 0F008230 */  andi       $v0, $a0, 0xF
/* 36A54 80048E34 F0008430 */  andi       $a0, $a0, 0xF0
/* 36A58 80048E38 1400BFAF */  sw         $ra, 0x14($sp)
/* 36A5C 80048E3C 1000B0AF */  sw         $s0, 0x10($sp)
/* 36A60 80048E40 0C0A82A7 */  sh         $v0, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36A64 80048E44 8C0984A7 */  sh         $a0, 0x98C($gp) /* Failed to symbolize address 0x0000098C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36A68 80048E48 900980A7 */  sh         $zero, 0x990($gp) /* Failed to symbolize address 0x00000990 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36A6C 80048E4C 920980A7 */  sh         $zero, 0x992($gp) /* Failed to symbolize address 0x00000992 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36A70 80048E50 940980A7 */  sh         $zero, 0x994($gp) /* Failed to symbolize address 0x00000994 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36A74 80048E54 960980A7 */  sh         $zero, 0x996($gp) /* Failed to symbolize address 0x00000996 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36A78 80048E58 980980A7 */  sh         $zero, 0x998($gp) /* Failed to symbolize address 0x00000998 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36A7C 80048E5C 7923010C */  jal        SelectProfile_UnMuteCursors
/* 36A80 80048E60 00000000 */   nop
/* 36A84 80048E64 0880023C */  lui        $v0, %hi(D_80085B88)
/* 36A88 80048E68 885B5024 */  addiu      $s0, $v0, %lo(D_80085B88)
/* 36A8C 80048E6C EFFF0424 */  addiu      $a0, $zero, -0x11
/* 36A90 80048E70 0880023C */  lui        $v0, %hi(D_80085D30)
/* 36A94 80048E74 305D4624 */  addiu      $a2, $v0, %lo(D_80085D30)
/* 36A98 80048E78 14000296 */  lhu        $v0, 0x14($s0)
/* 36A9C 80048E7C 1400C394 */  lhu        $v1, 0x14($a2)
/* 36AA0 80048E80 24284400 */  and        $a1, $v0, $a0
/* 36AA4 80048E84 24206400 */  and        $a0, $v1, $a0
/* 36AA8 80048E88 8C098387 */  lh         $v1, 0x98C($gp) /* Failed to symbolize address 0x0000098C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36AAC 80048E8C 20000224 */  addiu      $v0, $zero, 0x20
/* 36AB0 80048E90 140005A6 */  sh         $a1, 0x14($s0)
/* 36AB4 80048E94 05006214 */  bne        $v1, $v0, .L80048EAC
/* 36AB8 80048E98 1400C4A4 */   sh        $a0, 0x14($a2)
/* 36ABC 80048E9C 1000A234 */  ori        $v0, $a1, 0x10
/* 36AC0 80048EA0 140002A6 */  sh         $v0, 0x14($s0)
/* 36AC4 80048EA4 10008234 */  ori        $v0, $a0, 0x10
/* 36AC8 80048EA8 1400C2A4 */  sh         $v0, 0x14($a2)
.L80048EAC:
/* 36ACC 80048EAC 14000486 */  lh         $a0, 0x14($s0)
/* 36AD0 80048EB0 7321010C */  jal        SelectProfile_Init
/* 36AD4 80048EB4 00000000 */   nop
/* 36AD8 80048EB8 0980023C */  lui        $v0, %hi(D_8008D73C)
/* 36ADC 80048EBC 3CD74294 */  lhu        $v0, %lo(D_8008D73C)($v0)
/* 36AE0 80048EC0 00000000 */  nop
/* 36AE4 80048EC4 1A0002A6 */  sh         $v0, 0x1A($s0)
/* 36AE8 80048EC8 1400BF8F */  lw         $ra, 0x14($sp)
/* 36AEC 80048ECC 1000B08F */  lw         $s0, 0x10($sp)
/* 36AF0 80048ED0 8E0980A7 */  sh         $zero, 0x98E($gp) /* Failed to symbolize address 0x0000098E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36AF4 80048ED4 0800E003 */  jr         $ra
/* 36AF8 80048ED8 1800BD27 */   addiu     $sp, $sp, 0x18
.size SelectProfile_ToggleMode, . - SelectProfile_ToggleMode
