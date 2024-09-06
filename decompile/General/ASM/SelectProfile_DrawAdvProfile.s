.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel SelectProfile_DrawAdvProfile
/* 35C18 80047FF8 78FFBD27 */  addiu      $sp, $sp, -0x88
/* 35C1C 80047FFC 9800A897 */  lhu        $t0, 0x98($sp)
/* 35C20 80048000 9C00A28F */  lw         $v0, 0x9C($sp)
/* 35C24 80048004 6400B1AF */  sw         $s1, 0x64($sp)
/* 35C28 80048008 21888000 */  addu       $s1, $a0, $zero
/* 35C2C 8004800C 7C00B7AF */  sw         $s7, 0x7C($sp)
/* 35C30 80048010 21B8A000 */  addu       $s7, $a1, $zero
/* 35C34 80048014 8000BEAF */  sw         $fp, 0x80($sp)
/* 35C38 80048018 21F0C000 */  addu       $fp, $a2, $zero
/* 35C3C 8004801C 8400BFAF */  sw         $ra, 0x84($sp)
/* 35C40 80048020 7800B6AF */  sw         $s6, 0x78($sp)
/* 35C44 80048024 7400B5AF */  sw         $s5, 0x74($sp)
/* 35C48 80048028 7000B4AF */  sw         $s4, 0x70($sp)
/* 35C4C 8004802C 6C00B3AF */  sw         $s3, 0x6C($sp)
/* 35C50 80048030 6800B2AF */  sw         $s2, 0x68($sp)
/* 35C54 80048034 6000B0AF */  sw         $s0, 0x60($sp)
/* 35C58 80048038 4800A7A7 */  sh         $a3, 0x48($sp)
/* 35C5C 8004803C 5800A2A7 */  sh         $v0, 0x58($sp)
/* 35C60 80048040 10004230 */  andi       $v0, $v0, 0x10
/* 35C64 80048044 06004010 */  beqz       $v0, .L80048060
/* 35C68 80048048 5000A8A7 */   sh        $t0, 0x50($sp)
/* 35C6C 8004804C 1D001324 */  addiu      $s3, $zero, 0x1D
/* 35C70 80048050 1E001024 */  addiu      $s0, $zero, 0x1E
/* 35C74 80048054 21906002 */  addu       $s2, $s3, $zero
/* 35C78 80048058 1C200108 */  j          .L80048070
/* 35C7C 8004805C 21B06002 */   addu      $s6, $s3, $zero
.L80048060:
/* 35C80 80048060 21980000 */  addu       $s3, $zero, $zero
/* 35C84 80048064 03001024 */  addiu      $s0, $zero, 0x3
/* 35C88 80048068 01001224 */  addiu      $s2, $zero, 0x1
/* 35C8C 8004806C 04001624 */  addiu      $s6, $zero, 0x4
.L80048070:
/* 35C90 80048070 5000A997 */  lhu        $t1, 0x50($sp)
/* 35C94 80048074 21202002 */  addu       $a0, $s1, $zero
/* 35C98 80048078 00140900 */  sll        $v0, $t1, 16
/* 35C9C 8004807C 03140200 */  sra        $v0, $v0, 16
/* 35CA0 80048080 40180200 */  sll        $v1, $v0, 1
/* 35CA4 80048084 21186200 */  addu       $v1, $v1, $v0
/* 35CA8 80048088 7099000C */  jal        DECOMP_GAMEPROG_AdvPercent
/* 35CAC 8004808C 5000A3A7 */   sh        $v1, 0x50($sp)
/* 35CB0 80048090 2A002286 */  lh         $v0, 0x2A($s1)
/* 35CB4 80048094 00000000 */  nop
/* 35CB8 80048098 FD004004 */  bltz       $v0, .L80048490
/* 35CBC 8004809C 6C00E526 */   addiu     $a1, $s7, 0x6C
/* 35CC0 800480A0 5800AA97 */  lhu        $t2, 0x58($sp)
/* 35CC4 800480A4 00000000 */  nop
/* 35CC8 800480A8 10004231 */  andi       $v0, $t2, 0x10
/* 35CCC 800480AC 0A004010 */  beqz       $v0, .L800480D8
/* 35CD0 800480B0 00AC1700 */   sll       $s5, $s7, 16
/* 35CD4 800480B4 09800A3C */  lui        $t2, %hi(D_8008D494)
/* 35CD8 800480B8 94D44A25 */  addiu      $t2, $t2, %lo(D_8008D494)
/* 35CDC 800480BC 03004B89 */  lwl        $t3, 0x3($t2)
/* 35CE0 800480C0 00004B99 */  lwr        $t3, 0x0($t2)
/* 35CE4 800480C4 00000000 */  nop
/* 35CE8 800480C8 3300ABAB */  swl        $t3, 0x33($sp)
/* 35CEC 800480CC 3000ABBB */  swr        $t3, 0x30($sp)
/* 35CF0 800480D0 3E200108 */  j          .L800480F8
/* 35CF4 800480D4 03AC1500 */   sra       $s5, $s5, 16
.L800480D8:
/* 35CF8 800480D8 09800A3C */  lui        $t2, %hi(D_8008D490)
/* 35CFC 800480DC 90D44A25 */  addiu      $t2, $t2, %lo(D_8008D490)
/* 35D00 800480E0 03004B89 */  lwl        $t3, 0x3($t2)
/* 35D04 800480E4 00004B99 */  lwr        $t3, 0x0($t2)
/* 35D08 800480E8 00000000 */  nop
/* 35D0C 800480EC 3300ABAB */  swl        $t3, 0x33($sp)
/* 35D10 800480F0 3000ABBB */  swr        $t3, 0x30($sp)
/* 35D14 800480F4 03AC1500 */  sra        $s5, $s5, 16
.L800480F8:
/* 35D18 800480F8 0A00A526 */  addiu      $a1, $s5, 0xA
/* 35D1C 800480FC 0880023C */  lui        $v0, %hi(D_80086D84)
/* 35D20 80048100 846D4224 */  addiu      $v0, $v0, %lo(D_80086D84)
/* 35D24 80048104 00A41E00 */  sll        $s4, $fp, 16
/* 35D28 80048108 03A41400 */  sra        $s4, $s4, 16
/* 35D2C 8004810C 2A002386 */  lh         $v1, 0x2A($s1)
/* 35D30 80048110 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 35D34 80048114 ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 35D38 80048118 00190300 */  sll        $v1, $v1, 4
/* 35D3C 8004811C 21186200 */  addu       $v1, $v1, $v0
/* 35D40 80048120 08006384 */  lh         $v1, 0x8($v1)
/* 35D44 80048124 1000878C */  lw         $a3, 0x10($a0)
/* 35D48 80048128 7C14828C */  lw         $v0, 0x147C($a0)
/* 35D4C 8004812C 06008626 */  addiu      $a2, $s4, 0x6
/* 35D50 80048130 1000A2AF */  sw         $v0, 0x10($sp)
/* 35D54 80048134 01000224 */  addiu      $v0, $zero, 0x1
/* 35D58 80048138 3300AB8B */  lwl        $t3, 0x33($sp)
/* 35D5C 8004813C 3000AB9B */  lwr        $t3, 0x30($sp)
/* 35D60 80048140 00000000 */  nop
/* 35D64 80048144 1700ABAB */  swl        $t3, 0x17($sp)
/* 35D68 80048148 1400ABBB */  swr        $t3, 0x14($sp)
/* 35D6C 8004814C 3300AB8B */  lwl        $t3, 0x33($sp)
/* 35D70 80048150 3000AB9B */  lwr        $t3, 0x30($sp)
/* 35D74 80048154 00000000 */  nop
/* 35D78 80048158 1B00ABAB */  swl        $t3, 0x1B($sp)
/* 35D7C 8004815C 1800ABBB */  swr        $t3, 0x18($sp)
/* 35D80 80048160 3300AB8B */  lwl        $t3, 0x33($sp)
/* 35D84 80048164 3000AB9B */  lwr        $t3, 0x30($sp)
/* 35D88 80048168 00000000 */  nop
/* 35D8C 8004816C 1F00ABAB */  swl        $t3, 0x1F($sp)
/* 35D90 80048170 1C00ABBB */  swr        $t3, 0x1C($sp)
/* 35D94 80048174 3300AB8B */  lwl        $t3, 0x33($sp)
/* 35D98 80048178 3000AB9B */  lwr        $t3, 0x30($sp)
/* 35D9C 8004817C 00000000 */  nop
/* 35DA0 80048180 2300ABAB */  swl        $t3, 0x23($sp)
/* 35DA4 80048184 2000ABBB */  swr        $t3, 0x20($sp)
/* 35DA8 80048188 2400A2AF */  sw         $v0, 0x24($sp)
/* 35DAC 8004818C 00100224 */  addiu      $v0, $zero, 0x1000
/* 35DB0 80048190 80180300 */  sll        $v1, $v1, 2
/* 35DB4 80048194 21208300 */  addu       $a0, $a0, $v1
/* 35DB8 80048198 2800A2AF */  sw         $v0, 0x28($sp)
/* 35DBC 8004819C EC1E848C */  lw         $a0, 0x1EEC($a0)
/* 35DC0 800481A0 BE13010C */  jal        DECOMP_RECTMENU_DrawPolyGT4
/* 35DC4 800481A4 7400E724 */   addiu     $a3, $a3, 0x74
/* 35DC8 800481A8 18002426 */  addiu      $a0, $s1, 0x18
/* 35DCC 800481AC 6C00E526 */  addiu      $a1, $s7, 0x6C
/* 35DD0 800481B0 002C0500 */  sll        $a1, $a1, 16
/* 35DD4 800481B4 032C0500 */  sra        $a1, $a1, 16
/* 35DD8 800481B8 2900C627 */  addiu      $a2, $fp, 0x29
/* 35DDC 800481BC 00340600 */  sll        $a2, $a2, 16
/* 35DE0 800481C0 03340600 */  sra        $a2, $a2, 16
/* 35DE4 800481C4 01000724 */  addiu      $a3, $zero, 0x1
/* 35DE8 800481C8 00800224 */  addiu      $v0, $zero, -0x8000
/* 35DEC 800481CC 25104202 */  or         $v0, $s2, $v0
/* 35DF0 800481D0 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 35DF4 800481D4 1000A2AF */   sw        $v0, 0x10($sp)
/* 35DF8 800481D8 6A00F026 */  addiu      $s0, $s7, 0x6A
/* 35DFC 800481DC 00841000 */  sll        $s0, $s0, 16
/* 35E00 800481E0 03841000 */  sra        $s0, $s0, 16
/* 35E04 800481E4 21280002 */  addu       $a1, $s0, $zero
/* 35E08 800481E8 1700D227 */  addiu      $s2, $fp, 0x17
/* 35E0C 800481EC 00941200 */  sll        $s2, $s2, 16
/* 35E10 800481F0 03941200 */  sra        $s2, $s2, 16
/* 35E14 800481F4 21304002 */  addu       $a2, $s2, $zero
/* 35E18 800481F8 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 35E1C 800481FC ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 35E20 80048200 00407336 */  ori        $s3, $s3, 0x4000
/* 35E24 80048204 1000B3AF */  sw         $s3, 0x10($sp)
/* 35E28 80048208 541E448C */  lw         $a0, 0x1E54($v0)
/* 35E2C 8004820C C81F010C */  jal        SelectProfile_PrintInteger
/* 35E30 80048210 21380000 */   addu      $a3, $zero, $zero
/* 35E34 80048214 21280002 */  addu       $a1, $s0, $zero
/* 35E38 80048218 0500D127 */  addiu      $s1, $fp, 0x5
/* 35E3C 8004821C 008C1100 */  sll        $s1, $s1, 16
/* 35E40 80048220 038C1100 */  sra        $s1, $s1, 16
/* 35E44 80048224 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 35E48 80048228 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 35E4C 8004822C 21302002 */  addu       $a2, $s1, $zero
/* 35E50 80048230 1000B3AF */  sw         $s3, 0x10($sp)
/* 35E54 80048234 301E448C */  lw         $a0, 0x1E30($v0)
/* 35E58 80048238 C81F010C */  jal        SelectProfile_PrintInteger
/* 35E5C 8004823C 21380000 */   addu      $a3, $zero, $zero
/* 35E60 80048240 B500F026 */  addiu      $s0, $s7, 0xB5
/* 35E64 80048244 00841000 */  sll        $s0, $s0, 16
/* 35E68 80048248 03841000 */  sra        $s0, $s0, 16
/* 35E6C 8004824C 21280002 */  addu       $a1, $s0, $zero
/* 35E70 80048250 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 35E74 80048254 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 35E78 80048258 21302002 */  addu       $a2, $s1, $zero
/* 35E7C 8004825C 1000B3AF */  sw         $s3, 0x10($sp)
/* 35E80 80048260 381E448C */  lw         $a0, 0x1E38($v0)
/* 35E84 80048264 C81F010C */  jal        SelectProfile_PrintInteger
/* 35E88 80048268 21380000 */   addu      $a3, $zero, $zero
/* 35E8C 8004826C 21280002 */  addu       $a1, $s0, $zero
/* 35E90 80048270 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 35E94 80048274 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 35E98 80048278 21304002 */  addu       $a2, $s2, $zero
/* 35E9C 8004827C 1000B3AF */  sw         $s3, 0x10($sp)
/* 35EA0 80048280 341E448C */  lw         $a0, 0x1E34($v0)
/* 35EA4 80048284 C81F010C */  jal        SelectProfile_PrintInteger
/* 35EA8 80048288 21380000 */   addu      $a3, $zero, $zero
/* 35EAC 8004828C 0980043C */  lui        $a0, %hi(D_8008D498)
/* 35EB0 80048290 98D48424 */  addiu      $a0, $a0, %lo(D_8008D498)
/* 35EB4 80048294 7000E526 */  addiu      $a1, $s7, 0x70
/* 35EB8 80048298 002C0500 */  sll        $a1, $a1, 16
/* 35EBC 8004829C 032C0500 */  sra        $a1, $a1, 16
/* 35EC0 800482A0 21304002 */  addu       $a2, $s2, $zero
/* 35EC4 800482A4 01000724 */  addiu      $a3, $zero, 0x1
/* 35EC8 800482A8 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 35ECC 800482AC 1000B6AF */   sw        $s6, 0x10($sp)
/* 35ED0 800482B0 C300B626 */  addiu      $s6, $s5, 0xC3
/* 35ED4 800482B4 2120C002 */  addu       $a0, $s6, $zero
/* 35ED8 800482B8 EE1F010C */  jal        SelectProfile_UI_ConvertX
/* 35EDC 800482BC 00010524 */   addiu     $a1, $zero, 0x100
/* 35EE0 800482C0 1F008426 */  addiu      $a0, $s4, 0x1F
/* 35EE4 800482C4 5000AB97 */  lhu        $t3, 0x50($sp)
/* 35EE8 800482C8 8809858F */  lw         $a1, 0x988($gp) /* Failed to symbolize address 0x00000988 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 35EEC 800482CC 001C0B00 */  sll        $v1, $t3, 16
/* 35EF0 800482D0 031C0300 */  sra        $v1, $v1, 16
/* 35EF4 800482D4 40800300 */  sll        $s0, $v1, 1
/* 35EF8 800482D8 21800302 */  addu       $s0, $s0, $v1
/* 35EFC 800482DC 0400A38C */  lw         $v1, 0x4($a1)
/* 35F00 800482E0 80801000 */  sll        $s0, $s0, 2
/* 35F04 800482E4 21180302 */  addu       $v1, $s0, $v1
/* 35F08 800482E8 0000638C */  lw         $v1, 0x0($v1)
/* 35F0C 800482EC 00010524 */  addiu      $a1, $zero, 0x100
/* 35F10 800482F0 F61F010C */  jal        SelectProfile_UI_ConvertY
/* 35F14 800482F4 440062AC */   sw        $v0, 0x44($v1)
/* 35F18 800482F8 8809848F */  lw         $a0, 0x988($gp) /* Failed to symbolize address 0x00000988 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 35F1C 800482FC 00000000 */  nop
/* 35F20 80048300 0400838C */  lw         $v1, 0x4($a0)
/* 35F24 80048304 00000000 */  nop
/* 35F28 80048308 21180302 */  addu       $v1, $s0, $v1
/* 35F2C 8004830C 0000638C */  lw         $v1, 0x0($v1)
/* 35F30 80048310 00000000 */  nop
/* 35F34 80048314 480062AC */  sw         $v0, 0x48($v1)
/* 35F38 80048318 0400828C */  lw         $v0, 0x4($a0)
/* 35F3C 8004831C 00000000 */  nop
/* 35F40 80048320 21100202 */  addu       $v0, $s0, $v0
/* 35F44 80048324 0000428C */  lw         $v0, 0x0($v0)
/* 35F48 80048328 00011324 */  addiu      $s3, $zero, 0x100
/* 35F4C 8004832C 4C0053AC */  sw         $s3, 0x4C($v0)
/* 35F50 80048330 0400828C */  lw         $v0, 0x4($a0)
/* 35F54 80048334 21286002 */  addu       $a1, $s3, $zero
/* 35F58 80048338 21800202 */  addu       $s0, $s0, $v0
/* 35F5C 8004833C 0000038E */  lw         $v1, 0x0($s0)
/* 35F60 80048340 7FFF1224 */  addiu      $s2, $zero, -0x81
/* 35F64 80048344 2800628C */  lw         $v0, 0x28($v1)
/* 35F68 80048348 7800A426 */  addiu      $a0, $s5, 0x78
/* 35F6C 8004834C 24105200 */  and        $v0, $v0, $s2
/* 35F70 80048350 EE1F010C */  jal        SelectProfile_UI_ConvertX
/* 35F74 80048354 280062AC */   sw        $v0, 0x28($v1)
/* 35F78 80048358 0D009426 */  addiu      $s4, $s4, 0xD
/* 35F7C 8004835C 21208002 */  addu       $a0, $s4, $zero
/* 35F80 80048360 5000A897 */  lhu        $t0, 0x50($sp)
/* 35F84 80048364 8809858F */  lw         $a1, 0x988($gp) /* Failed to symbolize address 0x00000988 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 35F88 80048368 01001125 */  addiu      $s1, $t0, 0x1
/* 35F8C 8004836C 001C1100 */  sll        $v1, $s1, 16
/* 35F90 80048370 031C0300 */  sra        $v1, $v1, 16
/* 35F94 80048374 40800300 */  sll        $s0, $v1, 1
/* 35F98 80048378 21800302 */  addu       $s0, $s0, $v1
/* 35F9C 8004837C 0400A38C */  lw         $v1, 0x4($a1)
/* 35FA0 80048380 80801000 */  sll        $s0, $s0, 2
/* 35FA4 80048384 21180302 */  addu       $v1, $s0, $v1
/* 35FA8 80048388 0000638C */  lw         $v1, 0x0($v1)
/* 35FAC 8004838C 21286002 */  addu       $a1, $s3, $zero
/* 35FB0 80048390 F61F010C */  jal        SelectProfile_UI_ConvertY
/* 35FB4 80048394 440062AC */   sw        $v0, 0x44($v1)
/* 35FB8 80048398 8809848F */  lw         $a0, 0x988($gp) /* Failed to symbolize address 0x00000988 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 35FBC 8004839C 00000000 */  nop
/* 35FC0 800483A0 0400838C */  lw         $v1, 0x4($a0)
/* 35FC4 800483A4 00000000 */  nop
/* 35FC8 800483A8 21180302 */  addu       $v1, $s0, $v1
/* 35FCC 800483AC 0000638C */  lw         $v1, 0x0($v1)
/* 35FD0 800483B0 00000000 */  nop
/* 35FD4 800483B4 480062AC */  sw         $v0, 0x48($v1)
/* 35FD8 800483B8 0400828C */  lw         $v0, 0x4($a0)
/* 35FDC 800483BC 00000000 */  nop
/* 35FE0 800483C0 21100202 */  addu       $v0, $s0, $v0
/* 35FE4 800483C4 0000428C */  lw         $v0, 0x0($v0)
/* 35FE8 800483C8 00000000 */  nop
/* 35FEC 800483CC 4C0053AC */  sw         $s3, 0x4C($v0)
/* 35FF0 800483D0 0400828C */  lw         $v0, 0x4($a0)
/* 35FF4 800483D4 00000000 */  nop
/* 35FF8 800483D8 21800202 */  addu       $s0, $s0, $v0
/* 35FFC 800483DC 0000038E */  lw         $v1, 0x0($s0)
/* 36000 800483E0 21286002 */  addu       $a1, $s3, $zero
/* 36004 800483E4 2800628C */  lw         $v0, 0x28($v1)
/* 36008 800483E8 2120C002 */  addu       $a0, $s6, $zero
/* 3600C 800483EC 24105200 */  and        $v0, $v0, $s2
/* 36010 800483F0 EE1F010C */  jal        SelectProfile_UI_ConvertX
/* 36014 800483F4 280062AC */   sw        $v0, 0x28($v1)
/* 36018 800483F8 21208002 */  addu       $a0, $s4, $zero
/* 3601C 800483FC 01003126 */  addiu      $s1, $s1, 0x1
/* 36020 80048400 008C1100 */  sll        $s1, $s1, 16
/* 36024 80048404 038C1100 */  sra        $s1, $s1, 16
/* 36028 80048408 40801100 */  sll        $s0, $s1, 1
/* 3602C 8004840C 8809838F */  lw         $v1, 0x988($gp) /* Failed to symbolize address 0x00000988 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36030 80048410 21801102 */  addu       $s0, $s0, $s1
/* 36034 80048414 0400638C */  lw         $v1, 0x4($v1)
/* 36038 80048418 80801000 */  sll        $s0, $s0, 2
/* 3603C 8004841C 21180302 */  addu       $v1, $s0, $v1
/* 36040 80048420 0000638C */  lw         $v1, 0x0($v1)
/* 36044 80048424 21286002 */  addu       $a1, $s3, $zero
/* 36048 80048428 F61F010C */  jal        SelectProfile_UI_ConvertY
/* 3604C 8004842C 440062AC */   sw        $v0, 0x44($v1)
/* 36050 80048430 8809848F */  lw         $a0, 0x988($gp) /* Failed to symbolize address 0x00000988 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36054 80048434 00000000 */  nop
/* 36058 80048438 0400838C */  lw         $v1, 0x4($a0)
/* 3605C 8004843C 00000000 */  nop
/* 36060 80048440 21180302 */  addu       $v1, $s0, $v1
/* 36064 80048444 0000638C */  lw         $v1, 0x0($v1)
/* 36068 80048448 00000000 */  nop
/* 3606C 8004844C 480062AC */  sw         $v0, 0x48($v1)
/* 36070 80048450 0400828C */  lw         $v0, 0x4($a0)
/* 36074 80048454 00000000 */  nop
/* 36078 80048458 21100202 */  addu       $v0, $s0, $v0
/* 3607C 8004845C 0000428C */  lw         $v0, 0x0($v0)
/* 36080 80048460 00000000 */  nop
/* 36084 80048464 4C0053AC */  sw         $s3, 0x4C($v0)
/* 36088 80048468 0400828C */  lw         $v0, 0x4($a0)
/* 3608C 8004846C 00000000 */  nop
/* 36090 80048470 21800202 */  addu       $s0, $s0, $v0
/* 36094 80048474 0000038E */  lw         $v1, 0x0($s0)
/* 36098 80048478 00000000 */  nop
/* 3609C 8004847C 2800628C */  lw         $v0, 0x28($v1)
/* 360A0 80048480 00000000 */  nop
/* 360A4 80048484 24105200 */  and        $v0, $v0, $s2
/* 360A8 80048488 31210108 */  j          .L800484C4
/* 360AC 8004848C 280062AC */   sw        $v0, 0x28($v1)
.L80048490:
/* 360B0 80048490 002C0500 */  sll        $a1, $a1, 16
/* 360B4 80048494 032C0500 */  sra        $a1, $a1, 16
/* 360B8 80048498 1700C627 */  addiu      $a2, $fp, 0x17
/* 360BC 8004849C 00340600 */  sll        $a2, $a2, 16
/* 360C0 800484A0 03340600 */  sra        $a2, $a2, 16
/* 360C4 800484A4 00800224 */  addiu      $v0, $zero, -0x8000
/* 360C8 800484A8 0980033C */  lui        $v1, %hi(D_8008D878)
/* 360CC 800484AC 78D8638C */  lw         $v1, %lo(D_8008D878)($v1)
/* 360D0 800484B0 25100202 */  or         $v0, $s0, $v0
/* 360D4 800484B4 1000A2AF */  sw         $v0, 0x10($sp)
/* 360D8 800484B8 D402648C */  lw         $a0, 0x2D4($v1)
/* 360DC 800484BC 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 360E0 800484C0 01000724 */   addiu     $a3, $zero, 0x1
.L800484C4:
/* 360E4 800484C4 4800A997 */  lhu        $t1, 0x48($sp)
/* 360E8 800484C8 DC000224 */  addiu      $v0, $zero, 0xDC
/* 360EC 800484CC 3C00A2A7 */  sh         $v0, 0x3C($sp)
/* 360F0 800484D0 3D000224 */  addiu      $v0, $zero, 0x3D
/* 360F4 800484D4 3800B7A7 */  sh         $s7, 0x38($sp)
/* 360F8 800484D8 3A00BEA7 */  sh         $fp, 0x3A($sp)
/* 360FC 800484DC 3E00A2A7 */  sh         $v0, 0x3E($sp)
/* 36100 800484E0 00140900 */  sll        $v0, $t1, 16
/* 36104 800484E4 1B004010 */  beqz       $v0, .L80048554
/* 36108 800484E8 3800A427 */   addiu     $a0, $sp, 0x38
/* 3610C 800484EC 5800AA97 */  lhu        $t2, 0x58($sp)
/* 36110 800484F0 0980053C */  lui        $a1, %hi(D_8008D94C)
/* 36114 800484F4 4CD9A524 */  addiu      $a1, $a1, %lo(D_8008D94C)
/* 36118 800484F8 10004231 */  andi       $v0, $t2, 0x10
/* 3611C 800484FC 03004010 */  beqz       $v0, .L8004850C
/* 36120 80048500 4000A427 */   addiu     $a0, $sp, 0x40
/* 36124 80048504 0980053C */  lui        $a1, %hi(D_8008D948)
/* 36128 80048508 48D9A524 */  addiu      $a1, $a1, %lo(D_8008D948)
.L8004850C:
/* 3612C 8004850C 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 36130 80048510 ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 36134 80048514 0600E226 */  addiu      $v0, $s7, 0x6
/* 36138 80048518 4000A2A7 */  sh         $v0, 0x40($sp)
/* 3613C 8004851C 0400C227 */  addiu      $v0, $fp, 0x4
/* 36140 80048520 4200A2A7 */  sh         $v0, 0x42($sp)
/* 36144 80048524 D0000224 */  addiu      $v0, $zero, 0xD0
/* 36148 80048528 4400A2A7 */  sh         $v0, 0x44($sp)
/* 3614C 8004852C 35000224 */  addiu      $v0, $zero, 0x35
/* 36150 80048530 4600A2A7 */  sh         $v0, 0x46($sp)
/* 36154 80048534 1000628C */  lw         $v0, 0x10($v1)
/* 36158 80048538 01000624 */  addiu      $a2, $zero, 0x1
/* 3615C 8004853C A000478C */  lw         $a3, 0xA0($v0)
/* 36160 80048540 74004224 */  addiu      $v0, $v0, 0x74
/* 36164 80048544 1000A2AF */  sw         $v0, 0x10($sp)
/* 36168 80048548 DF85000C */  jal        DECOMP_CTR_Box_DrawClearBox
/* 3616C 8004854C 0C00E724 */   addiu     $a3, $a3, 0xC
/* 36170 80048550 3800A427 */  addiu      $a0, $sp, 0x38
.L80048554:
/* 36174 80048554 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 36178 80048558 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 3617C 8004855C 5800AB97 */  lhu        $t3, 0x58($sp)
/* 36180 80048560 1000428C */  lw         $v0, 0x10($v0)
/* 36184 80048564 002C0B00 */  sll        $a1, $t3, 16
/* 36188 80048568 A000468C */  lw         $a2, 0xA0($v0)
/* 3618C 8004856C 032C0500 */  sra        $a1, $a1, 16
/* 36190 80048570 EC15010C */  jal        DECOMP_RECTMENU_DrawInnerRect
/* 36194 80048574 0C00C624 */   addiu     $a2, $a2, 0xC
/* 36198 80048578 8400BF8F */  lw         $ra, 0x84($sp)
/* 3619C 8004857C 8000BE8F */  lw         $fp, 0x80($sp)
/* 361A0 80048580 7C00B78F */  lw         $s7, 0x7C($sp)
/* 361A4 80048584 7800B68F */  lw         $s6, 0x78($sp)
/* 361A8 80048588 7400B58F */  lw         $s5, 0x74($sp)
/* 361AC 8004858C 7000B48F */  lw         $s4, 0x70($sp)
/* 361B0 80048590 6C00B38F */  lw         $s3, 0x6C($sp)
/* 361B4 80048594 6800B28F */  lw         $s2, 0x68($sp)
/* 361B8 80048598 6400B18F */  lw         $s1, 0x64($sp)
/* 361BC 8004859C 6000B08F */  lw         $s0, 0x60($sp)
/* 361C0 800485A0 0800E003 */  jr         $ra
/* 361C4 800485A4 8800BD27 */   addiu     $sp, $sp, 0x88
.size SelectProfile_DrawAdvProfile, . - SelectProfile_DrawAdvProfile
