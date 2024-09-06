.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel SelectProfile_Destroy
/* 36500 800488E0 8809828F */  lw         $v0, 0x988($gp) /* Failed to symbolize address 0x00000988 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36504 800488E4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 36508 800488E8 1800BFAF */  sw         $ra, 0x18($sp)
/* 3650C 800488EC 1400B1AF */  sw         $s1, 0x14($sp)
/* 36510 800488F0 16004010 */  beqz       $v0, .L8004894C
/* 36514 800488F4 1000B0AF */   sw        $s0, 0x10($sp)
/* 36518 800488F8 0400518C */  lw         $s1, 0x4($v0)
/* 3651C 800488FC 21800000 */  addu       $s0, $zero, $zero
.L80048900:
/* 36520 80048900 0000248E */  lw         $a0, 0x0($s1)
/* 36524 80048904 00000000 */  nop
/* 36528 80048908 03008010 */  beqz       $a0, .L80048918
/* 3652C 8004890C 00000000 */   nop
/* 36530 80048910 AAC2000C */  jal        DECOMP_INSTANCE_Death
/* 36534 80048914 00000000 */   nop
.L80048918:
/* 36538 80048918 01001026 */  addiu      $s0, $s0, 0x1
/* 3653C 8004891C FFFF0232 */  andi       $v0, $s0, 0xFFFF
/* 36540 80048920 0C00422C */  sltiu      $v0, $v0, 0xC
/* 36544 80048924 F6FF4014 */  bnez       $v0, .L80048900
/* 36548 80048928 0C003126 */   addiu     $s1, $s1, 0xC
/* 3654C 8004892C 8809828F */  lw         $v0, 0x988($gp) /* Failed to symbolize address 0x00000988 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36550 80048930 00000000 */  nop
/* 36554 80048934 0000438C */  lw         $v1, 0x0($v0)
/* 36558 80048938 00000000 */  nop
/* 3655C 8004893C 1C00628C */  lw         $v0, 0x1C($v1)
/* 36560 80048940 880980AF */  sw         $zero, 0x988($gp) /* Failed to symbolize address 0x00000988 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36564 80048944 00084234 */  ori        $v0, $v0, 0x800
/* 36568 80048948 1C0062AC */  sw         $v0, 0x1C($v1)
.L8004894C:
/* 3656C 8004894C 1800BF8F */  lw         $ra, 0x18($sp)
/* 36570 80048950 1400B18F */  lw         $s1, 0x14($sp)
/* 36574 80048954 1000B08F */  lw         $s0, 0x10($sp)
/* 36578 80048958 0800E003 */  jr         $ra
/* 3657C 8004895C 2000BD27 */   addiu     $sp, $sp, 0x20
.size SelectProfile_Destroy, . - SelectProfile_Destroy
