.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel UI_RenderFrame_AdvHub
/* 41EB8 80054298 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 41EBC 8005429C 0880033C */  lui        $v1, %hi(D_8008625C)
/* 41EC0 800542A0 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 41EC4 800542A4 ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 41EC8 800542A8 5C626324 */  addiu      $v1, $v1, %lo(D_8008625C)
/* 41ECC 800542AC 1800BFAF */  sw         $ra, 0x18($sp)
/* 41ED0 800542B0 1400B1AF */  sw         $s1, 0x14($sp)
/* 41ED4 800542B4 1000B0AF */  sw         $s0, 0x10($sp)
/* 41ED8 800542B8 A81C8290 */  lbu        $v0, 0x1CA8($a0)
/* 41EDC 800542BC EC24918C */  lw         $s1, 0x24EC($a0)
/* 41EE0 800542C0 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 41EE4 800542C4 80100200 */  sll        $v0, $v0, 2
/* 41EE8 800542C8 21104300 */  addu       $v0, $v0, $v1
/* 41EEC 800542CC 0000508C */  lw         $s0, 0x0($v0)
/* 41EF0 800542D0 21302002 */  addu       $a2, $s1, $zero
/* 41EF4 800542D4 70000496 */  lhu        $a0, 0x70($s0)
/* 41EF8 800542D8 72000596 */  lhu        $a1, 0x72($s0)
/* 41EFC 800542DC 10008424 */  addiu      $a0, $a0, 0x10
/* 41F00 800542E0 00240400 */  sll        $a0, $a0, 16
/* 41F04 800542E4 03240400 */  sra        $a0, $a0, 16
/* 41F08 800542E8 F6FFA524 */  addiu      $a1, $a1, -0xA
/* 41F0C 800542EC 002C0500 */  sll        $a1, $a1, 16
/* 41F10 800542F0 C643010C */  jal        DECOMP_UI_DrawNumRelic
/* 41F14 800542F4 032C0500 */   sra       $a1, $a1, 16
/* 41F18 800542F8 21302002 */  addu       $a2, $s1, $zero
/* 41F1C 800542FC 78000496 */  lhu        $a0, 0x78($s0)
/* 41F20 80054300 7A000596 */  lhu        $a1, 0x7A($s0)
/* 41F24 80054304 10008424 */  addiu      $a0, $a0, 0x10
/* 41F28 80054308 00240400 */  sll        $a0, $a0, 16
/* 41F2C 8005430C 03240400 */  sra        $a0, $a0, 16
/* 41F30 80054310 F6FFA524 */  addiu      $a1, $a1, -0xA
/* 41F34 80054314 002C0500 */  sll        $a1, $a1, 16
/* 41F38 80054318 F143010C */  jal        DECOMP_UI_DrawNumKey
/* 41F3C 8005431C 032C0500 */   sra       $a1, $a1, 16
/* 41F40 80054320 21302002 */  addu       $a2, $s1, $zero
/* 41F44 80054324 80000496 */  lhu        $a0, 0x80($s0)
/* 41F48 80054328 82000596 */  lhu        $a1, 0x82($s0)
/* 41F4C 8005432C 10008424 */  addiu      $a0, $a0, 0x10
/* 41F50 80054330 00240400 */  sll        $a0, $a0, 16
/* 41F54 80054334 03240400 */  sra        $a0, $a0, 16
/* 41F58 80054338 F6FFA524 */  addiu      $a1, $a1, -0xA
/* 41F5C 8005433C 002C0500 */  sll        $a1, $a1, 16
/* 41F60 80054340 1C44010C */  jal        DECOMP_UI_DrawNumTrophy
/* 41F64 80054344 032C0500 */   sra       $a1, $a1, 16
/* 41F68 80054348 1800BF8F */  lw         $ra, 0x18($sp)
/* 41F6C 8005434C 1400B18F */  lw         $s1, 0x14($sp)
/* 41F70 80054350 1000B08F */  lw         $s0, 0x10($sp)
/* 41F74 80054354 0800E003 */  jr         $ra
/* 41F78 80054358 2000BD27 */   addiu     $sp, $sp, 0x20
.size UI_RenderFrame_AdvHub, . - UI_RenderFrame_AdvHub
