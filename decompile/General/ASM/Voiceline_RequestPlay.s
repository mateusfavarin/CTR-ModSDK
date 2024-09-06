.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel Voiceline_RequestPlay
/* 1A808 8002CBE8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 1A80C 8002CBEC 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 1A810 8002CBF0 21988000 */  addu       $s3, $a0, $zero
/* 1A814 8002CBF4 1800B2AF */  sw         $s2, 0x18($sp)
/* 1A818 8002CBF8 2190A000 */  addu       $s2, $a1, $zero
/* 1A81C 8002CBFC 2000B4AF */  sw         $s4, 0x20($sp)
/* 1A820 8002CC00 21A0C000 */  addu       $s4, $a2, $zero
/* 1A824 8002CC04 1800622E */  sltiu      $v0, $s3, 0x18
/* 1A828 8002CC08 2400BFAF */  sw         $ra, 0x24($sp)
/* 1A82C 8002CC0C 1400B1AF */  sw         $s1, 0x14($sp)
/* 1A830 8002CC10 BD004010 */  beqz       $v0, .L8002CF08
/* 1A834 8002CC14 1000B0AF */   sw        $s0, 0x10($sp)
/* 1A838 8002CC18 1000422E */  sltiu      $v0, $s2, 0x10
/* 1A83C 8002CC1C BA004010 */  beqz       $v0, .L8002CF08
/* 1A840 8002CC20 1100822E */   sltiu     $v0, $s4, 0x11
/* 1A844 8002CC24 B8004010 */  beqz       $v0, .L8002CF08
/* 1A848 8002CC28 2000033C */   lui       $v1, (0x200000 >> 16)
/* 1A84C 8002CC2C 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 1A850 8002CC30 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 1A854 8002CC34 00000000 */  nop
/* 1A858 8002CC38 0000428C */  lw         $v0, 0x0($v0)
/* 1A85C 8002CC3C 00000000 */  nop
/* 1A860 8002CC40 24104300 */  and        $v0, $v0, $v1
/* 1A864 8002CC44 B0004014 */  bnez       $v0, .L8002CF08
/* 1A868 8002CC48 0880023C */   lui       $v0, %hi(D_800838DC)
/* 1A86C 8002CC4C DC384224 */  addiu      $v0, $v0, %lo(D_800838DC)
/* 1A870 8002CC50 21106202 */  addu       $v0, $s3, $v0
/* 1A874 8002CC54 00004690 */  lbu        $a2, 0x0($v0)
/* 1A878 8002CC58 0800622A */  slti       $v0, $s3, 0x8
/* 1A87C 8002CC5C 26004014 */  bnez       $v0, .L8002CCF8
/* 1A880 8002CC60 0980023C */   lui       $v0, %hi(D_80096284)
/* 1A884 8002CC64 0980023C */  lui        $v0, %hi(D_80096244)
/* 1A888 8002CC68 44624224 */  addiu      $v0, $v0, %lo(D_80096244)
/* 1A88C 8002CC6C 80181200 */  sll        $v1, $s2, 2
/* 1A890 8002CC70 21186200 */  addu       $v1, $v1, $v0
/* 1A894 8002CC74 01000224 */  addiu      $v0, $zero, 0x1
/* 1A898 8002CC78 0000638C */  lw         $v1, 0x0($v1)
/* 1A89C 8002CC7C 04106202 */  sllv       $v0, $v0, $s3
/* 1A8A0 8002CC80 24186200 */  and        $v1, $v1, $v0
/* 1A8A4 8002CC84 0E006010 */  beqz       $v1, .L8002CCC0
/* 1A8A8 8002CC88 00000000 */   nop
/* 1A8AC 8002CC8C 0980023C */  lui        $v0, %hi(D_8008D058)
/* 1A8B0 8002CC90 58D0428C */  lw         $v0, %lo(D_8008D058)($v0)
/* 1A8B4 8002CC94 00000000 */  nop
/* 1A8B8 8002CC98 C2180200 */  srl        $v1, $v0, 3
/* 1A8BC 8002CC9C 40170200 */  sll        $v0, $v0, 29
/* 1A8C0 8002CCA0 21186200 */  addu       $v1, $v1, $v0
/* 1A8C4 8002CCA4 80100300 */  sll        $v0, $v1, 2
/* 1A8C8 8002CCA8 21104300 */  addu       $v0, $v0, $v1
/* 1A8CC 8002CCAC 01004224 */  addiu      $v0, $v0, 0x1
/* 1A8D0 8002CCB0 0980013C */  lui        $at, %hi(D_8008D058)
/* 1A8D4 8002CCB4 58D022AC */  sw         $v0, %lo(D_8008D058)($at)
/* 1A8D8 8002CCB8 3CB30008 */  j          .L8002CCF0
/* 1A8DC 8002CCBC 07004230 */   andi      $v0, $v0, 0x7
.L8002CCC0:
/* 1A8E0 8002CCC0 0980023C */  lui        $v0, %hi(D_8008D058)
/* 1A8E4 8002CCC4 58D0428C */  lw         $v0, %lo(D_8008D058)($v0)
/* 1A8E8 8002CCC8 00000000 */  nop
/* 1A8EC 8002CCCC C2180200 */  srl        $v1, $v0, 3
/* 1A8F0 8002CCD0 40170200 */  sll        $v0, $v0, 29
/* 1A8F4 8002CCD4 21186200 */  addu       $v1, $v1, $v0
/* 1A8F8 8002CCD8 80100300 */  sll        $v0, $v1, 2
/* 1A8FC 8002CCDC 21104300 */  addu       $v0, $v0, $v1
/* 1A900 8002CCE0 01004224 */  addiu      $v0, $v0, 0x1
/* 1A904 8002CCE4 0980013C */  lui        $at, %hi(D_8008D058)
/* 1A908 8002CCE8 58D022AC */  sw         $v0, %lo(D_8008D058)($at)
/* 1A90C 8002CCEC 03004230 */  andi       $v0, $v0, 0x3
.L8002CCF0:
/* 1A910 8002CCF0 85004014 */  bnez       $v0, .L8002CF08
/* 1A914 8002CCF4 0980023C */   lui       $v0, %hi(D_80096284)
.L8002CCF8:
/* 1A918 8002CCF8 84624224 */  addiu      $v0, $v0, %lo(D_80096284)
/* 1A91C 8002CCFC 80181200 */  sll        $v1, $s2, 2
/* 1A920 8002CD00 21186200 */  addu       $v1, $v1, $v0
/* 1A924 8002CD04 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 1A928 8002CD08 ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 1A92C 8002CD0C 0000628C */  lw         $v0, 0x0($v1)
/* 1A930 8002CD10 F81C848C */  lw         $a0, 0x1CF8($a0)
/* 1A934 8002CD14 00000000 */  nop
/* 1A938 8002CD18 23208200 */  subu       $a0, $a0, $v0
/* 1A93C 8002CD1C 3D00822C */  sltiu      $v0, $a0, 0x3D
/* 1A940 8002CD20 02004014 */  bnez       $v0, .L8002CD2C
/* 1A944 8002CD24 21280000 */   addu      $a1, $zero, $zero
/* 1A948 8002CD28 0200C52C */  sltiu      $a1, $a2, 0x2
.L8002CD2C:
/* 1A94C 8002CD2C 80088293 */  lbu        $v0, 0x880($gp) /* Failed to symbolize address 0x00000880 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 1A950 8002CD30 00000000 */  nop
/* 1A954 8002CD34 0C004010 */  beqz       $v0, .L8002CD68
/* 1A958 8002CD38 00000000 */   nop
/* 1A95C 8002CD3C 82088287 */  lh         $v0, 0x882($gp) /* Failed to symbolize address 0x00000882 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 1A960 8002CD40 00000000 */  nop
/* 1A964 8002CD44 05004010 */  beqz       $v0, .L8002CD5C
/* 1A968 8002CD48 0980023C */   lui       $v0, %hi(D_8009619E)
/* 1A96C 8002CD4C 9E614290 */  lbu        $v0, %lo(D_8009619E)($v0)
/* 1A970 8002CD50 00000000 */  nop
/* 1A974 8002CD54 04005210 */  beq        $v0, $s2, .L8002CD68
/* 1A978 8002CD58 00000000 */   nop
.L8002CD5C:
/* 1A97C 8002CD5C 3C00822C */  sltiu      $v0, $a0, 0x3C
/* 1A980 8002CD60 02004010 */  beqz       $v0, .L8002CD6C
/* 1A984 8002CD64 01000424 */   addiu     $a0, $zero, 0x1
.L8002CD68:
/* 1A988 8002CD68 21200000 */  addu       $a0, $zero, $zero
.L8002CD6C:
/* 1A98C 8002CD6C 05008014 */  bnez       $a0, .L8002CD84
/* 1A990 8002CD70 00000000 */   nop
/* 1A994 8002CD74 6400A010 */  beqz       $a1, .L8002CF08
/* 1A998 8002CD78 00000000 */   nop
/* 1A99C 8002CD7C 73B30008 */  j          .L8002CDCC
/* 1A9A0 8002CD80 00000000 */   nop
.L8002CD84:
/* 1A9A4 8002CD84 2600A010 */  beqz       $a1, .L8002CE20
/* 1A9A8 8002CD88 00000000 */   nop
/* 1A9AC 8002CD8C 0980023C */  lui        $v0, %hi(D_8008D058)
/* 1A9B0 8002CD90 58D0428C */  lw         $v0, %lo(D_8008D058)($v0)
/* 1A9B4 8002CD94 00000000 */  nop
/* 1A9B8 8002CD98 C2180200 */  srl        $v1, $v0, 3
/* 1A9BC 8002CD9C 40170200 */  sll        $v0, $v0, 29
/* 1A9C0 8002CDA0 21186200 */  addu       $v1, $v1, $v0
/* 1A9C4 8002CDA4 80100300 */  sll        $v0, $v1, 2
/* 1A9C8 8002CDA8 21104300 */  addu       $v0, $v0, $v1
/* 1A9CC 8002CDAC 01004224 */  addiu      $v0, $v0, 0x1
/* 1A9D0 8002CDB0 0980013C */  lui        $at, %hi(D_8008D058)
/* 1A9D4 8002CDB4 58D022AC */  sw         $v0, %lo(D_8008D058)($at)
/* 1A9D8 8002CDB8 01004230 */  andi       $v0, $v0, 0x1
/* 1A9DC 8002CDBC 03004010 */  beqz       $v0, .L8002CDCC
/* 1A9E0 8002CDC0 21280000 */   addu      $a1, $zero, $zero
/* 1A9E4 8002CDC4 75B30008 */  j          .L8002CDD4
/* 1A9E8 8002CDC8 21200000 */   addu      $a0, $zero, $zero
.L8002CDCC:
/* 1A9EC 8002CDCC 1400A010 */  beqz       $a1, .L8002CE20
/* 1A9F0 8002CDD0 00000000 */   nop
.L8002CDD4:
/* 1A9F4 8002CDD4 0300C014 */  bnez       $a2, .L8002CDE4
/* 1A9F8 8002CDD8 01000224 */   addiu     $v0, $zero, 0x1
/* 1A9FC 8002CDDC 7CB30008 */  j          .L8002CDF0
/* 1AA00 8002CDE0 1C004426 */   addiu     $a0, $s2, 0x1C
.L8002CDE4:
/* 1AA04 8002CDE4 0600C214 */  bne        $a2, $v0, .L8002CE00
/* 1AA08 8002CDE8 0980033C */   lui       $v1, %hi(D_80096284)
/* 1AA0C 8002CDEC 2C004426 */  addiu      $a0, $s2, 0x2C
.L8002CDF0:
/* 1AA10 8002CDF0 FFFF8430 */  andi       $a0, $a0, 0xFFFF
/* 1AA14 8002CDF4 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 1AA18 8002CDF8 02000524 */   addiu     $a1, $zero, 0x2
/* 1AA1C 8002CDFC 0980033C */  lui        $v1, %hi(D_80096284)
.L8002CE00:
/* 1AA20 8002CE00 84626324 */  addiu      $v1, $v1, %lo(D_80096284)
/* 1AA24 8002CE04 0980043C */  lui        $a0, %hi(D_8008D2AC)
/* 1AA28 8002CE08 ACD2848C */  lw         $a0, %lo(D_8008D2AC)($a0)
/* 1AA2C 8002CE0C 80101200 */  sll        $v0, $s2, 2
/* 1AA30 8002CE10 F81C848C */  lw         $a0, 0x1CF8($a0)
/* 1AA34 8002CE14 21104300 */  addu       $v0, $v0, $v1
/* 1AA38 8002CE18 C2B30008 */  j          .L8002CF08
/* 1AA3C 8002CE1C 000044AC */   sw        $a0, 0x0($v0)
.L8002CE20:
/* 1AA40 8002CE20 39008010 */  beqz       $a0, .L8002CF08
/* 1AA44 8002CE24 0980023C */   lui       $v0, %hi(D_80096244)
/* 1AA48 8002CE28 44624224 */  addiu      $v0, $v0, %lo(D_80096244)
/* 1AA4C 8002CE2C 80201200 */  sll        $a0, $s2, 2
/* 1AA50 8002CE30 21208200 */  addu       $a0, $a0, $v0
/* 1AA54 8002CE34 01000224 */  addiu      $v0, $zero, 0x1
/* 1AA58 8002CE38 0000838C */  lw         $v1, 0x0($a0)
/* 1AA5C 8002CE3C 04106202 */  sllv       $v0, $v0, $s3
/* 1AA60 8002CE40 25186200 */  or         $v1, $v1, $v0
/* 1AA64 8002CE44 0980023C */  lui        $v0, %hi(D_800961B4)
/* 1AA68 8002CE48 000083AC */  sw         $v1, 0x0($a0)
/* 1AA6C 8002CE4C B461508C */  lw         $s0, %lo(D_800961B4)($v0)
/* 1AA70 8002CE50 00000000 */  nop
/* 1AA74 8002CE54 0F000012 */  beqz       $s0, .L8002CE94
/* 1AA78 8002CE58 0980023C */   lui       $v0, %hi(D_800961A4)
/* 1AA7C 8002CE5C 21280002 */  addu       $a1, $s0, $zero
.L8002CE60:
/* 1AA80 8002CE60 0800A284 */  lh         $v0, 0x8($a1)
/* 1AA84 8002CE64 00000000 */  nop
/* 1AA88 8002CE68 05006216 */  bne        $s3, $v0, .L8002CE80
/* 1AA8C 8002CE6C 00000000 */   nop
/* 1AA90 8002CE70 0A00A290 */  lbu        $v0, 0xA($a1)
/* 1AA94 8002CE74 00000000 */  nop
/* 1AA98 8002CE78 23004212 */  beq        $s2, $v0, .L8002CF08
/* 1AA9C 8002CE7C 00000000 */   nop
.L8002CE80:
/* 1AAA0 8002CE80 0000B08C */  lw         $s0, 0x0($a1)
/* 1AAA4 8002CE84 00000000 */  nop
/* 1AAA8 8002CE88 F5FF0016 */  bnez       $s0, .L8002CE60
/* 1AAAC 8002CE8C 21280002 */   addu      $a1, $s0, $zero
/* 1AAB0 8002CE90 0980023C */  lui        $v0, %hi(D_800961A4)
.L8002CE94:
/* 1AAB4 8002CE94 A461508C */  lw         $s0, %lo(D_800961A4)($v0)
/* 1AAB8 8002CE98 00000000 */  nop
/* 1AABC 8002CE9C 05000012 */  beqz       $s0, .L8002CEB4
/* 1AAC0 8002CEA0 A4614424 */   addiu     $a0, $v0, %lo(D_800961A4)
/* 1AAC4 8002CEA4 F9C5000C */  jal        DECOMP_LIST_RemoveMember
/* 1AAC8 8002CEA8 21280002 */   addu      $a1, $s0, $zero
/* 1AACC 8002CEAC B5B30008 */  j          .L8002CED4
/* 1AAD0 8002CEB0 0980043C */   lui       $a0, (0x80090000 >> 16)
.L8002CEB4:
/* 1AAD4 8002CEB4 0980023C */  lui        $v0, %hi(D_800961B4)
/* 1AAD8 8002CEB8 B4615124 */  addiu      $s1, $v0, %lo(D_800961B4)
/* 1AADC 8002CEBC 0400308E */  lw         $s0, 0x4($s1)
/* 1AAE0 8002CEC0 00000000 */  nop
/* 1AAE4 8002CEC4 07000012 */  beqz       $s0, .L8002CEE4
/* 1AAE8 8002CEC8 21202002 */   addu      $a0, $s1, $zero
/* 1AAEC 8002CECC F9C5000C */  jal        DECOMP_LIST_RemoveMember
/* 1AAF0 8002CED0 21280002 */   addu      $a1, $s0, $zero
.L8002CED4:
/* 1AAF4 8002CED4 0980043C */  lui        $a0, %hi(D_800961B4)
/* 1AAF8 8002CED8 B4618424 */  addiu      $a0, $a0, %lo(D_800961B4)
/* 1AAFC 8002CEDC D1C5000C */  jal        DECOMP_LIST_AddFront
/* 1AB00 8002CEE0 21280002 */   addu      $a1, $s0, $zero
.L8002CEE4:
/* 1AB04 8002CEE4 21280002 */  addu       $a1, $s0, $zero
/* 1AB08 8002CEE8 0A00B2A0 */  sb         $s2, 0xA($a1)
/* 1AB0C 8002CEEC 0B00B4A0 */  sb         $s4, 0xB($a1)
/* 1AB10 8002CEF0 0980023C */  lui        $v0, %hi(D_8008D2AC)
/* 1AB14 8002CEF4 ACD2428C */  lw         $v0, %lo(D_8008D2AC)($v0)
/* 1AB18 8002CEF8 0800B3A4 */  sh         $s3, 0x8($a1)
/* 1AB1C 8002CEFC EC1C428C */  lw         $v0, 0x1CEC($v0)
/* 1AB20 8002CF00 00000000 */  nop
/* 1AB24 8002CF04 0C00A2AC */  sw         $v0, 0xC($a1)
.L8002CF08:
/* 1AB28 8002CF08 2400BF8F */  lw         $ra, 0x24($sp)
/* 1AB2C 8002CF0C 2000B48F */  lw         $s4, 0x20($sp)
/* 1AB30 8002CF10 1C00B38F */  lw         $s3, 0x1C($sp)
/* 1AB34 8002CF14 1800B28F */  lw         $s2, 0x18($sp)
/* 1AB38 8002CF18 1400B18F */  lw         $s1, 0x14($sp)
/* 1AB3C 8002CF1C 1000B08F */  lw         $s0, 0x10($sp)
/* 1AB40 8002CF20 0800E003 */  jr         $ra
/* 1AB44 8002CF24 2800BD27 */   addiu     $sp, $sp, 0x28
.size Voiceline_RequestPlay, . - Voiceline_RequestPlay
