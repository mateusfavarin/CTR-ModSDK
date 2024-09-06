.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel SelectProfile_AllProfiles_MenuProc
/* 36CE4 800490C4 88FFBD27 */  addiu      $sp, $sp, -0x78
/* 36CE8 800490C8 6000B4AF */  sw         $s4, 0x60($sp)
/* 36CEC 800490CC 21A08000 */  addu       $s4, $a0, $zero
/* 36CF0 800490D0 7400BFAF */  sw         $ra, 0x74($sp)
/* 36CF4 800490D4 7000BEAF */  sw         $fp, 0x70($sp)
/* 36CF8 800490D8 6C00B7AF */  sw         $s7, 0x6C($sp)
/* 36CFC 800490DC 6800B6AF */  sw         $s6, 0x68($sp)
/* 36D00 800490E0 6400B5AF */  sw         $s5, 0x64($sp)
/* 36D04 800490E4 5C00B3AF */  sw         $s3, 0x5C($sp)
/* 36D08 800490E8 5800B2AF */  sw         $s2, 0x58($sp)
/* 36D0C 800490EC 5400B1AF */  sw         $s1, 0x54($sp)
/* 36D10 800490F0 5000B0AF */  sw         $s0, 0x50($sp)
/* 36D14 800490F4 14008296 */  lhu        $v0, 0x14($s4)
/* 36D18 800490F8 00000000 */  nop
/* 36D1C 800490FC 10004230 */  andi       $v0, $v0, 0x10
/* 36D20 80049100 03004010 */  beqz       $v0, .L80049110
/* 36D24 80049104 2800A0A7 */   sh        $zero, 0x28($sp)
/* 36D28 80049108 1D000924 */  addiu      $t1, $zero, 0x1D
/* 36D2C 8004910C 2800A9A7 */  sh         $t1, 0x28($sp)
.L80049110:
/* 36D30 80049110 0A80023C */  lui        $v0, %hi(D_8009AA5C)
/* 36D34 80049114 5CAA4294 */  lhu        $v0, %lo(D_8009AA5C)($v0)
/* 36D38 80049118 0E058397 */  lhu        $v1, 0x50E($gp) /* Failed to symbolize address 0x0000050E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36D3C 8004911C 21F00000 */  addu       $fp, $zero, $zero
/* 36D40 80049120 3000A2A7 */  sh         $v0, 0x30($sp)
/* 36D44 80049124 0E058287 */  lh         $v0, 0x50E($gp) /* Failed to symbolize address 0x0000050E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36D48 80049128 2190C003 */  addu       $s2, $fp, $zero
/* 36D4C 8004912C 02004014 */  bnez       $v0, .L80049138
/* 36D50 80049130 3800A0A7 */   sh        $zero, 0x38($sp)
/* 36D54 80049134 940980A7 */  sh         $zero, 0x994($gp) /* Failed to symbolize address 0x00000994 for %gp_rel. Make sure this address is within the recognized valid address space */
.L80049138:
/* 36D58 80049138 FFFF6230 */  andi       $v0, $v1, 0xFFFF
/* 36D5C 8004913C 0200422C */  sltiu      $v0, $v0, 0x2
/* 36D60 80049140 02004010 */  beqz       $v0, .L8004914C
/* 36D64 80049144 00000000 */   nop
/* 36D68 80049148 8E0980A7 */  sh         $zero, 0x98E($gp) /* Failed to symbolize address 0x0000098E for %gp_rel. Make sure this address is within the recognized valid address space */
.L8004914C:
/* 36D6C 8004914C 7923010C */  jal        SelectProfile_UnMuteCursors
/* 36D70 80049150 00000000 */   nop
/* 36D74 80049154 90098287 */  lh         $v0, 0x990($gp) /* Failed to symbolize address 0x00000990 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36D78 80049158 00000000 */  nop
/* 36D7C 8004915C 09004014 */  bnez       $v0, .L80049184
/* 36D80 80049160 00000000 */   nop
/* 36D84 80049164 92098287 */  lh         $v0, 0x992($gp) /* Failed to symbolize address 0x00000992 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36D88 80049168 00000000 */  nop
/* 36D8C 8004916C 05004014 */  bnez       $v0, .L80049184
/* 36D90 80049170 00000000 */   nop
/* 36D94 80049174 8E098287 */  lh         $v0, 0x98E($gp) /* Failed to symbolize address 0x0000098E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36D98 80049178 00000000 */  nop
/* 36D9C 8004917C 03004010 */  beqz       $v0, .L8004918C
/* 36DA0 80049180 00000000 */   nop
.L80049184:
/* 36DA4 80049184 6823010C */  jal        SelectProfile_MuteCursors
/* 36DA8 80049188 00000000 */   nop
.L8004918C:
/* 36DAC 8004918C 94098287 */  lh         $v0, 0x994($gp) /* Failed to symbolize address 0x00000994 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36DB0 80049190 00000000 */  nop
/* 36DB4 80049194 3F004010 */  beqz       $v0, .L80049294
/* 36DB8 80049198 0400033C */   lui       $v1, (0x4007F >> 16)
/* 36DBC 8004919C 0A80023C */  lui        $v0, %hi(D_8009A990)
/* 36DC0 800491A0 90A9448C */  lw         $a0, %lo(D_8009A990)($v0)
/* 36DC4 800491A4 7F006334 */  ori        $v1, $v1, (0x4007F & 0xFFFF)
/* 36DC8 800491A8 24188300 */  and        $v1, $a0, $v1
/* 36DCC 800491AC 0D026010 */  beqz       $v1, .L800499E4
/* 36DD0 800491B0 01008230 */   andi      $v0, $a0, 0x1
/* 36DD4 800491B4 0D004010 */  beqz       $v0, .L800491EC
/* 36DD8 800491B8 0880023C */   lui       $v0, %hi(D_80085D30)
/* 36DDC 800491BC 305D5024 */  addiu      $s0, $v0, %lo(D_80085D30)
/* 36DE0 800491C0 1A000286 */  lh         $v0, 0x1A($s0)
/* 36DE4 800491C4 00000000 */  nop
/* 36DE8 800491C8 2B004018 */  blez       $v0, .L80049278
/* 36DEC 800491CC 21200000 */   addu      $a0, $zero, $zero
/* 36DF0 800491D0 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 36DF4 800491D4 01000524 */   addiu     $a1, $zero, 0x1
/* 36DF8 800491D8 1A000296 */  lhu        $v0, 0x1A($s0)
/* 36DFC 800491DC 00000000 */  nop
/* 36E00 800491E0 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 36E04 800491E4 9E240108 */  j          .L80049278
/* 36E08 800491E8 1A0002A6 */   sh        $v0, 0x1A($s0)
.L800491EC:
/* 36E0C 800491EC 02008230 */  andi       $v0, $a0, 0x2
/* 36E10 800491F0 0D004010 */  beqz       $v0, .L80049228
/* 36E14 800491F4 0880023C */   lui       $v0, %hi(D_80085D30)
/* 36E18 800491F8 305D5024 */  addiu      $s0, $v0, %lo(D_80085D30)
/* 36E1C 800491FC 1A000286 */  lh         $v0, 0x1A($s0)
/* 36E20 80049200 00000000 */  nop
/* 36E24 80049204 1C00401C */  bgtz       $v0, .L80049278
/* 36E28 80049208 21200000 */   addu      $a0, $zero, $zero
/* 36E2C 8004920C 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 36E30 80049210 01000524 */   addiu     $a1, $zero, 0x1
/* 36E34 80049214 1A000296 */  lhu        $v0, 0x1A($s0)
/* 36E38 80049218 00000000 */  nop
/* 36E3C 8004921C 01004224 */  addiu      $v0, $v0, 0x1
/* 36E40 80049220 9E240108 */  j          .L80049278
/* 36E44 80049224 1A0002A6 */   sh        $v0, 0x1A($s0)
.L80049228:
/* 36E48 80049228 0400023C */  lui        $v0, (0x40070 >> 16)
/* 36E4C 8004922C 70004234 */  ori        $v0, $v0, (0x40070 & 0xFFFF)
/* 36E50 80049230 24108200 */  and        $v0, $a0, $v0
/* 36E54 80049234 10004010 */  beqz       $v0, .L80049278
/* 36E58 80049238 50008230 */   andi      $v0, $a0, 0x50
/* 36E5C 8004923C 0A004010 */  beqz       $v0, .L80049268
/* 36E60 80049240 01000424 */   addiu     $a0, $zero, 0x1
/* 36E64 80049244 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 36E68 80049248 21288000 */   addu      $a1, $a0, $zero
/* 36E6C 8004924C 0880023C */  lui        $v0, %hi(D_80085D4A)
/* 36E70 80049250 4A5D4284 */  lh         $v0, %lo(D_80085D4A)($v0)
/* 36E74 80049254 00000000 */  nop
/* 36E78 80049258 06004014 */  bnez       $v0, .L80049274
/* 36E7C 8004925C 00000000 */   nop
/* 36E80 80049260 9D240108 */  j          .L80049274
/* 36E84 80049264 01001224 */   addiu     $s2, $zero, 0x1
.L80049268:
/* 36E88 80049268 02000424 */  addiu      $a0, $zero, 0x2
/* 36E8C 8004926C 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 36E90 80049270 01000524 */   addiu     $a1, $zero, 0x1
.L80049274:
/* 36E94 80049274 940980A7 */  sh         $zero, 0x994($gp) /* Failed to symbolize address 0x00000994 for %gp_rel. Make sure this address is within the recognized valid address space */
.L80049278:
/* 36E98 80049278 0119010C */  jal        DECOMP_RECTMENU_ClearInput
/* 36E9C 8004927C 00000000 */   nop
/* 36EA0 80049280 0880023C */  lui        $v0, %hi(D_80085D4A)
/* 36EA4 80049284 4A5D4394 */  lhu        $v1, %lo(D_80085D4A)($v0)
/* 36EA8 80049288 0880023C */  lui        $v0, %hi(D_80085D76)
/* 36EAC 8004928C 79260108 */  j          .L800499E4
/* 36EB0 80049290 765D43A4 */   sh        $v1, %lo(D_80085D76)($v0)
.L80049294:
/* 36EB4 80049294 8C098387 */  lh         $v1, 0x98C($gp) /* Failed to symbolize address 0x0000098C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36EB8 80049298 30000224 */  addiu      $v0, $zero, 0x30
/* 36EBC 8004929C 25006214 */  bne        $v1, $v0, .L80049334
/* 36EC0 800492A0 01000224 */   addiu     $v0, $zero, 0x1
/* 36EC4 800492A4 0C0A8387 */  lh         $v1, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36EC8 800492A8 00000000 */  nop
/* 36ECC 800492AC 12006214 */  bne        $v1, $v0, .L800492F8
/* 36ED0 800492B0 01000A24 */   addiu     $t2, $zero, 0x1
/* 36ED4 800492B4 0A80033C */  lui        $v1, %hi(D_8009AA5C)
/* 36ED8 800492B8 0980023C */  lui        $v0, %hi(D_8008D8AC)
/* 36EDC 800492BC ACD8428C */  lw         $v0, %lo(D_8008D8AC)($v0)
/* 36EE0 800492C0 5CAA6394 */  lhu        $v1, %lo(D_8009AA5C)($v1)
/* 36EE4 800492C4 003E4228 */  slti       $v0, $v0, 0x3E00
/* 36EE8 800492C8 01004238 */  xori       $v0, $v0, 0x1
/* 36EEC 800492CC 3800A2A7 */  sh         $v0, 0x38($sp)
/* 36EF0 800492D0 21106200 */  addu       $v0, $v1, $v0
/* 36EF4 800492D4 21F04000 */  addu       $fp, $v0, $zero
/* 36EF8 800492D8 00140200 */  sll        $v0, $v0, 16
/* 36EFC 800492DC 03140200 */  sra        $v0, $v0, 16
/* 36F00 800492E0 08004228 */  slti       $v0, $v0, 0x8
/* 36F04 800492E4 07004014 */  bnez       $v0, .L80049304
/* 36F08 800492E8 3000A3A7 */   sh        $v1, 0x30($sp)
/* 36F0C 800492EC 07001E24 */  addiu      $fp, $zero, 0x7
/* 36F10 800492F0 C1240108 */  j          .L80049304
/* 36F14 800492F4 3800A0A7 */   sh        $zero, 0x38($sp)
.L800492F8:
/* 36F18 800492F8 3000AB97 */  lhu        $t3, 0x30($sp)
/* 36F1C 800492FC 3800AAA7 */  sh         $t2, 0x38($sp)
/* 36F20 80049300 01007E25 */  addiu      $fp, $t3, 0x1
.L80049304:
/* 36F24 80049304 1A008286 */  lh         $v0, 0x1A($s4)
/* 36F28 80049308 00000000 */  nop
/* 36F2C 8004930C 02004104 */  bgez       $v0, .L80049318
/* 36F30 80049310 00000000 */   nop
/* 36F34 80049314 1A0080A6 */  sh         $zero, 0x1A($s4)
.L80049318:
/* 36F38 80049318 1A008386 */  lh         $v1, 0x1A($s4)
/* 36F3C 8004931C 00141E00 */  sll        $v0, $fp, 16
/* 36F40 80049320 03140200 */  sra        $v0, $v0, 16
/* 36F44 80049324 2A186200 */  slt        $v1, $v1, $v0
/* 36F48 80049328 02006014 */  bnez       $v1, .L80049334
/* 36F4C 8004932C FFFFC227 */   addiu     $v0, $fp, -0x1
/* 36F50 80049330 1A0082A6 */  sh         $v0, 0x1A($s4)
.L80049334:
/* 36F54 80049334 8E098287 */  lh         $v0, 0x98E($gp) /* Failed to symbolize address 0x0000098E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36F58 80049338 00000000 */  nop
/* 36F5C 8004933C A9014014 */  bnez       $v0, .L800499E4
/* 36F60 80049340 30000224 */   addiu     $v0, $zero, 0x30
/* 36F64 80049344 8C098387 */  lh         $v1, 0x98C($gp) /* Failed to symbolize address 0x0000098C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36F68 80049348 00000000 */  nop
/* 36F6C 8004934C 0A006214 */  bne        $v1, $v0, .L80049378
/* 36F70 80049350 21880000 */   addu      $s1, $zero, $zero
/* 36F74 80049354 94098287 */  lh         $v0, 0x994($gp) /* Failed to symbolize address 0x00000994 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36F78 80049358 00000000 */  nop
/* 36F7C 8004935C 07004014 */  bnez       $v0, .L8004937C
/* 36F80 80049360 40000224 */   addiu     $v0, $zero, 0x40
/* 36F84 80049364 21208002 */  addu       $a0, $s4, $zero
/* 36F88 80049368 002C1E00 */  sll        $a1, $fp, 16
/* 36F8C 8004936C 032C0500 */  sra        $a1, $a1, 16
/* 36F90 80049370 68250108 */  j          .L800495A0
/* 36F94 80049374 21300000 */   addu      $a2, $zero, $zero
.L80049378:
/* 36F98 80049378 40000224 */  addiu      $v0, $zero, 0x40
.L8004937C:
/* 36F9C 8004937C 6B006214 */  bne        $v1, $v0, .L8004952C
/* 36FA0 80049380 00000000 */   nop
/* 36FA4 80049384 0E058287 */  lh         $v0, 0x50E($gp) /* Failed to symbolize address 0x0000050E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36FA8 80049388 00000000 */  nop
/* 36FAC 8004938C 16004014 */  bnez       $v0, .L800493E8
/* 36FB0 80049390 01000324 */   addiu     $v1, $zero, 0x1
/* 36FB4 80049394 0A80023C */  lui        $v0, %hi(D_8009A990)
/* 36FB8 80049398 90A9428C */  lw         $v0, %lo(D_8009A990)($v0)
/* 36FBC 8004939C 00000000 */  nop
/* 36FC0 800493A0 50004230 */  andi       $v0, $v0, 0x50
/* 36FC4 800493A4 81004010 */  beqz       $v0, .L800495AC
/* 36FC8 800493A8 01000424 */   addiu     $a0, $zero, 0x1
/* 36FCC 800493AC 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 36FD0 800493B0 21288000 */   addu      $a1, $a0, $zero
/* 36FD4 800493B4 AC098287 */  lh         $v0, 0x9AC($gp) /* Failed to symbolize address 0x000009AC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36FD8 800493B8 00000000 */  nop
/* 36FDC 800493BC 03004014 */  bnez       $v0, .L800493CC
/* 36FE0 800493C0 00000000 */   nop
/* 36FE4 800493C4 ADE8000C */  jal        MainGameEnd_SoloRaceSaveHighScore
/* 36FE8 800493C8 00000000 */   nop
.L800493CC:
/* 36FEC 800493CC 0119010C */  jal        DECOMP_RECTMENU_ClearInput
/* 36FF0 800493D0 00000000 */   nop
/* 36FF4 800493D4 01000224 */  addiu      $v0, $zero, 0x1
/* 36FF8 800493D8 8E0982A7 */  sh         $v0, 0x98E($gp) /* Failed to symbolize address 0x0000098E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36FFC 800493DC 900982A7 */  sh         $v0, 0x990($gp) /* Failed to symbolize address 0x00000990 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37000 800493E0 6C250108 */  j          .L800495B0
/* 37004 800493E4 00141100 */   sll       $v0, $s1, 16
.L800493E8:
/* 37008 800493E8 0F004314 */  bne        $v0, $v1, .L80049428
/* 3700C 800493EC 0A80023C */   lui       $v0, %hi(D_8009A990)
/* 37010 800493F0 90A9428C */  lw         $v0, %lo(D_8009A990)($v0)
/* 37014 800493F4 00000000 */  nop
/* 37018 800493F8 40004230 */  andi       $v0, $v0, 0x40
/* 3701C 800493FC 6C004010 */  beqz       $v0, .L800495B0
/* 37020 80049400 00141100 */   sll       $v0, $s1, 16
/* 37024 80049404 0119010C */  jal        DECOMP_RECTMENU_ClearInput
/* 37028 80049408 00000000 */   nop
/* 3702C 8004940C 01000424 */  addiu      $a0, $zero, 0x1
/* 37030 80049410 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 37034 80049414 21288000 */   addu      $a1, $a0, $zero
/* 37038 80049418 661C010C */  jal        RefreshCard_StartMemcardAction
/* 3703C 8004941C 07000424 */   addiu     $a0, $zero, 0x7
/* 37040 80049420 6C250108 */  j          .L800495B0
/* 37044 80049424 00141100 */   sll       $v0, $s1, 16
.L80049428:
/* 37048 80049428 0980023C */  lui        $v0, %hi(D_8008D8AC)
/* 3704C 8004942C ACD8428C */  lw         $v0, %lo(D_8008D8AC)($v0)
/* 37050 80049430 00000000 */  nop
/* 37054 80049434 8016422C */  sltiu      $v0, $v0, 0x1680
/* 37058 80049438 09004010 */  beqz       $v0, .L80049460
/* 3705C 8004943C 00000000 */   nop
/* 37060 80049440 BC098287 */  lh         $v0, 0x9BC($gp) /* Failed to symbolize address 0x000009BC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37064 80049444 00000000 */  nop
/* 37068 80049448 05004014 */  bnez       $v0, .L80049460
/* 3706C 8004944C 00000000 */   nop
/* 37070 80049450 0C0A8287 */  lh         $v0, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37074 80049454 00000000 */  nop
/* 37078 80049458 55004310 */  beq        $v0, $v1, .L800495B0
/* 3707C 8004945C 00141100 */   sll       $v0, $s1, 16
.L80049460:
/* 37080 80049460 F0098287 */  lh         $v0, 0x9F0($gp) /* Failed to symbolize address 0x000009F0 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37084 80049464 00000000 */  nop
/* 37088 80049468 05004014 */  bnez       $v0, .L80049480
/* 3708C 8004946C 00000000 */   nop
/* 37090 80049470 BC098287 */  lh         $v0, 0x9BC($gp) /* Failed to symbolize address 0x000009BC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37094 80049474 00000000 */  nop
/* 37098 80049478 4D004010 */  beqz       $v0, .L800495B0
/* 3709C 8004947C 00141100 */   sll       $v0, $s1, 16
.L80049480:
/* 370A0 80049480 AC098287 */  lh         $v0, 0x9AC($gp) /* Failed to symbolize address 0x000009AC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 370A4 80049484 00000000 */  nop
/* 370A8 80049488 03004014 */  bnez       $v0, .L80049498
/* 370AC 8004948C 00000000 */   nop
/* 370B0 80049490 ADE8000C */  jal        MainGameEnd_SoloRaceSaveHighScore
/* 370B4 80049494 00000000 */   nop
.L80049498:
/* 370B8 80049498 490F010C */  jal        RaceConfig_SaveGameOptions
/* 370BC 8004949C 0980103C */   lui       $s0, %hi(D_8008E6E8)
/* 370C0 800494A0 3D9B000C */  jal        DECOMP_GAMEPROG_SaveCupProgress
/* 370C4 800494A4 E8E61026 */   addiu     $s0, $s0, %lo(D_8008E6E8)
/* 370C8 800494A8 0805848F */  lw         $a0, 0x508($gp) /* Failed to symbolize address 0x00000508 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 370CC 800494AC 21280002 */  addu       $a1, $s0, $zero
/* 370D0 800494B0 5F9B000C */  jal        DECOMP_GAMEPROG_SyncGameAndCard
/* 370D4 800494B4 44018424 */   addiu     $a0, $a0, 0x144
/* 370D8 800494B8 0805828F */  lw         $v0, 0x508($gp) /* Failed to symbolize address 0x00000508 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 370DC 800494BC B0140326 */  addiu      $v1, $s0, 0x14B0
/* 370E0 800494C0 44014224 */  addiu      $v0, $v0, 0x144
.L800494C4:
/* 370E4 800494C4 00000C8E */  lw         $t4, 0x0($s0)
/* 370E8 800494C8 0400098E */  lw         $t1, 0x4($s0)
/* 370EC 800494CC 08000A8E */  lw         $t2, 0x8($s0)
/* 370F0 800494D0 0C000B8E */  lw         $t3, 0xC($s0)
/* 370F4 800494D4 00004CAC */  sw         $t4, 0x0($v0)
/* 370F8 800494D8 040049AC */  sw         $t1, 0x4($v0)
/* 370FC 800494DC 08004AAC */  sw         $t2, 0x8($v0)
/* 37100 800494E0 0C004BAC */  sw         $t3, 0xC($v0)
/* 37104 800494E4 10001026 */  addiu      $s0, $s0, 0x10
/* 37108 800494E8 F6FF0316 */  bne        $s0, $v1, .L800494C4
/* 3710C 800494EC 10004224 */   addiu     $v0, $v0, 0x10
/* 37110 800494F0 21200000 */  addu       $a0, $zero, $zero
/* 37114 800494F4 00000C8E */  lw         $t4, 0x0($s0)
/* 37118 800494F8 0400098E */  lw         $t1, 0x4($s0)
/* 3711C 800494FC 08000A8E */  lw         $t2, 0x8($s0)
/* 37120 80049500 00004CAC */  sw         $t4, 0x0($v0)
/* 37124 80049504 040049AC */  sw         $t1, 0x4($v0)
/* 37128 80049508 39F5000C */  jal        DECOMP_MEMCARD_SetIcon
/* 3712C 8004950C 08004AAC */   sw        $t2, 0x8($v0)
/* 37130 80049510 661C010C */  jal        RefreshCard_StartMemcardAction
/* 37134 80049514 03000424 */   addiu     $a0, $zero, 0x3
/* 37138 80049518 01000224 */  addiu      $v0, $zero, 0x1
/* 3713C 8004951C BC0982A7 */  sh         $v0, 0x9BC($gp) /* Failed to symbolize address 0x000009BC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37140 80049520 8E0982A7 */  sh         $v0, 0x98E($gp) /* Failed to symbolize address 0x0000098E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37144 80049524 6C250108 */  j          .L800495B0
/* 37148 80049528 00141100 */   sll       $v0, $s1, 16
.L8004952C:
/* 3714C 8004952C 0E058297 */  lhu        $v0, 0x50E($gp) /* Failed to symbolize address 0x0000050E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37150 80049530 00000000 */  nop
/* 37154 80049534 0200422C */  sltiu      $v0, $v0, 0x2
/* 37158 80049538 0F004014 */  bnez       $v0, .L80049578
/* 3715C 8004953C 21300000 */   addu      $a2, $zero, $zero
/* 37160 80049540 0980023C */  lui        $v0, %hi(D_8008D8AC)
/* 37164 80049544 ACD8428C */  lw         $v0, %lo(D_8008D8AC)($v0)
/* 37168 80049548 00000000 */  nop
/* 3716C 8004954C 8016422C */  sltiu      $v0, $v0, 0x1680
/* 37170 80049550 0A004010 */  beqz       $v0, .L8004957C
/* 37174 80049554 00000000 */   nop
/* 37178 80049558 BC098287 */  lh         $v0, 0x9BC($gp) /* Failed to symbolize address 0x000009BC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 3717C 8004955C 00000000 */  nop
/* 37180 80049560 06004014 */  bnez       $v0, .L8004957C
/* 37184 80049564 01000224 */   addiu     $v0, $zero, 0x1
/* 37188 80049568 0C0A8387 */  lh         $v1, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 3718C 8004956C 00000000 */  nop
/* 37190 80049570 02006214 */  bne        $v1, $v0, .L8004957C
/* 37194 80049574 00000000 */   nop
.L80049578:
/* 37198 80049578 01000624 */  addiu      $a2, $zero, 0x1
.L8004957C:
/* 3719C 8004957C 0E058297 */  lhu        $v0, 0x50E($gp) /* Failed to symbolize address 0x0000050E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 371A0 80049580 00000000 */  nop
/* 371A4 80049584 0200422C */  sltiu      $v0, $v0, 0x2
/* 371A8 80049588 02004010 */  beqz       $v0, .L80049594
/* 371AC 8004958C 21208002 */   addu      $a0, $s4, $zero
/* 371B0 80049590 0200C634 */  ori        $a2, $a2, 0x2
.L80049594:
/* 371B4 80049594 04000524 */  addiu      $a1, $zero, 0x4
/* 371B8 80049598 00340600 */  sll        $a2, $a2, 16
/* 371BC 8004959C 03340600 */  sra        $a2, $a2, 16
.L800495A0:
/* 371C0 800495A0 C323010C */  jal        SelectProfile_InputLogic
/* 371C4 800495A4 00000000 */   nop
/* 371C8 800495A8 21884000 */  addu       $s1, $v0, $zero
.L800495AC:
/* 371CC 800495AC 00141100 */  sll        $v0, $s1, 16
.L800495B0:
/* 371D0 800495B0 0C014010 */  beqz       $v0, .L800499E4
/* 371D4 800495B4 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 371D8 800495B8 1A008386 */  lh         $v1, 0x1A($s4)
/* 371DC 800495BC 00000000 */  nop
/* 371E0 800495C0 05006214 */  bne        $v1, $v0, .L800495D8
/* 371E4 800495C4 01000424 */   addiu     $a0, $zero, 0x1
/* 371E8 800495C8 8E0984A7 */  sh         $a0, 0x98E($gp) /* Failed to symbolize address 0x0000098E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 371EC 800495CC 900984A7 */  sh         $a0, 0x990($gp) /* Failed to symbolize address 0x00000990 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 371F0 800495D0 79260108 */  j          .L800499E4
/* 371F4 800495D4 00000000 */   nop
.L800495D8:
/* 371F8 800495D8 0E058287 */  lh         $v0, 0x50E($gp) /* Failed to symbolize address 0x0000050E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 371FC 800495DC 00000000 */  nop
/* 37200 800495E0 10004014 */  bnez       $v0, .L80049624
/* 37204 800495E4 01000224 */   addiu     $v0, $zero, 0x1
/* 37208 800495E8 0C0A8387 */  lh         $v1, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 3720C 800495EC 00000000 */  nop
/* 37210 800495F0 05006214 */  bne        $v1, $v0, .L80049608
/* 37214 800495F4 21200000 */   addu      $a0, $zero, $zero
/* 37218 800495F8 8E0983A7 */  sh         $v1, 0x98E($gp) /* Failed to symbolize address 0x0000098E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 3721C 800495FC 920983A7 */  sh         $v1, 0x992($gp) /* Failed to symbolize address 0x00000992 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37220 80049600 89250108 */  j          .L80049624
/* 37224 80049604 00000000 */   nop
.L80049608:
/* 37228 80049608 06006014 */  bnez       $v1, .L80049624
/* 3722C 8004960C 30000224 */   addiu     $v0, $zero, 0x30
/* 37230 80049610 8C098387 */  lh         $v1, 0x98C($gp) /* Failed to symbolize address 0x0000098C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37234 80049614 00000000 */  nop
/* 37238 80049618 06006214 */  bne        $v1, $v0, .L80049634
/* 3723C 8004961C 00000000 */   nop
/* 37240 80049620 01000424 */  addiu      $a0, $zero, 0x1
.L80049624:
/* 37244 80049624 8C098387 */  lh         $v1, 0x98C($gp) /* Failed to symbolize address 0x0000098C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37248 80049628 30000224 */  addiu      $v0, $zero, 0x30
/* 3724C 8004962C 15006210 */  beq        $v1, $v0, .L80049684
/* 37250 80049630 21108000 */   addu      $v0, $a0, $zero
.L80049634:
/* 37254 80049634 0E058287 */  lh         $v0, 0x50E($gp) /* Failed to symbolize address 0x0000050E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37258 80049638 01000324 */  addiu      $v1, $zero, 0x1
/* 3725C 8004963C 11004310 */  beq        $v0, $v1, .L80049684
/* 37260 80049640 21108000 */   addu      $v0, $a0, $zero
/* 37264 80049644 0980023C */  lui        $v0, %hi(D_8008D8AC)
/* 37268 80049648 ACD8428C */  lw         $v0, %lo(D_8008D8AC)($v0)
/* 3726C 8004964C 00000000 */  nop
/* 37270 80049650 8016422C */  sltiu      $v0, $v0, 0x1680
/* 37274 80049654 0B004010 */  beqz       $v0, .L80049684
/* 37278 80049658 21108000 */   addu      $v0, $a0, $zero
/* 3727C 8004965C BC098287 */  lh         $v0, 0x9BC($gp) /* Failed to symbolize address 0x000009BC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37280 80049660 00000000 */  nop
/* 37284 80049664 07004014 */  bnez       $v0, .L80049684
/* 37288 80049668 21108000 */   addu      $v0, $a0, $zero
/* 3728C 8004966C 0C0A8287 */  lh         $v0, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37290 80049670 00000000 */  nop
/* 37294 80049674 03004314 */  bne        $v0, $v1, .L80049684
/* 37298 80049678 21108000 */   addu      $v0, $a0, $zero
/* 3729C 8004967C 21200000 */  addu       $a0, $zero, $zero
/* 372A0 80049680 21108000 */  addu       $v0, $a0, $zero
.L80049684:
/* 372A4 80049684 D7004010 */  beqz       $v0, .L800499E4
/* 372A8 80049688 01001024 */   addiu     $s0, $zero, 0x1
/* 372AC 8004968C 0E058487 */  lh         $a0, 0x50E($gp) /* Failed to symbolize address 0x0000050E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 372B0 80049690 00000000 */  nop
/* 372B4 80049694 05009014 */  bne        $a0, $s0, .L800496AC
/* 372B8 80049698 00000000 */   nop
/* 372BC 8004969C 661C010C */  jal        RefreshCard_StartMemcardAction
/* 372C0 800496A0 07000424 */   addiu     $a0, $zero, 0x7
/* 372C4 800496A4 79260108 */  j          .L800499E4
/* 372C8 800496A8 00000000 */   nop
.L800496AC:
/* 372CC 800496AC F0098287 */  lh         $v0, 0x9F0($gp) /* Failed to symbolize address 0x000009F0 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 372D0 800496B0 00000000 */  nop
/* 372D4 800496B4 05004014 */  bnez       $v0, .L800496CC
/* 372D8 800496B8 00000000 */   nop
/* 372DC 800496BC BC098287 */  lh         $v0, 0x9BC($gp) /* Failed to symbolize address 0x000009BC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 372E0 800496C0 00000000 */  nop
/* 372E4 800496C4 C7004010 */  beqz       $v0, .L800499E4
/* 372E8 800496C8 00000000 */   nop
.L800496CC:
/* 372EC 800496CC 0C0A8387 */  lh         $v1, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 372F0 800496D0 00000000 */  nop
/* 372F4 800496D4 79007010 */  beq        $v1, $s0, .L800498BC
/* 372F8 800496D8 02006228 */   slti      $v0, $v1, 0x2
/* 372FC 800496DC 05004010 */  beqz       $v0, .L800496F4
/* 37300 800496E0 02000224 */   addiu     $v0, $zero, 0x2
/* 37304 800496E4 07006010 */  beqz       $v1, .L80049704
/* 37308 800496E8 30000224 */   addiu     $v0, $zero, 0x30
/* 3730C 800496EC 79260108 */  j          .L800499E4
/* 37310 800496F0 00000000 */   nop
.L800496F4:
/* 37314 800496F4 A3006210 */  beq        $v1, $v0, .L80049984
/* 37318 800496F8 30000224 */   addiu     $v0, $zero, 0x30
/* 3731C 800496FC 79260108 */  j          .L800499E4
/* 37320 80049700 00000000 */   nop
.L80049704:
/* 37324 80049704 8C098387 */  lh         $v1, 0x98C($gp) /* Failed to symbolize address 0x0000098C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37328 80049708 00000000 */  nop
/* 3732C 8004970C 24006214 */  bne        $v1, $v0, .L800497A0
/* 37330 80049710 07000224 */   addiu     $v0, $zero, 0x7
/* 37334 80049714 00141E00 */  sll        $v0, $fp, 16
/* 37338 80049718 03140200 */  sra        $v0, $v0, 16
/* 3733C 8004971C FFFF4224 */  addiu      $v0, $v0, -0x1
/* 37340 80049720 1A008386 */  lh         $v1, 0x1A($s4)
/* 37344 80049724 1A008596 */  lhu        $a1, 0x1A($s4)
/* 37348 80049728 2A106200 */  slt        $v0, $v1, $v0
/* 3734C 8004972C 0A004014 */  bnez       $v0, .L80049758
/* 37350 80049730 0A80023C */   lui       $v0, %hi(D_8009AA30)
/* 37354 80049734 21280000 */  addu       $a1, $zero, $zero
/* 37358 80049738 0980043C */  lui        $a0, %hi(D_8008D754)
/* 3735C 8004973C 54D7848C */  lw         $a0, %lo(D_8008D754)($a0)
/* 37360 80049740 8E0990A7 */  sh         $s0, 0x98E($gp) /* Failed to symbolize address 0x0000098E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37364 80049744 920990A7 */  sh         $s0, 0x992($gp) /* Failed to symbolize address 0x00000992 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37368 80049748 2FC6010C */  jal        memset
/* 3736C 8004974C 28000624 */   addiu     $a2, $zero, 0x28
/* 37370 80049750 79260108 */  j          .L800499E4
/* 37374 80049754 00000000 */   nop
.L80049758:
/* 37378 80049758 30AA4624 */  addiu      $a2, $v0, %lo(D_8009AA30)
/* 3737C 8004975C 40100300 */  sll        $v0, $v1, 1
/* 37380 80049760 21104300 */  addu       $v0, $v0, $v1
/* 37384 80049764 80100200 */  sll        $v0, $v0, 2
/* 37388 80049768 21104300 */  addu       $v0, $v0, $v1
/* 3738C 8004976C 80100200 */  sll        $v0, $v0, 2
/* 37390 80049770 21104600 */  addu       $v0, $v0, $a2
/* 37394 80049774 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 37398 80049778 ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 3739C 8004977C 58004484 */  lh         $a0, 0x58($v0)
/* 373A0 80049780 B01E628C */  lw         $v0, 0x1EB0($v1)
/* 373A4 80049784 00000000 */  nop
/* 373A8 80049788 48008214 */  bne        $a0, $v0, .L800498AC
/* 373AC 8004978C 05000424 */   addiu     $a0, $zero, 0x5
/* 373B0 80049790 661C010C */  jal        RefreshCard_StartMemcardAction
/* 373B4 80049794 2A00C5A4 */   sh        $a1, 0x2A($a2)
/* 373B8 80049798 78260108 */  j          .L800499E0
/* 373BC 8004979C 00000000 */   nop
.L800497A0:
/* 373C0 800497A0 05008214 */  bne        $a0, $v0, .L800497B8
/* 373C4 800497A4 00000000 */   nop
/* 373C8 800497A8 8E0990A7 */  sh         $s0, 0x98E($gp) /* Failed to symbolize address 0x0000098E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 373CC 800497AC 900990A7 */  sh         $s0, 0x990($gp) /* Failed to symbolize address 0x00000990 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 373D0 800497B0 79260108 */  j          .L800499E4
/* 373D4 800497B4 00000000 */   nop
.L800497B8:
/* 373D8 800497B8 1A008286 */  lh         $v0, 0x1A($s4)
/* 373DC 800497BC 0805848F */  lw         $a0, 0x508($gp) /* Failed to symbolize address 0x00000508 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 373E0 800497C0 80180200 */  sll        $v1, $v0, 2
/* 373E4 800497C4 21186200 */  addu       $v1, $v1, $v0
/* 373E8 800497C8 00190300 */  sll        $v1, $v1, 4
/* 373EC 800497CC 21188300 */  addu       $v1, $a0, $v1
/* 373F0 800497D0 2E006284 */  lh         $v0, 0x2E($v1)
/* 373F4 800497D4 00000000 */  nop
/* 373F8 800497D8 33004004 */  bltz       $v0, .L800498A8
/* 373FC 800497DC 44018424 */   addiu     $a0, $a0, 0x144
/* 37400 800497E0 0980053C */  lui        $a1, %hi(D_8008E6E8)
/* 37404 800497E4 5F9B000C */  jal        DECOMP_GAMEPROG_SyncGameAndCard
/* 37408 800497E8 E8E6A524 */   addiu     $a1, $a1, %lo(D_8008E6E8)
/* 3740C 800497EC 0980023C */  lui        $v0, %hi(D_8008FBA4)
/* 37410 800497F0 1A008386 */  lh         $v1, 0x1A($s4)
/* 37414 800497F4 A4FB4424 */  addiu      $a0, $v0, %lo(D_8008FBA4)
/* 37418 800497F8 80100300 */  sll        $v0, $v1, 2
/* 3741C 800497FC 21104300 */  addu       $v0, $v0, $v1
/* 37420 80049800 0805838F */  lw         $v1, 0x508($gp) /* Failed to symbolize address 0x00000508 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37424 80049804 00110200 */  sll        $v0, $v0, 4
/* 37428 80049808 21104300 */  addu       $v0, $v0, $v1
/* 3742C 8004980C 04004324 */  addiu      $v1, $v0, 0x4
/* 37430 80049810 54004224 */  addiu      $v0, $v0, 0x54
.L80049814:
/* 37434 80049814 00006C8C */  lw         $t4, 0x0($v1)
/* 37438 80049818 0400698C */  lw         $t1, 0x4($v1)
/* 3743C 8004981C 08006A8C */  lw         $t2, 0x8($v1)
/* 37440 80049820 0C006B8C */  lw         $t3, 0xC($v1)
/* 37444 80049824 00008CAC */  sw         $t4, 0x0($a0)
/* 37448 80049828 040089AC */  sw         $t1, 0x4($a0)
/* 3744C 8004982C 08008AAC */  sw         $t2, 0x8($a0)
/* 37450 80049830 0C008BAC */  sw         $t3, 0xC($a0)
/* 37454 80049834 10006324 */  addiu      $v1, $v1, 0x10
/* 37458 80049838 F6FF6214 */  bne        $v1, $v0, .L80049814
/* 3745C 8004983C 10008424 */   addiu     $a0, $a0, 0x10
/* 37460 80049840 0980033C */  lui        $v1, %hi(D_8008FBA4)
/* 37464 80049844 A4FB6324 */  addiu      $v1, $v1, %lo(D_8008FBA4)
/* 37468 80049848 2A006494 */  lhu        $a0, 0x2A($v1)
/* 3746C 8004984C 0980053C */  lui        $a1, %hi(D_8008D2AC)
/* 37470 80049850 ACD2A58C */  lw         $a1, %lo(D_8008D2AC)($a1)
/* 37474 80049854 0880023C */  lui        $v0, %hi(D_80086E84)
/* 37478 80049858 846E44A4 */  sh         $a0, %lo(D_80086E84)($v0)
/* 3747C 8004985C 18006C8C */  lw         $t4, 0x18($v1)
/* 37480 80049860 1C00698C */  lw         $t1, 0x1C($v1)
/* 37484 80049864 20006A8C */  lw         $t2, 0x20($v1)
/* 37488 80049868 24006B8C */  lw         $t3, 0x24($v1)
/* 3748C 8004986C 541DACAC */  sw         $t4, 0x1D54($a1)
/* 37490 80049870 581DA9AC */  sw         $t1, 0x1D58($a1)
/* 37494 80049874 5C1DAAAC */  sw         $t2, 0x1D5C($a1)
/* 37498 80049878 601DABAC */  sw         $t3, 0x1D60($a1)
/* 3749C 8004987C 28006C80 */  lb         $t4, 0x28($v1)
/* 374A0 80049880 00000000 */  nop
/* 374A4 80049884 641DACA0 */  sb         $t4, 0x1D64($a1)
/* 374A8 80049888 1A008396 */  lhu        $v1, 0x1A($s4)
/* 374AC 8004988C 01000224 */  addiu      $v0, $zero, 0x1
/* 374B0 80049890 8E0982A7 */  sh         $v0, 0x98E($gp) /* Failed to symbolize address 0x0000098E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 374B4 80049894 920982A7 */  sh         $v0, 0x992($gp) /* Failed to symbolize address 0x00000992 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 374B8 80049898 0980013C */  lui        $at, %hi(D_8008D73C)
/* 374BC 8004989C 3CD723A4 */  sh         $v1, %lo(D_8008D73C)($at)
/* 374C0 800498A0 79260108 */  j          .L800499E4
/* 374C4 800498A4 00000000 */   nop
.L800498A8:
/* 374C8 800498A8 05000424 */  addiu      $a0, $zero, 0x5
.L800498AC:
/* 374CC 800498AC 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 374D0 800498B0 01000524 */   addiu     $a1, $zero, 0x1
/* 374D4 800498B4 79260108 */  j          .L800499E4
/* 374D8 800498B8 00000000 */   nop
.L800498BC:
/* 374DC 800498BC 8C098387 */  lh         $v1, 0x98C($gp) /* Failed to symbolize address 0x0000098C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 374E0 800498C0 30000224 */  addiu      $v0, $zero, 0x30
/* 374E4 800498C4 0F006214 */  bne        $v1, $v0, .L80049904
/* 374E8 800498C8 0A80023C */   lui       $v0, %hi(D_8009AA30)
/* 374EC 800498CC 30AA4424 */  addiu      $a0, $v0, %lo(D_8009AA30)
/* 374F0 800498D0 1A008286 */  lh         $v0, 0x1A($s4)
/* 374F4 800498D4 2C008384 */  lh         $v1, 0x2C($a0)
/* 374F8 800498D8 00000000 */  nop
/* 374FC 800498DC 2A104300 */  slt        $v0, $v0, $v1
/* 37500 800498E0 1A008396 */  lhu        $v1, 0x1A($s4)
/* 37504 800498E4 1E004010 */  beqz       $v0, .L80049960
/* 37508 800498E8 0880023C */   lui       $v0, %hi(D_80085D4A)
/* 3750C 800498EC 260083A4 */  sh         $v1, 0x26($a0)
/* 37510 800498F0 4A5D50A4 */  sh         $s0, %lo(D_80085D4A)($v0)
/* 37514 800498F4 0880023C */  lui        $v0, %hi(D_80085D76)
/* 37518 800498F8 940990A7 */  sh         $s0, 0x994($gp) /* Failed to symbolize address 0x00000994 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 3751C 800498FC 79260108 */  j          .L800499E4
/* 37520 80049900 765D50A4 */   sh        $s0, %lo(D_80085D76)($v0)
.L80049904:
/* 37524 80049904 96098287 */  lh         $v0, 0x996($gp) /* Failed to symbolize address 0x00000996 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37528 80049908 00000000 */  nop
/* 3752C 8004990C 06004014 */  bnez       $v0, .L80049928
/* 37530 80049910 07000224 */   addiu     $v0, $zero, 0x7
/* 37534 80049914 04008214 */  bne        $a0, $v0, .L80049928
/* 37538 80049918 00000000 */   nop
/* 3753C 8004991C 960990A7 */  sh         $s0, 0x996($gp) /* Failed to symbolize address 0x00000996 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37540 80049920 79260108 */  j          .L800499E4
/* 37544 80049924 00000000 */   nop
.L80049928:
/* 37548 80049928 1A008486 */  lh         $a0, 0x1A($s4)
/* 3754C 8004992C 0805838F */  lw         $v1, 0x508($gp) /* Failed to symbolize address 0x00000508 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37550 80049930 80100400 */  sll        $v0, $a0, 2
/* 37554 80049934 21104400 */  addu       $v0, $v0, $a0
/* 37558 80049938 00110200 */  sll        $v0, $v0, 4
/* 3755C 8004993C 21186200 */  addu       $v1, $v1, $v0
/* 37560 80049940 2E006284 */  lh         $v0, 0x2E($v1)
/* 37564 80049944 00000000 */  nop
/* 37568 80049948 05004004 */  bltz       $v0, .L80049960
/* 3756C 8004994C 00000000 */   nop
/* 37570 80049950 000A8287 */  lh         $v0, 0xA00($gp) /* Failed to symbolize address 0x00000A00 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37574 80049954 00000000 */  nop
/* 37578 80049958 03008214 */  bne        $a0, $v0, .L80049968
/* 3757C 8004995C 0880023C */   lui       $v0, %hi(D_80085D4A)
.L80049960:
/* 37580 80049960 79260108 */  j          .L800499E4
/* 37584 80049964 01001224 */   addiu     $s2, $zero, 0x1
.L80049968:
/* 37588 80049968 01000324 */  addiu      $v1, $zero, 0x1
/* 3758C 8004996C 4A5D43A4 */  sh         $v1, %lo(D_80085D4A)($v0)
/* 37590 80049970 0880023C */  lui        $v0, %hi(D_80085D76)
/* 37594 80049974 765D43A4 */  sh         $v1, %lo(D_80085D76)($v0)
/* 37598 80049978 940983A7 */  sh         $v1, 0x994($gp) /* Failed to symbolize address 0x00000994 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 3759C 8004997C 79260108 */  j          .L800499E4
/* 375A0 80049980 00000000 */   nop
.L80049984:
/* 375A4 80049984 8C098387 */  lh         $v1, 0x98C($gp) /* Failed to symbolize address 0x0000098C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 375A8 80049988 00000000 */  nop
/* 375AC 8004998C 15006210 */  beq        $v1, $v0, .L800499E4
/* 375B0 80049990 00000000 */   nop
/* 375B4 80049994 1A008386 */  lh         $v1, 0x1A($s4)
/* 375B8 80049998 00000000 */  nop
/* 375BC 8004999C 80100300 */  sll        $v0, $v1, 2
/* 375C0 800499A0 21104300 */  addu       $v0, $v0, $v1
/* 375C4 800499A4 0805838F */  lw         $v1, 0x508($gp) /* Failed to symbolize address 0x00000508 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 375C8 800499A8 00210200 */  sll        $a0, $v0, 4
/* 375CC 800499AC 21106400 */  addu       $v0, $v1, $a0
/* 375D0 800499B0 2E004284 */  lh         $v0, 0x2E($v0)
/* 375D4 800499B4 00000000 */  nop
/* 375D8 800499B8 0A004004 */  bltz       $v0, .L800499E4
/* 375DC 800499BC 00000000 */   nop
/* 375E0 800499C0 04008424 */  addiu      $a0, $a0, 0x4
/* 375E4 800499C4 2E9B000C */  jal        DECOMP_GAMEPROG_NewProfile_InsideAdv
/* 375E8 800499C8 21206400 */   addu      $a0, $v1, $a0
/* 375EC 800499CC 39F5000C */  jal        DECOMP_MEMCARD_SetIcon
/* 375F0 800499D0 21200000 */   addu      $a0, $zero, $zero
/* 375F4 800499D4 661C010C */  jal        RefreshCard_StartMemcardAction
/* 375F8 800499D8 03000424 */   addiu     $a0, $zero, 0x3
/* 375FC 800499DC BC0990A7 */  sh         $s0, 0x9BC($gp) /* Failed to symbolize address 0x000009BC for %gp_rel. Make sure this address is within the recognized valid address space */
.L800499E0:
/* 37600 800499E0 8E0990A7 */  sh         $s0, 0x98E($gp) /* Failed to symbolize address 0x0000098E for %gp_rel. Make sure this address is within the recognized valid address space */
.L800499E4:
/* 37604 800499E4 0E058387 */  lh         $v1, 0x50E($gp) /* Failed to symbolize address 0x0000050E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37608 800499E8 07000224 */  addiu      $v0, $zero, 0x7
/* 3760C 800499EC 0B006214 */  bne        $v1, $v0, .L80049A1C
/* 37610 800499F0 21104002 */   addu      $v0, $s2, $zero
/* 37614 800499F4 90098287 */  lh         $v0, 0x990($gp) /* Failed to symbolize address 0x00000990 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37618 800499F8 00000000 */  nop
/* 3761C 800499FC 07004014 */  bnez       $v0, .L80049A1C
/* 37620 80049A00 21104002 */   addu      $v0, $s2, $zero
/* 37624 80049A04 92098287 */  lh         $v0, 0x992($gp) /* Failed to symbolize address 0x00000992 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37628 80049A08 00000000 */  nop
/* 3762C 80049A0C 03004014 */  bnez       $v0, .L80049A1C
/* 37630 80049A10 21104002 */   addu      $v0, $s2, $zero
/* 37634 80049A14 8E0980A7 */  sh         $zero, 0x98E($gp) /* Failed to symbolize address 0x0000098E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37638 80049A18 940980A7 */  sh         $zero, 0x994($gp) /* Failed to symbolize address 0x00000994 for %gp_rel. Make sure this address is within the recognized valid address space */
.L80049A1C:
/* 3763C 80049A1C 6F004010 */  beqz       $v0, .L80049BDC
/* 37640 80049A20 30000224 */   addiu     $v0, $zero, 0x30
/* 37644 80049A24 8C098387 */  lh         $v1, 0x98C($gp) /* Failed to symbolize address 0x0000098C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37648 80049A28 960980A7 */  sh         $zero, 0x996($gp) /* Failed to symbolize address 0x00000996 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 3764C 80049A2C 2B006214 */  bne        $v1, $v0, .L80049ADC
/* 37650 80049A30 0800073C */   lui       $a3, (0x8CA00 >> 16)
/* 37654 80049A34 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 37658 80049A38 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 3765C 80049A3C 00000000 */  nop
/* 37660 80049A40 EC24438C */  lw         $v1, 0x24EC($v0)
/* 37664 80049A44 00000000 */  nop
/* 37668 80049A48 02006010 */  beqz       $v1, .L80049A54
/* 3766C 80049A4C 00CAE734 */   ori       $a3, $a3, (0x8CA00 & 0xFFFF)
/* 37670 80049A50 1405678C */  lw         $a3, 0x514($v1)
.L80049A54:
/* 37674 80049A54 1A008486 */  lh         $a0, 0x1A($s4)
/* 37678 80049A58 101A4684 */  lh         $a2, 0x1A10($v0)
/* 3767C 80049A5C 541D4224 */  addiu      $v0, $v0, 0x1D54
/* 37680 80049A60 1000A2AF */  sw         $v0, 0x10($sp)
/* 37684 80049A64 0880023C */  lui        $v0, %hi(D_80086E84)
/* 37688 80049A68 846E4584 */  lh         $a1, %lo(D_80086E84)($v0)
/* 3768C 80049A6C 0C1B010C */  jal        RefreshCard_GhostEncodeProfile
/* 37690 80049A70 00000000 */   nop
/* 37694 80049A74 0A80023C */  lui        $v0, %hi(D_8009AA30)
/* 37698 80049A78 1A008396 */  lhu        $v1, 0x1A($s4)
/* 3769C 80049A7C 30AA4624 */  addiu      $a2, $v0, %lo(D_8009AA30)
/* 376A0 80049A80 2800C3A4 */  sh         $v1, 0x28($a2)
/* 376A4 80049A84 1A008286 */  lh         $v0, 0x1A($s4)
/* 376A8 80049A88 2C00C384 */  lh         $v1, 0x2C($a2)
/* 376AC 80049A8C 00000000 */  nop
/* 376B0 80049A90 2A104300 */  slt        $v0, $v0, $v1
/* 376B4 80049A94 1A008396 */  lhu        $v1, 0x1A($s4)
/* 376B8 80049A98 02004010 */  beqz       $v0, .L80049AA4
/* 376BC 80049A9C FFFF0524 */   addiu     $a1, $zero, -0x1
/* 376C0 80049AA0 21286000 */  addu       $a1, $v1, $zero
.L80049AA4:
/* 376C4 80049AA4 01000424 */  addiu      $a0, $zero, 0x1
/* 376C8 80049AA8 39F5000C */  jal        DECOMP_MEMCARD_SetIcon
/* 376CC 80049AAC 2600C5A4 */   sh        $a1, 0x26($a2)
/* 376D0 80049AB0 661C010C */  jal        RefreshCard_StartMemcardAction
/* 376D4 80049AB4 06000424 */   addiu     $a0, $zero, 0x6
/* 376D8 80049AB8 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 376DC 80049ABC ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 376E0 80049AC0 00000000 */  nop
/* 376E4 80049AC4 441D438C */  lw         $v1, 0x1D44($v0)
/* 376E8 80049AC8 01000424 */  addiu      $a0, $zero, 0x1
/* 376EC 80049ACC 8E0984A7 */  sh         $a0, 0x98E($gp) /* Failed to symbolize address 0x0000098E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 376F0 80049AD0 01006334 */  ori        $v1, $v1, 0x1
/* 376F4 80049AD4 F5260108 */  j          .L80049BD4
/* 376F8 80049AD8 441D43AC */   sw        $v1, 0x1D44($v0)
.L80049ADC:
/* 376FC 80049ADC 1A008296 */  lhu        $v0, 0x1A($s4)
/* 37700 80049AE0 0980013C */  lui        $at, %hi(D_8008D73C)
/* 37704 80049AE4 3CD722A4 */  sh         $v0, %lo(D_8008D73C)($at)
/* 37708 80049AE8 490F010C */  jal        RaceConfig_SaveGameOptions
/* 3770C 80049AEC 00000000 */   nop
/* 37710 80049AF0 3D9B000C */  jal        DECOMP_GAMEPROG_SaveCupProgress
/* 37714 80049AF4 00000000 */   nop
/* 37718 80049AF8 0980053C */  lui        $a1, %hi(D_8008E6E8)
/* 3771C 80049AFC 0805848F */  lw         $a0, 0x508($gp) /* Failed to symbolize address 0x00000508 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37720 80049B00 E8E6A524 */  addiu      $a1, $a1, %lo(D_8008E6E8)
/* 37724 80049B04 5F9B000C */  jal        DECOMP_GAMEPROG_SyncGameAndCard
/* 37728 80049B08 44018424 */   addiu     $a0, $a0, 0x144
/* 3772C 80049B0C 0980023C */  lui        $v0, %hi(D_8008FBA4)
/* 37730 80049B10 A4FB4424 */  addiu      $a0, $v0, %lo(D_8008FBA4)
/* 37734 80049B14 1A008386 */  lh         $v1, 0x1A($s4)
/* 37738 80049B18 50008524 */  addiu      $a1, $a0, 0x50
/* 3773C 80049B1C 80100300 */  sll        $v0, $v1, 2
/* 37740 80049B20 21104300 */  addu       $v0, $v0, $v1
/* 37744 80049B24 0805838F */  lw         $v1, 0x508($gp) /* Failed to symbolize address 0x00000508 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37748 80049B28 00110200 */  sll        $v0, $v0, 4
/* 3774C 80049B2C 21104300 */  addu       $v0, $v0, $v1
/* 37750 80049B30 04004224 */  addiu      $v0, $v0, 0x4
.L80049B34:
/* 37754 80049B34 00008C8C */  lw         $t4, 0x0($a0)
/* 37758 80049B38 0400898C */  lw         $t1, 0x4($a0)
/* 3775C 80049B3C 08008A8C */  lw         $t2, 0x8($a0)
/* 37760 80049B40 0C008B8C */  lw         $t3, 0xC($a0)
/* 37764 80049B44 00004CAC */  sw         $t4, 0x0($v0)
/* 37768 80049B48 040049AC */  sw         $t1, 0x4($v0)
/* 3776C 80049B4C 08004AAC */  sw         $t2, 0x8($v0)
/* 37770 80049B50 0C004BAC */  sw         $t3, 0xC($v0)
/* 37774 80049B54 10008424 */  addiu      $a0, $a0, 0x10
/* 37778 80049B58 F6FF8514 */  bne        $a0, $a1, .L80049B34
/* 3777C 80049B5C 10004224 */   addiu     $v0, $v0, 0x10
/* 37780 80049B60 0980023C */  lui        $v0, %hi(D_8008E6E8)
/* 37784 80049B64 E8E64324 */  addiu      $v1, $v0, %lo(D_8008E6E8)
/* 37788 80049B68 0805828F */  lw         $v0, 0x508($gp) /* Failed to symbolize address 0x00000508 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 3778C 80049B6C B0146424 */  addiu      $a0, $v1, 0x14B0
/* 37790 80049B70 44014224 */  addiu      $v0, $v0, 0x144
.L80049B74:
/* 37794 80049B74 00006C8C */  lw         $t4, 0x0($v1)
/* 37798 80049B78 0400698C */  lw         $t1, 0x4($v1)
/* 3779C 80049B7C 08006A8C */  lw         $t2, 0x8($v1)
/* 377A0 80049B80 0C006B8C */  lw         $t3, 0xC($v1)
/* 377A4 80049B84 00004CAC */  sw         $t4, 0x0($v0)
/* 377A8 80049B88 040049AC */  sw         $t1, 0x4($v0)
/* 377AC 80049B8C 08004AAC */  sw         $t2, 0x8($v0)
/* 377B0 80049B90 0C004BAC */  sw         $t3, 0xC($v0)
/* 377B4 80049B94 10006324 */  addiu      $v1, $v1, 0x10
/* 377B8 80049B98 F6FF6414 */  bne        $v1, $a0, .L80049B74
/* 377BC 80049B9C 10004224 */   addiu     $v0, $v0, 0x10
/* 377C0 80049BA0 21200000 */  addu       $a0, $zero, $zero
/* 377C4 80049BA4 00006C8C */  lw         $t4, 0x0($v1)
/* 377C8 80049BA8 0400698C */  lw         $t1, 0x4($v1)
/* 377CC 80049BAC 08006A8C */  lw         $t2, 0x8($v1)
/* 377D0 80049BB0 00004CAC */  sw         $t4, 0x0($v0)
/* 377D4 80049BB4 040049AC */  sw         $t1, 0x4($v0)
/* 377D8 80049BB8 39F5000C */  jal        DECOMP_MEMCARD_SetIcon
/* 377DC 80049BBC 08004AAC */   sw        $t2, 0x8($v0)
/* 377E0 80049BC0 661C010C */  jal        RefreshCard_StartMemcardAction
/* 377E4 80049BC4 03000424 */   addiu     $a0, $zero, 0x3
/* 377E8 80049BC8 01000224 */  addiu      $v0, $zero, 0x1
/* 377EC 80049BCC BC0982A7 */  sh         $v0, 0x9BC($gp) /* Failed to symbolize address 0x000009BC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 377F0 80049BD0 8E0982A7 */  sh         $v0, 0x98E($gp) /* Failed to symbolize address 0x0000098E for %gp_rel. Make sure this address is within the recognized valid address space */
.L80049BD4:
/* 377F4 80049BD4 3C000224 */  addiu      $v0, $zero, 0x3C
/* 377F8 80049BD8 980982A7 */  sh         $v0, 0x998($gp) /* Failed to symbolize address 0x00000998 for %gp_rel. Make sure this address is within the recognized valid address space */
.L80049BDC:
/* 377FC 80049BDC 1E008386 */  lh         $v1, 0x1E($s4)
/* 37800 80049BE0 01000224 */  addiu      $v0, $zero, 0x1
/* 37804 80049BE4 92026214 */  bne        $v1, $v0, .L8004A630
/* 37808 80049BE8 00000000 */   nop
/* 3780C 80049BEC 8E098287 */  lh         $v0, 0x98E($gp) /* Failed to symbolize address 0x0000098E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37810 80049BF0 0E059197 */  lhu        $s1, 0x50E($gp) /* Failed to symbolize address 0x0000050E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37814 80049BF4 0E004014 */  bnez       $v0, .L80049C30
/* 37818 80049BF8 21800000 */   addu      $s0, $zero, $zero
/* 3781C 80049BFC F0098287 */  lh         $v0, 0x9F0($gp) /* Failed to symbolize address 0x000009F0 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37820 80049C00 00000000 */  nop
/* 37824 80049C04 0A004010 */  beqz       $v0, .L80049C30
/* 37828 80049C08 00000000 */   nop
/* 3782C 80049C0C BC098287 */  lh         $v0, 0x9BC($gp) /* Failed to symbolize address 0x000009BC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37830 80049C10 00000000 */  nop
/* 37834 80049C14 05004014 */  bnez       $v0, .L80049C2C
/* 37838 80049C18 00141100 */   sll       $v0, $s1, 16
/* 3783C 80049C1C 03140200 */  sra        $v0, $v0, 16
/* 37840 80049C20 08000324 */  addiu      $v1, $zero, 0x8
/* 37844 80049C24 02004314 */  bne        $v0, $v1, .L80049C30
/* 37848 80049C28 00000000 */   nop
.L80049C2C:
/* 3784C 80049C2C 01001024 */  addiu      $s0, $zero, 0x1
.L80049C30:
/* 37850 80049C30 0C0A8287 */  lh         $v0, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37854 80049C34 00000000 */  nop
/* 37858 80049C38 0E004014 */  bnez       $v0, .L80049C74
/* 3785C 80049C3C 30000224 */   addiu     $v0, $zero, 0x30
/* 37860 80049C40 8C098387 */  lh         $v1, 0x98C($gp) /* Failed to symbolize address 0x0000098C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37864 80049C44 00000000 */  nop
/* 37868 80049C48 0A006214 */  bne        $v1, $v0, .L80049C74
/* 3786C 80049C4C 00141100 */   sll       $v0, $s1, 16
/* 37870 80049C50 031C0200 */  sra        $v1, $v0, 16
/* 37874 80049C54 09000224 */  addiu      $v0, $zero, 0x9
/* 37878 80049C58 03006210 */  beq        $v1, $v0, .L80049C68
/* 3787C 80049C5C 00141E00 */   sll       $v0, $fp, 16
/* 37880 80049C60 04006014 */  bnez       $v1, .L80049C74
/* 37884 80049C64 00000000 */   nop
.L80049C68:
/* 37888 80049C68 02004010 */  beqz       $v0, .L80049C74
/* 3788C 80049C6C 00000000 */   nop
/* 37890 80049C70 01001024 */  addiu      $s0, $zero, 0x1
.L80049C74:
/* 37894 80049C74 0C0A8387 */  lh         $v1, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37898 80049C78 01000224 */  addiu      $v0, $zero, 0x1
/* 3789C 80049C7C 32006214 */  bne        $v1, $v0, .L80049D48
/* 378A0 80049C80 F8FF2226 */   addiu     $v0, $s1, -0x8
/* 378A4 80049C84 0200422C */  sltiu      $v0, $v0, 0x2
/* 378A8 80049C88 23004010 */  beqz       $v0, .L80049D18
/* 378AC 80049C8C 21104002 */   addu      $v0, $s2, $zero
/* 378B0 80049C90 03004010 */  beqz       $v0, .L80049CA0
/* 378B4 80049C94 21800000 */   addu      $s0, $zero, $zero
/* 378B8 80049C98 46270108 */  j          .L80049D18
/* 378BC 80049C9C 03001124 */   addiu     $s1, $zero, 0x3
.L80049CA0:
/* 378C0 80049CA0 8C098387 */  lh         $v1, 0x98C($gp) /* Failed to symbolize address 0x0000098C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 378C4 80049CA4 30000224 */  addiu      $v0, $zero, 0x30
/* 378C8 80049CA8 0E006214 */  bne        $v1, $v0, .L80049CE4
/* 378CC 80049CAC 00000000 */   nop
/* 378D0 80049CB0 0980023C */  lui        $v0, %hi(D_8008D8AC)
/* 378D4 80049CB4 ACD8428C */  lw         $v0, %lo(D_8008D8AC)($v0)
/* 378D8 80049CB8 00000000 */  nop
/* 378DC 80049CBC 003E4228 */  slti       $v0, $v0, 0x3E00
/* 378E0 80049CC0 14004010 */  beqz       $v0, .L80049D14
/* 378E4 80049CC4 01001024 */   addiu     $s0, $zero, 0x1
/* 378E8 80049CC8 3000AC97 */  lhu        $t4, 0x30($sp)
/* 378EC 80049CCC 00000000 */  nop
/* 378F0 80049CD0 10008015 */  bnez       $t4, .L80049D14
/* 378F4 80049CD4 00000000 */   nop
/* 378F8 80049CD8 21800000 */  addu       $s0, $zero, $zero
/* 378FC 80049CDC 45270108 */  j          .L80049D14
/* 37900 80049CE0 06001124 */   addiu     $s1, $zero, 0x6
.L80049CE4:
/* 37904 80049CE4 0980023C */  lui        $v0, %hi(D_8008D8AC)
/* 37908 80049CE8 ACD8428C */  lw         $v0, %lo(D_8008D8AC)($v0)
/* 3790C 80049CEC 00000000 */  nop
/* 37910 80049CF0 8016422C */  sltiu      $v0, $v0, 0x1680
/* 37914 80049CF4 07004010 */  beqz       $v0, .L80049D14
/* 37918 80049CF8 01001024 */   addiu     $s0, $zero, 0x1
/* 3791C 80049CFC BC098287 */  lh         $v0, 0x9BC($gp) /* Failed to symbolize address 0x000009BC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37920 80049D00 00000000 */  nop
/* 37924 80049D04 03004014 */  bnez       $v0, .L80049D14
/* 37928 80049D08 00000000 */   nop
/* 3792C 80049D0C 06001124 */  addiu      $s1, $zero, 0x6
/* 37930 80049D10 21800000 */  addu       $s0, $zero, $zero
.L80049D14:
/* 37934 80049D14 0C0A8387 */  lh         $v1, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
.L80049D18:
/* 37938 80049D18 01000224 */  addiu      $v0, $zero, 0x1
/* 3793C 80049D1C 0A006214 */  bne        $v1, $v0, .L80049D48
/* 37940 80049D20 00141100 */   sll       $v0, $s1, 16
/* 37944 80049D24 03140200 */  sra        $v0, $v0, 16
/* 37948 80049D28 07000324 */  addiu      $v1, $zero, 0x7
/* 3794C 80049D2C 06004314 */  bne        $v0, $v1, .L80049D48
/* 37950 80049D30 00000000 */   nop
/* 37954 80049D34 96098287 */  lh         $v0, 0x996($gp) /* Failed to symbolize address 0x00000996 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37958 80049D38 00000000 */  nop
/* 3795C 80049D3C 02004010 */  beqz       $v0, .L80049D48
/* 37960 80049D40 00000000 */   nop
/* 37964 80049D44 01001024 */  addiu      $s0, $zero, 0x1
.L80049D48:
/* 37968 80049D48 14008486 */  lh         $a0, 0x14($s4)
/* 3796C 80049D4C 7321010C */  jal        SelectProfile_Init
/* 37970 80049D50 00000000 */   nop
/* 37974 80049D54 21100002 */  addu       $v0, $s0, $zero
/* 37978 80049D58 76014010 */  beqz       $v0, .L8004A334
/* 3797C 80049D5C 00000000 */   nop
/* 37980 80049D60 8E098287 */  lh         $v0, 0x98E($gp) /* Failed to symbolize address 0x0000098E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37984 80049D64 00000000 */  nop
/* 37988 80049D68 73014014 */  bnez       $v0, .L8004A338
/* 3798C 80049D6C 00000000 */   nop
/* 37990 80049D70 8C098387 */  lh         $v1, 0x98C($gp) /* Failed to symbolize address 0x0000098C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37994 80049D74 30000224 */  addiu      $v0, $zero, 0x30
/* 37998 80049D78 8D006210 */  beq        $v1, $v0, .L80049FB0
/* 3799C 80049D7C 00000000 */   nop
/* 379A0 80049D80 94098287 */  lh         $v0, 0x994($gp) /* Failed to symbolize address 0x00000994 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 379A4 80049D84 00000000 */  nop
/* 379A8 80049D88 1C004010 */  beqz       $v0, .L80049DFC
/* 379AC 80049D8C 0880103C */   lui       $s0, %hi(D_80085D30)
/* 379B0 80049D90 305D1026 */  addiu      $s0, $s0, %lo(D_80085D30)
/* 379B4 80049D94 21200002 */  addu       $a0, $s0, $zero
/* 379B8 80049D98 2000A527 */  addiu      $a1, $sp, 0x20
/* 379BC 80049D9C 01000624 */  addiu      $a2, $zero, 0x1
/* 379C0 80049DA0 1417010C */  jal        DECOMP_RECTMENU_GetWidth
/* 379C4 80049DA4 2000A0A7 */   sh        $zero, 0x20($sp)
/* 379C8 80049DA8 21200002 */  addu       $a0, $s0, $zero
/* 379CC 80049DAC 21280000 */  addu       $a1, $zero, $zero
/* 379D0 80049DB0 2000A787 */  lh         $a3, 0x20($sp)
/* 379D4 80049DB4 6C17010C */  jal        DECOMP_RECTMENU_DrawSelf
/* 379D8 80049DB8 2130A000 */   addu      $a2, $a1, $zero
/* 379DC 80049DBC 92000524 */  addiu      $a1, $zero, 0x92
/* 379E0 80049DC0 3C000624 */  addiu      $a2, $zero, 0x3C
/* 379E4 80049DC4 1A008286 */  lh         $v0, 0x1A($s4)
/* 379E8 80049DC8 21380000 */  addu       $a3, $zero, $zero
/* 379EC 80049DCC 80200200 */  sll        $a0, $v0, 2
/* 379F0 80049DD0 21208200 */  addu       $a0, $a0, $v0
/* 379F4 80049DD4 00210400 */  sll        $a0, $a0, 4
/* 379F8 80049DD8 04008424 */  addiu      $a0, $a0, 0x4
/* 379FC 80049DDC 1000A2AF */  sw         $v0, 0x10($sp)
/* 37A00 80049DE0 0805828F */  lw         $v0, 0x508($gp) /* Failed to symbolize address 0x00000508 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37A04 80049DE4 14008386 */  lh         $v1, 0x14($s4)
/* 37A08 80049DE8 21204400 */  addu       $a0, $v0, $a0
/* 37A0C 80049DEC FE1F010C */  jal        SelectProfile_DrawAdvProfile
/* 37A10 80049DF0 1400A3AF */   sw        $v1, 0x14($sp)
/* 37A14 80049DF4 DA270108 */  j          .L80049F68
/* 37A18 80049DF8 00000000 */   nop
.L80049DFC:
/* 37A1C 80049DFC 0880033C */  lui        $v1, %hi(D_80085D88)
/* 37A20 80049E00 0C0A8287 */  lh         $v0, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37A24 80049E04 885D7224 */  addiu      $s2, $v1, %lo(D_80085D88)
/* 37A28 80049E08 80100200 */  sll        $v0, $v0, 2
/* 37A2C 80049E0C 21105200 */  addu       $v0, $v0, $s2
/* 37A30 80049E10 02004284 */  lh         $v0, 0x2($v0)
/* 37A34 80049E14 0980033C */  lui        $v1, %hi(D_8008D878)
/* 37A38 80049E18 78D8638C */  lw         $v1, %lo(D_8008D878)($v1)
/* 37A3C 80049E1C 80100200 */  sll        $v0, $v0, 2
/* 37A40 80049E20 21104300 */  addu       $v0, $v0, $v1
/* 37A44 80049E24 0000448C */  lw         $a0, 0x0($v0)
/* 37A48 80049E28 32DF010C */  jal        strlen
/* 37A4C 80049E2C 00000000 */   nop
/* 37A50 80049E30 00010524 */  addiu      $a1, $zero, 0x100
/* 37A54 80049E34 0100502C */  sltiu      $s0, $v0, 0x1
/* 37A58 80049E38 C0801000 */  sll        $s0, $s0, 3
/* 37A5C 80049E3C 00800324 */  addiu      $v1, $zero, -0x8000
/* 37A60 80049E40 0C0A8287 */  lh         $v0, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37A64 80049E44 2800A997 */  lhu        $t1, 0x28($sp)
/* 37A68 80049E48 80100200 */  sll        $v0, $v0, 2
/* 37A6C 80049E4C 21105200 */  addu       $v0, $v0, $s2
/* 37A70 80049E50 25882301 */  or         $s1, $t1, $v1
/* 37A74 80049E54 00004284 */  lh         $v0, 0x0($v0)
/* 37A78 80049E58 0980033C */  lui        $v1, %hi(D_8008D878)
/* 37A7C 80049E5C 78D8638C */  lw         $v1, %lo(D_8008D878)($v1)
/* 37A80 80049E60 12000636 */  ori        $a2, $s0, 0x12
/* 37A84 80049E64 1000B1AF */  sw         $s1, 0x10($sp)
/* 37A88 80049E68 80100200 */  sll        $v0, $v0, 2
/* 37A8C 80049E6C 21104300 */  addu       $v0, $v0, $v1
/* 37A90 80049E70 0000448C */  lw         $a0, 0x0($v0)
/* 37A94 80049E74 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 37A98 80049E78 01000724 */   addiu     $a3, $zero, 0x1
/* 37A9C 80049E7C 0E000016 */  bnez       $s0, .L80049EB8
/* 37AA0 80049E80 00010524 */   addiu     $a1, $zero, 0x100
/* 37AA4 80049E84 0C0A8287 */  lh         $v0, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37AA8 80049E88 0980033C */  lui        $v1, %hi(D_8008D878)
/* 37AAC 80049E8C 78D8638C */  lw         $v1, %lo(D_8008D878)($v1)
/* 37AB0 80049E90 80100200 */  sll        $v0, $v0, 2
/* 37AB4 80049E94 21105200 */  addu       $v0, $v0, $s2
/* 37AB8 80049E98 02004284 */  lh         $v0, 0x2($v0)
/* 37ABC 80049E9C 22000624 */  addiu      $a2, $zero, 0x22
/* 37AC0 80049EA0 1000B1AF */  sw         $s1, 0x10($sp)
/* 37AC4 80049EA4 80100200 */  sll        $v0, $v0, 2
/* 37AC8 80049EA8 21104300 */  addu       $v0, $v0, $v1
/* 37ACC 80049EAC 0000448C */  lw         $a0, 0x0($v0)
/* 37AD0 80049EB0 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 37AD4 80049EB4 01000724 */   addiu     $a3, $zero, 0x1
.L80049EB8:
/* 37AD8 80049EB8 21880000 */  addu       $s1, $zero, $zero
/* 37ADC 80049EBC 01002232 */  andi       $v0, $s1, 0x1
.L80049EC0:
/* 37AE0 80049EC0 C0280200 */  sll        $a1, $v0, 3
/* 37AE4 80049EC4 2328A200 */  subu       $a1, $a1, $v0
/* 37AE8 80049EC8 80280500 */  sll        $a1, $a1, 2
/* 37AEC 80049ECC 2128A200 */  addu       $a1, $a1, $v0
/* 37AF0 80049ED0 80280500 */  sll        $a1, $a1, 2
/* 37AF4 80049ED4 2128A200 */  addu       $a1, $a1, $v0
/* 37AF8 80049ED8 40280500 */  sll        $a1, $a1, 1
/* 37AFC 80049EDC 1A00A524 */  addiu      $a1, $a1, 0x1A
/* 37B00 80049EE0 002C0500 */  sll        $a1, $a1, 16
/* 37B04 80049EE4 032C0500 */  sra        $a1, $a1, 16
/* 37B08 80049EE8 00141100 */  sll        $v0, $s1, 16
/* 37B0C 80049EEC 033C0200 */  sra        $a3, $v0, 16
/* 37B10 80049EF0 C2170200 */  srl        $v0, $v0, 31
/* 37B14 80049EF4 2110E200 */  addu       $v0, $a3, $v0
/* 37B18 80049EF8 43100200 */  sra        $v0, $v0, 1
/* 37B1C 80049EFC 00310200 */  sll        $a2, $v0, 4
/* 37B20 80049F00 2130C200 */  addu       $a2, $a2, $v0
/* 37B24 80049F04 80300600 */  sll        $a2, $a2, 2
/* 37B28 80049F08 2330C200 */  subu       $a2, $a2, $v0
/* 37B2C 80049F0C 3C00C624 */  addiu      $a2, $a2, 0x3C
/* 37B30 80049F10 00340600 */  sll        $a2, $a2, 16
/* 37B34 80049F14 03340600 */  sra        $a2, $a2, 16
/* 37B38 80049F18 80200700 */  sll        $a0, $a3, 2
/* 37B3C 80049F1C 21208700 */  addu       $a0, $a0, $a3
/* 37B40 80049F20 00210400 */  sll        $a0, $a0, 4
/* 37B44 80049F24 1A008386 */  lh         $v1, 0x1A($s4)
/* 37B48 80049F28 0805828F */  lw         $v0, 0x508($gp) /* Failed to symbolize address 0x00000508 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37B4C 80049F2C 04008424 */  addiu      $a0, $a0, 0x4
/* 37B50 80049F30 1000A7AF */  sw         $a3, 0x10($sp)
/* 37B54 80049F34 21204400 */  addu       $a0, $v0, $a0
/* 37B58 80049F38 2638E300 */  xor        $a3, $a3, $v1
/* 37B5C 80049F3C 14008286 */  lh         $v0, 0x14($s4)
/* 37B60 80049F40 0100E72C */  sltiu      $a3, $a3, 0x1
/* 37B64 80049F44 FE1F010C */  jal        SelectProfile_DrawAdvProfile
/* 37B68 80049F48 1400A2AF */   sw        $v0, 0x14($sp)
/* 37B6C 80049F4C 01002226 */  addiu      $v0, $s1, 0x1
/* 37B70 80049F50 21884000 */  addu       $s1, $v0, $zero
/* 37B74 80049F54 00140200 */  sll        $v0, $v0, 16
/* 37B78 80049F58 03140200 */  sra        $v0, $v0, 16
/* 37B7C 80049F5C 04004228 */  slti       $v0, $v0, 0x4
/* 37B80 80049F60 D7FF4014 */  bnez       $v0, .L80049EC0
/* 37B84 80049F64 01002232 */   andi      $v0, $s1, 0x1
.L80049F68:
/* 37B88 80049F68 0C0A8387 */  lh         $v1, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37B8C 80049F6C 01000224 */  addiu      $v0, $zero, 0x1
/* 37B90 80049F70 AF016214 */  bne        $v1, $v0, .L8004A630
/* 37B94 80049F74 00000000 */   nop
/* 37B98 80049F78 D8098287 */  lh         $v0, 0x9D8($gp) /* Failed to symbolize address 0x000009D8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37B9C 80049F7C 00000000 */  nop
/* 37BA0 80049F80 AB014010 */  beqz       $v0, .L8004A630
/* 37BA4 80049F84 00010524 */   addiu     $a1, $zero, 0x100
/* 37BA8 80049F88 C3000624 */  addiu      $a2, $zero, 0xC3
/* 37BAC 80049F8C 0980033C */  lui        $v1, %hi(D_8008D878)
/* 37BB0 80049F90 78D8638C */  lw         $v1, %lo(D_8008D878)($v1)
/* 37BB4 80049F94 03800224 */  addiu      $v0, $zero, -0x7FFD
/* 37BB8 80049F98 1000A2AF */  sw         $v0, 0x10($sp)
/* 37BBC 80049F9C 4003648C */  lw         $a0, 0x340($v1)
/* 37BC0 80049FA0 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 37BC4 80049FA4 02000724 */   addiu     $a3, $zero, 0x2
/* 37BC8 80049FA8 8C290108 */  j          .L8004A630
/* 37BCC 80049FAC 00000000 */   nop
.L80049FB0:
/* 37BD0 80049FB0 94098287 */  lh         $v0, 0x994($gp) /* Failed to symbolize address 0x00000994 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37BD4 80049FB4 00000000 */  nop
/* 37BD8 80049FB8 21004010 */  beqz       $v0, .L8004A040
/* 37BDC 80049FBC 0880103C */   lui       $s0, %hi(D_80085D5C)
/* 37BE0 80049FC0 5C5D1026 */  addiu      $s0, $s0, %lo(D_80085D5C)
/* 37BE4 80049FC4 21200002 */  addu       $a0, $s0, $zero
/* 37BE8 80049FC8 2200A527 */  addiu      $a1, $sp, 0x22
/* 37BEC 80049FCC 01000624 */  addiu      $a2, $zero, 0x1
/* 37BF0 80049FD0 1417010C */  jal        DECOMP_RECTMENU_GetWidth
/* 37BF4 80049FD4 2200A0A7 */   sh        $zero, 0x22($sp)
/* 37BF8 80049FD8 21200002 */  addu       $a0, $s0, $zero
/* 37BFC 80049FDC 21280000 */  addu       $a1, $zero, $zero
/* 37C00 80049FE0 2200A787 */  lh         $a3, 0x22($sp)
/* 37C04 80049FE4 6C17010C */  jal        DECOMP_RECTMENU_DrawSelf
/* 37C08 80049FE8 2130A000 */   addu      $a2, $a1, $zero
/* 37C0C 80049FEC 9C000524 */  addiu      $a1, $zero, 0x9C
/* 37C10 80049FF0 3C000624 */  addiu      $a2, $zero, 0x3C
/* 37C14 80049FF4 0A80023C */  lui        $v0, %hi(D_8009AA30)
/* 37C18 80049FF8 30AA4224 */  addiu      $v0, $v0, %lo(D_8009AA30)
/* 37C1C 80049FFC 21380000 */  addu       $a3, $zero, $zero
/* 37C20 8004A000 1000A0AF */  sw         $zero, 0x10($sp)
/* 37C24 8004A004 26004384 */  lh         $v1, 0x26($v0)
/* 37C28 8004A008 14008886 */  lh         $t0, 0x14($s4)
/* 37C2C 8004A00C 30004224 */  addiu      $v0, $v0, 0x30
/* 37C30 8004A010 1800A0AF */  sw         $zero, 0x18($sp)
/* 37C34 8004A014 1C00A0AF */  sw         $zero, 0x1C($sp)
/* 37C38 8004A018 40200300 */  sll        $a0, $v1, 1
/* 37C3C 8004A01C 21208300 */  addu       $a0, $a0, $v1
/* 37C40 8004A020 80200400 */  sll        $a0, $a0, 2
/* 37C44 8004A024 21208300 */  addu       $a0, $a0, $v1
/* 37C48 8004A028 80200400 */  sll        $a0, $a0, 2
/* 37C4C 8004A02C 21208200 */  addu       $a0, $a0, $v0
/* 37C50 8004A030 8C22010C */  jal        SelectProfile_DrawGhostProfile
/* 37C54 8004A034 1400A8AF */   sw        $t0, 0x14($sp)
/* 37C58 8004A038 8C290108 */  j          .L8004A630
/* 37C5C 8004A03C 00000000 */   nop
.L8004A040:
/* 37C60 8004A040 0880033C */  lui        $v1, %hi(D_80085D88)
/* 37C64 8004A044 0C0A8287 */  lh         $v0, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37C68 8004A048 885D6324 */  addiu      $v1, $v1, %lo(D_80085D88)
/* 37C6C 8004A04C 80100200 */  sll        $v0, $v0, 2
/* 37C70 8004A050 21104300 */  addu       $v0, $v0, $v1
/* 37C74 8004A054 02004284 */  lh         $v0, 0x2($v0)
/* 37C78 8004A058 0980033C */  lui        $v1, %hi(D_8008D878)
/* 37C7C 8004A05C 78D8638C */  lw         $v1, %lo(D_8008D878)($v1)
/* 37C80 8004A060 80100200 */  sll        $v0, $v0, 2
/* 37C84 8004A064 21104300 */  addu       $v0, $v0, $v1
/* 37C88 8004A068 0000448C */  lw         $a0, 0x0($v0)
/* 37C8C 8004A06C 32DF010C */  jal        strlen
/* 37C90 8004A070 21900000 */   addu      $s2, $zero, $zero
/* 37C94 8004A074 2B180200 */  sltu       $v1, $zero, $v0
/* 37C98 8004A078 00141E00 */  sll        $v0, $fp, 16
/* 37C9C 8004A07C 03140200 */  sra        $v0, $v0, 16
/* 37CA0 8004A080 07004228 */  slti       $v0, $v0, 0x7
/* 37CA4 8004A084 08004014 */  bnez       $v0, .L8004A0A8
/* 37CA8 8004A088 4800A3A7 */   sh        $v1, 0x48($sp)
/* 37CAC 8004A08C 02001024 */  addiu      $s0, $zero, 0x2
/* 37CB0 8004A090 21106000 */  addu       $v0, $v1, $zero
/* 37CB4 8004A094 02004010 */  beqz       $v0, .L8004A0A0
/* 37CB8 8004A098 12001324 */   addiu     $s3, $zero, 0x12
/* 37CBC 8004A09C 0C001324 */  addiu      $s3, $zero, 0xC
.L8004A0A0:
/* 37CC0 8004A0A0 3D280108 */  j          .L8004A0F4
/* 37CC4 8004A0A4 08001524 */   addiu     $s5, $zero, 0x8
.L8004A0A8:
/* 37CC8 8004A0A8 01001024 */  addiu      $s0, $zero, 0x1
/* 37CCC 8004A0AC 12001324 */  addiu      $s3, $zero, 0x12
/* 37CD0 8004A0B0 0C0A8387 */  lh         $v1, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37CD4 8004A0B4 01000224 */  addiu      $v0, $zero, 0x1
/* 37CD8 8004A0B8 0E006210 */  beq        $v1, $v0, .L8004A0F4
/* 37CDC 8004A0BC 10001524 */   addiu     $s5, $zero, 0x10
/* 37CE0 8004A0C0 00010524 */  addiu      $a1, $zero, 0x100
/* 37CE4 8004A0C4 BE000624 */  addiu      $a2, $zero, 0xBE
/* 37CE8 8004A0C8 02000224 */  addiu      $v0, $zero, 0x2
/* 37CEC 8004A0CC 1000A2AF */  sw         $v0, 0x10($sp)
/* 37CF0 8004A0D0 00800224 */  addiu      $v0, $zero, -0x8000
/* 37CF4 8004A0D4 2800AA97 */  lhu        $t2, 0x28($sp)
/* 37CF8 8004A0D8 0980033C */  lui        $v1, %hi(D_8008D878)
/* 37CFC 8004A0DC 78D8638C */  lw         $v1, %lo(D_8008D878)($v1)
/* 37D00 8004A0E0 25104201 */  or         $v0, $t2, $v0
/* 37D04 8004A0E4 1400A2AF */  sw         $v0, 0x14($sp)
/* 37D08 8004A0E8 3C03648C */  lw         $a0, 0x33C($v1)
/* 37D0C 8004A0EC CD8A000C */  jal        DECOMP_DecalFont_DrawMultiLine
/* 37D10 8004A0F0 CE010724 */   addiu     $a3, $zero, 0x1CE
.L8004A0F4:
/* 37D14 8004A0F4 00010524 */  addiu      $a1, $zero, 0x100
/* 37D18 8004A0F8 00341300 */  sll        $a2, $s3, 16
/* 37D1C 8004A0FC 03340600 */  sra        $a2, $a2, 16
/* 37D20 8004A100 21B00002 */  addu       $s6, $s0, $zero
/* 37D24 8004A104 0880033C */  lui        $v1, %hi(D_80085D14)
/* 37D28 8004A108 145D7724 */  addiu      $s7, $v1, %lo(D_80085D14)
/* 37D2C 8004A10C 00800324 */  addiu      $v1, $zero, -0x8000
/* 37D30 8004A110 0C0A8287 */  lh         $v0, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37D34 8004A114 2800AB97 */  lhu        $t3, 0x28($sp)
/* 37D38 8004A118 80100200 */  sll        $v0, $v0, 2
/* 37D3C 8004A11C 21105700 */  addu       $v0, $v0, $s7
/* 37D40 8004A120 25886301 */  or         $s1, $t3, $v1
/* 37D44 8004A124 00004284 */  lh         $v0, 0x0($v0)
/* 37D48 8004A128 0980033C */  lui        $v1, %hi(D_8008D878)
/* 37D4C 8004A12C 78D8638C */  lw         $v1, %lo(D_8008D878)($v1)
/* 37D50 8004A130 2138C002 */  addu       $a3, $s6, $zero
/* 37D54 8004A134 1000B1AF */  sw         $s1, 0x10($sp)
/* 37D58 8004A138 80100200 */  sll        $v0, $v0, 2
/* 37D5C 8004A13C 21104300 */  addu       $v0, $v0, $v1
/* 37D60 8004A140 0000448C */  lw         $a0, 0x0($v0)
/* 37D64 8004A144 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 37D68 8004A148 21807502 */   addu      $s0, $s3, $s5
/* 37D6C 8004A14C 4800AC97 */  lhu        $t4, 0x48($sp)
/* 37D70 8004A150 00000000 */  nop
/* 37D74 8004A154 21108001 */  addu       $v0, $t4, $zero
/* 37D78 8004A158 11004010 */  beqz       $v0, .L8004A1A0
/* 37D7C 8004A15C 21980002 */   addu      $s3, $s0, $zero
/* 37D80 8004A160 00010524 */  addiu      $a1, $zero, 0x100
/* 37D84 8004A164 00341000 */  sll        $a2, $s0, 16
/* 37D88 8004A168 03340600 */  sra        $a2, $a2, 16
/* 37D8C 8004A16C 0C0A8287 */  lh         $v0, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37D90 8004A170 0980033C */  lui        $v1, %hi(D_8008D878)
/* 37D94 8004A174 78D8638C */  lw         $v1, %lo(D_8008D878)($v1)
/* 37D98 8004A178 80100200 */  sll        $v0, $v0, 2
/* 37D9C 8004A17C 21105700 */  addu       $v0, $v0, $s7
/* 37DA0 8004A180 02004284 */  lh         $v0, 0x2($v0)
/* 37DA4 8004A184 2138C002 */  addu       $a3, $s6, $zero
/* 37DA8 8004A188 1000B1AF */  sw         $s1, 0x10($sp)
/* 37DAC 8004A18C 80100200 */  sll        $v0, $v0, 2
/* 37DB0 8004A190 21104300 */  addu       $v0, $v0, $v1
/* 37DB4 8004A194 0000448C */  lw         $a0, 0x0($v0)
/* 37DB8 8004A198 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 37DBC 8004A19C 2198B002 */   addu      $s3, $s5, $s0
.L8004A1A0:
/* 37DC0 8004A1A0 0A80023C */  lui        $v0, %hi(D_8009AA60)
/* 37DC4 8004A1A4 60AA5024 */  addiu      $s0, $v0, %lo(D_8009AA60)
/* 37DC8 8004A1A8 FCFF0296 */  lhu        $v0, -0x4($s0)
/* 37DCC 8004A1AC 3800A997 */  lhu        $t1, 0x38($sp)
/* 37DD0 8004A1B0 00000000 */  nop
/* 37DD4 8004A1B4 21104900 */  addu       $v0, $v0, $t1
/* 37DD8 8004A1B8 4000A2A7 */  sh         $v0, 0x40($sp)
/* 37DDC 8004A1BC 00140200 */  sll        $v0, $v0, 16
/* 37DE0 8004A1C0 1B014018 */  blez       $v0, .L8004A630
/* 37DE4 8004A1C4 21880000 */   addu      $s1, $zero, $zero
/* 37DE8 8004A1C8 00141E00 */  sll        $v0, $fp, 16
/* 37DEC 8004A1CC 03B40200 */  sra        $s6, $v0, 16
/* 37DF0 8004A1D0 FFFFD726 */  addiu      $s7, $s6, -0x1
/* 37DF4 8004A1D4 0700D52A */  slti       $s5, $s6, 0x7
.L8004A1D8:
/* 37DF8 8004A1D8 001C1200 */  sll        $v1, $s2, 16
/* 37DFC 8004A1DC 3000AA97 */  lhu        $t2, 0x30($sp)
/* 37E00 8004A1E0 00000000 */  nop
/* 37E04 8004A1E4 00140A00 */  sll        $v0, $t2, 16
/* 37E08 8004A1E8 02006214 */  bne        $v1, $v0, .L8004A1F4
/* 37E0C 8004A1EC 03240300 */   sra       $a0, $v1, 16
/* 37E10 8004A1F0 21800000 */  addu       $s0, $zero, $zero
.L8004A1F4:
/* 37E14 8004A1F4 2A109700 */  slt        $v0, $a0, $s7
/* 37E18 8004A1F8 04004014 */  bnez       $v0, .L8004A20C
/* 37E1C 8004A1FC 01004332 */   andi      $v1, $s2, 0x1
/* 37E20 8004A200 01004232 */  andi       $v0, $s2, 0x1
/* 37E24 8004A204 0A004010 */  beqz       $v0, .L8004A230
/* 37E28 8004A208 00000000 */   nop
.L8004A20C:
/* 37E2C 8004A20C 40100300 */  sll        $v0, $v1, 1
/* 37E30 8004A210 21104300 */  addu       $v0, $v0, $v1
/* 37E34 8004A214 80100200 */  sll        $v0, $v0, 2
/* 37E38 8004A218 21104300 */  addu       $v0, $v0, $v1
/* 37E3C 8004A21C 80100200 */  sll        $v0, $v0, 2
/* 37E40 8004A220 21104300 */  addu       $v0, $v0, $v1
/* 37E44 8004A224 80100200 */  sll        $v0, $v0, 2
/* 37E48 8004A228 8D280108 */  j          .L8004A234
/* 37E4C 8004A22C 2E004224 */   addiu     $v0, $v0, 0x2E
.L8004A230:
/* 37E50 8004A230 98000224 */  addiu      $v0, $zero, 0x98
.L8004A234:
/* 37E54 8004A234 21284000 */  addu       $a1, $v0, $zero
/* 37E58 8004A238 00141200 */  sll        $v0, $s2, 16
/* 37E5C 8004A23C 031C0200 */  sra        $v1, $v0, 16
/* 37E60 8004A240 C2170200 */  srl        $v0, $v0, 31
/* 37E64 8004A244 21186200 */  addu       $v1, $v1, $v0
/* 37E68 8004A248 43180300 */  sra        $v1, $v1, 1
/* 37E6C 8004A24C 00141300 */  sll        $v0, $s3, 16
/* 37E70 8004A250 03140200 */  sra        $v0, $v0, 16
/* 37E74 8004A254 0500A012 */  beqz       $s5, .L8004A26C
/* 37E78 8004A258 06004424 */   addiu     $a0, $v0, 0x6
/* 37E7C 8004A25C 40100300 */  sll        $v0, $v1, 1
/* 37E80 8004A260 21104300 */  addu       $v0, $v0, $v1
/* 37E84 8004A264 A0280108 */  j          .L8004A280
/* 37E88 8004A268 00110200 */   sll       $v0, $v0, 4
.L8004A26C:
/* 37E8C 8004A26C 40100300 */  sll        $v0, $v1, 1
/* 37E90 8004A270 21104300 */  addu       $v0, $v0, $v1
/* 37E94 8004A274 80100200 */  sll        $v0, $v0, 2
/* 37E98 8004A278 23104300 */  subu       $v0, $v0, $v1
/* 37E9C 8004A27C 80100200 */  sll        $v0, $v0, 2
.L8004A280:
/* 37EA0 8004A280 23104300 */  subu       $v0, $v0, $v1
/* 37EA4 8004A284 21108200 */  addu       $v0, $a0, $v0
/* 37EA8 8004A288 00140200 */  sll        $v0, $v0, 16
/* 37EAC 8004A28C 03340200 */  sra        $a2, $v0, 16
/* 37EB0 8004A290 00141200 */  sll        $v0, $s2, 16
/* 37EB4 8004A294 1A008386 */  lh         $v1, 0x1A($s4)
/* 37EB8 8004A298 03140200 */  sra        $v0, $v0, 16
/* 37EBC 8004A29C 1000A2AF */  sw         $v0, 0x10($sp)
/* 37EC0 8004A2A0 26104300 */  xor        $v0, $v0, $v1
/* 37EC4 8004A2A4 0100472C */  sltiu      $a3, $v0, 0x1
/* 37EC8 8004A2A8 14008286 */  lh         $v0, 0x14($s4)
/* 37ECC 8004A2AC 0200A016 */  bnez       $s5, .L8004A2B8
/* 37ED0 8004A2B0 00000000 */   nop
/* 37ED4 8004A2B4 40004234 */  ori        $v0, $v0, 0x40
.L8004A2B8:
/* 37ED8 8004A2B8 0C0A8487 */  lh         $a0, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37EDC 8004A2BC 21400000 */  addu       $t0, $zero, $zero
/* 37EE0 8004A2C0 1400A2AF */  sw         $v0, 0x14($sp)
/* 37EE4 8004A2C4 0100822C */  sltiu      $v0, $a0, 0x1
/* 37EE8 8004A2C8 09000012 */  beqz       $s0, .L8004A2F0
/* 37EEC 8004A2CC 1800A2AF */   sw        $v0, 0x18($sp)
/* 37EF0 8004A2D0 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 37EF4 8004A2D4 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 37EF8 8004A2D8 28000386 */  lh         $v1, 0x28($s0)
/* 37EFC 8004A2DC B01E428C */  lw         $v0, 0x1EB0($v0)
/* 37F00 8004A2E0 00000000 */  nop
/* 37F04 8004A2E4 02006210 */  beq        $v1, $v0, .L8004A2F0
/* 37F08 8004A2E8 01008238 */   xori      $v0, $a0, 0x1
/* 37F0C 8004A2EC 2B400201 */  sltu       $t0, $t0, $v0
.L8004A2F0:
/* 37F10 8004A2F0 1C00A8AF */  sw         $t0, 0x1C($sp)
/* 37F14 8004A2F4 8C22010C */  jal        SelectProfile_DrawGhostProfile
/* 37F18 8004A2F8 21200002 */   addu      $a0, $s0, $zero
/* 37F1C 8004A2FC 00141200 */  sll        $v0, $s2, 16
/* 37F20 8004A300 03140200 */  sra        $v0, $v0, 16
/* 37F24 8004A304 CA005610 */  beq        $v0, $s6, .L8004A630
/* 37F28 8004A308 01005226 */   addiu     $s2, $s2, 0x1
/* 37F2C 8004A30C 01002226 */  addiu      $v0, $s1, 0x1
/* 37F30 8004A310 21884000 */  addu       $s1, $v0, $zero
/* 37F34 8004A314 4000AB97 */  lhu        $t3, 0x40($sp)
/* 37F38 8004A318 00140200 */  sll        $v0, $v0, 16
/* 37F3C 8004A31C 001C0B00 */  sll        $v1, $t3, 16
/* 37F40 8004A320 2A104300 */  slt        $v0, $v0, $v1
/* 37F44 8004A324 ACFF4014 */  bnez       $v0, .L8004A1D8
/* 37F48 8004A328 34001026 */   addiu     $s0, $s0, 0x34
/* 37F4C 8004A32C 8C290108 */  j          .L8004A630
/* 37F50 8004A330 00000000 */   nop
.L8004A334:
/* 37F54 8004A334 8E098287 */  lh         $v0, 0x98E($gp) /* Failed to symbolize address 0x0000098E for %gp_rel. Make sure this address is within the recognized valid address space */
.L8004A338:
/* 37F58 8004A338 940980A7 */  sh         $zero, 0x994($gp) /* Failed to symbolize address 0x00000994 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37F5C 8004A33C 20004010 */  beqz       $v0, .L8004A3C0
/* 37F60 8004A340 001C1100 */   sll       $v1, $s1, 16
/* 37F64 8004A344 F8098287 */  lh         $v0, 0x9F8($gp) /* Failed to symbolize address 0x000009F8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37F68 8004A348 00000000 */  nop
/* 37F6C 8004A34C 1D004010 */  beqz       $v0, .L8004A3C4
/* 37F70 8004A350 031C0300 */   sra       $v1, $v1, 16
/* 37F74 8004A354 90098287 */  lh         $v0, 0x990($gp) /* Failed to symbolize address 0x00000990 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37F78 8004A358 00000000 */  nop
/* 37F7C 8004A35C 18004014 */  bnez       $v0, .L8004A3C0
/* 37F80 8004A360 001C1100 */   sll       $v1, $s1, 16
/* 37F84 8004A364 92098287 */  lh         $v0, 0x992($gp) /* Failed to symbolize address 0x00000992 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37F88 8004A368 00000000 */  nop
/* 37F8C 8004A36C 14004014 */  bnez       $v0, .L8004A3C0
/* 37F90 8004A370 00000000 */   nop
/* 37F94 8004A374 98098287 */  lh         $v0, 0x998($gp) /* Failed to symbolize address 0x00000998 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37F98 8004A378 00000000 */  nop
/* 37F9C 8004A37C 11004010 */  beqz       $v0, .L8004A3C4
/* 37FA0 8004A380 031C0300 */   sra       $v1, $v1, 16
/* 37FA4 8004A384 040A8297 */  lhu        $v0, 0xA04($gp) /* Failed to symbolize address 0x00000A04 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 37FA8 8004A388 0980033C */  lui        $v1, %hi(D_8008D878)
/* 37FAC 8004A38C 78D8638C */  lw         $v1, %lo(D_8008D878)($v1)
/* 37FB0 8004A390 04004230 */  andi       $v0, $v0, 0x4
/* 37FB4 8004A394 02004014 */  bnez       $v0, .L8004A3A0
/* 37FB8 8004A398 04800224 */   addiu     $v0, $zero, -0x7FFC
/* 37FBC 8004A39C 00800224 */  addiu      $v0, $zero, -0x8000
.L8004A3A0:
/* 37FC0 8004A3A0 1000A2AF */  sw         $v0, 0x10($sp)
/* 37FC4 8004A3A4 F404648C */  lw         $a0, 0x4F4($v1)
/* 37FC8 8004A3A8 08010524 */  addiu      $a1, $zero, 0x108
/* 37FCC 8004A3AC 64000624 */  addiu      $a2, $zero, 0x64
/* 37FD0 8004A3B0 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 37FD4 8004A3B4 01000724 */   addiu     $a3, $zero, 0x1
/* 37FD8 8004A3B8 8C290108 */  j          .L8004A630
/* 37FDC 8004A3BC 00000000 */   nop
.L8004A3C0:
/* 37FE0 8004A3C0 031C0300 */  sra        $v1, $v1, 16
.L8004A3C4:
/* 37FE4 8004A3C4 80200300 */  sll        $a0, $v1, 2
/* 37FE8 8004A3C8 0880023C */  lui        $v0, %hi(D_80085B04)
/* 37FEC 8004A3CC 045B4224 */  addiu      $v0, $v0, %lo(D_80085B04)
/* 37FF0 8004A3D0 21908200 */  addu       $s2, $a0, $v0
/* 37FF4 8004A3D4 00005096 */  lhu        $s0, 0x0($s2)
/* 37FF8 8004A3D8 09000224 */  addiu      $v0, $zero, 0x9
/* 37FFC 8004A3DC 06006214 */  bne        $v1, $v0, .L8004A3F8
/* 38000 8004A3E0 40000224 */   addiu     $v0, $zero, 0x40
/* 38004 8004A3E4 8C098387 */  lh         $v1, 0x98C($gp) /* Failed to symbolize address 0x0000098C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 38008 8004A3E8 00000000 */  nop
/* 3800C 8004A3EC 02006214 */  bne        $v1, $v0, .L8004A3F8
/* 38010 8004A3F0 00000000 */   nop
/* 38014 8004A3F4 FFFF1024 */  addiu      $s0, $zero, -0x1
.L8004A3F8:
/* 38018 8004A3F8 8E098287 */  lh         $v0, 0x98E($gp) /* Failed to symbolize address 0x0000098E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 3801C 8004A3FC 00000000 */  nop
/* 38020 8004A400 07004010 */  beqz       $v0, .L8004A420
/* 38024 8004A404 00141000 */   sll       $v0, $s0, 16
/* 38028 8004A408 F8098287 */  lh         $v0, 0x9F8($gp) /* Failed to symbolize address 0x000009F8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 3802C 8004A40C 00000000 */  nop
/* 38030 8004A410 03004010 */  beqz       $v0, .L8004A420
/* 38034 8004A414 00141000 */   sll       $v0, $s0, 16
/* 38038 8004A418 FFFF1024 */  addiu      $s0, $zero, -0x1
/* 3803C 8004A41C 00141000 */  sll        $v0, $s0, 16
.L8004A420:
/* 38040 8004A420 031C0200 */  sra        $v1, $v0, 16
/* 38044 8004A424 82006004 */  bltz       $v1, .L8004A630
/* 38048 8004A428 00000000 */   nop
/* 3804C 8004A42C 92098287 */  lh         $v0, 0x992($gp) /* Failed to symbolize address 0x00000992 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 38050 8004A430 00000000 */  nop
/* 38054 8004A434 7E004014 */  bnez       $v0, .L8004A630
/* 38058 8004A438 0F010224 */   addiu     $v0, $zero, 0x10F
/* 3805C 8004A43C 06006214 */  bne        $v1, $v0, .L8004A458
/* 38060 8004A440 01000224 */   addiu     $v0, $zero, 0x1
/* 38064 8004A444 0C0A8387 */  lh         $v1, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 38068 8004A448 00000000 */  nop
/* 3806C 8004A44C 02006214 */  bne        $v1, $v0, .L8004A458
/* 38070 8004A450 00000000 */   nop
/* 38074 8004A454 06011024 */  addiu      $s0, $zero, 0x106
.L8004A458:
/* 38078 8004A458 8C098387 */  lh         $v1, 0x98C($gp) /* Failed to symbolize address 0x0000098C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 3807C 8004A45C 30000224 */  addiu      $v0, $zero, 0x30
/* 38080 8004A460 11006210 */  beq        $v1, $v0, .L8004A4A8
/* 38084 8004A464 00141100 */   sll       $v0, $s1, 16
/* 38088 8004A468 03140200 */  sra        $v0, $v0, 16
/* 3808C 8004A46C 09000324 */  addiu      $v1, $zero, 0x9
/* 38090 8004A470 0D004314 */  bne        $v0, $v1, .L8004A4A8
/* 38094 8004A474 00000000 */   nop
/* 38098 8004A478 D8098287 */  lh         $v0, 0x9D8($gp) /* Failed to symbolize address 0x000009D8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 3809C 8004A47C 00000000 */  nop
/* 380A0 8004A480 09004010 */  beqz       $v0, .L8004A4A8
/* 380A4 8004A484 00010524 */   addiu     $a1, $zero, 0x100
/* 380A8 8004A488 C3000624 */  addiu      $a2, $zero, 0xC3
/* 380AC 8004A48C 0980033C */  lui        $v1, %hi(D_8008D878)
/* 380B0 8004A490 78D8638C */  lw         $v1, %lo(D_8008D878)($v1)
/* 380B4 8004A494 03800224 */  addiu      $v0, $zero, -0x7FFD
/* 380B8 8004A498 1000A2AF */  sw         $v0, 0x10($sp)
/* 380BC 8004A49C 4003648C */  lw         $a0, 0x340($v1)
/* 380C0 8004A4A0 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 380C4 8004A4A4 02000724 */   addiu     $a3, $zero, 0x2
.L8004A4A8:
/* 380C8 8004A4A8 0C0A8387 */  lh         $v1, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 380CC 8004A4AC 02000224 */  addiu      $v0, $zero, 0x2
/* 380D0 8004A4B0 06006214 */  bne        $v1, $v0, .L8004A4CC
/* 380D4 8004A4B4 00141000 */   sll       $v0, $s0, 16
/* 380D8 8004A4B8 03140200 */  sra        $v0, $v0, 16
/* 380DC 8004A4BC EA000324 */  addiu      $v1, $zero, 0xEA
/* 380E0 8004A4C0 02004314 */  bne        $v0, $v1, .L8004A4CC
/* 380E4 8004A4C4 00000000 */   nop
/* 380E8 8004A4C8 FC001024 */  addiu      $s0, $zero, 0xFC
.L8004A4CC:
/* 380EC 8004A4CC 02004286 */  lh         $v0, 0x2($s2)
/* 380F0 8004A4D0 00000000 */  nop
/* 380F4 8004A4D4 11004014 */  bnez       $v0, .L8004A51C
/* 380F8 8004A4D8 00141000 */   sll       $v0, $s0, 16
/* 380FC 8004A4DC 08010524 */  addiu      $a1, $zero, 0x108
/* 38100 8004A4E0 12000624 */  addiu      $a2, $zero, 0x12
/* 38104 8004A4E4 00800224 */  addiu      $v0, $zero, -0x8000
/* 38108 8004A4E8 2800AC97 */  lhu        $t4, 0x28($sp)
/* 3810C 8004A4EC 0980033C */  lui        $v1, %hi(D_8008D878)
/* 38110 8004A4F0 78D8638C */  lw         $v1, %lo(D_8008D878)($v1)
/* 38114 8004A4F4 25108201 */  or         $v0, $t4, $v0
/* 38118 8004A4F8 1000A2AF */  sw         $v0, 0x10($sp)
/* 3811C 8004A4FC 00141000 */  sll        $v0, $s0, 16
/* 38120 8004A500 83130200 */  sra        $v0, $v0, 14
/* 38124 8004A504 21104300 */  addu       $v0, $v0, $v1
/* 38128 8004A508 0000448C */  lw         $a0, 0x0($v0)
/* 3812C 8004A50C 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 38130 8004A510 01000724 */   addiu     $a3, $zero, 0x1
/* 38134 8004A514 82290108 */  j          .L8004A608
/* 38138 8004A518 00000000 */   nop
.L8004A51C:
/* 3813C 8004A51C 21880000 */  addu       $s1, $zero, $zero
/* 38140 8004A520 03AC0200 */  sra        $s5, $v0, 16
/* 38144 8004A524 0880023C */  lui        $v0, %hi(D_80082368)
/* 38148 8004A528 68235624 */  addiu      $s6, $v0, %lo(D_80082368)
/* 3814C 8004A52C 2800A997 */  lhu        $t1, 0x28($sp)
/* 38150 8004A530 00800224 */  addiu      $v0, $zero, -0x8000
/* 38154 8004A534 25982201 */  or         $s3, $t1, $v0
/* 38158 8004A538 00141100 */  sll        $v0, $s1, 16
.L8004A53C:
/* 3815C 8004A53C 03840200 */  sra        $s0, $v0, 16
/* 38160 8004A540 2110B002 */  addu       $v0, $s5, $s0
/* 38164 8004A544 0980033C */  lui        $v1, %hi(D_8008D878)
/* 38168 8004A548 78D8638C */  lw         $v1, %lo(D_8008D878)($v1)
/* 3816C 8004A54C 80100200 */  sll        $v0, $v0, 2
/* 38170 8004A550 21104300 */  addu       $v0, $v0, $v1
/* 38174 8004A554 0000528C */  lw         $s2, 0x0($v0)
/* 38178 8004A558 32DF010C */  jal        strlen
/* 3817C 8004A55C 21204002 */   addu      $a0, $s2, $zero
/* 38180 8004A560 23004010 */  beqz       $v0, .L8004A5F0
/* 38184 8004A564 01002226 */   addiu     $v0, $s1, 0x1
/* 38188 8004A568 02000012 */  beqz       $s0, .L8004A574
/* 3818C 8004A56C 02000224 */   addiu     $v0, $zero, 0x2
/* 38190 8004A570 04000224 */  addiu      $v0, $zero, 0x4
.L8004A574:
/* 38194 8004A574 21105600 */  addu       $v0, $v0, $s6
/* 38198 8004A578 00004284 */  lh         $v0, 0x0($v0)
/* 3819C 8004A57C 00000000 */  nop
/* 381A0 8004A580 02004224 */  addiu      $v0, $v0, 0x2
/* 381A4 8004A584 18000202 */  mult       $s0, $v0
/* 381A8 8004A588 12100000 */  mflo       $v0
/* 381AC 8004A58C 0400001A */  blez       $s0, .L8004A5A0
/* 381B0 8004A590 26004324 */   addiu     $v1, $v0, 0x26
/* 381B4 8004A594 2E004224 */  addiu      $v0, $v0, 0x2E
/* 381B8 8004A598 69290108 */  j          .L8004A5A4
/* 381BC 8004A59C 00140200 */   sll       $v0, $v0, 16
.L8004A5A0:
/* 381C0 8004A5A0 00140300 */  sll        $v0, $v1, 16
.L8004A5A4:
/* 381C4 8004A5A4 03340200 */  sra        $a2, $v0, 16
/* 381C8 8004A5A8 00141100 */  sll        $v0, $s1, 16
/* 381CC 8004A5AC 03140200 */  sra        $v0, $v0, 16
/* 381D0 8004A5B0 03004010 */  beqz       $v0, .L8004A5C0
/* 381D4 8004A5B4 01000724 */   addiu     $a3, $zero, 0x1
/* 381D8 8004A5B8 06004014 */  bnez       $v0, .L8004A5D4
/* 381DC 8004A5BC 02000724 */   addiu     $a3, $zero, 0x2
.L8004A5C0:
/* 381E0 8004A5C0 040A8297 */  lhu        $v0, 0xA04($gp) /* Failed to symbolize address 0x00000A04 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 381E4 8004A5C4 00000000 */  nop
/* 381E8 8004A5C8 04004230 */  andi       $v0, $v0, 0x4
/* 381EC 8004A5CC 03004010 */  beqz       $v0, .L8004A5DC
/* 381F0 8004A5D0 03800224 */   addiu     $v0, $zero, -0x7FFD
.L8004A5D4:
/* 381F4 8004A5D4 78290108 */  j          .L8004A5E0
/* 381F8 8004A5D8 1000B3AF */   sw        $s3, 0x10($sp)
.L8004A5DC:
/* 381FC 8004A5DC 1000A2AF */  sw         $v0, 0x10($sp)
.L8004A5E0:
/* 38200 8004A5E0 21204002 */  addu       $a0, $s2, $zero
/* 38204 8004A5E4 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 38208 8004A5E8 00010524 */   addiu     $a1, $zero, 0x100
/* 3820C 8004A5EC 01002226 */  addiu      $v0, $s1, 0x1
.L8004A5F0:
/* 38210 8004A5F0 21884000 */  addu       $s1, $v0, $zero
/* 38214 8004A5F4 00140200 */  sll        $v0, $v0, 16
/* 38218 8004A5F8 03140200 */  sra        $v0, $v0, 16
/* 3821C 8004A5FC 09004228 */  slti       $v0, $v0, 0x9
/* 38220 8004A600 CEFF4014 */  bnez       $v0, .L8004A53C
/* 38224 8004A604 00141100 */   sll       $v0, $s1, 16
.L8004A608:
/* 38228 8004A608 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 3822C 8004A60C ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 38230 8004A610 00000000 */  nop
/* 38234 8004A614 1000428C */  lw         $v0, 0x10($v0)
/* 38238 8004A618 14008586 */  lh         $a1, 0x14($s4)
/* 3823C 8004A61C A000468C */  lw         $a2, 0xA0($v0)
/* 38240 8004A620 0980043C */  lui        $a0, %hi(D_8008D4A4)
/* 38244 8004A624 A4D48424 */  addiu      $a0, $a0, %lo(D_8008D4A4)
/* 38248 8004A628 EC15010C */  jal        DECOMP_RECTMENU_DrawInnerRect
/* 3824C 8004A62C 00000000 */   nop
.L8004A630:
/* 38250 8004A630 8E098287 */  lh         $v0, 0x98E($gp) /* Failed to symbolize address 0x0000098E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 38254 8004A634 00000000 */  nop
/* 38258 8004A638 E7004010 */  beqz       $v0, .L8004A9D8
/* 3825C 8004A63C 00000000 */   nop
/* 38260 8004A640 180A8287 */  lh         $v0, 0xA18($gp) /* Failed to symbolize address 0x00000A18 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 38264 8004A644 00000000 */  nop
/* 38268 8004A648 E3004010 */  beqz       $v0, .L8004A9D8
/* 3826C 8004A64C 00000000 */   nop
/* 38270 8004A650 F8098287 */  lh         $v0, 0x9F8($gp) /* Failed to symbolize address 0x000009F8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 38274 8004A654 00000000 */  nop
/* 38278 8004A658 09004014 */  bnez       $v0, .L8004A680
/* 3827C 8004A65C 00000000 */   nop
/* 38280 8004A660 90098287 */  lh         $v0, 0x990($gp) /* Failed to symbolize address 0x00000990 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 38284 8004A664 00000000 */  nop
/* 38288 8004A668 05004014 */  bnez       $v0, .L8004A680
/* 3828C 8004A66C 00000000 */   nop
/* 38290 8004A670 92098287 */  lh         $v0, 0x992($gp) /* Failed to symbolize address 0x00000992 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 38294 8004A674 00000000 */  nop
/* 38298 8004A678 D7004010 */  beqz       $v0, .L8004A9D8
/* 3829C 8004A67C 00000000 */   nop
.L8004A680:
/* 382A0 8004A680 8E098287 */  lh         $v0, 0x98E($gp) /* Failed to symbolize address 0x0000098E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 382A4 8004A684 00000000 */  nop
/* 382A8 8004A688 14004010 */  beqz       $v0, .L8004A6DC
/* 382AC 8004A68C 00000000 */   nop
/* 382B0 8004A690 F8098287 */  lh         $v0, 0x9F8($gp) /* Failed to symbolize address 0x000009F8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 382B4 8004A694 00000000 */  nop
/* 382B8 8004A698 10004010 */  beqz       $v0, .L8004A6DC
/* 382BC 8004A69C 00000000 */   nop
/* 382C0 8004A6A0 90098287 */  lh         $v0, 0x990($gp) /* Failed to symbolize address 0x00000990 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 382C4 8004A6A4 00000000 */  nop
/* 382C8 8004A6A8 0C004014 */  bnez       $v0, .L8004A6DC
/* 382CC 8004A6AC 00000000 */   nop
/* 382D0 8004A6B0 92098287 */  lh         $v0, 0x992($gp) /* Failed to symbolize address 0x00000992 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 382D4 8004A6B4 00000000 */  nop
/* 382D8 8004A6B8 08004014 */  bnez       $v0, .L8004A6DC
/* 382DC 8004A6BC 00000000 */   nop
/* 382E0 8004A6C0 98098287 */  lh         $v0, 0x998($gp) /* Failed to symbolize address 0x00000998 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 382E4 8004A6C4 98098397 */  lhu        $v1, 0x998($gp) /* Failed to symbolize address 0x00000998 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 382E8 8004A6C8 04004010 */  beqz       $v0, .L8004A6DC
/* 382EC 8004A6CC FFFF6224 */   addiu     $v0, $v1, -0x1
/* 382F0 8004A6D0 980982A7 */  sh         $v0, 0x998($gp) /* Failed to symbolize address 0x00000998 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 382F4 8004A6D4 762A0108 */  j          .L8004A9D8
/* 382F8 8004A6D8 00000000 */   nop
.L8004A6DC:
/* 382FC 8004A6DC B723010C */  jal        SelectProfile_InitAndDestroy
/* 38300 8004A6E0 00000000 */   nop
/* 38304 8004A6E4 6B1C010C */  jal        RefreshCard_StopMemcardAction
/* 38308 8004A6E8 00000000 */   nop
/* 3830C 8004A6EC 8C098387 */  lh         $v1, 0x98C($gp) /* Failed to symbolize address 0x0000098C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 38310 8004A6F0 20000224 */  addiu      $v0, $zero, 0x20
/* 38314 8004A6F4 5C006210 */  beq        $v1, $v0, .L8004A868
/* 38318 8004A6F8 21006228 */   slti      $v0, $v1, 0x21
/* 3831C 8004A6FC 07004010 */  beqz       $v0, .L8004A71C
/* 38320 8004A700 30000224 */   addiu     $v0, $zero, 0x30
/* 38324 8004A704 0B006010 */  beqz       $v1, .L8004A734
/* 38328 8004A708 10000224 */   addiu     $v0, $zero, 0x10
/* 3832C 8004A70C 1C006210 */  beq        $v1, $v0, .L8004A780
/* 38330 8004A710 00000000 */   nop
/* 38334 8004A714 762A0108 */  j          .L8004A9D8
/* 38338 8004A718 00000000 */   nop
.L8004A71C:
/* 3833C 8004A71C 6F006210 */  beq        $v1, $v0, .L8004A8DC
/* 38340 8004A720 40000224 */   addiu     $v0, $zero, 0x40
/* 38344 8004A724 95006210 */  beq        $v1, $v0, .L8004A97C
/* 38348 8004A728 00000000 */   nop
/* 3834C 8004A72C 762A0108 */  j          .L8004A9D8
/* 38350 8004A730 00000000 */   nop
.L8004A734:
/* 38354 8004A734 90098287 */  lh         $v0, 0x990($gp) /* Failed to symbolize address 0x00000990 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 38358 8004A738 00000000 */  nop
/* 3835C 8004A73C 07004010 */  beqz       $v0, .L8004A75C
/* 38360 8004A740 0880023C */   lui       $v0, %hi(D_80085C0C)
/* 38364 8004A744 0C5C4224 */  addiu      $v0, $v0, %lo(D_80085C0C)
/* 38368 8004A748 B80982AF */  sw         $v0, 0x9B8($gp) /* Failed to symbolize address 0x000009B8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 3836C 8004A74C 822A010C */  jal        DECOMP_SubmitName_RestoreName
/* 38370 8004A750 21200000 */   addu      $a0, $zero, $zero
/* 38374 8004A754 762A0108 */  j          .L8004A9D8
/* 38378 8004A758 00000000 */   nop
.L8004A75C:
/* 3837C 8004A75C 1A008296 */  lhu        $v0, 0x1A($s4)
/* 38380 8004A760 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 38384 8004A764 ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 38388 8004A768 000A82A7 */  sh         $v0, 0xA00($gp) /* Failed to symbolize address 0x00000A00 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 3838C 8004A76C 1A000224 */  addiu      $v0, $zero, 0x1A
/* 38390 8004A770 D3C1000C */  jal        DECOMP_Garage_Leave
/* 38394 8004A774 B01E62AC */   sw        $v0, 0x1EB0($v1)
/* 38398 8004A778 5A2A0108 */  j          .L8004A968
/* 3839C 8004A77C 00000000 */   nop
.L8004A780:
/* 383A0 8004A780 90098287 */  lh         $v0, 0x990($gp) /* Failed to symbolize address 0x00000990 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 383A4 8004A784 00000000 */  nop
/* 383A8 8004A788 0A004010 */  beqz       $v0, .L8004A7B4
/* 383AC 8004A78C 00000000 */   nop
/* 383B0 8004A790 CDD0020C */  jal        DECOMP_MM_JumpTo_Title_Returning
/* 383B4 8004A794 00000000 */   nop
/* 383B8 8004A798 60B6020C */  jal        DECOMP_MM_AdvNewLoad_GetMenuPtr
/* 383BC 8004A79C 00000000 */   nop
/* 383C0 8004A7A0 0800438C */  lw         $v1, 0x8($v0)
/* 383C4 8004A7A4 FBFF0424 */  addiu      $a0, $zero, -0x5
/* 383C8 8004A7A8 24186400 */  and        $v1, $v1, $a0
/* 383CC 8004A7AC 762A0108 */  j          .L8004A9D8
/* 383D0 8004A7B0 080043AC */   sw        $v1, 0x8($v0)
.L8004A7B4:
/* 383D4 8004A7B4 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 383D8 8004A7B8 ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 383DC 8004A7BC 1A008296 */  lhu        $v0, 0x1A($s4)
/* 383E0 8004A7C0 21206000 */  addu       $a0, $v1, $zero
/* 383E4 8004A7C4 000A82A7 */  sh         $v0, 0xA00($gp) /* Failed to symbolize address 0x00000A00 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 383E8 8004A7C8 0980023C */  lui        $v0, %hi(D_8008FBBC)
/* 383EC 8004A7CC BCFB4C24 */  addiu      $t4, $v0, %lo(D_8008FBBC)
/* 383F0 8004A7D0 0000898D */  lw         $t1, 0x0($t4)
/* 383F4 8004A7D4 04008A8D */  lw         $t2, 0x4($t4)
/* 383F8 8004A7D8 08008B8D */  lw         $t3, 0x8($t4)
/* 383FC 8004A7DC 541D69AC */  sw         $t1, 0x1D54($v1)
/* 38400 8004A7E0 581D6AAC */  sw         $t2, 0x1D58($v1)
/* 38404 8004A7E4 5C1D6BAC */  sw         $t3, 0x1D5C($v1)
/* 38408 8004A7E8 0C00898D */  lw         $t1, 0xC($t4)
/* 3840C 8004A7EC 10008A81 */  lb         $t2, 0x10($t4)
/* 38410 8004A7F0 601D69AC */  sw         $t1, 0x1D60($v1)
/* 38414 8004A7F4 641D6AA0 */  sb         $t2, 0x1D64($v1)
/* 38418 8004A7F8 BCFB4C24 */  addiu      $t4, $v0, %lo(D_8008FBBC)
/* 3841C 8004A7FC 03008989 */  lwl        $t1, 0x3($t4)
/* 38420 8004A800 00008999 */  lwr        $t1, 0x0($t4)
/* 38424 8004A804 07008A89 */  lwl        $t2, 0x7($t4)
/* 38428 8004A808 04008A99 */  lwr        $t2, 0x4($t4)
/* 3842C 8004A80C 0B008B89 */  lwl        $t3, 0xB($t4)
/* 38430 8004A810 08008B99 */  lwr        $t3, 0x8($t4)
/* 38434 8004A814 681D89A8 */  swl        $t1, 0x1D68($a0)
/* 38438 8004A818 651D89B8 */  swr        $t1, 0x1D65($a0)
/* 3843C 8004A81C 6C1D8AA8 */  swl        $t2, 0x1D6C($a0)
/* 38440 8004A820 691D8AB8 */  swr        $t2, 0x1D69($a0)
/* 38444 8004A824 701D8BA8 */  swl        $t3, 0x1D70($a0)
/* 38448 8004A828 6D1D8BB8 */  swr        $t3, 0x1D6D($a0)
/* 3844C 8004A82C 0F008989 */  lwl        $t1, 0xF($t4)
/* 38450 8004A830 0C008999 */  lwr        $t1, 0xC($t4)
/* 38454 8004A834 10008A81 */  lb         $t2, 0x10($t4)
/* 38458 8004A838 741D89A8 */  swl        $t1, 0x1D74($a0)
/* 3845C 8004A83C 711D89B8 */  swr        $t1, 0x1D71($a0)
/* 38460 8004A840 751D8AA0 */  sb         $t2, 0x1D75($a0)
/* 38464 8004A844 BCFB4224 */  addiu      $v0, $v0, %lo(D_8008FBBC)
/* 38468 8004A848 16004284 */  lh         $v0, 0x16($v0)
/* 3846C 8004A84C 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 38470 8004A850 ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 38474 8004A854 02004010 */  beqz       $v0, .L8004A860
/* 38478 8004A858 1A000524 */   addiu     $a1, $zero, 0x1A
/* 3847C 8004A85C 21284000 */  addu       $a1, $v0, $zero
.L8004A860:
/* 38480 8004A860 5A2A0108 */  j          .L8004A968
/* 38484 8004A864 B01E65AC */   sw        $a1, 0x1EB0($v1)
.L8004A868:
/* 38488 8004A868 90098287 */  lh         $v0, 0x990($gp) /* Failed to symbolize address 0x00000990 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 3848C 8004A86C 00000000 */  nop
/* 38490 8004A870 15004014 */  bnez       $v0, .L8004A8C8
/* 38494 8004A874 0880023C */   lui       $v0, %hi(D_80085B5C)
/* 38498 8004A878 1A008296 */  lhu        $v0, 0x1A($s4)
/* 3849C 8004A87C 0C0A8387 */  lh         $v1, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 384A0 8004A880 000A82A7 */  sh         $v0, 0xA00($gp) /* Failed to symbolize address 0x00000A00 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 384A4 8004A884 10006014 */  bnez       $v1, .L8004A8C8
/* 384A8 8004A888 0880023C */   lui       $v0, %hi(D_80085B5C)
/* 384AC 8004A88C 0980103C */  lui        $s0, %hi(D_8008FBA4)
/* 384B0 8004A890 A4FB1026 */  addiu      $s0, $s0, %lo(D_8008FBA4)
/* 384B4 8004A894 7099000C */  jal        DECOMP_GAMEPROG_AdvPercent
/* 384B8 8004A898 21200002 */   addu      $a0, $s0, $zero
/* 384BC 8004A89C 0880023C */  lui        $v0, %hi(D_80085C38)
/* 384C0 8004A8A0 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 384C4 8004A8A4 ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 384C8 8004A8A8 2E000386 */  lh         $v1, 0x2E($s0)
/* 384CC 8004A8AC 385C4224 */  addiu      $v0, $v0, %lo(D_80085C38)
/* 384D0 8004A8B0 B80982AF */  sw         $v0, 0x9B8($gp) /* Failed to symbolize address 0x000009B8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 384D4 8004A8B4 03000224 */  addiu      $v0, $zero, 0x3
/* 384D8 8004A8B8 B01E83AC */  sw         $v1, 0x1EB0($a0)
/* 384DC 8004A8BC 0880033C */  lui        $v1, %hi(D_80085B76)
/* 384E0 8004A8C0 762A0108 */  j          .L8004A9D8
/* 384E4 8004A8C4 765B62A4 */   sh        $v0, %lo(D_80085B76)($v1)
.L8004A8C8:
/* 384E8 8004A8C8 5C5B4224 */  addiu      $v0, $v0, %lo(D_80085B5C)
/* 384EC 8004A8CC 03000324 */  addiu      $v1, $zero, 0x3
/* 384F0 8004A8D0 B80982AF */  sw         $v0, 0x9B8($gp) /* Failed to symbolize address 0x000009B8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 384F4 8004A8D4 762A0108 */  j          .L8004A9D8
/* 384F8 8004A8D8 1A0043A4 */   sh        $v1, 0x1A($v0)
.L8004A8DC:
/* 384FC 8004A8DC 3822010C */  jal        SelectProfile_Destroy
/* 38500 8004A8E0 00000000 */   nop
/* 38504 8004A8E4 0C0A8387 */  lh         $v1, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 38508 8004A8E8 01000224 */  addiu      $v0, $zero, 0x1
/* 3850C 8004A8EC 0B006214 */  bne        $v1, $v0, .L8004A91C
/* 38510 8004A8F0 00000000 */   nop
/* 38514 8004A8F4 90098287 */  lh         $v0, 0x990($gp) /* Failed to symbolize address 0x00000990 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 38518 8004A8F8 00000000 */  nop
/* 3851C 8004A8FC 04004010 */  beqz       $v0, .L8004A910
/* 38520 8004A900 00000000 */   nop
/* 38524 8004A904 0A80023C */  lui        $v0, %hi(D_800A0458)
/* 38528 8004A908 5C2A0108 */  j          .L8004A970
/* 3852C 8004A90C 58044224 */   addiu     $v0, $v0, %lo(D_800A0458)
.L8004A910:
/* 38530 8004A910 0A80023C */  lui        $v0, %hi(D_800A04A4)
/* 38534 8004A914 5C2A0108 */  j          .L8004A970
/* 38538 8004A918 A4044224 */   addiu     $v0, $v0, %lo(D_800A04A4)
.L8004A91C:
/* 3853C 8004A91C 90098287 */  lh         $v0, 0x990($gp) /* Failed to symbolize address 0x00000990 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 38540 8004A920 00000000 */  nop
/* 38544 8004A924 0A004010 */  beqz       $v0, .L8004A950
/* 38548 8004A928 00000000 */   nop
/* 3854C 8004A92C 04A1000C */  jal        DECOMP_GhostTape_Destroy
/* 38550 8004A930 00000000 */   nop
/* 38554 8004A934 ABC3020C */  jal        DECOMP_MM_TrackSelect_GetMenuPtr
/* 38558 8004A938 00000000 */   nop
/* 3855C 8004A93C B80982AF */  sw         $v0, 0x9B8($gp) /* Failed to symbolize address 0x000009B8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 38560 8004A940 F4BF020C */  jal        DECOMP_MM_TrackSelect_Init
/* 38564 8004A944 00000000 */   nop
/* 38568 8004A948 762A0108 */  j          .L8004A9D8
/* 3856C 8004A94C 00000000 */   nop
.L8004A950:
/* 38570 8004A950 0980023C */  lui        $v0, %hi(D_8008D754)
/* 38574 8004A954 54D7428C */  lw         $v0, %lo(D_8008D754)($v0)
/* 38578 8004A958 00000000 */  nop
/* 3857C 8004A95C 06004394 */  lhu        $v1, 0x6($v0)
/* 38580 8004A960 0880023C */  lui        $v0, %hi(D_80086E86)
/* 38584 8004A964 866E43A4 */  sh         $v1, %lo(D_80086E86)($v0)
.L8004A968:
/* 38588 8004A968 010F010C */  jal        DECOMP_QueueLoadTrack_GetMenuPtr
/* 3858C 8004A96C 00000000 */   nop
.L8004A970:
/* 38590 8004A970 B80982AF */  sw         $v0, 0x9B8($gp) /* Failed to symbolize address 0x000009B8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 38594 8004A974 762A0108 */  j          .L8004A9D8
/* 38598 8004A978 00000000 */   nop
.L8004A97C:
/* 3859C 8004A97C 3822010C */  jal        SelectProfile_Destroy
/* 385A0 8004A980 00000000 */   nop
/* 385A4 8004A984 AC098287 */  lh         $v0, 0x9AC($gp) /* Failed to symbolize address 0x000009AC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 385A8 8004A988 00000000 */  nop
/* 385AC 8004A98C 09004010 */  beqz       $v0, .L8004A9B4
/* 385B0 8004A990 FFF6053C */   lui       $a1, (0xF6FFFFFF >> 16)
/* 385B4 8004A994 90098287 */  lh         $v0, 0x990($gp) /* Failed to symbolize address 0x00000990 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 385B8 8004A998 00000000 */  nop
/* 385BC 8004A99C 03004010 */  beqz       $v0, .L8004A9AC
/* 385C0 8004A9A0 0880023C */   lui       $v0, %hi(D_80085A68)
/* 385C4 8004A9A4 5C2A0108 */  j          .L8004A970
/* 385C8 8004A9A8 685A4224 */   addiu     $v0, $v0, %lo(D_80085A68)
.L8004A9AC:
/* 385CC 8004A9AC 742A0108 */  j          .L8004A9D0
/* 385D0 8004A9B0 21208002 */   addu      $a0, $s4, $zero
.L8004A9B4:
/* 385D4 8004A9B4 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 385D8 8004A9B8 ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 385DC 8004A9BC FFFFA534 */  ori        $a1, $a1, (0xF6FFFFFF & 0xFFFF)
/* 385E0 8004A9C0 441D628C */  lw         $v0, 0x1D44($v1)
/* 385E4 8004A9C4 21208002 */  addu       $a0, $s4, $zero
/* 385E8 8004A9C8 24104500 */  and        $v0, $v0, $a1
/* 385EC 8004A9CC 441D62AC */  sw         $v0, 0x1D44($v1)
.L8004A9D0:
/* 385F0 8004A9D0 721A010C */  jal        DECOMP_RECTMENU_Hide
/* 385F4 8004A9D4 00000000 */   nop
.L8004A9D8:
/* 385F8 8004A9D8 7400BF8F */  lw         $ra, 0x74($sp)
/* 385FC 8004A9DC 7000BE8F */  lw         $fp, 0x70($sp)
/* 38600 8004A9E0 6C00B78F */  lw         $s7, 0x6C($sp)
/* 38604 8004A9E4 6800B68F */  lw         $s6, 0x68($sp)
/* 38608 8004A9E8 6400B58F */  lw         $s5, 0x64($sp)
/* 3860C 8004A9EC 6000B48F */  lw         $s4, 0x60($sp)
/* 38610 8004A9F0 5C00B38F */  lw         $s3, 0x5C($sp)
/* 38614 8004A9F4 5800B28F */  lw         $s2, 0x58($sp)
/* 38618 8004A9F8 5400B18F */  lw         $s1, 0x54($sp)
/* 3861C 8004A9FC 5000B08F */  lw         $s0, 0x50($sp)
/* 38620 8004AA00 0800E003 */  jr         $ra
/* 38624 8004AA04 7800BD27 */   addiu     $sp, $sp, 0x78
.size SelectProfile_AllProfiles_MenuProc, . - SelectProfile_AllProfiles_MenuProc
