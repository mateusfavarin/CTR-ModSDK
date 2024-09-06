.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_8006D094
/* 5ACB4 8006D094 84003FAC */  sw         $ra, 0x84($at)
/* 5ACB8 8006D098 CE002384 */  lh         $v1, 0xCE($at)
/* 5ACBC 8006D09C B6002884 */  lh         $t0, 0xB6($at)
/* 5ACC0 8006D0A0 9E002984 */  lh         $t1, 0x9E($at)
/* 5ACC4 8006D0A4 0E006104 */  bgez       $v1, .L8006D0E0
/* 5ACC8 8006D0A8 D8002324 */   addiu     $v1, $at, 0xD8
/* 5ACCC 8006D0AC 05000105 */  bgez       $t0, .L8006D0C4
/* 5ACD0 8006D0B0 90002824 */   addiu     $t0, $at, 0x90
/* 5ACD4 8006D0B4 5D002005 */  bltz       $t1, .L8006D22C
/* 5ACD8 8006D0B8 3C002A8C */   lw        $t2, 0x3C($at)
/* 5ACDC 8006D0BC 14000104 */  bgez       $zero, .L8006D110
/* 5ACE0 8006D0C0 4000348C */   lw        $s4, 0x40($at)
.L8006D0C4:
/* 5ACE4 8006D0C4 03002105 */  bgez       $t1, .L8006D0D4
/* 5ACE8 8006D0C8 3C002A8C */   lw        $t2, 0x3C($at)
/* 5ACEC 8006D0CC 24000104 */  bgez       $zero, .L8006D160
/* 5ACF0 8006D0D0 4000348C */   lw        $s4, 0x40($at)
.L8006D0D4:
/* 5ACF4 8006D0D4 40002A8C */  lw         $t2, 0x40($at)
/* 5ACF8 8006D0D8 35000104 */  bgez       $zero, .L8006D1B0
/* 5ACFC 8006D0DC 3C00348C */   lw        $s4, 0x3C($at)
.L8006D0E0:
/* 5AD00 8006D0E0 08000105 */  bgez       $t0, .L8006D104
/* 5AD04 8006D0E4 90002824 */   addiu     $t0, $at, 0x90
/* 5AD08 8006D0E8 03002105 */  bgez       $t1, .L8006D0F8
/* 5AD0C 8006D0EC 3C002A8C */   lw        $t2, 0x3C($at)
/* 5AD10 8006D0F0 2F000104 */  bgez       $zero, .L8006D1B0
/* 5AD14 8006D0F4 4000348C */   lw        $s4, 0x40($at)
.L8006D0F8:
/* 5AD18 8006D0F8 40002A8C */  lw         $t2, 0x40($at)
/* 5AD1C 8006D0FC 18000104 */  bgez       $zero, .L8006D160
/* 5AD20 8006D100 3C00348C */   lw        $s4, 0x3C($at)
.L8006D104:
/* 5AD24 8006D104 49002105 */  bgez       $t1, .L8006D22C
/* 5AD28 8006D108 40002A8C */   lw        $t2, 0x40($at)
/* 5AD2C 8006D10C 3C00348C */  lw         $s4, 0x3C($at)
.L8006D110:
/* 5AD30 8006D110 96B4010C */  jal        func_8006D258
/* 5AD34 8006D114 38002AAC */   sw        $t2, 0x38($at)
/* 5AD38 8006D118 09F8E000 */  jalr       $a3
/* 5AD3C 8006D11C A8002924 */   addiu     $t1, $at, 0xA8
/* 5AD40 8006D120 F0002324 */  addiu      $v1, $at, 0xF0
/* 5AD44 8006D124 09F8E000 */  jalr       $a3
/* 5AD48 8006D128 C0002924 */   addiu     $t1, $at, 0xC0
/* 5AD4C 8006D12C C0002324 */  addiu      $v1, $at, 0xC0
/* 5AD50 8006D130 F0002824 */  addiu      $t0, $at, 0xF0
/* 5AD54 8006D134 AFB4010C */  jal        func_8006D2BC
/* 5AD58 8006D138 D8002924 */   addiu     $t1, $at, 0xD8
/* 5AD5C 8006D13C A8002324 */  addiu      $v1, $at, 0xA8
/* 5AD60 8006D140 E3B4010C */  jal        func_8006D38C
/* 5AD64 8006D144 C0002824 */   addiu     $t0, $at, 0xC0
/* 5AD68 8006D148 380034AC */  sw         $s4, 0x38($at)
/* 5AD6C 8006D14C F0002324 */  addiu      $v1, $at, 0xF0
/* 5AD70 8006D150 F2B4010C */  jal        func_8006D3C8
/* 5AD74 8006D154 90002824 */   addiu     $t0, $at, 0x90
/* 5AD78 8006D158 28000104 */  bgez       $zero, .L8006D1FC
/* 5AD7C 8006D15C 98002E8C */   lw        $t6, 0x98($at)
.L8006D160:
/* 5AD80 8006D160 96B4010C */  jal        func_8006D258
/* 5AD84 8006D164 38002AAC */   sw        $t2, 0x38($at)
/* 5AD88 8006D168 09F8E000 */  jalr       $a3
/* 5AD8C 8006D16C A8002924 */   addiu     $t1, $at, 0xA8
/* 5AD90 8006D170 F0002324 */  addiu      $v1, $at, 0xF0
/* 5AD94 8006D174 09F8E000 */  jalr       $a3
/* 5AD98 8006D178 C0002824 */   addiu     $t0, $at, 0xC0
/* 5AD9C 8006D17C C0002324 */  addiu      $v1, $at, 0xC0
/* 5ADA0 8006D180 90002824 */  addiu      $t0, $at, 0x90
/* 5ADA4 8006D184 C9B4010C */  jal        func_8006D324
/* 5ADA8 8006D188 D8002924 */   addiu     $t1, $at, 0xD8
/* 5ADAC 8006D18C F0002324 */  addiu      $v1, $at, 0xF0
/* 5ADB0 8006D190 F2B4010C */  jal        func_8006D3C8
/* 5ADB4 8006D194 C0002824 */   addiu     $t0, $at, 0xC0
/* 5ADB8 8006D198 380034AC */  sw         $s4, 0x38($at)
/* 5ADBC 8006D19C A8002324 */  addiu      $v1, $at, 0xA8
/* 5ADC0 8006D1A0 E3B4010C */  jal        func_8006D38C
/* 5ADC4 8006D1A4 F0002824 */   addiu     $t0, $at, 0xF0
/* 5ADC8 8006D1A8 14000104 */  bgez       $zero, .L8006D1FC
/* 5ADCC 8006D1AC 98002E8C */   lw        $t6, 0x98($at)
.L8006D1B0:
/* 5ADD0 8006D1B0 96B4010C */  jal        func_8006D258
/* 5ADD4 8006D1B4 38002AAC */   sw        $t2, 0x38($at)
/* 5ADD8 8006D1B8 09F8E000 */  jalr       $a3
/* 5ADDC 8006D1BC C0002924 */   addiu     $t1, $at, 0xC0
/* 5ADE0 8006D1C0 F0002324 */  addiu      $v1, $at, 0xF0
/* 5ADE4 8006D1C4 09F8E000 */  jalr       $a3
/* 5ADE8 8006D1C8 A8002824 */   addiu     $t0, $at, 0xA8
/* 5ADEC 8006D1CC A8002324 */  addiu      $v1, $at, 0xA8
/* 5ADF0 8006D1D0 F0002824 */  addiu      $t0, $at, 0xF0
/* 5ADF4 8006D1D4 AFB4010C */  jal        func_8006D2BC
/* 5ADF8 8006D1D8 D8002924 */   addiu     $t1, $at, 0xD8
/* 5ADFC 8006D1DC 90002324 */  addiu      $v1, $at, 0x90
/* 5AE00 8006D1E0 E3B4010C */  jal        func_8006D38C
/* 5AE04 8006D1E4 A8002824 */   addiu     $t0, $at, 0xA8
/* 5AE08 8006D1E8 380034AC */  sw         $s4, 0x38($at)
/* 5AE0C 8006D1EC F0002324 */  addiu      $v1, $at, 0xF0
/* 5AE10 8006D1F0 F2B4010C */  jal        func_8006D3C8
/* 5AE14 8006D1F4 C0002824 */   addiu     $t0, $at, 0xC0
/* 5AE18 8006D1F8 98002E8C */  lw         $t6, 0x98($at)
.L8006D1FC:
/* 5AE1C 8006D1FC A0002CC8 */  lwc2       $12, 0xA0($at)
/* 5AE20 8006D200 A40031C8 */  lwc2       $17, 0xA4($at)
/* 5AE24 8006D204 B8002DC8 */  lwc2       $13, 0xB8($at)
/* 5AE28 8006D208 BC0032C8 */  lwc2       $18, 0xBC($at)
/* 5AE2C 8006D20C D0002EC8 */  lwc2       $14, 0xD0($at)
/* 5AE30 8006D210 5400268C */  lw         $a2, 0x54($at)
/* 5AE34 8006D214 D40033C8 */  lwc2       $19, 0xD4($at)
/* 5AE38 8006D218 500026AC */  sw         $a2, 0x50($at)
/* 5AE3C 8006D21C 84003F8C */  lw         $ra, 0x84($at)
/* 5AE40 8006D220 B0002F8C */  lw         $t7, 0xB0($at)
/* 5AE44 8006D224 0800E003 */  jr         $ra
/* 5AE48 8006D228 C800308C */   lw        $s0, 0xC8($at)
.L8006D22C:
/* 5AE4C 8006D22C 98002EAC */  sw         $t6, 0x98($at)
/* 5AE50 8006D230 B0002FAC */  sw         $t7, 0xB0($at)
/* 5AE54 8006D234 C80030AC */  sw         $s0, 0xC8($at)
/* 5AE58 8006D238 38002AAC */  sw         $t2, 0x38($at)
/* 5AE5C 8006D23C 09F88000 */  jalr       $a0
/* 5AE60 8006D240 9E002884 */   lh        $t0, 0x9E($at)
/* 5AE64 8006D244 84003F8C */  lw         $ra, 0x84($at)
/* 5AE68 8006D248 98002E8C */  lw         $t6, 0x98($at)
/* 5AE6C 8006D24C B0002F8C */  lw         $t7, 0xB0($at)
/* 5AE70 8006D250 0800E003 */  jr         $ra
/* 5AE74 8006D254 C800308C */   lw        $s0, 0xC8($at)
.size func_8006D094, . - func_8006D094
