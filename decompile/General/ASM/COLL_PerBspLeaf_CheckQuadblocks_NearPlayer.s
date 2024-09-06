.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel COLL_PerBspLeaf_CheckQuadblocks_NearPlayer
/* DEC8 800202A8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* DECC 800202AC 1000B0AF */  sw         $s0, 0x10($sp)
/* DED0 800202B0 1400B1AF */  sw         $s1, 0x14($sp)
/* DED4 800202B4 1800B2AF */  sw         $s2, 0x18($sp)
/* DED8 800202B8 1C00BFAF */  sw         $ra, 0x1C($sp)
/* DEDC 800202BC 21908000 */  addu       $s2, $a0, $zero
/* DEE0 800202C0 0000438E */  lw         $v1, 0x0($s2)
/* DEE4 800202C4 2188A000 */  addu       $s1, $a1, $zero
/* DEE8 800202C8 02006330 */  andi       $v1, $v1, 0x2
/* DEEC 800202CC 04006010 */  beqz       $v1, .L800202E0
/* DEF0 800202D0 A401238E */   lw        $v1, 0x1A4($s1)
/* DEF4 800202D4 00000000 */  nop
/* DEF8 800202D8 00806334 */  ori        $v1, $v1, 0x8000
/* DEFC 800202DC A40123AE */  sw         $v1, 0x1A4($s1)
.L800202E0:
/* DF00 800202E0 1800508E */  lw         $s0, 0x18($s2)
/* DF04 800202E4 1C00598E */  lw         $t9, 0x1C($s2)
.L800202E8:
/* DF08 800202E8 21282002 */  addu       $a1, $s1, $zero
/* DF0C 800202EC 1980000C */  jal        COLL_PerQuadblock_CheckTriangles_NearPlayer
/* DF10 800202F0 21202003 */   addu      $a0, $t9, $zero
/* DF14 800202F4 FFFF1026 */  addiu      $s0, $s0, -0x1
/* DF18 800202F8 FBFF001E */  bgtz       $s0, .L800202E8
/* DF1C 800202FC 5C003927 */   addiu     $t9, $t9, 0x5C
/* DF20 80020300 22002386 */  lh         $v1, 0x22($s1)
/* DF24 80020304 00000000 */  nop
/* DF28 80020308 01006330 */  andi       $v1, $v1, 0x1
/* DF2C 8002030C 03006010 */  beqz       $v1, .L8002031C
/* DF30 80020310 21282002 */   addu      $a1, $s1, $zero
/* DF34 80020314 8475000C */  jal        DECOMP_COLL_PerBspLeaf_CheckInstances
/* DF38 80020318 21204002 */   addu      $a0, $s2, $zero
.L8002031C:
/* DF3C 8002031C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* DF40 80020320 1800B28F */  lw         $s2, 0x18($sp)
/* DF44 80020324 1400B18F */  lw         $s1, 0x14($sp)
/* DF48 80020328 1000B08F */  lw         $s0, 0x10($sp)
/* DF4C 8002032C 0800E003 */  jr         $ra
/* DF50 80020330 2000BD27 */   addiu     $sp, $sp, 0x20
.size COLL_PerBspLeaf_CheckQuadblocks_NearPlayer, . - COLL_PerBspLeaf_CheckQuadblocks_NearPlayer
