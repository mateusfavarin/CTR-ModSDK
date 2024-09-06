.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel CTR_ScrambleGhostString
/* FE54 80022234 0000A290 */  lbu        $v0, 0x0($a1)
/* FE58 80022238 00000000 */  nop
/* FE5C 8002223C 26004010 */  beqz       $v0, .L800222D8
/* FE60 80022240 08800A3C */   lui       $t2, %hi(D_80081DFC)
/* FE64 80022244 FFFF0934 */  ori        $t1, $zero, 0xFFFF
/* FE68 80022248 0400422C */  sltiu      $v0, $v0, 0x4
.L8002224C:
/* FE6C 8002224C 04004010 */  beqz       $v0, .L80022260
/* FE70 80022250 21380000 */   addu      $a3, $zero, $zero
/* FE74 80022254 0000A290 */  lbu        $v0, 0x0($a1)
/* FE78 80022258 0100A524 */  addiu      $a1, $a1, 0x1
/* FE7C 8002225C 003A0200 */  sll        $a3, $v0, 8
.L80022260:
/* FE80 80022260 0000A290 */  lbu        $v0, 0x0($a1)
/* FE84 80022264 0100A524 */  addiu      $a1, $a1, 0x1
/* FE88 80022268 FC1D4625 */  addiu      $a2, $t2, %lo(D_80081DFC)
/* FE8C 8002226C 0200C394 */  lhu        $v1, 0x2($a2)
/* FE90 80022270 00000000 */  nop
/* FE94 80022274 14006910 */  beq        $v1, $t1, .L800222C8
/* FE98 80022278 2538E200 */   or        $a3, $a3, $v0
/* FE9C 8002227C FFFFE730 */  andi       $a3, $a3, 0xFFFF
/* FEA0 80022280 FFFF0834 */  ori        $t0, $zero, 0xFFFF
.L80022284:
/* FEA4 80022284 0B006714 */  bne        $v1, $a3, .L800222B4
/* FEA8 80022288 00000000 */   nop
/* FEAC 8002228C 0000C394 */  lhu        $v1, 0x0($a2)
/* FEB0 80022290 00000000 */  nop
/* FEB4 80022294 00FF6230 */  andi       $v0, $v1, 0xFF00
/* FEB8 80022298 06004010 */  beqz       $v0, .L800222B4
/* FEBC 8002229C 02120300 */   srl       $v0, $v1, 8
/* FEC0 800222A0 000082A0 */  sb         $v0, 0x0($a0)
/* FEC4 800222A4 01008424 */  addiu      $a0, $a0, 0x1
/* FEC8 800222A8 000083A0 */  sb         $v1, 0x0($a0)
/* FECC 800222AC B2880008 */  j          .L800222C8
/* FED0 800222B0 01008424 */   addiu     $a0, $a0, 0x1
.L800222B4:
/* FED4 800222B4 0400C624 */  addiu      $a2, $a2, 0x4
/* FED8 800222B8 0200C394 */  lhu        $v1, 0x2($a2)
/* FEDC 800222BC 00000000 */  nop
/* FEE0 800222C0 F0FF6814 */  bne        $v1, $t0, .L80022284
/* FEE4 800222C4 00000000 */   nop
.L800222C8:
/* FEE8 800222C8 0000A290 */  lbu        $v0, 0x0($a1)
/* FEEC 800222CC 00000000 */  nop
/* FEF0 800222D0 DEFF4014 */  bnez       $v0, .L8002224C
/* FEF4 800222D4 0400422C */   sltiu     $v0, $v0, 0x4
.L800222D8:
/* FEF8 800222D8 0800E003 */  jr         $ra
/* FEFC 800222DC 000080A0 */   sb        $zero, 0x0($a0)
.size CTR_ScrambleGhostString, . - CTR_ScrambleGhostString
