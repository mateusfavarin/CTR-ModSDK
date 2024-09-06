.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel RenderBucket_DrawInstPrim_KeyRelicToken
/* 58AB0 8006AE90 0600404B */  NCLIP
/* 58AB4 8006AE94 80480B00 */  sll        $t1, $t3, 2
/* 58AB8 8006AE98 2C002B8C */  lw         $t3, 0x2C($at)
/* 58ABC 8006AE9C 3800258C */  lw         $a1, 0x38($at)
/* 58AC0 8006AEA0 425C0B00 */  srl        $t3, $t3, 17
/* 58AC4 8006AEA4 80580B00 */  sll        $t3, $t3, 2
/* 58AC8 8006AEA8 21586501 */  addu       $t3, $t3, $a1
/* 58ACC 8006AEAC 24002584 */  lh         $a1, 0x24($at)
/* 58AD0 8006AEB0 5000268C */  lw         $a2, 0x50($at)
/* 58AD4 8006AEB4 00C00A48 */  mfc2       $t2, $24 /* handwritten instruction */
/* 58AD8 8006AEB8 2648A900 */  xor        $t1, $a1, $t1
/* 58ADC 8006AEBC 26504901 */  xor        $t2, $t2, $t1
/* 58AE0 8006AEC0 02004105 */  bgez       $t2, .L8006AECC
/* 58AE4 8006AEC4 08004CE8 */   swc2      $12, 0x8($v0)
/* 58AE8 8006AEC8 04006B25 */  addiu      $t3, $t3, 0x4
.L8006AECC:
/* 58AEC 8006AECC 10004DE8 */  swc2       $13, 0x10($v0)
/* 58AF0 8006AED0 18004EE8 */  swc2       $14, 0x18($v0)
/* 58AF4 8006AED4 001E0E00 */  sll        $v1, $t6, 24
/* 58AF8 8006AED8 C31C0300 */  sra        $v1, $v1, 19
/* 58AFC 8006AEDC 00488348 */  mtc2       $v1, $9 /* handwritten instruction */
/* 58B00 8006AEE0 021A0E00 */  srl        $v1, $t6, 8
/* 58B04 8006AEE4 001E0300 */  sll        $v1, $v1, 24
/* 58B08 8006AEE8 C31C0300 */  sra        $v1, $v1, 19
/* 58B0C 8006AEEC 00508348 */  mtc2       $v1, $10 /* handwritten instruction */
/* 58B10 8006AEF0 021C0E00 */  srl        $v1, $t6, 16
/* 58B14 8006AEF4 001E0300 */  sll        $v1, $v1, 24
/* 58B18 8006AEF8 C31C0300 */  sra        $v1, $v1, 19
/* 58B1C 8006AEFC 00588348 */  mtc2       $v1, $11 /* handwritten instruction */
/* 58B20 8006AF00 00000000 */  nop
/* 58B24 8006AF04 00000000 */  nop
/* 58B28 8006AF08 12E04D4A */  MVMVA      1, 2, 3, 3, 0
/* 58B2C 8006AF0C 00480348 */  mfc2       $v1, $9 /* handwritten instruction */
/* 58B30 8006AF10 00580848 */  mfc2       $t0, $11 /* handwritten instruction */
/* 58B34 8006AF14 00106324 */  addiu      $v1, $v1, 0x1000
/* 58B38 8006AF18 40480300 */  sll        $t1, $v1, 1
/* 58B3C 8006AF1C 21186900 */  addu       $v1, $v1, $t1
/* 58B40 8006AF20 40480900 */  sll        $t1, $t1, 1
/* 58B44 8006AF24 21186900 */  addu       $v1, $v1, $t1
/* 58B48 8006AF28 00206324 */  addiu      $v1, $v1, 0x2000
/* 58B4C 8006AF2C 02004105 */  bgez       $t2, .L8006AF38
/* 58B50 8006AF30 02190300 */   srl       $v1, $v1, 4
/* 58B54 8006AF34 42180300 */  srl        $v1, $v1, 1
.L8006AF38:
/* 58B58 8006AF38 C3400800 */  sra        $t0, $t0, 3
/* 58B5C 8006AF3C 00408348 */  mtc2       $v1, $8 /* handwritten instruction */
/* 58B60 8006AF40 0980093C */  lui        $t1, %hi(D_8008A2C4)
/* 58B64 8006AF44 C4A22925 */  addiu      $t1, $t1, %lo(D_8008A2C4)
/* 58B68 8006AF48 1000784A */  DPCS
/* 58B6C 8006AF4C 02000105 */  bgez       $t0, .L8006AF58
/* 58B70 8006AF50 00000000 */   nop
/* 58B74 8006AF54 23400800 */  negu       $t0, $t0
.L8006AF58:
/* 58B78 8006AF58 80FE0825 */  addiu      $t0, $t0, -0x180
/* 58B7C 8006AF5C 06000005 */  bltz       $t0, .L8006AF78
/* 58B80 8006AF60 00000324 */   addiu     $v1, $zero, 0x0
/* 58B84 8006AF64 80FF0325 */  addiu      $v1, $t0, -0x80
/* 58B88 8006AF68 02006004 */  bltz       $v1, .L8006AF74
/* 58B8C 8006AF6C 21402801 */   addu      $t0, $t1, $t0
/* 58B90 8006AF70 7F002825 */  addiu      $t0, $t1, 0x7F
.L8006AF74:
/* 58B94 8006AF74 00000391 */  lbu        $v1, 0x0($t0)
.L8006AF78:
/* 58B98 8006AF78 00B00848 */  mfc2       $t0, $22 /* handwritten instruction */
/* 58B9C 8006AF7C 02004105 */  bgez       $t2, .L8006AF88
/* 58BA0 8006AF80 024A0800 */   srl       $t1, $t0, 8
/* 58BA4 8006AF84 C2180300 */  srl        $v1, $v1, 3
.L8006AF88:
/* 58BA8 8006AF88 022C0800 */  srl        $a1, $t0, 16
/* 58BAC 8006AF8C FF000831 */  andi       $t0, $t0, 0xFF
/* 58BB0 8006AF90 FF002931 */  andi       $t1, $t1, 0xFF
/* 58BB4 8006AF94 FF00A530 */  andi       $a1, $a1, 0xFF
/* 58BB8 8006AF98 21400301 */  addu       $t0, $t0, $v1
/* 58BBC 8006AF9C 21482301 */  addu       $t1, $t1, $v1
/* 58BC0 8006AFA0 2128A300 */  addu       $a1, $a1, $v1
/* 58BC4 8006AFA4 01FFA324 */  addiu      $v1, $a1, -0xFF
/* 58BC8 8006AFA8 02006018 */  blez       $v1, .L8006AFB4
/* 58BCC 8006AFAC 002C0500 */   sll       $a1, $a1, 16
/* 58BD0 8006AFB0 FF00053C */  lui        $a1, (0xFF0000 >> 16)
.L8006AFB4:
/* 58BD4 8006AFB4 01FF2325 */  addiu      $v1, $t1, -0xFF
/* 58BD8 8006AFB8 02006018 */  blez       $v1, .L8006AFC4
/* 58BDC 8006AFBC 004A0900 */   sll       $t1, $t1, 8
/* 58BE0 8006AFC0 00FF0934 */  ori        $t1, $zero, 0xFF00
.L8006AFC4:
/* 58BE4 8006AFC4 01FF0325 */  addiu      $v1, $t0, -0xFF
/* 58BE8 8006AFC8 02006018 */  blez       $v1, .L8006AFD4
/* 58BEC 8006AFCC 25482501 */   or        $t1, $t1, $a1
/* 58BF0 8006AFD0 FF000824 */  addiu      $t0, $zero, 0xFF
.L8006AFD4:
/* 58BF4 8006AFD4 25482801 */  or         $t1, $t1, $t0
/* 58BF8 8006AFD8 0400C58C */  lw         $a1, 0x4($a2)
/* 58BFC 8006AFDC 6000083C */  lui        $t0, (0x600000 >> 16)
/* 58C00 8006AFE0 24180501 */  and        $v1, $t0, $a1
/* 58C04 8006AFE4 05006014 */  bnez       $v1, .L8006AFFC
/* 58C08 8006AFE8 0024033C */   lui       $v1, (0x24000000 >> 16)
/* 58C0C 8006AFEC 03004005 */  bltz       $t2, .L8006AFFC
/* 58C10 8006AFF0 00000000 */   nop
/* 58C14 8006AFF4 2000083C */  lui        $t0, (0x200000 >> 16)
/* 58C18 8006AFF8 0026033C */  lui        $v1, (0x26000000 >> 16)
.L8006AFFC:
/* 58C1C 8006AFFC 25186900 */  or         $v1, $v1, $t1
/* 58C20 8006B000 25400501 */  or         $t0, $t0, $a1
/* 58C24 8006B004 040043AC */  sw         $v1, 0x4($v0)
/* 58C28 8006B008 0000C38C */  lw         $v1, 0x0($a2)
/* 58C2C 8006B00C 0800C98C */  lw         $t1, 0x8($a2)
/* 58C30 8006B010 0C0043AC */  sw         $v1, 0xC($v0)
/* 58C34 8006B014 140048AC */  sw         $t0, 0x14($v0)
/* 58C38 8006B018 1C0049AC */  sw         $t1, 0x1C($v0)
/* 58C3C 8006B01C 0007083C */  lui        $t0, (0x7000000 >> 16)
/* 58C40 8006B020 8BFF0104 */  bgez       $zero, .L8006AE50
/* 58C44 8006B024 20000924 */   addiu     $t1, $zero, 0x20
/* 58C48 8006B028 0800E003 */  jr         $ra
/* 58C4C 8006B02C 00000000 */   nop
.size RenderBucket_DrawInstPrim_KeyRelicToken, . - RenderBucket_DrawInstPrim_KeyRelicToken
