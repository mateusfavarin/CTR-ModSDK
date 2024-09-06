.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel RaceConfig_LoadGameOptions
/* 31830 80043C10 84098287 */  lh         $v0, 0x984($gp) /* Failed to symbolize address 0x00000984 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 31834 80043C14 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 31838 80043C18 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 3183C 80043C1C 1800B2AF */  sw         $s2, 0x18($sp)
/* 31840 80043C20 1400B1AF */  sw         $s1, 0x14($sp)
/* 31844 80043C24 39004014 */  bnez       $v0, .L80043D0C
/* 31848 80043C28 1000B0AF */   sw        $s0, 0x10($sp)
/* 3184C 80043C2C 01000224 */  addiu      $v0, $zero, 0x1
/* 31850 80043C30 840982A7 */  sh         $v0, 0x984($gp) /* Failed to symbolize address 0x00000984 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 31854 80043C34 21800000 */  addu       $s0, $zero, $zero
/* 31858 80043C38 0980023C */  lui        $v0, %hi(D_8008E6E8)
/* 3185C 80043C3C E8E65124 */  addiu      $s1, $v0, %lo(D_8008E6E8)
/* 31860 80043C40 0880123C */  lui        $s2, %hi(D_800841FC)
.L80043C44:
/* 31864 80043C44 00241000 */  sll        $a0, $s0, 16
/* 31868 80043C48 03240400 */  sra        $a0, $a0, 16
/* 3186C 80043C4C 40100400 */  sll        $v0, $a0, 1
/* 31870 80043C50 21105100 */  addu       $v0, $v0, $s1
/* 31874 80043C54 94144590 */  lbu        $a1, 0x1494($v0)
/* 31878 80043C58 4CAC000C */  jal        DECOMP_howl_VolumeSet
/* 3187C 80043C5C 00000000 */   nop
/* 31880 80043C60 01000226 */  addiu      $v0, $s0, 0x1
/* 31884 80043C64 21804000 */  addu       $s0, $v0, $zero
/* 31888 80043C68 00140200 */  sll        $v0, $v0, 16
/* 3188C 80043C6C 03140200 */  sra        $v0, $v0, 16
/* 31890 80043C70 03004228 */  slti       $v0, $v0, 0x3
/* 31894 80043C74 FC414926 */  addiu      $t1, $s2, %lo(D_800841FC)
/* 31898 80043C78 9D14268A */  lwl        $a2, 0x149D($s1)
/* 3189C 80043C7C 9A14269A */  lwr        $a2, 0x149A($s1)
/* 318A0 80043C80 A114278A */  lwl        $a3, 0x14A1($s1)
/* 318A4 80043C84 9E14279A */  lwr        $a3, 0x149E($s1)
/* 318A8 80043C88 A514288A */  lwl        $t0, 0x14A5($s1)
/* 318AC 80043C8C A214289A */  lwr        $t0, 0x14A2($s1)
/* 318B0 80043C90 030026A9 */  swl        $a2, 0x3($t1)
/* 318B4 80043C94 000026B9 */  swr        $a2, 0x0($t1)
/* 318B8 80043C98 070027A9 */  swl        $a3, 0x7($t1)
/* 318BC 80043C9C 040027B9 */  swr        $a3, 0x4($t1)
/* 318C0 80043CA0 0B0028A9 */  swl        $t0, 0xB($t1)
/* 318C4 80043CA4 080028B9 */  swr        $t0, 0x8($t1)
/* 318C8 80043CA8 A914268A */  lwl        $a2, 0x14A9($s1)
/* 318CC 80043CAC A614269A */  lwr        $a2, 0x14A6($s1)
/* 318D0 80043CB0 AD14278A */  lwl        $a3, 0x14AD($s1)
/* 318D4 80043CB4 AA14279A */  lwr        $a3, 0x14AA($s1)
/* 318D8 80043CB8 B114288A */  lwl        $t0, 0x14B1($s1)
/* 318DC 80043CBC AE14289A */  lwr        $t0, 0x14AE($s1)
/* 318E0 80043CC0 0F0026A9 */  swl        $a2, 0xF($t1)
/* 318E4 80043CC4 0C0026B9 */  swr        $a2, 0xC($t1)
/* 318E8 80043CC8 130027A9 */  swl        $a3, 0x13($t1)
/* 318EC 80043CCC 100027B9 */  swr        $a3, 0x10($t1)
/* 318F0 80043CD0 170028A9 */  swl        $t0, 0x17($t1)
/* 318F4 80043CD4 140028B9 */  swr        $t0, 0x14($t1)
/* 318F8 80043CD8 DAFF4014 */  bnez       $v0, .L80043C44
/* 318FC 80043CDC 0980043C */   lui       $a0, %hi(D_8008E6E8)
/* 31900 80043CE0 E8E68424 */  addiu      $a0, $a0, %lo(D_8008E6E8)
/* 31904 80043CE4 0980053C */  lui        $a1, %hi(D_8008D2AC)
/* 31908 80043CE8 ACD2A58C */  lw         $a1, %lo(D_8008D2AC)($a1)
/* 3190C 80043CEC B414828C */  lw         $v0, 0x14B4($a0)
/* 31910 80043CF0 0000A38C */  lw         $v1, 0x0($a1)
/* 31914 80043CF4 000F4230 */  andi       $v0, $v0, 0xF00
/* 31918 80043CF8 25186200 */  or         $v1, $v1, $v0
/* 3191C 80043CFC 0000A3AC */  sw         $v1, 0x0($a1)
/* 31920 80043D00 B8148490 */  lbu        $a0, 0x14B8($a0)
/* 31924 80043D04 7FAC000C */  jal        DECOMP_howl_ModeSet
/* 31928 80043D08 01008430 */   andi      $a0, $a0, 0x1
.L80043D0C:
/* 3192C 80043D0C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 31930 80043D10 1800B28F */  lw         $s2, 0x18($sp)
/* 31934 80043D14 1400B18F */  lw         $s1, 0x14($sp)
/* 31938 80043D18 1000B08F */  lw         $s0, 0x10($sp)
/* 3193C 80043D1C 0800E003 */  jr         $ra
/* 31940 80043D20 2000BD27 */   addiu     $sp, $sp, 0x20
.size RaceConfig_LoadGameOptions, . - RaceConfig_LoadGameOptions
