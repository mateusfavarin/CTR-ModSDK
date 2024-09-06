.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel RenderStars
/* 5BE8C 8006E26C 801F013C */  lui        $at, (0x1F800000 >> 16)
/* 5BE90 8006E270 000030AC */  sw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 5BE94 8006E274 040031AC */  sw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 5BE98 8006E278 080032AC */  sw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 5BE9C 8006E27C 0C0033AC */  sw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 5BEA0 8006E280 100034AC */  sw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 5BEA4 8006E284 140035AC */  sw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 5BEA8 8006E288 180036AC */  sw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 5BEAC 8006E28C 1C0037AC */  sw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 5BEB0 8006E290 20003CAC */  sw         $gp, (0x1F800020 & 0xFFFF)($at)
/* 5BEB4 8006E294 24003DAC */  sw         $sp, (0x1F800024 & 0xFFFF)($at)
/* 5BEB8 8006E298 28003EAC */  sw         $fp, (0x1F800028 & 0xFFFF)($at)
/* 5BEBC 8006E29C 2C003FAC */  sw         $ra, (0x1F80002C & 0xFFFF)($at)
/* 5BEC0 8006E2A0 0028C048 */  ctc2       $zero, $5 /* handwritten instruction */
/* 5BEC4 8006E2A4 0030C048 */  ctc2       $zero, $6 /* handwritten instruction */
/* 5BEC8 8006E2A8 0038C048 */  ctc2       $zero, $7 /* handwritten instruction */
/* 5BECC 8006E2AC FFFFE724 */  addiu      $a3, $a3, -0x1
/* 5BED0 8006E2B0 0C00A28C */  lw         $v0, 0xC($a1)
.L8006E2B4:
/* 5BED4 8006E2B4 28008F8C */  lw         $t7, 0x28($a0)
/* 5BED8 8006E2B8 2C00908C */  lw         $s0, 0x2C($a0)
/* 5BEDC 8006E2BC 3000918C */  lw         $s1, 0x30($a0)
/* 5BEE0 8006E2C0 3400928C */  lw         $s2, 0x34($a0)
/* 5BEE4 8006E2C4 3800938C */  lw         $s3, 0x38($a0)
/* 5BEE8 8006E2C8 0000CF48 */  ctc2       $t7, $0 /* handwritten instruction */
/* 5BEEC 8006E2CC 0008D048 */  ctc2       $s0, $1 /* handwritten instruction */
/* 5BEF0 8006E2D0 0010D148 */  ctc2       $s1, $2 /* handwritten instruction */
/* 5BEF4 8006E2D4 0018D248 */  ctc2       $s2, $3 /* handwritten instruction */
/* 5BEF8 8006E2D8 0020D348 */  ctc2       $s3, $4 /* handwritten instruction */
/* 5BEFC 8006E2DC 20008384 */  lh         $v1, 0x20($a0)
/* 5BF00 8006E2E0 22008884 */  lh         $t0, 0x22($a0)
/* 5BF04 8006E2E4 1800898C */  lw         $t1, 0x18($a0)
/* 5BF08 8006E2E8 2000958C */  lw         $s5, 0x20($a0)
/* 5BF0C 8006E2EC F400948C */  lw         $s4, 0xF4($a0)
/* 5BF10 8006E2F0 C01B0300 */  sll        $v1, $v1, 15
/* 5BF14 8006E2F4 C0430800 */  sll        $t0, $t0, 15
/* 5BF18 8006E2F8 00C0C348 */  ctc2       $v1, $24 /* handwritten instruction */
/* 5BF1C 8006E2FC 00C8C848 */  ctc2       $t0, $25 /* handwritten instruction */
/* 5BF20 8006E300 00D0C948 */  ctc2       $t1, $26 /* handwritten instruction */
/* 5BF24 8006E304 0028C048 */  ctc2       $zero, $5 /* handwritten instruction */
/* 5BF28 8006E308 0030C048 */  ctc2       $zero, $6 /* handwritten instruction */
/* 5BF2C 8006E30C 0038C048 */  ctc2       $zero, $7 /* handwritten instruction */
/* 5BF30 8006E310 0000D694 */  lhu        $s6, 0x0($a2)
/* 5BF34 8006E314 0200D994 */  lhu        $t9, 0x2($a2)
/* 5BF38 8006E318 0400DC94 */  lhu        $gp, 0x4($a2)
/* 5BF3C 8006E31C 0600C394 */  lhu        $v1, 0x6($a2)
/* 5BF40 8006E320 14009C23 */  addi       $gp, $gp, (0x14 & 0xFFFF) /* handwritten instruction */
/* 5BF44 8006E324 80180300 */  sll        $v1, $v1, 2
/* 5BF48 8006E328 21A08302 */  addu       $s4, $s4, $v1
/* 5BF4C 8006E32C 1230173C */  lui        $s7, (0x30125400 >> 16)
/* 5BF50 8006E330 0054F736 */  ori        $s7, $s7, (0x30125400 & 0xFFFF)
/* 5BF54 8006E334 3549183C */  lui        $t8, (0x493583FE >> 16)
/* 5BF58 8006E338 73000104 */  bgez       $zero, .L8006E508
/* 5BF5C 8006E33C FE831837 */   ori       $t8, $t8, (0x493583FE & 0xFFFF)
.L8006E340:
/* 5BF60 8006E340 00761800 */  sll        $t6, $t8, 24
/* 5BF64 8006E344 02C21800 */  srl        $t8, $t8, 8
/* 5BF68 8006E348 2118F802 */  addu       $v1, $s7, $t8
/* 5BF6C 8006E34C 02BA1700 */  srl        $s7, $s7, 8
/* 5BF70 8006E350 25B8E302 */  or         $s7, $s7, $v1
/* 5BF74 8006E354 02721700 */  srl        $t6, $s7, 8
/* 5BF78 8006E358 21186E00 */  addu       $v1, $v1, $t6
/* 5BF7C 8006E35C 001E0300 */  sll        $v1, $v1, 24
/* 5BF80 8006E360 25C00303 */  or         $t8, $t8, $v1
/* 5BF84 8006E364 00761800 */  sll        $t6, $t8, 24
/* 5BF88 8006E368 02C21800 */  srl        $t8, $t8, 8
/* 5BF8C 8006E36C 2140F802 */  addu       $t0, $s7, $t8
/* 5BF90 8006E370 02BA1700 */  srl        $s7, $s7, 8
/* 5BF94 8006E374 25B8E302 */  or         $s7, $s7, $v1
/* 5BF98 8006E378 02721700 */  srl        $t6, $s7, 8
/* 5BF9C 8006E37C 21400E01 */  addu       $t0, $t0, $t6
/* 5BFA0 8006E380 00460800 */  sll        $t0, $t0, 24
/* 5BFA4 8006E384 25C00803 */  or         $t8, $t8, $t0
/* 5BFA8 8006E388 00761800 */  sll        $t6, $t8, 24
/* 5BFAC 8006E38C 02C21800 */  srl        $t8, $t8, 8
/* 5BFB0 8006E390 2148F802 */  addu       $t1, $s7, $t8
/* 5BFB4 8006E394 02BA1700 */  srl        $s7, $s7, 8
/* 5BFB8 8006E398 25B8E302 */  or         $s7, $s7, $v1
/* 5BFBC 8006E39C 02721700 */  srl        $t6, $s7, 8
/* 5BFC0 8006E3A0 21482E01 */  addu       $t1, $t1, $t6
/* 5BFC4 8006E3A4 004E0900 */  sll        $t1, $t1, 24
/* 5BFC8 8006E3A8 25C00903 */  or         $t8, $t8, $t1
/* 5BFCC 8006E3AC 031D0300 */  sra        $v1, $v1, 20
/* 5BFD0 8006E3B0 07408803 */  srav       $t0, $t0, $gp
/* 5BFD4 8006E3B4 034D0900 */  sra        $t1, $t1, 20
/* 5BFD8 8006E3B8 02006104 */  bgez       $v1, .L8006E3C4
/* 5BFDC 8006E3BC 21506000 */   addu      $t2, $v1, $zero
/* 5BFE0 8006E3C0 22500300 */  neg        $t2, $v1 /* handwritten instruction */
.L8006E3C4:
/* 5BFE4 8006E3C4 04000105 */  bgez       $t0, .L8006E3D8
/* 5BFE8 8006E3C8 21580001 */   addu      $t3, $t0, $zero
/* 5BFEC 8006E3CC 02002017 */  bnez       $t9, .L8006E3D8
/* 5BFF0 8006E3D0 22580800 */   neg       $t3, $t0 /* handwritten instruction */
/* 5BFF4 8006E3D4 21406001 */  addu       $t0, $t3, $zero
.L8006E3D8:
/* 5BFF8 8006E3D8 02002105 */  bgez       $t1, .L8006E3E4
/* 5BFFC 8006E3DC 21602001 */   addu      $t4, $t1, $zero
/* 5C000 8006E3E0 22600900 */  neg        $t4, $t1 /* handwritten instruction */
.L8006E3E4:
/* 5C004 8006E3E4 23684B01 */  subu       $t5, $t2, $t3
/* 5C008 8006E3E8 0300A01D */  bgtz       $t5, .L8006E3F8
/* 5C00C 8006E3EC 21684001 */   addu      $t5, $t2, $zero
/* 5C010 8006E3F0 21506001 */  addu       $t2, $t3, $zero
/* 5C014 8006E3F4 2158A001 */  addu       $t3, $t5, $zero
.L8006E3F8:
/* 5C018 8006E3F8 23684C01 */  subu       $t5, $t2, $t4
/* 5C01C 8006E3FC 0300A01D */  bgtz       $t5, .L8006E40C
/* 5C020 8006E400 21684001 */   addu      $t5, $t2, $zero
/* 5C024 8006E404 21508001 */  addu       $t2, $t4, $zero
/* 5C028 8006E408 2160A001 */  addu       $t4, $t5, $zero
.L8006E40C:
/* 5C02C 8006E40C 83580B00 */  sra        $t3, $t3, 2
/* 5C030 8006E410 83600C00 */  sra        $t4, $t4, 2
/* 5C034 8006E414 21504B01 */  addu       $t2, $t2, $t3
/* 5C038 8006E418 21504C01 */  addu       $t2, $t2, $t4
/* 5C03C 8006E41C 00010B3C */  lui        $t3, (0x1000000 >> 16)
/* 5C040 8006E420 1A006A01 */  div        $zero, $t3, $t2
/* 5C044 8006E424 12500000 */  mflo       $t2
/* 5C048 8006E428 00000000 */  nop
/* 5C04C 8006E42C 00000000 */  nop
/* 5C050 8006E430 18006A00 */  mult       $v1, $t2
/* 5C054 8006E434 12180000 */  mflo       $v1
/* 5C058 8006E438 031B0300 */  sra        $v1, $v1, 12
/* 5C05C 8006E43C FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 5C060 8006E440 18000A01 */  mult       $t0, $t2
/* 5C064 8006E444 12400000 */  mflo       $t0
/* 5C068 8006E448 03430800 */  sra        $t0, $t0, 12
/* 5C06C 8006E44C 00440800 */  sll        $t0, $t0, 16
/* 5C070 8006E450 18002A01 */  mult       $t1, $t2
/* 5C074 8006E454 25186800 */  or         $v1, $v1, $t0
/* 5C078 8006E458 12480000 */  mflo       $t1
/* 5C07C 8006E45C 034B0900 */  sra        $t1, $t1, 12
/* 5C080 8006E460 00008348 */  mtc2       $v1, $0 /* handwritten instruction */
/* 5C084 8006E464 00088948 */  mtc2       $t1, $1 /* handwritten instruction */
/* 5C088 8006E468 00761800 */  sll        $t6, $t8, 24
/* 5C08C 8006E46C 02C21800 */  srl        $t8, $t8, 8
/* 5C090 8006E470 21E8F802 */  addu       $sp, $s7, $t8
/* 5C094 8006E474 02BA1700 */  srl        $s7, $s7, 8
/* 5C098 8006E478 25B8E302 */  or         $s7, $s7, $v1
/* 5C09C 8006E47C 02721700 */  srl        $t6, $s7, 8
/* 5C0A0 8006E480 21E8AE03 */  addu       $sp, $sp, $t6
/* 5C0A4 8006E484 00EE1D00 */  sll        $sp, $sp, 24
/* 5C0A8 8006E488 25C01D03 */  or         $t8, $t8, $sp
/* 5C0AC 8006E48C 0100184A */  RTPS
/* 5C0B0 8006E490 02EE1D00 */  srl        $sp, $sp, 24
/* 5C0B4 8006E494 4000BD37 */  ori        $sp, $sp, 0x40
/* 5C0B8 8006E498 FF00BD33 */  andi       $sp, $sp, 0xFF
/* 5C0BC 8006E49C 001A1D00 */  sll        $v1, $sp, 8
/* 5C0C0 8006E4A0 25E8A303 */  or         $sp, $sp, $v1
/* 5C0C4 8006E4A4 001A0300 */  sll        $v1, $v1, 8
/* 5C0C8 8006E4A8 25E8A303 */  or         $sp, $sp, $v1
/* 5C0CC 8006E4AC 0068033C */  lui        $v1, (0x68000000 >> 16)
/* 5C0D0 8006E4B0 25E8A303 */  or         $sp, $sp, $v1
/* 5C0D4 8006E4B4 D9000C3C */  lui        $t4, (0xD90200 >> 16)
/* 5C0D8 8006E4B8 00028C35 */  ori        $t4, $t4, (0xD90200 & 0xFFFF)
/* 5C0DC 8006E4BC 00F84348 */  cfc2       $v1, $31 /* handwritten instruction */
/* 5C0E0 8006E4C0 00700A48 */  mfc2       $t2, $14 /* handwritten instruction */
/* 5C0E4 8006E4C4 401B0300 */  sll        $v1, $v1, 13
/* 5C0E8 8006E4C8 0F006004 */  bltz       $v1, .L8006E508
/* 5C0EC 8006E4CC 23184C01 */   subu      $v1, $t2, $t4
/* 5C0F0 8006E4D0 27186A00 */  nor        $v1, $v1, $t2
/* 5C0F4 8006E4D4 0C006004 */  bltz       $v1, .L8006E508
/* 5C0F8 8006E4D8 001C0300 */   sll       $v1, $v1, 16
/* 5C0FC 8006E4DC 0A006004 */  bltz       $v1, .L8006E508
/* 5C100 8006E4E0 0002083C */   lui       $t0, (0x2000000 >> 16)
/* 5C104 8006E4E4 0000838E */  lw         $v1, 0x0($s4)
/* 5C108 8006E4E8 04005DAC */  sw         $sp, 0x4($v0)
/* 5C10C 8006E4EC 25186800 */  or         $v1, $v1, $t0
/* 5C110 8006E4F0 000043AC */  sw         $v1, 0x0($v0)
/* 5C114 8006E4F4 005A0200 */  sll        $t3, $v0, 8
/* 5C118 8006E4F8 025A0B00 */  srl        $t3, $t3, 8
/* 5C11C 8006E4FC 08004AAC */  sw         $t2, 0x8($v0)
/* 5C120 8006E500 00008BAE */  sw         $t3, 0x0($s4)
/* 5C124 8006E504 0C004224 */  addiu      $v0, $v0, 0xC
.L8006E508:
/* 5C128 8006E508 8DFFC106 */  bgez       $s6, .L8006E340
/* 5C12C 8006E50C FFFFD626 */   addiu     $s6, $s6, -0x1
/* 5C130 8006E510 0002083C */  lui        $t0, (0x2000000 >> 16)
/* 5C134 8006E514 00E1033C */  lui        $v1, (0xE1000A20 >> 16)
/* 5C138 8006E518 200A6334 */  ori        $v1, $v1, (0xE1000A20 & 0xFFFF)
/* 5C13C 8006E51C 040043AC */  sw         $v1, 0x4($v0)
/* 5C140 8006E520 080040AC */  sw         $zero, 0x8($v0)
/* 5C144 8006E524 0000838E */  lw         $v1, 0x0($s4)
/* 5C148 8006E528 00520200 */  sll        $t2, $v0, 8
/* 5C14C 8006E52C 25186800 */  or         $v1, $v1, $t0
/* 5C150 8006E530 000043AC */  sw         $v1, 0x0($v0)
/* 5C154 8006E534 02520A00 */  srl        $t2, $t2, 8
/* 5C158 8006E538 00008AAE */  sw         $t2, 0x0($s4)
/* 5C15C 8006E53C 0C004224 */  addiu      $v0, $v0, 0xC
/* 5C160 8006E540 10018424 */  addiu      $a0, $a0, 0x110
/* 5C164 8006E544 5BFFE014 */  bnez       $a3, .L8006E2B4
/* 5C168 8006E548 FFFFE724 */   addiu     $a3, $a3, -0x1
/* 5C16C 8006E54C 0C00A2AC */  sw         $v0, 0xC($a1)
/* 5C170 8006E550 2C003F8C */  lw         $ra, (0x1F80002C & 0xFFFF)($at)
/* 5C174 8006E554 28003E8C */  lw         $fp, (0x1F800028 & 0xFFFF)($at)
/* 5C178 8006E558 24003D8C */  lw         $sp, (0x1F800024 & 0xFFFF)($at)
/* 5C17C 8006E55C 20003C8C */  lw         $gp, (0x1F800020 & 0xFFFF)($at)
/* 5C180 8006E560 1C00378C */  lw         $s7, (0x1F80001C & 0xFFFF)($at)
/* 5C184 8006E564 1800368C */  lw         $s6, (0x1F800018 & 0xFFFF)($at)
/* 5C188 8006E568 1400358C */  lw         $s5, (0x1F800014 & 0xFFFF)($at)
/* 5C18C 8006E56C 1000348C */  lw         $s4, (0x1F800010 & 0xFFFF)($at)
/* 5C190 8006E570 0C00338C */  lw         $s3, (0x1F80000C & 0xFFFF)($at)
/* 5C194 8006E574 0800328C */  lw         $s2, (0x1F800008 & 0xFFFF)($at)
/* 5C198 8006E578 0400318C */  lw         $s1, (0x1F800004 & 0xFFFF)($at)
/* 5C19C 8006E57C 0000308C */  lw         $s0, (0x1F800000 & 0xFFFF)($at)
/* 5C1A0 8006E580 0800E003 */  jr         $ra
/* 5C1A4 8006E584 00000000 */   nop
.size RenderStars, . - RenderStars
