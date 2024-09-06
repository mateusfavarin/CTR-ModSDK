.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel MEMCARD_Save
/* 2BF64 8003E344 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 2BF68 8003E348 1400B1AF */  sw         $s1, 0x14($sp)
/* 2BF6C 8003E34C 3800B18F */  lw         $s1, 0x38($sp)
/* 2BF70 8003E350 9804828F */  lw         $v0, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BF74 8003E354 1800B2AF */  sw         $s2, 0x18($sp)
/* 2BF78 8003E358 2190C000 */  addu       $s2, $a2, $zero
/* 2BF7C 8003E35C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 2BF80 8003E360 2198E000 */  addu       $s3, $a3, $zero
/* 2BF84 8003E364 2000BFAF */  sw         $ra, 0x20($sp)
/* 2BF88 8003E368 08004014 */  bnez       $v0, .L8003E38C
/* 2BF8C 8003E36C 1000B0AF */   sw        $s0, 0x10($sp)
/* 2BF90 8003E370 00010224 */  addiu      $v0, $zero, 0x100
/* 2BF94 8003E374 6C0982AF */  sw         $v0, 0x96C($gp) /* Failed to symbolize address 0x0000096C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BF98 8003E378 21306002 */  addu       $a2, $s3, $zero
/* 2BF9C 8003E37C E6F6000C */  jal        DECOMP_MEMCARD_NewTask
/* 2BFA0 8003E380 21382002 */   addu      $a3, $s1, $zero
/* 2BFA4 8003E384 03004010 */  beqz       $v0, .L8003E394
/* 2BFA8 8003E388 0880023C */   lui       $v0, %hi(D_800857A0)
.L8003E38C:
/* 2BFAC 8003E38C 40F90008 */  j          .L8003E500
/* 2BFB0 8003E390 01000224 */   addiu     $v0, $zero, 0x1
.L8003E394:
/* 2BFB4 8003E394 A0575024 */  addiu      $s0, $v0, %lo(D_800857A0)
/* 2BFB8 8003E398 3C00A28F */  lw         $v0, 0x3C($sp)
/* 2BFBC 8003E39C 00000000 */  nop
/* 2BFC0 8003E3A0 01004230 */  andi       $v0, $v0, 0x1
/* 2BFC4 8003E3A4 11004014 */  bnez       $v0, .L8003E3EC
/* 2BFC8 8003E3A8 40101100 */   sll       $v0, $s1, 1
/* 2BFCC 8003E3AC 6C09838F */  lw         $v1, 0x96C($gp) /* Failed to symbolize address 0x0000096C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BFD0 8003E3B0 00000000 */  nop
/* 2BFD4 8003E3B4 21106200 */  addu       $v0, $v1, $v0
/* 2BFD8 8003E3B8 FF1F4224 */  addiu      $v0, $v0, 0x1FFF
/* 2BFDC 8003E3BC 43130200 */  sra        $v0, $v0, 13
/* 2BFE0 8003E3C0 02004228 */  slti       $v0, $v0, 0x2
/* 2BFE4 8003E3C4 09004014 */  bnez       $v0, .L8003E3EC
/* 2BFE8 8003E3C8 21107100 */   addu      $v0, $v1, $s1
/* 2BFEC 8003E3CC FF1F4224 */  addiu      $v0, $v0, 0x1FFF
/* 2BFF0 8003E3D0 6009838F */  lw         $v1, 0x960($gp) /* Failed to symbolize address 0x00000960 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BFF4 8003E3D4 43130200 */  sra        $v0, $v0, 13
/* 2BFF8 8003E3D8 030002A2 */  sb         $v0, 0x3($s0)
/* 2BFFC 8003E3DC 04006334 */  ori        $v1, $v1, 0x4
/* 2C000 8003E3E0 600983AF */  sw         $v1, 0x960($gp) /* Failed to symbolize address 0x00000960 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2C004 8003E3E4 06F90008 */  j          .L8003E418
/* 2C008 8003E3E8 21200000 */   addu      $a0, $zero, $zero
.L8003E3EC:
/* 2C00C 8003E3EC 6009828F */  lw         $v0, 0x960($gp) /* Failed to symbolize address 0x00000960 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2C010 8003E3F0 FBFF0324 */  addiu      $v1, $zero, -0x5
/* 2C014 8003E3F4 24104300 */  and        $v0, $v0, $v1
/* 2C018 8003E3F8 600982AF */  sw         $v0, 0x960($gp) /* Failed to symbolize address 0x00000960 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2C01C 8003E3FC 6C09828F */  lw         $v0, 0x96C($gp) /* Failed to symbolize address 0x0000096C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2C020 8003E400 40181100 */  sll        $v1, $s1, 1
/* 2C024 8003E404 21104300 */  addu       $v0, $v0, $v1
/* 2C028 8003E408 FF1F4224 */  addiu      $v0, $v0, 0x1FFF
/* 2C02C 8003E40C 43130200 */  sra        $v0, $v0, 13
/* 2C030 8003E410 030002A2 */  sb         $v0, 0x3($s0)
/* 2C034 8003E414 21200000 */  addu       $a0, $zero, $zero
.L8003E418:
/* 2C038 8003E418 81000624 */  addiu      $a2, $zero, 0x81
/* 2C03C 8003E41C 40000524 */  addiu      $a1, $zero, 0x40
.L8003E420:
/* 2C040 8003E420 21100402 */  addu       $v0, $s0, $a0
/* 2C044 8003E424 21189000 */  addu       $v1, $a0, $s0
/* 2C048 8003E428 02008424 */  addiu      $a0, $a0, 0x2
/* 2C04C 8003E42C 040046A0 */  sb         $a2, 0x4($v0)
/* 2C050 8003E430 40008228 */  slti       $v0, $a0, 0x40
/* 2C054 8003E434 FAFF4014 */  bnez       $v0, .L8003E420
/* 2C058 8003E438 050065A0 */   sb        $a1, 0x5($v1)
/* 2C05C 8003E43C 00004292 */  lbu        $v0, 0x0($s2)
/* 2C060 8003E440 00000000 */  nop
/* 2C064 8003E444 0C004010 */  beqz       $v0, .L8003E478
/* 2C068 8003E448 21200000 */   addu      $a0, $zero, $zero
/* 2C06C 8003E44C 21304002 */  addu       $a2, $s2, $zero
.L8003E450:
/* 2C070 8003E450 40008228 */  slti       $v0, $a0, 0x40
/* 2C074 8003E454 08004010 */  beqz       $v0, .L8003E478
/* 2C078 8003E458 21180402 */   addu      $v1, $s0, $a0
/* 2C07C 8003E45C 0000C290 */  lbu        $v0, 0x0($a2)
/* 2C080 8003E460 0100C624 */  addiu      $a2, $a2, 0x1
/* 2C084 8003E464 040062A0 */  sb         $v0, 0x4($v1)
/* 2C088 8003E468 0000C290 */  lbu        $v0, 0x0($a2)
/* 2C08C 8003E46C 00000000 */  nop
/* 2C090 8003E470 F7FF4014 */  bnez       $v0, .L8003E450
/* 2C094 8003E474 01008424 */   addiu     $a0, $a0, 0x1
.L8003E478:
/* 2C098 8003E478 21206002 */  addu       $a0, $s3, $zero
/* 2C09C 8003E47C 61F5000C */  jal        DECOMP_MEMCARD_ChecksumSave
/* 2C0A0 8003E480 21282002 */   addu      $a1, $s1, $zero
/* 2C0A4 8003E484 0A80023C */  lui        $v0, %hi(D_800990A4)
/* 2C0A8 8003E488 A4905124 */  addiu      $s1, $v0, %lo(D_800990A4)
/* 2C0AC 8003E48C 03000592 */  lbu        $a1, 0x3($s0)
/* 2C0B0 8003E490 21202002 */  addu       $a0, $s1, $zero
/* 2C0B4 8003E494 002C0500 */  sll        $a1, $a1, 16
/* 2C0B8 8003E498 1EE0010C */  jal        open
/* 2C0BC 8003E49C 0002A534 */   ori       $a1, $a1, 0x200
/* 2C0C0 8003E4A0 FFFF1024 */  addiu      $s0, $zero, -0x1
/* 2C0C4 8003E4A4 A00482AF */  sw         $v0, 0x4A0($gp) /* Failed to symbolize address 0x000004A0 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2C0C8 8003E4A8 05005010 */  beq        $v0, $s0, .L8003E4C0
/* 2C0CC 8003E4AC 21202002 */   addu      $a0, $s1, $zero
/* 2C0D0 8003E4B0 B6DF010C */  jal        close
/* 2C0D4 8003E4B4 21204000 */   addu      $a0, $v0, $zero
/* 2C0D8 8003E4B8 A00490AF */  sw         $s0, 0x4A0($gp) /* Failed to symbolize address 0x000004A0 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2C0DC 8003E4BC 21202002 */  addu       $a0, $s1, $zero
.L8003E4C0:
/* 2C0E0 8003E4C0 1EE0010C */  jal        open
/* 2C0E4 8003E4C4 02800534 */   ori       $a1, $zero, 0x8002
/* 2C0E8 8003E4C8 A00482AF */  sw         $v0, 0x4A0($gp) /* Failed to symbolize address 0x000004A0 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2C0EC 8003E4CC 09005010 */  beq        $v0, $s0, .L8003E4F4
/* 2C0F0 8003E4D0 21200000 */   addu      $a0, $zero, $zero
/* 2C0F4 8003E4D4 0880053C */  lui        $a1, %hi(D_800857A0)
/* 2C0F8 8003E4D8 6C09868F */  lw         $a2, 0x96C($gp) /* Failed to symbolize address 0x0000096C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2C0FC 8003E4DC 09000224 */  addiu      $v0, $zero, 0x9
/* 2C100 8003E4E0 980482AF */  sw         $v0, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2C104 8003E4E4 27F7000C */  jal        DECOMP_MEMCARD_WriteFile
/* 2C108 8003E4E8 A057A524 */   addiu     $a1, $a1, %lo(D_800857A0)
/* 2C10C 8003E4EC 40F90008 */  j          .L8003E500
/* 2C110 8003E4F0 00000000 */   nop
.L8003E4F4:
/* 2C114 8003E4F4 FEF6000C */  jal        DECOMP_MEMCARD_CloseFile
/* 2C118 8003E4F8 00000000 */   nop
/* 2C11C 8003E4FC 04000224 */  addiu      $v0, $zero, 0x4
.L8003E500:
/* 2C120 8003E500 2000BF8F */  lw         $ra, 0x20($sp)
/* 2C124 8003E504 1C00B38F */  lw         $s3, 0x1C($sp)
/* 2C128 8003E508 1800B28F */  lw         $s2, 0x18($sp)
/* 2C12C 8003E50C 1400B18F */  lw         $s1, 0x14($sp)
/* 2C130 8003E510 1000B08F */  lw         $s0, 0x10($sp)
/* 2C134 8003E514 0800E003 */  jr         $ra
/* 2C138 8003E518 2800BD27 */   addiu     $sp, $sp, 0x28
.size MEMCARD_Save, . - MEMCARD_Save
