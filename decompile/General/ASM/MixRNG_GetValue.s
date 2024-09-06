.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel MixRNG_GetValue
/* 2C6CC 8003EAAC 40180400 */  sll        $v1, $a0, 1
/* 2C6D0 8003EAB0 21186400 */  addu       $v1, $v1, $a0
/* 2C6D4 8003EAB4 00110300 */  sll        $v0, $v1, 4
/* 2C6D8 8003EAB8 21186200 */  addu       $v1, $v1, $v0
/* 2C6DC 8003EABC 80180300 */  sll        $v1, $v1, 2
/* 2C6E0 8003EAC0 23186400 */  subu       $v1, $v1, $a0
/* 2C6E4 8003EAC4 40110300 */  sll        $v0, $v1, 5
/* 2C6E8 8003EAC8 23104300 */  subu       $v0, $v0, $v1
/* 2C6EC 8003EACC 80100200 */  sll        $v0, $v0, 2
/* 2C6F0 8003EAD0 21104400 */  addu       $v0, $v0, $a0
/* 2C6F4 8003EAD4 19364224 */  addiu      $v0, $v0, 0x3619
/* 2C6F8 8003EAD8 0800E003 */  jr         $ra
/* 2C6FC 8003EADC FFFF4230 */   andi      $v0, $v0, 0xFFFF
.size MixRNG_GetValue, . - MixRNG_GetValue
