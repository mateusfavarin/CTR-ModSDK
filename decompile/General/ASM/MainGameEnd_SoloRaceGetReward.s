.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel MainGameEnd_SoloRaceGetReward
/* 27BC8 80039FA8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 27BCC 80039FAC 21308000 */  addu       $a2, $a0, $zero
/* 27BD0 80039FB0 4003838F */  lw         $v1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 27BD4 80039FB4 FF7B053C */  lui        $a1, (0x7BFFFFFF >> 16)
/* 27BD8 80039FB8 1000BFAF */  sw         $ra, 0x10($sp)
/* 27BDC 80039FBC 2C1B628C */  lw         $v0, 0x1B2C($v1)
/* 27BE0 80039FC0 FFFFA534 */  ori        $a1, $a1, (0x7BFFFFFF & 0xFFFF)
/* 27BE4 80039FC4 30004B8C */  lw         $t3, 0x30($v0)
/* 27BE8 80039FC8 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 27BEC 80039FCC 491D62A0 */  sb         $v0, 0x1D49($v1)
/* 27BF0 80039FD0 441D628C */  lw         $v0, 0x1D44($v1)
/* 27BF4 80039FD4 4003848F */  lw         $a0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 27BF8 80039FD8 24104500 */  and        $v0, $v0, $a1
/* 27BFC 80039FDC 441D62AC */  sw         $v0, 0x1D44($v1)
/* 27C00 80039FE0 EC24828C */  lw         $v0, 0x24EC($a0)
/* 27C04 80039FE4 00000000 */  nop
/* 27C08 80039FE8 32004380 */  lb         $v1, 0x32($v0)
/* 27C0C 80039FEC 2C1E828C */  lw         $v0, 0x1E2C($a0)
/* 27C10 80039FF0 00000000 */  nop
/* 27C14 80039FF4 04006214 */  bne        $v1, $v0, .L8003A008
/* 27C18 80039FF8 21280000 */   addu      $a1, $zero, $zero
/* 27C1C 80039FFC 0200C010 */  beqz       $a2, .L8003A008
/* 27C20 8003A000 00000000 */   nop
/* 27C24 8003A004 80250524 */  addiu      $a1, $zero, 0x2580
.L8003A008:
/* 27C28 8003A008 4003848F */  lw         $a0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 27C2C 8003A00C 21300000 */  addu       $a2, $zero, $zero
/* 27C30 8003A010 EC24828C */  lw         $v0, 0x24EC($a0)
/* 27C34 8003A014 0980033C */  lui        $v1, %hi(D_8008D738)
/* 27C38 8003A018 38D7638C */  lw         $v1, %lo(D_8008D738)($v1)
/* 27C3C 8003A01C 1405428C */  lw         $v0, 0x514($v0)
/* 27C40 8003A020 18006724 */  addiu      $a3, $v1, 0x18
/* 27C44 8003A024 23284500 */  subu       $a1, $v0, $a1
/* 27C48 8003A028 00140600 */  sll        $v0, $a2, 16
.L8003A02C:
/* 27C4C 8003A02C 03140200 */  sra        $v0, $v0, 16
/* 27C50 8003A030 40180200 */  sll        $v1, $v0, 1
/* 27C54 8003A034 21186200 */  addu       $v1, $v1, $v0
/* 27C58 8003A038 C0180300 */  sll        $v1, $v1, 3
/* 27C5C 8003A03C 21186700 */  addu       $v1, $v1, $a3
/* 27C60 8003A040 0000628C */  lw         $v0, 0x0($v1)
/* 27C64 8003A044 00000000 */  nop
/* 27C68 8003A048 2A10A200 */  slt        $v0, $a1, $v0
/* 27C6C 8003A04C 60004014 */  bnez       $v0, .L8003A1D0
/* 27C70 8003A050 0100C224 */   addiu     $v0, $a2, 0x1
/* 27C74 8003A054 21304000 */  addu       $a2, $v0, $zero
/* 27C78 8003A058 00140200 */  sll        $v0, $v0, 16
/* 27C7C 8003A05C 03140200 */  sra        $v0, $v0, 16
/* 27C80 8003A060 05004228 */  slti       $v0, $v0, 0x5
/* 27C84 8003A064 F1FF4014 */  bnez       $v0, .L8003A02C
/* 27C88 8003A068 00140600 */   sll       $v0, $a2, 16
.L8003A06C:
/* 27C8C 8003A06C 0980023C */  lui        $v0, %hi(D_8008D738)
/* 27C90 8003A070 38D7428C */  lw         $v0, %lo(D_8008D738)($v0)
/* 27C94 8003A074 4003848F */  lw         $a0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 27C98 8003A078 0000428C */  lw         $v0, 0x0($v0)
/* 27C9C 8003A07C 331D8380 */  lb         $v1, 0x1D33($a0)
/* 27CA0 8003A080 21300000 */  addu       $a2, $zero, $zero
/* 27CA4 8003A084 19006018 */  blez       $v1, .L8003A0EC
/* 27CA8 8003A088 3C1D82AC */   sw        $v0, 0x1D3C($a0)
/* 27CAC 8003A08C 008C073C */  lui        $a3, (0x8C000000 >> 16)
/* 27CB0 8003A090 00140600 */  sll        $v0, $a2, 16
.L8003A094:
/* 27CB4 8003A094 032C0200 */  sra        $a1, $v0, 16
/* 27CB8 8003A098 80100500 */  sll        $v0, $a1, 2
/* 27CBC 8003A09C 21108200 */  addu       $v0, $a0, $v0
/* 27CC0 8003A0A0 141D438C */  lw         $v1, 0x1D14($v0)
/* 27CC4 8003A0A4 3C1D828C */  lw         $v0, 0x1D3C($a0)
/* 27CC8 8003A0A8 00000000 */  nop
/* 27CCC 8003A0AC 2A106200 */  slt        $v0, $v1, $v0
/* 27CD0 8003A0B0 07004010 */  beqz       $v0, .L8003A0D0
/* 27CD4 8003A0B4 0100C224 */   addiu     $v0, $a2, 0x1
/* 27CD8 8003A0B8 441D828C */  lw         $v0, 0x1D44($a0)
/* 27CDC 8003A0BC 3C1D83AC */  sw         $v1, 0x1D3C($a0)
/* 27CE0 8003A0C0 401D85AC */  sw         $a1, 0x1D40($a0)
/* 27CE4 8003A0C4 25104700 */  or         $v0, $v0, $a3
/* 27CE8 8003A0C8 441D82AC */  sw         $v0, 0x1D44($a0)
/* 27CEC 8003A0CC 0100C224 */  addiu      $v0, $a2, 0x1
.L8003A0D0:
/* 27CF0 8003A0D0 21304000 */  addu       $a2, $v0, $zero
/* 27CF4 8003A0D4 00140200 */  sll        $v0, $v0, 16
/* 27CF8 8003A0D8 331D8380 */  lb         $v1, 0x1D33($a0)
/* 27CFC 8003A0DC 03140200 */  sra        $v0, $v0, 16
/* 27D00 8003A0E0 2A104300 */  slt        $v0, $v0, $v1
/* 27D04 8003A0E4 EBFF4014 */  bnez       $v0, .L8003A094
/* 27D08 8003A0E8 00140600 */   sll       $v0, $a2, 16
.L8003A0EC:
/* 27D0C 8003A0EC 4003868F */  lw         $a2, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 27D10 8003A0F0 00000000 */  nop
/* 27D14 8003A0F4 0000C28C */  lw         $v0, 0x0($a2)
/* 27D18 8003A0F8 0200033C */  lui        $v1, (0x20000 >> 16)
/* 27D1C 8003A0FC 24104300 */  and        $v0, $v0, $v1
/* 27D20 8003A100 68004010 */  beqz       $v0, .L8003A2A4
/* 27D24 8003A104 00000000 */   nop
/* 27D28 8003A108 441DC38C */  lw         $v1, 0x1D44($a2)
/* 27D2C 8003A10C 00000000 */  nop
/* 27D30 8003A110 04006230 */  andi       $v0, $v1, 0x4
/* 27D34 8003A114 63004014 */  bnez       $v0, .L8003A2A4
/* 27D38 8003A118 04006234 */   ori       $v0, $v1, 0x4
/* 27D3C 8003A11C 0980033C */  lui        $v1, %hi(D_8008E6E8)
/* 27D40 8003A120 441DC2AC */  sw         $v0, 0x1D44($a2)
/* 27D44 8003A124 0880023C */  lui        $v0, %hi(D_8008453C)
/* 27D48 8003A128 E8E66924 */  addiu      $t1, $v1, %lo(D_8008E6E8)
/* 27D4C 8003A12C 3C454494 */  lhu        $a0, %lo(D_8008453C)($v0)
/* 27D50 8003A130 101AC58C */  lw         $a1, 0x1A10($a2)
/* 27D54 8003A134 001C0400 */  sll        $v1, $a0, 16
/* 27D58 8003A138 431D0300 */  sra        $v1, $v1, 21
/* 27D5C 8003A13C 80180300 */  sll        $v1, $v1, 2
/* 27D60 8003A140 C0100500 */  sll        $v0, $a1, 3
/* 27D64 8003A144 21104500 */  addu       $v0, $v0, $a1
/* 27D68 8003A148 C0100200 */  sll        $v0, $v0, 3
/* 27D6C 8003A14C 21104500 */  addu       $v0, $v0, $a1
/* 27D70 8003A150 80380200 */  sll        $a3, $v0, 2
/* 27D74 8003A154 21186700 */  addu       $v1, $v1, $a3
/* 27D78 8003A158 21506900 */  addu       $t2, $v1, $t1
/* 27D7C 8003A15C 2C01488D */  lw         $t0, 0x12C($t2)
/* 27D80 8003A160 1F008430 */  andi       $a0, $a0, 0x1F
/* 27D84 8003A164 06108800 */  srlv       $v0, $t0, $a0
/* 27D88 8003A168 01004230 */  andi       $v0, $v0, 0x1
/* 27D8C 8003A16C 1E004010 */  beqz       $v0, .L8003A1E8
/* 27D90 8003A170 00000000 */   nop
/* 27D94 8003A174 1405628D */  lw         $v0, 0x514($t3)
/* 27D98 8003A178 781DC38C */  lw         $v1, 0x1D78($a2)
/* 27D9C 8003A17C 00000000 */  nop
/* 27DA0 8003A180 2A104300 */  slt        $v0, $v0, $v1
/* 27DA4 8003A184 3D004010 */  beqz       $v0, .L8003A27C
/* 27DA8 8003A188 0880023C */   lui       $v0, %hi(D_80084540)
/* 27DAC 8003A18C 40454594 */  lhu        $a1, %lo(D_80084540)($v0)
/* 27DB0 8003A190 01000324 */  addiu      $v1, $zero, 0x1
/* 27DB4 8003A194 00140500 */  sll        $v0, $a1, 16
/* 27DB8 8003A198 43150200 */  sra        $v0, $v0, 21
/* 27DBC 8003A19C 80100200 */  sll        $v0, $v0, 2
/* 27DC0 8003A1A0 21104700 */  addu       $v0, $v0, $a3
/* 27DC4 8003A1A4 21104900 */  addu       $v0, $v0, $t1
/* 27DC8 8003A1A8 1F00A530 */  andi       $a1, $a1, 0x1F
/* 27DCC 8003A1AC 2C01448C */  lw         $a0, 0x12C($v0)
/* 27DD0 8003A1B0 0418A300 */  sllv       $v1, $v1, $a1
/* 27DD4 8003A1B4 25208300 */  or         $a0, $a0, $v1
/* 27DD8 8003A1B8 0880033C */  lui        $v1, %hi(D_80084544)
/* 27DDC 8003A1BC 2C0144AC */  sw         $a0, 0x12C($v0)
/* 27DE0 8003A1C0 441DC28C */  lw         $v0, 0x1D44($a2)
/* 27DE4 8003A1C4 4445638C */  lw         $v1, %lo(D_80084544)($v1)
/* 27DE8 8003A1C8 9EE80008 */  j          .L8003A278
/* 27DEC 8003A1CC 25104300 */   or        $v0, $v0, $v1
.L8003A1D0:
/* 27DF0 8003A1D0 441D828C */  lw         $v0, 0x1D44($a0)
/* 27DF4 8003A1D4 0088033C */  lui        $v1, (0x88000000 >> 16)
/* 27DF8 8003A1D8 491D86A0 */  sb         $a2, 0x1D49($a0)
/* 27DFC 8003A1DC 25104300 */  or         $v0, $v0, $v1
/* 27E00 8003A1E0 1BE80008 */  j          .L8003A06C
/* 27E04 8003A1E4 441D82AC */   sw        $v0, 0x1D44($a0)
.L8003A1E8:
/* 27E08 8003A1E8 2148E900 */  addu       $t1, $a3, $t1
/* 27E0C 8003A1EC 2C01278D */  lw         $a3, 0x12C($t1)
/* 27E10 8003A1F0 00000000 */  nop
/* 27E14 8003A1F4 0100E230 */  andi       $v0, $a3, 0x1
/* 27E18 8003A1F8 0F004010 */  beqz       $v0, .L8003A238
/* 27E1C 8003A1FC 0880033C */   lui       $v1, %hi(D_80083A80)
/* 27E20 8003A200 1405628D */  lw         $v0, 0x514($t3)
/* 27E24 8003A204 781DC38C */  lw         $v1, 0x1D78($a2)
/* 27E28 8003A208 00000000 */  nop
/* 27E2C 8003A20C 2A104300 */  slt        $v0, $v0, $v1
/* 27E30 8003A210 1A004010 */  beqz       $v0, .L8003A27C
/* 27E34 8003A214 01000224 */   addiu     $v0, $zero, 0x1
/* 27E38 8003A218 04108200 */  sllv       $v0, $v0, $a0
/* 27E3C 8003A21C 25100201 */  or         $v0, $t0, $v0
/* 27E40 8003A220 0880033C */  lui        $v1, %hi(D_80084548)
/* 27E44 8003A224 2C0142AD */  sw         $v0, 0x12C($t2)
/* 27E48 8003A228 441DC28C */  lw         $v0, 0x1D44($a2)
/* 27E4C 8003A22C 4845638C */  lw         $v1, %lo(D_80084548)($v1)
/* 27E50 8003A230 9EE80008 */  j          .L8003A278
/* 27E54 8003A234 25104300 */   or        $v0, $v0, $v1
.L8003A238:
/* 27E58 8003A238 803A6324 */  addiu      $v1, $v1, %lo(D_80083A80)
/* 27E5C 8003A23C 40100500 */  sll        $v0, $a1, 1
/* 27E60 8003A240 21104500 */  addu       $v0, $v0, $a1
/* 27E64 8003A244 C0100200 */  sll        $v0, $v0, 3
/* 27E68 8003A248 21104300 */  addu       $v0, $v0, $v1
/* 27E6C 8003A24C 1405638D */  lw         $v1, 0x514($t3)
/* 27E70 8003A250 0C00428C */  lw         $v0, 0xC($v0)
/* 27E74 8003A254 00000000 */  nop
/* 27E78 8003A258 2A186200 */  slt        $v1, $v1, $v0
/* 27E7C 8003A25C 07006010 */  beqz       $v1, .L8003A27C
/* 27E80 8003A260 0008033C */   lui       $v1, (0x8008000 >> 16)
/* 27E84 8003A264 0100E234 */  ori        $v0, $a3, 0x1
/* 27E88 8003A268 2C0122AD */  sw         $v0, 0x12C($t1)
/* 27E8C 8003A26C 441DC28C */  lw         $v0, 0x1D44($a2)
/* 27E90 8003A270 00806334 */  ori        $v1, $v1, (0x8008000 & 0xFFFF)
/* 27E94 8003A274 25104300 */  or         $v0, $v0, $v1
.L8003A278:
/* 27E98 8003A278 441DC2AC */  sw         $v0, 0x1D44($a2)
.L8003A27C:
/* 27E9C 8003A27C B99A000C */  jal        DECOMP_GAMEPROG_CheckGhostsBeaten
/* 27EA0 8003A280 02000424 */   addiu     $a0, $zero, 0x2
/* 27EA4 8003A284 00140200 */  sll        $v0, $v0, 16
/* 27EA8 8003A288 06004010 */  beqz       $v0, .L8003A2A4
/* 27EAC 8003A28C 0980033C */   lui       $v1, %hi(D_8008E6E8)
/* 27EB0 8003A290 E8E66324 */  addiu      $v1, $v1, %lo(D_8008E6E8)
/* 27EB4 8003A294 0800628C */  lw         $v0, 0x8($v1)
/* 27EB8 8003A298 00000000 */  nop
/* 27EBC 8003A29C 10004234 */  ori        $v0, $v0, 0x10
/* 27EC0 8003A2A0 080062AC */  sw         $v0, 0x8($v1)
.L8003A2A4:
/* 27EC4 8003A2A4 1000BF8F */  lw         $ra, 0x10($sp)
/* 27EC8 8003A2A8 00000000 */  nop
/* 27ECC 8003A2AC 0800E003 */  jr         $ra
/* 27ED0 8003A2B0 1800BD27 */   addiu     $sp, $sp, 0x18
.size MainGameEnd_SoloRaceGetReward, . - MainGameEnd_SoloRaceGetReward
