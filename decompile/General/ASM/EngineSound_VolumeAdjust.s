.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel EngineSound_VolumeAdjust
/* 1D848 8002FC28 23188500 */  subu       $v1, $a0, $a1
/* 1D84C 8002FC2C 02006104 */  bgez       $v1, .L8002FC38
/* 1D850 8002FC30 21106000 */   addu      $v0, $v1, $zero
/* 1D854 8002FC34 23100200 */  negu       $v0, $v0
.L8002FC38:
/* 1D858 8002FC38 2A10C200 */  slt        $v0, $a2, $v0
/* 1D85C 8002FC3C 05004010 */  beqz       $v0, .L8002FC54
/* 1D860 8002FC40 00000000 */   nop
/* 1D864 8002FC44 0500601C */  bgtz       $v1, .L8002FC5C
/* 1D868 8002FC48 2110A600 */   addu      $v0, $a1, $a2
/* 1D86C 8002FC4C 0800E003 */  jr         $ra
/* 1D870 8002FC50 2310A600 */   subu      $v0, $a1, $a2
.L8002FC54:
/* 1D874 8002FC54 0800E003 */  jr         $ra
/* 1D878 8002FC58 21108000 */   addu      $v0, $a0, $zero
.L8002FC5C:
/* 1D87C 8002FC5C 0800E003 */  jr         $ra
/* 1D880 8002FC60 00000000 */   nop
.size EngineSound_VolumeAdjust, . - EngineSound_VolumeAdjust
