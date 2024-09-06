.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel GTE_AudioLR_Driver
/* 1C1EC 8002E5CC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1C1F0 8002E5D0 1800B0AF */  sw         $s0, 0x18($sp)
/* 1C1F4 8002E5D4 2180C000 */  addu       $s0, $a2, $zero
/* 1C1F8 8002E5D8 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 1C1FC 8002E5DC D402A28C */  lw         $v0, 0x2D4($a1)
/* 1C200 8002E5E0 14008394 */  lhu        $v1, 0x14($a0)
/* 1C204 8002E5E4 03120200 */  sra        $v0, $v0, 8
/* 1C208 8002E5E8 23104300 */  subu       $v0, $v0, $v1
/* 1C20C 8002E5EC 1000A2A7 */  sh         $v0, 0x10($sp)
/* 1C210 8002E5F0 D802A28C */  lw         $v0, 0x2D8($a1)
/* 1C214 8002E5F4 18008394 */  lhu        $v1, 0x18($a0)
/* 1C218 8002E5F8 03120200 */  sra        $v0, $v0, 8
/* 1C21C 8002E5FC 23104300 */  subu       $v0, $v0, $v1
/* 1C220 8002E600 1200A2A7 */  sh         $v0, 0x12($sp)
/* 1C224 8002E604 DC02A28C */  lw         $v0, 0x2DC($a1)
/* 1C228 8002E608 1C008394 */  lhu        $v1, 0x1C($a0)
/* 1C22C 8002E60C 03120200 */  sra        $v0, $v0, 8
/* 1C230 8002E610 23104300 */  subu       $v0, $v0, $v1
/* 1C234 8002E614 3FC6010C */  jal        SetRotMatrix
/* 1C238 8002E618 1400A2A7 */   sh        $v0, 0x14($sp)
/* 1C23C 8002E61C 1000A227 */  addiu      $v0, $sp, 0x10
/* 1C240 8002E620 000040C8 */  lwc2       $0, 0x0($v0)
/* 1C244 8002E624 040041C8 */  lwc2       $1, 0x4($v0)
/* 1C248 8002E628 00000000 */  nop
/* 1C24C 8002E62C 00000000 */  nop
/* 1C250 8002E630 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 1C254 8002E634 000019EA */  swc2       $25, 0x0($s0)
/* 1C258 8002E638 04000226 */  addiu      $v0, $s0, 0x4
/* 1C25C 8002E63C 00005AE8 */  swc2       $26, 0x0($v0) /* handwritten instruction */
/* 1C260 8002E640 08001026 */  addiu      $s0, $s0, 0x8
/* 1C264 8002E644 00001BEA */  swc2       $27, 0x0($s0) /* handwritten instruction */
/* 1C268 8002E648 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 1C26C 8002E64C 1800B08F */  lw         $s0, 0x18($sp)
/* 1C270 8002E650 0800E003 */  jr         $ra
/* 1C274 8002E654 2000BD27 */   addiu     $sp, $sp, 0x20
.size GTE_AudioLR_Driver, . - GTE_AudioLR_Driver
