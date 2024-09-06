.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel RngDeadCoed
/* 5A2A4 8006C684 0400828C */  lw         $v0, 0x4($a0)
/* 5A2A8 8006C688 0000858C */  lw         $a1, 0x0($a0)
/* 5A2AC 8006C68C 001E0200 */  sll        $v1, $v0, 24
/* 5A2B0 8006C690 02120200 */  srl        $v0, $v0, 8
/* 5A2B4 8006C694 2140A200 */  addu       $t0, $a1, $v0
/* 5A2B8 8006C698 022A0500 */  srl        $a1, $a1, 8
/* 5A2BC 8006C69C 2528A300 */  or         $a1, $a1, $v1
/* 5A2C0 8006C6A0 021A0500 */  srl        $v1, $a1, 8
/* 5A2C4 8006C6A4 21400301 */  addu       $t0, $t0, $v1
/* 5A2C8 8006C6A8 00460800 */  sll        $t0, $t0, 24
/* 5A2CC 8006C6AC 25104800 */  or         $v0, $v0, $t0
/* 5A2D0 8006C6B0 ADDE033C */  lui        $v1, (0xDEADC0ED >> 16)
/* 5A2D4 8006C6B4 EDC06334 */  ori        $v1, $v1, (0xDEADC0ED & 0xFFFF)
/* 5A2D8 8006C6B8 26104300 */  xor        $v0, $v0, $v1
/* 5A2DC 8006C6BC 040082AC */  sw         $v0, 0x4($a0)
/* 5A2E0 8006C6C0 0800E003 */  jr         $ra
/* 5A2E4 8006C6C4 000085AC */   sw        $a1, 0x0($a0)
/* 5A2E8 8006C6C8 0000C88C */  lw         $t0, 0x0($a2)
/* 5A2EC 8006C6CC 0400C98C */  lw         $t1, 0x4($a2)
/* 5A2F0 8006C6D0 0800CA8C */  lw         $t2, 0x8($a2)
/* 5A2F4 8006C6D4 0C00CB8C */  lw         $t3, 0xC($a2)
/* 5A2F8 8006C6D8 1000CC8C */  lw         $t4, 0x10($a2)
/* 5A2FC 8006C6DC 0000C848 */  ctc2       $t0, $0 /* handwritten instruction */
/* 5A300 8006C6E0 0008C948 */  ctc2       $t1, $1 /* handwritten instruction */
/* 5A304 8006C6E4 0010CA48 */  ctc2       $t2, $2 /* handwritten instruction */
/* 5A308 8006C6E8 0018CB48 */  ctc2       $t3, $3 /* handwritten instruction */
/* 5A30C 8006C6EC 0020CC48 */  ctc2       $t4, $4 /* handwritten instruction */
.size RngDeadCoed, . - RngDeadCoed
