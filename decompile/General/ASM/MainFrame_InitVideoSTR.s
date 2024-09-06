.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel MainFrame_InitVideoSTR
/* 23950 80035D30 0000A294 */  lhu        $v0, 0x0($a1)
/* 23954 80035D34 00000000 */  nop
/* 23958 80035D38 140982A7 */  sh         $v0, 0x914($gp) /* Failed to symbolize address 0x00000914 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2395C 80035D3C 0200A294 */  lhu        $v0, 0x2($a1)
/* 23960 80035D40 00000000 */  nop
/* 23964 80035D44 160982A7 */  sh         $v0, 0x916($gp) /* Failed to symbolize address 0x00000916 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 23968 80035D48 0400A294 */  lhu        $v0, 0x4($a1)
/* 2396C 80035D4C 00000000 */  nop
/* 23970 80035D50 180982A7 */  sh         $v0, 0x918($gp) /* Failed to symbolize address 0x00000918 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 23974 80035D54 0600A294 */  lhu        $v0, 0x6($a1)
/* 23978 80035D58 5C0384AF */  sw         $a0, 0x35C($gp) /* Failed to symbolize address 0x0000035C for %gp_rel. Make sure this address is within the recognized valid address space */
/* 2397C 80035D5C 300986A7 */  sh         $a2, 0x930($gp) /* Failed to symbolize address 0x00000930 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 23980 80035D60 340987A7 */  sh         $a3, 0x934($gp) /* Failed to symbolize address 0x00000934 for %gp_rel. Make sure this address is within the recognized valid address space */
/* 23984 80035D64 1A0982A7 */  sh         $v0, 0x91A($gp) /* Failed to symbolize address 0x0000091A for %gp_rel. Make sure this address is within the recognized valid address space */
/* 23988 80035D68 0800E003 */  jr         $ra
/* 2398C 80035D6C 00000000 */   nop
.size MainFrame_InitVideoSTR, . - MainFrame_InitVideoSTR
