.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_8003DDAC
/* 2B9CC 8003DDAC 9804828F */  lw         $v0, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2B9D0 8003DDB0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2B9D4 8003DDB4 1400BFAF */  sw         $ra, 0x14($sp)
/* 2B9D8 8003DDB8 FFFF4324 */  addiu      $v1, $v0, -0x1
/* 2B9DC 8003DDBC 0E00622C */  sltiu      $v0, $v1, 0xE
/* 2B9E0 8003DDC0 18014010 */  beqz       $v0, .L8003E224
/* 2B9E4 8003DDC4 1000B0AF */   sw        $s0, 0x10($sp)
/* 2B9E8 8003DDC8 0180023C */  lui        $v0, %hi(jtbl_800115AC_ctr)
/* 2B9EC 8003DDCC AC154224 */  addiu      $v0, $v0, %lo(jtbl_800115AC_ctr)
/* 2B9F0 8003DDD0 80180300 */  sll        $v1, $v1, 2
/* 2B9F4 8003DDD4 21186200 */  addu       $v1, $v1, $v0
/* 2B9F8 8003DDD8 0000628C */  lw         $v0, 0x0($v1)
/* 2B9FC 8003DDDC 00000000 */  nop
/* 2BA00 8003DDE0 08004000 */  jr         $v0
/* 2BA04 8003DDE4 00000000 */   nop
/* 2BA08 8003DDE8 7BF6000C */  jal        DECOMP_MEMCARD_GetNextSwEvent
/* 2BA0C 8003DDEC 00000000 */   nop
/* 2BA10 8003DDF0 21804000 */  addu       $s0, $v0, $zero
/* 2BA14 8003DDF4 16000016 */  bnez       $s0, .L8003DE50
/* 2BA18 8003DDF8 03000224 */   addiu     $v0, $zero, 0x3
/* 2BA1C 8003DDFC 6009838F */  lw         $v1, 0x960($gp) /* Failed to symbolize address 0x00000960 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BA20 8003DE00 00000000 */  nop
/* 2BA24 8003DE04 01006230 */  andi       $v0, $v1, 0x1
/* 2BA28 8003DE08 0B004010 */  beqz       $v0, .L8003DE38
/* 2BA2C 8003DE0C 02000224 */   addiu     $v0, $zero, 0x2
/* 2BA30 8003DE10 980482AF */  sw         $v0, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BA34 8003DE14 D5F6000C */  jal        DECOMP_MEMCARD_SkipEvents
/* 2BA38 8003DE18 01001024 */   addiu     $s0, $zero, 0x1
.L8003DE1C:
/* 2BA3C 8003DE1C 4C09848F */  lw         $a0, 0x94C($gp) /* Failed to symbolize address 0x0000094C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BA40 8003DE20 CEE0010C */  jal        _card_load
/* 2BA44 8003DE24 00000000 */   nop
/* 2BA48 8003DE28 FCFF5014 */  bne        $v0, $s0, .L8003DE1C
/* 2BA4C 8003DE2C 00000000 */   nop
/* 2BA50 8003DE30 81F80008 */  j          .L8003E204
/* 2BA54 8003DE34 07001024 */   addiu     $s0, $zero, 0x7
.L8003DE38:
/* 2BA58 8003DE38 02006230 */  andi       $v0, $v1, 0x2
/* 2BA5C 8003DE3C 3E004014 */  bnez       $v0, .L8003DF38
/* 2BA60 8003DE40 00000000 */   nop
/* 2BA64 8003DE44 400980AF */  sw         $zero, 0x940($gp) /* Failed to symbolize address 0x00000940 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BA68 8003DE48 CEF70008 */  j          .L8003DF38
/* 2BA6C 8003DE4C 05001024 */   addiu     $s0, $zero, 0x5
.L8003DE50:
/* 2BA70 8003DE50 17000216 */  bne        $s0, $v0, .L8003DEB0
/* 2BA74 8003DE54 07000224 */   addiu     $v0, $zero, 0x7
/* 2BA78 8003DE58 D5F6000C */  jal        DECOMP_MEMCARD_SkipEvents
/* 2BA7C 8003DE5C 01001024 */   addiu     $s0, $zero, 0x1
.L8003DE60:
/* 2BA80 8003DE60 4C09848F */  lw         $a0, 0x94C($gp) /* Failed to symbolize address 0x0000094C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BA84 8003DE64 FEDF010C */  jal        _card_clear
/* 2BA88 8003DE68 00000000 */   nop
/* 2BA8C 8003DE6C FCFF5014 */  bne        $v0, $s0, .L8003DE60
/* 2BA90 8003DE70 00000000 */   nop
/* 2BA94 8003DE74 B9F6000C */  jal        DECOMP_MEMCARD_WaitForHwEvent
/* 2BA98 8003DE78 00000000 */   nop
/* 2BA9C 8003DE7C 21804000 */  addu       $s0, $v0, $zero
/* 2BAA0 8003DE80 2D000016 */  bnez       $s0, .L8003DF38
/* 2BAA4 8003DE84 02000224 */   addiu     $v0, $zero, 0x2
/* 2BAA8 8003DE88 980482AF */  sw         $v0, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BAAC 8003DE8C D5F6000C */  jal        DECOMP_MEMCARD_SkipEvents
/* 2BAB0 8003DE90 01001024 */   addiu     $s0, $zero, 0x1
.L8003DE94:
/* 2BAB4 8003DE94 4C09848F */  lw         $a0, 0x94C($gp) /* Failed to symbolize address 0x0000094C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BAB8 8003DE98 CEE0010C */  jal        _card_load
/* 2BABC 8003DE9C 00000000 */   nop
/* 2BAC0 8003DEA0 FCFF5014 */  bne        $v0, $s0, .L8003DE94
/* 2BAC4 8003DEA4 00000000 */   nop
/* 2BAC8 8003DEA8 81F80008 */  j          .L8003E204
/* 2BACC 8003DEAC 07001024 */   addiu     $s0, $zero, 0x7
.L8003DEB0:
/* 2BAD0 8003DEB0 D4000212 */  beq        $s0, $v0, .L8003E204
/* 2BAD4 8003DEB4 21100002 */   addu      $v0, $s0, $zero
/* 2BAD8 8003DEB8 980480AF */  sw         $zero, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BADC 8003DEBC 400980AF */  sw         $zero, 0x940($gp) /* Failed to symbolize address 0x00000940 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BAE0 8003DEC0 8AF80008 */  j          .L8003E228
/* 2BAE4 8003DEC4 00000000 */   nop
/* 2BAE8 8003DEC8 7BF6000C */  jal        DECOMP_MEMCARD_GetNextSwEvent
/* 2BAEC 8003DECC 00000000 */   nop
/* 2BAF0 8003DED0 21804000 */  addu       $s0, $v0, $zero
/* 2BAF4 8003DED4 0C000016 */  bnez       $s0, .L8003DF08
/* 2BAF8 8003DED8 03000224 */   addiu     $v0, $zero, 0x3
/* 2BAFC 8003DEDC 4C09848F */  lw         $a0, 0x94C($gp) /* Failed to symbolize address 0x0000094C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BB00 8003DEE0 6009828F */  lw         $v0, 0x960($gp) /* Failed to symbolize address 0x00000960 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BB04 8003DEE4 FEFF0324 */  addiu      $v1, $zero, -0x2
/* 2BB08 8003DEE8 980480AF */  sw         $zero, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BB0C 8003DEEC 02004234 */  ori        $v0, $v0, 0x2
/* 2BB10 8003DEF0 24104300 */  and        $v0, $v0, $v1
/* 2BB14 8003DEF4 600982AF */  sw         $v0, 0x960($gp) /* Failed to symbolize address 0x00000960 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BB18 8003DEF8 44F7000C */  jal        DECOMP_MEMCARD_GetFreeBytes
/* 2BB1C 8003DEFC 03001024 */   addiu     $s0, $zero, 0x3
/* 2BB20 8003DF00 8AF80008 */  j          .L8003E228
/* 2BB24 8003DF04 21100002 */   addu      $v0, $s0, $zero
.L8003DF08:
/* 2BB28 8003DF08 09000216 */  bne        $s0, $v0, .L8003DF30
/* 2BB2C 8003DF0C 07000224 */   addiu     $v0, $zero, 0x7
/* 2BB30 8003DF10 05001024 */  addiu      $s0, $zero, 0x5
/* 2BB34 8003DF14 6009828F */  lw         $v0, 0x960($gp) /* Failed to symbolize address 0x00000960 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BB38 8003DF18 FCFF0324 */  addiu      $v1, $zero, -0x4
/* 2BB3C 8003DF1C 980480AF */  sw         $zero, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BB40 8003DF20 24104300 */  and        $v0, $v0, $v1
.L8003DF24:
/* 2BB44 8003DF24 600982AF */  sw         $v0, 0x960($gp) /* Failed to symbolize address 0x00000960 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BB48 8003DF28 8AF80008 */  j          .L8003E228
/* 2BB4C 8003DF2C 21100002 */   addu      $v0, $s0, $zero
.L8003DF30:
/* 2BB50 8003DF30 BD000212 */  beq        $s0, $v0, .L8003E228
/* 2BB54 8003DF34 21100002 */   addu      $v0, $s0, $zero
.L8003DF38:
/* 2BB58 8003DF38 980480AF */  sw         $zero, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BB5C 8003DF3C 8AF80008 */  j          .L8003E228
/* 2BB60 8003DF40 21100002 */   addu      $v0, $s0, $zero
/* 2BB64 8003DF44 7BF6000C */  jal        DECOMP_MEMCARD_GetNextSwEvent
/* 2BB68 8003DF48 00000000 */   nop
/* 2BB6C 8003DF4C 21804000 */  addu       $s0, $v0, $zero
/* 2BB70 8003DF50 26000016 */  bnez       $s0, .L8003DFEC
/* 2BB74 8003DF54 07000224 */   addiu     $v0, $zero, 0x7
/* 2BB78 8003DF58 9C04828F */  lw         $v0, 0x49C($gp) /* Failed to symbolize address 0x0000049C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BB7C 8003DF5C 3C09858F */  lw         $a1, 0x93C($gp) /* Failed to symbolize address 0x0000093C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BB80 8003DF60 02004490 */  lbu        $a0, 0x2($v0)
/* 2BB84 8003DF64 04000224 */  addiu      $v0, $zero, 0x4
/* 2BB88 8003DF68 980482AF */  sw         $v0, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BB8C 8003DF6C 0F008430 */  andi       $a0, $a0, 0xF
/* 2BB90 8003DF70 01008424 */  addiu      $a0, $a0, 0x1
/* 2BB94 8003DF74 C0210400 */  sll        $a0, $a0, 7
/* 2BB98 8003DF78 6C0984AF */  sw         $a0, 0x96C($gp) /* Failed to symbolize address 0x0000096C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BB9C 8003DF7C 0CF7000C */  jal        DECOMP_MEMCARD_ReadFile
/* 2BBA0 8003DF80 00000000 */   nop
/* 2BBA4 8003DF84 21804000 */  addu       $s0, $v0, $zero
/* 2BBA8 8003DF88 6C09858F */  lw         $a1, 0x96C($gp) /* Failed to symbolize address 0x0000096C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BBAC 8003DF8C 3C09848F */  lw         $a0, 0x93C($gp) /* Failed to symbolize address 0x0000093C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BBB0 8003DF90 9C04838F */  lw         $v1, 0x49C($gp) /* Failed to symbolize address 0x0000049C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BBB4 8003DF94 2110A400 */  addu       $v0, $a1, $a0
/* 2BBB8 8003DF98 FF1F4224 */  addiu      $v0, $v0, 0x1FFF
/* 2BBBC 8003DF9C 03006390 */  lbu        $v1, 0x3($v1)
/* 2BBC0 8003DFA0 43130200 */  sra        $v0, $v0, 13
/* 2BBC4 8003DFA4 2A104300 */  slt        $v0, $v0, $v1
/* 2BBC8 8003DFA8 0A004010 */  beqz       $v0, .L8003DFD4
/* 2BBCC 8003DFAC 40100400 */   sll       $v0, $a0, 1
/* 2BBD0 8003DFB0 2110A200 */  addu       $v0, $a1, $v0
/* 2BBD4 8003DFB4 FF1F4224 */  addiu      $v0, $v0, 0x1FFF
/* 2BBD8 8003DFB8 43130200 */  sra        $v0, $v0, 13
/* 2BBDC 8003DFBC 02004228 */  slti       $v0, $v0, 0x2
/* 2BBE0 8003DFC0 04004014 */  bnez       $v0, .L8003DFD4
/* 2BBE4 8003DFC4 FBFF0324 */   addiu     $v1, $zero, -0x5
/* 2BBE8 8003DFC8 6009828F */  lw         $v0, 0x960($gp) /* Failed to symbolize address 0x00000960 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BBEC 8003DFCC C9F70008 */  j          .L8003DF24
/* 2BBF0 8003DFD0 24104300 */   and       $v0, $v0, $v1
.L8003DFD4:
/* 2BBF4 8003DFD4 6009828F */  lw         $v0, 0x960($gp) /* Failed to symbolize address 0x00000960 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BBF8 8003DFD8 00000000 */  nop
/* 2BBFC 8003DFDC 04004234 */  ori        $v0, $v0, 0x4
/* 2BC00 8003DFE0 600982AF */  sw         $v0, 0x960($gp) /* Failed to symbolize address 0x00000960 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BC04 8003DFE4 8AF80008 */  j          .L8003E228
/* 2BC08 8003DFE8 21100002 */   addu      $v0, $s0, $zero
.L8003DFEC:
/* 2BC0C 8003DFEC 8E000212 */  beq        $s0, $v0, .L8003E228
/* 2BC10 8003DFF0 21100002 */   addu      $v0, $s0, $zero
/* 2BC14 8003DFF4 A404828F */  lw         $v0, 0x4A4($gp) /* Failed to symbolize address 0x000004A4 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BC18 8003DFF8 00000000 */  nop
/* 2BC1C 8003DFFC 7F004018 */  blez       $v0, .L8003E1FC
/* 2BC20 8003E000 FFFF4224 */   addiu     $v0, $v0, -0x1
/* 2BC24 8003E004 A40482AF */  sw         $v0, 0x4A4($gp) /* Failed to symbolize address 0x000004A4 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BC28 8003E008 21200000 */  addu       $a0, $zero, $zero
/* 2BC2C 8003E00C 80000524 */  addiu      $a1, $zero, 0x80
.L8003E010:
/* 2BC30 8003E010 0CF7000C */  jal        DECOMP_MEMCARD_ReadFile
/* 2BC34 8003E014 00000000 */   nop
/* 2BC38 8003E018 81F80008 */  j          .L8003E204
/* 2BC3C 8003E01C 21804000 */   addu      $s0, $v0, $zero
.L8003E020:
/* 2BC40 8003E020 9C04848F */  lw         $a0, 0x49C($gp) /* Failed to symbolize address 0x0000049C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BC44 8003E024 3C09858F */  lw         $a1, 0x93C($gp) /* Failed to symbolize address 0x0000093C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BC48 8003E028 86F5000C */  jal        DECOMP_MEMCARD_ChecksumLoad
/* 2BC4C 8003E02C 00000000 */   nop
/* 2BC50 8003E030 21804000 */  addu       $s0, $v0, $zero
/* 2BC54 8003E034 71000012 */  beqz       $s0, .L8003E1FC
/* 2BC58 8003E038 07000224 */   addiu     $v0, $zero, 0x7
/* 2BC5C 8003E03C 7A000212 */  beq        $s0, $v0, .L8003E228
/* 2BC60 8003E040 21100002 */   addu      $v0, $s0, $zero
/* 2BC64 8003E044 6009828F */  lw         $v0, 0x960($gp) /* Failed to symbolize address 0x00000960 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BC68 8003E048 00000000 */  nop
/* 2BC6C 8003E04C 04004230 */  andi       $v0, $v0, 0x4
/* 2BC70 8003E050 6A004014 */  bnez       $v0, .L8003E1FC
/* 2BC74 8003E054 00000000 */   nop
/* 2BC78 8003E058 9804838F */  lw         $v1, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BC7C 8003E05C 00000000 */  nop
/* 2BC80 8003E060 07006228 */  slti       $v0, $v1, 0x7
/* 2BC84 8003E064 65004010 */  beqz       $v0, .L8003E1FC
/* 2BC88 8003E068 FDFF6224 */   addiu     $v0, $v1, -0x3
/* 2BC8C 8003E06C 3C09858F */  lw         $a1, 0x93C($gp) /* Failed to symbolize address 0x0000093C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BC90 8003E070 00000000 */  nop
/* 2BC94 8003E074 18004500 */  mult       $v0, $a1
/* 2BC98 8003E078 6C09848F */  lw         $a0, 0x96C($gp) /* Failed to symbolize address 0x0000096C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BC9C 8003E07C 01006224 */  addiu      $v0, $v1, 0x1
/* 2BCA0 8003E080 980482AF */  sw         $v0, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BCA4 8003E084 12380000 */  mflo       $a3
/* 2BCA8 8003E088 04F80008 */  j          .L8003E010
/* 2BCAC 8003E08C 21208700 */   addu      $a0, $a0, $a3
/* 2BCB0 8003E090 7BF6000C */  jal        DECOMP_MEMCARD_GetNextSwEvent
/* 2BCB4 8003E094 00000000 */   nop
/* 2BCB8 8003E098 21804000 */  addu       $s0, $v0, $zero
/* 2BCBC 8003E09C 0C000016 */  bnez       $s0, .L8003E0D0
/* 2BCC0 8003E0A0 07000224 */   addiu     $v0, $zero, 0x7
/* 2BCC4 8003E0A4 9804828F */  lw         $v0, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BCC8 8003E0A8 6009838F */  lw         $v1, 0x960($gp) /* Failed to symbolize address 0x00000960 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BCCC 8003E0AC 440980AF */  sw         $zero, 0x944($gp) /* Failed to symbolize address 0x00000944 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BCD0 8003E0B0 640980AF */  sw         $zero, 0x964($gp) /* Failed to symbolize address 0x00000964 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BCD4 8003E0B4 01004224 */  addiu      $v0, $v0, 0x1
/* 2BCD8 8003E0B8 08006330 */  andi       $v1, $v1, 0x8
/* 2BCDC 8003E0BC 980482AF */  sw         $v0, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BCE0 8003E0C0 D7FF6014 */  bnez       $v1, .L8003E020
/* 2BCE4 8003E0C4 07001024 */   addiu     $s0, $zero, 0x7
/* 2BCE8 8003E0C8 8AF80008 */  j          .L8003E228
/* 2BCEC 8003E0CC 21100002 */   addu      $v0, $s0, $zero
.L8003E0D0:
/* 2BCF0 8003E0D0 4C000212 */  beq        $s0, $v0, .L8003E204
/* 2BCF4 8003E0D4 00000000 */   nop
/* 2BCF8 8003E0D8 A404838F */  lw         $v1, 0x4A4($gp) /* Failed to symbolize address 0x000004A4 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BCFC 8003E0DC 00000000 */  nop
/* 2BD00 8003E0E0 46006018 */  blez       $v1, .L8003E1FC
/* 2BD04 8003E0E4 00000000 */   nop
/* 2BD08 8003E0E8 9804828F */  lw         $v0, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BD0C 8003E0EC 3C09858F */  lw         $a1, 0x93C($gp) /* Failed to symbolize address 0x0000093C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BD10 8003E0F0 FCFF4224 */  addiu      $v0, $v0, -0x4
/* 2BD14 8003E0F4 18004500 */  mult       $v0, $a1
/* 2BD18 8003E0F8 6C09848F */  lw         $a0, 0x96C($gp) /* Failed to symbolize address 0x0000096C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BD1C 8003E0FC FFFF6224 */  addiu      $v0, $v1, -0x1
/* 2BD20 8003E100 A40482AF */  sw         $v0, 0x4A4($gp) /* Failed to symbolize address 0x000004A4 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BD24 8003E104 12380000 */  mflo       $a3
/* 2BD28 8003E108 04F80008 */  j          .L8003E010
/* 2BD2C 8003E10C 21208700 */   addu      $a0, $a0, $a3
/* 2BD30 8003E110 7BF6000C */  jal        DECOMP_MEMCARD_GetNextSwEvent
/* 2BD34 8003E114 00000000 */   nop
/* 2BD38 8003E118 21804000 */  addu       $s0, $v0, $zero
/* 2BD3C 8003E11C 1C000016 */  bnez       $s0, .L8003E190
/* 2BD40 8003E120 07000224 */   addiu     $v0, $zero, 0x7
/* 2BD44 8003E124 9804838F */  lw         $v1, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BD48 8003E128 09000224 */  addiu      $v0, $zero, 0x9
/* 2BD4C 8003E12C 08006210 */  beq        $v1, $v0, .L8003E150
/* 2BD50 8003E130 0B006228 */   slti      $v0, $v1, 0xB
/* 2BD54 8003E134 0F004010 */  beqz       $v0, .L8003E174
/* 2BD58 8003E138 00000000 */   nop
/* 2BD5C 8003E13C 6009828F */  lw         $v0, 0x960($gp) /* Failed to symbolize address 0x00000960 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BD60 8003E140 00000000 */  nop
/* 2BD64 8003E144 04004230 */  andi       $v0, $v0, 0x4
/* 2BD68 8003E148 0A004014 */  bnez       $v0, .L8003E174
/* 2BD6C 8003E14C 00000000 */   nop
.L8003E150:
/* 2BD70 8003E150 3C09868F */  lw         $a2, 0x93C($gp) /* Failed to symbolize address 0x0000093C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BD74 8003E154 F7FF6224 */  addiu      $v0, $v1, -0x9
/* 2BD78 8003E158 18004600 */  mult       $v0, $a2
/* 2BD7C 8003E15C 9C04858F */  lw         $a1, 0x49C($gp) /* Failed to symbolize address 0x0000049C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BD80 8003E160 6C09848F */  lw         $a0, 0x96C($gp) /* Failed to symbolize address 0x0000096C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BD84 8003E164 01006224 */  addiu      $v0, $v1, 0x1
/* 2BD88 8003E168 980482AF */  sw         $v0, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BD8C 8003E16C 79F80008 */  j          .L8003E1E4
/* 2BD90 8003E170 00000000 */   nop
.L8003E174:
/* 2BD94 8003E174 FEF6000C */  jal        DECOMP_MEMCARD_CloseFile
/* 2BD98 8003E178 00000000 */   nop
/* 2BD9C 8003E17C 4C09848F */  lw         $a0, 0x94C($gp) /* Failed to symbolize address 0x0000094C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BDA0 8003E180 44F7000C */  jal        DECOMP_MEMCARD_GetFreeBytes
/* 2BDA4 8003E184 00000000 */   nop
/* 2BDA8 8003E188 8AF80008 */  j          .L8003E228
/* 2BDAC 8003E18C 21100002 */   addu      $v0, $s0, $zero
.L8003E190:
/* 2BDB0 8003E190 25000212 */  beq        $s0, $v0, .L8003E228
/* 2BDB4 8003E194 21100002 */   addu      $v0, $s0, $zero
/* 2BDB8 8003E198 A404828F */  lw         $v0, 0x4A4($gp) /* Failed to symbolize address 0x000004A4 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BDBC 8003E19C 00000000 */  nop
/* 2BDC0 8003E1A0 16004018 */  blez       $v0, .L8003E1FC
/* 2BDC4 8003E1A4 FFFF4224 */   addiu     $v0, $v0, -0x1
/* 2BDC8 8003E1A8 9804838F */  lw         $v1, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BDCC 8003E1AC A40482AF */  sw         $v0, 0x4A4($gp) /* Failed to symbolize address 0x000004A4 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BDD0 8003E1B0 09000224 */  addiu      $v0, $zero, 0x9
/* 2BDD4 8003E1B4 06006214 */  bne        $v1, $v0, .L8003E1D0
/* 2BDD8 8003E1B8 F6FF6224 */   addiu     $v0, $v1, -0xA
/* 2BDDC 8003E1BC 21200000 */  addu       $a0, $zero, $zero
/* 2BDE0 8003E1C0 6C09868F */  lw         $a2, 0x96C($gp) /* Failed to symbolize address 0x0000096C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BDE4 8003E1C4 0880053C */  lui        $a1, %hi(D_800857A0)
/* 2BDE8 8003E1C8 7BF80008 */  j          .L8003E1EC
/* 2BDEC 8003E1CC A057A524 */   addiu     $a1, $a1, %lo(D_800857A0)
.L8003E1D0:
/* 2BDF0 8003E1D0 3C09868F */  lw         $a2, 0x93C($gp) /* Failed to symbolize address 0x0000093C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BDF4 8003E1D4 00000000 */  nop
/* 2BDF8 8003E1D8 18004600 */  mult       $v0, $a2
/* 2BDFC 8003E1DC 9C04858F */  lw         $a1, 0x49C($gp) /* Failed to symbolize address 0x0000049C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BE00 8003E1E0 6C09848F */  lw         $a0, 0x96C($gp) /* Failed to symbolize address 0x0000096C for %gp_rel. Make sure this address is within the recognized valid address space */
.L8003E1E4:
/* 2BE04 8003E1E4 12380000 */  mflo       $a3
/* 2BE08 8003E1E8 21208700 */  addu       $a0, $a0, $a3
.L8003E1EC:
/* 2BE0C 8003E1EC 27F7000C */  jal        DECOMP_MEMCARD_WriteFile
/* 2BE10 8003E1F0 00000000 */   nop
/* 2BE14 8003E1F4 81F80008 */  j          .L8003E204
/* 2BE18 8003E1F8 21804000 */   addu      $s0, $v0, $zero
.L8003E1FC:
/* 2BE1C 8003E1FC FEF6000C */  jal        DECOMP_MEMCARD_CloseFile
/* 2BE20 8003E200 00000000 */   nop
.L8003E204:
/* 2BE24 8003E204 8AF80008 */  j          .L8003E228
/* 2BE28 8003E208 21100002 */   addu      $v0, $s0, $zero
/* 2BE2C 8003E20C 980480AF */  sw         $zero, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BE30 8003E210 8AF80008 */  j          .L8003E228
/* 2BE34 8003E214 01000224 */   addiu     $v0, $zero, 0x1
/* 2BE38 8003E218 980480AF */  sw         $zero, 0x498($gp) /* Failed to symbolize address 0x00000498 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2BE3C 8003E21C 8AF80008 */  j          .L8003E228
/* 2BE40 8003E220 21100000 */   addu      $v0, $zero, $zero
.L8003E224:
/* 2BE44 8003E224 01000224 */  addiu      $v0, $zero, 0x1
.L8003E228:
/* 2BE48 8003E228 1400BF8F */  lw         $ra, 0x14($sp)
/* 2BE4C 8003E22C 1000B08F */  lw         $s0, 0x10($sp)
/* 2BE50 8003E230 0800E003 */  jr         $ra
/* 2BE54 8003E234 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_8003DDAC, . - func_8003DDAC
