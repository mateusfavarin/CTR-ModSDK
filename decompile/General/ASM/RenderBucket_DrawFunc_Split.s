.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel RenderBucket_DrawFunc_Split
/* 58C50 8006B030 3BFF0011 */  beqz       $t0, .L8006AD20
/* 58C54 8006B034 04003927 */   addiu     $t9, $t9, 0x4
/* 58C58 8006B038 09F8C002 */  jalr       $s6
/* 58C5C 8006B03C 0C012BAC */   sw        $t3, 0x10C($at)
/* 58C60 8006B040 FCFF2B8F */  lw         $t3, -0x4($t9)
/* 58C64 8006B044 900028AC */  sw         $t0, 0x90($at)
/* 58C68 8006B048 940023AC */  sw         $v1, 0x94($at)
/* 58C6C 8006B04C 44002384 */  lh         $v1, 0x44($at)
/* 58C70 8006B050 03440800 */  sra        $t0, $t0, 16
/* 58C74 8006B054 23406800 */  subu       $t0, $v1, $t0
/* 58C78 8006B058 9E0028A4 */  sh         $t0, 0x9E($at)
/* 58C7C 8006B05C 09F8C002 */  jalr       $s6
/* 58C80 8006B060 21702001 */   addu      $t6, $t1, $zero
/* 58C84 8006B064 00002B8F */  lw         $t3, 0x0($t9)
/* 58C88 8006B068 A80028AC */  sw         $t0, 0xA8($at)
/* 58C8C 8006B06C AC0023AC */  sw         $v1, 0xAC($at)
/* 58C90 8006B070 44002384 */  lh         $v1, 0x44($at)
/* 58C94 8006B074 03440800 */  sra        $t0, $t0, 16
/* 58C98 8006B078 23406800 */  subu       $t0, $v1, $t0
/* 58C9C 8006B07C B60028A4 */  sh         $t0, 0xB6($at)
/* 58CA0 8006B080 09F8C002 */  jalr       $s6
/* 58CA4 8006B084 21782001 */   addu      $t7, $t1, $zero
/* 58CA8 8006B088 900020C8 */  lwc2       $0, 0x90($at)
/* 58CAC 8006B08C 940021C8 */  lwc2       $1, 0x94($at)
/* 58CB0 8006B090 A80022C8 */  lwc2       $2, 0xA8($at)
/* 58CB4 8006B094 AC0023C8 */  lwc2       $3, 0xAC($at)
/* 58CB8 8006B098 00208848 */  mtc2       $t0, $4 /* handwritten instruction */
/* 58CBC 8006B09C 00288348 */  mtc2       $v1, $5 /* handwritten instruction */
/* 58CC0 8006B0A0 21802001 */  addu       $s0, $t1, $zero
/* 58CC4 8006B0A4 0C012B8C */  lw         $t3, 0x10C($at)
/* 58CC8 8006B0A8 3000284A */  RTPT
/* 58CCC 8006B0AC C00028AC */  sw         $t0, 0xC0($at)
/* 58CD0 8006B0B0 C40023AC */  sw         $v1, 0xC4($at)
/* 58CD4 8006B0B4 44002384 */  lh         $v1, 0x44($at)
/* 58CD8 8006B0B8 03440800 */  sra        $t0, $t0, 16
/* 58CDC 8006B0BC 23406800 */  subu       $t0, $v1, $t0
/* 58CE0 8006B0C0 CE0028A4 */  sh         $t0, 0xCE($at)
/* 58CE4 8006B0C4 04003927 */  addiu      $t9, $t9, 0x4
.L8006B0C8:
/* 58CE8 8006B0C8 FF016631 */  andi       $a2, $t3, 0x1FF
/* 58CEC 8006B0CC 0300C010 */  beqz       $a2, .L8006B0DC
/* 58CF0 8006B0D0 80300600 */   sll       $a2, $a2, 2
/* 58CF4 8006B0D4 2130DD00 */  addu       $a2, $a2, $sp
/* 58CF8 8006B0D8 FCFFC68C */  lw         $a2, -0x4($a2)
.L8006B0DC:
/* 58CFC 8006B0DC 1C00238C */  lw         $v1, 0x1C($at)
/* 58D00 8006B0E0 00700A48 */  mfc2       $t2, $14 /* handwritten instruction */
/* 58D04 8006B0E4 00F84548 */  cfc2       $a1, $31 /* handwritten instruction */
/* 58D08 8006B0E8 C0400B00 */  sll        $t0, $t3, 3
/* 58D0C 8006B0EC 402B0500 */  sll        $a1, $a1, 13
/* 58D10 8006B0F0 1A00A004 */  bltz       $a1, .L8006B15C
/* 58D14 8006B0F4 80480B00 */   sll       $t1, $t3, 2
/* 58D18 8006B0F8 07000105 */  bgez       $t0, .L8006B118
/* 58D1C 8006B0FC 24002584 */   lh        $a1, 0x24($at)
/* 58D20 8006B100 0600404B */  NCLIP
/* 58D24 8006B104 00C00848 */  mfc2       $t0, $24 /* handwritten instruction */
/* 58D28 8006B108 2648A900 */  xor        $t1, $a1, $t1
/* 58D2C 8006B10C 13000011 */  beqz       $t0, .L8006B15C
/* 58D30 8006B110 26400901 */   xor       $t0, $t0, $t1
/* 58D34 8006B114 11000019 */  blez       $t0, .L8006B15C
.L8006B118:
/* 58D38 8006B118 00600848 */   mfc2      $t0, $12 /* handwritten instruction */
/* 58D3C 8006B11C 00680948 */  mfc2       $t1, $13 /* handwritten instruction */
/* 58D40 8006B120 24280A01 */  and        $a1, $t0, $t2
/* 58D44 8006B124 2428A900 */  and        $a1, $a1, $t1
/* 58D48 8006B128 2D00584B */  AVSZ3
/* 58D4C 8006B12C 23400301 */  subu       $t0, $t0, $v1
/* 58D50 8006B130 23482301 */  subu       $t1, $t1, $v1
/* 58D54 8006B134 23504301 */  subu       $t2, $t2, $v1
/* 58D58 8006B138 25180901 */  or         $v1, $t0, $t1
/* 58D5C 8006B13C 27186A00 */  nor        $v1, $v1, $t2
/* 58D60 8006B140 25186500 */  or         $v1, $v1, $a1
/* 58D64 8006B144 05006004 */  bltz       $v1, .L8006B15C
/* 58D68 8006B148 001C0300 */   sll       $v1, $v1, 16
/* 58D6C 8006B14C 03006004 */  bltz       $v1, .L8006B15C
/* 58D70 8006B150 2C0038E8 */   swc2      $24, 0x2C($at)
/* 58D74 8006B154 25B4010C */  jal        func_8006D094
/* 58D78 8006B158 500026AC */   sw        $a2, 0x50($at)
.L8006B15C:
/* 58D7C 8006B15C 00002B8F */  lw         $t3, 0x0($t9)
/* 58D80 8006B160 04003927 */  addiu      $t9, $t9, 0x4
/* 58D84 8006B164 B2FF6005 */  bltz       $t3, RenderBucket_DrawFunc_Split
/* 58D88 8006B168 01006825 */   addiu     $t0, $t3, 0x1
/* 58D8C 8006B16C 02440B00 */  srl        $t0, $t3, 16
/* 58D90 8006B170 14000015 */  bnez       $t0, .L8006B1C4
/* 58D94 8006B174 40480B00 */   sll       $t1, $t3, 1
/* 58D98 8006B178 C0470B00 */  sll        $t0, $t3, 31
/* 58D9C 8006B17C C2190B00 */  srl        $v1, $t3, 7
/* 58DA0 8006B180 04000005 */  bltz       $t0, .L8006B194
/* 58DA4 8006B184 FC016330 */   andi      $v1, $v1, 0x1FC
/* 58DA8 8006B188 21187C00 */  addu       $v1, $v1, $gp
/* 58DAC 8006B18C 03000104 */  bgez       $zero, .L8006B19C
/* 58DB0 8006B190 00006F8C */   lw        $t7, 0x0($v1)
.L8006B194:
/* 58DB4 8006B194 21186100 */  addu       $v1, $v1, $at
/* 58DB8 8006B198 40016F8C */  lw         $t7, 0x140($v1)
.L8006B19C:
/* 58DBC 8006B19C 80470B00 */  sll        $t0, $t3, 30
/* 58DC0 8006B1A0 04000005 */  bltz       $t0, .L8006B1B4
/* 58DC4 8006B1A4 FC016331 */   andi      $v1, $t3, 0x1FC
/* 58DC8 8006B1A8 21187C00 */  addu       $v1, $v1, $gp
/* 58DCC 8006B1AC 03000104 */  bgez       $zero, .L8006B1BC
/* 58DD0 8006B1B0 0000708C */   lw        $s0, 0x0($v1)
.L8006B1B4:
/* 58DD4 8006B1B4 21186100 */  addu       $v1, $v1, $at
/* 58DD8 8006B1B8 4001708C */  lw         $s0, 0x140($v1)
.L8006B1BC:
/* 58DDC 8006B1BC E7FF0104 */  bgez       $zero, .L8006B15C
/* 58DE0 8006B1C0 2170E001 */   addu      $t6, $t7, $zero
.L8006B1C4:
/* 58DE4 8006B1C4 07002105 */  bgez       $t1, .L8006B1E4
/* 58DE8 8006B1C8 00000000 */   nop
/* 58DEC 8006B1CC 00600948 */  mfc2       $t1, $12 /* handwritten instruction */
/* 58DF0 8006B1D0 00880A48 */  mfc2       $t2, $17 /* handwritten instruction */
/* 58DF4 8006B1D4 00688948 */  mtc2       $t1, $13 /* handwritten instruction */
/* 58DF8 8006B1D8 00908A48 */  mtc2       $t2, $18 /* handwritten instruction */
/* 58DFC 8006B1DC 07000104 */  bgez       $zero, .L8006B1FC
/* 58E00 8006B1E0 2178C001 */   addu      $t7, $t6, $zero
.L8006B1E4:
/* 58E04 8006B1E4 A800298C */  lw         $t1, 0xA8($at)
/* 58E08 8006B1E8 AC002A8C */  lw         $t2, 0xAC($at)
/* 58E0C 8006B1EC 900029AC */  sw         $t1, 0x90($at)
/* 58E10 8006B1F0 B6002984 */  lh         $t1, 0xB6($at)
/* 58E14 8006B1F4 94002AAC */  sw         $t2, 0x94($at)
/* 58E18 8006B1F8 9E0029A4 */  sh         $t1, 0x9E($at)
.L8006B1FC:
/* 58E1C 8006B1FC C000298C */  lw         $t1, 0xC0($at)
/* 58E20 8006B200 C4002A8C */  lw         $t2, 0xC4($at)
/* 58E24 8006B204 A80029AC */  sw         $t1, 0xA8($at)
/* 58E28 8006B208 CE002984 */  lh         $t1, 0xCE($at)
/* 58E2C 8006B20C AC002AAC */  sw         $t2, 0xAC($at)
/* 58E30 8006B210 B60029A4 */  sh         $t1, 0xB6($at)
/* 58E34 8006B214 09F8C002 */  jalr       $s6
/* 58E38 8006B218 2170E001 */   addu      $t6, $t7, $zero
/* 58E3C 8006B21C 00008848 */  mtc2       $t0, $0 /* handwritten instruction */
/* 58E40 8006B220 00088348 */  mtc2       $v1, $1 /* handwritten instruction */
/* 58E44 8006B224 21780002 */  addu       $t7, $s0, $zero
/* 58E48 8006B228 21802001 */  addu       $s0, $t1, $zero
/* 58E4C 8006B22C 0100184A */  RTPS
/* 58E50 8006B230 C00028AC */  sw         $t0, 0xC0($at)
/* 58E54 8006B234 C40023AC */  sw         $v1, 0xC4($at)
/* 58E58 8006B238 44002384 */  lh         $v1, 0x44($at)
/* 58E5C 8006B23C 03440800 */  sra        $t0, $t0, 16
/* 58E60 8006B240 23406800 */  subu       $t0, $v1, $t0
/* 58E64 8006B244 A0FF0104 */  bgez       $zero, .L8006B0C8
/* 58E68 8006B248 CE0028A4 */   sh        $t0, 0xCE($at)
.size RenderBucket_DrawFunc_Split, . - RenderBucket_DrawFunc_Split
