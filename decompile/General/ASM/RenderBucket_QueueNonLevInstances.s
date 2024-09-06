.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel RenderBucket_QueueNonLevInstances
/* 5E46C 8007084C 801F013C */  lui        $at, (0x1F800054 >> 16)
/* 5E470 80070850 000030AC */  sw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 5E474 80070854 040031AC */  sw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 5E478 80070858 080032AC */  sw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 5E47C 8007085C 0C0033AC */  sw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 5E480 80070860 100034AC */  sw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 5E484 80070864 140035AC */  sw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 5E488 80070868 180036AC */  sw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 5E48C 8007086C 1C0037AC */  sw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 5E490 80070870 20003CAC */  sw         $gp, (0x1F800020 & 0xFFFF)($at)
/* 5E494 80070874 24003DAC */  sw         $sp, (0x1F800024 & 0xFFFF)($at)
/* 5E498 80070878 28003EAC */  sw         $fp, (0x1F800028 & 0xFFFF)($at)
/* 5E49C 8007087C 2C003FAC */  sw         $ra, (0x1F80002C & 0xFFFF)($at)
/* 5E4A0 80070880 500027AC */  sw         $a3, (0x1F800050 & 0xFFFF)($at)
/* 5E4A4 80070884 1000A38F */  lw         $v1, 0x10($sp)
/* 5E4A8 80070888 1400AA8F */  lw         $t2, 0x14($sp)
/* 5E4AC 8007088C 0C00A88C */  lw         $t0, 0xC($a1)
/* 5E4B0 80070890 0800A98C */  lw         $t1, 0x8($a1)
/* 5E4B4 80070894 5C0023AC */  sw         $v1, (0x1F80005C & 0xFFFF)($at)
/* 5E4B8 80070898 90002AAC */  sw         $t2, (0x1F800090 & 0xFFFF)($at)
/* 5E4BC 8007089C 340028AC */  sw         $t0, (0x1F800034 & 0xFFFF)($at)
/* 5E4C0 800708A0 FCFF2925 */  addiu      $t1, $t1, -0x4
/* 5E4C4 800708A4 380029AC */  sw         $t1, (0x1F800038 & 0xFFFF)($at)
/* 5E4C8 800708A8 88000924 */  addiu      $t1, $zero, 0x88
/* 5E4CC 800708AC FFFF6324 */  addiu      $v1, $v1, -0x1
/* 5E4D0 800708B0 18006900 */  mult       $v1, $t1
/* 5E4D4 800708B4 340028AC */  sw         $t0, (0x1F800034 & 0xFFFF)($at)
/* 5E4D8 800708B8 580020AC */  sw         $zero, (0x1F800058 & 0xFFFF)($at)
/* 5E4DC 800708BC 12480000 */  mflo       $t1
/* 5E4E0 800708C0 64C5010C */  jal        func_80071590
/* 5E4E4 800708C4 540029AC */   sw        $t1, (0x1F800054 & 0xFFFF)($at)
.L800708C8:
/* 5E4E8 800708C8 21E88000 */  addu       $sp, $a0, $zero
.L800708CC:
/* 5E4EC 800708CC 5400238C */  lw         $v1, 0x54($at)
/* 5E4F0 800708D0 0700A013 */  beqz       $sp, .L800708F0
/* 5E4F4 800708D4 21F0A303 */   addu      $fp, $sp, $v1
/* 5E4F8 800708D8 1800B38F */  lw         $s3, 0x18($sp)
/* 5E4FC 800708DC 54C2010C */  jal        RenderBucket_QueueDraw
/* 5E500 800708E0 2800BC8F */   lw        $gp, 0x28($sp)
/* 5E504 800708E4 0000BD8F */  lw         $sp, 0x0($sp)
/* 5E508 800708E8 F8FF0104 */  bgez       $zero, .L800708CC
/* 5E50C 800708EC 00000000 */   nop
.L800708F0:
/* 5E510 800708F0 5400238C */  lw         $v1, 0x54($at)
/* 5E514 800708F4 5C00288C */  lw         $t0, 0x5C($at)
/* 5E518 800708F8 78FF6324 */  addiu      $v1, $v1, -0x88
/* 5E51C 800708FC FFFF0825 */  addiu      $t0, $t0, -0x1
/* 5E520 80070900 540023AC */  sw         $v1, 0x54($at)
/* 5E524 80070904 F0FF001D */  bgtz       $t0, .L800708C8
/* 5E528 80070908 5C0028AC */   sw        $t0, 0x5C($at)
/* 5E52C 8007090C 2110C000 */  addu       $v0, $a2, $zero
/* 5E530 80070910 3400288C */  lw         $t0, 0x34($at)
/* 5E534 80070914 2C003F8C */  lw         $ra, 0x2C($at)
/* 5E538 80070918 0C00A8AC */  sw         $t0, 0xC($a1)
/* 5E53C 8007091C 28003E8C */  lw         $fp, 0x28($at)
/* 5E540 80070920 24003D8C */  lw         $sp, 0x24($at)
/* 5E544 80070924 20003C8C */  lw         $gp, 0x20($at)
/* 5E548 80070928 1C00378C */  lw         $s7, 0x1C($at)
/* 5E54C 8007092C 1800368C */  lw         $s6, 0x18($at)
/* 5E550 80070930 1400358C */  lw         $s5, 0x14($at)
/* 5E554 80070934 1000348C */  lw         $s4, 0x10($at)
/* 5E558 80070938 0C00338C */  lw         $s3, 0xC($at)
/* 5E55C 8007093C 0800328C */  lw         $s2, 0x8($at)
/* 5E560 80070940 0400318C */  lw         $s1, 0x4($at)
/* 5E564 80070944 0000308C */  lw         $s0, 0x0($at)
/* 5E568 80070948 0800E003 */  jr         $ra
/* 5E56C 8007094C 00000000 */   nop
.size RenderBucket_QueueNonLevInstances, . - RenderBucket_QueueNonLevInstances
