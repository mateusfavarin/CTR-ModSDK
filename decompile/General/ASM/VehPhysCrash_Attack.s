.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel VehPhysCrash_Attack
/* 4AE38 8005D218 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 4AE3C 8005D21C 1000B0AF */  sw         $s0, 0x10($sp)
/* 4AE40 8005D220 21808000 */  addu       $s0, $a0, $zero
/* 4AE44 8005D224 1400B1AF */  sw         $s1, 0x14($sp)
/* 4AE48 8005D228 2188A000 */  addu       $s1, $a1, $zero
/* 4AE4C 8005D22C 1800B2AF */  sw         $s2, 0x18($sp)
/* 4AE50 8005D230 2190C000 */  addu       $s2, $a2, $zero
/* 4AE54 8005D234 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 4AE58 8005D238 2000BFAF */  sw         $ra, 0x20($sp)
/* 4AE5C 8005D23C C802028E */  lw         $v0, 0x2C8($s0)
/* 4AE60 8005D240 8000033C */  lui        $v1, (0x800000 >> 16)
/* 4AE64 8005D244 24104300 */  and        $v0, $v0, $v1
/* 4AE68 8005D248 66004014 */  bnez       $v0, .L8005D3E4
/* 4AE6C 8005D24C 2198E000 */   addu      $s3, $a3, $zero
/* 4AE70 8005D250 C802228E */  lw         $v0, 0x2C8($s1)
/* 4AE74 8005D254 00000000 */  nop
/* 4AE78 8005D258 24104300 */  and        $v0, $v0, $v1
/* 4AE7C 8005D25C 1A004010 */  beqz       $v0, .L8005D2C8
/* 4AE80 8005D260 02000224 */   addiu     $v0, $zero, 0x2
/* 4AE84 8005D264 FF0402A2 */  sb         $v0, 0x4FF($s0)
/* 4AE88 8005D268 06000224 */  addiu      $v0, $zero, 0x6
/* 4AE8C 8005D26C 040502A2 */  sb         $v0, 0x504($s0)
/* 4AE90 8005D270 15004012 */  beqz       $s2, .L8005D2C8
/* 4AE94 8005D274 000511AE */   sw        $s1, 0x500($s0)
/* 4AE98 8005D278 76030392 */  lbu        $v1, 0x376($s0)
/* 4AE9C 8005D27C 06000224 */  addiu      $v0, $zero, 0x6
/* 4AEA0 8005D280 11006210 */  beq        $v1, $v0, .L8005D2C8
/* 4AEA4 8005D284 00000000 */   nop
/* 4AEA8 8005D288 2400028E */  lw         $v0, 0x24($s0)
/* 4AEAC 8005D28C 00000000 */  nop
/* 4AEB0 8005D290 0D004014 */  bnez       $v0, .L8005D2C8
/* 4AEB4 8005D294 FF000524 */   addiu     $a1, $zero, 0xFF
/* 4AEB8 8005D298 CA020496 */  lhu        $a0, 0x2CA($s0)
/* 4AEBC 8005D29C D8B9000C */  jal        OtherFX_DriverCrashing
/* 4AEC0 8005D2A0 01008430 */   andi      $a0, $a0, 0x1
/* 4AEC4 8005D2A4 01000424 */  addiu      $a0, $zero, 0x1
/* 4AEC8 8005D2A8 0880033C */  lui        $v1, %hi(D_80086E84)
/* 4AECC 8005D2AC 4A000292 */  lbu        $v0, 0x4A($s0)
/* 4AED0 8005D2B0 846E6324 */  addiu      $v1, $v1, %lo(D_80086E84)
/* 4AED4 8005D2B4 04108200 */  sllv       $v0, $v0, $a0
/* 4AED8 8005D2B8 21104300 */  addu       $v0, $v0, $v1
/* 4AEDC 8005D2BC 00004584 */  lh         $a1, 0x0($v0)
/* 4AEE0 8005D2C0 FAB2000C */  jal        Voiceline_RequestPlay
/* 4AEE4 8005D2C4 10000624 */   addiu     $a2, $zero, 0x10
.L8005D2C8:
/* 4AEE8 8005D2C8 1400238E */  lw         $v1, 0x14($s1)
/* 4AEEC 8005D2CC 00000000 */  nop
/* 4AEF0 8005D2D0 2B006010 */  beqz       $v1, .L8005D380
/* 4AEF4 8005D2D4 00000000 */   nop
/* 4AEF8 8005D2D8 1400028E */  lw         $v0, 0x14($s0)
/* 4AEFC 8005D2DC 00000000 */  nop
/* 4AF00 8005D2E0 27004014 */  bnez       $v0, .L8005D380
/* 4AF04 8005D2E4 00000000 */   nop
/* 4AF08 8005D2E8 6C00628C */  lw         $v0, 0x6C($v1)
/* 4AF0C 8005D2EC 00000000 */  nop
/* 4AF10 8005D2F0 3000438C */  lw         $v1, 0x30($v0)
/* 4AF14 8005D2F4 00000000 */  nop
/* 4AF18 8005D2F8 06006294 */  lhu        $v0, 0x6($v1)
/* 4AF1C 8005D2FC 00000000 */  nop
/* 4AF20 8005D300 08004234 */  ori        $v0, $v0, 0x8
/* 4AF24 8005D304 060062A4 */  sh         $v0, 0x6($v1)
/* 4AF28 8005D308 02000224 */  addiu      $v0, $zero, 0x2
/* 4AF2C 8005D30C 140020AE */  sw         $zero, 0x14($s1)
/* 4AF30 8005D310 FF0402A2 */  sb         $v0, 0x4FF($s0)
/* 4AF34 8005D314 040500A2 */  sb         $zero, 0x504($s0)
/* 4AF38 8005D318 19004012 */  beqz       $s2, .L8005D380
/* 4AF3C 8005D31C 000511AE */   sw        $s1, 0x500($s0)
/* 4AF40 8005D320 76030392 */  lbu        $v1, 0x376($s0)
/* 4AF44 8005D324 06000224 */  addiu      $v0, $zero, 0x6
/* 4AF48 8005D328 15006210 */  beq        $v1, $v0, .L8005D380
/* 4AF4C 8005D32C 00000000 */   nop
/* 4AF50 8005D330 2400028E */  lw         $v0, 0x24($s0)
/* 4AF54 8005D334 00000000 */  nop
/* 4AF58 8005D338 11004014 */  bnez       $v0, .L8005D380
/* 4AF5C 8005D33C FF000524 */   addiu     $a1, $zero, 0xFF
/* 4AF60 8005D340 CA020496 */  lhu        $a0, 0x2CA($s0)
/* 4AF64 8005D344 D8B9000C */  jal        OtherFX_DriverCrashing
/* 4AF68 8005D348 01008430 */   andi      $a0, $a0, 0x1
/* 4AF6C 8005D34C 03006012 */  beqz       $s3, .L8005D35C
/* 4AF70 8005D350 4F000424 */   addiu     $a0, $zero, 0x4F
/* 4AF74 8005D354 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 4AF78 8005D358 01000524 */   addiu     $a1, $zero, 0x1
.L8005D35C:
/* 4AF7C 8005D35C 01000424 */  addiu      $a0, $zero, 0x1
/* 4AF80 8005D360 0880033C */  lui        $v1, %hi(D_80086E84)
/* 4AF84 8005D364 4A000292 */  lbu        $v0, 0x4A($s0)
/* 4AF88 8005D368 846E6324 */  addiu      $v1, $v1, %lo(D_80086E84)
/* 4AF8C 8005D36C 04108200 */  sllv       $v0, $v0, $a0
/* 4AF90 8005D370 21104300 */  addu       $v0, $v0, $v1
/* 4AF94 8005D374 00004584 */  lh         $a1, 0x0($v0)
/* 4AF98 8005D378 FAB2000C */  jal        Voiceline_RequestPlay
/* 4AF9C 8005D37C 10000624 */   addiu     $a2, $zero, 0x10
.L8005D380:
/* 4AFA0 8005D380 880A828F */  lw         $v0, 0xA88($gp) /* Failed to symbolize address 0x00000A88 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 4AFA4 8005D384 00000000 */  nop
/* 4AFA8 8005D388 010A4228 */  slti       $v0, $v0, 0xA01
/* 4AFAC 8005D38C 16004014 */  bnez       $v0, .L8005D3E8
/* 4AFB0 8005D390 21104002 */   addu      $v0, $s2, $zero
/* 4AFB4 8005D394 E2032286 */  lh         $v0, 0x3E2($s1)
/* 4AFB8 8005D398 00000000 */  nop
/* 4AFBC 8005D39C 12004010 */  beqz       $v0, .L8005D3E8
/* 4AFC0 8005D3A0 21104002 */   addu      $v0, $s2, $zero
/* 4AFC4 8005D3A4 C802228E */  lw         $v0, 0x2C8($s1)
/* 4AFC8 8005D3A8 00000000 */  nop
/* 4AFCC 8005D3AC 00024230 */  andi       $v0, $v0, 0x200
/* 4AFD0 8005D3B0 0D004010 */  beqz       $v0, .L8005D3E8
/* 4AFD4 8005D3B4 21104002 */   addu      $v0, $s2, $zero
/* 4AFD8 8005D3B8 E2030286 */  lh         $v0, 0x3E2($s0)
/* 4AFDC 8005D3BC 00000000 */  nop
/* 4AFE0 8005D3C0 09004014 */  bnez       $v0, .L8005D3E8
/* 4AFE4 8005D3C4 21104002 */   addu      $v0, $s2, $zero
/* 4AFE8 8005D3C8 02000224 */  addiu      $v0, $zero, 0x2
/* 4AFEC 8005D3CC 660322A2 */  sb         $v0, 0x366($s1)
/* 4AFF0 8005D3D0 03000224 */  addiu      $v0, $zero, 0x3
/* 4AFF4 8005D3D4 FF0402A2 */  sb         $v0, 0x4FF($s0)
/* 4AFF8 8005D3D8 05000224 */  addiu      $v0, $zero, 0x5
/* 4AFFC 8005D3DC 040502A2 */  sb         $v0, 0x504($s0)
/* 4B000 8005D3E0 000511AE */  sw         $s1, 0x500($s0)
.L8005D3E4:
/* 4B004 8005D3E4 21104002 */  addu       $v0, $s2, $zero
.L8005D3E8:
/* 4B008 8005D3E8 2000BF8F */  lw         $ra, 0x20($sp)
/* 4B00C 8005D3EC 1C00B38F */  lw         $s3, 0x1C($sp)
/* 4B010 8005D3F0 1800B28F */  lw         $s2, 0x18($sp)
/* 4B014 8005D3F4 1400B18F */  lw         $s1, 0x14($sp)
/* 4B018 8005D3F8 1000B08F */  lw         $s0, 0x10($sp)
/* 4B01C 8005D3FC 0800E003 */  jr         $ra
/* 4B020 8005D400 2800BD27 */   addiu     $sp, $sp, 0x28
.size VehPhysCrash_Attack, . - VehPhysCrash_Attack
