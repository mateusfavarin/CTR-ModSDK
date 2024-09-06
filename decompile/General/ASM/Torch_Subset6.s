.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel Torch_Subset6
/* 399A4 8004BD84 68002394 */  lhu        $v1, 0x68($at)
/* 399A8 8004BD88 6A002894 */  lhu        $t0, 0x6A($at)
/* 399AC 8004BD8C 54002994 */  lhu        $t1, 0x54($at)
/* 399B0 8004BD90 03006104 */  bgez       $v1, .L8004BDA0
/* 399B4 8004BD94 23486900 */   subu      $t1, $v1, $t1
/* 399B8 8004BD98 04000104 */  bgez       $zero, .L8004BDAC
/* 399BC 8004BD9C 00000324 */   addiu     $v1, $zero, 0x0
.L8004BDA0:
/* 399C0 8004BDA0 02002005 */  bltz       $t1, .L8004BDAC
/* 399C4 8004BDA4 00000000 */   nop
/* 399C8 8004BDA8 54002394 */  lhu        $v1, 0x54($at)
.L8004BDAC:
/* 399CC 8004BDAC 50002984 */  lh         $t1, 0x50($at)
/* 399D0 8004BDB0 23187700 */  subu       $v1, $v1, $s7
/* 399D4 8004BDB4 21186900 */  addu       $v1, $v1, $t1
/* 399D8 8004BDB8 56002994 */  lhu        $t1, 0x56($at)
/* 399DC 8004BDBC 03000105 */  bgez       $t0, .L8004BDCC
/* 399E0 8004BDC0 23480901 */   subu      $t1, $t0, $t1
/* 399E4 8004BDC4 04000104 */  bgez       $zero, .L8004BDD8
/* 399E8 8004BDC8 00000824 */   addiu     $t0, $zero, 0x0
.L8004BDCC:
/* 399EC 8004BDCC 02002005 */  bltz       $t1, .L8004BDD8
/* 399F0 8004BDD0 00000000 */   nop
/* 399F4 8004BDD4 56002894 */  lhu        $t0, 0x56($at)
.L8004BDD8:
/* 399F8 8004BDD8 52002984 */  lh         $t1, 0x52($at)
/* 399FC 8004BDDC 00000000 */  nop
/* 39A00 8004BDE0 21400901 */  addu       $t0, $t0, $t1
/* 39A04 8004BDE4 5C0023A0 */  sb         $v1, 0x5C($at)
/* 39A08 8004BDE8 5D0028A0 */  sb         $t0, 0x5D($at)
/* 39A0C 8004BDEC 8C008394 */  lhu        $v1, 0x8C($a0)
/* 39A10 8004BDF0 8E008894 */  lhu        $t0, 0x8E($a0)
/* 39A14 8004BDF4 54002994 */  lhu        $t1, 0x54($at)
/* 39A18 8004BDF8 03006104 */  bgez       $v1, .L8004BE08
/* 39A1C 8004BDFC 23486900 */   subu      $t1, $v1, $t1
/* 39A20 8004BE00 04000104 */  bgez       $zero, .L8004BE14
/* 39A24 8004BE04 00000324 */   addiu     $v1, $zero, 0x0
.L8004BE08:
/* 39A28 8004BE08 02002005 */  bltz       $t1, .L8004BE14
/* 39A2C 8004BE0C 00000000 */   nop
/* 39A30 8004BE10 54002394 */  lhu        $v1, 0x54($at)
.L8004BE14:
/* 39A34 8004BE14 50002984 */  lh         $t1, 0x50($at)
/* 39A38 8004BE18 23187700 */  subu       $v1, $v1, $s7
/* 39A3C 8004BE1C 21186900 */  addu       $v1, $v1, $t1
/* 39A40 8004BE20 56002994 */  lhu        $t1, 0x56($at)
/* 39A44 8004BE24 03000105 */  bgez       $t0, .L8004BE34
/* 39A48 8004BE28 23480901 */   subu      $t1, $t0, $t1
/* 39A4C 8004BE2C 04000104 */  bgez       $zero, .L8004BE40
/* 39A50 8004BE30 00000824 */   addiu     $t0, $zero, 0x0
.L8004BE34:
/* 39A54 8004BE34 02002005 */  bltz       $t1, .L8004BE40
/* 39A58 8004BE38 00000000 */   nop
/* 39A5C 8004BE3C 56002894 */  lhu        $t0, 0x56($at)
.L8004BE40:
/* 39A60 8004BE40 52002984 */  lh         $t1, 0x52($at)
/* 39A64 8004BE44 00000000 */  nop
/* 39A68 8004BE48 21400901 */  addu       $t0, $t0, $t1
/* 39A6C 8004BE4C 600023A0 */  sb         $v1, 0x60($at)
/* 39A70 8004BE50 610028A0 */  sb         $t0, 0x61($at)
/* 39A74 8004BE54 8C00A394 */  lhu        $v1, 0x8C($a1)
/* 39A78 8004BE58 8E00A894 */  lhu        $t0, 0x8E($a1)
/* 39A7C 8004BE5C 54002994 */  lhu        $t1, 0x54($at)
/* 39A80 8004BE60 03006104 */  bgez       $v1, .L8004BE70
/* 39A84 8004BE64 23486900 */   subu      $t1, $v1, $t1
/* 39A88 8004BE68 04000104 */  bgez       $zero, .L8004BE7C
/* 39A8C 8004BE6C 00000324 */   addiu     $v1, $zero, 0x0
.L8004BE70:
/* 39A90 8004BE70 02002005 */  bltz       $t1, .L8004BE7C
/* 39A94 8004BE74 00000000 */   nop
/* 39A98 8004BE78 54002394 */  lhu        $v1, 0x54($at)
.L8004BE7C:
/* 39A9C 8004BE7C 50002984 */  lh         $t1, 0x50($at)
/* 39AA0 8004BE80 23187700 */  subu       $v1, $v1, $s7
/* 39AA4 8004BE84 21186900 */  addu       $v1, $v1, $t1
/* 39AA8 8004BE88 56002994 */  lhu        $t1, 0x56($at)
/* 39AAC 8004BE8C 03000105 */  bgez       $t0, .L8004BE9C
/* 39AB0 8004BE90 23480901 */   subu      $t1, $t0, $t1
/* 39AB4 8004BE94 04000104 */  bgez       $zero, .L8004BEA8
/* 39AB8 8004BE98 00000824 */   addiu     $t0, $zero, 0x0
.L8004BE9C:
/* 39ABC 8004BE9C 02002005 */  bltz       $t1, .L8004BEA8
/* 39AC0 8004BEA0 00000000 */   nop
/* 39AC4 8004BEA4 56002894 */  lhu        $t0, 0x56($at)
.L8004BEA8:
/* 39AC8 8004BEA8 52002984 */  lh         $t1, 0x52($at)
/* 39ACC 8004BEAC 00000000 */  nop
/* 39AD0 8004BEB0 21400901 */  addu       $t0, $t0, $t1
/* 39AD4 8004BEB4 640023A0 */  sb         $v1, 0x64($at)
/* 39AD8 8004BEB8 650028A0 */  sb         $t0, 0x65($at)
/* 39ADC 8004BEBC 6800238C */  lw         $v1, 0x68($at)
/* 39AE0 8004BEC0 B000888C */  lw         $t0, 0xB0($a0)
/* 39AE4 8004BEC4 B000A98C */  lw         $t1, 0xB0($a1)
/* 39AE8 8004BEC8 080043AC */  sw         $v1, 0x8($v0)
/* 39AEC 8004BECC 100048AC */  sw         $t0, 0x10($v0)
/* 39AF0 8004BED0 180049AC */  sw         $t1, 0x18($v0)
/* 39AF4 8004BED4 4400238C */  lw         $v1, 0x44($at)
/* 39AF8 8004BED8 0024083C */  lui        $t0, (0x24000000 >> 16)
/* 39AFC 8004BEDC 25186800 */  or         $v1, $v1, $t0
/* 39B00 8004BEE0 040043AC */  sw         $v1, 0x4($v0)
/* 39B04 8004BEE4 5C00238C */  lw         $v1, 0x5C($at)
/* 39B08 8004BEE8 6000288C */  lw         $t0, 0x60($at)
/* 39B0C 8004BEEC 6400298C */  lw         $t1, 0x64($at)
/* 39B10 8004BEF0 0C0043AC */  sw         $v1, 0xC($v0)
/* 39B14 8004BEF4 140048AC */  sw         $t0, 0x14($v0)
/* 39B18 8004BEF8 1C0049AC */  sw         $t1, 0x1C($v0)
/* 39B1C 8004BEFC 0000C38E */  lw         $v1, 0x0($s6)
/* 39B20 8004BF00 0007083C */  lui        $t0, (0x7000000 >> 16)
/* 39B24 8004BF04 00520200 */  sll        $t2, $v0, 8
/* 39B28 8004BF08 25186800 */  or         $v1, $v1, $t0
/* 39B2C 8004BF0C 000043AC */  sw         $v1, 0x0($v0)
/* 39B30 8004BF10 021A0A00 */  srl        $v1, $t2, 8
/* 39B34 8004BF14 20004224 */  addiu      $v0, $v0, 0x20
/* 39B38 8004BF18 0800E003 */  jr         $ra
/* 39B3C 8004BF1C 0000C3AE */   sw        $v1, 0x0($s6)
.size Torch_Subset6, . - Torch_Subset6
