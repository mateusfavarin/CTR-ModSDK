.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_80021EA8
/* FAC8 80021EA8 83300600 */  sra        $a2, $a2, 2
/* FACC 80021EAC 0900C010 */  beqz       $a2, .L80021ED4
/* FAD0 80021EB0 00000000 */   nop
.L80021EB4:
/* FAD4 80021EB4 0000A38C */  lw         $v1, 0x0($a1)
/* FAD8 80021EB8 0400A524 */  addiu      $a1, $a1, 0x4
/* FADC 80021EBC 0000828C */  lw         $v0, 0x0($a0)
/* FAE0 80021EC0 FFFFC624 */  addiu      $a2, $a2, -0x1
/* FAE4 80021EC4 25104300 */  or         $v0, $v0, $v1
/* FAE8 80021EC8 000082AC */  sw         $v0, 0x0($a0)
/* FAEC 80021ECC F9FFC014 */  bnez       $a2, .L80021EB4
/* FAF0 80021ED0 04008424 */   addiu     $a0, $a0, 0x4
.L80021ED4:
/* FAF4 80021ED4 0800E003 */  jr         $ra
/* FAF8 80021ED8 00000000 */   nop
.size func_80021EA8, . - func_80021EA8
