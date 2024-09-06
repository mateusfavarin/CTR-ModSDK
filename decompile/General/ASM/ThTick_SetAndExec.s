.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel ThTick_SetAndExec
/* 5F30C 800716EC 801F013C */  lui        $at, (0x1F8000D4 >> 16)
/* 5F310 800716F0 D4003D8C */  lw         $sp, (0x1F8000D4 & 0xFFFF)($at)
/* 5F314 800716F4 07801F3C */  lui        $ra, (0x80071678 >> 16)
/* 5F318 800716F8 7816FF37 */  ori        $ra, $ra, (0x80071678 & 0xFFFF)
/* 5F31C 800716FC 0800A000 */  jr         $a1
/* 5F320 80071700 2C0085AC */   sw        $a1, 0x2C($a0)
.size ThTick_SetAndExec, . - ThTick_SetAndExec
