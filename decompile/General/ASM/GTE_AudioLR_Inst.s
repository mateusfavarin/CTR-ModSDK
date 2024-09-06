.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel GTE_AudioLR_Inst
/* 1C17C 8002E55C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1C180 8002E560 1800B0AF */  sw         $s0, 0x18($sp)
/* 1C184 8002E564 2180A000 */  addu       $s0, $a1, $zero
/* 1C188 8002E568 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 1C18C 8002E56C 00000296 */  lhu        $v0, 0x0($s0)
/* 1C190 8002E570 00000000 */  nop
/* 1C194 8002E574 1000A2A7 */  sh         $v0, 0x10($sp)
/* 1C198 8002E578 04000296 */  lhu        $v0, 0x4($s0)
/* 1C19C 8002E57C 00000000 */  nop
/* 1C1A0 8002E580 1200A2A7 */  sh         $v0, 0x12($sp)
/* 1C1A4 8002E584 08000296 */  lhu        $v0, 0x8($s0)
/* 1C1A8 8002E588 3FC6010C */  jal        SetRotMatrix
/* 1C1AC 8002E58C 1400A2A7 */   sh        $v0, 0x14($sp)
/* 1C1B0 8002E590 1000A227 */  addiu      $v0, $sp, 0x10
/* 1C1B4 8002E594 000040C8 */  lwc2       $0, 0x0($v0)
/* 1C1B8 8002E598 040041C8 */  lwc2       $1, 0x4($v0)
/* 1C1BC 8002E59C 00000000 */  nop
/* 1C1C0 8002E5A0 00000000 */  nop
/* 1C1C4 8002E5A4 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 1C1C8 8002E5A8 000019EA */  swc2       $25, 0x0($s0)
/* 1C1CC 8002E5AC 04000226 */  addiu      $v0, $s0, 0x4
/* 1C1D0 8002E5B0 00005AE8 */  swc2       $26, 0x0($v0) /* handwritten instruction */
/* 1C1D4 8002E5B4 08001026 */  addiu      $s0, $s0, 0x8
/* 1C1D8 8002E5B8 00001BEA */  swc2       $27, 0x0($s0) /* handwritten instruction */
/* 1C1DC 8002E5BC 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 1C1E0 8002E5C0 1800B08F */  lw         $s0, 0x18($sp)
/* 1C1E4 8002E5C4 0800E003 */  jr         $ra
/* 1C1E8 8002E5C8 2000BD27 */   addiu     $sp, $sp, 0x20
.size GTE_AudioLR_Inst, . - GTE_AudioLR_Inst
