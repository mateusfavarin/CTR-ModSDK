.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel ThTick_FastRET
/* 5F2B4 80071694 801F013C */  lui        $at, (0x1F8000B0 >> 16)
/* 5F2B8 80071698 1400838C */  lw         $v1, 0x14($a0)
/* 5F2BC 8007169C E400228C */  lw         $v0, (0x1F8000E4 & 0xFFFF)($at)
/* 5F2C0 800716A0 D4003D8C */  lw         $sp, (0x1F8000D4 & 0xFFFF)($at)
/* 5F2C4 800716A4 E0FF6010 */  beqz       $v1, .L80071628
/* 5F2C8 800716A8 E80043AC */   sw        $v1, 0xE8($v0)
/* 5F2CC 800716AC DEFF0104 */  bgez       $zero, .L80071628
/* 5F2D0 800716B0 04004224 */   addiu     $v0, $v0, 0x4
glabel .L800716B4
/* 5F2D4 800716B4 DC003F8C */  lw         $ra, (0x1F8000DC & 0xFFFF)($at)
/* 5F2D8 800716B8 D8003E8C */  lw         $fp, (0x1F8000D8 & 0xFFFF)($at)
/* 5F2DC 800716BC D4003D8C */  lw         $sp, (0x1F8000D4 & 0xFFFF)($at)
/* 5F2E0 800716C0 D0003C8C */  lw         $gp, (0x1F8000D0 & 0xFFFF)($at)
/* 5F2E4 800716C4 CC00378C */  lw         $s7, (0x1F8000CC & 0xFFFF)($at)
/* 5F2E8 800716C8 C800368C */  lw         $s6, (0x1F8000C8 & 0xFFFF)($at)
/* 5F2EC 800716CC C400358C */  lw         $s5, (0x1F8000C4 & 0xFFFF)($at)
/* 5F2F0 800716D0 C000348C */  lw         $s4, (0x1F8000C0 & 0xFFFF)($at)
/* 5F2F4 800716D4 BC00338C */  lw         $s3, (0x1F8000BC & 0xFFFF)($at)
/* 5F2F8 800716D8 B800328C */  lw         $s2, (0x1F8000B8 & 0xFFFF)($at)
/* 5F2FC 800716DC B400318C */  lw         $s1, (0x1F8000B4 & 0xFFFF)($at)
/* 5F300 800716E0 B000308C */  lw         $s0, (0x1F8000B0 & 0xFFFF)($at)
/* 5F304 800716E4 0800E003 */  jr         $ra
/* 5F308 800716E8 00000000 */   nop
.size ThTick_FastRET, . - ThTick_FastRET
