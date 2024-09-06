.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel TakeCupProgress_MenuProc
/* 38E78 8004B258 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 38E7C 8004B25C 1800BFAF */  sw         $ra, 0x18($sp)
/* 38E80 8004B260 1E008284 */  lh         $v0, 0x1E($a0)
/* 38E84 8004B264 01000524 */  addiu      $a1, $zero, 0x1
/* 38E88 8004B268 12004514 */  bne        $v0, $a1, .L8004B2B4
/* 38E8C 8004B26C 00000000 */   nop
/* 38E90 8004B270 CC098487 */  lh         $a0, 0x9CC($gp) /* Failed to symbolize address 0x000009CC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 38E94 8004B274 00000000 */  nop
/* 38E98 8004B278 24008010 */  beqz       $a0, .L8004B30C
/* 38E9C 8004B27C 00800224 */   addiu     $v0, $zero, -0x8000
/* 38EA0 8004B280 1400A2AF */  sw         $v0, 0x14($sp)
/* 38EA4 8004B284 80100400 */  sll        $v0, $a0, 2
/* 38EA8 8004B288 1000A5AF */  sw         $a1, 0x10($sp)
/* 38EAC 8004B28C 00010524 */  addiu      $a1, $zero, 0x100
/* 38EB0 8004B290 0980033C */  lui        $v1, %hi(D_8008D878)
/* 38EB4 8004B294 78D8638C */  lw         $v1, %lo(D_8008D878)($v1)
/* 38EB8 8004B298 3C000624 */  addiu      $a2, $zero, 0x3C
/* 38EBC 8004B29C 21104300 */  addu       $v0, $v0, $v1
/* 38EC0 8004B2A0 0000448C */  lw         $a0, 0x0($v0)
/* 38EC4 8004B2A4 CD8A000C */  jal        DECOMP_DecalFont_DrawMultiLine
/* 38EC8 8004B2A8 CC010724 */   addiu     $a3, $zero, 0x1CC
/* 38ECC 8004B2AC C32C0108 */  j          .L8004B30C
/* 38ED0 8004B2B0 00000000 */   nop
.L8004B2B4:
/* 38ED4 8004B2B4 1A008384 */  lh         $v1, 0x1A($a0)
/* 38ED8 8004B2B8 00000000 */  nop
/* 38EDC 8004B2BC 0D006010 */  beqz       $v1, .L8004B2F4
/* 38EE0 8004B2C0 00000000 */   nop
/* 38EE4 8004B2C4 0500601C */  bgtz       $v1, .L8004B2DC
/* 38EE8 8004B2C8 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 38EEC 8004B2CC 05006210 */  beq        $v1, $v0, .L8004B2E4
/* 38EF0 8004B2D0 00000000 */   nop
/* 38EF4 8004B2D4 C32C0108 */  j          .L8004B30C
/* 38EF8 8004B2D8 00000000 */   nop
.L8004B2DC:
/* 38EFC 8004B2DC 0B006514 */  bne        $v1, $a1, .L8004B30C
/* 38F00 8004B2E0 00000000 */   nop
.L8004B2E4:
/* 38F04 8004B2E4 721A010C */  jal        DECOMP_RECTMENU_Hide
/* 38F08 8004B2E8 00000000 */   nop
/* 38F0C 8004B2EC C32C0108 */  j          .L8004B30C
/* 38F10 8004B2F0 00000000 */   nop
.L8004B2F4:
/* 38F14 8004B2F4 AC0985A7 */  sh         $a1, 0x9AC($gp) /* Failed to symbolize address 0x000009AC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 38F18 8004B2F8 8B23010C */  jal        SelectProfile_ToggleMode
/* 38F1C 8004B2FC 41000424 */   addiu     $a0, $zero, 0x41
/* 38F20 8004B300 0880023C */  lui        $v0, %hi(D_80085BE0)
/* 38F24 8004B304 E05B4224 */  addiu      $v0, $v0, %lo(D_80085BE0)
/* 38F28 8004B308 B80982AF */  sw         $v0, 0x9B8($gp) /* Failed to symbolize address 0x000009B8 for %gp_rel. Make sure this address is within the recognized valid address space */
.L8004B30C:
/* 38F2C 8004B30C 1800BF8F */  lw         $ra, 0x18($sp)
/* 38F30 8004B310 00000000 */  nop
/* 38F34 8004B314 0800E003 */  jr         $ra
/* 38F38 8004B318 2000BD27 */   addiu     $sp, $sp, 0x20
.size TakeCupProgress_MenuProc, . - TakeCupProgress_MenuProc
