.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel MEMCARD_Load
/* 2BEBC 8003E29C 9804828F */  lw         $v0, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BEC0 8003E2A0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2BEC4 8003E2A4 05004014 */  bnez       $v0, .L8003E2BC
/* 2BEC8 8003E2A8 1000BFAF */   sw        $ra, 0x10($sp)
/* 2BECC 8003E2AC E6F6000C */  jal        DECOMP_MEMCARD_NewTask
/* 2BED0 8003E2B0 00000000 */   nop
/* 2BED4 8003E2B4 03004010 */  beqz       $v0, .L8003E2C4
/* 2BED8 8003E2B8 0A80043C */   lui       $a0, %hi(D_800990A4)
.L8003E2BC:
/* 2BEDC 8003E2BC CDF80008 */  j          .L8003E334
/* 2BEE0 8003E2C0 01000224 */   addiu     $v0, $zero, 0x1
.L8003E2C4:
/* 2BEE4 8003E2C4 A4908424 */  addiu      $a0, $a0, %lo(D_800990A4)
/* 2BEE8 8003E2C8 1EE0010C */  jal        open
/* 2BEEC 8003E2CC 01800534 */   ori       $a1, $zero, 0x8001
/* 2BEF0 8003E2D0 A00482AF */  sw         $v0, 0x4A0($gp) /* Failed to symbolize address 0x000004A0 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BEF4 8003E2D4 FFFF0324 */  addiu      $v1, $zero, -0x1
/* 2BEF8 8003E2D8 05004314 */  bne        $v0, $v1, .L8003E2F0
/* 2BEFC 8003E2DC 00000000 */   nop
/* 2BF00 8003E2E0 FEF6000C */  jal        DECOMP_MEMCARD_CloseFile
/* 2BF04 8003E2E4 00000000 */   nop
/* 2BF08 8003E2E8 CDF80008 */  j          .L8003E334
/* 2BF0C 8003E2EC 06000224 */   addiu     $v0, $zero, 0x6
.L8003E2F0:
/* 2BF10 8003E2F0 2800A28F */  lw         $v0, 0x28($sp)
/* 2BF14 8003E2F4 00000000 */  nop
/* 2BF18 8003E2F8 02004230 */  andi       $v0, $v0, 0x2
/* 2BF1C 8003E2FC 04004010 */  beqz       $v0, .L8003E310
/* 2BF20 8003E300 F7FF0324 */   addiu     $v1, $zero, -0x9
/* 2BF24 8003E304 6009828F */  lw         $v0, 0x960($gp) /* Failed to symbolize address 0x00000960 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BF28 8003E308 C7F80008 */  j          .L8003E31C
/* 2BF2C 8003E30C 08004234 */   ori       $v0, $v0, 0x8
.L8003E310:
/* 2BF30 8003E310 6009828F */  lw         $v0, 0x960($gp) /* Failed to symbolize address 0x00000960 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BF34 8003E314 00000000 */  nop
/* 2BF38 8003E318 24104300 */  and        $v0, $v0, $v1
.L8003E31C:
/* 2BF3C 8003E31C 600982AF */  sw         $v0, 0x960($gp) /* Failed to symbolize address 0x00000960 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BF40 8003E320 03000224 */  addiu      $v0, $zero, 0x3
/* 2BF44 8003E324 980482AF */  sw         $v0, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BF48 8003E328 21200000 */  addu       $a0, $zero, $zero
/* 2BF4C 8003E32C 0CF7000C */  jal        DECOMP_MEMCARD_ReadFile
/* 2BF50 8003E330 80000524 */   addiu     $a1, $zero, 0x80
.L8003E334:
/* 2BF54 8003E334 1000BF8F */  lw         $ra, 0x10($sp)
/* 2BF58 8003E338 00000000 */  nop
/* 2BF5C 8003E33C 0800E003 */  jr         $ra
/* 2BF60 8003E340 1800BD27 */   addiu     $sp, $sp, 0x18
.size MEMCARD_Load, . - MEMCARD_Load
