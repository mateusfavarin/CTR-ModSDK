.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel MainFreeze_ConfigSetupEntry
/* 259C0 80037DA0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 259C4 80037DA4 0400033C */  lui        $v1, (0x40020 >> 16)
/* 259C8 80037DA8 0980023C */  lui        $v0, %hi(D_8008D950)
/* 259CC 80037DAC 50D9428C */  lw         $v0, %lo(D_8008D950)($v0)
/* 259D0 80037DB0 20006334 */  ori        $v1, $v1, (0x40020 & 0xFFFF)
/* 259D4 80037DB4 6800BFAF */  sw         $ra, 0x68($sp)
/* 259D8 80037DB8 6400B7AF */  sw         $s7, 0x64($sp)
/* 259DC 80037DBC 6000B6AF */  sw         $s6, 0x60($sp)
/* 259E0 80037DC0 5C00B5AF */  sw         $s5, 0x5C($sp)
/* 259E4 80037DC4 5800B4AF */  sw         $s4, 0x58($sp)
/* 259E8 80037DC8 5400B3AF */  sw         $s3, 0x54($sp)
/* 259EC 80037DCC 5000B2AF */  sw         $s2, 0x50($sp)
/* 259F0 80037DD0 4C00B1AF */  sw         $s1, 0x4C($sp)
/* 259F4 80037DD4 24104300 */  and        $v0, $v0, $v1
/* 259F8 80037DD8 0F004014 */  bnez       $v0, .L80037E18
/* 259FC 80037DDC 4800B0AF */   sw        $s0, 0x48($sp)
/* 25A00 80037DE0 10098787 */  lh         $a3, 0x910($gp) /* Failed to symbolize address 0x00000910 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25A04 80037DE4 4403838F */  lw         $v1, 0x344($gp) /* Failed to symbolize address 0x00000344 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25A08 80037DE8 80280700 */  sll        $a1, $a3, 2
/* 25A0C 80037DEC 2110A700 */  addu       $v0, $a1, $a3
/* 25A10 80037DF0 00110200 */  sll        $v0, $v0, 4
/* 25A14 80037DF4 21186200 */  addu       $v1, $v1, $v0
/* 25A18 80037DF8 2000638C */  lw         $v1, 0x20($v1)
/* 25A1C 80037DFC 00000000 */  nop
/* 25A20 80037E00 05006010 */  beqz       $v1, .L80037E18
/* 25A24 80037E04 00000000 */   nop
/* 25A28 80037E08 00006290 */  lbu        $v0, 0x0($v1)
/* 25A2C 80037E0C 00000000 */  nop
/* 25A30 80037E10 04004010 */  beqz       $v0, .L80037E24
/* 25A34 80037E14 01000824 */   addiu     $t0, $zero, 0x1
.L80037E18:
/* 25A38 80037E18 F80880A7 */  sh         $zero, 0x8F8($gp) /* Failed to symbolize address 0x000008F8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25A3C 80037E1C CCE20008 */  j          .L80038B30
/* 25A40 80037E20 00000000 */   nop
.L80037E24:
/* 25A44 80037E24 01006290 */  lbu        $v0, 0x1($v1)
/* 25A48 80037E28 2C098387 */  lh         $v1, 0x92C($gp) /* Failed to symbolize address 0x0000092C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25A4C 80037E2C 2C098697 */  lhu        $a2, 0x92C($gp) /* Failed to symbolize address 0x0000092C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25A50 80037E30 E3004238 */  xori       $v0, $v0, 0xE3
/* 25A54 80037E34 0100442C */  sltiu      $a0, $v0, 0x1
/* 25A58 80037E38 4A006810 */  beq        $v1, $t0, .L80037F64
/* 25A5C 80037E3C 21988000 */   addu      $s3, $a0, $zero
/* 25A60 80037E40 02006228 */  slti       $v0, $v1, 0x2
/* 25A64 80037E44 05004010 */  beqz       $v0, .L80037E5C
/* 25A68 80037E48 02000224 */   addiu     $v0, $zero, 0x2
/* 25A6C 80037E4C 07006010 */  beqz       $v1, .L80037E6C
/* 25A70 80037E50 21106002 */   addu      $v0, $s3, $zero
/* 25A74 80037E54 BAE00008 */  j          .L800382E8
/* 25A78 80037E58 00000000 */   nop
.L80037E5C:
/* 25A7C 80037E5C AE006210 */  beq        $v1, $v0, .L80038118
/* 25A80 80037E60 21106002 */   addu      $v0, $s3, $zero
/* 25A84 80037E64 BAE00008 */  j          .L800382E8
/* 25A88 80037E68 00000000 */   nop
.L80037E6C:
/* 25A8C 80037E6C 00010524 */  addiu      $a1, $zero, 0x100
/* 25A90 80037E70 21808000 */  addu       $s0, $a0, $zero
/* 25A94 80037E74 80101000 */  sll        $v0, $s0, 2
/* 25A98 80037E78 0980033C */  lui        $v1, %hi(D_8008D2E0)
/* 25A9C 80037E7C E0D26324 */  addiu      $v1, $v1, %lo(D_8008D2E0)
/* 25AA0 80037E80 21104300 */  addu       $v0, $v0, $v1
/* 25AA4 80037E84 00004684 */  lh         $a2, 0x0($v0)
/* 25AA8 80037E88 0C09838F */  lw         $v1, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25AAC 80037E8C 00800224 */  addiu      $v0, $zero, -0x8000
/* 25AB0 80037E90 1000A8AF */  sw         $t0, 0x10($sp)
/* 25AB4 80037E94 1400A2AF */  sw         $v0, 0x14($sp)
/* 25AB8 80037E98 8808648C */  lw         $a0, 0x888($v1)
/* 25ABC 80037E9C CD8A000C */  jal        DECOMP_DecalFont_DrawMultiLine
/* 25AC0 80037EA0 CC010724 */   addiu     $a3, $zero, 0x1CC
/* 25AC4 80037EA4 0A80023C */  lui        $v0, %hi(D_8009A990)
/* 25AC8 80037EA8 10098387 */  lh         $v1, 0x910($gp) /* Failed to symbolize address 0x00000910 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25ACC 80037EAC 90A94224 */  addiu      $v0, $v0, %lo(D_8009A990)
/* 25AD0 80037EB0 80300300 */  sll        $a2, $v1, 2
/* 25AD4 80037EB4 2110C200 */  addu       $v0, $a2, $v0
/* 25AD8 80037EB8 0000428C */  lw         $v0, 0x0($v0)
/* 25ADC 80037EBC 00000000 */  nop
/* 25AE0 80037EC0 50004230 */  andi       $v0, $v0, 0x50
/* 25AE4 80037EC4 24004010 */  beqz       $v0, .L80037F58
/* 25AE8 80037EC8 00000000 */   nop
/* 25AEC 80037ECC 2C098297 */  lhu        $v0, 0x92C($gp) /* Failed to symbolize address 0x0000092C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25AF0 80037ED0 00000000 */  nop
/* 25AF4 80037ED4 01004224 */  addiu      $v0, $v0, 0x1
/* 25AF8 80037ED8 2C0982A7 */  sh         $v0, 0x92C($gp) /* Failed to symbolize address 0x0000092C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25AFC 80037EDC 10000012 */  beqz       $s0, .L80037F20
/* 25B00 80037EE0 2110C300 */   addu      $v0, $a2, $v1
/* 25B04 80037EE4 4403838F */  lw         $v1, 0x344($gp) /* Failed to symbolize address 0x00000344 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25B08 80037EE8 00110200 */  sll        $v0, $v0, 4
/* 25B0C 80037EEC 21186200 */  addu       $v1, $v1, $v0
/* 25B10 80037EF0 04000224 */  addiu      $v0, $zero, 0x4
/* 25B14 80037EF4 440062A0 */  sb         $v0, 0x44($v1)
/* 25B18 80037EF8 0880033C */  lui        $v1, %hi(D_800841FC)
/* 25B1C 80037EFC 10098487 */  lh         $a0, 0x910($gp) /* Failed to symbolize address 0x00000910 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25B20 80037F00 FC416324 */  addiu      $v1, $v1, %lo(D_800841FC)
/* 25B24 80037F04 40100400 */  sll        $v0, $a0, 1
/* 25B28 80037F08 21104400 */  addu       $v0, $v0, $a0
/* 25B2C 80037F0C 40100200 */  sll        $v0, $v0, 1
/* 25B30 80037F10 21104300 */  addu       $v0, $v0, $v1
/* 25B34 80037F14 80000324 */  addiu      $v1, $zero, 0x80
/* 25B38 80037F18 D4DF0008 */  j          .L80037F50
/* 25B3C 80037F1C 000043A4 */   sh        $v1, 0x0($v0)
.L80037F20:
/* 25B40 80037F20 0880053C */  lui        $a1, %hi(D_800841FC)
/* 25B44 80037F24 FC41A524 */  addiu      $a1, $a1, %lo(D_800841FC)
/* 25B48 80037F28 40200300 */  sll        $a0, $v1, 1
/* 25B4C 80037F2C 21208300 */  addu       $a0, $a0, $v1
/* 25B50 80037F30 4403838F */  lw         $v1, 0x344($gp) /* Failed to symbolize address 0x00000344 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25B54 80037F34 00110200 */  sll        $v0, $v0, 4
/* 25B58 80037F38 21186200 */  addu       $v1, $v1, $v0
/* 25B5C 80037F3C 2000628C */  lw         $v0, 0x20($v1)
/* 25B60 80037F40 40200400 */  sll        $a0, $a0, 1
/* 25B64 80037F44 04004290 */  lbu        $v0, 0x4($v0)
/* 25B68 80037F48 21208500 */  addu       $a0, $a0, $a1
/* 25B6C 80037F4C 000082A4 */  sh         $v0, 0x0($a0)
.L80037F50:
/* 25B70 80037F50 0119010C */  jal        DECOMP_RECTMENU_ClearInput
/* 25B74 80037F54 00000000 */   nop
.L80037F58:
/* 25B78 80037F58 840380AF */  sw         $zero, 0x384($gp) /* Failed to symbolize address 0x00000384 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25B7C 80037F5C BAE00008 */  j          .L800382E8
/* 25B80 80037F60 21106002 */   addu      $v0, $s3, $zero
.L80037F64:
/* 25B84 80037F64 0A80023C */  lui        $v0, %hi(D_8009A990)
/* 25B88 80037F68 90A94224 */  addiu      $v0, $v0, %lo(D_8009A990)
/* 25B8C 80037F6C 2110A200 */  addu       $v0, $a1, $v0
/* 25B90 80037F70 0000438C */  lw         $v1, 0x0($v0)
/* 25B94 80037F74 00000000 */  nop
/* 25B98 80037F78 05006230 */  andi       $v0, $v1, 0x5
/* 25B9C 80037F7C 0C004010 */  beqz       $v0, .L80037FB0
/* 25BA0 80037F80 0A006230 */   andi      $v0, $v1, 0xA
/* 25BA4 80037F84 FC088297 */  lhu        $v0, 0x8FC($gp) /* Failed to symbolize address 0x000008FC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25BA8 80037F88 00000000 */  nop
/* 25BAC 80037F8C FFFF4224 */  addiu      $v0, $v0, -0x1
/* 25BB0 80037F90 FC0882A7 */  sh         $v0, 0x8FC($gp) /* Failed to symbolize address 0x000008FC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25BB4 80037F94 00140200 */  sll        $v0, $v0, 16
/* 25BB8 80037F98 26004104 */  bgez       $v0, .L80038034
/* 25BBC 80037F9C 00010524 */   addiu     $a1, $zero, 0x100
/* 25BC0 80037FA0 03000224 */  addiu      $v0, $zero, 0x3
/* 25BC4 80037FA4 FC0882A7 */  sh         $v0, 0x8FC($gp) /* Failed to symbolize address 0x000008FC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25BC8 80037FA8 0EE00008 */  j          .L80038038
/* 25BCC 80037FAC 80801300 */   sll       $s0, $s3, 2
.L80037FB0:
/* 25BD0 80037FB0 0D004010 */  beqz       $v0, .L80037FE8
/* 25BD4 80037FB4 50006230 */   andi      $v0, $v1, 0x50
/* 25BD8 80037FB8 FC088297 */  lhu        $v0, 0x8FC($gp) /* Failed to symbolize address 0x000008FC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25BDC 80037FBC 00000000 */  nop
/* 25BE0 80037FC0 01004224 */  addiu      $v0, $v0, 0x1
/* 25BE4 80037FC4 FC0882A7 */  sh         $v0, 0x8FC($gp) /* Failed to symbolize address 0x000008FC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25BE8 80037FC8 00140200 */  sll        $v0, $v0, 16
/* 25BEC 80037FCC 03140200 */  sra        $v0, $v0, 16
/* 25BF0 80037FD0 04004228 */  slti       $v0, $v0, 0x4
/* 25BF4 80037FD4 17004014 */  bnez       $v0, .L80038034
/* 25BF8 80037FD8 00010524 */   addiu     $a1, $zero, 0x100
/* 25BFC 80037FDC FC0880A7 */  sh         $zero, 0x8FC($gp) /* Failed to symbolize address 0x000008FC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25C00 80037FE0 0EE00008 */  j          .L80038038
/* 25C04 80037FE4 80801300 */   sll       $s0, $s3, 2
.L80037FE8:
/* 25C08 80037FE8 11004010 */  beqz       $v0, .L80038030
/* 25C0C 80037FEC 0100C224 */   addiu     $v0, $a2, 0x1
/* 25C10 80037FF0 0880063C */  lui        $a2, %hi(D_800841FC)
/* 25C14 80037FF4 FC41C624 */  addiu      $a2, $a2, %lo(D_800841FC)
/* 25C18 80037FF8 40180700 */  sll        $v1, $a3, 1
/* 25C1C 80037FFC 21186700 */  addu       $v1, $v1, $a3
/* 25C20 80038000 40180300 */  sll        $v1, $v1, 1
/* 25C24 80038004 0880043C */  lui        $a0, %hi(D_80084258)
/* 25C28 80038008 FC088587 */  lh         $a1, 0x8FC($gp) /* Failed to symbolize address 0x000008FC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25C2C 8003800C 58428424 */  addiu      $a0, $a0, %lo(D_80084258)
/* 25C30 80038010 2C0982A7 */  sh         $v0, 0x92C($gp) /* Failed to symbolize address 0x0000092C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25C34 80038014 40100500 */  sll        $v0, $a1, 1
/* 25C38 80038018 21104500 */  addu       $v0, $v0, $a1
/* 25C3C 8003801C 40100200 */  sll        $v0, $v0, 1
/* 25C40 80038020 21104400 */  addu       $v0, $v0, $a0
/* 25C44 80038024 04004294 */  lhu        $v0, 0x4($v0)
/* 25C48 80038028 21186600 */  addu       $v1, $v1, $a2
/* 25C4C 8003802C 020062A4 */  sh         $v0, 0x2($v1)
.L80038030:
/* 25C50 80038030 00010524 */  addiu      $a1, $zero, 0x100
.L80038034:
/* 25C54 80038034 80801300 */  sll        $s0, $s3, 2
.L80038038:
/* 25C58 80038038 0980023C */  lui        $v0, %hi(D_8008D2E0)
/* 25C5C 8003803C E0D24224 */  addiu      $v0, $v0, %lo(D_8008D2E0)
/* 25C60 80038040 21100202 */  addu       $v0, $s0, $v0
/* 25C64 80038044 00004684 */  lh         $a2, 0x0($v0)
/* 25C68 80038048 01000224 */  addiu      $v0, $zero, 0x1
/* 25C6C 8003804C 1000A2AF */  sw         $v0, 0x10($sp)
/* 25C70 80038050 0C09828F */  lw         $v0, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25C74 80038054 00801224 */  addiu      $s2, $zero, -0x8000
/* 25C78 80038058 1400B2AF */  sw         $s2, 0x14($sp)
/* 25C7C 8003805C 8C08448C */  lw         $a0, 0x88C($v0)
/* 25C80 80038060 CD8A000C */  jal        DECOMP_DecalFont_DrawMultiLine
/* 25C84 80038064 CC010724 */   addiu     $a3, $zero, 0x1CC
/* 25C88 80038068 0880113C */  lui        $s1, %hi(D_80084258)
/* 25C8C 8003806C FC088387 */  lh         $v1, 0x8FC($gp) /* Failed to symbolize address 0x000008FC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25C90 80038070 58423126 */  addiu      $s1, $s1, %lo(D_80084258)
/* 25C94 80038074 40100300 */  sll        $v0, $v1, 1
/* 25C98 80038078 21104300 */  addu       $v0, $v0, $v1
/* 25C9C 8003807C 40100200 */  sll        $v0, $v0, 1
/* 25CA0 80038080 21105100 */  addu       $v0, $v0, $s1
/* 25CA4 80038084 0980033C */  lui        $v1, %hi(D_8008D2E8)
/* 25CA8 80038088 E8D26324 */  addiu      $v1, $v1, %lo(D_8008D2E8)
/* 25CAC 8003808C 21800302 */  addu       $s0, $s0, $v1
/* 25CB0 80038090 00004284 */  lh         $v0, 0x0($v0)
/* 25CB4 80038094 00000686 */  lh         $a2, 0x0($s0)
/* 25CB8 80038098 0C09838F */  lw         $v1, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25CBC 8003809C 00010524 */  addiu      $a1, $zero, 0x100
/* 25CC0 800380A0 1000B2AF */  sw         $s2, 0x10($sp)
/* 25CC4 800380A4 80100200 */  sll        $v0, $v0, 2
/* 25CC8 800380A8 21104300 */  addu       $v0, $v0, $v1
/* 25CCC 800380AC 0000448C */  lw         $a0, 0x0($v0)
/* 25CD0 800380B0 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 25CD4 800380B4 01000724 */   addiu     $a3, $zero, 0x1
/* 25CD8 800380B8 FC088387 */  lh         $v1, 0x8FC($gp) /* Failed to symbolize address 0x000008FC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25CDC 800380BC 00000586 */  lh         $a1, 0x0($s0)
/* 25CE0 800380C0 40100300 */  sll        $v0, $v1, 1
/* 25CE4 800380C4 21104300 */  addu       $v0, $v0, $v1
/* 25CE8 800380C8 40100200 */  sll        $v0, $v0, 1
/* 25CEC 800380CC 21105100 */  addu       $v0, $v0, $s1
/* 25CF0 800380D0 00004284 */  lh         $v0, 0x0($v0)
/* 25CF4 800380D4 0C09838F */  lw         $v1, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25CF8 800380D8 80100200 */  sll        $v0, $v0, 2
/* 25CFC 800380DC 21104300 */  addu       $v0, $v0, $v1
/* 25D00 800380E0 0000468C */  lw         $a2, 0x0($v0)
/* 25D04 800380E4 F0DE000C */  jal        DECOMP_MainFreeze_ConfigDrawArrows
/* 25D08 800380E8 00010424 */   addiu     $a0, $zero, 0x100
/* 25D0C 800380EC FC088387 */  lh         $v1, 0x8FC($gp) /* Failed to symbolize address 0x000008FC for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25D10 800380F0 00000000 */  nop
/* 25D14 800380F4 40100300 */  sll        $v0, $v1, 1
/* 25D18 800380F8 21104300 */  addu       $v0, $v0, $v1
/* 25D1C 800380FC 40100200 */  sll        $v0, $v0, 1
/* 25D20 80038100 21105100 */  addu       $v0, $v0, $s1
/* 25D24 80038104 02004284 */  lh         $v0, 0x2($v0)
/* 25D28 80038108 00000000 */  nop
/* 25D2C 8003810C 840382AF */  sw         $v0, 0x384($gp) /* Failed to symbolize address 0x00000384 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25D30 80038110 BAE00008 */  j          .L800382E8
/* 25D34 80038114 21106002 */   addu      $v0, $s3, $zero
.L80038118:
/* 25D38 80038118 0A80023C */  lui        $v0, %hi(D_8009A990)
/* 25D3C 8003811C 90A94224 */  addiu      $v0, $v0, %lo(D_8009A990)
/* 25D40 80038120 2110A200 */  addu       $v0, $a1, $v0
/* 25D44 80038124 0000438C */  lw         $v1, 0x0($v0)
/* 25D48 80038128 00000000 */  nop
/* 25D4C 8003812C 05006230 */  andi       $v0, $v1, 0x5
/* 25D50 80038130 11004010 */  beqz       $v0, .L80038178
/* 25D54 80038134 0A006230 */   andi      $v0, $v1, 0xA
/* 25D58 80038138 28098297 */  lhu        $v0, 0x928($gp) /* Failed to symbolize address 0x00000928 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25D5C 8003813C 00000000 */  nop
/* 25D60 80038140 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 25D64 80038144 280982A7 */  sh         $v0, 0x928($gp) /* Failed to symbolize address 0x00000928 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25D68 80038148 00140200 */  sll        $v0, $v0, 16
/* 25D6C 8003814C 2F004104 */  bgez       $v0, .L8003820C
/* 25D70 80038150 00010524 */   addiu     $a1, $zero, 0x100
/* 25D74 80038154 0880023C */  lui        $v0, %hi(D_80084290)
/* 25D78 80038158 90424224 */  addiu      $v0, $v0, %lo(D_80084290)
/* 25D7C 8003815C 40180400 */  sll        $v1, $a0, 1
/* 25D80 80038160 21186200 */  addu       $v1, $v1, $v0
/* 25D84 80038164 00006294 */  lhu        $v0, 0x0($v1)
/* 25D88 80038168 00000000 */  nop
/* 25D8C 8003816C 280982A7 */  sh         $v0, 0x928($gp) /* Failed to symbolize address 0x00000928 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25D90 80038170 84E00008 */  j          .L80038210
/* 25D94 80038174 0880113C */   lui       $s1, %hi(D_80084270)
.L80038178:
/* 25D98 80038178 10004010 */  beqz       $v0, .L800381BC
/* 25D9C 8003817C 40200400 */   sll       $a0, $a0, 1
/* 25DA0 80038180 0880033C */  lui        $v1, %hi(D_80084290)
/* 25DA4 80038184 90426324 */  addiu      $v1, $v1, %lo(D_80084290)
/* 25DA8 80038188 21208300 */  addu       $a0, $a0, $v1
/* 25DAC 8003818C 28098297 */  lhu        $v0, 0x928($gp) /* Failed to symbolize address 0x00000928 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25DB0 80038190 00008384 */  lh         $v1, 0x0($a0)
/* 25DB4 80038194 01004224 */  addiu      $v0, $v0, 0x1
/* 25DB8 80038198 280982A7 */  sh         $v0, 0x928($gp) /* Failed to symbolize address 0x00000928 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25DBC 8003819C 00140200 */  sll        $v0, $v0, 16
/* 25DC0 800381A0 03140200 */  sra        $v0, $v0, 16
/* 25DC4 800381A4 2A186200 */  slt        $v1, $v1, $v0
/* 25DC8 800381A8 17006010 */  beqz       $v1, .L80038208
/* 25DCC 800381AC 00010524 */   addiu     $a1, $zero, 0x100
/* 25DD0 800381B0 280980A7 */  sh         $zero, 0x928($gp) /* Failed to symbolize address 0x00000928 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25DD4 800381B4 84E00008 */  j          .L80038210
/* 25DD8 800381B8 0880113C */   lui       $s1, %hi(D_80084270)
.L800381BC:
/* 25DDC 800381BC 50006230 */  andi       $v0, $v1, 0x50
/* 25DE0 800381C0 11004010 */  beqz       $v0, .L80038208
/* 25DE4 800381C4 0880063C */   lui       $a2, %hi(D_800841FC)
/* 25DE8 800381C8 FC41C624 */  addiu      $a2, $a2, %lo(D_800841FC)
/* 25DEC 800381CC 40180700 */  sll        $v1, $a3, 1
/* 25DF0 800381D0 21186700 */  addu       $v1, $v1, $a3
/* 25DF4 800381D4 40180300 */  sll        $v1, $v1, 1
/* 25DF8 800381D8 0880043C */  lui        $a0, %hi(D_80084270)
/* 25DFC 800381DC 28098587 */  lh         $a1, 0x928($gp) /* Failed to symbolize address 0x00000928 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25E00 800381E0 70428424 */  addiu      $a0, $a0, %lo(D_80084270)
/* 25E04 800381E4 40100500 */  sll        $v0, $a1, 1
/* 25E08 800381E8 21104500 */  addu       $v0, $v0, $a1
/* 25E0C 800381EC 40100200 */  sll        $v0, $v0, 1
/* 25E10 800381F0 21104400 */  addu       $v0, $v0, $a0
/* 25E14 800381F4 04004294 */  lhu        $v0, 0x4($v0)
/* 25E18 800381F8 21186600 */  addu       $v1, $v1, $a2
/* 25E1C 800381FC F80880A7 */  sh         $zero, 0x8F8($gp) /* Failed to symbolize address 0x000008F8 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25E20 80038200 0119010C */  jal        DECOMP_RECTMENU_ClearInput
/* 25E24 80038204 040062A4 */   sh        $v0, 0x4($v1)
.L80038208:
/* 25E28 80038208 00010524 */  addiu      $a1, $zero, 0x100
.L8003820C:
/* 25E2C 8003820C 0880113C */  lui        $s1, %hi(D_80084270)
.L80038210:
/* 25E30 80038210 70423126 */  addiu      $s1, $s1, %lo(D_80084270)
/* 25E34 80038214 28098387 */  lh         $v1, 0x928($gp) /* Failed to symbolize address 0x00000928 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25E38 80038218 80801300 */  sll        $s0, $s3, 2
/* 25E3C 8003821C 40100300 */  sll        $v0, $v1, 1
/* 25E40 80038220 21104300 */  addu       $v0, $v0, $v1
/* 25E44 80038224 40100200 */  sll        $v0, $v0, 1
/* 25E48 80038228 21105100 */  addu       $v0, $v0, $s1
/* 25E4C 8003822C 0980033C */  lui        $v1, %hi(D_8008D2E0)
/* 25E50 80038230 E0D26324 */  addiu      $v1, $v1, %lo(D_8008D2E0)
/* 25E54 80038234 21180302 */  addu       $v1, $s0, $v1
/* 25E58 80038238 02004884 */  lh         $t0, 0x2($v0)
/* 25E5C 8003823C 00006684 */  lh         $a2, 0x0($v1)
/* 25E60 80038240 01000224 */  addiu      $v0, $zero, 0x1
/* 25E64 80038244 1000A2AF */  sw         $v0, 0x10($sp)
/* 25E68 80038248 0C09828F */  lw         $v0, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25E6C 8003824C 00801224 */  addiu      $s2, $zero, -0x8000
/* 25E70 80038250 1400B2AF */  sw         $s2, 0x14($sp)
/* 25E74 80038254 A008448C */  lw         $a0, 0x8A0($v0)
/* 25E78 80038258 840388AF */  sw         $t0, 0x384($gp) /* Failed to symbolize address 0x00000384 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25E7C 8003825C CD8A000C */  jal        DECOMP_DecalFont_DrawMultiLine
/* 25E80 80038260 CC010724 */   addiu     $a3, $zero, 0x1CC
/* 25E84 80038264 28098387 */  lh         $v1, 0x928($gp) /* Failed to symbolize address 0x00000928 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25E88 80038268 00000000 */  nop
/* 25E8C 8003826C 40100300 */  sll        $v0, $v1, 1
/* 25E90 80038270 21104300 */  addu       $v0, $v0, $v1
/* 25E94 80038274 40100200 */  sll        $v0, $v0, 1
/* 25E98 80038278 21105100 */  addu       $v0, $v0, $s1
/* 25E9C 8003827C 0980033C */  lui        $v1, %hi(D_8008D2E8)
/* 25EA0 80038280 E8D26324 */  addiu      $v1, $v1, %lo(D_8008D2E8)
/* 25EA4 80038284 21800302 */  addu       $s0, $s0, $v1
/* 25EA8 80038288 00004284 */  lh         $v0, 0x0($v0)
/* 25EAC 8003828C 00000686 */  lh         $a2, 0x0($s0)
/* 25EB0 80038290 0C09838F */  lw         $v1, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25EB4 80038294 00010524 */  addiu      $a1, $zero, 0x100
/* 25EB8 80038298 1000B2AF */  sw         $s2, 0x10($sp)
/* 25EBC 8003829C 80100200 */  sll        $v0, $v0, 2
/* 25EC0 800382A0 21104300 */  addu       $v0, $v0, $v1
/* 25EC4 800382A4 0000448C */  lw         $a0, 0x0($v0)
/* 25EC8 800382A8 1E8A000C */  jal        DECOMP_DecalFont_DrawLine
/* 25ECC 800382AC 01000724 */   addiu     $a3, $zero, 0x1
/* 25ED0 800382B0 28098387 */  lh         $v1, 0x928($gp) /* Failed to symbolize address 0x00000928 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25ED4 800382B4 00000586 */  lh         $a1, 0x0($s0)
/* 25ED8 800382B8 40100300 */  sll        $v0, $v1, 1
/* 25EDC 800382BC 21104300 */  addu       $v0, $v0, $v1
/* 25EE0 800382C0 40100200 */  sll        $v0, $v0, 1
/* 25EE4 800382C4 21105100 */  addu       $v0, $v0, $s1
/* 25EE8 800382C8 00004284 */  lh         $v0, 0x0($v0)
/* 25EEC 800382CC 0C09838F */  lw         $v1, 0x90C($gp) /* Failed to symbolize address 0x0000090C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25EF0 800382D0 80100200 */  sll        $v0, $v0, 2
/* 25EF4 800382D4 21104300 */  addu       $v0, $v0, $v1
/* 25EF8 800382D8 0000468C */  lw         $a2, 0x0($v0)
/* 25EFC 800382DC F0DE000C */  jal        DECOMP_MainFreeze_ConfigDrawArrows
/* 25F00 800382E0 00010424 */   addiu     $a0, $zero, 0x100
/* 25F04 800382E4 21106002 */  addu       $v0, $s3, $zero
.L800382E8:
/* 25F08 800382E8 AC004014 */  bnez       $v0, .L8003859C
/* 25F0C 800382EC 21980000 */   addu      $s3, $zero, $zero
/* 25F10 800382F0 21800000 */  addu       $s0, $zero, $zero
/* 25F14 800382F4 8403918F */  lw         $s1, 0x384($gp) /* Failed to symbolize address 0x00000384 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25F18 800382F8 0880033C */  lui        $v1, %hi(D_800845A0)
/* 25F1C 800382FC A0456324 */  addiu      $v1, $v1, %lo(D_800845A0)
/* 25F20 80038300 FF032232 */  andi       $v0, $s1, 0x3FF
/* 25F24 80038304 80100200 */  sll        $v0, $v0, 2
/* 25F28 80038308 21904300 */  addu       $s2, $v0, $v1
.L8003830C:
/* 25F2C 8003830C 0000438E */  lw         $v1, 0x0($s2)
/* 25F30 80038310 00042232 */  andi       $v0, $s1, 0x400
/* 25F34 80038314 02004014 */  bnez       $v0, .L80038320
/* 25F38 80038318 00082232 */   andi      $v0, $s1, 0x800
/* 25F3C 8003831C 001C0300 */  sll        $v1, $v1, 16
.L80038320:
/* 25F40 80038320 02004010 */  beqz       $v0, .L8003832C
/* 25F44 80038324 031C0300 */   sra       $v1, $v1, 16
/* 25F48 80038328 23180300 */  negu       $v1, $v1
.L8003832C:
/* 25F4C 8003832C 00241000 */  sll        $a0, $s0, 16
/* 25F50 80038330 03240400 */  sra        $a0, $a0, 16
/* 25F54 80038334 FFFF8224 */  addiu      $v0, $a0, -0x1
/* 25F58 80038338 40110200 */  sll        $v0, $v0, 5
/* 25F5C 8003833C 18006200 */  mult       $v1, $v0
/* 25F60 80038340 4003838F */  lw         $v1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25F64 80038344 FF000224 */  addiu      $v0, $zero, 0xFF
/* 25F68 80038348 1400A2AF */  sw         $v0, 0x14($sp)
/* 25F6C 8003834C 6C03828F */  lw         $v0, 0x36C($gp) /* Failed to symbolize address 0x0000036C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25F70 80038350 1000A0AF */  sw         $zero, 0x10($sp)
/* 25F74 80038354 1800A0AF */  sw         $zero, 0x18($sp)
/* 25F78 80038358 7C14688C */  lw         $t0, 0x147C($v1)
/* 25F7C 8003835C 12500000 */  mflo       $t2
/* 25F80 80038360 031B0A00 */  sra        $v1, $t2, 12
/* 25F84 80038364 20006324 */  addiu      $v1, $v1, 0x20
/* 25F88 80038368 21104300 */  addu       $v0, $v0, $v1
/* 25F8C 8003836C 00140200 */  sll        $v0, $v0, 16
/* 25F90 80038370 033C0200 */  sra        $a3, $v0, 16
/* 25F94 80038374 01000224 */  addiu      $v0, $zero, 0x1
/* 25F98 80038378 05008210 */  beq        $a0, $v0, .L80038390
/* 25F9C 8003837C 2128E000 */   addu      $a1, $a3, $zero
/* 25FA0 80038380 00060224 */  addiu      $v0, $zero, 0x600
/* 25FA4 80038384 02002216 */  bne        $s1, $v0, .L80038390
/* 25FA8 80038388 00000000 */   nop
/* 25FAC 8003838C 0C000825 */  addiu      $t0, $t0, 0xC
.L80038390:
/* 25FB0 80038390 4003828F */  lw         $v0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 25FB4 80038394 E2000424 */  addiu      $a0, $zero, 0xE2
/* 25FB8 80038398 1C00A8AF */  sw         $t0, 0x1C($sp)
/* 25FBC 8003839C 1000428C */  lw         $v0, 0x10($v0)
/* 25FC0 800383A0 1E010624 */  addiu      $a2, $zero, 0x11E
/* 25FC4 800383A4 74004224 */  addiu      $v0, $v0, 0x74
/* 25FC8 800383A8 4085000C */  jal        DECOMP_CTR_Box_DrawWirePrims
/* 25FCC 800383AC 2000A2AF */   sw        $v0, 0x20($sp)
/* 25FD0 800383B0 01000226 */  addiu      $v0, $s0, 0x1
/* 25FD4 800383B4 21804000 */  addu       $s0, $v0, $zero
/* 25FD8 800383B8 00140200 */  sll        $v0, $v0, 16
/* 25FDC 800383BC 03140200 */  sra        $v0, $v0, 16
/* 25FE0 800383C0 03004228 */  slti       $v0, $v0, 0x3
/* 25FE4 800383C4 D1FF4014 */  bnez       $v0, .L8003830C
/* 25FE8 800383C8 0880023C */   lui       $v0, %hi(D_800845A0)
/* 25FEC 800383CC 21800000 */  addu       $s0, $zero, $zero
/* 25FF0 800383D0 A0455324 */  addiu      $s3, $v0, %lo(D_800845A0)
/* 25FF4 800383D4 2800B227 */  addiu      $s2, $sp, 0x28
/* 25FF8 800383D8 00141000 */  sll        $v0, $s0, 16
.L800383DC:
/* 25FFC 800383DC 0980033C */  lui        $v1, %hi(D_8008D970)
/* 26000 800383E0 70D96384 */  lh         $v1, %lo(D_8008D970)($v1)
/* 26004 800383E4 43110200 */  sra        $v0, $v0, 5
/* 26008 800383E8 80190300 */  sll        $v1, $v1, 6
/* 2600C 800383EC 21186200 */  addu       $v1, $v1, $v0
/* 26010 800383F0 C0036230 */  andi       $v0, $v1, 0x3C0
/* 26014 800383F4 80100200 */  sll        $v0, $v0, 2
/* 26018 800383F8 21105300 */  addu       $v0, $v0, $s3
/* 2601C 800383FC 0000448C */  lw         $a0, 0x0($v0)
/* 26020 80038400 00046230 */  andi       $v0, $v1, 0x400
/* 26024 80038404 02004014 */  bnez       $v0, .L80038410
/* 26028 80038408 00086230 */   andi      $v0, $v1, 0x800
/* 2602C 8003840C 00240400 */  sll        $a0, $a0, 16
.L80038410:
/* 26030 80038410 02004010 */  beqz       $v0, .L8003841C
/* 26034 80038414 03240400 */   sra       $a0, $a0, 16
/* 26038 80038418 23200400 */  negu       $a0, $a0
.L8003841C:
/* 2603C 8003841C 18002402 */  mult       $s1, $a0
/* 26040 80038420 12500000 */  mflo       $t2
/* 26044 80038424 031B0A00 */  sra        $v1, $t2, 12
/* 26048 80038428 FF036230 */  andi       $v0, $v1, 0x3FF
/* 2604C 8003842C 80100200 */  sll        $v0, $v0, 2
/* 26050 80038430 21105300 */  addu       $v0, $v0, $s3
/* 26054 80038434 0000448C */  lw         $a0, 0x0($v0)
/* 26058 80038438 00046230 */  andi       $v0, $v1, 0x400
/* 2605C 8003843C 02004014 */  bnez       $v0, .L80038448
/* 26060 80038440 00086230 */   andi      $v0, $v1, 0x800
/* 26064 80038444 00240400 */  sll        $a0, $a0, 16
.L80038448:
/* 26068 80038448 02004010 */  beqz       $v0, .L80038454
/* 2606C 8003844C 03240400 */   sra       $a0, $a0, 16
/* 26070 80038450 23200400 */  negu       $a0, $a0
.L80038454:
/* 26074 80038454 21280000 */  addu       $a1, $zero, $zero
/* 26078 80038458 0880023C */  lui        $v0, %hi(D_80084294)
/* 2607C 8003845C 94424924 */  addiu      $t1, $v0, %lo(D_80084294)
/* 26080 80038460 00141000 */  sll        $v0, $s0, 16
/* 26084 80038464 03340200 */  sra        $a2, $v0, 16
/* 26088 80038468 40100600 */  sll        $v0, $a2, 1
/* 2608C 8003846C 21104600 */  addu       $v0, $v0, $a2
/* 26090 80038470 80380200 */  sll        $a3, $v0, 2
/* 26094 80038474 40110400 */  sll        $v0, $a0, 5
/* 26098 80038478 03130200 */  sra        $v0, $v0, 12
/* 2609C 8003847C 6C038397 */  lhu        $v1, 0x36C($gp) /* Failed to symbolize address 0x0000036C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 260A0 80038480 20004224 */  addiu      $v0, $v0, 0x20
/* 260A4 80038484 21406200 */  addu       $t0, $v1, $v0
.L80038488:
/* 260A8 80038488 00140500 */  sll        $v0, $a1, 16
/* 260AC 8003848C 83130200 */  sra        $v0, $v0, 14
/* 260B0 80038490 21184202 */  addu       $v1, $s2, $v0
/* 260B4 80038494 21104700 */  addu       $v0, $v0, $a3
/* 260B8 80038498 21104900 */  addu       $v0, $v0, $t1
/* 260BC 8003849C 00004284 */  lh         $v0, 0x0($v0)
/* 260C0 800384A0 0300C010 */  beqz       $a2, .L800384B0
/* 260C4 800384A4 00000000 */   nop
/* 260C8 800384A8 2DE10008 */  j          .L800384B4
/* 260CC 800384AC EC004224 */   addiu     $v0, $v0, 0xEC
.L800384B0:
/* 260D0 800384B0 14014224 */  addiu      $v0, $v0, 0x114
.L800384B4:
/* 260D4 800384B4 000062A4 */  sh         $v0, 0x0($v1)
/* 260D8 800384B8 001C0500 */  sll        $v1, $a1, 16
/* 260DC 800384BC 0100A424 */  addiu      $a0, $a1, 0x1
/* 260E0 800384C0 21288000 */  addu       $a1, $a0, $zero
/* 260E4 800384C4 831B0300 */  sra        $v1, $v1, 14
/* 260E8 800384C8 21106700 */  addu       $v0, $v1, $a3
/* 260EC 800384CC 21104900 */  addu       $v0, $v0, $t1
/* 260F0 800384D0 21184302 */  addu       $v1, $s2, $v1
/* 260F4 800384D4 00240400 */  sll        $a0, $a0, 16
/* 260F8 800384D8 03240400 */  sra        $a0, $a0, 16
/* 260FC 800384DC 02004294 */  lhu        $v0, 0x2($v0)
/* 26100 800384E0 03008428 */  slti       $a0, $a0, 0x3
/* 26104 800384E4 21100201 */  addu       $v0, $t0, $v0
/* 26108 800384E8 E7FF8014 */  bnez       $a0, .L80038488
/* 2610C 800384EC 020062A4 */   sh        $v0, 0x2($v1)
/* 26110 800384F0 2800A427 */  addiu      $a0, $sp, 0x28
/* 26114 800384F4 0880053C */  lui        $a1, %hi(D_800842AC)
/* 26118 800384F8 4003828F */  lw         $v0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2611C 800384FC AC42A524 */  addiu      $a1, $a1, %lo(D_800842AC)
/* 26120 80038500 1000478C */  lw         $a3, 0x10($v0)
/* 26124 80038504 7C14468C */  lw         $a2, 0x147C($v0)
/* 26128 80038508 FA14010C */  jal        DECOMP_RECTMENU_DrawRwdTriangle
/* 2612C 8003850C 7400E724 */   addiu     $a3, $a3, 0x74
/* 26130 80038510 01000226 */  addiu      $v0, $s0, 0x1
/* 26134 80038514 21804000 */  addu       $s0, $v0, $zero
/* 26138 80038518 00140200 */  sll        $v0, $v0, 16
/* 2613C 8003851C 03140200 */  sra        $v0, $v0, 16
/* 26140 80038520 02004228 */  slti       $v0, $v0, 0x2
/* 26144 80038524 ADFF4014 */  bnez       $v0, .L800383DC
/* 26148 80038528 00141000 */   sll       $v0, $s0, 16
/* 2614C 8003852C 3800A427 */  addiu      $a0, $sp, 0x38
/* 26150 80038530 0880053C */  lui        $a1, %hi(D_800842B8)
/* 26154 80038534 B842A524 */  addiu      $a1, $a1, %lo(D_800842B8)
/* 26158 80038538 6C038697 */  lhu        $a2, 0x36C($gp) /* Failed to symbolize address 0x0000036C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2615C 8003853C 4003838F */  lw         $v1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26160 80038540 EC000224 */  addiu      $v0, $zero, 0xEC
/* 26164 80038544 3800A2A7 */  sh         $v0, 0x38($sp)
/* 26168 80038548 28000224 */  addiu      $v0, $zero, 0x28
/* 2616C 8003854C 3C00A2A7 */  sh         $v0, 0x3C($sp)
/* 26170 80038550 41000224 */  addiu      $v0, $zero, 0x41
/* 26174 80038554 3E00A2A7 */  sh         $v0, 0x3E($sp)
/* 26178 80038558 3A00A6A7 */  sh         $a2, 0x3A($sp)
/* 2617C 8003855C 1000678C */  lw         $a3, 0x10($v1)
/* 26180 80038560 7C14668C */  lw         $a2, 0x147C($v1)
/* 26184 80038564 9514010C */  jal        DECOMP_RECTMENU_DrawRwdBlueRect
/* 26188 80038568 7400E724 */   addiu     $a3, $a3, 0x74
/* 2618C 8003856C 4000A427 */  addiu      $a0, $sp, 0x40
/* 26190 80038570 ECFF0224 */  addiu      $v0, $zero, -0x14
/* 26194 80038574 4000A2A7 */  sh         $v0, 0x40($sp)
/* 26198 80038578 28020224 */  addiu      $v0, $zero, 0x228
/* 2619C 8003857C 4400A2A7 */  sh         $v0, 0x44($sp)
/* 261A0 80038580 91000224 */  addiu      $v0, $zero, 0x91
/* 261A4 80038584 4600A2A7 */  sh         $v0, 0x46($sp)
/* 261A8 80038588 6C038297 */  lhu        $v0, 0x36C($gp) /* Failed to symbolize address 0x0000036C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 261AC 8003858C 4003838F */  lw         $v1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 261B0 80038590 ECFF4224 */  addiu      $v0, $v0, -0x14
/* 261B4 80038594 C9E20008 */  j          .L80038B24
/* 261B8 80038598 4200A2A7 */   sh        $v0, 0x42($sp)
.L8003859C:
/* 261BC 8003859C 0880023C */  lui        $v0, %hi(D_800845A0)
/* 261C0 800385A0 A0455624 */  addiu      $s6, $v0, %lo(D_800845A0)
/* 261C4 800385A4 6666123C */  lui        $s2, (0x66666667 >> 16)
/* 261C8 800385A8 8403948F */  lw         $s4, 0x384($gp) /* Failed to symbolize address 0x00000384 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 261CC 800385AC 67665236 */  ori        $s2, $s2, (0x66666667 & 0xFFFF)
/* 261D0 800385B0 23101400 */  negu       $v0, $s4
/* 261D4 800385B4 00FC4224 */  addiu      $v0, $v0, -0x400
/* 261D8 800385B8 FF0F5530 */  andi       $s5, $v0, 0xFFF
/* 261DC 800385BC 00141300 */  sll        $v0, $s3, 16
.L800385C0:
/* 261E0 800385C0 03004014 */  bnez       $v0, .L800385D0
/* 261E4 800385C4 00FC8226 */   addiu     $v0, $s4, -0x400
/* 261E8 800385C8 75E10008 */  j          .L800385D4
/* 261EC 800385CC 2118A002 */   addu      $v1, $s5, $zero
.L800385D0:
/* 261F0 800385D0 FF0F4330 */  andi       $v1, $v0, 0xFFF
.L800385D4:
/* 261F4 800385D4 FF036230 */  andi       $v0, $v1, 0x3FF
/* 261F8 800385D8 80100200 */  sll        $v0, $v0, 2
/* 261FC 800385DC 21105600 */  addu       $v0, $v0, $s6
/* 26200 800385E0 0000508C */  lw         $s0, 0x0($v0)
/* 26204 800385E4 00046230 */  andi       $v0, $v1, 0x400
/* 26208 800385E8 07004010 */  beqz       $v0, .L80038608
/* 2620C 800385EC 00141000 */   sll       $v0, $s0, 16
/* 26210 800385F0 038C0200 */  sra        $s1, $v0, 16
/* 26214 800385F4 00086230 */  andi       $v0, $v1, 0x800
/* 26218 800385F8 09004014 */  bnez       $v0, .L80038620
/* 2621C 800385FC 03841000 */   sra       $s0, $s0, 16
/* 26220 80038600 89E10008 */  j          .L80038624
/* 26224 80038604 23881100 */   negu      $s1, $s1
.L80038608:
/* 26228 80038608 038C1000 */  sra        $s1, $s0, 16
/* 2622C 8003860C 00841000 */  sll        $s0, $s0, 16
/* 26230 80038610 00086230 */  andi       $v0, $v1, 0x800
/* 26234 80038614 03004010 */  beqz       $v0, .L80038624
/* 26238 80038618 03841000 */   sra       $s0, $s0, 16
/* 2623C 8003861C 23881100 */  negu       $s1, $s1
.L80038620:
/* 26240 80038620 23801000 */  negu       $s0, $s0
.L80038624:
/* 26244 80038624 FF000224 */  addiu      $v0, $zero, 0xFF
/* 26248 80038628 40281000 */  sll        $a1, $s0, 1
/* 2624C 8003862C 2128B000 */  addu       $a1, $a1, $s0
/* 26250 80038630 C0280500 */  sll        $a1, $a1, 3
/* 26254 80038634 2128B000 */  addu       $a1, $a1, $s0
/* 26258 80038638 40280500 */  sll        $a1, $a1, 1
/* 2625C 8003863C 032B0500 */  sra        $a1, $a1, 12
/* 26260 80038640 40181100 */  sll        $v1, $s1, 1
/* 26264 80038644 21187100 */  addu       $v1, $v1, $s1
/* 26268 80038648 C0180300 */  sll        $v1, $v1, 3
/* 2626C 8003864C 21187100 */  addu       $v1, $v1, $s1
/* 26270 80038650 00190300 */  sll        $v1, $v1, 4
/* 26274 80038654 C0401100 */  sll        $t0, $s1, 3
/* 26278 80038658 21401101 */  addu       $t0, $t0, $s1
/* 2627C 8003865C 80400800 */  sll        $t0, $t0, 2
/* 26280 80038660 23401101 */  subu       $t0, $t0, $s1
/* 26284 80038664 C0400800 */  sll        $t0, $t0, 3
/* 26288 80038668 18007200 */  mult       $v1, $s2
/* 2628C 8003866C 70038797 */  lhu        $a3, 0x370($gp) /* Failed to symbolize address 0x00000370 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26290 80038670 4003848F */  lw         $a0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26294 80038674 C31F0300 */  sra        $v1, $v1, 31
/* 26298 80038678 1000A0AF */  sw         $zero, 0x10($sp)
/* 2629C 8003867C 1400A2AF */  sw         $v0, 0x14($sp)
/* 262A0 80038680 1800A0AF */  sw         $zero, 0x18($sp)
/* 262A4 80038684 2128E500 */  addu       $a1, $a3, $a1
/* 262A8 80038688 002C0500 */  sll        $a1, $a1, 16
/* 262AC 8003868C 7C14828C */  lw         $v0, 0x147C($a0)
/* 262B0 80038690 032C0500 */  sra        $a1, $a1, 16
/* 262B4 80038694 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 262B8 80038698 C0101000 */  sll        $v0, $s0, 3
/* 262BC 8003869C 21105000 */  addu       $v0, $v0, $s0
/* 262C0 800386A0 80100200 */  sll        $v0, $v0, 2
/* 262C4 800386A4 23105000 */  subu       $v0, $v0, $s0
/* 262C8 800386A8 10300000 */  mfhi       $a2
/* 262CC 800386AC 03130200 */  sra        $v0, $v0, 12
/* 262D0 800386B0 2138E200 */  addu       $a3, $a3, $v0
/* 262D4 800386B4 18001201 */  mult       $t0, $s2
/* 262D8 800386B8 003C0700 */  sll        $a3, $a3, 16
/* 262DC 800386BC 1000828C */  lw         $v0, 0x10($a0)
/* 262E0 800386C0 033C0700 */  sra        $a3, $a3, 16
/* 262E4 800386C4 74004224 */  addiu      $v0, $v0, 0x74
/* 262E8 800386C8 2000A2AF */  sw         $v0, 0x20($sp)
/* 262EC 800386CC 43230600 */  sra        $a0, $a2, 13
/* 262F0 800386D0 23208300 */  subu       $a0, $a0, $v1
/* 262F4 800386D4 00018424 */  addiu      $a0, $a0, 0x100
/* 262F8 800386D8 00240400 */  sll        $a0, $a0, 16
/* 262FC 800386DC 03240400 */  sra        $a0, $a0, 16
/* 26300 800386E0 C3470800 */  sra        $t0, $t0, 31
/* 26304 800386E4 10480000 */  mfhi       $t1
/* 26308 800386E8 43330900 */  sra        $a2, $t1, 13
/* 2630C 800386EC 2330C800 */  subu       $a2, $a2, $t0
/* 26310 800386F0 0001C624 */  addiu      $a2, $a2, 0x100
/* 26314 800386F4 00340600 */  sll        $a2, $a2, 16
/* 26318 800386F8 4085000C */  jal        DECOMP_CTR_Box_DrawWirePrims
/* 2631C 800386FC 03340600 */   sra       $a2, $a2, 16
/* 26320 80038700 01006226 */  addiu      $v0, $s3, 0x1
/* 26324 80038704 21984000 */  addu       $s3, $v0, $zero
/* 26328 80038708 00140200 */  sll        $v0, $v0, 16
/* 2632C 8003870C 03140200 */  sra        $v0, $v0, 16
/* 26330 80038710 02004228 */  slti       $v0, $v0, 0x2
/* 26334 80038714 AAFF4014 */  bnez       $v0, .L800385C0
/* 26338 80038718 00141300 */   sll       $v0, $s3, 16
/* 2633C 8003871C 0880033C */  lui        $v1, %hi(D_800845A0)
/* 26340 80038720 0980023C */  lui        $v0, %hi(D_8008D970)
/* 26344 80038724 70D94284 */  lh         $v0, %lo(D_8008D970)($v0)
/* 26348 80038728 A0456324 */  addiu      $v1, $v1, %lo(D_800845A0)
/* 2634C 8003872C 80210200 */  sll        $a0, $v0, 6
/* 26350 80038730 C0038230 */  andi       $v0, $a0, 0x3C0
/* 26354 80038734 80100200 */  sll        $v0, $v0, 2
/* 26358 80038738 21104300 */  addu       $v0, $v0, $v1
/* 2635C 8003873C 0000508C */  lw         $s0, 0x0($v0)
/* 26360 80038740 00048230 */  andi       $v0, $a0, 0x400
/* 26364 80038744 02004014 */  bnez       $v0, .L80038750
/* 26368 80038748 00088230 */   andi      $v0, $a0, 0x800
/* 2636C 8003874C 00841000 */  sll        $s0, $s0, 16
.L80038750:
/* 26370 80038750 02004010 */  beqz       $v0, .L8003875C
/* 26374 80038754 03841000 */   sra       $s0, $s0, 16
/* 26378 80038758 23801000 */  negu       $s0, $s0
.L8003875C:
/* 2637C 8003875C 18001402 */  mult       $s0, $s4
/* 26380 80038760 0880033C */  lui        $v1, %hi(D_800845A0)
/* 26384 80038764 A0456324 */  addiu      $v1, $v1, %lo(D_800845A0)
/* 26388 80038768 12500000 */  mflo       $t2
/* 2638C 8003876C 03130A00 */  sra        $v0, $t2, 12
/* 26390 80038770 00FC4424 */  addiu      $a0, $v0, -0x400
/* 26394 80038774 FF038230 */  andi       $v0, $a0, 0x3FF
/* 26398 80038778 80100200 */  sll        $v0, $v0, 2
/* 2639C 8003877C 21104300 */  addu       $v0, $v0, $v1
/* 263A0 80038780 0000508C */  lw         $s0, 0x0($v0)
/* 263A4 80038784 00048230 */  andi       $v0, $a0, 0x400
/* 263A8 80038788 08004010 */  beqz       $v0, .L800387AC
/* 263AC 8003878C FF0F9530 */   andi      $s5, $a0, 0xFFF
/* 263B0 80038790 00141000 */  sll        $v0, $s0, 16
/* 263B4 80038794 038C0200 */  sra        $s1, $v0, 16
/* 263B8 80038798 00088230 */  andi       $v0, $a0, 0x800
/* 263BC 8003879C 09004014 */  bnez       $v0, .L800387C4
/* 263C0 800387A0 03841000 */   sra       $s0, $s0, 16
/* 263C4 800387A4 F2E10008 */  j          .L800387C8
/* 263C8 800387A8 23881100 */   negu      $s1, $s1
.L800387AC:
/* 263CC 800387AC 038C1000 */  sra        $s1, $s0, 16
/* 263D0 800387B0 00841000 */  sll        $s0, $s0, 16
/* 263D4 800387B4 00088230 */  andi       $v0, $a0, 0x800
/* 263D8 800387B8 03004010 */  beqz       $v0, .L800387C8
/* 263DC 800387BC 03841000 */   sra       $s0, $s0, 16
/* 263E0 800387C0 23881100 */  negu       $s1, $s1
.L800387C4:
/* 263E4 800387C4 23801000 */  negu       $s0, $s0
.L800387C8:
/* 263E8 800387C8 0880023C */  lui        $v0, %hi(D_800842DC)
/* 263EC 800387CC DC425624 */  addiu      $s6, $v0, %lo(D_800842DC)
/* 263F0 800387D0 40101100 */  sll        $v0, $s1, 1
/* 263F4 800387D4 21B85100 */  addu       $s7, $v0, $s1
/* 263F8 800387D8 21900000 */  addu       $s2, $zero, $zero
.L800387DC:
/* 263FC 800387DC C0101700 */  sll        $v0, $s7, 3
/* 26400 800387E0 21105100 */  addu       $v0, $v0, $s1
/* 26404 800387E4 C0980200 */  sll        $s3, $v0, 3
/* 26408 800387E8 C3A71300 */  sra        $s4, $s3, 31
.L800387EC:
/* 2640C 800387EC 6666093C */  lui        $t1, (0x66666667 >> 16)
/* 26410 800387F0 67662935 */  ori        $t1, $t1, (0x66666667 & 0xFFFF)
/* 26414 800387F4 001C1200 */  sll        $v1, $s2, 16
/* 26418 800387F8 831B0300 */  sra        $v1, $v1, 14
/* 2641C 800387FC 21107600 */  addu       $v0, $v1, $s6
/* 26420 80038800 0A000624 */  addiu      $a2, $zero, 0xA
/* 26424 80038804 00004494 */  lhu        $a0, 0x0($v0)
/* 26428 80038808 02004594 */  lhu        $a1, 0x2($v0)
/* 2642C 8003880C 0880023C */  lui        $v0, %hi(D_800842D0)
/* 26430 80038810 D0424224 */  addiu      $v0, $v0, %lo(D_800842D0)
/* 26434 80038814 21186200 */  addu       $v1, $v1, $v0
/* 26438 80038818 4003888F */  lw         $t0, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2643C 8003881C 80000724 */  addiu      $a3, $zero, 0x80
/* 26440 80038820 1400A3AF */  sw         $v1, 0x14($sp)
/* 26444 80038824 70038397 */  lhu        $v1, 0x370($gp) /* Failed to symbolize address 0x00000370 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26448 80038828 18006902 */  mult       $s3, $t1
/* 2644C 8003882C 1000B5AF */  sw         $s5, 0x10($sp)
/* 26450 80038830 7C14028D */  lw         $v0, 0x147C($t0)
/* 26454 80038834 2128A300 */  addu       $a1, $a1, $v1
/* 26458 80038838 1800A2AF */  sw         $v0, 0x18($sp)
/* 2645C 8003883C 40101000 */  sll        $v0, $s0, 1
/* 26460 80038840 21105000 */  addu       $v0, $v0, $s0
/* 26464 80038844 C0100200 */  sll        $v0, $v0, 3
/* 26468 80038848 21105000 */  addu       $v0, $v0, $s0
/* 2646C 8003884C 03130200 */  sra        $v0, $v0, 12
/* 26470 80038850 2128A200 */  addu       $a1, $a1, $v0
/* 26474 80038854 002C0500 */  sll        $a1, $a1, 16
/* 26478 80038858 1000028D */  lw         $v0, 0x10($t0)
/* 2647C 8003885C 032C0500 */  sra        $a1, $a1, 16
/* 26480 80038860 74004224 */  addiu      $v0, $v0, 0x74
/* 26484 80038864 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 26488 80038868 10500000 */  mfhi       $t2
/* 2648C 8003886C 43130A00 */  sra        $v0, $t2, 13
/* 26490 80038870 23105400 */  subu       $v0, $v0, $s4
/* 26494 80038874 00014224 */  addiu      $v0, $v0, 0x100
/* 26498 80038878 21208200 */  addu       $a0, $a0, $v0
/* 2649C 8003887C 00240400 */  sll        $a0, $a0, 16
/* 264A0 80038880 7DDE000C */  jal        MainFreeze_ConfigDrawNPC105
/* 264A4 80038884 03240400 */   sra       $a0, $a0, 16
/* 264A8 80038888 01004326 */  addiu      $v1, $s2, 0x1
/* 264AC 8003888C 00140300 */  sll        $v0, $v1, 16
/* 264B0 80038890 03140200 */  sra        $v0, $v0, 16
/* 264B4 80038894 03004228 */  slti       $v0, $v0, 0x3
/* 264B8 80038898 D4FF4014 */  bnez       $v0, .L800387EC
/* 264BC 8003889C 21906000 */   addu      $s2, $v1, $zero
/* 264C0 800388A0 01006224 */  addiu      $v0, $v1, 0x1
/* 264C4 800388A4 00140200 */  sll        $v0, $v0, 16
/* 264C8 800388A8 03140200 */  sra        $v0, $v0, 16
/* 264CC 800388AC 03004228 */  slti       $v0, $v0, 0x3
/* 264D0 800388B0 CAFF4014 */  bnez       $v0, .L800387DC
/* 264D4 800388B4 21900000 */   addu      $s2, $zero, $zero
/* 264D8 800388B8 0880023C */  lui        $v0, %hi(D_800845A0)
/* 264DC 800388BC A0455624 */  addiu      $s6, $v0, %lo(D_800845A0)
/* 264E0 800388C0 21980000 */  addu       $s3, $zero, $zero
.L800388C4:
/* 264E4 800388C4 00141200 */  sll        $v0, $s2, 16
/* 264E8 800388C8 03A40200 */  sra        $s4, $v0, 16
.L800388CC:
/* 264EC 800388CC 02008012 */  beqz       $s4, .L800388D8
/* 264F0 800388D0 32000524 */   addiu     $a1, $zero, 0x32
/* 264F4 800388D4 50000524 */  addiu      $a1, $zero, 0x50
.L800388D8:
/* 264F8 800388D8 21107202 */  addu       $v0, $s3, $s2
/* 264FC 800388DC 2118A202 */  addu       $v1, $s5, $v0
/* 26500 800388E0 FF036230 */  andi       $v0, $v1, 0x3FF
/* 26504 800388E4 80100200 */  sll        $v0, $v0, 2
/* 26508 800388E8 21105600 */  addu       $v0, $v0, $s6
/* 2650C 800388EC 0000508C */  lw         $s0, 0x0($v0)
/* 26510 800388F0 00046230 */  andi       $v0, $v1, 0x400
/* 26514 800388F4 07004010 */  beqz       $v0, .L80038914
/* 26518 800388F8 00141000 */   sll       $v0, $s0, 16
/* 2651C 800388FC 038C0200 */  sra        $s1, $v0, 16
/* 26520 80038900 00086230 */  andi       $v0, $v1, 0x800
/* 26524 80038904 09004014 */  bnez       $v0, .L8003892C
/* 26528 80038908 03841000 */   sra       $s0, $s0, 16
/* 2652C 8003890C 4CE20008 */  j          .L80038930
/* 26530 80038910 23881100 */   negu      $s1, $s1
.L80038914:
/* 26534 80038914 038C1000 */  sra        $s1, $s0, 16
/* 26538 80038918 00841000 */  sll        $s0, $s0, 16
/* 2653C 8003891C 00086230 */  andi       $v0, $v1, 0x800
/* 26540 80038920 03004010 */  beqz       $v0, .L80038930
/* 26544 80038924 03841000 */   sra       $s0, $s0, 16
/* 26548 80038928 23881100 */  negu       $s1, $s1
.L8003892C:
/* 2654C 8003892C 23801000 */  negu       $s0, $s0
.L80038930:
/* 26550 80038930 02002106 */  bgez       $s1, .L8003893C
/* 26554 80038934 21202002 */   addu      $a0, $s1, $zero
/* 26558 80038938 3F002426 */  addiu      $a0, $s1, 0x3F
.L8003893C:
/* 2655C 8003893C 6666083C */  lui        $t0, (0x66666667 >> 16)
/* 26560 80038940 67660835 */  ori        $t0, $t0, (0x66666667 & 0xFFFF)
/* 26564 80038944 83210400 */  sra        $a0, $a0, 6
/* 26568 80038948 00018424 */  addiu      $a0, $a0, 0x100
/* 2656C 8003894C 00240400 */  sll        $a0, $a0, 16
/* 26570 80038950 03240400 */  sra        $a0, $a0, 16
/* 26574 80038954 2110A000 */  addu       $v0, $a1, $zero
/* 26578 80038958 80281000 */  sll        $a1, $s0, 2
/* 2657C 8003895C 2128B000 */  addu       $a1, $a1, $s0
/* 26580 80038960 C0280500 */  sll        $a1, $a1, 3
/* 26584 80038964 032B0500 */  sra        $a1, $a1, 12
/* 26588 80038968 C0181100 */  sll        $v1, $s1, 3
/* 2658C 8003896C 21187100 */  addu       $v1, $v1, $s1
/* 26590 80038970 40190300 */  sll        $v1, $v1, 5
/* 26594 80038974 18006800 */  mult       $v1, $t0
/* 26598 80038978 70038797 */  lhu        $a3, 0x370($gp) /* Failed to symbolize address 0x00000370 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2659C 8003897C 4003868F */  lw         $a2, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 265A0 80038980 C31F0300 */  sra        $v1, $v1, 31
/* 265A4 80038984 1000A2AF */  sw         $v0, 0x10($sp)
/* 265A8 80038988 1400A2AF */  sw         $v0, 0x14($sp)
/* 265AC 8003898C 1800A2AF */  sw         $v0, 0x18($sp)
/* 265B0 80038990 2128E500 */  addu       $a1, $a3, $a1
/* 265B4 80038994 002C0500 */  sll        $a1, $a1, 16
/* 265B8 80038998 7C14C28C */  lw         $v0, 0x147C($a2)
/* 265BC 8003899C 032C0500 */  sra        $a1, $a1, 16
/* 265C0 800389A0 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 265C4 800389A4 C0101000 */  sll        $v0, $s0, 3
/* 265C8 800389A8 21105000 */  addu       $v0, $v0, $s0
/* 265CC 800389AC 80100200 */  sll        $v0, $v0, 2
/* 265D0 800389B0 03130200 */  sra        $v0, $v0, 12
/* 265D4 800389B4 2138E200 */  addu       $a3, $a3, $v0
/* 265D8 800389B8 003C0700 */  sll        $a3, $a3, 16
/* 265DC 800389BC 1000C28C */  lw         $v0, 0x10($a2)
/* 265E0 800389C0 033C0700 */  sra        $a3, $a3, 16
/* 265E4 800389C4 74004224 */  addiu      $v0, $v0, 0x74
/* 265E8 800389C8 2000A2AF */  sw         $v0, 0x20($sp)
/* 265EC 800389CC 10500000 */  mfhi       $t2
/* 265F0 800389D0 43330A00 */  sra        $a2, $t2, 13
/* 265F4 800389D4 2330C300 */  subu       $a2, $a2, $v1
/* 265F8 800389D8 0001C624 */  addiu      $a2, $a2, 0x100
/* 265FC 800389DC 00340600 */  sll        $a2, $a2, 16
/* 26600 800389E0 4085000C */  jal        DECOMP_CTR_Box_DrawWirePrims
/* 26604 800389E4 03340600 */   sra       $a2, $a2, 16
/* 26608 800389E8 00046226 */  addiu      $v0, $s3, 0x400
/* 2660C 800389EC 21984000 */  addu       $s3, $v0, $zero
/* 26610 800389F0 00140200 */  sll        $v0, $v0, 16
/* 26614 800389F4 03140200 */  sra        $v0, $v0, 16
/* 26618 800389F8 00104228 */  slti       $v0, $v0, 0x1000
/* 2661C 800389FC B3FF4014 */  bnez       $v0, .L800388CC
/* 26620 80038A00 AA004226 */   addiu     $v0, $s2, 0xAA
/* 26624 80038A04 21904000 */  addu       $s2, $v0, $zero
/* 26628 80038A08 00140200 */  sll        $v0, $v0, 16
/* 2662C 80038A0C 03140200 */  sra        $v0, $v0, 16
/* 26630 80038A10 00044228 */  slti       $v0, $v0, 0x400
/* 26634 80038A14 ABFF4014 */  bnez       $v0, .L800388C4
/* 26638 80038A18 21980000 */   addu      $s3, $zero, $zero
/* 2663C 80038A1C 21880000 */  addu       $s1, $zero, $zero
/* 26640 80038A20 0880023C */  lui        $v0, %hi(D_80084300)
/* 26644 80038A24 00435324 */  addiu      $s3, $v0, %lo(D_80084300)
/* 26648 80038A28 0880023C */  lui        $v0, %hi(D_800842E8)
/* 2664C 80038A2C E8425424 */  addiu      $s4, $v0, %lo(D_800842E8)
/* 26650 80038A30 21900000 */  addu       $s2, $zero, $zero
.L80038A34:
/* 26654 80038A34 00141100 */  sll        $v0, $s1, 16
/* 26658 80038A38 83130200 */  sra        $v0, $v0, 14
/* 2665C 80038A3C 21805400 */  addu       $s0, $v0, $s4
/* 26660 80038A40 001C1200 */  sll        $v1, $s2, 16
.L80038A44:
/* 26664 80038A44 831B0300 */  sra        $v1, $v1, 14
/* 26668 80038A48 21107300 */  addu       $v0, $v1, $s3
/* 2666C 80038A4C 00004494 */  lhu        $a0, 0x0($v0)
/* 26670 80038A50 02000596 */  lhu        $a1, 0x2($s0)
/* 26674 80038A54 00000000 */  nop
/* 26678 80038A58 18008500 */  mult       $a0, $a1
/* 2667C 80038A5C 00000686 */  lh         $a2, 0x0($s0)
/* 26680 80038A60 02004494 */  lhu        $a0, 0x2($v0)
/* 26684 80038A64 0880023C */  lui        $v0, %hi(D_800842F4)
/* 26688 80038A68 F4424224 */  addiu      $v0, $v0, %lo(D_800842F4)
/* 2668C 80038A6C 21186200 */  addu       $v1, $v1, $v0
/* 26690 80038A70 1400A3AF */  sw         $v1, 0x14($sp)
/* 26694 80038A74 4003838F */  lw         $v1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26698 80038A78 12400000 */  mflo       $t0
/* 2669C 80038A7C 1000B5AF */  sw         $s5, 0x10($sp)
/* 266A0 80038A80 00000000 */  nop
/* 266A4 80038A84 18008500 */  mult       $a0, $a1
/* 266A8 80038A88 7C14628C */  lw         $v0, 0x147C($v1)
/* 266AC 80038A8C 00000000 */  nop
/* 266B0 80038A90 1800A2AF */  sw         $v0, 0x18($sp)
/* 266B4 80038A94 1000628C */  lw         $v0, 0x10($v1)
/* 266B8 80038A98 80000724 */  addiu      $a3, $zero, 0x80
/* 266BC 80038A9C 74004224 */  addiu      $v0, $v0, 0x74
/* 266C0 80038AA0 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 266C4 80038AA4 00010425 */  addiu      $a0, $t0, 0x100
/* 266C8 80038AA8 00240400 */  sll        $a0, $a0, 16
/* 266CC 80038AAC 03240400 */  sra        $a0, $a0, 16
/* 266D0 80038AB0 70038597 */  lhu        $a1, 0x370($gp) /* Failed to symbolize address 0x00000370 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 266D4 80038AB4 12480000 */  mflo       $t1
/* 266D8 80038AB8 2128A900 */  addu       $a1, $a1, $t1
/* 266DC 80038ABC 002C0500 */  sll        $a1, $a1, 16
/* 266E0 80038AC0 7DDE000C */  jal        MainFreeze_ConfigDrawNPC105
/* 266E4 80038AC4 032C0500 */   sra       $a1, $a1, 16
/* 266E8 80038AC8 01004226 */  addiu      $v0, $s2, 0x1
/* 266EC 80038ACC 21904000 */  addu       $s2, $v0, $zero
/* 266F0 80038AD0 00140200 */  sll        $v0, $v0, 16
/* 266F4 80038AD4 03140200 */  sra        $v0, $v0, 16
/* 266F8 80038AD8 03004228 */  slti       $v0, $v0, 0x3
/* 266FC 80038ADC D9FF4014 */  bnez       $v0, .L80038A44
/* 26700 80038AE0 001C1200 */   sll       $v1, $s2, 16
/* 26704 80038AE4 01003126 */  addiu      $s1, $s1, 0x1
/* 26708 80038AE8 FFFF2232 */  andi       $v0, $s1, 0xFFFF
/* 2670C 80038AEC 0300422C */  sltiu      $v0, $v0, 0x3
/* 26710 80038AF0 D0FF4014 */  bnez       $v0, .L80038A34
/* 26714 80038AF4 21900000 */   addu      $s2, $zero, $zero
/* 26718 80038AF8 3800A427 */  addiu      $a0, $sp, 0x38
/* 2671C 80038AFC ECFF0224 */  addiu      $v0, $zero, -0x14
/* 26720 80038B00 3800A2A7 */  sh         $v0, 0x38($sp)
/* 26724 80038B04 28020224 */  addiu      $v0, $zero, 0x228
/* 26728 80038B08 3C00A2A7 */  sh         $v0, 0x3C($sp)
/* 2672C 80038B0C A0000224 */  addiu      $v0, $zero, 0xA0
/* 26730 80038B10 3E00A2A7 */  sh         $v0, 0x3E($sp)
/* 26734 80038B14 70038297 */  lhu        $v0, 0x370($gp) /* Failed to symbolize address 0x00000370 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 26738 80038B18 4003838F */  lw         $v1, 0x340($gp) /* Failed to symbolize address 0x00000340 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2673C 80038B1C C4FF4224 */  addiu      $v0, $v0, -0x3C
/* 26740 80038B20 3A00A2A7 */  sh         $v0, 0x3A($sp)
.L80038B24:
/* 26744 80038B24 7C14668C */  lw         $a2, 0x147C($v1)
/* 26748 80038B28 EC15010C */  jal        DECOMP_RECTMENU_DrawInnerRect
/* 2674C 80038B2C 04000524 */   addiu     $a1, $zero, 0x4
.L80038B30:
/* 26750 80038B30 6800BF8F */  lw         $ra, 0x68($sp)
/* 26754 80038B34 6400B78F */  lw         $s7, 0x64($sp)
/* 26758 80038B38 6000B68F */  lw         $s6, 0x60($sp)
/* 2675C 80038B3C 5C00B58F */  lw         $s5, 0x5C($sp)
/* 26760 80038B40 5800B48F */  lw         $s4, 0x58($sp)
/* 26764 80038B44 5400B38F */  lw         $s3, 0x54($sp)
/* 26768 80038B48 5000B28F */  lw         $s2, 0x50($sp)
/* 2676C 80038B4C 4C00B18F */  lw         $s1, 0x4C($sp)
/* 26770 80038B50 4800B08F */  lw         $s0, 0x48($sp)
/* 26774 80038B54 0800E003 */  jr         $ra
/* 26778 80038B58 7000BD27 */   addiu     $sp, $sp, 0x70
.size MainFreeze_ConfigSetupEntry, . - MainFreeze_ConfigSetupEntry
