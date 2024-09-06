.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel Torch_Subset3
/* 395EC 8004B9CC 00001724 */  addiu      $s7, $zero, 0x0
/* 395F0 8004B9D0 54002994 */  lhu        $t1, 0x54($at)
/* 395F4 8004B9D4 03006104 */  bgez       $v1, .L8004B9E4
/* 395F8 8004B9D8 23486900 */   subu      $t1, $v1, $t1
/* 395FC 8004B9DC 04000104 */  bgez       $zero, .L8004B9F0
/* 39600 8004B9E0 00000324 */   addiu     $v1, $zero, 0x0
.L8004B9E4:
/* 39604 8004B9E4 02002005 */  bltz       $t1, .L8004B9F0
/* 39608 8004B9E8 00000000 */   nop
/* 3960C 8004B9EC 54002394 */  lhu        $v1, 0x54($at)
.L8004B9F0:
/* 39610 8004B9F0 50002984 */  lh         $t1, 0x50($at)
/* 39614 8004B9F4 23187700 */  subu       $v1, $v1, $s7
/* 39618 8004B9F8 21186900 */  addu       $v1, $v1, $t1
/* 3961C 8004B9FC 56002994 */  lhu        $t1, 0x56($at)
/* 39620 8004BA00 03000105 */  bgez       $t0, .L8004BA10
/* 39624 8004BA04 23480901 */   subu      $t1, $t0, $t1
/* 39628 8004BA08 04000104 */  bgez       $zero, .L8004BA1C
/* 3962C 8004BA0C 00000824 */   addiu     $t0, $zero, 0x0
.L8004BA10:
/* 39630 8004BA10 02002005 */  bltz       $t1, .L8004BA1C
/* 39634 8004BA14 00000000 */   nop
/* 39638 8004BA18 56002894 */  lhu        $t0, 0x56($at)
.L8004BA1C:
/* 3963C 8004BA1C 52002984 */  lh         $t1, 0x52($at)
/* 39640 8004BA20 00000000 */  nop
/* 39644 8004BA24 21400901 */  addu       $t0, $t0, $t1
/* 39648 8004BA28 FF036330 */  andi       $v1, $v1, 0x3FF
/* 3964C 8004BA2C 82190300 */  srl        $v1, $v1, 6
/* 39650 8004BA30 80B90300 */  sll        $s7, $v1, 6
/* 39654 8004BA34 00010831 */  andi       $t0, $t0, 0x100
/* 39658 8004BA38 02410800 */  srl        $t0, $t0, 4
/* 3965C 8004BA3C 25186800 */  or         $v1, $v1, $t0
/* 39660 8004BA40 00016334 */  ori        $v1, $v1, 0x100
/* 39664 8004BA44 0800E003 */  jr         $ra
/* 39668 8004BA48 620023A4 */   sh        $v1, 0x62($at)
.size Torch_Subset3, . - Torch_Subset3
