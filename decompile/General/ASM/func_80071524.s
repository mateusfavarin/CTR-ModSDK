.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_80071524
/* 5F144 80071524 03440900 */  sra        $t0, $t1, 16
/* 5F148 80071528 23400D01 */  subu       $t0, $t0, $t5
/* 5F14C 8007152C 02000105 */  bgez       $t0, .L80071538
/* 5F150 80071530 03440900 */   sra       $t0, $t1, 16
/* 5F154 80071534 036C0900 */  sra        $t5, $t1, 16
.L80071538:
/* 5F158 80071538 23400E01 */  subu       $t0, $t0, $t6
/* 5F15C 8007153C 02000019 */  blez       $t0, .L80071548
/* 5F160 80071540 00000000 */   nop
/* 5F164 80071544 03740900 */  sra        $t6, $t1, 16
.L80071548:
/* 5F168 80071548 004C0900 */  sll        $t1, $t1, 16
/* 5F16C 8007154C 03440900 */  sra        $t0, $t1, 16
/* 5F170 80071550 23400B01 */  subu       $t0, $t0, $t3
/* 5F174 80071554 02000105 */  bgez       $t0, .L80071560
/* 5F178 80071558 03440900 */   sra       $t0, $t1, 16
/* 5F17C 8007155C 035C0900 */  sra        $t3, $t1, 16
.L80071560:
/* 5F180 80071560 23400C01 */  subu       $t0, $t0, $t4
/* 5F184 80071564 02000019 */  blez       $t0, .L80071570
/* 5F188 80071568 23404F01 */   subu      $t0, $t2, $t7
/* 5F18C 8007156C 03640900 */  sra        $t4, $t1, 16
.L80071570:
/* 5F190 80071570 02000105 */  bgez       $t0, .L8007157C
/* 5F194 80071574 23405001 */   subu      $t0, $t2, $s0
/* 5F198 80071578 21784001 */  addu       $t7, $t2, $zero
.L8007157C:
/* 5F19C 8007157C 02000019 */  blez       $t0, .L80071588
/* 5F1A0 80071580 00000000 */   nop
/* 5F1A4 80071584 21804001 */  addu       $s0, $t2, $zero
.L80071588:
/* 5F1A8 80071588 0800E003 */  jr         $ra
/* 5F1AC 8007158C 00000000 */   nop
.size func_80071524, . - func_80071524
