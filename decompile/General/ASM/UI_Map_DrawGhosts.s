.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel UI_Map_DrawGhosts
/* 3BB08 8004DEE8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 3BB0C 8004DEEC 2000B2AF */  sw         $s2, 0x20($sp)
/* 3BB10 8004DEF0 21908000 */  addu       $s2, $a0, $zero
/* 3BB14 8004DEF4 1800B0AF */  sw         $s0, 0x18($sp)
/* 3BB18 8004DEF8 2180A000 */  addu       $s0, $a1, $zero
/* 3BB1C 8004DEFC 2400BFAF */  sw         $ra, 0x24($sp)
/* 3BB20 8004DF00 38000012 */  beqz       $s0, .L8004DFE4
/* 3BB24 8004DF04 1C00B1AF */   sw        $s1, 0x1C($sp)
/* 3BB28 8004DF08 0980023C */  lui        $v0, %hi(D_8008E6E8)
/* 3BB2C 8004DF0C E8E65124 */  addiu      $s1, $v0, %lo(D_8008E6E8)
.L8004DF10:
/* 3BB30 8004DF10 3000038E */  lw         $v1, 0x30($s0)
/* 3BB34 8004DF14 00000000 */  nop
/* 3BB38 8004DF18 32066284 */  lh         $v0, 0x632($v1)
/* 3BB3C 8004DF1C 3400058E */  lw         $a1, 0x34($s0)
/* 3BB40 8004DF20 2C004010 */  beqz       $v0, .L8004DFD4
/* 3BB44 8004DF24 00000000 */   nop
/* 3BB48 8004DF28 30066284 */  lh         $v0, 0x630($v1)
/* 3BB4C 8004DF2C 00000000 */  nop
/* 3BB50 8004DF30 18004010 */  beqz       $v0, .L8004DF94
/* 3BB54 8004DF34 00000000 */   nop
/* 3BB58 8004DF38 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 3BB5C 8004DF3C ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 3BB60 8004DF40 00000000 */  nop
/* 3BB64 8004DF44 101A828C */  lw         $v0, 0x1A10($a0)
/* 3BB68 8004DF48 00000000 */  nop
/* 3BB6C 8004DF4C C0180200 */  sll        $v1, $v0, 3
/* 3BB70 8004DF50 21186200 */  addu       $v1, $v1, $v0
/* 3BB74 8004DF54 C0180300 */  sll        $v1, $v1, 3
/* 3BB78 8004DF58 21186200 */  addu       $v1, $v1, $v0
/* 3BB7C 8004DF5C 80180300 */  sll        $v1, $v1, 2
/* 3BB80 8004DF60 21187100 */  addu       $v1, $v1, $s1
/* 3BB84 8004DF64 2C01628C */  lw         $v0, 0x12C($v1)
/* 3BB88 8004DF68 00000000 */  nop
/* 3BB8C 8004DF6C 02004230 */  andi       $v0, $v0, 0x2
/* 3BB90 8004DF70 11004010 */  beqz       $v0, .L8004DFB8
/* 3BB94 8004DF74 11000724 */   addiu     $a3, $zero, 0x11
/* 3BB98 8004DF78 EC1C828C */  lw         $v0, 0x1CEC($a0)
/* 3BB9C 8004DF7C 00000000 */  nop
/* 3BBA0 8004DF80 01004230 */  andi       $v0, $v0, 0x1
/* 3BBA4 8004DF84 0C004010 */  beqz       $v0, .L8004DFB8
/* 3BBA8 8004DF88 03000724 */   addiu     $a3, $zero, 0x3
/* 3BBAC 8004DF8C EE370108 */  j          .L8004DFB8
/* 3BBB0 8004DF90 04000724 */   addiu     $a3, $zero, 0x4
.L8004DF94:
/* 3BBB4 8004DF94 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 3BBB8 8004DF98 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 3BBBC 8004DF9C 00000000 */  nop
/* 3BBC0 8004DFA0 EC1C428C */  lw         $v0, 0x1CEC($v0)
/* 3BBC4 8004DFA4 00000000 */  nop
/* 3BBC8 8004DFA8 01004230 */  andi       $v0, $v0, 0x1
/* 3BBCC 8004DFAC 02004010 */  beqz       $v0, .L8004DFB8
/* 3BBD0 8004DFB0 06000724 */   addiu     $a3, $zero, 0x6
/* 3BBD4 8004DFB4 05000724 */  addiu      $a3, $zero, 0x5
.L8004DFB8:
/* 3BBD8 8004DFB8 00100224 */  addiu      $v0, $zero, 0x1000
/* 3BBDC 8004DFBC 21204002 */  addu       $a0, $s2, $zero
/* 3BBE0 8004DFC0 4400A524 */  addiu      $a1, $a1, 0x44
/* 3BBE4 8004DFC4 31000624 */  addiu      $a2, $zero, 0x31
/* 3BBE8 8004DFC8 1000A0AF */  sw         $zero, 0x10($sp)
/* 3BBEC 8004DFCC 1137010C */  jal        DECOMP_UI_Map_DrawRawIcon
/* 3BBF0 8004DFD0 1400A2AF */   sw        $v0, 0x14($sp)
.L8004DFD4:
/* 3BBF4 8004DFD4 1000108E */  lw         $s0, 0x10($s0)
/* 3BBF8 8004DFD8 00000000 */  nop
/* 3BBFC 8004DFDC CCFF0016 */  bnez       $s0, .L8004DF10
/* 3BC00 8004DFE0 00000000 */   nop
.L8004DFE4:
/* 3BC04 8004DFE4 2400BF8F */  lw         $ra, 0x24($sp)
/* 3BC08 8004DFE8 2000B28F */  lw         $s2, 0x20($sp)
/* 3BC0C 8004DFEC 1C00B18F */  lw         $s1, 0x1C($sp)
/* 3BC10 8004DFF0 1800B08F */  lw         $s0, 0x18($sp)
/* 3BC14 8004DFF4 0800E003 */  jr         $ra
/* 3BC18 8004DFF8 2800BD27 */   addiu     $sp, $sp, 0x28
.size UI_Map_DrawGhosts, . - UI_Map_DrawGhosts
