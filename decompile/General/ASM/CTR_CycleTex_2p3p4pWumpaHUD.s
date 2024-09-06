.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel CTR_CycleTex_2p3p4pWumpaHUD
/* F7B4 80021B94 FF00033C */  lui        $v1, (0xFFFFFF >> 16)
/* F7B8 80021B98 FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* F7BC 80021B9C 0000828C */  lw         $v0, 0x0($a0)
/* F7C0 80021BA0 80300600 */  sll        $a2, $a2, 2
/* F7C4 80021BA4 0000A2AC */  sw         $v0, 0x0($a1)
/* F7C8 80021BA8 2128A600 */  addu       $a1, $a1, $a2
/* F7CC 80021BAC FCFFA524 */  addiu      $a1, $a1, -0x4
/* F7D0 80021BB0 2428A300 */  and        $a1, $a1, $v1
/* F7D4 80021BB4 0800E003 */  jr         $ra
/* F7D8 80021BB8 000085AC */   sw        $a1, 0x0($a0)
.size CTR_CycleTex_2p3p4pWumpaHUD, . - CTR_CycleTex_2p3p4pWumpaHUD
