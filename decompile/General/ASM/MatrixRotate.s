.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel MatrixRotate
/* 59FD0 8006C3B0 801F013C */  lui        $at, (0x1F80002C >> 16)
/* 59FD4 8006C3B4 000030AC */  sw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 59FD8 8006C3B8 040031AC */  sw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 59FDC 8006C3BC 080032AC */  sw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 59FE0 8006C3C0 0C0033AC */  sw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 59FE4 8006C3C4 100034AC */  sw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 59FE8 8006C3C8 2C003FAC */  sw         $ra, (0x1F80002C & 0xFFFF)($at)
/* 59FEC 8006C3CC 0000AB8C */  lw         $t3, 0x0($a1)
/* 59FF0 8006C3D0 0400AC8C */  lw         $t4, 0x4($a1)
/* 59FF4 8006C3D4 0800AD8C */  lw         $t5, 0x8($a1)
/* 59FF8 8006C3D8 0C00AE8C */  lw         $t6, 0xC($a1)
/* 59FFC 8006C3DC 50B1010C */  jal        func_8006C540
/* 5A000 8006C3E0 1000AF8C */   lw        $t7, 0x10($a1)
/* 5A004 8006C3E4 0000CB8C */  lw         $t3, 0x0($a2)
/* 5A008 8006C3E8 0400CC8C */  lw         $t4, 0x4($a2)
/* 5A00C 8006C3EC 0800CD8C */  lw         $t5, 0x8($a2)
/* 5A010 8006C3F0 0C00CE8C */  lw         $t6, 0xC($a2)
/* 5A014 8006C3F4 27B1010C */  jal        func_8006C49C
/* 5A018 8006C3F8 1000CF8C */   lw        $t7, 0x10($a2)
/* 5A01C 8006C3FC 00008BAC */  sw         $t3, 0x0($a0)
/* 5A020 8006C400 04008CAC */  sw         $t4, 0x4($a0)
/* 5A024 8006C404 08008DAC */  sw         $t5, 0x8($a0)
/* 5A028 8006C408 0C008EAC */  sw         $t6, 0xC($a0)
/* 5A02C 8006C40C 10008FAC */  sw         $t7, 0x10($a0)
/* 5A030 8006C410 2C003F8C */  lw         $ra, 0x2C($at)
/* 5A034 8006C414 1000348C */  lw         $s4, 0x10($at)
/* 5A038 8006C418 0C00338C */  lw         $s3, 0xC($at)
/* 5A03C 8006C41C 0800328C */  lw         $s2, 0x8($at)
/* 5A040 8006C420 0400318C */  lw         $s1, 0x4($at)
/* 5A044 8006C424 0000308C */  lw         $s0, 0x0($at)
/* 5A048 8006C428 0800E003 */  jr         $ra
/* 5A04C 8006C42C 00000000 */   nop
.size MatrixRotate, . - MatrixRotate
