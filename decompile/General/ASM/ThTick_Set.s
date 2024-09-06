.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel ThTick_Set
/* 5F324 80071704 0800E003 */  jr         $ra
/* 5F328 80071708 2C0085AC */   sw        $a1, 0x2C($a0)
.size ThTick_Set, . - ThTick_Set
