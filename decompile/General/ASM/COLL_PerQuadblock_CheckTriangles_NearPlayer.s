.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel COLL_PerQuadblock_CheckTriangles_NearPlayer
/* DC84 80020064 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* DC88 80020068 1000B0AF */  sw         $s0, 0x10($sp)
/* DC8C 8002006C 1400B1AF */  sw         $s1, 0x14($sp)
/* DC90 80020070 1800B2AF */  sw         $s2, 0x18($sp)
/* DC94 80020074 1C00B3AF */  sw         $s3, 0x1C($sp)
/* DC98 80020078 2000B4AF */  sw         $s4, 0x20($sp)
/* DC9C 8002007C 2400B5AF */  sw         $s5, 0x24($sp)
/* DCA0 80020080 2800B6AF */  sw         $s6, 0x28($sp)
/* DCA4 80020084 2C00BFAF */  sw         $ra, 0x2C($sp)
/* DCA8 80020088 21C88000 */  addu       $t9, $a0, $zero
/* DCAC 8002008C 2120A000 */  addu       $a0, $a1, $zero
/* DCB0 80020090 640099AC */  sw         $t9, 0x64($a0)
/* DCB4 80020094 12002387 */  lh         $v1, 0x12($t9)
/* DCB8 80020098 2400888C */  lw         $t0, 0x24($a0)
/* DCBC 8002009C 2800898C */  lw         $t1, 0x28($a0)
/* DCC0 800200A0 24400301 */  and        $t0, $t0, $v1
/* DCC4 800200A4 76000011 */  beqz       $t0, .L80020280
/* DCC8 800200A8 24482301 */   and       $t1, $t1, $v1
/* DCCC 800200AC 74002015 */  bnez       $t1, .L80020280
/* DCD0 800200B0 2C00298F */   lw        $t1, 0x2C($t9)
/* DCD4 800200B4 38008884 */  lh         $t0, 0x38($a0)
/* DCD8 800200B8 03540900 */  sra        $t2, $t1, 16
/* DCDC 800200BC 23504801 */  subu       $t2, $t2, $t0
/* DCE0 800200C0 6F00401D */  bgtz       $t2, .L80020280
/* DCE4 800200C4 36008884 */   lh        $t0, 0x36($a0)
/* DCE8 800200C8 00540900 */  sll        $t2, $t1, 16
/* DCEC 800200CC 03540A00 */  sra        $t2, $t2, 16
/* DCF0 800200D0 23504801 */  subu       $t2, $t2, $t0
/* DCF4 800200D4 6A00401D */  bgtz       $t2, .L80020280
/* DCF8 800200D8 3000298F */   lw        $t1, 0x30($t9)
/* DCFC 800200DC 30008884 */  lh         $t0, 0x30($a0)
/* DD00 800200E0 03540900 */  sra        $t2, $t1, 16
/* DD04 800200E4 23500A01 */  subu       $t2, $t0, $t2
/* DD08 800200E8 6500401D */  bgtz       $t2, .L80020280
/* DD0C 800200EC 3A008884 */   lh        $t0, 0x3A($a0)
/* DD10 800200F0 00540900 */  sll        $t2, $t1, 16
/* DD14 800200F4 03540A00 */  sra        $t2, $t2, 16
/* DD18 800200F8 23504801 */  subu       $t2, $t2, $t0
/* DD1C 800200FC 6000401D */  bgtz       $t2, .L80020280
/* DD20 80020100 3400298F */   lw        $t1, 0x34($t9)
/* DD24 80020104 34008884 */  lh         $t0, 0x34($a0)
/* DD28 80020108 03540900 */  sra        $t2, $t1, 16
/* DD2C 8002010C 23500A01 */  subu       $t2, $t0, $t2
/* DD30 80020110 5B00401D */  bgtz       $t2, .L80020280
/* DD34 80020114 32008884 */   lh        $t0, 0x32($a0)
/* DD38 80020118 00540900 */  sll        $t2, $t1, 16
/* DD3C 8002011C 03540A00 */  sra        $t2, $t2, 16
/* DD40 80020120 23500A01 */  subu       $t2, $t0, $t2
/* DD44 80020124 22008384 */  lh         $v1, 0x22($a0)
/* DD48 80020128 5500401D */  bgtz       $t2, .L80020280
/* DD4C 8002012C 02006830 */   andi      $t0, $v1, 0x2
/* DD50 80020130 42000011 */  beqz       $t0, .L8002023C
/* DD54 80020134 08006830 */   andi      $t0, $v1, 0x8
/* DD58 80020138 03000015 */  bnez       $t0, .L80020148
/* DD5C 8002013C 00000000 */   nop
/* DD60 80020140 BC7D000C */  jal        COLL_TestQuadblock_EightTris
/* DD64 80020144 21282003 */   addu      $a1, $t9, $zero
.L80020148:
/* DD68 80020148 02000324 */  addiu      $v1, $zero, 0x2
/* DD6C 8002014C 630083A0 */  sb         $v1, 0x63($a0)
/* DD70 80020150 F0008524 */  addiu      $a1, $a0, 0xF0
/* DD74 80020154 40018624 */  addiu      $a2, $a0, 0x140
/* DD78 80020158 107F000C */  jal        COLL_TestTriangle_FindClosest
/* DD7C 8002015C 54018724 */   addiu     $a3, $a0, 0x154
/* DD80 80020160 03000324 */  addiu      $v1, $zero, 0x3
/* DD84 80020164 630083A0 */  sb         $v1, 0x63($a0)
/* DD88 80020168 40018524 */  addiu      $a1, $a0, 0x140
/* DD8C 8002016C 68018624 */  addiu      $a2, $a0, 0x168
/* DD90 80020170 107F000C */  jal        COLL_TestTriangle_FindClosest
/* DD94 80020174 54018724 */   addiu     $a3, $a0, 0x154
/* DD98 80020178 04000324 */  addiu      $v1, $zero, 0x4
/* DD9C 8002017C 630083A0 */  sb         $v1, 0x63($a0)
/* DDA0 80020180 68018524 */  addiu      $a1, $a0, 0x168
/* DDA4 80020184 40018624 */  addiu      $a2, $a0, 0x140
/* DDA8 80020188 107F000C */  jal        COLL_TestTriangle_FindClosest
/* DDAC 8002018C 04018724 */   addiu     $a3, $a0, 0x104
/* DDB0 80020190 05000324 */  addiu      $v1, $zero, 0x5
/* DDB4 80020194 54018524 */  addiu      $a1, $a0, 0x154
/* DDB8 80020198 68018624 */  addiu      $a2, $a0, 0x168
/* DDBC 8002019C 107F000C */  jal        COLL_TestTriangle_FindClosest
/* DDC0 800201A0 18018724 */   addiu     $a3, $a0, 0x118
/* DDC4 800201A4 0400298F */  lw         $t1, 0x4($t9)
/* DDC8 800201A8 06000324 */  addiu      $v1, $zero, 0x6
/* DDCC 800201AC 02440900 */  srl        $t0, $t1, 16
/* DDD0 800201B0 FFFF2931 */  andi       $t1, $t1, 0xFFFF
/* DDD4 800201B4 32000911 */  beq        $t0, $t1, .L80020280
/* DDD8 800201B8 630083A0 */   sb        $v1, 0x63($a0)
/* DDDC 800201BC 90018524 */  addiu      $a1, $a0, 0x190
/* DDE0 800201C0 68018624 */  addiu      $a2, $a0, 0x168
/* DDE4 800201C4 107F000C */  jal        COLL_TestTriangle_FindClosest
/* DDE8 800201C8 7C018724 */   addiu     $a3, $a0, 0x17C
/* DDEC 800201CC 07000324 */  addiu      $v1, $zero, 0x7
/* DDF0 800201D0 630083A0 */  sb         $v1, 0x63($a0)
/* DDF4 800201D4 7C018524 */  addiu      $a1, $a0, 0x17C
/* DDF8 800201D8 2C018624 */  addiu      $a2, $a0, 0x12C
/* DDFC 800201DC 107F000C */  jal        COLL_TestTriangle_FindClosest
/* DE00 800201E0 90018724 */   addiu     $a3, $a0, 0x190
/* DE04 800201E4 08000324 */  addiu      $v1, $zero, 0x8
/* DE08 800201E8 630083A0 */  sb         $v1, 0x63($a0)
/* DE0C 800201EC 04018524 */  addiu      $a1, $a0, 0x104
/* DE10 800201F0 7C018624 */  addiu      $a2, $a0, 0x17C
/* DE14 800201F4 107F000C */  jal        COLL_TestTriangle_FindClosest
/* DE18 800201F8 68018724 */   addiu     $a3, $a0, 0x168
/* DE1C 800201FC 09000324 */  addiu      $v1, $zero, 0x9
/* DE20 80020200 630083A0 */  sb         $v1, 0x63($a0)
/* DE24 80020204 18018524 */  addiu      $a1, $a0, 0x118
/* DE28 80020208 68018624 */  addiu      $a2, $a0, 0x168
/* DE2C 8002020C 107F000C */  jal        COLL_TestTriangle_FindClosest
/* DE30 80020210 90018724 */   addiu     $a3, $a0, 0x190
/* DE34 80020214 2C00BF8F */  lw         $ra, 0x2C($sp)
/* DE38 80020218 2800B68F */  lw         $s6, 0x28($sp)
/* DE3C 8002021C 2400B58F */  lw         $s5, 0x24($sp)
/* DE40 80020220 2000B48F */  lw         $s4, 0x20($sp)
/* DE44 80020224 1C00B38F */  lw         $s3, 0x1C($sp)
/* DE48 80020228 1800B28F */  lw         $s2, 0x18($sp)
/* DE4C 8002022C 1400B18F */  lw         $s1, 0x14($sp)
/* DE50 80020230 1000B08F */  lw         $s0, 0x10($sp)
/* DE54 80020234 0800E003 */  jr         $ra
/* DE58 80020238 3000BD27 */   addiu     $sp, $sp, 0x30
.L8002023C:
/* DE5C 8002023C 9F7D000C */  jal        COLL_TestQuadblock_TwoTris
/* DE60 80020240 21282003 */   addu      $a1, $t9, $zero
/* DE64 80020244 630080A0 */  sb         $zero, 0x63($a0)
/* DE68 80020248 F0008524 */  addiu      $a1, $a0, 0xF0
/* DE6C 8002024C 04018624 */  addiu      $a2, $a0, 0x104
/* DE70 80020250 107F000C */  jal        COLL_TestTriangle_FindClosest
/* DE74 80020254 18018724 */   addiu     $a3, $a0, 0x118
/* DE78 80020258 0400298F */  lw         $t1, 0x4($t9)
/* DE7C 8002025C 01000324 */  addiu      $v1, $zero, 0x1
/* DE80 80020260 02440900 */  srl        $t0, $t1, 16
/* DE84 80020264 FFFF2931 */  andi       $t1, $t1, 0xFFFF
/* DE88 80020268 05000911 */  beq        $t0, $t1, .L80020280
/* DE8C 8002026C 630083A0 */   sb        $v1, 0x63($a0)
/* DE90 80020270 04018524 */  addiu      $a1, $a0, 0x104
/* DE94 80020274 2C018624 */  addiu      $a2, $a0, 0x12C
/* DE98 80020278 107F000C */  jal        COLL_TestTriangle_FindClosest
/* DE9C 8002027C 18018724 */   addiu     $a3, $a0, 0x118
.L80020280:
/* DEA0 80020280 2C00BF8F */  lw         $ra, 0x2C($sp)
/* DEA4 80020284 2800B68F */  lw         $s6, 0x28($sp)
/* DEA8 80020288 2400B58F */  lw         $s5, 0x24($sp)
/* DEAC 8002028C 2000B48F */  lw         $s4, 0x20($sp)
/* DEB0 80020290 1C00B38F */  lw         $s3, 0x1C($sp)
/* DEB4 80020294 1800B28F */  lw         $s2, 0x18($sp)
/* DEB8 80020298 1400B18F */  lw         $s1, 0x14($sp)
/* DEBC 8002029C 1000B08F */  lw         $s0, 0x10($sp)
/* DEC0 800202A0 0800E003 */  jr         $ra
/* DEC4 800202A4 3000BD27 */   addiu     $sp, $sp, 0x30
.size COLL_PerQuadblock_CheckTriangles_NearPlayer, . - COLL_PerQuadblock_CheckTriangles_NearPlayer
