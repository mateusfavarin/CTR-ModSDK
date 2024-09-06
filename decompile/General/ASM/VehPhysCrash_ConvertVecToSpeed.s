.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel VehPhysCrash_ConvertVecToSpeed
/* 4A93C 8005CD1C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 4A940 8005CD20 2000B4AF */  sw         $s4, 0x20($sp)
/* 4A944 8005CD24 21A0A000 */  addu       $s4, $a1, $zero
/* 4A948 8005CD28 2800BFAF */  sw         $ra, 0x28($sp)
/* 4A94C 8005CD2C 2400B5AF */  sw         $s5, 0x24($sp)
/* 4A950 8005CD30 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 4A954 8005CD34 1800B2AF */  sw         $s2, 0x18($sp)
/* 4A958 8005CD38 1400B1AF */  sw         $s1, 0x14($sp)
/* 4A95C 8005CD3C 1000B0AF */  sw         $s0, 0x10($sp)
/* 4A960 8005CD40 0000828E */  lw         $v0, 0x0($s4)
/* 4A964 8005CD44 00000000 */  nop
/* 4A968 8005CD48 18004200 */  mult       $v0, $v0
/* 4A96C 8005CD4C 12180000 */  mflo       $v1
/* 4A970 8005CD50 0800828E */  lw         $v0, 0x8($s4)
/* 4A974 8005CD54 00000000 */  nop
/* 4A978 8005CD58 18004200 */  mult       $v0, $v0
/* 4A97C 8005CD5C 21A88000 */  addu       $s5, $a0, $zero
/* 4A980 8005CD60 10000524 */  addiu      $a1, $zero, 0x10
/* 4A984 8005CD64 12300000 */  mflo       $a2
/* 4A988 8005CD68 1C64010C */  jal        VehCalc_FastSqrt
/* 4A98C 8005CD6C 21206600 */   addu      $a0, $v1, $a2
/* 4A990 8005CD70 0000838E */  lw         $v1, 0x0($s4)
/* 4A994 8005CD74 00000000 */  nop
/* 4A998 8005CD78 18006300 */  mult       $v1, $v1
/* 4A99C 8005CD7C 12300000 */  mflo       $a2
/* 4A9A0 8005CD80 0400838E */  lw         $v1, 0x4($s4)
/* 4A9A4 8005CD84 00000000 */  nop
/* 4A9A8 8005CD88 18006300 */  mult       $v1, $v1
/* 4A9AC 8005CD8C 12200000 */  mflo       $a0
/* 4A9B0 8005CD90 0800838E */  lw         $v1, 0x8($s4)
/* 4A9B4 8005CD94 00000000 */  nop
/* 4A9B8 8005CD98 18006300 */  mult       $v1, $v1
/* 4A9BC 8005CD9C 21984000 */  addu       $s3, $v0, $zero
/* 4A9C0 8005CDA0 10000524 */  addiu      $a1, $zero, 0x10
/* 4A9C4 8005CDA4 2120C400 */  addu       $a0, $a2, $a0
/* 4A9C8 8005CDA8 12180000 */  mflo       $v1
/* 4A9CC 8005CDAC 1C64010C */  jal        VehCalc_FastSqrt
/* 4A9D0 8005CDB0 21208300 */   addu      $a0, $a0, $v1
/* 4A9D4 8005CDB4 02120200 */  srl        $v0, $v0, 8
/* 4A9D8 8005CDB8 8C03A2A6 */  sh         $v0, 0x38C($s5)
/* 4A9DC 8005CDBC 0400848E */  lw         $a0, 0x4($s4)
/* 4A9E0 8005CDC0 21286002 */  addu       $a1, $s3, $zero
/* 4A9E4 8005CDC4 CFC5010C */  jal        ratan2
/* 4A9E8 8005CDC8 00220400 */   sll       $a0, $a0, 8
/* 4A9EC 8005CDCC 9403A2A6 */  sh         $v0, 0x394($s5)
/* 4A9F0 8005CDD0 0000848E */  lw         $a0, 0x0($s4)
/* 4A9F4 8005CDD4 0800858E */  lw         $a1, 0x8($s4)
/* 4A9F8 8005CDD8 CFC5010C */  jal        ratan2
/* 4A9FC 8005CDDC 00000000 */   nop
/* 4AA00 8005CDE0 1203A586 */  lh         $a1, 0x312($s5)
/* 4AA04 8005CDE4 9603A2A6 */  sh         $v0, 0x396($s5)
/* 4AA08 8005CDE8 0000828E */  lw         $v0, 0x0($s4)
/* 4AA0C 8005CDEC 00000000 */  nop
/* 4AA10 8005CDF0 18004500 */  mult       $v0, $a1
/* 4AA14 8005CDF4 1803A486 */  lh         $a0, 0x318($s5)
/* 4AA18 8005CDF8 12380000 */  mflo       $a3
/* 4AA1C 8005CDFC 0400828E */  lw         $v0, 0x4($s4)
/* 4AA20 8005CE00 00000000 */  nop
/* 4AA24 8005CE04 18004400 */  mult       $v0, $a0
/* 4AA28 8005CE08 1E03A386 */  lh         $v1, 0x31E($s5)
/* 4AA2C 8005CE0C 12300000 */  mflo       $a2
/* 4AA30 8005CE10 0800828E */  lw         $v0, 0x8($s4)
/* 4AA34 8005CE14 00000000 */  nop
/* 4AA38 8005CE18 18004300 */  mult       $v0, $v1
/* 4AA3C 8005CE1C 2110E600 */  addu       $v0, $a3, $a2
/* 4AA40 8005CE20 12480000 */  mflo       $t1
/* 4AA44 8005CE24 21104900 */  addu       $v0, $v0, $t1
/* 4AA48 8005CE28 039B0200 */  sra        $s3, $v0, 12
/* 4AA4C 8005CE2C 1800B300 */  mult       $a1, $s3
/* 4AA50 8005CE30 12300000 */  mflo       $a2
/* 4AA54 8005CE34 00000000 */  nop
/* 4AA58 8005CE38 00000000 */  nop
/* 4AA5C 8005CE3C 18009300 */  mult       $a0, $s3
/* 4AA60 8005CE40 12100000 */  mflo       $v0
/* 4AA64 8005CE44 00000000 */  nop
/* 4AA68 8005CE48 00000000 */  nop
/* 4AA6C 8005CE4C 18007300 */  mult       $v1, $s3
/* 4AA70 8005CE50 12180000 */  mflo       $v1
/* 4AA74 8005CE54 03830600 */  sra        $s0, $a2, 12
/* 4AA78 8005CE58 00000000 */  nop
/* 4AA7C 8005CE5C 18001002 */  mult       $s0, $s0
/* 4AA80 8005CE60 12200000 */  mflo       $a0
/* 4AA84 8005CE64 038B0200 */  sra        $s1, $v0, 12
/* 4AA88 8005CE68 00000000 */  nop
/* 4AA8C 8005CE6C 18003102 */  mult       $s1, $s1
/* 4AA90 8005CE70 12100000 */  mflo       $v0
/* 4AA94 8005CE74 03930300 */  sra        $s2, $v1, 12
/* 4AA98 8005CE78 00000000 */  nop
/* 4AA9C 8005CE7C 18005202 */  mult       $s2, $s2
/* 4AAA0 8005CE80 10000524 */  addiu      $a1, $zero, 0x10
/* 4AAA4 8005CE84 21208200 */  addu       $a0, $a0, $v0
/* 4AAA8 8005CE88 12180000 */  mflo       $v1
/* 4AAAC 8005CE8C 1C64010C */  jal        VehCalc_FastSqrt
/* 4AAB0 8005CE90 21208300 */   addu      $a0, $a0, $v1
/* 4AAB4 8005CE94 02120200 */  srl        $v0, $v0, 8
/* 4AAB8 8005CE98 03006106 */  bgez       $s3, .L8005CEA8
/* 4AABC 8005CE9C 9003A2A6 */   sh        $v0, 0x390($s5)
/* 4AAC0 8005CEA0 23100200 */  negu       $v0, $v0
/* 4AAC4 8005CEA4 9003A2A6 */  sh         $v0, 0x390($s5)
.L8005CEA8:
/* 4AAC8 8005CEA8 0000828E */  lw         $v0, 0x0($s4)
/* 4AACC 8005CEAC 00000000 */  nop
/* 4AAD0 8005CEB0 23805000 */  subu       $s0, $v0, $s0
/* 4AAD4 8005CEB4 18001002 */  mult       $s0, $s0
/* 4AAD8 8005CEB8 0400828E */  lw         $v0, 0x4($s4)
/* 4AADC 8005CEBC 12200000 */  mflo       $a0
/* 4AAE0 8005CEC0 23885100 */  subu       $s1, $v0, $s1
/* 4AAE4 8005CEC4 00000000 */  nop
/* 4AAE8 8005CEC8 18003102 */  mult       $s1, $s1
/* 4AAEC 8005CECC 0800828E */  lw         $v0, 0x8($s4)
/* 4AAF0 8005CED0 12180000 */  mflo       $v1
/* 4AAF4 8005CED4 23905200 */  subu       $s2, $v0, $s2
/* 4AAF8 8005CED8 00000000 */  nop
/* 4AAFC 8005CEDC 18005202 */  mult       $s2, $s2
/* 4AB00 8005CEE0 10000524 */  addiu      $a1, $zero, 0x10
/* 4AB04 8005CEE4 21208300 */  addu       $a0, $a0, $v1
/* 4AB08 8005CEE8 12300000 */  mflo       $a2
/* 4AB0C 8005CEEC 1C64010C */  jal        VehCalc_FastSqrt
/* 4AB10 8005CEF0 21208600 */   addu      $a0, $a0, $a2
/* 4AB14 8005CEF4 1403A386 */  lh         $v1, 0x314($s5)
/* 4AB18 8005CEF8 00000000 */  nop
/* 4AB1C 8005CEFC 18000302 */  mult       $s0, $v1
/* 4AB20 8005CF00 12280000 */  mflo       $a1
/* 4AB24 8005CF04 1A03A386 */  lh         $v1, 0x31A($s5)
/* 4AB28 8005CF08 00000000 */  nop
/* 4AB2C 8005CF0C 18002302 */  mult       $s1, $v1
/* 4AB30 8005CF10 12200000 */  mflo       $a0
/* 4AB34 8005CF14 2003A386 */  lh         $v1, 0x320($s5)
/* 4AB38 8005CF18 00000000 */  nop
/* 4AB3C 8005CF1C 18004302 */  mult       $s2, $v1
/* 4AB40 8005CF20 021A0200 */  srl        $v1, $v0, 8
/* 4AB44 8005CF24 2110A400 */  addu       $v0, $a1, $a0
/* 4AB48 8005CF28 12300000 */  mflo       $a2
/* 4AB4C 8005CF2C 21104600 */  addu       $v0, $v0, $a2
/* 4AB50 8005CF30 03004104 */  bgez       $v0, .L8005CF40
/* 4AB54 8005CF34 8E03A3A6 */   sh        $v1, 0x38E($s5)
/* 4AB58 8005CF38 23100300 */  negu       $v0, $v1
/* 4AB5C 8005CF3C 8E03A2A6 */  sh         $v0, 0x38E($s5)
.L8005CF40:
/* 4AB60 8005CF40 2800BF8F */  lw         $ra, 0x28($sp)
/* 4AB64 8005CF44 2400B58F */  lw         $s5, 0x24($sp)
/* 4AB68 8005CF48 2000B48F */  lw         $s4, 0x20($sp)
/* 4AB6C 8005CF4C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 4AB70 8005CF50 1800B28F */  lw         $s2, 0x18($sp)
/* 4AB74 8005CF54 1400B18F */  lw         $s1, 0x14($sp)
/* 4AB78 8005CF58 1000B08F */  lw         $s0, 0x10($sp)
/* 4AB7C 8005CF5C 0800E003 */  jr         $ra
/* 4AB80 8005CF60 3000BD27 */   addiu     $sp, $sp, 0x30
.size VehPhysCrash_ConvertVecToSpeed, . - VehPhysCrash_ConvertVecToSpeed
