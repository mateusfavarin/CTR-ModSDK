.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel SelectProfile_AdvPickMode_MenuProc
/* 36580 80048960 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 36584 80048964 1800BFAF */  sw         $ra, 0x18($sp)
/* 36588 80048968 1E008284 */  lh         $v0, 0x1E($a0)
/* 3658C 8004896C 00000000 */  nop
/* 36590 80048970 1F004014 */  bnez       $v0, .L800489F0
/* 36594 80048974 21288000 */   addu      $a1, $a0, $zero
/* 36598 80048978 1A008384 */  lh         $v1, 0x1A($a0)
/* 3659C 8004897C 1A008494 */  lhu        $a0, 0x1A($a0)
/* 365A0 80048980 03006228 */  slti       $v0, $v1, 0x3
/* 365A4 80048984 07004010 */  beqz       $v0, .L800489A4
/* 365A8 80048988 03000224 */   addiu     $v0, $zero, 0x3
/* 365AC 8004898C 09006104 */  bgez       $v1, .L800489B4
/* 365B0 80048990 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 365B4 80048994 10006210 */  beq        $v1, $v0, .L800489D8
/* 365B8 80048998 00000000 */   nop
/* 365BC 8004899C 88220108 */  j          .L80048A20
/* 365C0 800489A0 00000000 */   nop
.L800489A4:
/* 365C4 800489A4 0C006210 */  beq        $v1, $v0, .L800489D8
/* 365C8 800489A8 00000000 */   nop
/* 365CC 800489AC 88220108 */  j          .L80048A20
/* 365D0 800489B0 00000000 */   nop
.L800489B4:
/* 365D4 800489B4 20008434 */  ori        $a0, $a0, 0x20
/* 365D8 800489B8 00240400 */  sll        $a0, $a0, 16
/* 365DC 800489BC 8B23010C */  jal        SelectProfile_ToggleMode
/* 365E0 800489C0 03240400 */   sra       $a0, $a0, 16
/* 365E4 800489C4 0880023C */  lui        $v0, %hi(D_80085B88)
/* 365E8 800489C8 885B4224 */  addiu      $v0, $v0, %lo(D_80085B88)
/* 365EC 800489CC B80982AF */  sw         $v0, 0x9B8($gp) /* Failed to symbolize address 0x000009B8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 365F0 800489D0 88220108 */  j          .L80048A20
/* 365F4 800489D4 00000000 */   nop
.L800489D8:
/* 365F8 800489D8 721A010C */  jal        DECOMP_RECTMENU_Hide
/* 365FC 800489DC 2120A000 */   addu      $a0, $a1, $zero
/* 36600 800489E0 3822010C */  jal        SelectProfile_Destroy
/* 36604 800489E4 00000000 */   nop
/* 36608 800489E8 88220108 */  j          .L80048A20
/* 3660C 800489EC 00000000 */   nop
.L800489F0:
/* 36610 800489F0 1400A484 */  lh         $a0, 0x14($a1)
/* 36614 800489F4 7321010C */  jal        SelectProfile_Init
/* 36618 800489F8 00000000 */   nop
/* 3661C 800489FC 0980043C */  lui        $a0, %hi(D_8008FBA4)
/* 36620 80048A00 A4FB8424 */  addiu      $a0, $a0, %lo(D_8008FBA4)
/* 36624 80048A04 10000224 */  addiu      $v0, $zero, 0x10
/* 36628 80048A08 92000524 */  addiu      $a1, $zero, 0x92
/* 3662C 80048A0C 32000624 */  addiu      $a2, $zero, 0x32
/* 36630 80048A10 21380000 */  addu       $a3, $zero, $zero
/* 36634 80048A14 1000A0AF */  sw         $zero, 0x10($sp)
/* 36638 80048A18 FE1F010C */  jal        SelectProfile_DrawAdvProfile
/* 3663C 80048A1C 1400A2AF */   sw        $v0, 0x14($sp)
.L80048A20:
/* 36640 80048A20 1800BF8F */  lw         $ra, 0x18($sp)
/* 36644 80048A24 00000000 */  nop
/* 36648 80048A28 0800E003 */  jr         $ra
/* 3664C 80048A2C 2000BD27 */   addiu     $sp, $sp, 0x20
.size SelectProfile_AdvPickMode_MenuProc, . - SelectProfile_AdvPickMode_MenuProc
