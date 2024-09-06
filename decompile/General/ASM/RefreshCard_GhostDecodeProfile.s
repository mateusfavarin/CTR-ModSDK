.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel RefreshCard_GhostDecodeProfile
/* 34C54 80047034 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 34C58 80047038 2400B5AF */  sw         $s5, 0x24($sp)
/* 34C5C 8004703C 21A88000 */  addu       $s5, $a0, $zero
/* 34C60 80047040 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 34C64 80047044 2198A000 */  addu       $s3, $a1, $zero
/* 34C68 80047048 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 34C6C 8004704C 2800B6AF */  sw         $s6, 0x28($sp)
/* 34C70 80047050 2000B4AF */  sw         $s4, 0x20($sp)
/* 34C74 80047054 1800B2AF */  sw         $s2, 0x18($sp)
/* 34C78 80047058 1400B1AF */  sw         $s1, 0x14($sp)
/* 34C7C 8004705C 1000B0AF */  sw         $s0, 0x10($sp)
/* 34C80 80047060 0D006492 */  lbu        $a0, 0xD($s3)
/* 34C84 80047064 F01A010C */  jal        RefreshCard_GhostDecodeByte
/* 34C88 80047068 00000000 */   nop
/* 34C8C 8004706C 0E006492 */  lbu        $a0, 0xE($s3)
/* 34C90 80047070 F01A010C */  jal        RefreshCard_GhostDecodeByte
/* 34C94 80047074 21804000 */   addu      $s0, $v0, $zero
/* 34C98 80047078 0F006492 */  lbu        $a0, 0xF($s3)
/* 34C9C 8004707C F01A010C */  jal        RefreshCard_GhostDecodeByte
/* 34CA0 80047080 21884000 */   addu      $s1, $v0, $zero
/* 34CA4 80047084 10006492 */  lbu        $a0, 0x10($s3)
/* 34CA8 80047088 F01A010C */  jal        RefreshCard_GhostDecodeByte
/* 34CAC 8004708C 21904000 */   addu      $s2, $v0, $zero
/* 34CB0 80047090 11006492 */  lbu        $a0, 0x11($s3)
/* 34CB4 80047094 F01A010C */  jal        RefreshCard_GhostDecodeByte
/* 34CB8 80047098 21B04000 */   addu      $s6, $v0, $zero
/* 34CBC 8004709C 12006492 */  lbu        $a0, 0x12($s3)
/* 34CC0 800470A0 F01A010C */  jal        RefreshCard_GhostDecodeByte
/* 34CC4 800470A4 21A04000 */   addu      $s4, $v0, $zero
/* 34CC8 800470A8 0F00033C */  lui        $v1, (0xFFFFF >> 16)
/* 34CCC 800470AC FFFF6334 */  ori        $v1, $v1, (0xFFFFF & 0xFFFF)
/* 34CD0 800470B0 00841000 */  sll        $s0, $s0, 16
/* 34CD4 800470B4 03841000 */  sra        $s0, $s0, 16
/* 34CD8 800470B8 008C1100 */  sll        $s1, $s1, 16
/* 34CDC 800470BC 838A1100 */  sra        $s1, $s1, 10
/* 34CE0 800470C0 25801102 */  or         $s0, $s0, $s1
/* 34CE4 800470C4 00941200 */  sll        $s2, $s2, 16
/* 34CE8 800470C8 03911200 */  sra        $s2, $s2, 4
/* 34CEC 800470CC 25801202 */  or         $s0, $s0, $s2
/* 34CF0 800470D0 80B41600 */  sll        $s6, $s6, 18
/* 34CF4 800470D4 25801602 */  or         $s0, $s0, $s6
/* 34CF8 800470D8 00A61400 */  sll        $s4, $s4, 24
/* 34CFC 800470DC 25801402 */  or         $s0, $s0, $s4
/* 34D00 800470E0 80170200 */  sll        $v0, $v0, 30
/* 34D04 800470E4 25800202 */  or         $s0, $s0, $v0
/* 34D08 800470E8 0F000232 */  andi       $v0, $s0, 0xF
/* 34D0C 800470EC 2A00A2A6 */  sh         $v0, 0x2A($s5)
/* 34D10 800470F0 02111000 */  srl        $v0, $s0, 4
/* 34D14 800470F4 1F004230 */  andi       $v0, $v0, 0x1F
/* 34D18 800470F8 2800A2A6 */  sh         $v0, 0x28($s5)
/* 34D1C 800470FC 42121000 */  srl        $v0, $s0, 9
/* 34D20 80047100 24104300 */  and        $v0, $v0, $v1
/* 34D24 80047104 42871000 */  srl        $s0, $s0, 29
/* 34D28 80047108 3000A2AE */  sw         $v0, 0x30($s5)
/* 34D2C 8004710C 2C00B0A6 */  sh         $s0, 0x2C($s5)
/* 34D30 80047110 2600A0A2 */  sb         $zero, 0x26($s5)
/* 34D34 80047114 0300668A */  lwl        $a2, 0x3($s3)
/* 34D38 80047118 0000669A */  lwr        $a2, 0x0($s3)
/* 34D3C 8004711C 0700678A */  lwl        $a3, 0x7($s3)
/* 34D40 80047120 0400679A */  lwr        $a3, 0x4($s3)
/* 34D44 80047124 0B00688A */  lwl        $t0, 0xB($s3)
/* 34D48 80047128 0800689A */  lwr        $t0, 0x8($s3)
/* 34D4C 8004712C 0F00698A */  lwl        $t1, 0xF($s3)
/* 34D50 80047130 0C00699A */  lwr        $t1, 0xC($s3)
/* 34D54 80047134 0300A6AA */  swl        $a2, 0x3($s5)
/* 34D58 80047138 0000A6BA */  swr        $a2, 0x0($s5)
/* 34D5C 8004713C 0700A7AA */  swl        $a3, 0x7($s5)
/* 34D60 80047140 0400A7BA */  swr        $a3, 0x4($s5)
/* 34D64 80047144 0B00A8AA */  swl        $t0, 0xB($s5)
/* 34D68 80047148 0800A8BA */  swr        $t0, 0x8($s5)
/* 34D6C 8004714C 0F00A9AA */  swl        $t1, 0xF($s5)
/* 34D70 80047150 0C00A9BA */  swr        $t1, 0xC($s5)
/* 34D74 80047154 1300668A */  lwl        $a2, 0x13($s3)
/* 34D78 80047158 1000669A */  lwr        $a2, 0x10($s3)
/* 34D7C 8004715C 14006782 */  lb         $a3, 0x14($s3)
/* 34D80 80047160 1300A6AA */  swl        $a2, 0x13($s5)
/* 34D84 80047164 1000A6BA */  swr        $a2, 0x10($s5)
/* 34D88 80047168 1400A7A2 */  sb         $a3, 0x14($s5)
/* 34D8C 8004716C 2900A0A2 */  sb         $zero, 0x29($s5)
/* 34D90 80047170 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 34D94 80047174 2800B68F */  lw         $s6, 0x28($sp)
/* 34D98 80047178 2400B58F */  lw         $s5, 0x24($sp)
/* 34D9C 8004717C 2000B48F */  lw         $s4, 0x20($sp)
/* 34DA0 80047180 1C00B38F */  lw         $s3, 0x1C($sp)
/* 34DA4 80047184 1800B28F */  lw         $s2, 0x18($sp)
/* 34DA8 80047188 1400B18F */  lw         $s1, 0x14($sp)
/* 34DAC 8004718C 1000B08F */  lw         $s0, 0x10($sp)
/* 34DB0 80047190 0800E003 */  jr         $ra
/* 34DB4 80047194 3000BD27 */   addiu     $sp, $sp, 0x30
.size RefreshCard_GhostDecodeProfile, . - RefreshCard_GhostDecodeProfile
