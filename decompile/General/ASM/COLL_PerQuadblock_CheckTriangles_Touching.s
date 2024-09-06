.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel COLL_PerQuadblock_CheckTriangles_Touching
/* D03C 8001F41C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* D040 8001F420 1000B0AF */  sw         $s0, 0x10($sp)
/* D044 8001F424 1400B1AF */  sw         $s1, 0x14($sp)
/* D048 8001F428 1800B2AF */  sw         $s2, 0x18($sp)
/* D04C 8001F42C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* D050 8001F430 21C88000 */  addu       $t9, $a0, $zero
/* D054 8001F434 2120A000 */  addu       $a0, $a1, $zero
/* D058 8001F438 640099AC */  sw         $t9, 0x64($a0)
/* D05C 8001F43C 12002387 */  lh         $v1, 0x12($t9)
/* D060 8001F440 2400888C */  lw         $t0, 0x24($a0)
/* D064 8001F444 2800898C */  lw         $t1, 0x28($a0)
/* D068 8001F448 24400301 */  and        $t0, $t0, $v1
/* D06C 8001F44C 62000011 */  beqz       $t0, .L8001F5D8
/* D070 8001F450 24482301 */   and       $t1, $t1, $v1
/* D074 8001F454 60002015 */  bnez       $t1, .L8001F5D8
/* D078 8001F458 2C00298F */   lw        $t1, 0x2C($t9)
/* D07C 8001F45C 38008884 */  lh         $t0, 0x38($a0)
/* D080 8001F460 03540900 */  sra        $t2, $t1, 16
/* D084 8001F464 23504801 */  subu       $t2, $t2, $t0
/* D088 8001F468 5B00401D */  bgtz       $t2, .L8001F5D8
/* D08C 8001F46C 36008884 */   lh        $t0, 0x36($a0)
/* D090 8001F470 00540900 */  sll        $t2, $t1, 16
/* D094 8001F474 03540A00 */  sra        $t2, $t2, 16
/* D098 8001F478 23504801 */  subu       $t2, $t2, $t0
/* D09C 8001F47C 5600401D */  bgtz       $t2, .L8001F5D8
/* D0A0 8001F480 3000298F */   lw        $t1, 0x30($t9)
/* D0A4 8001F484 30008884 */  lh         $t0, 0x30($a0)
/* D0A8 8001F488 03540900 */  sra        $t2, $t1, 16
/* D0AC 8001F48C 23500A01 */  subu       $t2, $t0, $t2
/* D0B0 8001F490 5100401D */  bgtz       $t2, .L8001F5D8
/* D0B4 8001F494 3A008884 */   lh        $t0, 0x3A($a0)
/* D0B8 8001F498 00540900 */  sll        $t2, $t1, 16
/* D0BC 8001F49C 03540A00 */  sra        $t2, $t2, 16
/* D0C0 8001F4A0 23504801 */  subu       $t2, $t2, $t0
/* D0C4 8001F4A4 4C00401D */  bgtz       $t2, .L8001F5D8
/* D0C8 8001F4A8 3400298F */   lw        $t1, 0x34($t9)
/* D0CC 8001F4AC 34008884 */  lh         $t0, 0x34($a0)
/* D0D0 8001F4B0 03540900 */  sra        $t2, $t1, 16
/* D0D4 8001F4B4 23500A01 */  subu       $t2, $t0, $t2
/* D0D8 8001F4B8 4700401D */  bgtz       $t2, .L8001F5D8
/* D0DC 8001F4BC 32008884 */   lh        $t0, 0x32($a0)
/* D0E0 8001F4C0 00540900 */  sll        $t2, $t1, 16
/* D0E4 8001F4C4 03540A00 */  sra        $t2, $t2, 16
/* D0E8 8001F4C8 23500A01 */  subu       $t2, $t0, $t2
/* D0EC 8001F4CC 22008384 */  lh         $v1, 0x22($a0)
/* D0F0 8001F4D0 4100401D */  bgtz       $t2, .L8001F5D8
/* D0F4 8001F4D4 02006830 */   andi      $t0, $v1, 0x2
/* D0F8 8001F4D8 30000011 */  beqz       $t0, .L8001F59C
/* D0FC 8001F4DC 08006830 */   andi      $t0, $v1, 0x8
/* D100 8001F4E0 03000015 */  bnez       $t0, .L8001F4F0
/* D104 8001F4E4 00000000 */   nop
/* D108 8001F4E8 BC7D000C */  jal        COLL_TestQuadblock_EightTris
/* D10C 8001F4EC 21282003 */   addu      $a1, $t9, $zero
.L8001F4F0:
/* D110 8001F4F0 F0008524 */  addiu      $a1, $a0, 0xF0
/* D114 8001F4F4 40018624 */  addiu      $a2, $a0, 0x140
/* D118 8001F4F8 D47B000C */  jal        COLL_TestTriangle_FindAny
/* D11C 8001F4FC 54018724 */   addiu     $a3, $a0, 0x154
/* D120 8001F500 40018524 */  addiu      $a1, $a0, 0x140
/* D124 8001F504 68018624 */  addiu      $a2, $a0, 0x168
/* D128 8001F508 D47B000C */  jal        COLL_TestTriangle_FindAny
/* D12C 8001F50C 54018724 */   addiu     $a3, $a0, 0x154
/* D130 8001F510 68018524 */  addiu      $a1, $a0, 0x168
/* D134 8001F514 40018624 */  addiu      $a2, $a0, 0x140
/* D138 8001F518 D47B000C */  jal        COLL_TestTriangle_FindAny
/* D13C 8001F51C 04018724 */   addiu     $a3, $a0, 0x104
/* D140 8001F520 54018524 */  addiu      $a1, $a0, 0x154
/* D144 8001F524 68018624 */  addiu      $a2, $a0, 0x168
/* D148 8001F528 D47B000C */  jal        COLL_TestTriangle_FindAny
/* D14C 8001F52C 18018724 */   addiu     $a3, $a0, 0x118
/* D150 8001F530 0400288F */  lw         $t0, 0x4($t9)
/* D154 8001F534 00000000 */  nop
/* D158 8001F538 021C0800 */  srl        $v1, $t0, 16
/* D15C 8001F53C FFFF0831 */  andi       $t0, $t0, 0xFFFF
/* D160 8001F540 25006810 */  beq        $v1, $t0, .L8001F5D8
/* D164 8001F544 90018524 */   addiu     $a1, $a0, 0x190
/* D168 8001F548 68018624 */  addiu      $a2, $a0, 0x168
/* D16C 8001F54C D47B000C */  jal        COLL_TestTriangle_FindAny
/* D170 8001F550 7C018724 */   addiu     $a3, $a0, 0x17C
/* D174 8001F554 7C018524 */  addiu      $a1, $a0, 0x17C
/* D178 8001F558 2C018624 */  addiu      $a2, $a0, 0x12C
/* D17C 8001F55C D47B000C */  jal        COLL_TestTriangle_FindAny
/* D180 8001F560 90018724 */   addiu     $a3, $a0, 0x190
/* D184 8001F564 04018524 */  addiu      $a1, $a0, 0x104
/* D188 8001F568 7C018624 */  addiu      $a2, $a0, 0x17C
/* D18C 8001F56C D47B000C */  jal        COLL_TestTriangle_FindAny
/* D190 8001F570 68018724 */   addiu     $a3, $a0, 0x168
/* D194 8001F574 18018524 */  addiu      $a1, $a0, 0x118
/* D198 8001F578 68018624 */  addiu      $a2, $a0, 0x168
/* D19C 8001F57C D47B000C */  jal        COLL_TestTriangle_FindAny
/* D1A0 8001F580 90018724 */   addiu     $a3, $a0, 0x190
/* D1A4 8001F584 1C00BF8F */  lw         $ra, 0x1C($sp)
/* D1A8 8001F588 1800B28F */  lw         $s2, 0x18($sp)
/* D1AC 8001F58C 1400B18F */  lw         $s1, 0x14($sp)
/* D1B0 8001F590 1000B08F */  lw         $s0, 0x10($sp)
/* D1B4 8001F594 0800E003 */  jr         $ra
/* D1B8 8001F598 2000BD27 */   addiu     $sp, $sp, 0x20
.L8001F59C:
/* D1BC 8001F59C 9F7D000C */  jal        COLL_TestQuadblock_TwoTris
/* D1C0 8001F5A0 21282003 */   addu      $a1, $t9, $zero
/* D1C4 8001F5A4 F0008524 */  addiu      $a1, $a0, 0xF0
/* D1C8 8001F5A8 04018624 */  addiu      $a2, $a0, 0x104
/* D1CC 8001F5AC D47B000C */  jal        COLL_TestTriangle_FindAny
/* D1D0 8001F5B0 18018724 */   addiu     $a3, $a0, 0x118
/* D1D4 8001F5B4 0400288F */  lw         $t0, 0x4($t9)
/* D1D8 8001F5B8 00000000 */  nop
/* D1DC 8001F5BC 021C0800 */  srl        $v1, $t0, 16
/* D1E0 8001F5C0 FFFF0831 */  andi       $t0, $t0, 0xFFFF
/* D1E4 8001F5C4 04006810 */  beq        $v1, $t0, .L8001F5D8
/* D1E8 8001F5C8 04018524 */   addiu     $a1, $a0, 0x104
/* D1EC 8001F5CC 2C018624 */  addiu      $a2, $a0, 0x12C
/* D1F0 8001F5D0 D47B000C */  jal        COLL_TestTriangle_FindAny
/* D1F4 8001F5D4 18018724 */   addiu     $a3, $a0, 0x118
.L8001F5D8:
/* D1F8 8001F5D8 1C00BF8F */  lw         $ra, 0x1C($sp)
/* D1FC 8001F5DC 1800B28F */  lw         $s2, 0x18($sp)
/* D200 8001F5E0 1400B18F */  lw         $s1, 0x14($sp)
/* D204 8001F5E4 1000B08F */  lw         $s0, 0x10($sp)
/* D208 8001F5E8 0800E003 */  jr         $ra
/* D20C 8001F5EC 2000BD27 */   addiu     $sp, $sp, 0x20
.size COLL_PerQuadblock_CheckTriangles_Touching, . - COLL_PerQuadblock_CheckTriangles_Touching
