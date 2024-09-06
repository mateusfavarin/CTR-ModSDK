.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel DotLights_AudioAndVideo
/* 11ED8 800242B8 0980053C */  lui        $a1, %hi(D_8008D2AC)
/* 11EDC 800242BC ACD2A58C */  lw         $a1, %lo(D_8008D2AC)($a1)
/* 11EE0 800242C0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 11EE4 800242C4 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 11EE8 800242C8 1800B0AF */  sw         $s0, 0x18($sp)
/* 11EEC 800242CC 0C1DA38C */  lw         $v1, 0x1D0C($a1)
/* 11EF0 800242D0 00000000 */  nop
/* 11EF4 800242D4 41FC6228 */  slti       $v0, $v1, -0x3BF
/* 11EF8 800242D8 5C004014 */  bnez       $v0, .L8002444C
/* 11EFC 800242DC 21808000 */   addu      $s0, $a0, $zero
/* 11F00 800242E0 1500601C */  bgtz       $v1, .L80024338
/* 11F04 800242E4 C1036228 */   slti      $v0, $v1, 0x3C1
/* 11F08 800242E8 A800828F */  lw         $v0, 0xA8($gp) /* Failed to symbolize address 0x000000A8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 11F0C 800242EC 00000000 */  nop
/* 11F10 800242F0 03004018 */  blez       $v0, .L80024300
/* 11F14 800242F4 46000424 */   addiu     $a0, $zero, 0x46
/* 11F18 800242F8 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 11F1C 800242FC 21280000 */   addu      $a1, $zero, $zero
.L80024300:
/* 11F20 80024300 8888043C */  lui        $a0, (0x88888889 >> 16)
/* 11F24 80024304 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 11F28 80024308 ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 11F2C 8002430C 01000224 */  addiu      $v0, $zero, 0x1
/* 11F30 80024310 1000A2AF */  sw         $v0, 0x10($sp)
/* 11F34 80024314 0C1D638C */  lw         $v1, 0x1D0C($v1)
/* 11F38 80024318 89888434 */  ori        $a0, $a0, (0x88888889 & 0xFFFF)
/* 11F3C 8002431C C0036324 */  addiu      $v1, $v1, 0x3C0
/* 11F40 80024320 001B0300 */  sll        $v1, $v1, 12
/* 11F44 80024324 18006400 */  mult       $v1, $a0
/* 11F48 80024328 21284000 */  addu       $a1, $v0, $zero
/* 11F4C 8002432C 21304000 */  addu       $a2, $v0, $zero
/* 11F50 80024330 0B910008 */  j          .L8002442C
/* 11F54 80024334 21384000 */   addu      $a3, $v0, $zero
.L80024338:
/* 11F58 80024338 10004010 */  beqz       $v0, .L8002437C
/* 11F5C 8002433C 81076228 */   slti      $v0, $v1, 0x781
/* 11F60 80024340 A800828F */  lw         $v0, 0xA8($gp) /* Failed to symbolize address 0x000000A8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 11F64 80024344 00000000 */  nop
/* 11F68 80024348 C1034228 */  slti       $v0, $v0, 0x3C1
/* 11F6C 8002434C 05004014 */  bnez       $v0, .L80024364
/* 11F70 80024350 21200002 */   addu      $a0, $s0, $zero
/* 11F74 80024354 45000424 */  addiu      $a0, $zero, 0x45
/* 11F78 80024358 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 11F7C 8002435C 21280000 */   addu      $a1, $zero, $zero
/* 11F80 80024360 21200002 */  addu       $a0, $s0, $zero
.L80024364:
/* 11F84 80024364 01000524 */  addiu      $a1, $zero, 0x1
/* 11F88 80024368 2130A000 */  addu       $a2, $a1, $zero
/* 11F8C 8002436C 2138A000 */  addu       $a3, $a1, $zero
/* 11F90 80024370 00100224 */  addiu      $v0, $zero, 0x1000
/* 11F94 80024374 11910008 */  j          .L80024444
/* 11F98 80024378 1000A0AF */   sw        $zero, 0x10($sp)
.L8002437C:
/* 11F9C 8002437C 10004010 */  beqz       $v0, .L800243C0
/* 11FA0 80024380 410B6228 */   slti      $v0, $v1, 0xB41
/* 11FA4 80024384 A800828F */  lw         $v0, 0xA8($gp) /* Failed to symbolize address 0x000000A8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 11FA8 80024388 00000000 */  nop
/* 11FAC 8002438C 81074228 */  slti       $v0, $v0, 0x781
/* 11FB0 80024390 05004014 */  bnez       $v0, .L800243A8
/* 11FB4 80024394 21200002 */   addu      $a0, $s0, $zero
/* 11FB8 80024398 45000424 */  addiu      $a0, $zero, 0x45
/* 11FBC 8002439C 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 11FC0 800243A0 21280000 */   addu      $a1, $zero, $zero
/* 11FC4 800243A4 21200002 */  addu       $a0, $s0, $zero
.L800243A8:
/* 11FC8 800243A8 01000524 */  addiu      $a1, $zero, 0x1
/* 11FCC 800243AC 2130A000 */  addu       $a2, $a1, $zero
/* 11FD0 800243B0 21380000 */  addu       $a3, $zero, $zero
/* 11FD4 800243B4 00100224 */  addiu      $v0, $zero, 0x1000
/* 11FD8 800243B8 11910008 */  j          .L80024444
/* 11FDC 800243BC 1000A0AF */   sw        $zero, 0x10($sp)
.L800243C0:
/* 11FE0 800243C0 10004010 */  beqz       $v0, .L80024404
/* 11FE4 800243C4 8888043C */   lui       $a0, (0x88888889 >> 16)
/* 11FE8 800243C8 A800828F */  lw         $v0, 0xA8($gp) /* Failed to symbolize address 0x000000A8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 11FEC 800243CC 00000000 */  nop
/* 11FF0 800243D0 410B4228 */  slti       $v0, $v0, 0xB41
/* 11FF4 800243D4 05004014 */  bnez       $v0, .L800243EC
/* 11FF8 800243D8 21200002 */   addu      $a0, $s0, $zero
/* 11FFC 800243DC 45000424 */  addiu      $a0, $zero, 0x45
/* 12000 800243E0 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 12004 800243E4 21280000 */   addu      $a1, $zero, $zero
/* 12008 800243E8 21200002 */  addu       $a0, $s0, $zero
.L800243EC:
/* 1200C 800243EC 01000524 */  addiu      $a1, $zero, 0x1
/* 12010 800243F0 21300000 */  addu       $a2, $zero, $zero
/* 12014 800243F4 2138C000 */  addu       $a3, $a2, $zero
/* 12018 800243F8 00100224 */  addiu      $v0, $zero, 0x1000
/* 1201C 800243FC 11910008 */  j          .L80024444
/* 12020 80024400 1000A0AF */   sw        $zero, 0x10($sp)
.L80024404:
/* 12024 80024404 89888434 */  ori        $a0, $a0, (0x88888889 & 0xFFFF)
/* 12028 80024408 1000A0AF */  sw         $zero, 0x10($sp)
/* 1202C 8002440C 0C1DA28C */  lw         $v0, 0x1D0C($a1)
/* 12030 80024410 000F0324 */  addiu      $v1, $zero, 0xF00
/* 12034 80024414 23186200 */  subu       $v1, $v1, $v0
/* 12038 80024418 001B0300 */  sll        $v1, $v1, 12
/* 1203C 8002441C 18006400 */  mult       $v1, $a0
/* 12040 80024420 21280000 */  addu       $a1, $zero, $zero
/* 12044 80024424 2130A000 */  addu       $a2, $a1, $zero
/* 12048 80024428 2138A000 */  addu       $a3, $a1, $zero
.L8002442C:
/* 1204C 8002442C 21200002 */  addu       $a0, $s0, $zero
/* 12050 80024430 10400000 */  mfhi       $t0
/* 12054 80024434 21100301 */  addu       $v0, $t0, $v1
/* 12058 80024438 43120200 */  sra        $v0, $v0, 9
/* 1205C 8002443C C31F0300 */  sra        $v1, $v1, 31
/* 12060 80024440 23104300 */  subu       $v0, $v0, $v1
.L80024444:
/* 12064 80024444 1B90000C */  jal        DotLights_Video
/* 12068 80024448 1400A2AF */   sw        $v0, 0x14($sp)
.L8002444C:
/* 1206C 8002444C 0C1D028E */  lw         $v0, 0x1D0C($s0)
/* 12070 80024450 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 12074 80024454 1800B08F */  lw         $s0, 0x18($sp)
/* 12078 80024458 A80082AF */  sw         $v0, 0xA8($gp) /* Failed to symbolize address 0x000000A8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 1207C 8002445C 0800E003 */  jr         $ra
/* 12080 80024460 2000BD27 */   addiu     $sp, $sp, 0x20
.size DotLights_AudioAndVideo, . - DotLights_AudioAndVideo
