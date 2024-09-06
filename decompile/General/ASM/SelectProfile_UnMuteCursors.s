.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel SelectProfile_UnMuteCursors
/* 36A04 80048DE4 7FFF063C */  lui        $a2, (0xFF7FFFFF >> 16)
/* 36A08 80048DE8 0880033C */  lui        $v1, %hi(D_80085B88)
/* 36A0C 80048DEC 885B6324 */  addiu      $v1, $v1, %lo(D_80085B88)
/* 36A10 80048DF0 FFFFC634 */  ori        $a2, $a2, (0xFF7FFFFF & 0xFFFF)
/* 36A14 80048DF4 0880043C */  lui        $a0, %hi(D_80085BB4)
/* 36A18 80048DF8 B45B8424 */  addiu      $a0, $a0, %lo(D_80085BB4)
/* 36A1C 80048DFC 0880053C */  lui        $a1, %hi(D_80085BE0)
/* 36A20 80048E00 0800628C */  lw         $v0, 0x8($v1)
/* 36A24 80048E04 E05BA524 */  addiu      $a1, $a1, %lo(D_80085BE0)
/* 36A28 80048E08 24104600 */  and        $v0, $v0, $a2
/* 36A2C 80048E0C 080062AC */  sw         $v0, 0x8($v1)
/* 36A30 80048E10 0800828C */  lw         $v0, 0x8($a0)
/* 36A34 80048E14 0800A38C */  lw         $v1, 0x8($a1)
/* 36A38 80048E18 24104600 */  and        $v0, $v0, $a2
/* 36A3C 80048E1C 24186600 */  and        $v1, $v1, $a2
/* 36A40 80048E20 080082AC */  sw         $v0, 0x8($a0)
/* 36A44 80048E24 0800E003 */  jr         $ra
/* 36A48 80048E28 0800A3AC */   sw        $v1, 0x8($a1)
.size SelectProfile_UnMuteCursors, . - SelectProfile_UnMuteCursors
