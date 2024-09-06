.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel RenderBucket_QueueLevInstances
/* 5E340 80070720 801F013C */  lui        $at, (0x1F800054 >> 16)
/* 5E344 80070724 000030AC */  sw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 5E348 80070728 040031AC */  sw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 5E34C 8007072C 080032AC */  sw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 5E350 80070730 0C0033AC */  sw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 5E354 80070734 100034AC */  sw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 5E358 80070738 140035AC */  sw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 5E35C 8007073C 180036AC */  sw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 5E360 80070740 1C0037AC */  sw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 5E364 80070744 20003CAC */  sw         $gp, (0x1F800020 & 0xFFFF)($at)
/* 5E368 80070748 24003DAC */  sw         $sp, (0x1F800024 & 0xFFFF)($at)
/* 5E36C 8007074C 28003EAC */  sw         $fp, (0x1F800028 & 0xFFFF)($at)
/* 5E370 80070750 2C003FAC */  sw         $ra, (0x1F80002C & 0xFFFF)($at)
/* 5E374 80070754 500027AC */  sw         $a3, (0x1F800050 & 0xFFFF)($at)
/* 5E378 80070758 1000A38F */  lw         $v1, 0x10($sp)
/* 5E37C 8007075C 1400AA8F */  lw         $t2, 0x14($sp)
/* 5E380 80070760 0C00A88C */  lw         $t0, 0xC($a1)
/* 5E384 80070764 0800A98C */  lw         $t1, 0x8($a1)
/* 5E388 80070768 5C0023AC */  sw         $v1, (0x1F80005C & 0xFFFF)($at)
/* 5E38C 8007076C 90002AAC */  sw         $t2, (0x1F800090 & 0xFFFF)($at)
/* 5E390 80070770 340028AC */  sw         $t0, (0x1F800034 & 0xFFFF)($at)
/* 5E394 80070774 FCFF2925 */  addiu      $t1, $t1, -0x4
/* 5E398 80070778 380029AC */  sw         $t1, (0x1F800038 & 0xFFFF)($at)
/* 5E39C 8007077C FFFF6324 */  addiu      $v1, $v1, -0x1
/* 5E3A0 80070780 DC000924 */  addiu      $t1, $zero, 0xDC
/* 5E3A4 80070784 18002301 */  mult       $t1, $v1
/* 5E3A8 80070788 12480000 */  mflo       $t1
/* 5E3AC 8007078C 21208900 */  addu       $a0, $a0, $t1
/* 5E3B0 80070790 600024AC */  sw         $a0, (0x1F800060 & 0xFFFF)($at)
/* 5E3B4 80070794 88000924 */  addiu      $t1, $zero, 0x88
/* 5E3B8 80070798 18002301 */  mult       $t1, $v1
/* 5E3BC 8007079C 2800848C */  lw         $a0, 0x28($a0)
/* 5E3C0 800707A0 580020AC */  sw         $zero, (0x1F800058 & 0xFFFF)($at)
/* 5E3C4 800707A4 12480000 */  mflo       $t1
/* 5E3C8 800707A8 64C5010C */  jal        func_80071590
/* 5E3CC 800707AC 540029AC */   sw        $t1, (0x1F800054 & 0xFFFF)($at)
.L800707B0:
/* 5E3D0 800707B0 0A008010 */  beqz       $a0, .L800707DC
/* 5E3D4 800707B4 00009D8C */   lw        $sp, 0x0($a0)
.L800707B8:
/* 5E3D8 800707B8 5400238C */  lw         $v1, 0x54($at)
/* 5E3DC 800707BC 04008424 */  addiu      $a0, $a0, 0x4
/* 5E3E0 800707C0 0600A013 */  beqz       $sp, .L800707DC
/* 5E3E4 800707C4 21F0A303 */   addu      $fp, $sp, $v1
/* 5E3E8 800707C8 1800B38F */  lw         $s3, 0x18($sp)
/* 5E3EC 800707CC 54C2010C */  jal        RenderBucket_QueueDraw
/* 5E3F0 800707D0 2800BC8F */   lw        $gp, 0x28($sp)
/* 5E3F4 800707D4 F8FF0104 */  bgez       $zero, .L800707B8
/* 5E3F8 800707D8 00009D8C */   lw        $sp, 0x0($a0)
.L800707DC:
/* 5E3FC 800707DC 6000248C */  lw         $a0, 0x60($at)
/* 5E400 800707E0 5400238C */  lw         $v1, 0x54($at)
/* 5E404 800707E4 5C00288C */  lw         $t0, 0x5C($at)
/* 5E408 800707E8 24FF8424 */  addiu      $a0, $a0, -0xDC
/* 5E40C 800707EC 600024AC */  sw         $a0, 0x60($at)
/* 5E410 800707F0 2800848C */  lw         $a0, 0x28($a0)
/* 5E414 800707F4 78FF6324 */  addiu      $v1, $v1, -0x88
/* 5E418 800707F8 FFFF0825 */  addiu      $t0, $t0, -0x1
/* 5E41C 800707FC 540023AC */  sw         $v1, 0x54($at)
/* 5E420 80070800 EBFF001D */  bgtz       $t0, .L800707B0
/* 5E424 80070804 5C0028AC */   sw        $t0, 0x5C($at)
/* 5E428 80070808 2110C000 */  addu       $v0, $a2, $zero
/* 5E42C 8007080C 3400288C */  lw         $t0, 0x34($at)
/* 5E430 80070810 2C003F8C */  lw         $ra, 0x2C($at)
/* 5E434 80070814 0C00A8AC */  sw         $t0, 0xC($a1)
/* 5E438 80070818 28003E8C */  lw         $fp, 0x28($at)
/* 5E43C 8007081C 24003D8C */  lw         $sp, 0x24($at)
/* 5E440 80070820 20003C8C */  lw         $gp, 0x20($at)
/* 5E444 80070824 1C00378C */  lw         $s7, 0x1C($at)
/* 5E448 80070828 1800368C */  lw         $s6, 0x18($at)
/* 5E44C 8007082C 1400358C */  lw         $s5, 0x14($at)
/* 5E450 80070830 1000348C */  lw         $s4, 0x10($at)
/* 5E454 80070834 0C00338C */  lw         $s3, 0xC($at)
/* 5E458 80070838 0800328C */  lw         $s2, 0x8($at)
/* 5E45C 8007083C 0400318C */  lw         $s1, 0x4($at)
/* 5E460 80070840 0000308C */  lw         $s0, 0x0($at)
/* 5E464 80070844 0800E003 */  jr         $ra
/* 5E468 80070848 00000000 */   nop
.size RenderBucket_QueueLevInstances, . - RenderBucket_QueueLevInstances
