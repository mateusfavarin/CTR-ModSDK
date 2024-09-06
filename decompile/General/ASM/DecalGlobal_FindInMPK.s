.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel DecalGlobal_FindInMPK
/* 1094C 80022D2C 00008290 */  lbu        $v0, 0x0($a0)
/* 10950 80022D30 00000000 */  nop
/* 10954 80022D34 1A004010 */  beqz       $v0, .L80022DA0
/* 10958 80022D38 0C008624 */   addiu     $a2, $a0, 0xC
/* 1095C 80022D3C 0000A78C */  lw         $a3, 0x0($a1)
.L80022D40:
/* 10960 80022D40 0000828C */  lw         $v0, 0x0($a0)
/* 10964 80022D44 00000000 */  nop
/* 10968 80022D48 10004714 */  bne        $v0, $a3, .L80022D8C
/* 1096C 80022D4C 00000000 */   nop
/* 10970 80022D50 F8FFC38C */  lw         $v1, -0x8($a2)
/* 10974 80022D54 0400A28C */  lw         $v0, 0x4($a1)
/* 10978 80022D58 00000000 */  nop
/* 1097C 80022D5C 0B006214 */  bne        $v1, $v0, .L80022D8C
/* 10980 80022D60 00000000 */   nop
/* 10984 80022D64 FCFFC38C */  lw         $v1, -0x4($a2)
/* 10988 80022D68 0800A28C */  lw         $v0, 0x8($a1)
/* 1098C 80022D6C 00000000 */  nop
/* 10990 80022D70 06006214 */  bne        $v1, $v0, .L80022D8C
/* 10994 80022D74 00000000 */   nop
/* 10998 80022D78 0000C38C */  lw         $v1, 0x0($a2)
/* 1099C 80022D7C 0C00A28C */  lw         $v0, 0xC($a1)
/* 109A0 80022D80 00000000 */  nop
/* 109A4 80022D84 08006210 */  beq        $v1, $v0, .L80022DA8
/* 109A8 80022D88 21108000 */   addu      $v0, $a0, $zero
.L80022D8C:
/* 109AC 80022D8C 20008424 */  addiu      $a0, $a0, 0x20
/* 109B0 80022D90 00008290 */  lbu        $v0, 0x0($a0)
/* 109B4 80022D94 00000000 */  nop
/* 109B8 80022D98 E9FF4014 */  bnez       $v0, .L80022D40
/* 109BC 80022D9C 2000C624 */   addiu     $a2, $a2, 0x20
.L80022DA0:
/* 109C0 80022DA0 0800E003 */  jr         $ra
/* 109C4 80022DA4 21100000 */   addu      $v0, $zero, $zero
.L80022DA8:
/* 109C8 80022DA8 0800E003 */  jr         $ra
/* 109CC 80022DAC 00000000 */   nop
.size DecalGlobal_FindInMPK, . - DecalGlobal_FindInMPK
