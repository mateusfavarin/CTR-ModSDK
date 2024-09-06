.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel SelectProfile_InputLogic
/* 36B2C 80048F0C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 36B30 80048F10 1000B0AF */  sw         $s0, 0x10($sp)
/* 36B34 80048F14 21808000 */  addu       $s0, $a0, $zero
/* 36B38 80048F18 1800B2AF */  sw         $s2, 0x18($sp)
/* 36B3C 80048F1C 21900000 */  addu       $s2, $zero, $zero
/* 36B40 80048F20 0400023C */  lui        $v0, (0x4007F >> 16)
/* 36B44 80048F24 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 36B48 80048F28 0A80133C */  lui        $s3, %hi(D_8009A990)
/* 36B4C 80048F2C 90A9638E */  lw         $v1, %lo(D_8009A990)($s3)
/* 36B50 80048F30 7F004234 */  ori        $v0, $v0, (0x4007F & 0xFFFF)
/* 36B54 80048F34 1400B1AF */  sw         $s1, 0x14($sp)
/* 36B58 80048F38 2188C000 */  addu       $s1, $a2, $zero
/* 36B5C 80048F3C 24106200 */  and        $v0, $v1, $v0
/* 36B60 80048F40 58004010 */  beqz       $v0, .L800490A4
/* 36B64 80048F44 2000BFAF */   sw        $ra, 0x20($sp)
/* 36B68 80048F48 01002232 */  andi       $v0, $s1, 0x1
/* 36B6C 80048F4C 3F004014 */  bnez       $v0, .L8004904C
/* 36B70 80048F50 0400023C */   lui       $v0, (0x40020 >> 16)
/* 36B74 80048F54 1A000496 */  lhu        $a0, 0x1A($s0)
/* 36B78 80048F58 01006230 */  andi       $v0, $v1, 0x1
/* 36B7C 80048F5C 07004014 */  bnez       $v0, .L80048F7C
/* 36B80 80048F60 FEFF8224 */   addiu     $v0, $a0, -0x2
/* 36B84 80048F64 02006230 */  andi       $v0, $v1, 0x2
/* 36B88 80048F68 04004014 */  bnez       $v0, .L80048F7C
/* 36B8C 80048F6C 02008224 */   addiu     $v0, $a0, 0x2
/* 36B90 80048F70 0C006230 */  andi       $v0, $v1, 0xC
/* 36B94 80048F74 02004010 */  beqz       $v0, .L80048F80
/* 36B98 80048F78 01008238 */   xori      $v0, $a0, 0x1
.L80048F7C:
/* 36B9C 80048F7C 1A0002A6 */  sh         $v0, 0x1A($s0)
.L80048F80:
/* 36BA0 80048F80 1A000286 */  lh         $v0, 0x1A($s0)
/* 36BA4 80048F84 00000000 */  nop
/* 36BA8 80048F88 03004104 */  bgez       $v0, .L80048F98
/* 36BAC 80048F8C 001C0500 */   sll       $v1, $a1, 16
/* 36BB0 80048F90 1A0000A6 */  sh         $zero, 0x1A($s0)
/* 36BB4 80048F94 1A000286 */  lh         $v0, 0x1A($s0)
.L80048F98:
/* 36BB8 80048F98 038C0300 */  sra        $s1, $v1, 16
/* 36BBC 80048F9C 2A105100 */  slt        $v0, $v0, $s1
/* 36BC0 80048FA0 02004014 */  bnez       $v0, .L80048FAC
/* 36BC4 80048FA4 FFFFA224 */   addiu     $v0, $a1, -0x1
/* 36BC8 80048FA8 1A0002A6 */  sh         $v0, 0x1A($s0)
.L80048FAC:
/* 36BCC 80048FAC 1A000386 */  lh         $v1, 0x1A($s0)
/* 36BD0 80048FB0 00140400 */  sll        $v0, $a0, 16
/* 36BD4 80048FB4 03140200 */  sra        $v0, $v0, 16
/* 36BD8 80048FB8 03006210 */  beq        $v1, $v0, .L80048FC8
/* 36BDC 80048FBC 21200000 */   addu      $a0, $zero, $zero
/* 36BE0 80048FC0 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 36BE4 80048FC4 01000524 */   addiu     $a1, $zero, 0x1
.L80048FC8:
/* 36BE8 80048FC8 0A80023C */  lui        $v0, %hi(D_8009A990)
/* 36BEC 80048FCC 90A9428C */  lw         $v0, %lo(D_8009A990)($v0)
/* 36BF0 80048FD0 00000000 */  nop
/* 36BF4 80048FD4 50004230 */  andi       $v0, $v0, 0x50
/* 36BF8 80048FD8 10004010 */  beqz       $v0, .L8004901C
/* 36BFC 80048FDC 0400033C */   lui       $v1, (0x40020 >> 16)
/* 36C00 80048FE0 06002016 */  bnez       $s1, .L80048FFC
/* 36C04 80048FE4 01000424 */   addiu     $a0, $zero, 0x1
/* 36C08 80048FE8 0C0A8387 */  lh         $v1, 0xA0C($gp) /* Failed to symbolize address 0x00000A0C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36C0C 80048FEC 01000224 */  addiu      $v0, $zero, 0x1
/* 36C10 80048FF0 0A006214 */  bne        $v1, $v0, .L8004901C
/* 36C14 80048FF4 0400033C */   lui       $v1, (0x40020 >> 16)
/* 36C18 80048FF8 01000424 */  addiu      $a0, $zero, 0x1
.L80048FFC:
/* 36C1C 80048FFC 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 36C20 80049000 21288000 */   addu      $a1, $a0, $zero
/* 36C24 80049004 0E058387 */  lh         $v1, 0x50E($gp) /* Failed to symbolize address 0x0000050E for %gp_rel. Make sure this address is within the recognized valid address space */
/* 36C28 80049008 01000224 */  addiu      $v0, $zero, 0x1
/* 36C2C 8004900C 23006214 */  bne        $v1, $v0, .L8004909C
/* 36C30 80049010 01001224 */   addiu     $s2, $zero, 0x1
/* 36C34 80049014 27240108 */  j          .L8004909C
/* 36C38 80049018 1A0000A6 */   sh        $zero, 0x1A($s0)
.L8004901C:
/* 36C3C 8004901C 0A80023C */  lui        $v0, %hi(D_8009A990)
/* 36C40 80049020 90A9428C */  lw         $v0, %lo(D_8009A990)($v0)
/* 36C44 80049024 20006334 */  ori        $v1, $v1, (0x40020 & 0xFFFF)
/* 36C48 80049028 24104300 */  and        $v0, $v0, $v1
/* 36C4C 8004902C 1B004010 */  beqz       $v0, .L8004909C
/* 36C50 80049030 02000424 */   addiu     $a0, $zero, 0x2
/* 36C54 80049034 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 36C58 80049038 01000524 */   addiu     $a1, $zero, 0x1
/* 36C5C 8004903C 01001224 */  addiu      $s2, $zero, 0x1
/* 36C60 80049040 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 36C64 80049044 27240108 */  j          .L8004909C
/* 36C68 80049048 1A0002A6 */   sh        $v0, 0x1A($s0)
.L8004904C:
/* 36C6C 8004904C 20004234 */  ori        $v0, $v0, (0x40020 & 0xFFFF)
/* 36C70 80049050 24106200 */  and        $v0, $v1, $v0
/* 36C74 80049054 06004010 */  beqz       $v0, .L80049070
/* 36C78 80049058 02000424 */   addiu     $a0, $zero, 0x2
/* 36C7C 8004905C 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 36C80 80049060 01000524 */   addiu     $a1, $zero, 0x1
/* 36C84 80049064 01001224 */  addiu      $s2, $zero, 0x1
/* 36C88 80049068 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 36C8C 8004906C 1A0002A6 */  sh         $v0, 0x1A($s0)
.L80049070:
/* 36C90 80049070 02002232 */  andi       $v0, $s1, 0x2
/* 36C94 80049074 09004010 */  beqz       $v0, .L8004909C
/* 36C98 80049078 00000000 */   nop
/* 36C9C 8004907C 90A9628E */  lw         $v0, %lo(D_8009A990)($s3)
/* 36CA0 80049080 00000000 */  nop
/* 36CA4 80049084 50004230 */  andi       $v0, $v0, 0x50
/* 36CA8 80049088 04004010 */  beqz       $v0, .L8004909C
/* 36CAC 8004908C 01000424 */   addiu     $a0, $zero, 0x1
/* 36CB0 80049090 1AA1000C */  jal        DECOMP_OtherFX_Play
/* 36CB4 80049094 21288000 */   addu      $a1, $a0, $zero
/* 36CB8 80049098 01001224 */  addiu      $s2, $zero, 0x1
.L8004909C:
/* 36CBC 8004909C 0119010C */  jal        DECOMP_RECTMENU_ClearInput
/* 36CC0 800490A0 00000000 */   nop
.L800490A4:
/* 36CC4 800490A4 21104002 */  addu       $v0, $s2, $zero
/* 36CC8 800490A8 2000BF8F */  lw         $ra, 0x20($sp)
/* 36CCC 800490AC 1C00B38F */  lw         $s3, 0x1C($sp)
/* 36CD0 800490B0 1800B28F */  lw         $s2, 0x18($sp)
/* 36CD4 800490B4 1400B18F */  lw         $s1, 0x14($sp)
/* 36CD8 800490B8 1000B08F */  lw         $s0, 0x10($sp)
/* 36CDC 800490BC 0800E003 */  jr         $ra
/* 36CE0 800490C0 2800BD27 */   addiu     $sp, $sp, 0x28
.size SelectProfile_InputLogic, . - SelectProfile_InputLogic
