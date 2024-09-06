.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel EngineSound_NearestAIs
/* 1DB48 8002FF28 0980033C */  lui        $v1, %hi(D_8008D2AC)
/* 1DB4C 8002FF2C ACD2638C */  lw         $v1, %lo(D_8008D2AC)($v1)
/* 1DB50 8002FF30 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 1DB54 8002FF34 5800BFAF */  sw         $ra, 0x58($sp)
/* 1DB58 8002FF38 5400B5AF */  sw         $s5, 0x54($sp)
/* 1DB5C 8002FF3C 5000B4AF */  sw         $s4, 0x50($sp)
/* 1DB60 8002FF40 4C00B3AF */  sw         $s3, 0x4C($sp)
/* 1DB64 8002FF44 4800B2AF */  sw         $s2, 0x48($sp)
/* 1DB68 8002FF48 4400B1AF */  sw         $s1, 0x44($sp)
/* 1DB6C 8002FF4C 4000B0AF */  sw         $s0, 0x40($sp)
/* 1DB70 8002FF50 AB1C6290 */  lbu        $v0, 0x1CAB($v1)
/* 1DB74 8002FF54 00000000 */  nop
/* 1DB78 8002FF58 A2004010 */  beqz       $v0, .L800301E4
/* 1DB7C 8002FF5C FF7F023C */   lui       $v0, (0x7FFFFFFF >> 16)
/* 1DB80 8002FF60 FFFF4234 */  ori        $v0, $v0, (0x7FFFFFFF & 0xFFFF)
/* 1DB84 8002FF64 1800A0AF */  sw         $zero, 0x18($sp)
/* 1DB88 8002FF68 1C00A0AF */  sw         $zero, 0x1C($sp)
/* 1DB8C 8002FF6C 2000A2AF */  sw         $v0, 0x20($sp)
/* 1DB90 8002FF70 2400A2AF */  sw         $v0, 0x24($sp)
/* 1DB94 8002FF74 401B728C */  lw         $s2, 0x1B40($v1)
/* 1DB98 8002FF78 00000000 */  nop
/* 1DB9C 8002FF7C 47004012 */  beqz       $s2, .L8003009C
/* 1DBA0 8002FF80 21980000 */   addu      $s3, $zero, $zero
.L8002FF84:
/* 1DBA4 8002FF84 0980053C */  lui        $a1, %hi(D_8008D2AC)
/* 1DBA8 8002FF88 ACD2A58C */  lw         $a1, %lo(D_8008D2AC)($a1)
/* 1DBAC 8002FF8C 00000000 */  nop
/* 1DBB0 8002FF90 A81CA290 */  lbu        $v0, 0x1CA8($a1)
/* 1DBB4 8002FF94 3000508E */  lw         $s0, 0x30($s2)
/* 1DBB8 8002FF98 3C004010 */  beqz       $v0, .L8003008C
/* 1DBBC 8002FF9C 21880000 */   addu      $s1, $zero, $zero
/* 1DBC0 8002FFA0 00141100 */  sll        $v0, $s1, 16
.L8002FFA4:
/* 1DBC4 8002FFA4 03140200 */  sra        $v0, $v0, 16
/* 1DBC8 8002FFA8 00210200 */  sll        $a0, $v0, 4
/* 1DBCC 8002FFAC 21208200 */  addu       $a0, $a0, $v0
/* 1DBD0 8002FFB0 00210400 */  sll        $a0, $a0, 4
/* 1DBD4 8002FFB4 2120A400 */  addu       $a0, $a1, $a0
/* 1DBD8 8002FFB8 D402038E */  lw         $v1, 0x2D4($s0)
/* 1DBDC 8002FFBC 68018284 */  lh         $v0, 0x168($a0)
/* 1DBE0 8002FFC0 031A0300 */  sra        $v1, $v1, 8
/* 1DBE4 8002FFC4 23104300 */  subu       $v0, $v0, $v1
/* 1DBE8 8002FFC8 18004200 */  mult       $v0, $v0
/* 1DBEC 8002FFCC D802038E */  lw         $v1, 0x2D8($s0)
/* 1DBF0 8002FFD0 6A018284 */  lh         $v0, 0x16A($a0)
/* 1DBF4 8002FFD4 12300000 */  mflo       $a2
/* 1DBF8 8002FFD8 031A0300 */  sra        $v1, $v1, 8
/* 1DBFC 8002FFDC 23104300 */  subu       $v0, $v0, $v1
/* 1DC00 8002FFE0 18004200 */  mult       $v0, $v0
/* 1DC04 8002FFE4 DC02038E */  lw         $v1, 0x2DC($s0)
/* 1DC08 8002FFE8 6C018284 */  lh         $v0, 0x16C($a0)
/* 1DC0C 8002FFEC 12280000 */  mflo       $a1
/* 1DC10 8002FFF0 031A0300 */  sra        $v1, $v1, 8
/* 1DC14 8002FFF4 23104300 */  subu       $v0, $v0, $v1
/* 1DC18 8002FFF8 18004200 */  mult       $v0, $v0
/* 1DC1C 8002FFFC 2120C500 */  addu       $a0, $a2, $a1
/* 1DC20 80030000 12180000 */  mflo       $v1
/* 1DC24 80030004 86B1010C */  jal        SquareRoot0_stub
/* 1DC28 80030008 21208300 */   addu      $a0, $a0, $v1
/* 1DC2C 8003000C 2000A58F */  lw         $a1, 0x20($sp)
/* 1DC30 80030010 21204000 */  addu       $a0, $v0, $zero
/* 1DC34 80030014 2A108500 */  slt        $v0, $a0, $a1
/* 1DC38 80030018 0A004010 */  beqz       $v0, .L80030044
/* 1DC3C 8003001C 00000000 */   nop
/* 1DC40 80030020 2800A297 */  lhu        $v0, 0x28($sp)
/* 1DC44 80030024 1800A38F */  lw         $v1, 0x18($sp)
/* 1DC48 80030028 2800B1A7 */  sh         $s1, 0x28($sp)
/* 1DC4C 8003002C 2400A5AF */  sw         $a1, 0x24($sp)
/* 1DC50 80030030 2000A4AF */  sw         $a0, 0x20($sp)
/* 1DC54 80030034 1800B0AF */  sw         $s0, 0x18($sp)
/* 1DC58 80030038 2A00A2A7 */  sh         $v0, 0x2A($sp)
/* 1DC5C 8003003C 19C00008 */  j          .L80030064
/* 1DC60 80030040 1C00A3AF */   sw        $v1, 0x1C($sp)
.L80030044:
/* 1DC64 80030044 2400A28F */  lw         $v0, 0x24($sp)
/* 1DC68 80030048 00000000 */  nop
/* 1DC6C 8003004C 2A108200 */  slt        $v0, $a0, $v0
/* 1DC70 80030050 05004010 */  beqz       $v0, .L80030068
/* 1DC74 80030054 01002226 */   addiu     $v0, $s1, 0x1
/* 1DC78 80030058 2A00B1A7 */  sh         $s1, 0x2A($sp)
/* 1DC7C 8003005C 2400A4AF */  sw         $a0, 0x24($sp)
/* 1DC80 80030060 1C00B0AF */  sw         $s0, 0x1C($sp)
.L80030064:
/* 1DC84 80030064 01002226 */  addiu      $v0, $s1, 0x1
.L80030068:
/* 1DC88 80030068 21884000 */  addu       $s1, $v0, $zero
/* 1DC8C 8003006C 0980053C */  lui        $a1, %hi(D_8008D2AC)
/* 1DC90 80030070 ACD2A58C */  lw         $a1, %lo(D_8008D2AC)($a1)
/* 1DC94 80030074 00140200 */  sll        $v0, $v0, 16
/* 1DC98 80030078 A81CA390 */  lbu        $v1, 0x1CA8($a1)
/* 1DC9C 8003007C 03140200 */  sra        $v0, $v0, 16
/* 1DCA0 80030080 2A104300 */  slt        $v0, $v0, $v1
/* 1DCA4 80030084 C7FF4014 */  bnez       $v0, .L8002FFA4
/* 1DCA8 80030088 00141100 */   sll       $v0, $s1, 16
.L8003008C:
/* 1DCAC 8003008C 1000528E */  lw         $s2, 0x10($s2)
/* 1DCB0 80030090 00000000 */  nop
/* 1DCB4 80030094 BBFF4016 */  bnez       $s2, .L8002FF84
/* 1DCB8 80030098 21980000 */   addu      $s3, $zero, $zero
.L8003009C:
/* 1DCBC 8003009C 00141300 */  sll        $v0, $s3, 16
.L800300A0:
/* 1DCC0 800300A0 031C0200 */  sra        $v1, $v0, 16
/* 1DCC4 800300A4 80100300 */  sll        $v0, $v1, 2
/* 1DCC8 800300A8 2110A203 */  addu       $v0, $sp, $v0
/* 1DCCC 800300AC 1800448C */  lw         $a0, 0x18($v0)
/* 1DCD0 800300B0 00000000 */  nop
/* 1DCD4 800300B4 45008010 */  beqz       $a0, .L800301CC
/* 1DCD8 800300B8 01006226 */   addiu     $v0, $s3, 0x1
/* 1DCDC 800300BC 21A08000 */  addu       $s4, $a0, $zero
/* 1DCE0 800300C0 21288002 */  addu       $a1, $s4, $zero
/* 1DCE4 800300C4 40100300 */  sll        $v0, $v1, 1
/* 1DCE8 800300C8 2110A203 */  addu       $v0, $sp, $v0
/* 1DCEC 800300CC 3000A627 */  addiu      $a2, $sp, 0x30
/* 1DCF0 800300D0 28004384 */  lh         $v1, 0x28($v0)
/* 1DCF4 800300D4 0980073C */  lui        $a3, %hi(D_8008D2AC)
/* 1DCF8 800300D8 ACD2E78C */  lw         $a3, %lo(D_8008D2AC)($a3)
/* 1DCFC 800300DC 00210300 */  sll        $a0, $v1, 4
/* 1DD00 800300E0 21208300 */  addu       $a0, $a0, $v1
/* 1DD04 800300E4 00210400 */  sll        $a0, $a0, 4
/* 1DD08 800300E8 21208700 */  addu       $a0, $a0, $a3
/* 1DD0C 800300EC C0100300 */  sll        $v0, $v1, 3
/* 1DD10 800300F0 23104300 */  subu       $v0, $v0, $v1
/* 1DD14 800300F4 C0100200 */  sll        $v0, $v0, 3
/* 1DD18 800300F8 23104300 */  subu       $v0, $v0, $v1
/* 1DD1C 800300FC 80100200 */  sll        $v0, $v0, 2
/* 1DD20 80030100 2138E200 */  addu       $a3, $a3, $v0
/* 1DD24 80030104 DC14F58C */  lw         $s5, 0x14DC($a3)
/* 1DD28 80030108 73B9000C */  jal        GTE_AudioLR_Driver
/* 1DD2C 8003010C D0018424 */   addiu     $a0, $a0, 0x1D0
/* 1DD30 80030110 3800A58F */  lw         $a1, 0x38($sp)
/* 1DD34 80030114 3000A48F */  lw         $a0, 0x30($sp)
/* 1DD38 80030118 CFC5010C */  jal        ratan2
/* 1DD3C 8003011C 23280500 */   negu      $a1, $a1
/* 1DD40 80030120 00084624 */  addiu      $a2, $v0, 0x800
/* 1DD44 80030124 00150600 */  sll        $v0, $a2, 20
/* 1DD48 80030128 23100200 */  negu       $v0, $v0
/* 1DD4C 8003012C C3350200 */  sra        $a2, $v0, 23
/* 1DD50 80030130 8100C228 */  slti       $v0, $a2, 0x81
/* 1DD54 80030134 03004014 */  bnez       $v0, .L80030144
/* 1DD58 80030138 80FFC228 */   slti      $v0, $a2, -0x80
/* 1DD5C 8003013C 53C00008 */  j          .L8003014C
/* 1DD60 80030140 00010224 */   addiu     $v0, $zero, 0x100
.L80030144:
/* 1DD64 80030144 02004010 */  beqz       $v0, .L80030150
/* 1DD68 80030148 00FF0224 */   addiu     $v0, $zero, -0x100
.L8003014C:
/* 1DD6C 8003014C 23304600 */  subu       $a2, $v0, $a2
.L80030150:
/* 1DD70 80030150 8000C424 */  addiu      $a0, $a2, 0x80
/* 1DD74 80030154 00941300 */  sll        $s2, $s3, 16
/* 1DD78 80030158 03941200 */  sra        $s2, $s2, 16
/* 1DD7C 8003015C 80881200 */  sll        $s1, $s2, 2
/* 1DD80 80030160 0980103C */  lui        $s0, %hi(D_8008D828)
/* 1DD84 80030164 28D81026 */  addiu      $s0, $s0, %lo(D_8008D828)
/* 1DD88 80030168 21803002 */  addu       $s0, $s1, $s0
/* 1DD8C 8003016C 0000058E */  lw         $a1, 0x0($s0)
/* 1DD90 80030170 0ABF000C */  jal        EngineSound_VolumeAdjust
/* 1DD94 80030174 0A000624 */   addiu     $a2, $zero, 0xA
/* 1DD98 80030178 21304000 */  addu       $a2, $v0, $zero
/* 1DD9C 8003017C 21208002 */  addu       $a0, $s4, $zero
/* 1DDA0 80030180 000006AE */  sw         $a2, 0x0($s0)
/* 1DDA4 80030184 2000B027 */  addiu      $s0, $sp, 0x20
/* 1DDA8 80030188 21801102 */  addu       $s0, $s0, $s1
/* 1DDAC 8003018C 0980023C */  lui        $v0, %hi(D_8008D820)
/* 1DDB0 80030190 20D84224 */  addiu      $v0, $v0, %lo(D_8008D820)
/* 1DDB4 80030194 21882202 */  addu       $s1, $s1, $v0
/* 1DDB8 80030198 0000028E */  lw         $v0, 0x0($s0)
/* 1DDBC 8003019C 0000238E */  lw         $v1, 0x0($s1)
/* 1DDC0 800301A0 2128A002 */  addu       $a1, $s5, $zero
/* 1DDC4 800301A4 1400A6AF */  sw         $a2, 0x14($sp)
/* 1DDC8 800301A8 23104300 */  subu       $v0, $v0, $v1
/* 1DDCC 800301AC 1000A2AF */  sw         $v0, 0x10($sp)
/* 1DDD0 800301B0 0000078E */  lw         $a3, 0x0($s0)
/* 1DDD4 800301B4 19BF000C */  jal        EngineSound_AI
/* 1DDD8 800301B8 21304002 */   addu      $a2, $s2, $zero
/* 1DDDC 800301BC 0000028E */  lw         $v0, 0x0($s0)
/* 1DDE0 800301C0 00000000 */  nop
/* 1DDE4 800301C4 000022AE */  sw         $v0, 0x0($s1)
/* 1DDE8 800301C8 01006226 */  addiu      $v0, $s3, 0x1
.L800301CC:
/* 1DDEC 800301CC 21984000 */  addu       $s3, $v0, $zero
/* 1DDF0 800301D0 00140200 */  sll        $v0, $v0, 16
/* 1DDF4 800301D4 03140200 */  sra        $v0, $v0, 16
/* 1DDF8 800301D8 02004228 */  slti       $v0, $v0, 0x2
/* 1DDFC 800301DC B0FF4014 */  bnez       $v0, .L800300A0
/* 1DE00 800301E0 00141300 */   sll       $v0, $s3, 16
.L800301E4:
/* 1DE04 800301E4 5800BF8F */  lw         $ra, 0x58($sp)
/* 1DE08 800301E8 5400B58F */  lw         $s5, 0x54($sp)
/* 1DE0C 800301EC 5000B48F */  lw         $s4, 0x50($sp)
/* 1DE10 800301F0 4C00B38F */  lw         $s3, 0x4C($sp)
/* 1DE14 800301F4 4800B28F */  lw         $s2, 0x48($sp)
/* 1DE18 800301F8 4400B18F */  lw         $s1, 0x44($sp)
/* 1DE1C 800301FC 4000B08F */  lw         $s0, 0x40($sp)
/* 1DE20 80030200 0800E003 */  jr         $ra
/* 1DE24 80030204 6000BD27 */   addiu     $sp, $sp, 0x60
.size EngineSound_NearestAIs, . - EngineSound_NearestAIs
