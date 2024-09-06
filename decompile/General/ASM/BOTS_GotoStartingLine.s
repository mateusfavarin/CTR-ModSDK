.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel BOTS_GotoStartingLine
/* 4C4C 8001702C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4C50 80017030 1000B0AF */  sw         $s0, 0x10($sp)
/* 4C54 80017034 21808000 */  addu       $s0, $a0, $zero
/* 4C58 80017038 03000524 */  addiu      $a1, $zero, 0x3
/* 4C5C 8001703C 1800BFAF */  sw         $ra, 0x18($sp)
/* 4C60 80017040 1400B1AF */  sw         $s1, 0x14($sp)
/* 4C64 80017044 2C0780AF */  sw         $zero, 0x72C($gp) /* Failed to symbolize address 0x0000072C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 4C68 80017048 235F010C */  jal        VehBirth_TeleportSelf
/* 4C6C 8001704C 21300000 */   addu      $a2, $zero, $zero
/* 4C70 80017050 0980033C */  lui        $v1, %hi(D_8008D69C)
/* 4C74 80017054 9CD66324 */  addiu      $v1, $v1, %lo(D_8008D69C)
/* 4C78 80017058 4A000292 */  lbu        $v0, 0x4A($s0)
/* 4C7C 8001705C DC02058E */  lw         $a1, 0x2DC($s0)
/* 4C80 80017060 21104300 */  addu       $v0, $v0, $v1
/* 4C84 80017064 00005190 */  lbu        $s1, 0x0($v0)
/* 4C88 80017068 D402028E */  lw         $v0, 0x2D4($s0)
/* 4C8C 8001706C D802038E */  lw         $v1, 0x2D8($s0)
/* 4C90 80017070 21200002 */  addu       $a0, $s0, $zero
/* 4C94 80017074 F80505AE */  sw         $a1, 0x5F8($s0)
/* 4C98 80017078 EC0500AE */  sw         $zero, 0x5EC($s0)
/* 4C9C 8001707C E80500AE */  sw         $zero, 0x5E8($s0)
/* 4CA0 80017080 E40500AE */  sw         $zero, 0x5E4($s0)
/* 4CA4 80017084 E00500AE */  sw         $zero, 0x5E0($s0)
/* 4CA8 80017088 DC0500AE */  sw         $zero, 0x5DC($s0)
/* 4CAC 8001708C D80500AE */  sw         $zero, 0x5D8($s0)
/* 4CB0 80017090 D40500AE */  sw         $zero, 0x5D4($s0)
/* 4CB4 80017094 D00500AE */  sw         $zero, 0x5D0($s0)
/* 4CB8 80017098 CC0500AE */  sw         $zero, 0x5CC($s0)
/* 4CBC 8001709C F40503AE */  sw         $v1, 0x5F4($s0)
/* 4CC0 800170A0 0980033C */  lui        $v1, %hi(D_8008DAE0)
/* 4CC4 800170A4 F00502AE */  sw         $v0, 0x5F0($s0)
/* 4CC8 800170A8 B8050286 */  lh         $v0, 0x5B8($s0)
/* 4CCC 800170AC E0DA6324 */  addiu      $v1, $v1, %lo(D_8008DAE0)
/* 4CD0 800170B0 80100200 */  sll        $v0, $v0, 2
/* 4CD4 800170B4 21104300 */  addu       $v0, $v0, $v1
/* 4CD8 800170B8 0000428C */  lw         $v0, 0x0($v0)
/* 4CDC 800170BC 01000524 */  addiu      $a1, $zero, 0x1
/* 4CE0 800170C0 A80500AE */  sw         $zero, 0x5A8($s0)
/* 4CE4 800170C4 114D000C */  jal        BOTS_SetRotation
/* 4CE8 800170C8 A40502AE */   sw        $v0, 0x5A4($s0)
/* 4CEC 800170CC 0980023C */  lui        $v0, %hi(D_8008D680)
/* 4CF0 800170D0 80D64224 */  addiu      $v0, $v0, %lo(D_8008D680)
/* 4CF4 800170D4 21882202 */  addu       $s1, $s1, $v0
/* 4CF8 800170D8 0980043C */  lui        $a0, %hi(D_8008D668)
/* 4CFC 800170DC 68D68424 */  addiu      $a0, $a0, %lo(D_8008D668)
/* 4D00 800170E0 00002392 */  lbu        $v1, 0x0($s1)
/* 4D04 800170E4 1400828F */  lw         $v0, 0x14($gp) /* Failed to symbolize address 0x00000014 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 4D08 800170E8 1000053C */  lui        $a1, (0x100000 >> 16)
/* 4D0C 800170EC F00200A6 */  sh         $zero, 0x2F0($s0)
/* 4D10 800170F0 F80200A6 */  sh         $zero, 0x2F8($s0)
/* 4D14 800170F4 000600A6 */  sh         $zero, 0x600($s0)
/* 4D18 800170F8 EC0200A6 */  sh         $zero, 0x2EC($s0)
/* 4D1C 800170FC F40200A6 */  sh         $zero, 0x2F4($s0)
/* 4D20 80017100 FC0500A6 */  sh         $zero, 0x5FC($s0)
/* 4D24 80017104 18004300 */  mult       $v0, $v1
/* 4D28 80017108 C60300A6 */  sh         $zero, 0x3C6($s0)
/* 4D2C 8001710C C802038E */  lw         $v1, 0x2C8($s0)
/* 4D30 80017110 13060292 */  lbu        $v0, 0x613($s0)
/* 4D34 80017114 25186500 */  or         $v1, $v1, $a1
/* 4D38 80017118 00110200 */  sll        $v0, $v0, 4
/* 4D3C 8001711C C80203AE */  sw         $v1, 0x2C8($s0)
/* 4D40 80017120 080602A6 */  sh         $v0, 0x608($s0)
/* 4D44 80017124 9A0302A6 */  sh         $v0, 0x39A($s0)
/* 4D48 80017128 EE0202A6 */  sh         $v0, 0x2EE($s0)
/* 4D4C 8001712C F60202A6 */  sh         $v0, 0x2F6($s0)
/* 4D50 80017130 FE0502A6 */  sh         $v0, 0x5FE($s0)
/* 4D54 80017134 12380000 */  mflo       $a3
/* 4D58 80017138 A1B1010C */  jal        RngDeadCoed
/* 4D5C 8001713C B40507AE */   sw        $a3, 0x5B4($s0)
/* 4D60 80017140 03120200 */  sra        $v0, $v0, 8
/* 4D64 80017144 FF004230 */  andi       $v0, $v0, 0xFF
/* 4D68 80017148 2C014224 */  addiu      $v0, $v0, 0x12C
/* 4D6C 8001714C 240602A6 */  sh         $v0, 0x624($s0)
/* 4D70 80017150 1800BF8F */  lw         $ra, 0x18($sp)
/* 4D74 80017154 1400B18F */  lw         $s1, 0x14($sp)
/* 4D78 80017158 1000B08F */  lw         $s0, 0x10($sp)
/* 4D7C 8001715C 0800E003 */  jr         $ra
/* 4D80 80017160 2000BD27 */   addiu     $sp, $sp, 0x20
.size BOTS_GotoStartingLine, . - BOTS_GotoStartingLine
