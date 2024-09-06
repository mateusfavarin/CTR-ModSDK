.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel RenderBucket_DrawFunc_Normal
/* 5814C 8006A52C FC010011 */  beqz       $t0, .L8006AD20
/* 58150 8006A530 04003927 */   addiu     $t9, $t9, 0x4
/* 58154 8006A534 09F8C002 */  jalr       $s6
/* 58158 8006A538 0C012BAC */   sw        $t3, 0x10C($at)
/* 5815C 8006A53C FCFF2B8F */  lw         $t3, -0x4($t9)
/* 58160 8006A540 00008848 */  mtc2       $t0, $0 /* handwritten instruction */
/* 58164 8006A544 00088348 */  mtc2       $v1, $1 /* handwritten instruction */
/* 58168 8006A548 09F8C002 */  jalr       $s6
/* 5816C 8006A54C 21702001 */   addu      $t6, $t1, $zero
/* 58170 8006A550 00002B8F */  lw         $t3, 0x0($t9)
/* 58174 8006A554 00108848 */  mtc2       $t0, $2 /* handwritten instruction */
/* 58178 8006A558 00188348 */  mtc2       $v1, $3 /* handwritten instruction */
/* 5817C 8006A55C 09F8C002 */  jalr       $s6
/* 58180 8006A560 21782001 */   addu      $t7, $t1, $zero
/* 58184 8006A564 00208848 */  mtc2       $t0, $4 /* handwritten instruction */
/* 58188 8006A568 00288348 */  mtc2       $v1, $5 /* handwritten instruction */
/* 5818C 8006A56C 21802001 */  addu       $s0, $t1, $zero
/* 58190 8006A570 0C012B8C */  lw         $t3, 0x10C($at)
/* 58194 8006A574 3000284A */  RTPT
/* 58198 8006A578 04003927 */  addiu      $t9, $t9, 0x4
.L8006A57C:
/* 5819C 8006A57C FF016631 */  andi       $a2, $t3, 0x1FF
/* 581A0 8006A580 0300C010 */  beqz       $a2, .L8006A590
/* 581A4 8006A584 80300600 */   sll       $a2, $a2, 2
/* 581A8 8006A588 2130DD00 */  addu       $a2, $a2, $sp
/* 581AC 8006A58C FCFFC68C */  lw         $a2, -0x4($a2)
.L8006A590:
/* 581B0 8006A590 1C00238C */  lw         $v1, 0x1C($at)
/* 581B4 8006A594 00700A48 */  mfc2       $t2, $14 /* handwritten instruction */
/* 581B8 8006A598 00F84548 */  cfc2       $a1, $31 /* handwritten instruction */
/* 581BC 8006A59C C0400B00 */  sll        $t0, $t3, 3
/* 581C0 8006A5A0 402B0500 */  sll        $a1, $a1, 13
/* 581C4 8006A5A4 1A00A004 */  bltz       $a1, .L8006A610
/* 581C8 8006A5A8 80480B00 */   sll       $t1, $t3, 2
/* 581CC 8006A5AC 07000105 */  bgez       $t0, .L8006A5CC
/* 581D0 8006A5B0 24002584 */   lh        $a1, 0x24($at)
/* 581D4 8006A5B4 0600404B */  NCLIP
/* 581D8 8006A5B8 00C00848 */  mfc2       $t0, $24 /* handwritten instruction */
/* 581DC 8006A5BC 2648A900 */  xor        $t1, $a1, $t1
/* 581E0 8006A5C0 13000011 */  beqz       $t0, .L8006A610
/* 581E4 8006A5C4 26400901 */   xor       $t0, $t0, $t1
/* 581E8 8006A5C8 11000019 */  blez       $t0, .L8006A610
.L8006A5CC:
/* 581EC 8006A5CC 00600848 */   mfc2      $t0, $12 /* handwritten instruction */
/* 581F0 8006A5D0 00680948 */  mfc2       $t1, $13 /* handwritten instruction */
/* 581F4 8006A5D4 24280A01 */  and        $a1, $t0, $t2
/* 581F8 8006A5D8 2428A900 */  and        $a1, $a1, $t1
/* 581FC 8006A5DC 2D00584B */  AVSZ3
/* 58200 8006A5E0 23400301 */  subu       $t0, $t0, $v1
/* 58204 8006A5E4 23482301 */  subu       $t1, $t1, $v1
/* 58208 8006A5E8 23504301 */  subu       $t2, $t2, $v1
/* 5820C 8006A5EC 25180901 */  or         $v1, $t0, $t1
/* 58210 8006A5F0 27186A00 */  nor        $v1, $v1, $t2
/* 58214 8006A5F4 25186500 */  or         $v1, $v1, $a1
/* 58218 8006A5F8 05006004 */  bltz       $v1, .L8006A610
/* 5821C 8006A5FC 001C0300 */   sll       $v1, $v1, 16
/* 58220 8006A600 03006004 */  bltz       $v1, .L8006A610
/* 58224 8006A604 2C0038E8 */   swc2      $24, 0x2C($at)
/* 58228 8006A608 09F8A002 */  jalr       $s5
/* 5822C 8006A60C 500026AC */   sw        $a2, 0x50($at)
.L8006A610:
/* 58230 8006A610 00002B8F */  lw         $t3, 0x0($t9)
/* 58234 8006A614 04003927 */  addiu      $t9, $t9, 0x4
/* 58238 8006A618 C4FF6005 */  bltz       $t3, RenderBucket_DrawFunc_Normal
/* 5823C 8006A61C 01006825 */   addiu     $t0, $t3, 0x1
/* 58240 8006A620 02440B00 */  srl        $t0, $t3, 16
/* 58244 8006A624 14000015 */  bnez       $t0, .L8006A678
/* 58248 8006A628 40480B00 */   sll       $t1, $t3, 1
/* 5824C 8006A62C C0470B00 */  sll        $t0, $t3, 31
/* 58250 8006A630 C2190B00 */  srl        $v1, $t3, 7
/* 58254 8006A634 04000005 */  bltz       $t0, .L8006A648
/* 58258 8006A638 FC016330 */   andi      $v1, $v1, 0x1FC
/* 5825C 8006A63C 21187C00 */  addu       $v1, $v1, $gp
/* 58260 8006A640 03000104 */  bgez       $zero, .L8006A650
/* 58264 8006A644 00006F8C */   lw        $t7, 0x0($v1)
.L8006A648:
/* 58268 8006A648 21186100 */  addu       $v1, $v1, $at
/* 5826C 8006A64C 40016F8C */  lw         $t7, 0x140($v1)
.L8006A650:
/* 58270 8006A650 80470B00 */  sll        $t0, $t3, 30
/* 58274 8006A654 04000005 */  bltz       $t0, .L8006A668
/* 58278 8006A658 FC016331 */   andi      $v1, $t3, 0x1FC
/* 5827C 8006A65C 21187C00 */  addu       $v1, $v1, $gp
/* 58280 8006A660 03000104 */  bgez       $zero, .L8006A670
/* 58284 8006A664 0000708C */   lw        $s0, 0x0($v1)
.L8006A668:
/* 58288 8006A668 21186100 */  addu       $v1, $v1, $at
/* 5828C 8006A66C 4001708C */  lw         $s0, 0x140($v1)
.L8006A670:
/* 58290 8006A670 E7FF0104 */  bgez       $zero, .L8006A610
/* 58294 8006A674 2170E001 */   addu      $t6, $t7, $zero
.L8006A678:
/* 58298 8006A678 06002105 */  bgez       $t1, .L8006A694
/* 5829C 8006A67C 00000000 */   nop
/* 582A0 8006A680 00600948 */  mfc2       $t1, $12 /* handwritten instruction */
/* 582A4 8006A684 00880A48 */  mfc2       $t2, $17 /* handwritten instruction */
/* 582A8 8006A688 00688948 */  mtc2       $t1, $13 /* handwritten instruction */
/* 582AC 8006A68C 00908A48 */  mtc2       $t2, $18 /* handwritten instruction */
/* 582B0 8006A690 2178C001 */  addu       $t7, $t6, $zero
.L8006A694:
/* 582B4 8006A694 09F8C002 */  jalr       $s6
/* 582B8 8006A698 2170E001 */   addu      $t6, $t7, $zero
/* 582BC 8006A69C 00008848 */  mtc2       $t0, $0 /* handwritten instruction */
/* 582C0 8006A6A0 00088348 */  mtc2       $v1, $1 /* handwritten instruction */
/* 582C4 8006A6A4 21780002 */  addu       $t7, $s0, $zero
/* 582C8 8006A6A8 21802001 */  addu       $s0, $t1, $zero
/* 582CC 8006A6AC 0100184A */  RTPS
/* 582D0 8006A6B0 B2FF0104 */  bgez       $zero, .L8006A57C
/* 582D4 8006A6B4 00000000 */   nop
/* 582D8 8006A6B8 00D04348 */  cfc2       $v1, $26 /* handwritten instruction */
/* 582DC 8006A6BC 00384948 */  cfc2       $t1, $7 /* handwritten instruction */
/* 582E0 8006A6C0 40180300 */  sll        $v1, $v1, 1
/* 582E4 8006A6C4 23186900 */  subu       $v1, $v1, $t1
/* 582E8 8006A6C8 440023A4 */  sh         $v1, 0x44($at)
/* 582EC 8006A6CC DC0023AC */  sw         $v1, 0xDC($at)
/* 582F0 8006A6D0 F40023AC */  sw         $v1, 0xF4($at)
.L8006A6D4:
/* 582F4 8006A6D4 92010011 */  beqz       $t0, .L8006AD20
/* 582F8 8006A6D8 04003927 */   addiu     $t9, $t9, 0x4
/* 582FC 8006A6DC 09F8C002 */  jalr       $s6
/* 58300 8006A6E0 0C012BAC */   sw        $t3, 0x10C($at)
/* 58304 8006A6E4 FCFF2B8F */  lw         $t3, -0x4($t9)
/* 58308 8006A6E8 900028AC */  sw         $t0, 0x90($at)
/* 5830C 8006A6EC 44002884 */  lh         $t0, 0x44($at)
/* 58310 8006A6F0 940023AC */  sw         $v1, 0x94($at)
/* 58314 8006A6F4 23180301 */  subu       $v1, $t0, $v1
/* 58318 8006A6F8 9E0023A4 */  sh         $v1, 0x9E($at)
/* 5831C 8006A6FC 09F8C002 */  jalr       $s6
/* 58320 8006A700 21702001 */   addu      $t6, $t1, $zero
/* 58324 8006A704 00002B8F */  lw         $t3, 0x0($t9)
/* 58328 8006A708 A80028AC */  sw         $t0, 0xA8($at)
/* 5832C 8006A70C 44002884 */  lh         $t0, 0x44($at)
/* 58330 8006A710 AC0023AC */  sw         $v1, 0xAC($at)
/* 58334 8006A714 23180301 */  subu       $v1, $t0, $v1
/* 58338 8006A718 B60023A4 */  sh         $v1, 0xB6($at)
/* 5833C 8006A71C 09F8C002 */  jalr       $s6
/* 58340 8006A720 21782001 */   addu      $t7, $t1, $zero
/* 58344 8006A724 900020C8 */  lwc2       $0, 0x90($at)
/* 58348 8006A728 940021C8 */  lwc2       $1, 0x94($at)
/* 5834C 8006A72C A80022C8 */  lwc2       $2, 0xA8($at)
/* 58350 8006A730 AC0023C8 */  lwc2       $3, 0xAC($at)
/* 58354 8006A734 00208848 */  mtc2       $t0, $4 /* handwritten instruction */
/* 58358 8006A738 00288348 */  mtc2       $v1, $5 /* handwritten instruction */
/* 5835C 8006A73C 21802001 */  addu       $s0, $t1, $zero
/* 58360 8006A740 0C012B8C */  lw         $t3, 0x10C($at)
/* 58364 8006A744 3000284A */  RTPT
/* 58368 8006A748 C00028AC */  sw         $t0, 0xC0($at)
/* 5836C 8006A74C 44002884 */  lh         $t0, 0x44($at)
/* 58370 8006A750 C40023AC */  sw         $v1, 0xC4($at)
/* 58374 8006A754 23180301 */  subu       $v1, $t0, $v1
/* 58378 8006A758 CE0023A4 */  sh         $v1, 0xCE($at)
/* 5837C 8006A75C 04003927 */  addiu      $t9, $t9, 0x4
.L8006A760:
/* 58380 8006A760 FF016631 */  andi       $a2, $t3, 0x1FF
/* 58384 8006A764 0300C010 */  beqz       $a2, .L8006A774
/* 58388 8006A768 80300600 */   sll       $a2, $a2, 2
/* 5838C 8006A76C 2130DD00 */  addu       $a2, $a2, $sp
/* 58390 8006A770 FCFFC68C */  lw         $a2, -0x4($a2)
.L8006A774:
/* 58394 8006A774 1C00238C */  lw         $v1, 0x1C($at)
/* 58398 8006A778 00700A48 */  mfc2       $t2, $14 /* handwritten instruction */
/* 5839C 8006A77C 00F84548 */  cfc2       $a1, $31 /* handwritten instruction */
/* 583A0 8006A780 C0400B00 */  sll        $t0, $t3, 3
/* 583A4 8006A784 402B0500 */  sll        $a1, $a1, 13
/* 583A8 8006A788 1A00A004 */  bltz       $a1, .L8006A7F4
/* 583AC 8006A78C 80480B00 */   sll       $t1, $t3, 2
/* 583B0 8006A790 07000105 */  bgez       $t0, .L8006A7B0
/* 583B4 8006A794 24002584 */   lh        $a1, 0x24($at)
/* 583B8 8006A798 0600404B */  NCLIP
/* 583BC 8006A79C 00C00848 */  mfc2       $t0, $24 /* handwritten instruction */
/* 583C0 8006A7A0 2648A900 */  xor        $t1, $a1, $t1
/* 583C4 8006A7A4 13000011 */  beqz       $t0, .L8006A7F4
/* 583C8 8006A7A8 26400901 */   xor       $t0, $t0, $t1
/* 583CC 8006A7AC 11000019 */  blez       $t0, .L8006A7F4
.L8006A7B0:
/* 583D0 8006A7B0 00600848 */   mfc2      $t0, $12 /* handwritten instruction */
/* 583D4 8006A7B4 00680948 */  mfc2       $t1, $13 /* handwritten instruction */
/* 583D8 8006A7B8 24280A01 */  and        $a1, $t0, $t2
/* 583DC 8006A7BC 2428A900 */  and        $a1, $a1, $t1
/* 583E0 8006A7C0 2D00584B */  AVSZ3
/* 583E4 8006A7C4 23400301 */  subu       $t0, $t0, $v1
/* 583E8 8006A7C8 23482301 */  subu       $t1, $t1, $v1
/* 583EC 8006A7CC 23504301 */  subu       $t2, $t2, $v1
/* 583F0 8006A7D0 25180901 */  or         $v1, $t0, $t1
/* 583F4 8006A7D4 27186A00 */  nor        $v1, $v1, $t2
/* 583F8 8006A7D8 25186500 */  or         $v1, $v1, $a1
/* 583FC 8006A7DC 05006004 */  bltz       $v1, .L8006A7F4
/* 58400 8006A7E0 001C0300 */   sll       $v1, $v1, 16
/* 58404 8006A7E4 03006004 */  bltz       $v1, .L8006A7F4
/* 58408 8006A7E8 2C0038E8 */   swc2      $24, 0x2C($at)
/* 5840C 8006A7EC 32AD010C */  jal        func_8006B4C8
/* 58410 8006A7F0 500026AC */   sw        $a2, 0x50($at)
.L8006A7F4:
/* 58414 8006A7F4 00002B8F */  lw         $t3, 0x0($t9)
/* 58418 8006A7F8 04003927 */  addiu      $t9, $t9, 0x4
/* 5841C 8006A7FC B5FF6005 */  bltz       $t3, .L8006A6D4
/* 58420 8006A800 01006825 */   addiu     $t0, $t3, 0x1
/* 58424 8006A804 02440B00 */  srl        $t0, $t3, 16
/* 58428 8006A808 14000015 */  bnez       $t0, .L8006A85C
/* 5842C 8006A80C 40480B00 */   sll       $t1, $t3, 1
/* 58430 8006A810 C0470B00 */  sll        $t0, $t3, 31
/* 58434 8006A814 C2190B00 */  srl        $v1, $t3, 7
/* 58438 8006A818 04000005 */  bltz       $t0, .L8006A82C
/* 5843C 8006A81C FC016330 */   andi      $v1, $v1, 0x1FC
/* 58440 8006A820 21187C00 */  addu       $v1, $v1, $gp
/* 58444 8006A824 03000104 */  bgez       $zero, .L8006A834
/* 58448 8006A828 00006F8C */   lw        $t7, 0x0($v1)
.L8006A82C:
/* 5844C 8006A82C 21186100 */  addu       $v1, $v1, $at
/* 58450 8006A830 40016F8C */  lw         $t7, 0x140($v1)
.L8006A834:
/* 58454 8006A834 80470B00 */  sll        $t0, $t3, 30
/* 58458 8006A838 04000005 */  bltz       $t0, .L8006A84C
/* 5845C 8006A83C FC016331 */   andi      $v1, $t3, 0x1FC
/* 58460 8006A840 21187C00 */  addu       $v1, $v1, $gp
/* 58464 8006A844 03000104 */  bgez       $zero, .L8006A854
/* 58468 8006A848 0000708C */   lw        $s0, 0x0($v1)
.L8006A84C:
/* 5846C 8006A84C 21186100 */  addu       $v1, $v1, $at
/* 58470 8006A850 4001708C */  lw         $s0, 0x140($v1)
.L8006A854:
/* 58474 8006A854 E7FF0104 */  bgez       $zero, .L8006A7F4
/* 58478 8006A858 2170E001 */   addu      $t6, $t7, $zero
.L8006A85C:
/* 5847C 8006A85C 07002105 */  bgez       $t1, .L8006A87C
/* 58480 8006A860 00000000 */   nop
/* 58484 8006A864 00600948 */  mfc2       $t1, $12 /* handwritten instruction */
/* 58488 8006A868 00880A48 */  mfc2       $t2, $17 /* handwritten instruction */
/* 5848C 8006A86C 00688948 */  mtc2       $t1, $13 /* handwritten instruction */
/* 58490 8006A870 00908A48 */  mtc2       $t2, $18 /* handwritten instruction */
/* 58494 8006A874 07000104 */  bgez       $zero, .L8006A894
/* 58498 8006A878 2178C001 */   addu      $t7, $t6, $zero
.L8006A87C:
/* 5849C 8006A87C A800298C */  lw         $t1, 0xA8($at)
/* 584A0 8006A880 AC002A8C */  lw         $t2, 0xAC($at)
/* 584A4 8006A884 900029AC */  sw         $t1, 0x90($at)
/* 584A8 8006A888 B6002984 */  lh         $t1, 0xB6($at)
/* 584AC 8006A88C 94002AAC */  sw         $t2, 0x94($at)
/* 584B0 8006A890 9E0029A4 */  sh         $t1, 0x9E($at)
.L8006A894:
/* 584B4 8006A894 C000298C */  lw         $t1, 0xC0($at)
/* 584B8 8006A898 C4002A8C */  lw         $t2, 0xC4($at)
/* 584BC 8006A89C A80029AC */  sw         $t1, 0xA8($at)
/* 584C0 8006A8A0 CE002984 */  lh         $t1, 0xCE($at)
/* 584C4 8006A8A4 AC002AAC */  sw         $t2, 0xAC($at)
/* 584C8 8006A8A8 B60029A4 */  sh         $t1, 0xB6($at)
/* 584CC 8006A8AC 09F8C002 */  jalr       $s6
/* 584D0 8006A8B0 2170E001 */   addu      $t6, $t7, $zero
/* 584D4 8006A8B4 00008848 */  mtc2       $t0, $0 /* handwritten instruction */
/* 584D8 8006A8B8 00088348 */  mtc2       $v1, $1 /* handwritten instruction */
/* 584DC 8006A8BC 21780002 */  addu       $t7, $s0, $zero
/* 584E0 8006A8C0 21802001 */  addu       $s0, $t1, $zero
/* 584E4 8006A8C4 0100184A */  RTPS
/* 584E8 8006A8C8 C00028AC */  sw         $t0, 0xC0($at)
/* 584EC 8006A8CC 44002884 */  lh         $t0, 0x44($at)
/* 584F0 8006A8D0 C40023AC */  sw         $v1, 0xC4($at)
/* 584F4 8006A8D4 23180301 */  subu       $v1, $t0, $v1
/* 584F8 8006A8D8 A1FF0104 */  bgez       $zero, .L8006A760
/* 584FC 8006A8DC CE0023A4 */   sh        $v1, 0xCE($at)
.size RenderBucket_DrawFunc_Normal, . - RenderBucket_DrawFunc_Normal
