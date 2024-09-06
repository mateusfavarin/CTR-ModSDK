.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel DrawConfetti
/* 57C1C 80069FFC 801F013C */  lui        $at, (0x1F80002C >> 16)
/* 57C20 8006A000 000030AC */  sw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 57C24 8006A004 040031AC */  sw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 57C28 8006A008 080032AC */  sw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 57C2C 8006A00C 0C0033AC */  sw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 57C30 8006A010 100034AC */  sw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 57C34 8006A014 140035AC */  sw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 57C38 8006A018 180036AC */  sw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 57C3C 8006A01C 1C0037AC */  sw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 57C40 8006A020 20003CAC */  sw         $gp, (0x1F800020 & 0xFFFF)($at)
/* 57C44 8006A024 24003DAC */  sw         $sp, (0x1F800024 & 0xFFFF)($at)
/* 57C48 8006A028 28003EAC */  sw         $fp, (0x1F800028 & 0xFFFF)($at)
/* 57C4C 8006A02C 2C003FAC */  sw         $ra, (0x1F80002C & 0xFFFF)($at)
/* 57C50 8006A030 0028C048 */  ctc2       $zero, $5 /* handwritten instruction */
/* 57C54 8006A034 0030C048 */  ctc2       $zero, $6 /* handwritten instruction */
/* 57C58 8006A038 0038C048 */  ctc2       $zero, $7 /* handwritten instruction */
/* 57C5C 8006A03C 0C00A28C */  lw         $v0, 0xC($a1)
/* 57C60 8006A040 1000BE8F */  lw         $fp, 0x10($sp)
/* 57C64 8006A044 0980033C */  lui        $v1, %hi(D_8008A2A0)
/* 57C68 8006A048 A0A26324 */  addiu      $v1, $v1, %lo(D_8008A2A0)
/* 57C6C 8006A04C 58002824 */  addiu      $t0, $at, %lo(D_1F800058)
/* 57C70 8006A050 08000924 */  addiu      $t1, $zero, 0x8
.L8006A054:
/* 57C74 8006A054 00006A8C */  lw         $t2, 0x0($v1)
/* 57C78 8006A058 04006324 */  addiu      $v1, $v1, 0x4
/* 57C7C 8006A05C 00000AAD */  sw         $t2, 0x0($t0)
/* 57C80 8006A060 04000825 */  addiu      $t0, $t0, 0x4
/* 57C84 8006A064 FBFF201D */  bgtz       $t1, .L8006A054
/* 57C88 8006A068 FFFF2925 */   addiu     $t1, $t1, -0x1
/* 57C8C 8006A06C 2800838C */  lw         $v1, 0x28($a0)
/* 57C90 8006A070 2C00888C */  lw         $t0, 0x2C($a0)
/* 57C94 8006A074 3000898C */  lw         $t1, 0x30($a0)
/* 57C98 8006A078 34008A8C */  lw         $t2, 0x34($a0)
/* 57C9C 8006A07C 38008B8C */  lw         $t3, 0x38($a0)
/* 57CA0 8006A080 0000C348 */  ctc2       $v1, $0 /* handwritten instruction */
/* 57CA4 8006A084 08008F84 */  lh         $t7, 0x8($a0)
/* 57CA8 8006A088 0008C848 */  ctc2       $t0, $1 /* handwritten instruction */
/* 57CAC 8006A08C 0010C948 */  ctc2       $t1, $2 /* handwritten instruction */
/* 57CB0 8006A090 0018CA48 */  ctc2       $t2, $3 /* handwritten instruction */
/* 57CB4 8006A094 31A9010C */  jal        TRIG_AngleSinCos_r15r16r17
/* 57CB8 8006A098 0020CB48 */   ctc2      $t3, $4 /* handwritten instruction */
/* 57CBC 8006A09C 83801000 */  sra        $s0, $s0, 2
/* 57CC0 8006A0A0 00041526 */  addiu      $s5, $s0, 0x400
/* 57CC4 8006A0A4 83881100 */  sra        $s1, $s1, 2
/* 57CC8 8006A0A8 00043626 */  addiu      $s6, $s1, 0x400
/* 57CCC 8006A0AC 0800D38C */  lw         $s3, 0x8($a2)
/* 57CD0 8006A0B0 00001224 */  addiu      $s2, $zero, 0x0
/* 57CD4 8006A0B4 00001424 */  addiu      $s4, $zero, 0x0
/* 57CD8 8006A0B8 18006702 */  mult       $s3, $a3
/* 57CDC 8006A0BC 20008384 */  lh         $v1, 0x20($a0)
/* 57CE0 8006A0C0 22008884 */  lh         $t0, 0x22($a0)
/* 57CE4 8006A0C4 1800898C */  lw         $t1, 0x18($a0)
/* 57CE8 8006A0C8 20008C8C */  lw         $t4, 0x20($a0)
/* 57CEC 8006A0CC F4008B8C */  lw         $t3, 0xF4($a0)
/* 57CF0 8006A0D0 C01B0300 */  sll        $v1, $v1, 15
/* 57CF4 8006A0D4 C0430800 */  sll        $t0, $t0, 15
/* 57CF8 8006A0D8 00C0C348 */  ctc2       $v1, $24 /* handwritten instruction */
/* 57CFC 8006A0DC 00C8C848 */  ctc2       $t0, $25 /* handwritten instruction */
/* 57D00 8006A0E0 00D0C948 */  ctc2       $t1, $26 /* handwritten instruction */
/* 57D04 8006A0E4 0000CD8C */  lw         $t5, 0x0($a2)
/* 57D08 8006A0E8 0F00C017 */  bnez       $fp, .L8006A128
/* 57D0C 8006A0EC 0400C394 */   lhu       $v1, 0x4($a2)
/* 57D10 8006A0F0 0600C894 */  lhu        $t0, 0x6($a2)
/* 57D14 8006A0F4 0C006D10 */  beq        $v1, $t5, .L8006A128
/* 57D18 8006A0F8 23486D00 */   subu      $t1, $v1, $t5
/* 57D1C 8006A0FC 05002105 */  bgez       $t1, .L8006A114
/* 57D20 8006A100 21502801 */   addu      $t2, $t1, $t0
/* 57D24 8006A104 07004019 */  blez       $t2, .L8006A124
/* 57D28 8006A108 2368A801 */   subu      $t5, $t5, $t0
/* 57D2C 8006A10C 05000104 */  bgez       $zero, .L8006A124
/* 57D30 8006A110 21686000 */   addu      $t5, $v1, $zero
.L8006A114:
/* 57D34 8006A114 23502801 */  subu       $t2, $t1, $t0
/* 57D38 8006A118 02004105 */  bgez       $t2, .L8006A124
/* 57D3C 8006A11C 2168A801 */   addu      $t5, $t5, $t0
/* 57D40 8006A120 21686000 */  addu       $t5, $v1, $zero
.L8006A124:
/* 57D44 8006A124 0000CDAC */  sw         $t5, 0x0($a2)
.L8006A128:
/* 57D48 8006A128 00008384 */  lh         $v1, 0x0($a0)
/* 57D4C 8006A12C 02008884 */  lh         $t0, 0x2($a0)
/* 57D50 8006A130 04008984 */  lh         $t1, 0x4($a0)
/* 57D54 8006A134 12980000 */  mflo       $s3
/* 57D58 8006A138 23904302 */  subu       $s2, $s2, $v1
/* 57D5C 8006A13C 23986802 */  subu       $s3, $s3, $t0
/* 57D60 8006A140 23A08902 */  subu       $s4, $s4, $t1
/* 57D64 8006A144 21905502 */  addu       $s2, $s2, $s5
/* 57D68 8006A148 21A09602 */  addu       $s4, $s4, $s6
/* 57D6C 8006A14C 0028083C */  lui        $t0, (0x28000000 >> 16)
/* 57D70 8006A150 340028AC */  sw         $t0, 0x34($at)
/* 57D74 8006A154 06001E24 */  addiu      $fp, $zero, 0x6
/* 57D78 8006A158 1230173C */  lui        $s7, (0x30125400 >> 16)
/* 57D7C 8006A15C 0054F736 */  ori        $s7, $s7, (0x30125400 & 0xFFFF)
/* 57D80 8006A160 3549183C */  lui        $t8, (0x493583FE >> 16)
/* 57D84 8006A164 A7000104 */  bgez       $zero, .L8006A404
/* 57D88 8006A168 FE831837 */   ori       $t8, $t8, (0x493583FE & 0xFFFF)
.L8006A16C:
/* 57D8C 8006A16C 30002DAC */  sw         $t5, 0x30($at)
/* 57D90 8006A170 43CD1900 */  sra        $t9, $t9, 21
/* 57D94 8006A174 43E51C00 */  sra        $gp, $gp, 21
/* 57D98 8006A178 43ED1D00 */  sra        $sp, $sp, 21
/* 57D9C 8006A17C 21C83203 */  addu       $t9, $t9, $s2
/* 57DA0 8006A180 21E09303 */  addu       $gp, $gp, $s3
/* 57DA4 8006A184 21E8B403 */  addu       $sp, $sp, $s4
/* 57DA8 8006A188 FF073933 */  andi       $t9, $t9, 0x7FF
/* 57DAC 8006A18C FF079C33 */  andi       $gp, $gp, 0x7FF
/* 57DB0 8006A190 FF07BD33 */  andi       $sp, $sp, 0x7FF
/* 57DB4 8006A194 23C83503 */  subu       $t9, $t9, $s5
/* 57DB8 8006A198 00FC9C27 */  addiu      $gp, $gp, -0x400
/* 57DBC 8006A19C 23E8B603 */  subu       $sp, $sp, $s6
/* 57DC0 8006A1A0 0100CA33 */  andi       $t2, $fp, 0x1
/* 57DC4 8006A1A4 02004011 */  beqz       $t2, .L8006A1B0
/* 57DC8 8006A1A8 2178E000 */   addu      $t7, $a3, $zero
/* 57DCC 8006A1AC 22780700 */  neg        $t7, $a3 /* handwritten instruction */
.L8006A1B0:
/* 57DD0 8006A1B0 31A9010C */  jal        TRIG_AngleSinCos_r15r16r17
/* 57DD4 8006A1B4 00790F00 */   sll       $t7, $t7, 4
/* 57DD8 8006A1B8 43511000 */  sra        $t2, $s0, 5
/* 57DDC 8006A1BC 21C82A03 */  addu       $t9, $t9, $t2
/* 57DE0 8006A1C0 43511100 */  sra        $t2, $s1, 5
/* 57DE4 8006A1C4 21E8AA03 */  addu       $sp, $sp, $t2
/* 57DE8 8006A1C8 21480002 */  addu       $t1, $s0, $zero
/* 57DEC 8006A1CC 21502002 */  addu       $t2, $s1, $zero
/* 57DF0 8006A1D0 31A9010C */  jal        TRIG_AngleSinCos_r15r16r17
/* 57DF4 8006A1D4 C0780F00 */   sll       $t7, $t7, 3
/* 57DF8 8006A1D8 0300201E */  bgtz       $s1, .L8006A1E8
/* 57DFC 8006A1DC C3411100 */   sra       $t0, $s1, 7
/* 57E00 8006A1E0 22401100 */  neg        $t0, $s1 /* handwritten instruction */
/* 57E04 8006A1E4 C3410800 */  sra        $t0, $t0, 7
.L8006A1E8:
/* 57E08 8006A1E8 21400101 */  addu       $t0, $t0, $at
/* 57E0C 8006A1EC 58000891 */  lbu        $t0, 0x58($t0)
/* 57E10 8006A1F0 0100C333 */  andi       $v1, $fp, 0x1
/* 57E14 8006A1F4 02006010 */  beqz       $v1, .L8006A200
/* 57E18 8006A1F8 340020A0 */   sb        $zero, 0x34($at)
/* 57E1C 8006A1FC 340028A0 */  sb         $t0, 0x34($at)
.L8006A200:
/* 57E20 8006A200 0200C333 */  andi       $v1, $fp, 0x2
/* 57E24 8006A204 02006010 */  beqz       $v1, .L8006A210
/* 57E28 8006A208 350020A0 */   sb        $zero, 0x35($at)
/* 57E2C 8006A20C 350028A0 */  sb         $t0, 0x35($at)
.L8006A210:
/* 57E30 8006A210 0400C333 */  andi       $v1, $fp, 0x4
/* 57E34 8006A214 02006010 */  beqz       $v1, .L8006A220
/* 57E38 8006A218 360020A0 */   sb        $zero, 0x36($at)
/* 57E3C 8006A21C 360028A0 */  sb         $t0, 0x36($at)
.L8006A220:
/* 57E40 8006A220 18000902 */  mult       $s0, $t1
/* 57E44 8006A224 038A1100 */  sra        $s1, $s1, 8
/* 57E48 8006A228 23409103 */  subu       $t0, $gp, $s1
/* 57E4C 8006A22C 3A0028A4 */  sh         $t0, 0x3A($at)
/* 57E50 8006A230 420028A4 */  sh         $t0, 0x42($at)
/* 57E54 8006A234 21409103 */  addu       $t0, $gp, $s1
/* 57E58 8006A238 4A0028A4 */  sh         $t0, 0x4A($at)
/* 57E5C 8006A23C 12180000 */  mflo       $v1
/* 57E60 8006A240 520028A4 */  sh         $t0, 0x52($at)
/* 57E64 8006A244 031D0300 */  sra        $v1, $v1, 20
/* 57E68 8006A248 18000A02 */  mult       $s0, $t2
/* 57E6C 8006A24C 03821000 */  sra        $s0, $s0, 8
/* 57E70 8006A250 03520A00 */  sra        $t2, $t2, 8
/* 57E74 8006A254 23402A03 */  subu       $t0, $t9, $t2
/* 57E78 8006A258 23400301 */  subu       $t0, $t0, $v1
/* 57E7C 8006A25C 380028A4 */  sh         $t0, 0x38($at)
/* 57E80 8006A260 21402A03 */  addu       $t0, $t9, $t2
/* 57E84 8006A264 23400301 */  subu       $t0, $t0, $v1
/* 57E88 8006A268 400028A4 */  sh         $t0, 0x40($at)
/* 57E8C 8006A26C 23402A03 */  subu       $t0, $t9, $t2
/* 57E90 8006A270 21400301 */  addu       $t0, $t0, $v1
/* 57E94 8006A274 480028A4 */  sh         $t0, 0x48($at)
/* 57E98 8006A278 21402A03 */  addu       $t0, $t9, $t2
/* 57E9C 8006A27C 21400301 */  addu       $t0, $t0, $v1
/* 57EA0 8006A280 500028A4 */  sh         $t0, 0x50($at)
/* 57EA4 8006A284 12180000 */  mflo       $v1
/* 57EA8 8006A288 034A0900 */  sra        $t1, $t1, 8
/* 57EAC 8006A28C 031D0300 */  sra        $v1, $v1, 20
/* 57EB0 8006A290 2340A903 */  subu       $t0, $sp, $t1
/* 57EB4 8006A294 21400301 */  addu       $t0, $t0, $v1
/* 57EB8 8006A298 3C0028AC */  sw         $t0, 0x3C($at)
/* 57EBC 8006A29C 2140A903 */  addu       $t0, $sp, $t1
/* 57EC0 8006A2A0 21400301 */  addu       $t0, $t0, $v1
/* 57EC4 8006A2A4 440028AC */  sw         $t0, 0x44($at)
/* 57EC8 8006A2A8 2340A903 */  subu       $t0, $sp, $t1
/* 57ECC 8006A2AC 23400301 */  subu       $t0, $t0, $v1
/* 57ED0 8006A2B0 4C0028AC */  sw         $t0, 0x4C($at)
/* 57ED4 8006A2B4 2140A903 */  addu       $t0, $sp, $t1
/* 57ED8 8006A2B8 23400301 */  subu       $t0, $t0, $v1
/* 57EDC 8006A2BC 540028AC */  sw         $t0, 0x54($at)
/* 57EE0 8006A2C0 380020C8 */  lwc2       $0, 0x38($at)
/* 57EE4 8006A2C4 3C0021C8 */  lwc2       $1, 0x3C($at)
/* 57EE8 8006A2C8 400022C8 */  lwc2       $2, 0x40($at)
/* 57EEC 8006A2CC 440023C8 */  lwc2       $3, 0x44($at)
/* 57EF0 8006A2D0 480024C8 */  lwc2       $4, 0x48($at)
/* 57EF4 8006A2D4 4C0025C8 */  lwc2       $5, 0x4C($at)
/* 57EF8 8006A2D8 001E1800 */  sll        $v1, $t8, 24
/* 57EFC 8006A2DC 02C21800 */  srl        $t8, $t8, 8
/* 57F00 8006A2E0 3000284A */  RTPT
/* 57F04 8006A2E4 21C8F802 */  addu       $t9, $s7, $t8
/* 57F08 8006A2E8 02BA1700 */  srl        $s7, $s7, 8
/* 57F0C 8006A2EC 25B8E302 */  or         $s7, $s7, $v1
/* 57F10 8006A2F0 021A1700 */  srl        $v1, $s7, 8
/* 57F14 8006A2F4 21C82303 */  addu       $t9, $t9, $v1
/* 57F18 8006A2F8 00CE1900 */  sll        $t9, $t9, 24
/* 57F1C 8006A2FC 25C01903 */  or         $t8, $t8, $t9
/* 57F20 8006A300 001E1800 */  sll        $v1, $t8, 24
/* 57F24 8006A304 02C21800 */  srl        $t8, $t8, 8
/* 57F28 8006A308 21E0F802 */  addu       $gp, $s7, $t8
/* 57F2C 8006A30C 02BA1700 */  srl        $s7, $s7, 8
/* 57F30 8006A310 25B8E302 */  or         $s7, $s7, $v1
/* 57F34 8006A314 021A1700 */  srl        $v1, $s7, 8
/* 57F38 8006A318 21E08303 */  addu       $gp, $gp, $v1
/* 57F3C 8006A31C 00E61C00 */  sll        $gp, $gp, 24
/* 57F40 8006A320 25C01C03 */  or         $t8, $t8, $gp
/* 57F44 8006A324 001E1800 */  sll        $v1, $t8, 24
/* 57F48 8006A328 02C21800 */  srl        $t8, $t8, 8
/* 57F4C 8006A32C 21E8F802 */  addu       $sp, $s7, $t8
/* 57F50 8006A330 02BA1700 */  srl        $s7, $s7, 8
/* 57F54 8006A334 25B8E302 */  or         $s7, $s7, $v1
/* 57F58 8006A338 021A1700 */  srl        $v1, $s7, 8
/* 57F5C 8006A33C 21E8A303 */  addu       $sp, $sp, $v1
/* 57F60 8006A340 00EE1D00 */  sll        $sp, $sp, 24
/* 57F64 8006A344 25C01D03 */  or         $t8, $t8, $sp
/* 57F68 8006A348 00600348 */  mfc2       $v1, $12 /* handwritten instruction */
/* 57F6C 8006A34C 00F84A48 */  cfc2       $t2, $31 /* handwritten instruction */
/* 57F70 8006A350 00680848 */  mfc2       $t0, $13 /* handwritten instruction */
/* 57F74 8006A354 00700948 */  mfc2       $t1, $14 /* handwritten instruction */
/* 57F78 8006A358 08004CE8 */  swc2       $12, 0x8($v0)
/* 57F7C 8006A35C 500020C8 */  lwc2       $0, 0x50($at)
/* 57F80 8006A360 540021C8 */  lwc2       $1, 0x54($at)
/* 57F84 8006A364 80530A00 */  sll        $t2, $t2, 14
/* 57F88 8006A368 41004005 */  bltz       $t2, .L8006A470
/* 57F8C 8006A36C 24706800 */   and       $t6, $v1, $t0
/* 57F90 8006A370 0100184A */  RTPS
/* 57F94 8006A374 2470C901 */  and        $t6, $t6, $t1
/* 57F98 8006A378 23186C00 */  subu       $v1, $v1, $t4
/* 57F9C 8006A37C 23400C01 */  subu       $t0, $t0, $t4
/* 57FA0 8006A380 23482C01 */  subu       $t1, $t1, $t4
/* 57FA4 8006A384 00700A48 */  mfc2       $t2, $14 /* handwritten instruction */
/* 57FA8 8006A388 25186800 */  or         $v1, $v1, $t0
/* 57FAC 8006A38C 25186900 */  or         $v1, $v1, $t1
/* 57FB0 8006A390 27186A00 */  nor        $v1, $v1, $t2
/* 57FB4 8006A394 00F84948 */  cfc2       $t1, $31 /* handwritten instruction */
/* 57FB8 8006A398 2470CA01 */  and        $t6, $t6, $t2
/* 57FBC 8006A39C 804B0900 */  sll        $t1, $t1, 14
/* 57FC0 8006A3A0 33002005 */  bltz       $t1, .L8006A470
/* 57FC4 8006A3A4 25186E00 */   or        $v1, $v1, $t6
/* 57FC8 8006A3A8 2E00684B */  AVSZ4
/* 57FCC 8006A3AC 30006004 */  bltz       $v1, .L8006A470
/* 57FD0 8006A3B0 001C0300 */   sll       $v1, $v1, 16
/* 57FD4 8006A3B4 2E006004 */  bltz       $v1, .L8006A470
/* 57FD8 8006A3B8 3400288C */   lw        $t0, 0x34($at)
/* 57FDC 8006A3BC 0C004CE8 */  swc2       $12, 0xC($v0)
/* 57FE0 8006A3C0 10004DE8 */  swc2       $13, 0x10($v0)
/* 57FE4 8006A3C4 14004EE8 */  swc2       $14, 0x14($v0)
/* 57FE8 8006A3C8 00C00E48 */  mfc2       $t6, $24 /* handwritten instruction */
/* 57FEC 8006A3CC 040048AC */  sw         $t0, 0x4($v0)
/* 57FF0 8006A3D0 82740E00 */  srl        $t6, $t6, 18
/* 57FF4 8006A3D4 80700E00 */  sll        $t6, $t6, 2
/* 57FF8 8006A3D8 2170CB01 */  addu       $t6, $t6, $t3
/* 57FFC 8006A3DC 0000CA8D */  lw         $t2, 0x0($t6)
/* 58000 8006A3E0 001A0200 */  sll        $v1, $v0, 8
/* 58004 8006A3E4 021A0300 */  srl        $v1, $v1, 8
/* 58008 8006A3E8 0005093C */  lui        $t1, (0x5000000 >> 16)
/* 5800C 8006A3EC 25504901 */  or         $t2, $t2, $t1
/* 58010 8006A3F0 00004AAC */  sw         $t2, 0x0($v0)
/* 58014 8006A3F4 0000C3AD */  sw         $v1, 0x0($t6)
/* 58018 8006A3F8 30002D8C */  lw         $t5, 0x30($at)
/* 5801C 8006A3FC 1C000104 */  bgez       $zero, .L8006A470
/* 58020 8006A400 18004224 */   addiu     $v0, $v0, 0x18
.L8006A404:
/* 58024 8006A404 001E1800 */  sll        $v1, $t8, 24
/* 58028 8006A408 02C21800 */  srl        $t8, $t8, 8
/* 5802C 8006A40C 21C8F802 */  addu       $t9, $s7, $t8
/* 58030 8006A410 02BA1700 */  srl        $s7, $s7, 8
/* 58034 8006A414 25B8E302 */  or         $s7, $s7, $v1
/* 58038 8006A418 021A1700 */  srl        $v1, $s7, 8
/* 5803C 8006A41C 21C82303 */  addu       $t9, $t9, $v1
/* 58040 8006A420 00CE1900 */  sll        $t9, $t9, 24
/* 58044 8006A424 25C01903 */  or         $t8, $t8, $t9
/* 58048 8006A428 001E1800 */  sll        $v1, $t8, 24
/* 5804C 8006A42C 02C21800 */  srl        $t8, $t8, 8
/* 58050 8006A430 21E0F802 */  addu       $gp, $s7, $t8
/* 58054 8006A434 02BA1700 */  srl        $s7, $s7, 8
/* 58058 8006A438 25B8E302 */  or         $s7, $s7, $v1
/* 5805C 8006A43C 021A1700 */  srl        $v1, $s7, 8
/* 58060 8006A440 21E08303 */  addu       $gp, $gp, $v1
/* 58064 8006A444 00E61C00 */  sll        $gp, $gp, 24
/* 58068 8006A448 25C01C03 */  or         $t8, $t8, $gp
/* 5806C 8006A44C 001E1800 */  sll        $v1, $t8, 24
/* 58070 8006A450 02C21800 */  srl        $t8, $t8, 8
/* 58074 8006A454 21E8F802 */  addu       $sp, $s7, $t8
/* 58078 8006A458 02BA1700 */  srl        $s7, $s7, 8
/* 5807C 8006A45C 25B8E302 */  or         $s7, $s7, $v1
/* 58080 8006A460 021A1700 */  srl        $v1, $s7, 8
/* 58084 8006A464 21E8A303 */  addu       $sp, $sp, $v1
/* 58088 8006A468 00EE1D00 */  sll        $sp, $sp, 24
/* 5808C 8006A46C 25C01D03 */  or         $t8, $t8, $sp
.L8006A470:
/* 58090 8006A470 FFFFDE27 */  addiu      $fp, $fp, -0x1
/* 58094 8006A474 0200C017 */  bnez       $fp, .L8006A480
/* 58098 8006A478 1700E724 */   addiu     $a3, $a3, 0x17
/* 5809C 8006A47C 06001E24 */  addiu      $fp, $zero, 0x6
.L8006A480:
/* 580A0 8006A480 3AFFA015 */  bnez       $t5, .L8006A16C
/* 580A4 8006A484 FFFFAD25 */   addiu     $t5, $t5, -0x1
/* 580A8 8006A488 0C00A2AC */  sw         $v0, 0xC($a1)
/* 580AC 8006A48C 2C003F8C */  lw         $ra, 0x2C($at)
/* 580B0 8006A490 28003E8C */  lw         $fp, 0x28($at)
/* 580B4 8006A494 24003D8C */  lw         $sp, 0x24($at)
/* 580B8 8006A498 20003C8C */  lw         $gp, 0x20($at)
/* 580BC 8006A49C 1C00378C */  lw         $s7, 0x1C($at)
/* 580C0 8006A4A0 1800368C */  lw         $s6, 0x18($at)
/* 580C4 8006A4A4 1400358C */  lw         $s5, 0x14($at)
/* 580C8 8006A4A8 1000348C */  lw         $s4, 0x10($at)
/* 580CC 8006A4AC 0C00338C */  lw         $s3, 0xC($at)
/* 580D0 8006A4B0 0800328C */  lw         $s2, 0x8($at)
/* 580D4 8006A4B4 0400318C */  lw         $s1, 0x4($at)
/* 580D8 8006A4B8 0000308C */  lw         $s0, 0x0($at)
/* 580DC 8006A4BC 0800E003 */  jr         $ra
/* 580E0 8006A4C0 00000000 */   nop
.size DrawConfetti, . - DrawConfetti
