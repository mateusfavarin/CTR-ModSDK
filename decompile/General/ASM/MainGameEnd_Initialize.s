.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel MainGameEnd_Initialize
/* 2801C 8003A3FC 4003848F */  lw         $a0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 28020 8003A400 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 28024 8003A404 4400BFAF */  sw         $ra, 0x44($sp)
/* 28028 8003A408 4000BEAF */  sw         $fp, 0x40($sp)
/* 2802C 8003A40C 3C00B7AF */  sw         $s7, 0x3C($sp)
/* 28030 8003A410 3800B6AF */  sw         $s6, 0x38($sp)
/* 28034 8003A414 3400B5AF */  sw         $s5, 0x34($sp)
/* 28038 8003A418 3000B4AF */  sw         $s4, 0x30($sp)
/* 2803C 8003A41C 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 28040 8003A420 2800B2AF */  sw         $s2, 0x28($sp)
/* 28044 8003A424 2400B1AF */  sw         $s1, 0x24($sp)
/* 28048 8003A428 2000B0AF */  sw         $s0, 0x20($sp)
/* 2804C 8003A42C 0000828C */  lw         $v0, 0x0($a0)
/* 28050 8003A430 2000033C */  lui        $v1, (0x200000 >> 16)
/* 28054 8003A434 24104300 */  and        $v0, $v0, $v1
/* 28058 8003A438 9C024014 */  bnez       $v0, .L8003AEAC
/* 2805C 8003A43C 21880000 */   addu      $s1, $zero, $zero
/* 28060 8003A440 EC24848C */  lw         $a0, 0x24EC($a0)
/* 28064 8003A444 00000000 */  nop
/* 28068 8003A448 1800A4AF */  sw         $a0, 0x18($sp)
/* 2806C 8003A44C 0980043C */  lui        $a0, %hi(D_8008D69C)
/* 28070 8003A450 9CD68424 */  addiu      $a0, $a0, %lo(D_8008D69C)
.L8003A454:
/* 28074 8003A454 4003828F */  lw         $v0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 28078 8003A458 80181100 */  sll        $v1, $s1, 2
/* 2807C 8003A45C 21104300 */  addu       $v0, $v0, $v1
/* 28080 8003A460 EC24428C */  lw         $v0, 0x24EC($v0)
/* 28084 8003A464 00000000 */  nop
/* 28088 8003A468 04004010 */  beqz       $v0, .L8003A47C
/* 2808C 8003A46C 00000000 */   nop
/* 28090 8003A470 82044390 */  lbu        $v1, 0x482($v0)
/* 28094 8003A474 21102402 */  addu       $v0, $s1, $a0
/* 28098 8003A478 000043A0 */  sb         $v1, 0x0($v0)
.L8003A47C:
/* 2809C 8003A47C 01003126 */  addiu      $s1, $s1, 0x1
/* 280A0 8003A480 0800222A */  slti       $v0, $s1, 0x8
/* 280A4 8003A484 F3FF4014 */  bnez       $v0, .L8003A454
/* 280A8 8003A488 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 280AC 8003A48C 4003838F */  lw         $v1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 280B0 8003A490 00000000 */  nop
/* 280B4 8003A494 491D62A0 */  sb         $v0, 0x1D49($v1)
/* 280B8 8003A498 4003828F */  lw         $v0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 280BC 8003A49C 00000000 */  nop
/* 280C0 8003A4A0 0000428C */  lw         $v0, 0x0($v0)
/* 280C4 8003A4A4 8000033C */  lui        $v1, (0x800000 >> 16)
/* 280C8 8003A4A8 24104300 */  and        $v0, $v0, $v1
/* 280CC 8003A4AC 09004010 */  beqz       $v0, .L8003A4D4
/* 280D0 8003A4B0 00000000 */   nop
/* 280D4 8003A4B4 11A2000C */  jal        DECOMP_OtherFX_Stop2
/* 280D8 8003A4B8 5D000424 */   addiu     $a0, $zero, 0x5D
/* 280DC 8003A4BC 4003848F */  lw         $a0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 280E0 8003A4C0 7FFF033C */  lui        $v1, (0xFF7FFFFF >> 16)
/* 280E4 8003A4C4 0000828C */  lw         $v0, 0x0($a0)
/* 280E8 8003A4C8 FFFF6334 */  ori        $v1, $v1, (0xFF7FFFFF & 0xFFFF)
/* 280EC 8003A4CC 24104300 */  and        $v0, $v0, $v1
/* 280F0 8003A4D0 000082AC */  sw         $v0, 0x0($a0)
.L8003A4D4:
/* 280F4 8003A4D4 4003858F */  lw         $a1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 280F8 8003A4D8 0814023C */  lui        $v0, (0x14080000 >> 16)
/* 280FC 8003A4DC 0000A48C */  lw         $a0, 0x0($a1)
/* 28100 8003A4E0 0800033C */  lui        $v1, (0x80000 >> 16)
/* 28104 8003A4E4 24108200 */  and        $v0, $a0, $v0
/* 28108 8003A4E8 23004314 */  bne        $v0, $v1, .L8003A578
/* 2810C 8003A4EC 00000000 */   nop
/* 28110 8003A4F0 1800AD8F */  lw         $t5, 0x18($sp)
/* 28114 8003A4F4 00000000 */  nop
/* 28118 8003A4F8 8204A285 */  lh         $v0, 0x482($t5)
/* 2811C 8003A4FC 00000000 */  nop
/* 28120 8003A500 12004010 */  beqz       $v0, .L8003A54C
/* 28124 8003A504 00000000 */   nop
/* 28128 8003A508 05008104 */  bgez       $a0, .L8003A520
/* 2812C 8003A50C 0980023C */   lui       $v0, %hi(D_8008FBA4)
/* 28130 8003A510 A4FB4224 */  addiu      $v0, $v0, %lo(D_8008FBA4)
/* 28134 8003A514 B81EA38C */  lw         $v1, 0x1EB8($a1)
/* 28138 8003A518 4AE90008 */  j          .L8003A528
/* 2813C 8003A51C 17006324 */   addiu     $v1, $v1, 0x17
.L8003A520:
/* 28140 8003A520 A4FB4224 */  addiu      $v0, $v0, %lo(D_8008FBA4)
/* 28144 8003A524 101AA38C */  lw         $v1, 0x1A10($a1)
.L8003A528:
/* 28148 8003A528 00000000 */  nop
/* 2814C 8003A52C 21186200 */  addu       $v1, $v1, $v0
/* 28150 8003A530 30006280 */  lb         $v0, 0x30($v1)
/* 28154 8003A534 30006490 */  lbu        $a0, 0x30($v1)
/* 28158 8003A538 0A004228 */  slti       $v0, $v0, 0xA
/* 2815C 8003A53C 0E004010 */  beqz       $v0, .L8003A578
/* 28160 8003A540 01008224 */   addiu     $v0, $a0, 0x1
/* 28164 8003A544 5EE90008 */  j          .L8003A578
/* 28168 8003A548 300062A0 */   sb        $v0, 0x30($v1)
.L8003A54C:
/* 2816C 8003A54C 06008104 */  bgez       $a0, .L8003A568
/* 28170 8003A550 0980023C */   lui       $v0, %hi(D_8008FBA4)
/* 28174 8003A554 B81EA38C */  lw         $v1, 0x1EB8($a1)
/* 28178 8003A558 A4FB4224 */  addiu      $v0, $v0, %lo(D_8008FBA4)
/* 2817C 8003A55C 21186200 */  addu       $v1, $v1, $v0
/* 28180 8003A560 5EE90008 */  j          .L8003A578
/* 28184 8003A564 470060A0 */   sb        $zero, 0x47($v1)
.L8003A568:
/* 28188 8003A568 101AA38C */  lw         $v1, 0x1A10($a1)
/* 2818C 8003A56C A4FB4224 */  addiu      $v0, $v0, %lo(D_8008FBA4)
/* 28190 8003A570 21186200 */  addu       $v1, $v1, $v0
/* 28194 8003A574 300060A0 */  sb         $zero, 0x30($v1)
.L8003A578:
/* 28198 8003A578 3E00043C */  lui        $a0, (0x3E0020 >> 16)
/* 2819C 8003A57C 4003858F */  lw         $a1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 281A0 8003A580 20008434 */  ori        $a0, $a0, (0x3E0020 & 0xFFFF)
/* 281A4 8003A584 0000A28C */  lw         $v0, 0x0($a1)
/* 281A8 8003A588 2000033C */  lui        $v1, (0x200000 >> 16)
/* 281AC 8003A58C 25104300 */  or         $v0, $v0, $v1
/* 281B0 8003A590 0000A2AC */  sw         $v0, 0x0($a1)
/* 281B4 8003A594 21184000 */  addu       $v1, $v0, $zero
/* 281B8 8003A598 24104400 */  and        $v0, $v0, $a0
/* 281BC 8003A59C 441DA2AC */  sw         $v0, 0x1D44($a1)
/* 281C0 8003A5A0 20006230 */  andi       $v0, $v1, 0x20
/* 281C4 8003A5A4 1C004014 */  bnez       $v0, .L8003A618
/* 281C8 8003A5A8 00406230 */   andi      $v0, $v1, 0x4000
/* 281CC 8003A5AC A81CA290 */  lbu        $v0, 0x1CA8($a1)
/* 281D0 8003A5B0 00000000 */  nop
/* 281D4 8003A5B4 AD014010 */  beqz       $v0, .L8003AC6C
/* 281D8 8003A5B8 21880000 */   addu      $s1, $zero, $zero
/* 281DC 8003A5BC 21302002 */  addu       $a2, $s1, $zero
/* 281E0 8003A5C0 2120A000 */  addu       $a0, $a1, $zero
.L8003A5C4:
/* 281E4 8003A5C4 EC24828C */  lw         $v0, 0x24EC($a0)
/* 281E8 8003A5C8 00000000 */  nop
/* 281EC 8003A5CC 82044384 */  lh         $v1, 0x482($v0)
/* 281F0 8003A5D0 00000000 */  nop
/* 281F4 8003A5D4 03006228 */  slti       $v0, $v1, 0x3
/* 281F8 8003A5D8 07004010 */  beqz       $v0, .L8003A5F8
/* 281FC 8003A5DC 80180300 */   sll       $v1, $v1, 2
/* 28200 8003A5E0 21186600 */  addu       $v1, $v1, $a2
/* 28204 8003A5E4 2118A300 */  addu       $v1, $a1, $v1
/* 28208 8003A5E8 801E628C */  lw         $v0, 0x1E80($v1)
/* 2820C 8003A5EC 00000000 */  nop
/* 28210 8003A5F0 01004224 */  addiu      $v0, $v0, 0x1
/* 28214 8003A5F4 801E62AC */  sw         $v0, 0x1E80($v1)
.L8003A5F8:
/* 28218 8003A5F8 0C00C624 */  addiu      $a2, $a2, 0xC
/* 2821C 8003A5FC A81CA290 */  lbu        $v0, 0x1CA8($a1)
/* 28220 8003A600 01003126 */  addiu      $s1, $s1, 0x1
/* 28224 8003A604 2A102202 */  slt        $v0, $s1, $v0
/* 28228 8003A608 EEFF4014 */  bnez       $v0, .L8003A5C4
/* 2822C 8003A60C 04008424 */   addiu     $a0, $a0, 0x4
/* 28230 8003A610 1CEB0008 */  j          .L8003AC70
/* 28234 8003A614 21280000 */   addu      $a1, $zero, $zero
.L8003A618:
/* 28238 8003A618 BA004010 */  beqz       $v0, .L8003A904
/* 2823C 8003A61C 70FE0824 */   addiu     $t0, $zero, -0x190
/* 28240 8003A620 21200000 */  addu       $a0, $zero, $zero
/* 28244 8003A624 21388000 */  addu       $a3, $a0, $zero
/* 28248 8003A628 21880000 */  addu       $s1, $zero, $zero
/* 2824C 8003A62C 1000A927 */  addiu      $t1, $sp, 0x10
/* 28250 8003A630 01000A24 */  addiu      $t2, $zero, 0x1
/* 28254 8003A634 FFFF0B24 */  addiu      $t3, $zero, -0x1
/* 28258 8003A638 40038C8F */  lw         $t4, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2825C 8003A63C 0980023C */  lui        $v0, %hi(D_8008D2F4)
/* 28260 8003A640 F4D24D24 */  addiu      $t5, $v0, %lo(D_8008D2F4)
/* 28264 8003A644 0300AE89 */  lwl        $t6, 0x3($t5)
/* 28268 8003A648 0000AE99 */  lwr        $t6, 0x0($t5)
/* 2826C 8003A64C 0700AF89 */  lwl        $t7, 0x7($t5)
/* 28270 8003A650 0400AF99 */  lwr        $t7, 0x4($t5)
/* 28274 8003A654 1300AEAB */  swl        $t6, 0x13($sp)
/* 28278 8003A658 1000AEBB */  swr        $t6, 0x10($sp)
/* 2827C 8003A65C 1700AFAB */  swl        $t7, 0x17($sp)
/* 28280 8003A660 1400AFBB */  swr        $t7, 0x14($sp)
.L8003A664:
/* 28284 8003A664 03001024 */  addiu      $s0, $zero, 0x3
/* 28288 8003A668 0C008525 */  addiu      $a1, $t4, 0xC
.L8003A66C:
/* 2828C 8003A66C 00140800 */  sll        $v0, $t0, 16
/* 28290 8003A670 901DA38C */  lw         $v1, 0x1D90($a1)
/* 28294 8003A674 03140200 */  sra        $v0, $v0, 16
/* 28298 8003A678 0D006214 */  bne        $v1, $v0, .L8003A6B0
/* 2829C 8003A67C 00140800 */   sll       $v0, $t0, 16
/* 282A0 8003A680 FF00E230 */  andi       $v0, $a3, 0xFF
/* 282A4 8003A684 07100202 */  srav       $v0, $v0, $s0
/* 282A8 8003A688 01004230 */  andi       $v0, $v0, 0x1
/* 282AC 8003A68C 08004014 */  bnez       $v0, .L8003A6B0
/* 282B0 8003A690 00140800 */   sll       $v0, $t0, 16
/* 282B4 8003A694 01008224 */  addiu      $v0, $a0, 0x1
/* 282B8 8003A698 21204000 */  addu       $a0, $v0, $zero
/* 282BC 8003A69C 00140200 */  sll        $v0, $v0, 16
/* 282C0 8003A6A0 C3130200 */  sra        $v0, $v0, 15
/* 282C4 8003A6A4 21102201 */  addu       $v0, $t1, $v0
/* 282C8 8003A6A8 C7E90008 */  j          .L8003A71C
/* 282CC 8003A6AC 000050A4 */   sh        $s0, 0x0($v0)
.L8003A6B0:
/* 282D0 8003A6B0 03140200 */  sra        $v0, $v0, 16
/* 282D4 8003A6B4 2A186200 */  slt        $v1, $v1, $v0
/* 282D8 8003A6B8 1A006014 */  bnez       $v1, .L8003A724
/* 282DC 8003A6BC FF00E230 */   andi      $v0, $a3, 0xFF
/* 282E0 8003A6C0 07100202 */  srav       $v0, $v0, $s0
/* 282E4 8003A6C4 01004230 */  andi       $v0, $v0, 0x1
/* 282E8 8003A6C8 16004014 */  bnez       $v0, .L8003A724
/* 282EC 8003A6CC 00140400 */   sll       $v0, $a0, 16
/* 282F0 8003A6D0 901DA894 */  lhu        $t0, 0x1D90($a1)
/* 282F4 8003A6D4 03140200 */  sra        $v0, $v0, 16
/* 282F8 8003A6D8 01004224 */  addiu      $v0, $v0, 0x1
/* 282FC 8003A6DC 0D004018 */  blez       $v0, .L8003A714
/* 28300 8003A6E0 21180000 */   addu      $v1, $zero, $zero
/* 28304 8003A6E4 21304000 */  addu       $a2, $v0, $zero
/* 28308 8003A6E8 21202001 */  addu       $a0, $t1, $zero
.L8003A6EC:
/* 2830C 8003A6EC 00008284 */  lh         $v0, 0x0($a0)
/* 28310 8003A6F0 00000000 */  nop
/* 28314 8003A6F4 03004B10 */  beq        $v0, $t3, .L8003A704
/* 28318 8003A6F8 04104A00 */   sllv      $v0, $t2, $v0
/* 2831C 8003A6FC 27100200 */  nor        $v0, $zero, $v0
/* 28320 8003A700 2438E200 */  and        $a3, $a3, $v0
.L8003A704:
/* 28324 8003A704 01006324 */  addiu      $v1, $v1, 0x1
/* 28328 8003A708 2A106600 */  slt        $v0, $v1, $a2
/* 2832C 8003A70C F7FF4014 */  bnez       $v0, .L8003A6EC
/* 28330 8003A710 02008424 */   addiu     $a0, $a0, 0x2
.L8003A714:
/* 28334 8003A714 21200000 */  addu       $a0, $zero, $zero
/* 28338 8003A718 1000B0A7 */  sh         $s0, 0x10($sp)
.L8003A71C:
/* 2833C 8003A71C 04100A02 */  sllv       $v0, $t2, $s0
/* 28340 8003A720 2538E200 */  or         $a3, $a3, $v0
.L8003A724:
/* 28344 8003A724 FFFF1026 */  addiu      $s0, $s0, -0x1
/* 28348 8003A728 D0FF0106 */  bgez       $s0, .L8003A66C
/* 2834C 8003A72C FCFFA524 */   addiu     $a1, $a1, -0x4
/* 28350 8003A730 1000A287 */  lh         $v0, 0x10($sp)
/* 28354 8003A734 00000000 */  nop
/* 28358 8003A738 0F004B10 */  beq        $v0, $t3, .L8003A778
/* 2835C 8003A73C 00140400 */   sll       $v0, $a0, 16
/* 28360 8003A740 03140200 */  sra        $v0, $v0, 16
/* 28364 8003A744 01004224 */  addiu      $v0, $v0, 0x1
/* 28368 8003A748 0B004018 */  blez       $v0, .L8003A778
/* 2836C 8003A74C 21800000 */   addu      $s0, $zero, $zero
/* 28370 8003A750 21284000 */  addu       $a1, $v0, $zero
/* 28374 8003A754 21182001 */  addu       $v1, $t1, $zero
.L8003A758:
/* 28378 8003A758 00006284 */  lh         $v0, 0x0($v1)
/* 2837C 8003A75C 01001026 */  addiu      $s0, $s0, 0x1
/* 28380 8003A760 80100200 */  sll        $v0, $v0, 2
/* 28384 8003A764 21108201 */  addu       $v0, $t4, $v0
/* 28388 8003A768 A81D51AC */  sw         $s1, 0x1DA8($v0)
/* 2838C 8003A76C 2A100502 */  slt        $v0, $s0, $a1
/* 28390 8003A770 F9FF4014 */  bnez       $v0, .L8003A758
/* 28394 8003A774 02006324 */   addiu     $v1, $v1, 0x2
.L8003A778:
/* 28398 8003A778 00140400 */  sll        $v0, $a0, 16
/* 2839C 8003A77C 03140200 */  sra        $v0, $v0, 16
/* 283A0 8003A780 21882202 */  addu       $s1, $s1, $v0
/* 283A4 8003A784 70FE0824 */  addiu      $t0, $zero, -0x190
/* 283A8 8003A788 1000ABA7 */  sh         $t3, 0x10($sp)
/* 283AC 8003A78C 01003126 */  addiu      $s1, $s1, 0x1
/* 283B0 8003A790 0400222A */  slti       $v0, $s1, 0x4
/* 283B4 8003A794 B3FF4014 */  bnez       $v0, .L8003A664
/* 283B8 8003A798 21200000 */   addu      $a0, $zero, $zero
/* 283BC 8003A79C 21880000 */  addu       $s1, $zero, $zero
/* 283C0 8003A7A0 21802002 */  addu       $s0, $s1, $zero
.L8003A7A4:
/* 283C4 8003A7A4 4003848F */  lw         $a0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 283C8 8003A7A8 80281100 */  sll        $a1, $s1, 2
/* 283CC 8003A7AC 21108500 */  addu       $v0, $a0, $a1
/* 283D0 8003A7B0 A81D438C */  lw         $v1, 0x1DA8($v0)
/* 283D4 8003A7B4 03000224 */  addiu      $v0, $zero, 0x3
/* 283D8 8003A7B8 08006210 */  beq        $v1, $v0, .L8003A7DC
/* 283DC 8003A7BC 80180300 */   sll       $v1, $v1, 2
/* 283E0 8003A7C0 21187000 */  addu       $v1, $v1, $s0
/* 283E4 8003A7C4 21188300 */  addu       $v1, $a0, $v1
/* 283E8 8003A7C8 801E628C */  lw         $v0, 0x1E80($v1)
/* 283EC 8003A7CC 00000000 */  nop
/* 283F0 8003A7D0 01004224 */  addiu      $v0, $v0, 0x1
/* 283F4 8003A7D4 801E62AC */  sw         $v0, 0x1E80($v1)
/* 283F8 8003A7D8 4003848F */  lw         $a0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
.L8003A7DC:
/* 283FC 8003A7DC 00000000 */  nop
/* 28400 8003A7E0 21288500 */  addu       $a1, $a0, $a1
/* 28404 8003A7E4 EC24A38C */  lw         $v1, 0x24EC($a1)
/* 28408 8003A7E8 00000000 */  nop
/* 2840C 8003A7EC 3B006010 */  beqz       $v1, .L8003A8DC
/* 28410 8003A7F0 00000000 */   nop
/* 28414 8003A7F4 E804628C */  lw         $v0, 0x4E8($v1)
/* 28418 8003A7F8 00000000 */  nop
/* 2841C 8003A7FC 80100200 */  sll        $v0, $v0, 2
/* 28420 8003A800 21108200 */  addu       $v0, $a0, $v0
/* 28424 8003A804 A81D428C */  lw         $v0, 0x1DA8($v0)
/* 28428 8003A808 00000000 */  nop
/* 2842C 8003A80C 33004014 */  bnez       $v0, .L8003A8DC
/* 28430 8003A810 00000000 */   nop
/* 28434 8003A814 6825828C */  lw         $v0, 0x2568($a0)
/* 28438 8003A818 4A006390 */  lbu        $v1, 0x4A($v1)
/* 2843C 8003A81C 80100200 */  sll        $v0, $v0, 2
/* 28440 8003A820 21108200 */  addu       $v0, $a0, $v0
/* 28444 8003A824 582543AC */  sw         $v1, 0x2558($v0)
/* 28448 8003A828 6825828C */  lw         $v0, 0x2568($a0)
/* 2844C 8003A82C 00000000 */  nop
/* 28450 8003A830 80100200 */  sll        $v0, $v0, 2
/* 28454 8003A834 21108200 */  addu       $v0, $a0, $v0
/* 28458 8003A838 5825438C */  lw         $v1, 0x2558($v0)
/* 2845C 8003A83C 00000000 */  nop
/* 28460 8003A840 00110300 */  sll        $v0, $v1, 4
/* 28464 8003A844 21104300 */  addu       $v0, $v0, $v1
/* 28468 8003A848 00110200 */  sll        $v0, $v0, 4
/* 2846C 8003A84C 21108200 */  addu       $v0, $a0, $v0
/* 28470 8003A850 FF1F0324 */  addiu      $v1, $zero, 0x1FFF
/* 28474 8003A854 7A0143A4 */  sh         $v1, 0x17A($v0)
/* 28478 8003A858 6825828C */  lw         $v0, 0x2568($a0)
/* 2847C 8003A85C 00000000 */  nop
/* 28480 8003A860 80100200 */  sll        $v0, $v0, 2
/* 28484 8003A864 21108200 */  addu       $v0, $a0, $v0
/* 28488 8003A868 5825438C */  lw         $v1, 0x2558($v0)
/* 2848C 8003A86C 00000000 */  nop
/* 28490 8003A870 00110300 */  sll        $v0, $v1, 4
/* 28494 8003A874 21104300 */  addu       $v0, $v0, $v1
/* 28498 8003A878 00110200 */  sll        $v0, $v0, 4
/* 2849C 8003A87C 21108200 */  addu       $v0, $a0, $v0
/* 284A0 8003A880 00100324 */  addiu      $v1, $zero, 0x1000
/* 284A4 8003A884 7C0143A4 */  sh         $v1, 0x17C($v0)
/* 284A8 8003A888 6825828C */  lw         $v0, 0x2568($a0)
/* 284AC 8003A88C 00000000 */  nop
/* 284B0 8003A890 80100200 */  sll        $v0, $v0, 2
/* 284B4 8003A894 21108200 */  addu       $v0, $a0, $v0
/* 284B8 8003A898 5825438C */  lw         $v1, 0x2558($v0)
/* 284BC 8003A89C 00000000 */  nop
/* 284C0 8003A8A0 00110300 */  sll        $v0, $v1, 4
/* 284C4 8003A8A4 21104300 */  addu       $v0, $v0, $v1
/* 284C8 8003A8A8 00110200 */  sll        $v0, $v0, 4
/* 284CC 8003A8AC 21108200 */  addu       $v0, $a0, $v0
/* 284D0 8003A8B0 78FF0324 */  addiu      $v1, $zero, -0x88
/* 284D4 8003A8B4 7E0143A4 */  sh         $v1, 0x17E($v0)
/* 284D8 8003A8B8 EC24A48C */  lw         $a0, 0x24EC($a1)
/* 284DC 8003A8BC C65C000C */  jal        BOTS_Driver_Convert
/* 284E0 8003A8C0 00000000 */   nop
/* 284E4 8003A8C4 4003838F */  lw         $v1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 284E8 8003A8C8 00000000 */  nop
/* 284EC 8003A8CC 6825628C */  lw         $v0, 0x2568($v1)
/* 284F0 8003A8D0 00000000 */  nop
/* 284F4 8003A8D4 01004224 */  addiu      $v0, $v0, 0x1
/* 284F8 8003A8D8 682562AC */  sw         $v0, 0x2568($v1)
.L8003A8DC:
/* 284FC 8003A8DC 01003126 */  addiu      $s1, $s1, 0x1
/* 28500 8003A8E0 4003838F */  lw         $v1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 28504 8003A8E4 FA000224 */  addiu      $v0, $zero, 0xFA
/* 28508 8003A8E8 041B62A4 */  sh         $v0, 0x1B04($v1)
/* 2850C 8003A8EC 061B62A4 */  sh         $v0, 0x1B06($v1)
/* 28510 8003A8F0 0400222A */  slti       $v0, $s1, 0x4
/* 28514 8003A8F4 ABFF4014 */  bnez       $v0, .L8003A7A4
/* 28518 8003A8F8 0C001026 */   addiu     $s0, $s0, 0xC
/* 2851C 8003A8FC 1CEB0008 */  j          .L8003AC70
/* 28520 8003A900 21280000 */   addu      $a1, $zero, $zero
.L8003A904:
/* 28524 8003A904 00806230 */  andi       $v0, $v1, 0x8000
/* 28528 8003A908 D8004010 */  beqz       $v0, .L8003AC6C
/* 2852C 8003A90C 70FE0724 */   addiu     $a3, $zero, -0x190
/* 28530 8003A910 0980023C */  lui        $v0, %hi(D_8008D2F4)
/* 28534 8003A914 F4D24D24 */  addiu      $t5, $v0, %lo(D_8008D2F4)
/* 28538 8003A918 0300AE89 */  lwl        $t6, 0x3($t5)
/* 2853C 8003A91C 0000AE99 */  lwr        $t6, 0x0($t5)
/* 28540 8003A920 0700AF89 */  lwl        $t7, 0x7($t5)
/* 28544 8003A924 0400AF99 */  lwr        $t7, 0x4($t5)
/* 28548 8003A928 1300AEAB */  swl        $t6, 0x13($sp)
/* 2854C 8003A92C 1000AEBB */  swr        $t6, 0x10($sp)
/* 28550 8003A930 1700AFAB */  swl        $t7, 0x17($sp)
/* 28554 8003A934 1400AFBB */  swr        $t7, 0x14($sp)
/* 28558 8003A938 21A00000 */  addu       $s4, $zero, $zero
/* 2855C 8003A93C 21908002 */  addu       $s2, $s4, $zero
/* 28560 8003A940 21880000 */  addu       $s1, $zero, $zero
/* 28564 8003A944 1000B527 */  addiu      $s5, $sp, 0x10
/* 28568 8003A948 01001624 */  addiu      $s6, $zero, 0x1
/* 2856C 8003A94C FFFF1E24 */  addiu      $fp, $zero, -0x1
.L8003A950:
/* 28570 8003A950 4003828F */  lw         $v0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 28574 8003A954 03001024 */  addiu      $s0, $zero, 0x3
/* 28578 8003A958 0C004624 */  addiu      $a2, $v0, 0xC
.L8003A95C:
/* 2857C 8003A95C EC24C28C */  lw         $v0, 0x24EC($a2)
/* 28580 8003A960 00000000 */  nop
/* 28584 8003A964 E404438C */  lw         $v1, 0x4E4($v0)
/* 28588 8003A968 00000000 */  nop
/* 2858C 8003A96C 33006010 */  beqz       $v1, .L8003AA3C
/* 28590 8003A970 00140700 */   sll       $v0, $a3, 16
/* 28594 8003A974 03140200 */  sra        $v0, $v0, 16
/* 28598 8003A978 0D006214 */  bne        $v1, $v0, .L8003A9B0
/* 2859C 8003A97C FF004232 */   andi      $v0, $s2, 0xFF
/* 285A0 8003A980 07100202 */  srav       $v0, $v0, $s0
/* 285A4 8003A984 01004230 */  andi       $v0, $v0, 0x1
/* 285A8 8003A988 09004014 */  bnez       $v0, .L8003A9B0
/* 285AC 8003A98C 01008226 */   addiu     $v0, $s4, 0x1
/* 285B0 8003A990 21A04000 */  addu       $s4, $v0, $zero
/* 285B4 8003A994 00140200 */  sll        $v0, $v0, 16
/* 285B8 8003A998 C3130200 */  sra        $v0, $v0, 15
/* 285BC 8003A99C 2110A202 */  addu       $v0, $s5, $v0
/* 285C0 8003A9A0 000050A4 */  sh         $s0, 0x0($v0)
/* 285C4 8003A9A4 04101602 */  sllv       $v0, $s6, $s0
/* 285C8 8003A9A8 8FEA0008 */  j          .L8003AA3C
/* 285CC 8003A9AC 25904202 */   or        $s2, $s2, $v0
.L8003A9B0:
/* 285D0 8003A9B0 EC24C48C */  lw         $a0, 0x24EC($a2)
/* 285D4 8003A9B4 00140700 */  sll        $v0, $a3, 16
/* 285D8 8003A9B8 E404838C */  lw         $v1, 0x4E4($a0)
/* 285DC 8003A9BC 03140200 */  sra        $v0, $v0, 16
/* 285E0 8003A9C0 2A186200 */  slt        $v1, $v1, $v0
/* 285E4 8003A9C4 1D006014 */  bnez       $v1, .L8003AA3C
/* 285E8 8003A9C8 FF004232 */   andi      $v0, $s2, 0xFF
/* 285EC 8003A9CC 07100202 */  srav       $v0, $v0, $s0
/* 285F0 8003A9D0 01004230 */  andi       $v0, $v0, 0x1
/* 285F4 8003A9D4 19004014 */  bnez       $v0, .L8003AA3C
/* 285F8 8003A9D8 00141400 */   sll       $v0, $s4, 16
/* 285FC 8003A9DC E4048794 */  lhu        $a3, 0x4E4($a0)
/* 28600 8003A9E0 03140200 */  sra        $v0, $v0, 16
/* 28604 8003A9E4 01004224 */  addiu      $v0, $v0, 0x1
/* 28608 8003A9E8 0D004018 */  blez       $v0, .L8003AA20
/* 2860C 8003A9EC 21180000 */   addu      $v1, $zero, $zero
/* 28610 8003A9F0 21284000 */  addu       $a1, $v0, $zero
/* 28614 8003A9F4 2120A002 */  addu       $a0, $s5, $zero
.L8003A9F8:
/* 28618 8003A9F8 00008284 */  lh         $v0, 0x0($a0)
/* 2861C 8003A9FC 00000000 */  nop
/* 28620 8003AA00 03005E10 */  beq        $v0, $fp, .L8003AA10
/* 28624 8003AA04 04105600 */   sllv      $v0, $s6, $v0
/* 28628 8003AA08 27100200 */  nor        $v0, $zero, $v0
/* 2862C 8003AA0C 24904202 */  and        $s2, $s2, $v0
.L8003AA10:
/* 28630 8003AA10 01006324 */  addiu      $v1, $v1, 0x1
/* 28634 8003AA14 2A106500 */  slt        $v0, $v1, $a1
/* 28638 8003AA18 F7FF4014 */  bnez       $v0, .L8003A9F8
/* 2863C 8003AA1C 02008424 */   addiu     $a0, $a0, 0x2
.L8003AA20:
/* 28640 8003AA20 EC24C28C */  lw         $v0, 0x24EC($a2)
/* 28644 8003AA24 00000000 */  nop
/* 28648 8003AA28 E8044394 */  lhu        $v1, 0x4E8($v0)
/* 2864C 8003AA2C 21A00000 */  addu       $s4, $zero, $zero
/* 28650 8003AA30 04107600 */  sllv       $v0, $s6, $v1
/* 28654 8003AA34 25904202 */  or         $s2, $s2, $v0
/* 28658 8003AA38 1000A3A7 */  sh         $v1, 0x10($sp)
.L8003AA3C:
/* 2865C 8003AA3C FFFF1026 */  addiu      $s0, $s0, -0x1
/* 28660 8003AA40 C6FF0106 */  bgez       $s0, .L8003A95C
/* 28664 8003AA44 FCFFC624 */   addiu     $a2, $a2, -0x4
/* 28668 8003AA48 1000A287 */  lh         $v0, 0x10($sp)
/* 2866C 8003AA4C 00000000 */  nop
/* 28670 8003AA50 7D005E10 */  beq        $v0, $fp, .L8003AC48
/* 28674 8003AA54 00141400 */   sll       $v0, $s4, 16
/* 28678 8003AA58 03140200 */  sra        $v0, $v0, 16
/* 2867C 8003AA5C 01004224 */  addiu      $v0, $v0, 0x1
/* 28680 8003AA60 79004018 */  blez       $v0, .L8003AC48
/* 28684 8003AA64 21800000 */   addu      $s0, $zero, $zero
/* 28688 8003AA68 80B81100 */  sll        $s7, $s1, 2
/* 2868C 8003AA6C 2198A002 */  addu       $s3, $s5, $zero
.L8003AA70:
/* 28690 8003AA70 00006286 */  lh         $v0, 0x0($s3)
/* 28694 8003AA74 4003848F */  lw         $a0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 28698 8003AA78 80100200 */  sll        $v0, $v0, 2
/* 2869C 8003AA7C 21108200 */  addu       $v0, $a0, $v0
/* 286A0 8003AA80 EC24428C */  lw         $v0, 0x24EC($v0)
/* 286A4 8003AA84 00000000 */  nop
/* 286A8 8003AA88 E804438C */  lw         $v1, 0x4E8($v0)
/* 286AC 8003AA8C 00000000 */  nop
/* 286B0 8003AA90 40100300 */  sll        $v0, $v1, 1
/* 286B4 8003AA94 21104300 */  addu       $v0, $v0, $v1
/* 286B8 8003AA98 80100200 */  sll        $v0, $v0, 2
/* 286BC 8003AA9C 2110E202 */  addu       $v0, $s7, $v0
/* 286C0 8003AAA0 21108200 */  addu       $v0, $a0, $v0
/* 286C4 8003AAA4 801E438C */  lw         $v1, 0x1E80($v0)
/* 286C8 8003AAA8 00000000 */  nop
/* 286CC 8003AAAC 01006324 */  addiu      $v1, $v1, 0x1
/* 286D0 8003AAB0 3F002016 */  bnez       $s1, .L8003ABB0
/* 286D4 8003AAB4 801E43AC */   sw        $v1, 0x1E80($v0)
/* 286D8 8003AAB8 00006286 */  lh         $v0, 0x0($s3)
/* 286DC 8003AABC 00000000 */  nop
/* 286E0 8003AAC0 80100200 */  sll        $v0, $v0, 2
/* 286E4 8003AAC4 21108200 */  addu       $v0, $a0, $v0
/* 286E8 8003AAC8 EC24438C */  lw         $v1, 0x24EC($v0)
/* 286EC 8003AACC 00000000 */  nop
/* 286F0 8003AAD0 37006010 */  beqz       $v1, .L8003ABB0
/* 286F4 8003AAD4 00000000 */   nop
/* 286F8 8003AAD8 6825828C */  lw         $v0, 0x2568($a0)
/* 286FC 8003AADC 4A006390 */  lbu        $v1, 0x4A($v1)
/* 28700 8003AAE0 80100200 */  sll        $v0, $v0, 2
/* 28704 8003AAE4 21108200 */  addu       $v0, $a0, $v0
/* 28708 8003AAE8 582543AC */  sw         $v1, 0x2558($v0)
/* 2870C 8003AAEC 6825828C */  lw         $v0, 0x2568($a0)
/* 28710 8003AAF0 00000000 */  nop
/* 28714 8003AAF4 80100200 */  sll        $v0, $v0, 2
/* 28718 8003AAF8 21108200 */  addu       $v0, $a0, $v0
/* 2871C 8003AAFC 5825438C */  lw         $v1, 0x2558($v0)
/* 28720 8003AB00 00000000 */  nop
/* 28724 8003AB04 00110300 */  sll        $v0, $v1, 4
/* 28728 8003AB08 21104300 */  addu       $v0, $v0, $v1
/* 2872C 8003AB0C 00110200 */  sll        $v0, $v0, 4
/* 28730 8003AB10 21108200 */  addu       $v0, $a0, $v0
/* 28734 8003AB14 FF1F0324 */  addiu      $v1, $zero, 0x1FFF
/* 28738 8003AB18 7A0143A4 */  sh         $v1, 0x17A($v0)
/* 2873C 8003AB1C 6825828C */  lw         $v0, 0x2568($a0)
/* 28740 8003AB20 00000000 */  nop
/* 28744 8003AB24 80100200 */  sll        $v0, $v0, 2
/* 28748 8003AB28 21108200 */  addu       $v0, $a0, $v0
/* 2874C 8003AB2C 5825438C */  lw         $v1, 0x2558($v0)
/* 28750 8003AB30 00000000 */  nop
/* 28754 8003AB34 00110300 */  sll        $v0, $v1, 4
/* 28758 8003AB38 21104300 */  addu       $v0, $v0, $v1
/* 2875C 8003AB3C 00110200 */  sll        $v0, $v0, 4
/* 28760 8003AB40 21108200 */  addu       $v0, $a0, $v0
/* 28764 8003AB44 00100324 */  addiu      $v1, $zero, 0x1000
/* 28768 8003AB48 7C0143A4 */  sh         $v1, 0x17C($v0)
/* 2876C 8003AB4C 6825828C */  lw         $v0, 0x2568($a0)
/* 28770 8003AB50 00000000 */  nop
/* 28774 8003AB54 80100200 */  sll        $v0, $v0, 2
/* 28778 8003AB58 21108200 */  addu       $v0, $a0, $v0
/* 2877C 8003AB5C 5825438C */  lw         $v1, 0x2558($v0)
/* 28780 8003AB60 00000000 */  nop
/* 28784 8003AB64 00110300 */  sll        $v0, $v1, 4
/* 28788 8003AB68 21104300 */  addu       $v0, $v0, $v1
/* 2878C 8003AB6C 00110200 */  sll        $v0, $v0, 4
/* 28790 8003AB70 21108200 */  addu       $v0, $a0, $v0
/* 28794 8003AB74 78FF0324 */  addiu      $v1, $zero, -0x88
/* 28798 8003AB78 7E0143A4 */  sh         $v1, 0x17E($v0)
/* 2879C 8003AB7C 00006286 */  lh         $v0, 0x0($s3)
/* 287A0 8003AB80 00000000 */  nop
/* 287A4 8003AB84 80100200 */  sll        $v0, $v0, 2
/* 287A8 8003AB88 21108200 */  addu       $v0, $a0, $v0
/* 287AC 8003AB8C EC24448C */  lw         $a0, 0x24EC($v0)
/* 287B0 8003AB90 C65C000C */  jal        BOTS_Driver_Convert
/* 287B4 8003AB94 00000000 */   nop
/* 287B8 8003AB98 4003838F */  lw         $v1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 287BC 8003AB9C 00000000 */  nop
/* 287C0 8003ABA0 6825628C */  lw         $v0, 0x2568($v1)
/* 287C4 8003ABA4 00000000 */  nop
/* 287C8 8003ABA8 01004224 */  addiu      $v0, $v0, 0x1
/* 287CC 8003ABAC 682562AC */  sw         $v0, 0x2568($v1)
.L8003ABB0:
/* 287D0 8003ABB0 4003858F */  lw         $a1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 287D4 8003ABB4 FA000224 */  addiu      $v0, $zero, 0xFA
/* 287D8 8003ABB8 041BA2A4 */  sh         $v0, 0x1B04($a1)
/* 287DC 8003ABBC 061BA2A4 */  sh         $v0, 0x1B06($a1)
/* 287E0 8003ABC0 00006286 */  lh         $v0, 0x0($s3)
/* 287E4 8003ABC4 00000000 */  nop
/* 287E8 8003ABC8 80100200 */  sll        $v0, $v0, 2
/* 287EC 8003ABCC 2110A200 */  addu       $v0, $a1, $v0
/* 287F0 8003ABD0 A81D51AC */  sw         $s1, 0x1DA8($v0)
/* 287F4 8003ABD4 A81CA490 */  lbu        $a0, 0x1CA8($a1)
/* 287F8 8003ABD8 00000000 */  nop
/* 287FC 8003ABDC 13008010 */  beqz       $a0, .L8003AC2C
/* 28800 8003ABE0 21180000 */   addu      $v1, $zero, $zero
/* 28804 8003ABE4 00006286 */  lh         $v0, 0x0($s3)
/* 28808 8003ABE8 21308000 */  addu       $a2, $a0, $zero
/* 2880C 8003ABEC 80100200 */  sll        $v0, $v0, 2
/* 28810 8003ABF0 2110A200 */  addu       $v0, $a1, $v0
/* 28814 8003ABF4 EC24428C */  lw         $v0, 0x24EC($v0)
/* 28818 8003ABF8 2120A000 */  addu       $a0, $a1, $zero
/* 2881C 8003ABFC E804458C */  lw         $a1, 0x4E8($v0)
.L8003AC00:
/* 28820 8003AC00 EC24828C */  lw         $v0, 0x24EC($a0)
/* 28824 8003AC04 00000000 */  nop
/* 28828 8003AC08 E804428C */  lw         $v0, 0x4E8($v0)
/* 2882C 8003AC0C 00000000 */  nop
/* 28830 8003AC10 02004514 */  bne        $v0, $a1, .L8003AC1C
/* 28834 8003AC14 04107600 */   sllv      $v0, $s6, $v1
/* 28838 8003AC18 25904202 */  or         $s2, $s2, $v0
.L8003AC1C:
/* 2883C 8003AC1C 01006324 */  addiu      $v1, $v1, 0x1
/* 28840 8003AC20 2A106600 */  slt        $v0, $v1, $a2
/* 28844 8003AC24 F6FF4014 */  bnez       $v0, .L8003AC00
/* 28848 8003AC28 04008424 */   addiu     $a0, $a0, 0x4
.L8003AC2C:
/* 2884C 8003AC2C 01001026 */  addiu      $s0, $s0, 0x1
/* 28850 8003AC30 00141400 */  sll        $v0, $s4, 16
/* 28854 8003AC34 03140200 */  sra        $v0, $v0, 16
/* 28858 8003AC38 01004224 */  addiu      $v0, $v0, 0x1
/* 2885C 8003AC3C 2A100202 */  slt        $v0, $s0, $v0
/* 28860 8003AC40 8BFF4014 */  bnez       $v0, .L8003AA70
/* 28864 8003AC44 02007326 */   addiu     $s3, $s3, 0x2
.L8003AC48:
/* 28868 8003AC48 00141400 */  sll        $v0, $s4, 16
/* 2886C 8003AC4C 03140200 */  sra        $v0, $v0, 16
/* 28870 8003AC50 21882202 */  addu       $s1, $s1, $v0
/* 28874 8003AC54 70FE0724 */  addiu      $a3, $zero, -0x190
/* 28878 8003AC58 1000BEA7 */  sh         $fp, 0x10($sp)
/* 2887C 8003AC5C 01003126 */  addiu      $s1, $s1, 0x1
/* 28880 8003AC60 0400222A */  slti       $v0, $s1, 0x4
/* 28884 8003AC64 3AFF4014 */  bnez       $v0, .L8003A950
/* 28888 8003AC68 21A00000 */   addu      $s4, $zero, $zero
.L8003AC6C:
/* 2888C 8003AC6C 21280000 */  addu       $a1, $zero, $zero
.L8003AC70:
/* 28890 8003AC70 2158A000 */  addu       $t3, $a1, $zero
/* 28894 8003AC74 FFFF0924 */  addiu      $t1, $zero, -0x1
/* 28898 8003AC78 2130A000 */  addu       $a2, $a1, $zero
/* 2889C 8003AC7C 21880000 */  addu       $s1, $zero, $zero
/* 288A0 8003AC80 03000C24 */  addiu      $t4, $zero, 0x3
/* 288A4 8003AC84 40038A8F */  lw         $t2, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 288A8 8003AC88 21402002 */  addu       $t0, $s1, $zero
/* 288AC 8003AC8C 21384001 */  addu       $a3, $t2, $zero
.L8003AC90:
/* 288B0 8003AC90 21800000 */  addu       $s0, $zero, $zero
/* 288B4 8003AC94 21200001 */  addu       $a0, $t0, $zero
.L8003AC98:
/* 288B8 8003AC98 21104401 */  addu       $v0, $t2, $a0
/* 288BC 8003AC9C 801E438C */  lw         $v1, 0x1E80($v0)
/* 288C0 8003ACA0 23109001 */  subu       $v0, $t4, $s0
/* 288C4 8003ACA4 18006200 */  mult       $v1, $v0
/* 288C8 8003ACA8 04008424 */  addiu      $a0, $a0, 0x4
/* 288CC 8003ACAC 01001026 */  addiu      $s0, $s0, 0x1
/* 288D0 8003ACB0 0300022A */  slti       $v0, $s0, 0x3
/* 288D4 8003ACB4 12680000 */  mflo       $t5
/* 288D8 8003ACB8 2118AD00 */  addu       $v1, $a1, $t5
/* 288DC 8003ACBC F6FF4014 */  bnez       $v0, .L8003AC98
/* 288E0 8003ACC0 21286000 */   addu      $a1, $v1, $zero
/* 288E4 8003ACC4 00140300 */  sll        $v0, $v1, 16
/* 288E8 8003ACC8 03140200 */  sra        $v0, $v0, 16
/* 288EC 8003ACCC E01DE2AC */  sw         $v0, 0x1DE0($a3)
/* 288F0 8003ACD0 21280000 */  addu       $a1, $zero, $zero
/* 288F4 8003ACD4 0400E724 */  addiu      $a3, $a3, 0x4
/* 288F8 8003ACD8 01003126 */  addiu      $s1, $s1, 0x1
/* 288FC 8003ACDC 0400222A */  slti       $v0, $s1, 0x4
/* 28900 8003ACE0 EBFF4014 */  bnez       $v0, .L8003AC90
/* 28904 8003ACE4 0C000825 */   addiu     $t0, $t0, 0xC
/* 28908 8003ACE8 21880000 */  addu       $s1, $zero, $zero
/* 2890C 8003ACEC 01000824 */  addiu      $t0, $zero, 0x1
/* 28910 8003ACF0 4003858F */  lw         $a1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 28914 8003ACF4 FFFF0A24 */  addiu      $t2, $zero, -0x1
/* 28918 8003ACF8 2138A000 */  addu       $a3, $a1, $zero
.L8003ACFC:
/* 2891C 8003ACFC 03001024 */  addiu      $s0, $zero, 0x3
/* 28920 8003AD00 0C00A424 */  addiu      $a0, $a1, 0xC
.L8003AD04:
/* 28924 8003AD04 00140B00 */  sll        $v0, $t3, 16
/* 28928 8003AD08 E01D838C */  lw         $v1, 0x1DE0($a0)
/* 2892C 8003AD0C 03140200 */  sra        $v0, $v0, 16
/* 28930 8003AD10 2A186200 */  slt        $v1, $v1, $v0
/* 28934 8003AD14 19006014 */  bnez       $v1, .L8003AD7C
/* 28938 8003AD18 FF00C230 */   andi      $v0, $a2, 0xFF
/* 2893C 8003AD1C 07100202 */  srav       $v0, $v0, $s0
/* 28940 8003AD20 01004230 */  andi       $v0, $v0, 0x1
/* 28944 8003AD24 15004014 */  bnez       $v0, .L8003AD7C
/* 28948 8003AD28 04180802 */   sllv      $v1, $t0, $s0
/* 2894C 8003AD2C D81DA28C */  lw         $v0, 0x1DD8($a1)
/* 28950 8003AD30 00000000 */  nop
/* 28954 8003AD34 24104300 */  and        $v0, $v0, $v1
/* 28958 8003AD38 06004014 */  bnez       $v0, .L8003AD54
/* 2895C 8003AD3C 00000000 */   nop
/* 28960 8003AD40 0000A28C */  lw         $v0, 0x0($a1)
/* 28964 8003AD44 00000000 */  nop
/* 28968 8003AD48 20004230 */  andi       $v0, $v0, 0x20
/* 2896C 8003AD4C 0B004014 */  bnez       $v0, .L8003AD7C
/* 28970 8003AD50 00000000 */   nop
.L8003AD54:
/* 28974 8003AD54 E01D8B94 */  lhu        $t3, 0x1DE0($a0)
/* 28978 8003AD58 00140900 */  sll        $v0, $t1, 16
/* 2897C 8003AD5C 03140200 */  sra        $v0, $v0, 16
/* 28980 8003AD60 03004A10 */  beq        $v0, $t2, .L8003AD70
/* 28984 8003AD64 04104800 */   sllv      $v0, $t0, $v0
/* 28988 8003AD68 27100200 */  nor        $v0, $zero, $v0
/* 2898C 8003AD6C 2430C200 */  and        $a2, $a2, $v0
.L8003AD70:
/* 28990 8003AD70 21480002 */  addu       $t1, $s0, $zero
/* 28994 8003AD74 04100802 */  sllv       $v0, $t0, $s0
/* 28998 8003AD78 2530C200 */  or         $a2, $a2, $v0
.L8003AD7C:
/* 2899C 8003AD7C FFFF1026 */  addiu      $s0, $s0, -0x1
/* 289A0 8003AD80 E0FF0106 */  bgez       $s0, .L8003AD04
/* 289A4 8003AD84 FCFF8424 */   addiu     $a0, $a0, -0x4
/* 289A8 8003AD88 00140900 */  sll        $v0, $t1, 16
/* 289AC 8003AD8C 03140200 */  sra        $v0, $v0, 16
/* 289B0 8003AD90 C81DE2AC */  sw         $v0, 0x1DC8($a3)
/* 289B4 8003AD94 21580000 */  addu       $t3, $zero, $zero
/* 289B8 8003AD98 FFFF0924 */  addiu      $t1, $zero, -0x1
/* 289BC 8003AD9C 01003126 */  addiu      $s1, $s1, 0x1
/* 289C0 8003ADA0 0400222A */  slti       $v0, $s1, 0x4
/* 289C4 8003ADA4 D5FF4014 */  bnez       $v0, .L8003ACFC
/* 289C8 8003ADA8 0400E724 */   addiu     $a3, $a3, 0x4
/* 289CC 8003ADAC 4003828F */  lw         $v0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 289D0 8003ADB0 00000000 */  nop
/* 289D4 8003ADB4 2C1B508C */  lw         $s0, 0x1B2C($v0)
/* 289D8 8003ADB8 00000000 */  nop
/* 289DC 8003ADBC 08000012 */  beqz       $s0, .L8003ADE0
/* 289E0 8003ADC0 00000000 */   nop
.L8003ADC4:
/* 289E4 8003ADC4 3000048E */  lw         $a0, 0x30($s0)
/* 289E8 8003ADC8 CB55010C */  jal        DECOMP_UI_RaceEnd_GetDriverClock
/* 289EC 8003ADCC 00000000 */   nop
/* 289F0 8003ADD0 1000108E */  lw         $s0, 0x10($s0)
/* 289F4 8003ADD4 00000000 */  nop
/* 289F8 8003ADD8 FAFF0016 */  bnez       $s0, .L8003ADC4
/* 289FC 8003ADDC 00000000 */   nop
.L8003ADE0:
/* 28A00 8003ADE0 FF52010C */  jal        UI_VsQuipAssignAll
/* 28A04 8003ADE4 00000000 */   nop
/* 28A08 8003ADE8 822A010C */  jal        DECOMP_SubmitName_RestoreName
/* 28A0C 8003ADEC 02000424 */   addiu     $a0, $zero, 0x2
/* 28A10 8003ADF0 4003828F */  lw         $v0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 28A14 8003ADF4 00000000 */  nop
/* 28A18 8003ADF8 0000428C */  lw         $v0, 0x0($v0)
/* 28A1C 8003ADFC 0204033C */  lui        $v1, (0x4020000 >> 16)
/* 28A20 8003AE00 24104300 */  and        $v0, $v0, $v1
/* 28A24 8003AE04 29004010 */  beqz       $v0, .L8003AEAC
/* 28A28 8003AE08 00000000 */   nop
/* 28A2C 8003AE0C EAE7000C */  jal        MainGameEnd_SoloRaceGetReward
/* 28A30 8003AE10 01000424 */   addiu     $a0, $zero, 0x1
/* 28A34 8003AE14 4003828F */  lw         $v0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 28A38 8003AE18 00000000 */  nop
/* 28A3C 8003AE1C 0000428C */  lw         $v0, 0x0($v0)
/* 28A40 8003AE20 0004033C */  lui        $v1, (0x4000000 >> 16)
/* 28A44 8003AE24 24104300 */  and        $v0, $v0, $v1
/* 28A48 8003AE28 05004010 */  beqz       $v0, .L8003AE40
/* 28A4C 8003AE2C 00000000 */   nop
/* 28A50 8003AE30 C77D020C */  jal        DECOMP_RR_EndEvent_UnlockAward
/* 28A54 8003AE34 00000000 */   nop
/* 28A58 8003AE38 ABEB0008 */  j          .L8003AEAC
/* 28A5C 8003AE3C 00000000 */   nop
.L8003AE40:
/* 28A60 8003AE40 0980023C */  lui        $v0, %hi(D_8008D958)
/* 28A64 8003AE44 58D94284 */  lh         $v0, %lo(D_8008D958)($v0)
/* 28A68 8003AE48 00000000 */  nop
/* 28A6C 8003AE4C 0F004010 */  beqz       $v0, .L8003AE8C
/* 28A70 8003AE50 00000000 */   nop
/* 28A74 8003AE54 0980023C */  lui        $v0, %hi(D_8008D744)
/* 28A78 8003AE58 44D74284 */  lh         $v0, %lo(D_8008D744)($v0)
/* 28A7C 8003AE5C 00000000 */  nop
/* 28A80 8003AE60 12004014 */  bnez       $v0, .L8003AEAC
/* 28A84 8003AE64 00000000 */   nop
/* 28A88 8003AE68 1800AE8F */  lw         $t6, 0x18($sp)
/* 28A8C 8003AE6C 0980023C */  lui        $v0, %hi(D_8008D754)
/* 28A90 8003AE70 54D7428C */  lw         $v0, %lo(D_8008D754)($v0)
/* 28A94 8003AE74 1405C38D */  lw         $v1, 0x514($t6)
/* 28A98 8003AE78 1000428C */  lw         $v0, 0x10($v0)
/* 28A9C 8003AE7C 00000000 */  nop
/* 28AA0 8003AE80 2A186200 */  slt        $v1, $v1, $v0
/* 28AA4 8003AE84 09006010 */  beqz       $v1, .L8003AEAC
/* 28AA8 8003AE88 00000000 */   nop
.L8003AE8C:
/* 28AAC 8003AE8C A49F000C */  jal        DECOMP_GhostTape_End
/* 28AB0 8003AE90 00000000 */   nop
/* 28AB4 8003AE94 4003838F */  lw         $v1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 28AB8 8003AE98 00000000 */  nop
/* 28ABC 8003AE9C 441D628C */  lw         $v0, 0x1D44($v1)
/* 28AC0 8003AEA0 00000000 */  nop
/* 28AC4 8003AEA4 01004234 */  ori        $v0, $v0, 0x1
/* 28AC8 8003AEA8 441D62AC */  sw         $v0, 0x1D44($v1)
.L8003AEAC:
/* 28ACC 8003AEAC 4003848F */  lw         $a0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 28AD0 8003AEB0 2107010C */  jal        DECOMP_Podium_InitModels
/* 28AD4 8003AEB4 00000000 */   nop
/* 28AD8 8003AEB8 4400BF8F */  lw         $ra, 0x44($sp)
/* 28ADC 8003AEBC 4000BE8F */  lw         $fp, 0x40($sp)
/* 28AE0 8003AEC0 3C00B78F */  lw         $s7, 0x3C($sp)
/* 28AE4 8003AEC4 3800B68F */  lw         $s6, 0x38($sp)
/* 28AE8 8003AEC8 3400B58F */  lw         $s5, 0x34($sp)
/* 28AEC 8003AECC 3000B48F */  lw         $s4, 0x30($sp)
/* 28AF0 8003AED0 2C00B38F */  lw         $s3, 0x2C($sp)
/* 28AF4 8003AED4 2800B28F */  lw         $s2, 0x28($sp)
/* 28AF8 8003AED8 2400B18F */  lw         $s1, 0x24($sp)
/* 28AFC 8003AEDC 2000B08F */  lw         $s0, 0x20($sp)
/* 28B00 8003AEE0 0800E003 */  jr         $ra
/* 28B04 8003AEE4 4800BD27 */   addiu     $sp, $sp, 0x48
.size MainGameEnd_Initialize, . - MainGameEnd_Initialize
