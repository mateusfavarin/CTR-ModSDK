.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel Torch_Main
/* 39090 8004B470 801F013C */  lui        $at, (0x1F800068 >> 16)
/* 39094 8004B474 000030AC */  sw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 39098 8004B478 040031AC */  sw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 3909C 8004B47C 080032AC */  sw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 390A0 8004B480 0C0033AC */  sw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 390A4 8004B484 100034AC */  sw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 390A8 8004B488 140035AC */  sw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 390AC 8004B48C 180036AC */  sw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 390B0 8004B490 1C0037AC */  sw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 390B4 8004B494 20003CAC */  sw         $gp, (0x1F800020 & 0xFFFF)($at)
/* 390B8 8004B498 24003DAC */  sw         $sp, (0x1F800024 & 0xFFFF)($at)
/* 390BC 8004B49C 28003EAC */  sw         $fp, (0x1F800028 & 0xFFFF)($at)
/* 390C0 8004B4A0 2C003FAC */  sw         $ra, (0x1F80002C & 0xFFFF)($at)
/* 390C4 8004B4A4 21888000 */  addu       $s1, $a0, $zero
/* 390C8 8004B4A8 2190A000 */  addu       $s2, $a1, $zero
/* 390CC 8004B4AC 2198C000 */  addu       $s3, $a2, $zero
/* 390D0 8004B4B0 FFFFF424 */  addiu      $s4, $a3, -0x1
/* 390D4 8004B4B4 1000A38F */  lw         $v1, 0x10($sp)
/* 390D8 8004B4B8 0C00628E */  lw         $v0, 0xC($s3)
/* 390DC 8004B4BC 06012012 */  beqz       $s1, .L8004B8D8
/* 390E0 8004B4C0 300031AC */   sw        $s1, (0x1F800030 & 0xFFFF)($at)
/* 390E4 8004B4C4 380023AC */  sw         $v1, (0x1F800038 & 0xFFFF)($at)
/* 390E8 8004B4C8 0C001924 */  addiu      $t9, $zero, 0xC
/* 390EC 8004B4CC 5E0020A4 */  sh         $zero, (0x1F80005E & 0xFFFF)($at)
.L8004B4D0:
/* 390F0 8004B4D0 28004B8E */  lw         $t3, 0x28($s2)
/* 390F4 8004B4D4 2C004C8E */  lw         $t4, 0x2C($s2)
/* 390F8 8004B4D8 30004D8E */  lw         $t5, 0x30($s2)
/* 390FC 8004B4DC 34004E8E */  lw         $t6, 0x34($s2)
/* 39100 8004B4E0 38004F8E */  lw         $t7, 0x38($s2)
/* 39104 8004B4E4 3C00448E */  lw         $a0, 0x3C($s2)
/* 39108 8004B4E8 4000458E */  lw         $a1, 0x40($s2)
/* 3910C 8004B4EC 4400468E */  lw         $a2, 0x44($s2)
/* 39110 8004B4F0 0040CB48 */  ctc2       $t3, $8 /* handwritten instruction */
/* 39114 8004B4F4 0048CC48 */  ctc2       $t4, $9 /* handwritten instruction */
/* 39118 8004B4F8 0050CD48 */  ctc2       $t5, $10 /* handwritten instruction */
/* 3911C 8004B4FC 0058CE48 */  ctc2       $t6, $11 /* handwritten instruction */
/* 39120 8004B500 0060CF48 */  ctc2       $t7, $12 /* handwritten instruction */
/* 39124 8004B504 0068C448 */  ctc2       $a0, $13 /* handwritten instruction */
/* 39128 8004B508 0070C548 */  ctc2       $a1, $14 /* handwritten instruction */
/* 3912C 8004B50C 0078C648 */  ctc2       $a2, $15 /* handwritten instruction */
/* 39130 8004B510 00100324 */  addiu      $v1, $zero, 0x1000
/* 39134 8004B514 0000C348 */  ctc2       $v1, $0 /* handwritten instruction */
/* 39138 8004B518 0008C048 */  ctc2       $zero, $1 /* handwritten instruction */
/* 3913C 8004B51C 0018C048 */  ctc2       $zero, $3 /* handwritten instruction */
/* 39140 8004B520 0020C348 */  ctc2       $v1, $4 /* handwritten instruction */
/* 39144 8004B524 0028C048 */  ctc2       $zero, $5 /* handwritten instruction */
/* 39148 8004B528 0030C048 */  ctc2       $zero, $6 /* handwritten instruction */
/* 3914C 8004B52C 0038C048 */  ctc2       $zero, $7 /* handwritten instruction */
/* 39150 8004B530 20004386 */  lh         $v1, 0x20($s2)
/* 39154 8004B534 22004886 */  lh         $t0, 0x22($s2)
/* 39158 8004B538 1800498E */  lw         $t1, 0x18($s2)
/* 3915C 8004B53C C01B0300 */  sll        $v1, $v1, 15
/* 39160 8004B540 C0430800 */  sll        $t0, $t0, 15
/* 39164 8004B544 480023AC */  sw         $v1, (0x1F800048 & 0xFFFF)($at)
/* 39168 8004B548 4C0028AC */  sw         $t0, (0x1F80004C & 0xFFFF)($at)
/* 3916C 8004B54C 00D0C948 */  ctc2       $t1, $26 /* handwritten instruction */
/* 39170 8004B550 1C004386 */  lh         $v1, 0x1C($s2)
/* 39174 8004B554 1E004886 */  lh         $t0, 0x1E($s2)
/* 39178 8004B558 3800298C */  lw         $t1, (0x1F800038 & 0xFFFF)($at)
/* 3917C 8004B55C 500023A4 */  sh         $v1, (0x1F800050 & 0xFFFF)($at)
/* 39180 8004B560 21400901 */  addu       $t0, $t0, $t1
/* 39184 8004B564 520028A4 */  sh         $t0, (0x1F800052 & 0xFFFF)($at)
/* 39188 8004B568 20004386 */  lh         $v1, 0x20($s2)
/* 3918C 8004B56C 22004886 */  lh         $t0, 0x22($s2)
/* 39190 8004B570 FFFF6324 */  addiu      $v1, $v1, -0x1
/* 39194 8004B574 FFFF0825 */  addiu      $t0, $t0, -0x1
/* 39198 8004B578 540023A4 */  sh         $v1, (0x1F800054 & 0xFFFF)($at)
/* 3919C 8004B57C 560028A4 */  sh         $t0, (0x1F800056 & 0xFFFF)($at)
/* 391A0 8004B580 20004F8E */  lw         $t7, 0x20($s2)
/* 391A4 8004B584 F400558E */  lw         $s5, 0xF4($s2)
.L8004B588:
/* 391A8 8004B588 CF002012 */  beqz       $s1, .L8004B8C8
/* 391AC 8004B58C 00000000 */   nop
/* 391B0 8004B590 2400238E */  lw         $v1, 0x24($s1)
/* 391B4 8004B594 2C00288E */  lw         $t0, 0x2C($s1)
/* 391B8 8004B598 3400298E */  lw         $t1, 0x34($s1)
/* 391BC 8004B59C 031A0300 */  sra        $v1, $v1, 8
/* 391C0 8004B5A0 03420800 */  sra        $t0, $t0, 8
/* 391C4 8004B5A4 034A0900 */  sra        $t1, $t1, 8
/* 391C8 8004B5A8 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 391CC 8004B5AC 00440800 */  sll        $t0, $t0, 16
/* 391D0 8004B5B0 25186800 */  or         $v1, $v1, $t0
/* 391D4 8004B5B4 00008348 */  mtc2       $v1, $0 /* handwritten instruction */
/* 391D8 8004B5B8 00088948 */  mtc2       $t1, $1 /* handwritten instruction */
/* 391DC 8004B5BC 3D003692 */  lbu        $s6, 0x3D($s1)
/* 391E0 8004B5C0 45003792 */  lbu        $s7, 0x45($s1)
/* 391E4 8004B5C4 12204A4A */  MVMVA      1, 1, 0, 1, 0
/* 391E8 8004B5C8 5D002392 */  lbu        $v1, 0x5D($s1)
/* 391EC 8004B5CC 65002892 */  lbu        $t0, 0x65($s1)
/* 391F0 8004B5D0 6D002992 */  lbu        $t1, 0x6D($s1)
/* 391F4 8004B5D4 4D003892 */  lbu        $t8, 0x4D($s1)
/* 391F8 8004B5D8 00420800 */  sll        $t0, $t0, 8
/* 391FC 8004B5DC 004C0900 */  sll        $t1, $t1, 16
/* 39200 8004B5E0 25186800 */  or         $v1, $v1, $t0
/* 39204 8004B5E4 25186900 */  or         $v1, $v1, $t1
/* 39208 8004B5E8 440023AC */  sw         $v1, (0x1F800044 & 0xFFFF)($at)
/* 3920C 8004B5EC 00C80448 */  mfc2       $a0, $25 /* handwritten instruction */
/* 39210 8004B5F0 00D00548 */  mfc2       $a1, $26 /* handwritten instruction */
/* 39214 8004B5F4 00D80648 */  mfc2       $a2, $27 /* handwritten instruction */
/* 39218 8004B5F8 FFFF8430 */  andi       $a0, $a0, 0xFFFF
/* 3921C 8004B5FC 00088648 */  mtc2       $a2, $1 /* handwritten instruction */
/* 39220 8004B600 00188648 */  mtc2       $a2, $3 /* handwritten instruction */
/* 39224 8004B604 00288648 */  mtc2       $a2, $5 /* handwritten instruction */
/* 39228 8004B608 00100324 */  addiu      $v1, $zero, 0x1000
/* 3922C 8004B60C 4800288C */  lw         $t0, (0x1F800048 & 0xFFFF)($at)
/* 39230 8004B610 4C00298C */  lw         $t1, (0x1F80004C & 0xFFFF)($at)
/* 39234 8004B614 0010C348 */  ctc2       $v1, $2 /* handwritten instruction */
/* 39238 8004B618 00C0C848 */  ctc2       $t0, $24 /* handwritten instruction */
/* 3923C 8004B61C 00C8C948 */  ctc2       $t1, $25 /* handwritten instruction */
/* 39240 8004B620 001C0500 */  sll        $v1, $a1, 16
/* 39244 8004B624 25186400 */  or         $v1, $v1, $a0
/* 39248 8004B628 00008348 */  mtc2       $v1, $0 /* handwritten instruction */
/* 3924C 8004B62C 500B0824 */  addiu      $t0, $zero, 0xB50
/* 39250 8004B630 1900C802 */  multu      $s6, $t0
/* 39254 8004B634 0100184A */  RTPS
/* 39258 8004B638 12400000 */  mflo       $t0
/* 3925C 8004B63C 03430800 */  sra        $t0, $t0, 12
/* 39260 8004B640 001C0800 */  sll        $v1, $t0, 16
/* 39264 8004B644 25400301 */  or         $t0, $t0, $v1
/* 39268 8004B648 00700448 */  mfc2       $a0, $14 /* handwritten instruction */
/* 3926C 8004B64C 00F84948 */  cfc2       $t1, $31 /* handwritten instruction */
/* 39270 8004B650 032C0400 */  sra        $a1, $a0, 16
/* 39274 8004B654 804B0900 */  sll        $t1, $t1, 14
/* 39278 8004B658 96002005 */  bltz       $t1, .L8004B8B4
/* 3927C 8004B65C FFFF8430 */   andi      $a0, $a0, 0xFFFF
/* 39280 8004B660 68002EE8 */  swc2       $14, (0x1F800068 & 0xFFFF)($at)
/* 39284 8004B664 000A0324 */  addiu      $v1, $zero, 0xA00
/* 39288 8004B668 0010C348 */  ctc2       $v1, $2 /* handwritten instruction */
/* 3928C 8004B66C 00C0C048 */  ctc2       $zero, $24 /* handwritten instruction */
/* 39290 8004B670 00C8C048 */  ctc2       $zero, $25 /* handwritten instruction */
/* 39294 8004B674 00009648 */  mtc2       $s6, $0 /* handwritten instruction */
/* 39298 8004B678 001C1600 */  sll        $v1, $s6, 16
/* 3929C 8004B67C 00108348 */  mtc2       $v1, $2 /* handwritten instruction */
/* 392A0 8004B680 00208848 */  mtc2       $t0, $4 /* handwritten instruction */
/* 392A4 8004B684 500B0824 */  addiu      $t0, $zero, 0xB50
/* 392A8 8004B688 1800E802 */  mult       $s7, $t0
/* 392AC 8004B68C 3000284A */  RTPT
/* 392B0 8004B690 12400000 */  mflo       $t0
/* 392B4 8004B694 03430800 */  sra        $t0, $t0, 12
/* 392B8 8004B698 001C0800 */  sll        $v1, $t0, 16
/* 392BC 8004B69C 25400301 */  or         $t0, $t0, $v1
/* 392C0 8004B6A0 00600C48 */  mfc2       $t4, $12 /* handwritten instruction */
/* 392C4 8004B6A4 00680E48 */  mfc2       $t6, $13 /* handwritten instruction */
/* 392C8 8004B6A8 80FF8325 */  addiu      $v1, $t4, -0x80
/* 392CC 8004B6AC 81006104 */  bgez       $v1, .L8004B8B4
/* 392D0 8004B6B0 00009748 */   mtc2      $s7, $0 /* handwritten instruction */
/* 392D4 8004B6B4 001C1700 */  sll        $v1, $s7, 16
/* 392D8 8004B6B8 00108348 */  mtc2       $v1, $2 /* handwritten instruction */
/* 392DC 8004B6BC 00208848 */  mtc2       $t0, $4 /* handwritten instruction */
/* 392E0 8004B6C0 452E010C */  jal        Torch_Subset1
/* 392E4 8004B6C4 001C0500 */   sll       $v1, $a1, 16
/* 392E8 8004B6C8 031C0D00 */  sra        $v1, $t5, 16
/* 392EC 8004B6CC E8FF6324 */  addiu      $v1, $v1, -0x18
/* 392F0 8004B6D0 78006018 */  blez       $v1, .L8004B8B4
/* 392F4 8004B6D4 23186F01 */   subu      $v1, $t3, $t7
/* 392F8 8004B6D8 23408F01 */  subu       $t0, $t4, $t7
/* 392FC 8004B6DC 2348AF01 */  subu       $t1, $t5, $t7
/* 39300 8004B6E0 2350CF01 */  subu       $t2, $t6, $t7
/* 39304 8004B6E4 24386C01 */  and        $a3, $t3, $t4
/* 39308 8004B6E8 2438ED00 */  and        $a3, $a3, $t5
/* 3930C 8004B6EC 2438EE00 */  and        $a3, $a3, $t6
/* 39310 8004B6F0 25186800 */  or         $v1, $v1, $t0
/* 39314 8004B6F4 25186900 */  or         $v1, $v1, $t1
/* 39318 8004B6F8 27186A00 */  nor        $v1, $v1, $t2
/* 3931C 8004B6FC 25186700 */  or         $v1, $v1, $a3
/* 39320 8004B700 6C006004 */  bltz       $v1, .L8004B8B4
/* 39324 8004B704 001C0300 */   sll       $v1, $v1, 16
/* 39328 8004B708 6A006004 */  bltz       $v1, .L8004B8B4
/* 3932C 8004B70C 00000000 */   nop
/* 39330 8004B710 532E010C */  jal        Torch_Subset2
/* 39334 8004B714 68002724 */   addiu     $a3, $at, 0x68
/* 39338 8004B718 500B0824 */  addiu      $t0, $zero, 0xB50
/* 3933C 8004B71C 18000803 */  mult       $t8, $t0
/* 39340 8004B720 3000284A */  RTPT
/* 39344 8004B724 12400000 */  mflo       $t0
/* 39348 8004B728 03430800 */  sra        $t0, $t0, 12
/* 3934C 8004B72C 001C0800 */  sll        $v1, $t0, 16
/* 39350 8004B730 25400301 */  or         $t0, $t0, $v1
/* 39354 8004B734 00600C48 */  mfc2       $t4, $12 /* handwritten instruction */
/* 39358 8004B738 00680E48 */  mfc2       $t6, $13 /* handwritten instruction */
/* 3935C 8004B73C 00009848 */  mtc2       $t8, $0 /* handwritten instruction */
/* 39360 8004B740 001C1800 */  sll        $v1, $t8, 16
/* 39364 8004B744 00108348 */  mtc2       $v1, $2 /* handwritten instruction */
/* 39368 8004B748 00208848 */  mtc2       $t0, $4 /* handwritten instruction */
/* 3936C 8004B74C 452E010C */  jal        Torch_Subset1
/* 39370 8004B750 001C0500 */   sll       $v1, $a1, 16
/* 39374 8004B754 532E010C */  jal        Torch_Subset2
/* 39378 8004B758 8C002724 */   addiu     $a3, $at, 0x8C
/* 3937C 8004B75C 3000284A */  RTPT
/* 39380 8004B760 18002382 */  lb         $v1, 0x18($s1)
/* 39384 8004B764 83B10600 */  sra        $s6, $a2, 6
/* 39388 8004B768 21B0C302 */  addu       $s6, $s6, $v1
/* 3938C 8004B76C 0200C106 */  bgez       $s6, .L8004B778
/* 39390 8004B770 00FCC326 */   addiu     $v1, $s6, -0x400
/* 39394 8004B774 00001624 */  addiu      $s6, $zero, 0x0
.L8004B778:
/* 39398 8004B778 02006004 */  bltz       $v1, .L8004B784
/* 3939C 8004B77C 80B01600 */   sll       $s6, $s6, 2
/* 393A0 8004B780 FC0F1624 */  addiu      $s6, $zero, 0xFFC
.L8004B784:
/* 393A4 8004B784 21B0D502 */  addu       $s6, $s6, $s5
/* 393A8 8004B788 00600C48 */  mfc2       $t4, $12 /* handwritten instruction */
/* 393AC 8004B78C 00680E48 */  mfc2       $t6, $13 /* handwritten instruction */
/* 393B0 8004B790 452E010C */  jal        Torch_Subset1
/* 393B4 8004B794 001C0500 */   sll       $v1, $a1, 16
/* 393B8 8004B798 532E010C */  jal        Torch_Subset2
/* 393BC 8004B79C B0002724 */   addiu     $a3, $at, 0xB0
/* 393C0 8004B7A0 6C002384 */  lh         $v1, 0x6C($at)
/* 393C4 8004B7A4 732E010C */  jal        Torch_Subset3
/* 393C8 8004B7A8 6E002884 */   lh        $t0, 0x6E($at)
/* 393CC 8004B7AC 08002424 */  addiu      $a0, $at, 0x8
/* 393D0 8004B7B0 612F010C */  jal        Torch_Subset6
/* 393D4 8004B7B4 04002524 */   addiu     $a1, $at, 0x4
/* 393D8 8004B7B8 04002424 */  addiu      $a0, $at, 0x4
/* 393DC 8004B7BC D230010C */  jal        Torch_Subset9
/* 393E0 8004B7C0 08002524 */   addiu     $a1, $at, 0x8
/* 393E4 8004B7C4 68002384 */  lh         $v1, 0x68($at)
/* 393E8 8004B7C8 732E010C */  jal        Torch_Subset3
/* 393EC 8004B7CC 72002884 */   lh        $t0, 0x72($at)
/* 393F0 8004B7D0 08002424 */  addiu      $a0, $at, 0x8
/* 393F4 8004B7D4 612F010C */  jal        Torch_Subset6
/* 393F8 8004B7D8 0C002524 */   addiu     $a1, $at, 0xC
/* 393FC 8004B7DC 0C002424 */  addiu      $a0, $at, 0xC
/* 39400 8004B7E0 D230010C */  jal        Torch_Subset9
/* 39404 8004B7E4 08002524 */   addiu     $a1, $at, 0x8
/* 39408 8004B7E8 68002384 */  lh         $v1, 0x68($at)
/* 3940C 8004B7EC 732E010C */  jal        Torch_Subset3
/* 39410 8004B7F0 6A002884 */   lh        $t0, 0x6A($at)
/* 39414 8004B7F4 0C002424 */  addiu      $a0, $at, 0xC
/* 39418 8004B7F8 612F010C */  jal        Torch_Subset6
/* 3941C 8004B7FC 10002524 */   addiu     $a1, $at, 0x10
/* 39420 8004B800 0C002424 */  addiu      $a0, $at, 0xC
/* 39424 8004B804 D230010C */  jal        Torch_Subset9
/* 39428 8004B808 10002524 */   addiu     $a1, $at, 0x10
/* 3942C 8004B80C 10002424 */  addiu      $a0, $at, 0x10
/* 39430 8004B810 612F010C */  jal        Torch_Subset6
/* 39434 8004B814 14002524 */   addiu     $a1, $at, 0x14
/* 39438 8004B818 14002424 */  addiu      $a0, $at, 0x14
/* 3943C 8004B81C D230010C */  jal        Torch_Subset9
/* 39440 8004B820 10002524 */   addiu     $a1, $at, 0x10
/* 39444 8004B824 80002384 */  lh         $v1, 0x80($at)
/* 39448 8004B828 732E010C */  jal        Torch_Subset3
/* 3944C 8004B82C 6A002884 */   lh        $t0, 0x6A($at)
/* 39450 8004B830 18002424 */  addiu      $a0, $at, 0x18
/* 39454 8004B834 FA2E010C */  jal        Torch_Subset5
/* 39458 8004B838 14002524 */   addiu     $a1, $at, 0x14
/* 3945C 8004B83C 18002424 */  addiu      $a0, $at, 0x18
/* 39460 8004B840 4D30010C */  jal        Torch_Subset8
/* 39464 8004B844 14002524 */   addiu     $a1, $at, 0x14
/* 39468 8004B848 84002384 */  lh         $v1, 0x84($at)
/* 3946C 8004B84C 732E010C */  jal        Torch_Subset3
/* 39470 8004B850 86002884 */   lh        $t0, 0x86($at)
/* 39474 8004B854 1C002424 */  addiu      $a0, $at, 0x1C
/* 39478 8004B858 932E010C */  jal        Torch_Subset4
/* 3947C 8004B85C 18002524 */   addiu     $a1, $at, 0x18
/* 39480 8004B860 1C002424 */  addiu      $a0, $at, 0x1C
/* 39484 8004B864 C82F010C */  jal        Torch_Subset7
/* 39488 8004B868 18002524 */   addiu     $a1, $at, 0x18
/* 3948C 8004B86C 84002384 */  lh         $v1, 0x84($at)
/* 39490 8004B870 732E010C */  jal        Torch_Subset3
/* 39494 8004B874 8A002884 */   lh        $t0, 0x8A($at)
/* 39498 8004B878 20002424 */  addiu      $a0, $at, 0x20
/* 3949C 8004B87C 932E010C */  jal        Torch_Subset4
/* 394A0 8004B880 1C002524 */   addiu     $a1, $at, 0x1C
/* 394A4 8004B884 20002424 */  addiu      $a0, $at, 0x20
/* 394A8 8004B888 C82F010C */  jal        Torch_Subset7
/* 394AC 8004B88C 1C002524 */   addiu     $a1, $at, 0x1C
/* 394B0 8004B890 88002384 */  lh         $v1, 0x88($at)
/* 394B4 8004B894 732E010C */  jal        Torch_Subset3
/* 394B8 8004B898 6E002884 */   lh        $t0, 0x6E($at)
/* 394BC 8004B89C 20002424 */  addiu      $a0, $at, 0x20
/* 394C0 8004B8A0 FA2E010C */  jal        Torch_Subset5
/* 394C4 8004B8A4 04002524 */   addiu     $a1, $at, 0x4
/* 394C8 8004B8A8 20002424 */  addiu      $a0, $at, 0x20
/* 394CC 8004B8AC 4D30010C */  jal        Torch_Subset8
/* 394D0 8004B8B0 04002524 */   addiu     $a1, $at, 0x4
.L8004B8B4:
/* 394D4 8004B8B4 FFFF3927 */  addiu      $t9, $t9, -0x1
/* 394D8 8004B8B8 0700201B */  blez       $t9, .L8004B8D8
/* 394DC 8004B8BC 0000318E */   lw        $s1, 0x0($s1)
/* 394E0 8004B8C0 31FF0104 */  bgez       $zero, .L8004B588
/* 394E4 8004B8C4 00000000 */   nop
.L8004B8C8:
/* 394E8 8004B8C8 3000318C */  lw         $s1, (0x1F800030 & 0xFFFF)($at)
/* 394EC 8004B8CC 10015226 */  addiu      $s2, $s2, 0x110
/* 394F0 8004B8D0 FFFE801E */  bgtz       $s4, .L8004B4D0
/* 394F4 8004B8D4 FFFF9426 */   addiu     $s4, $s4, -0x1
.L8004B8D8:
/* 394F8 8004B8D8 0C0062AE */  sw         $v0, 0xC($s3)
/* 394FC 8004B8DC 2C003F8C */  lw         $ra, (0x1F80002C & 0xFFFF)($at)
/* 39500 8004B8E0 28003E8C */  lw         $fp, (0x1F800028 & 0xFFFF)($at)
/* 39504 8004B8E4 24003D8C */  lw         $sp, (0x1F800024 & 0xFFFF)($at)
/* 39508 8004B8E8 20003C8C */  lw         $gp, (0x1F800020 & 0xFFFF)($at)
/* 3950C 8004B8EC 1C00378C */  lw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 39510 8004B8F0 1800368C */  lw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 39514 8004B8F4 1400358C */  lw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 39518 8004B8F8 1000348C */  lw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 3951C 8004B8FC 0C00338C */  lw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 39520 8004B900 0800328C */  lw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 39524 8004B904 0400318C */  lw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 39528 8004B908 0000308C */  lw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 3952C 8004B90C 0800E003 */  jr         $ra
/* 39530 8004B910 00000000 */   nop
.size Torch_Main, . - Torch_Main
