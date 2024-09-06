.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel RefreshCard_GameProgressAndOptions
/* 34E50 80047230 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 34E54 80047234 01000224 */  addiu      $v0, $zero, 0x1
/* 34E58 80047238 F00982A7 */  sh         $v0, 0x9F0($gp) /* Failed to symbolize address 0x000009F0 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34E5C 8004723C BC0982A7 */  sh         $v0, 0x9BC($gp) /* Failed to symbolize address 0x000009BC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34E60 80047240 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 34E64 80047244 1000B0AF */  sw         $s0, 0x10($sp)
/* 34E68 80047248 0980103C */  lui        $s0, %hi(D_8008E6E8)
/* 34E6C 8004724C E8E61026 */  addiu      $s0, $s0, %lo(D_8008E6E8)
/* 34E70 80047250 0805848F */  lw         $a0, 0x508($gp) /* Failed to symbolize address 0x00000508 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34E74 80047254 21280002 */  addu       $a1, $s0, $zero
/* 34E78 80047258 1400BFAF */  sw         $ra, 0x14($sp)
/* 34E7C 8004725C 000A82A7 */  sh         $v0, 0xA00($gp) /* Failed to symbolize address 0x00000A00 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34E80 80047260 5F9B000C */  jal        DECOMP_GAMEPROG_SyncGameAndCard
/* 34E84 80047264 44018424 */   addiu     $a0, $a0, 0x144
/* 34E88 80047268 0805828F */  lw         $v0, 0x508($gp) /* Failed to symbolize address 0x00000508 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34E8C 8004726C 00000000 */  nop
/* 34E90 80047270 44014324 */  addiu      $v1, $v0, 0x144
/* 34E94 80047274 F4154224 */  addiu      $v0, $v0, 0x15F4
.L80047278:
/* 34E98 80047278 0000668C */  lw         $a2, 0x0($v1)
/* 34E9C 8004727C 0400678C */  lw         $a3, 0x4($v1)
/* 34EA0 80047280 0800688C */  lw         $t0, 0x8($v1)
/* 34EA4 80047284 0C00698C */  lw         $t1, 0xC($v1)
/* 34EA8 80047288 000006AE */  sw         $a2, 0x0($s0)
/* 34EAC 8004728C 040007AE */  sw         $a3, 0x4($s0)
/* 34EB0 80047290 080008AE */  sw         $t0, 0x8($s0)
/* 34EB4 80047294 0C0009AE */  sw         $t1, 0xC($s0)
/* 34EB8 80047298 10006324 */  addiu      $v1, $v1, 0x10
/* 34EBC 8004729C F6FF6214 */  bne        $v1, $v0, .L80047278
/* 34EC0 800472A0 10001026 */   addiu     $s0, $s0, 0x10
/* 34EC4 800472A4 0000668C */  lw         $a2, 0x0($v1)
/* 34EC8 800472A8 0400678C */  lw         $a3, 0x4($v1)
/* 34ECC 800472AC 0800688C */  lw         $t0, 0x8($v1)
/* 34ED0 800472B0 000006AE */  sw         $a2, 0x0($s0)
/* 34ED4 800472B4 040007AE */  sw         $a3, 0x4($s0)
/* 34ED8 800472B8 040F010C */  jal        RaceConfig_LoadGameOptions
/* 34EDC 800472BC 080008AE */   sw        $t0, 0x8($s0)
/* 34EE0 800472C0 1400BF8F */  lw         $ra, 0x14($sp)
/* 34EE4 800472C4 1000B08F */  lw         $s0, 0x10($sp)
/* 34EE8 800472C8 0800E003 */  jr         $ra
/* 34EEC 800472CC 1800BD27 */   addiu     $sp, $sp, 0x18
.size RefreshCard_GameProgressAndOptions, . - RefreshCard_GameProgressAndOptions
