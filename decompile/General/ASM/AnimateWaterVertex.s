.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel AnimateWaterVertex
/* 5B79C 8006DB7C 0100A331 */  andi       $v1, $t5, 0x1
/* 5B7A0 8006DB80 FCFF6010 */  beqz       $v1, .L8006DB74
/* 5B7A4 8006DB84 42680D00 */   srl       $t5, $t5, 1
/* 5B7A8 8006DB88 0400C88C */  lw         $t0, 0x4($a2)
/* 5B7AC 8006DB8C 0000CF8C */  lw         $t7, 0x0($a2)
/* 5B7B0 8006DB90 21180B01 */  addu       $v1, $t0, $t3
/* 5B7B4 8006DB94 21400C01 */  addu       $t0, $t0, $t4
/* 5B7B8 8006DB98 00006394 */  lhu        $v1, 0x0($v1)
/* 5B7BC 8006DB9C 00000A95 */  lhu        $t2, 0x0($t0)
/* 5B7C0 8006DBA0 C00F6830 */  andi       $t0, $v1, 0xFC0
/* 5B7C4 8006DBA4 00F06930 */  andi       $t1, $v1, 0xF000
/* 5B7C8 8006DBA8 3F006330 */  andi       $v1, $v1, 0x3F
/* 5B7CC 8006DBAC 80400800 */  sll        $t0, $t0, 2
/* 5B7D0 8006DBB0 25186800 */  or         $v1, $v1, $t0
/* 5B7D4 8006DBB4 004A0900 */  sll        $t1, $t1, 8
/* 5B7D8 8006DBB8 25186900 */  or         $v1, $v1, $t1
/* 5B7DC 8006DBBC 02490900 */  srl        $t1, $t1, 4
/* 5B7E0 8006DBC0 25186900 */  or         $v1, $v1, $t1
/* 5B7E4 8006DBC4 00308348 */  mtc2       $v1, $6 /* handwritten instruction */
/* 5B7E8 8006DBC8 C00F4831 */  andi       $t0, $t2, 0xFC0
/* 5B7EC 8006DBCC 00F04931 */  andi       $t1, $t2, 0xF000
/* 5B7F0 8006DBD0 3F004331 */  andi       $v1, $t2, 0x3F
/* 5B7F4 8006DBD4 00190300 */  sll        $v1, $v1, 4
/* 5B7F8 8006DBD8 82400800 */  srl        $t0, $t0, 2
/* 5B7FC 8006DBDC 00A8C348 */  ctc2       $v1, $21 /* handwritten instruction */
/* 5B800 8006DBE0 00B0C848 */  ctc2       $t0, $22 /* handwritten instruction */
/* 5B804 8006DBE4 02490900 */  srl        $t1, $t1, 4
/* 5B808 8006DBE8 02410900 */  srl        $t0, $t1, 4
/* 5B80C 8006DBEC 25482801 */  or         $t1, $t1, $t0
/* 5B810 8006DBF0 00B8C948 */  ctc2       $t1, $23 /* handwritten instruction */
/* 5B814 8006DBF4 00000000 */  nop
/* 5B818 8006DBF8 00000000 */  nop
/* 5B81C 8006DBFC 1000784A */  DPCS
/* 5B820 8006DC00 00B00848 */  mfc2       $t0, $22 /* handwritten instruction */
/* 5B824 8006DC04 00000000 */  nop
/* 5B828 8006DC08 21180701 */  addu       $v1, $t0, $a3
/* 5B82C 8006DC0C 0C00E3A5 */  sh         $v1, 0xC($t7)
/* 5B830 8006DC10 02440800 */  srl        $t0, $t0, 16
/* 5B834 8006DC14 FF000831 */  andi       $t0, $t0, 0xFF
/* 5B838 8006DC18 001A0800 */  sll        $v1, $t0, 8
/* 5B83C 8006DC1C 25186800 */  or         $v1, $v1, $t0
/* 5B840 8006DC20 001A0300 */  sll        $v1, $v1, 8
/* 5B844 8006DC24 25186800 */  or         $v1, $v1, $t0
/* 5B848 8006DC28 0800E003 */  jr         $ra
/* 5B84C 8006DC2C 0800E3AD */   sw        $v1, 0x8($t7)
.size AnimateWaterVertex, . - AnimateWaterVertex
