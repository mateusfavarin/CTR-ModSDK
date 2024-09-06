.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_800472D0
/* 34EF0 800472D0 0E058387 */  lh         $v1, 0x50E($gp) /* Failed to symbolize address 0x0000050E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34EF4 800472D4 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 34EF8 800472D8 2000B2AF */  sw         $s2, 0x20($sp)
/* 34EFC 800472DC 21900000 */  addu       $s2, $zero, $zero
/* 34F00 800472E0 2800BFAF */  sw         $ra, 0x28($sp)
/* 34F04 800472E4 2400B3AF */  sw         $s3, 0x24($sp)
/* 34F08 800472E8 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 34F0C 800472EC 0A00622C */  sltiu      $v0, $v1, 0xA
/* 34F10 800472F0 B1004010 */  beqz       $v0, .L800475B8
/* 34F14 800472F4 1800B0AF */   sw        $s0, 0x18($sp)
/* 34F18 800472F8 0180023C */  lui        $v0, %hi(jtbl_80011650_ctr)
/* 34F1C 800472FC 50164224 */  addiu      $v0, $v0, %lo(jtbl_80011650_ctr)
/* 34F20 80047300 80180300 */  sll        $v1, $v1, 2
/* 34F24 80047304 21186200 */  addu       $v1, $v1, $v0
/* 34F28 80047308 0000628C */  lw         $v0, 0x0($v1)
/* 34F2C 8004730C 00000000 */  nop
/* 34F30 80047310 08004000 */  jr         $v0
/* 34F34 80047314 00000000 */   nop
/* 34F38 80047318 01001224 */  addiu      $s2, $zero, 0x1
/* 34F3C 8004731C 02000224 */  addiu      $v0, $zero, 0x2
/* 34F40 80047320 0C0582A7 */  sh         $v0, 0x50C($gp) /* Failed to symbolize address 0x0000050C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34F44 80047324 21104002 */  addu       $v0, $s2, $zero
/* 34F48 80047328 180A82A7 */  sh         $v0, 0xA18($gp) /* Failed to symbolize address 0x00000A18 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34F4C 8004732C 6E1D0108 */  j          .L800475B8
/* 34F50 80047330 00000000 */   nop
/* 34F54 80047334 0C058387 */  lh         $v1, 0x50C($gp) /* Failed to symbolize address 0x0000050C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34F58 80047338 07000224 */  addiu      $v0, $zero, 0x7
/* 34F5C 8004733C 0E006214 */  bne        $v1, $v0, .L80047378
/* 34F60 80047340 02000224 */   addiu     $v0, $zero, 0x2
/* 34F64 80047344 02000424 */  addiu      $a0, $zero, 0x2
/* 34F68 80047348 21108000 */  addu       $v0, $a0, $zero
/* 34F6C 8004734C 0C0582A7 */  sh         $v0, 0x50C($gp) /* Failed to symbolize address 0x0000050C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34F70 80047350 711C010C */  jal        func_800471C4
/* 34F74 80047354 00000000 */   nop
/* 34F78 80047358 21200000 */  addu       $a0, $zero, $zero
/* 34F7C 8004735C 04000524 */  addiu      $a1, $zero, 0x4
/* 34F80 80047360 0880063C */  lui        $a2, %hi(D_800859E4)
/* 34F84 80047364 E459C624 */  addiu      $a2, $a2, %lo(D_800859E4)
/* 34F88 80047368 21388000 */  addu       $a3, $a0, $zero
/* 34F8C 8004736C 1000A0AF */  sw         $zero, 0x10($sp)
/* 34F90 80047370 511D0108 */  j          .L80047544
/* 34F94 80047374 1400A0AF */   sw        $zero, 0x14($sp)
.L80047378:
/* 34F98 80047378 0C0582A7 */  sh         $v0, 0x50C($gp) /* Failed to symbolize address 0x0000050C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34F9C 8004737C 6D1D0108 */  j          .L800475B4
/* 34FA0 80047380 01001224 */   addiu     $s2, $zero, 0x1
/* 34FA4 80047384 6E1D0108 */  j          .L800475B8
/* 34FA8 80047388 01001224 */   addiu     $s2, $zero, 0x1
/* 34FAC 8004738C 0C058387 */  lh         $v1, 0x50C($gp) /* Failed to symbolize address 0x0000050C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34FB0 80047390 05000224 */  addiu      $v0, $zero, 0x5
/* 34FB4 80047394 70006210 */  beq        $v1, $v0, .L80047558
/* 34FB8 80047398 06006228 */   slti      $v0, $v1, 0x6
/* 34FBC 8004739C 05004010 */  beqz       $v0, .L800473B4
/* 34FC0 800473A0 03000224 */   addiu     $v0, $zero, 0x3
/* 34FC4 800473A4 08006210 */  beq        $v1, $v0, .L800473C8
/* 34FC8 800473A8 02000224 */   addiu     $v0, $zero, 0x2
/* 34FCC 800473AC 6D1D0108 */  j          .L800475B4
/* 34FD0 800473B0 01001224 */   addiu     $s2, $zero, 0x1
.L800473B4:
/* 34FD4 800473B4 06000224 */  addiu      $v0, $zero, 0x6
/* 34FD8 800473B8 0F006210 */  beq        $v1, $v0, .L800473F8
/* 34FDC 800473BC 0A80023C */   lui       $v0, %hi(D_8009AA30)
/* 34FE0 800473C0 6D1D0108 */  j          .L800475B4
/* 34FE4 800473C4 01001224 */   addiu     $s2, $zero, 0x1
.L800473C8:
/* 34FE8 800473C8 0C0582A7 */  sh         $v0, 0x50C($gp) /* Failed to symbolize address 0x0000050C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 34FEC 800473CC 711C010C */  jal        func_800471C4
/* 34FF0 800473D0 03000424 */   addiu     $a0, $zero, 0x3
/* 34FF4 800473D4 21200000 */  addu       $a0, $zero, $zero
/* 34FF8 800473D8 02000524 */  addiu      $a1, $zero, 0x2
/* 34FFC 800473DC 0880063C */  lui        $a2, %hi(D_800859E4)
/* 35000 800473E0 E459C624 */  addiu      $a2, $a2, %lo(D_800859E4)
/* 35004 800473E4 0880073C */  lui        $a3, %hi(D_800859F8)
/* 35008 800473E8 F859E724 */  addiu      $a3, $a3, %lo(D_800859F8)
/* 3500C 800473EC 0405838F */  lw         $v1, 0x504($gp) /* Failed to symbolize address 0x00000504 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 35010 800473F0 4F1D0108 */  j          .L8004753C
/* 35014 800473F4 80160224 */   addiu     $v0, $zero, 0x1680
.L800473F8:
/* 35018 800473F8 30AA5124 */  addiu      $s1, $v0, %lo(D_8009AA30)
/* 3501C 800473FC 26002386 */  lh         $v1, 0x26($s1)
/* 35020 80047400 00000000 */  nop
/* 35024 80047404 42006004 */  bltz       $v1, .L80047510
/* 35028 80047408 03000424 */   addiu     $a0, $zero, 0x3
/* 3502C 8004740C 0A80103C */  lui        $s0, %hi(D_80099284)
/* 35030 80047410 30003326 */  addiu      $s3, $s1, 0x30
/* 35034 80047414 40100300 */  sll        $v0, $v1, 1
/* 35038 80047418 21104300 */  addu       $v0, $v0, $v1
/* 3503C 8004741C 80100200 */  sll        $v0, $v0, 2
/* 35040 80047420 21104300 */  addu       $v0, $v0, $v1
/* 35044 80047424 80100200 */  sll        $v0, $v0, 2
/* 35048 80047428 21105300 */  addu       $v0, $v0, $s3
/* 3504C 8004742C 84920C26 */  addiu      $t4, $s0, %lo(D_80099284)
/* 35050 80047430 03004988 */  lwl        $t1, 0x3($v0)
/* 35054 80047434 00004998 */  lwr        $t1, 0x0($v0)
/* 35058 80047438 07004A88 */  lwl        $t2, 0x7($v0)
/* 3505C 8004743C 04004A98 */  lwr        $t2, 0x4($v0)
/* 35060 80047440 0B004B88 */  lwl        $t3, 0xB($v0)
/* 35064 80047444 08004B98 */  lwr        $t3, 0x8($v0)
/* 35068 80047448 030089A9 */  swl        $t1, 0x3($t4)
/* 3506C 8004744C 000089B9 */  swr        $t1, 0x0($t4)
/* 35070 80047450 07008AA9 */  swl        $t2, 0x7($t4)
/* 35074 80047454 04008AB9 */  swr        $t2, 0x4($t4)
/* 35078 80047458 0B008BA9 */  swl        $t3, 0xB($t4)
/* 3507C 8004745C 08008BB9 */  swr        $t3, 0x8($t4)
/* 35080 80047460 0F004988 */  lwl        $t1, 0xF($v0)
/* 35084 80047464 0C004998 */  lwr        $t1, 0xC($v0)
/* 35088 80047468 13004A88 */  lwl        $t2, 0x13($v0)
/* 3508C 8004746C 10004A98 */  lwr        $t2, 0x10($v0)
/* 35090 80047470 14004B80 */  lb         $t3, 0x14($v0)
/* 35094 80047474 0F0089A9 */  swl        $t1, 0xF($t4)
/* 35098 80047478 0C0089B9 */  swr        $t1, 0xC($t4)
/* 3509C 8004747C 13008AA9 */  swl        $t2, 0x13($t4)
/* 350A0 80047480 10008AB9 */  swr        $t2, 0x10($t4)
/* 350A4 80047484 14008BA1 */  sb         $t3, 0x14($t4)
/* 350A8 80047488 711C010C */  jal        func_800471C4
/* 350AC 8004748C 84921026 */   addiu     $s0, $s0, %lo(D_80099284)
/* 350B0 80047490 21200000 */  addu       $a0, $zero, $zero
/* 350B4 80047494 05000524 */  addiu      $a1, $zero, 0x5
/* 350B8 80047498 21300002 */  addu       $a2, $s0, $zero
/* 350BC 8004749C 21388000 */  addu       $a3, $a0, $zero
/* 350C0 800474A0 1000A0AF */  sw         $zero, 0x10($sp)
/* 350C4 800474A4 C71A010C */  jal        RefreshCard_NextMemcardAction
/* 350C8 800474A8 1400A0AF */   sw        $zero, 0x14($sp)
/* 350CC 800474AC 2C002286 */  lh         $v0, 0x2C($s1)
/* 350D0 800474B0 26002386 */  lh         $v1, 0x26($s1)
/* 350D4 800474B4 180A80A7 */  sh         $zero, 0xA18($gp) /* Failed to symbolize address 0x00000A18 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 350D8 800474B8 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 350DC 800474BC 23384300 */  subu       $a3, $v0, $v1
/* 350E0 800474C0 0E00E010 */  beqz       $a3, .L800474FC
/* 350E4 800474C4 40100300 */   sll       $v0, $v1, 1
/* 350E8 800474C8 21104300 */  addu       $v0, $v0, $v1
/* 350EC 800474CC 80100200 */  sll        $v0, $v0, 2
/* 350F0 800474D0 21104300 */  addu       $v0, $v0, $v1
/* 350F4 800474D4 80100200 */  sll        $v0, $v0, 2
/* 350F8 800474D8 21205300 */  addu       $a0, $v0, $s3
/* 350FC 800474DC 64002526 */  addiu      $a1, $s1, 0x64
/* 35100 800474E0 21284500 */  addu       $a1, $v0, $a1
/* 35104 800474E4 40300700 */  sll        $a2, $a3, 1
/* 35108 800474E8 2130C700 */  addu       $a2, $a2, $a3
/* 3510C 800474EC 80300600 */  sll        $a2, $a2, 2
/* 35110 800474F0 2130C700 */  addu       $a2, $a2, $a3
/* 35114 800474F4 8EDF010C */  jal        memmove
/* 35118 800474F8 80300600 */   sll       $a2, $a2, 2
.L800474FC:
/* 3511C 800474FC 2C002296 */  lhu        $v0, 0x2C($s1)
/* 35120 80047500 00000000 */  nop
/* 35124 80047504 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 35128 80047508 6E1D0108 */  j          .L800475B8
/* 3512C 8004750C 2C0022A6 */   sh        $v0, 0x2C($s1)
.L80047510:
/* 35130 80047510 711C010C */  jal        func_800471C4
/* 35134 80047514 03000424 */   addiu     $a0, $zero, 0x3
/* 35138 80047518 21200000 */  addu       $a0, $zero, $zero
/* 3513C 8004751C 02000524 */  addiu      $a1, $zero, 0x2
/* 35140 80047520 0880063C */  lui        $a2, %hi(D_80085A30)
/* 35144 80047524 305AC624 */  addiu      $a2, $a2, %lo(D_80085A30)
/* 35148 80047528 0A80073C */  lui        $a3, %hi(D_800992A4)
/* 3514C 8004752C A492E724 */  addiu      $a3, $a3, %lo(D_800992A4)
/* 35150 80047530 0980023C */  lui        $v0, %hi(D_8008FBF4)
/* 35154 80047534 F4FB438C */  lw         $v1, %lo(D_8008FBF4)($v0)
/* 35158 80047538 003E0224 */  addiu      $v0, $zero, 0x3E00
.L8004753C:
/* 3515C 8004753C 1400A2AF */  sw         $v0, 0x14($sp)
/* 35160 80047540 1000A3AF */  sw         $v1, 0x10($sp)
.L80047544:
/* 35164 80047544 C71A010C */  jal        RefreshCard_NextMemcardAction
/* 35168 80047548 00000000 */   nop
/* 3516C 8004754C 180A80A7 */  sh         $zero, 0xA18($gp) /* Failed to symbolize address 0x00000A18 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 35170 80047550 6E1D0108 */  j          .L800475B8
/* 35174 80047554 00000000 */   nop
.L80047558:
/* 35178 80047558 711C010C */  jal        func_800471C4
/* 3517C 8004755C 04000424 */   addiu     $a0, $zero, 0x4
/* 35180 80047560 21200000 */  addu       $a0, $zero, $zero
/* 35184 80047564 03000524 */  addiu      $a1, $zero, 0x3
/* 35188 80047568 21388000 */  addu       $a3, $a0, $zero
/* 3518C 8004756C 0A80083C */  lui        $t0, %hi(D_8009AA30)
/* 35190 80047570 30AA0825 */  addiu      $t0, $t0, %lo(D_8009AA30)
/* 35194 80047574 003E0224 */  addiu      $v0, $zero, 0x3E00
/* 35198 80047578 2A000385 */  lh         $v1, 0x2A($t0)
/* 3519C 8004757C 30000825 */  addiu      $t0, $t0, 0x30
/* 351A0 80047580 1400A2AF */  sw         $v0, 0x14($sp)
/* 351A4 80047584 0980023C */  lui        $v0, %hi(D_8008D754)
/* 351A8 80047588 54D7428C */  lw         $v0, %lo(D_8008D754)($v0)
/* 351AC 8004758C 40300300 */  sll        $a2, $v1, 1
/* 351B0 80047590 2130C300 */  addu       $a2, $a2, $v1
/* 351B4 80047594 80300600 */  sll        $a2, $a2, 2
/* 351B8 80047598 2130C300 */  addu       $a2, $a2, $v1
/* 351BC 8004759C 80300600 */  sll        $a2, $a2, 2
/* 351C0 800475A0 2130C800 */  addu       $a2, $a2, $t0
/* 351C4 800475A4 C71A010C */  jal        RefreshCard_NextMemcardAction
/* 351C8 800475A8 1000A2AF */   sw        $v0, 0x10($sp)
/* 351CC 800475AC 180A80A7 */  sh         $zero, 0xA18($gp) /* Failed to symbolize address 0x00000A18 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 351D0 800475B0 01001224 */  addiu      $s2, $zero, 0x1
.L800475B4:
/* 351D4 800475B4 180A92A7 */  sh         $s2, 0xA18($gp) /* Failed to symbolize address 0x00000A18 for %gp_rel. Make sure this address is within the recognized valid address space */
.L800475B8:
/* 351D8 800475B8 A41A010C */  jal        func_80046A90
/* 351DC 800475BC 03000424 */   addiu     $a0, $zero, 0x3
/* 351E0 800475C0 07004010 */  beqz       $v0, .L800475E0
/* 351E4 800475C4 00000000 */   nop
/* 351E8 800475C8 7A1C010C */  jal        func_800471E8
/* 351EC 800475CC 00000000 */   nop
/* 351F0 800475D0 891C010C */  jal        RefreshCard_GetNumGhostsTotal
/* 351F4 800475D4 00000000 */   nop
/* 351F8 800475D8 821E0108 */  j          .L80047A08
/* 351FC 800475DC 21104002 */   addu      $v0, $s2, $zero
.L800475E0:
/* 35200 800475E0 A41A010C */  jal        func_80046A90
/* 35204 800475E4 21200000 */   addu      $a0, $zero, $zero
/* 35208 800475E8 07004010 */  beqz       $v0, .L80047608
/* 3520C 800475EC 00000000 */   nop
/* 35210 800475F0 7A1C010C */  jal        func_800471E8
/* 35214 800475F4 00000000 */   nop
/* 35218 800475F8 891C010C */  jal        RefreshCard_GetNumGhostsTotal
/* 3521C 800475FC 00000000 */   nop
/* 35220 80047600 AD1D0108 */  j          .L800476B4
/* 35224 80047604 21200000 */   addu      $a0, $zero, $zero
.L80047608:
/* 35228 80047608 A41A010C */  jal        func_80046A90
/* 3522C 8004760C 01000424 */   addiu     $a0, $zero, 0x1
/* 35230 80047610 28004014 */  bnez       $v0, .L800476B4
/* 35234 80047614 06000424 */   addiu     $a0, $zero, 0x6
/* 35238 80047618 A41A010C */  jal        func_80046A90
/* 3523C 8004761C 02000424 */   addiu     $a0, $zero, 0x2
/* 35240 80047620 05004010 */  beqz       $v0, .L80047638
/* 35244 80047624 00000000 */   nop
/* 35248 80047628 7A1C010C */  jal        func_800471E8
/* 3524C 8004762C 00000000 */   nop
/* 35250 80047630 AD1D0108 */  j          .L800476B4
/* 35254 80047634 07000424 */   addiu     $a0, $zero, 0x7
.L80047638:
/* 35258 80047638 A41A010C */  jal        func_80046A90
/* 3525C 8004763C 05000424 */   addiu     $a0, $zero, 0x5
/* 35260 80047640 0F004010 */  beqz       $v0, .L80047680
/* 35264 80047644 00000000 */   nop
/* 35268 80047648 D80980A7 */  sh         $zero, 0x9D8($gp) /* Failed to symbolize address 0x000009D8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 3526C 8004764C 7A1C010C */  jal        func_800471E8
/* 35270 80047650 00000000 */   nop
/* 35274 80047654 0C0A8387 */  lh         $v1, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 35278 80047658 01000224 */  addiu      $v0, $zero, 0x1
/* 3527C 8004765C 180A82A7 */  sh         $v0, 0xA18($gp) /* Failed to symbolize address 0x00000A18 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 35280 80047660 C8006010 */  beqz       $v1, .L80047984
/* 35284 80047664 09000424 */   addiu     $a0, $zero, 0x9
/* 35288 80047668 E6006004 */  bltz       $v1, .L80047A04
/* 3528C 8004766C 03006228 */   slti      $v0, $v1, 0x3
/* 35290 80047670 E4004010 */  beqz       $v0, .L80047A04
/* 35294 80047674 08000424 */   addiu     $a0, $zero, 0x8
/* 35298 80047678 611E0108 */  j          .L80047984
/* 3529C 8004767C 00000000 */   nop
.L80047680:
/* 352A0 80047680 A41A010C */  jal        func_80046A90
/* 352A4 80047684 04000424 */   addiu     $a0, $zero, 0x4
/* 352A8 80047688 CC004014 */  bnez       $v0, .L800479BC
/* 352AC 8004768C 00000000 */   nop
/* 352B0 80047690 A41A010C */  jal        func_80046A90
/* 352B4 80047694 06000424 */   addiu     $a0, $zero, 0x6
/* 352B8 80047698 14004010 */  beqz       $v0, .L800476EC
/* 352BC 8004769C 00000000 */   nop
/* 352C0 800476A0 891C010C */  jal        RefreshCard_GetNumGhostsTotal
/* 352C4 800476A4 00000000 */   nop
/* 352C8 800476A8 7A1C010C */  jal        func_800471E8
/* 352CC 800476AC 00000000 */   nop
/* 352D0 800476B0 01000424 */  addiu      $a0, $zero, 0x1
.L800476B4:
/* 352D4 800476B4 711C010C */  jal        func_800471C4
/* 352D8 800476B8 21900000 */   addu      $s2, $zero, $zero
/* 352DC 800476BC 21200000 */  addu       $a0, $zero, $zero
/* 352E0 800476C0 01000524 */  addiu      $a1, $zero, 0x1
/* 352E4 800476C4 0880063C */  lui        $a2, %hi(D_800859E4)
/* 352E8 800476C8 E459C624 */  addiu      $a2, $a2, %lo(D_800859E4)
/* 352EC 800476CC 21388000 */  addu       $a3, $a0, $zero
/* 352F0 800476D0 1000A0AF */  sw         $zero, 0x10($sp)
/* 352F4 800476D4 C71A010C */  jal        RefreshCard_NextMemcardAction
/* 352F8 800476D8 1400A0AF */   sw        $zero, 0x14($sp)
/* 352FC 800476DC 01000224 */  addiu      $v0, $zero, 0x1
/* 35300 800476E0 180A82A7 */  sh         $v0, 0xA18($gp) /* Failed to symbolize address 0x00000A18 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 35304 800476E4 821E0108 */  j          .L80047A08
/* 35308 800476E8 21104002 */   addu      $v0, $s2, $zero
.L800476EC:
/* 3530C 800476EC A41A010C */  jal        func_80046A90
/* 35310 800476F0 07000424 */   addiu     $a0, $zero, 0x7
/* 35314 800476F4 C3004010 */  beqz       $v0, .L80047A04
/* 35318 800476F8 01001124 */   addiu     $s1, $zero, 0x1
/* 3531C 800476FC 0E059087 */  lh         $s0, 0x50E($gp) /* Failed to symbolize address 0x0000050E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 35320 80047700 03000224 */  addiu      $v0, $zero, 0x3
/* 35324 80047704 180A91A7 */  sh         $s1, 0xA18($gp) /* Failed to symbolize address 0x00000A18 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 35328 80047708 4D000212 */  beq        $s0, $v0, .L80047840
/* 3532C 8004770C 0400022A */   slti      $v0, $s0, 0x4
/* 35330 80047710 05004010 */  beqz       $v0, .L80047728
/* 35334 80047714 02000224 */   addiu     $v0, $zero, 0x2
/* 35338 80047718 0A000212 */  beq        $s0, $v0, .L80047744
/* 3533C 8004771C 21104002 */   addu      $v0, $s2, $zero
/* 35340 80047720 821E0108 */  j          .L80047A08
/* 35344 80047724 00000000 */   nop
.L80047728:
/* 35348 80047728 04000224 */  addiu      $v0, $zero, 0x4
/* 3534C 8004772C 23000212 */  beq        $s0, $v0, .L800477BC
/* 35350 80047730 05000224 */   addiu     $v0, $zero, 0x5
/* 35354 80047734 9F000212 */  beq        $s0, $v0, .L800479B4
/* 35358 80047738 21104002 */   addu      $v0, $s2, $zero
/* 3535C 8004773C 821E0108 */  j          .L80047A08
/* 35360 80047740 00000000 */   nop
.L80047744:
/* 35364 80047744 891C010C */  jal        RefreshCard_GetNumGhostsTotal
/* 35368 80047748 00000000 */   nop
/* 3536C 8004774C 7A1C010C */  jal        func_800471E8
/* 35370 80047750 00000000 */   nop
/* 35374 80047754 0C0A8387 */  lh         $v1, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 35378 80047758 BC0991A7 */  sh         $s1, 0x9BC($gp) /* Failed to symbolize address 0x000009BC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 3537C 8004775C A9006004 */  bltz       $v1, .L80047A04
/* 35380 80047760 02006228 */   slti      $v0, $v1, 0x2
/* 35384 80047764 06004014 */  bnez       $v0, .L80047780
/* 35388 80047768 00000000 */   nop
/* 3538C 8004776C A6007014 */  bne        $v1, $s0, .L80047A08
/* 35390 80047770 21104002 */   addu      $v0, $s2, $zero
/* 35394 80047774 180A91A7 */  sh         $s1, 0xA18($gp) /* Failed to symbolize address 0x00000A18 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 35398 80047778 821E0108 */  j          .L80047A08
/* 3539C 8004777C 00000000 */   nop
.L80047780:
/* 353A0 80047780 0805848F */  lw         $a0, 0x508($gp) /* Failed to symbolize address 0x00000508 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 353A4 80047784 099B000C */  jal        DECOMP_GAMEPROG_InitFullMemcard
/* 353A8 80047788 21900000 */   addu      $s2, $zero, $zero
/* 353AC 8004778C 711C010C */  jal        func_800471C4
/* 353B0 80047790 08000424 */   addiu     $a0, $zero, 0x8
/* 353B4 80047794 21200000 */  addu       $a0, $zero, $zero
/* 353B8 80047798 01000524 */  addiu      $a1, $zero, 0x1
/* 353BC 8004779C 0880063C */  lui        $a2, %hi(D_800859E4)
/* 353C0 800477A0 E459C624 */  addiu      $a2, $a2, %lo(D_800859E4)
/* 353C4 800477A4 21388000 */  addu       $a3, $a0, $zero
/* 353C8 800477A8 1000A0AF */  sw         $zero, 0x10($sp)
/* 353CC 800477AC C71A010C */  jal        RefreshCard_NextMemcardAction
/* 353D0 800477B0 1400A0AF */   sw        $zero, 0x14($sp)
/* 353D4 800477B4 821E0108 */  j          .L80047A08
/* 353D8 800477B8 21104002 */   addu      $v0, $s2, $zero
.L800477BC:
/* 353DC 800477BC 0C058387 */  lh         $v1, 0x50C($gp) /* Failed to symbolize address 0x0000050C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 353E0 800477C0 00000000 */  nop
/* 353E4 800477C4 05006214 */  bne        $v1, $v0, .L800477DC
/* 353E8 800477C8 0016033C */   lui       $v1, (0x1600FFEE >> 16)
/* 353EC 800477CC EC0991A7 */  sh         $s1, 0x9EC($gp) /* Failed to symbolize address 0x000009EC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 353F0 800477D0 F80991A7 */  sh         $s1, 0x9F8($gp) /* Failed to symbolize address 0x000009F8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 353F4 800477D4 061E0108 */  j          .L80047818
/* 353F8 800477D8 08000424 */   addiu     $a0, $zero, 0x8
.L800477DC:
/* 353FC 800477DC 0805828F */  lw         $v0, 0x508($gp) /* Failed to symbolize address 0x00000508 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 35400 800477E0 00000000 */  nop
/* 35404 800477E4 0000428C */  lw         $v0, 0x0($v0)
/* 35408 800477E8 EEFF6334 */  ori        $v1, $v1, (0x1600FFEE & 0xFFFF)
/* 3540C 800477EC 06004310 */  beq        $v0, $v1, .L80047808
/* 35410 800477F0 00000000 */   nop
/* 35414 800477F4 D80991A7 */  sh         $s1, 0x9D8($gp) /* Failed to symbolize address 0x000009D8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 35418 800477F8 7A1C010C */  jal        func_800471E8
/* 3541C 800477FC 00000000 */   nop
/* 35420 80047800 061E0108 */  j          .L80047818
/* 35424 80047804 09000424 */   addiu     $a0, $zero, 0x9
.L80047808:
/* 35428 80047808 D80980A7 */  sh         $zero, 0x9D8($gp) /* Failed to symbolize address 0x000009D8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 3542C 8004780C 8C1C010C */  jal        RefreshCard_GameProgressAndOptions
/* 35430 80047810 00000000 */   nop
/* 35434 80047814 08000424 */  addiu      $a0, $zero, 0x8
.L80047818:
/* 35438 80047818 711C010C */  jal        func_800471C4
/* 3543C 8004781C 00000000 */   nop
/* 35440 80047820 21200000 */  addu       $a0, $zero, $zero
/* 35444 80047824 01000524 */  addiu      $a1, $zero, 0x1
/* 35448 80047828 0880063C */  lui        $a2, %hi(D_800859E4)
/* 3544C 8004782C E459C624 */  addiu      $a2, $a2, %lo(D_800859E4)
/* 35450 80047830 02000224 */  addiu      $v0, $zero, 0x2
/* 35454 80047834 0C0582A7 */  sh         $v0, 0x50C($gp) /* Failed to symbolize address 0x0000050C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 35458 80047838 681E0108 */  j          .L800479A0
/* 3545C 8004783C 21388000 */   addu      $a3, $a0, $zero
.L80047840:
/* 35460 80047840 0C058387 */  lh         $v1, 0x50C($gp) /* Failed to symbolize address 0x0000050C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 35464 80047844 06000224 */  addiu      $v0, $zero, 0x6
/* 35468 80047848 4A006214 */  bne        $v1, $v0, .L80047974
/* 3546C 8004784C 08000424 */   addiu     $a0, $zero, 0x8
/* 35470 80047850 0A80023C */  lui        $v0, %hi(D_8009AA30)
/* 35474 80047854 30AA5024 */  addiu      $s0, $v0, %lo(D_8009AA30)
/* 35478 80047858 26000286 */  lh         $v0, 0x26($s0)
/* 3547C 8004785C 00000000 */  nop
/* 35480 80047860 0F004004 */  bltz       $v0, .L800478A0
/* 35484 80047864 03000424 */   addiu     $a0, $zero, 0x3
/* 35488 80047868 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 3548C 8004786C 711C010C */  jal        func_800471C4
/* 35490 80047870 260002A6 */   sh        $v0, 0x26($s0)
/* 35494 80047874 21200000 */  addu       $a0, $zero, $zero
/* 35498 80047878 02000524 */  addiu      $a1, $zero, 0x2
/* 3549C 8004787C 0880063C */  lui        $a2, %hi(D_80085A30)
/* 354A0 80047880 305AC624 */  addiu      $a2, $a2, %lo(D_80085A30)
/* 354A4 80047884 0A80073C */  lui        $a3, %hi(D_800992A4)
/* 354A8 80047888 A492E724 */  addiu      $a3, $a3, %lo(D_800992A4)
/* 354AC 8004788C 21908000 */  addu       $s2, $a0, $zero
/* 354B0 80047890 0980023C */  lui        $v0, %hi(D_8008FBF4)
/* 354B4 80047894 F4FB438C */  lw         $v1, %lo(D_8008FBF4)($v0)
/* 354B8 80047898 7D1E0108 */  j          .L800479F4
/* 354BC 8004789C 003E0224 */   addiu     $v0, $zero, 0x3E00
.L800478A0:
/* 354C0 800478A0 2C000286 */  lh         $v0, 0x2C($s0)
/* 354C4 800478A4 28000386 */  lh         $v1, 0x28($s0)
/* 354C8 800478A8 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 354CC 800478AC 23384300 */  subu       $a3, $v0, $v1
/* 354D0 800478B0 0F00E010 */  beqz       $a3, .L800478F0
/* 354D4 800478B4 64000426 */   addiu     $a0, $s0, 0x64
/* 354D8 800478B8 40100300 */  sll        $v0, $v1, 1
/* 354DC 800478BC 21104300 */  addu       $v0, $v0, $v1
/* 354E0 800478C0 80100200 */  sll        $v0, $v0, 2
/* 354E4 800478C4 21104300 */  addu       $v0, $v0, $v1
/* 354E8 800478C8 80100200 */  sll        $v0, $v0, 2
/* 354EC 800478CC 21204400 */  addu       $a0, $v0, $a0
/* 354F0 800478D0 30000526 */  addiu      $a1, $s0, 0x30
/* 354F4 800478D4 21284500 */  addu       $a1, $v0, $a1
/* 354F8 800478D8 40300700 */  sll        $a2, $a3, 1
/* 354FC 800478DC 2130C700 */  addu       $a2, $a2, $a3
/* 35500 800478E0 80300600 */  sll        $a2, $a2, 2
/* 35504 800478E4 2130C700 */  addu       $a2, $a2, $a3
/* 35508 800478E8 8EDF010C */  jal        memmove
/* 3550C 800478EC 80300600 */   sll       $a2, $a2, 2
.L800478F0:
/* 35510 800478F0 9C010526 */  addiu      $a1, $s0, 0x19C
/* 35514 800478F4 CC010626 */  addiu      $a2, $s0, 0x1CC
/* 35518 800478F8 28000386 */  lh         $v1, 0x28($s0)
/* 3551C 800478FC 30000426 */  addiu      $a0, $s0, 0x30
/* 35520 80047900 40100300 */  sll        $v0, $v1, 1
/* 35524 80047904 21104300 */  addu       $v0, $v0, $v1
/* 35528 80047908 80100200 */  sll        $v0, $v0, 2
/* 3552C 8004790C 21104300 */  addu       $v0, $v0, $v1
/* 35530 80047910 80100200 */  sll        $v0, $v0, 2
/* 35534 80047914 2C000396 */  lhu        $v1, 0x2C($s0)
/* 35538 80047918 21104400 */  addu       $v0, $v0, $a0
/* 3553C 8004791C 01006324 */  addiu      $v1, $v1, 0x1
/* 35540 80047920 2C0003A6 */  sh         $v1, 0x2C($s0)
.L80047924:
/* 35544 80047924 0000A98C */  lw         $t1, 0x0($a1)
/* 35548 80047928 0400AA8C */  lw         $t2, 0x4($a1)
/* 3554C 8004792C 0800AB8C */  lw         $t3, 0x8($a1)
/* 35550 80047930 0C00AC8C */  lw         $t4, 0xC($a1)
/* 35554 80047934 000049AC */  sw         $t1, 0x0($v0)
/* 35558 80047938 04004AAC */  sw         $t2, 0x4($v0)
/* 3555C 8004793C 08004BAC */  sw         $t3, 0x8($v0)
/* 35560 80047940 0C004CAC */  sw         $t4, 0xC($v0)
/* 35564 80047944 1000A524 */  addiu      $a1, $a1, 0x10
/* 35568 80047948 F6FFA614 */  bne        $a1, $a2, .L80047924
/* 3556C 8004794C 10004224 */   addiu     $v0, $v0, 0x10
/* 35570 80047950 08000424 */  addiu      $a0, $zero, 0x8
/* 35574 80047954 0000A98C */  lw         $t1, 0x0($a1)
/* 35578 80047958 00000000 */  nop
/* 3557C 8004795C 000049AC */  sw         $t1, 0x0($v0)
/* 35580 80047960 01000224 */  addiu      $v0, $zero, 0x1
/* 35584 80047964 F80982A7 */  sh         $v0, 0x9F8($gp) /* Failed to symbolize address 0x000009F8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 35588 80047968 180A82A7 */  sh         $v0, 0xA18($gp) /* Failed to symbolize address 0x00000A18 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 3558C 8004796C 601E0108 */  j          .L80047980
/* 35590 80047970 02000224 */   addiu     $v0, $zero, 0x2
.L80047974:
/* 35594 80047974 02000224 */  addiu      $v0, $zero, 0x2
/* 35598 80047978 F80991A7 */  sh         $s1, 0x9F8($gp) /* Failed to symbolize address 0x000009F8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 3559C 8004797C 180A91A7 */  sh         $s1, 0xA18($gp) /* Failed to symbolize address 0x00000A18 for %gp_rel. Make sure this address is within the recognized valid address space */
.L80047980:
/* 355A0 80047980 0C0582A7 */  sh         $v0, 0x50C($gp) /* Failed to symbolize address 0x0000050C for %gp_rel. Make sure this address is within the recognized valid address space */
.L80047984:
/* 355A4 80047984 711C010C */  jal        func_800471C4
/* 355A8 80047988 00000000 */   nop
/* 355AC 8004798C 21200000 */  addu       $a0, $zero, $zero
/* 355B0 80047990 01000524 */  addiu      $a1, $zero, 0x1
/* 355B4 80047994 0880063C */  lui        $a2, %hi(D_800859E4)
/* 355B8 80047998 E459C624 */  addiu      $a2, $a2, %lo(D_800859E4)
/* 355BC 8004799C 21388000 */  addu       $a3, $a0, $zero
.L800479A0:
/* 355C0 800479A0 1000A0AF */  sw         $zero, 0x10($sp)
/* 355C4 800479A4 C71A010C */  jal        RefreshCard_NextMemcardAction
/* 355C8 800479A8 1400A0AF */   sw        $zero, 0x14($sp)
/* 355CC 800479AC 811E0108 */  j          .L80047A04
/* 355D0 800479B0 21900000 */   addu      $s2, $zero, $zero
.L800479B4:
/* 355D4 800479B4 891C010C */  jal        RefreshCard_GetNumGhostsTotal
/* 355D8 800479B8 00000000 */   nop
.L800479BC:
/* 355DC 800479BC 7A1C010C */  jal        func_800471E8
/* 355E0 800479C0 00000000 */   nop
/* 355E4 800479C4 F00980A7 */  sh         $zero, 0x9F0($gp) /* Failed to symbolize address 0x000009F0 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 355E8 800479C8 FC0980A7 */  sh         $zero, 0x9FC($gp) /* Failed to symbolize address 0x000009FC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 355EC 800479CC 711C010C */  jal        func_800471C4
/* 355F0 800479D0 04000424 */   addiu     $a0, $zero, 0x4
/* 355F4 800479D4 21200000 */  addu       $a0, $zero, $zero
/* 355F8 800479D8 03000524 */  addiu      $a1, $zero, 0x3
/* 355FC 800479DC 0880063C */  lui        $a2, %hi(D_800859E4)
/* 35600 800479E0 E459C624 */  addiu      $a2, $a2, %lo(D_800859E4)
/* 35604 800479E4 21388000 */  addu       $a3, $a0, $zero
/* 35608 800479E8 21908000 */  addu       $s2, $a0, $zero
/* 3560C 800479EC 0405838F */  lw         $v1, 0x504($gp) /* Failed to symbolize address 0x00000504 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 35610 800479F0 80160224 */  addiu      $v0, $zero, 0x1680
.L800479F4:
/* 35614 800479F4 1400A2AF */  sw         $v0, 0x14($sp)
/* 35618 800479F8 C71A010C */  jal        RefreshCard_NextMemcardAction
/* 3561C 800479FC 1000A3AF */   sw        $v1, 0x10($sp)
/* 35620 80047A00 180A80A7 */  sh         $zero, 0xA18($gp) /* Failed to symbolize address 0x00000A18 for %gp_rel. Make sure this address is within the recognized valid address space */
.L80047A04:
/* 35624 80047A04 21104002 */  addu       $v0, $s2, $zero
.L80047A08:
/* 35628 80047A08 0C004010 */  beqz       $v0, .L80047A3C
/* 3562C 80047A0C 00000000 */   nop
/* 35630 80047A10 A41A010C */  jal        func_80046A90
/* 35634 80047A14 08000424 */   addiu     $a0, $zero, 0x8
/* 35638 80047A18 08004014 */  bnez       $v0, .L80047A3C
/* 3563C 80047A1C 21200000 */   addu      $a0, $zero, $zero
/* 35640 80047A20 01000524 */  addiu      $a1, $zero, 0x1
/* 35644 80047A24 0880063C */  lui        $a2, %hi(D_800859E4)
/* 35648 80047A28 E459C624 */  addiu      $a2, $a2, %lo(D_800859E4)
/* 3564C 80047A2C 21388000 */  addu       $a3, $a0, $zero
/* 35650 80047A30 1000A0AF */  sw         $zero, 0x10($sp)
/* 35654 80047A34 C71A010C */  jal        RefreshCard_NextMemcardAction
/* 35658 80047A38 1400A0AF */   sw        $zero, 0x14($sp)
.L80047A3C:
/* 3565C 80047A3C 2800BF8F */  lw         $ra, 0x28($sp)
/* 35660 80047A40 2400B38F */  lw         $s3, 0x24($sp)
/* 35664 80047A44 2000B28F */  lw         $s2, 0x20($sp)
/* 35668 80047A48 1C00B18F */  lw         $s1, 0x1C($sp)
/* 3566C 80047A4C 1800B08F */  lw         $s0, 0x18($sp)
/* 35670 80047A50 0800E003 */  jr         $ra
/* 35674 80047A54 3000BD27 */   addiu     $sp, $sp, 0x30
.size func_800472D0, . - func_800472D0
