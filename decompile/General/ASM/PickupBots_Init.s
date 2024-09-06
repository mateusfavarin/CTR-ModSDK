.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel PickupBots_Init
/* 2E470 80040850 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 2E474 80040854 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 2E478 80040858 0880033C */  lui        $v1, %hi(D_80083A80)
/* 2E47C 8004085C 101A448C */  lw         $a0, 0x1A10($v0)
/* 2E480 80040860 803A6324 */  addiu      $v1, $v1, %lo(D_80083A80)
/* 2E484 80040864 40100400 */  sll        $v0, $a0, 1
/* 2E488 80040868 21104400 */  addu       $v0, $v0, $a0
/* 2E48C 8004086C C0100200 */  sll        $v0, $v0, 3
/* 2E490 80040870 21104300 */  addu       $v0, $v0, $v1
/* 2E494 80040874 00004394 */  lhu        $v1, 0x0($v0)
/* 2E498 80040878 0D000224 */  addiu      $v0, $zero, 0xD
/* 2E49C 8004087C 03008214 */  bne        $a0, $v0, .L8004088C
/* 2E4A0 80040880 00140300 */   sll       $v0, $v1, 16
/* 2E4A4 80040884 21180000 */  addu       $v1, $zero, $zero
/* 2E4A8 80040888 00140300 */  sll        $v0, $v1, 16
.L8004088C:
/* 2E4AC 8004088C 031C0200 */  sra        $v1, $v0, 16
/* 2E4B0 80040890 07006004 */  bltz       $v1, .L800408B0
/* 2E4B4 80040894 0880023C */   lui       $v0, %hi(D_800859D0)
/* 2E4B8 80040898 D0594224 */  addiu      $v0, $v0, %lo(D_800859D0)
/* 2E4BC 8004089C 80180300 */  sll        $v1, $v1, 2
/* 2E4C0 800408A0 21186200 */  addu       $v1, $v1, $v0
/* 2E4C4 800408A4 0000628C */  lw         $v0, 0x0($v1)
/* 2E4C8 800408A8 00000000 */  nop
/* 2E4CC 800408AC 7C0982AF */  sw         $v0, 0x97C($gp) /* Failed to symbolize address 0x0000097C for %gp_rel. Make sure this address is within the recognized valid address space */
.L800408B0:
/* 2E4D0 800408B0 0800E003 */  jr         $ra
/* 2E4D4 800408B4 00000000 */   nop
.size PickupBots_Init, . - PickupBots_Init
