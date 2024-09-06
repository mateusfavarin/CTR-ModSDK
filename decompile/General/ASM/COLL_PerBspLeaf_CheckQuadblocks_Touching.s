.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel COLL_PerBspLeaf_CheckQuadblocks_Touching
/* D210 8001F5F0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* D214 8001F5F4 1000B0AF */  sw         $s0, 0x10($sp)
/* D218 8001F5F8 1400B1AF */  sw         $s1, 0x14($sp)
/* D21C 8001F5FC 1800B2AF */  sw         $s2, 0x18($sp)
/* D220 8001F600 1C00BFAF */  sw         $ra, 0x1C($sp)
/* D224 8001F604 21908000 */  addu       $s2, $a0, $zero
/* D228 8001F608 0000438E */  lw         $v1, 0x0($s2)
/* D22C 8001F60C 2188A000 */  addu       $s1, $a1, $zero
/* D230 8001F610 02006330 */  andi       $v1, $v1, 0x2
/* D234 8001F614 04006010 */  beqz       $v1, .L8001F628
/* D238 8001F618 A401238E */   lw        $v1, 0x1A4($s1)
/* D23C 8001F61C 00000000 */  nop
/* D240 8001F620 00806334 */  ori        $v1, $v1, 0x8000
/* D244 8001F624 A40123AE */  sw         $v1, 0x1A4($s1)
.L8001F628:
/* D248 8001F628 1800508E */  lw         $s0, 0x18($s2)
/* D24C 8001F62C 1C00598E */  lw         $t9, 0x1C($s2)
.L8001F630:
/* D250 8001F630 21282002 */  addu       $a1, $s1, $zero
/* D254 8001F634 077D000C */  jal        COLL_PerQuadblock_CheckTriangles_Touching
/* D258 8001F638 21202003 */   addu      $a0, $t9, $zero
/* D25C 8001F63C FFFF1026 */  addiu      $s0, $s0, -0x1
/* D260 8001F640 FBFF001E */  bgtz       $s0, .L8001F630
/* D264 8001F644 5C003927 */   addiu     $t9, $t9, 0x5C
/* D268 8001F648 22002386 */  lh         $v1, 0x22($s1)
/* D26C 8001F64C 00000000 */  nop
/* D270 8001F650 01006330 */  andi       $v1, $v1, 0x1
/* D274 8001F654 03006010 */  beqz       $v1, .L8001F664
/* D278 8001F658 21282002 */   addu      $a1, $s1, $zero
/* D27C 8001F65C 8475000C */  jal        DECOMP_COLL_PerBspLeaf_CheckInstances
/* D280 8001F660 21204002 */   addu      $a0, $s2, $zero
.L8001F664:
/* D284 8001F664 1C00BF8F */  lw         $ra, 0x1C($sp)
/* D288 8001F668 1800B28F */  lw         $s2, 0x18($sp)
/* D28C 8001F66C 1400B18F */  lw         $s1, 0x14($sp)
/* D290 8001F670 1000B08F */  lw         $s0, 0x10($sp)
/* D294 8001F674 0800E003 */  jr         $ra
/* D298 8001F678 2000BD27 */   addiu     $sp, $sp, 0x20
.size COLL_PerBspLeaf_CheckQuadblocks_Touching, . - COLL_PerBspLeaf_CheckQuadblocks_Touching
