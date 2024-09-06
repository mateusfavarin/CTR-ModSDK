.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_8006D2BC
/* 5AEDC 8006D2BC F00022C8 */  lwc2       $2, 0xF0($at)
/* 5AEE0 8006D2C0 F40023C8 */  lwc2       $3, 0xF4($at)
/* 5AEE4 8006D2C4 D80024C8 */  lwc2       $4, 0xD8($at)
/* 5AEE8 8006D2C8 DC0025C8 */  lwc2       $5, 0xDC($at)
/* 5AEEC 8006D2CC 5000268C */  lw         $a2, 0x50($at)
/* 5AEF0 8006D2D0 08006E8C */  lw         $t6, 0x8($v1)
/* 5AEF4 8006D2D4 3000284A */  RTPT
/* 5AEF8 8006D2D8 08000F8D */  lw         $t7, 0x8($t0)
/* 5AEFC 8006D2DC 0700C010 */  beqz       $a2, .L8006D2FC
/* 5AF00 8006D2E0 0800308D */   lw        $s0, 0x8($t1)
/* 5AF04 8006D2E4 0C006A84 */  lh         $t2, 0xC($v1)
/* 5AF08 8006D2E8 0C000585 */  lh         $a1, 0xC($t0)
/* 5AF0C 8006D2EC 0C002685 */  lh         $a2, 0xC($t1)
/* 5AF10 8006D2F0 60002AA4 */  sh         $t2, 0x60($at)
/* 5AF14 8006D2F4 640025A4 */  sh         $a1, 0x64($at)
/* 5AF18 8006D2F8 680026A4 */  sh         $a2, 0x68($at)
.L8006D2FC:
/* 5AF1C 8006D2FC 00012DE8 */  swc2       $13, 0x100($at)
/* 5AF20 8006D300 040132E8 */  swc2       $18, 0x104($at)
/* 5AF24 8006D304 E8002EE8 */  swc2       $14, 0xE8($at)
/* 5AF28 8006D308 EC0033E8 */  swc2       $19, 0xEC($at)
/* 5AF2C 8006D30C 10006CC8 */  lwc2       $12, 0x10($v1)
/* 5AF30 8006D310 140071C8 */  lwc2       $17, 0x14($v1)
/* 5AF34 8006D314 10000DC9 */  lwc2       $13, 0x10($t0)
/* 5AF38 8006D318 140012C9 */  lwc2       $18, 0x14($t0)
/* 5AF3C 8006D31C 08008000 */  jr         $a0
/* 5AF40 8006D320 0E006884 */   lh        $t0, 0xE($v1)
glabel func_8006D324
/* 5AF44 8006D324 F00022C8 */  lwc2       $2, 0xF0($at)
/* 5AF48 8006D328 F40023C8 */  lwc2       $3, 0xF4($at)
/* 5AF4C 8006D32C D80024C8 */  lwc2       $4, 0xD8($at)
/* 5AF50 8006D330 DC0025C8 */  lwc2       $5, 0xDC($at)
/* 5AF54 8006D334 5000268C */  lw         $a2, 0x50($at)
/* 5AF58 8006D338 08006E8C */  lw         $t6, 0x8($v1)
/* 5AF5C 8006D33C 3000284A */  RTPT
/* 5AF60 8006D340 08000F8D */  lw         $t7, 0x8($t0)
/* 5AF64 8006D344 0700C010 */  beqz       $a2, .L8006D364
/* 5AF68 8006D348 0800308D */   lw        $s0, 0x8($t1)
/* 5AF6C 8006D34C 0C006A84 */  lh         $t2, 0xC($v1)
/* 5AF70 8006D350 0C000585 */  lh         $a1, 0xC($t0)
/* 5AF74 8006D354 0C002685 */  lh         $a2, 0xC($t1)
/* 5AF78 8006D358 60002AA4 */  sh         $t2, 0x60($at)
/* 5AF7C 8006D35C 640025A4 */  sh         $a1, 0x64($at)
/* 5AF80 8006D360 680026A4 */  sh         $a2, 0x68($at)
.L8006D364:
/* 5AF84 8006D364 00012DE8 */  swc2       $13, 0x100($at)
/* 5AF88 8006D368 040132E8 */  swc2       $18, 0x104($at)
/* 5AF8C 8006D36C E8002EE8 */  swc2       $14, 0xE8($at)
/* 5AF90 8006D370 EC0033E8 */  swc2       $19, 0xEC($at)
/* 5AF94 8006D374 10006CC8 */  lwc2       $12, 0x10($v1)
/* 5AF98 8006D378 140071C8 */  lwc2       $17, 0x14($v1)
/* 5AF9C 8006D37C 10000DC9 */  lwc2       $13, 0x10($t0)
/* 5AFA0 8006D380 140012C9 */  lwc2       $18, 0x14($t0)
/* 5AFA4 8006D384 08008000 */  jr         $a0
/* 5AFA8 8006D388 0E000885 */   lh        $t0, 0xE($t0)
glabel func_8006D38C
/* 5AFAC 8006D38C 5000268C */  lw         $a2, 0x50($at)
/* 5AFB0 8006D390 10006CC8 */  lwc2       $12, 0x10($v1)
/* 5AFB4 8006D394 140071C8 */  lwc2       $17, 0x14($v1)
/* 5AFB8 8006D398 10000DC9 */  lwc2       $13, 0x10($t0)
/* 5AFBC 8006D39C 140012C9 */  lwc2       $18, 0x14($t0)
/* 5AFC0 8006D3A0 08006E8C */  lw         $t6, 0x8($v1)
/* 5AFC4 8006D3A4 08000F8D */  lw         $t7, 0x8($t0)
/* 5AFC8 8006D3A8 0500C010 */  beqz       $a2, .L8006D3C0
/* 5AFCC 8006D3AC E000308C */   lw        $s0, 0xE0($at)
/* 5AFD0 8006D3B0 0C006A84 */  lh         $t2, 0xC($v1)
/* 5AFD4 8006D3B4 0C000585 */  lh         $a1, 0xC($t0)
/* 5AFD8 8006D3B8 60002AA4 */  sh         $t2, 0x60($at)
/* 5AFDC 8006D3BC 640025A4 */  sh         $a1, 0x64($at)
.L8006D3C0:
/* 5AFE0 8006D3C0 08008000 */  jr         $a0
/* 5AFE4 8006D3C4 0E006884 */   lh        $t0, 0xE($v1)
glabel func_8006D3C8
/* 5AFE8 8006D3C8 5000268C */  lw         $a2, 0x50($at)
/* 5AFEC 8006D3CC 10006CC8 */  lwc2       $12, 0x10($v1)
/* 5AFF0 8006D3D0 140071C8 */  lwc2       $17, 0x14($v1)
/* 5AFF4 8006D3D4 10000DC9 */  lwc2       $13, 0x10($t0)
/* 5AFF8 8006D3D8 140012C9 */  lwc2       $18, 0x14($t0)
/* 5AFFC 8006D3DC 08006E8C */  lw         $t6, 0x8($v1)
/* 5B000 8006D3E0 08000F8D */  lw         $t7, 0x8($t0)
/* 5B004 8006D3E4 0500C010 */  beqz       $a2, .L8006D3FC
/* 5B008 8006D3E8 E000308C */   lw        $s0, 0xE0($at)
/* 5B00C 8006D3EC 0C006A84 */  lh         $t2, 0xC($v1)
/* 5B010 8006D3F0 0C000585 */  lh         $a1, 0xC($t0)
/* 5B014 8006D3F4 60002AA4 */  sh         $t2, 0x60($at)
/* 5B018 8006D3F8 640025A4 */  sh         $a1, 0x64($at)
.L8006D3FC:
/* 5B01C 8006D3FC 08008000 */  jr         $a0
/* 5B020 8006D400 0E000885 */   lh        $t0, 0xE($t0)
/* 5B024 8006D404 88003FAC */  sw         $ra, 0x88($at)
/* 5B028 8006D408 29B5010C */  jal        func_8006D4A4
/* 5B02C 8006D40C 00000000 */   nop
/* 5B030 8006D410 88003F8C */  lw         $ra, 0x88($at)
/* 5B034 8006D414 FF000624 */  addiu      $a2, $zero, 0xFF
/* 5B038 8006D418 080066A0 */  sb         $a2, 0x8($v1)
/* 5B03C 8006D41C 090066A0 */  sb         $a2, 0x9($v1)
/* 5B040 8006D420 0800E003 */  jr         $ra
/* 5B044 8006D424 0A0066A0 */   sb        $a2, 0xA($v1)
.size func_8006D2BC, . - func_8006D2BC
