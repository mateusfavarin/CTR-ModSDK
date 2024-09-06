.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
/* Handwritten function */
glabel COLL_TestTriangle_FindClosest
/* D860 8001FC40 3C008384 */  lh         $v1, 0x3C($a0)
/* D864 8001FC44 0600A884 */  lh         $t0, 0x6($a1)
/* D868 8001FC48 0C00A98C */  lw         $t1, 0xC($a1)
/* D86C 8001FC4C 1000AA8C */  lw         $t2, 0x10($a1)
/* D870 8001FC50 01006324 */  addiu      $v1, $v1, 0x1
/* D874 8001FC54 3C0083A4 */  sh         $v1, 0x3C($a0)
/* D878 8001FC58 520088A4 */  sh         $t0, 0x52($a0)
/* D87C 8001FC5C 540089AC */  sw         $t1, 0x54($a0)
/* D880 8001FC60 58008AAC */  sw         $t2, 0x58($a0)
/* D884 8001FC64 ECFFBD27 */  addiu      $sp, $sp, -0x14
/* D888 8001FC68 1000BFAF */  sw         $ra, 0x10($sp)
/* D88C 8001FC6C 6400998C */  lw         $t9, 0x64($a0)
/* D890 8001FC70 0980093C */  lui        $t1, %hi(D_8008D728)
/* D894 8001FC74 28D72925 */  addiu      $t1, $t1, %lo(D_8008D728)
/* D898 8001FC78 12002387 */  lh         $v1, 0x12($t9)
/* D89C 8001FC7C 38002883 */  lb         $t0, 0x38($t9)
/* D8A0 8001FC80 0000298D */  lw         $t1, 0x0($t1)
/* D8A4 8001FC84 00046330 */  andi       $v1, $v1, 0x400
/* D8A8 8001FC88 02006010 */  beqz       $v1, .L8001FC94
/* D8AC 8001FC8C 24180901 */   and       $v1, $t0, $t1
/* D8B0 8001FC90 F0006014 */  bnez       $v1, .L80020054
.L8001FC94:
/* D8B4 8001FC94 0000838C */   lw        $v1, 0x0($a0)
/* D8B8 8001FC98 04008894 */  lhu        $t0, 0x4($a0)
/* D8BC 8001FC9C 1000898C */  lw         $t1, 0x10($a0)
/* D8C0 8001FCA0 14008A94 */  lhu        $t2, 0x14($a0)
/* D8C4 8001FCA4 0000C348 */  ctc2       $v1, $0 /* handwritten instruction */
/* D8C8 8001FCA8 001C0900 */  sll        $v1, $t1, 16
/* D8CC 8001FCAC 25186800 */  or         $v1, $v1, $t0
/* D8D0 8001FCB0 0008C348 */  ctc2       $v1, $1 /* handwritten instruction */
/* D8D4 8001FCB4 021C0900 */  srl        $v1, $t1, 16
/* D8D8 8001FCB8 00440A00 */  sll        $t0, $t2, 16
/* D8DC 8001FCBC 25186800 */  or         $v1, $v1, $t0
/* D8E0 8001FCC0 0010C348 */  ctc2       $v1, $2 /* handwritten instruction */
/* D8E4 8001FCC4 540080C8 */  lwc2       $0, 0x54($a0)
/* D8E8 8001FCC8 580081C8 */  lwc2       $1, 0x58($a0)
/* D8EC 8001FCCC 5A008A84 */  lh         $t2, 0x5A($a0)
/* D8F0 8001FCD0 58008984 */  lh         $t1, 0x58($a0)
/* D8F4 8001FCD4 1260484A */  MVMVA      1, 0, 0, 3, 0
/* D8F8 8001FCD8 40500A00 */  sll        $t2, $t2, 1
/* D8FC 8001FCDC 00C81348 */  mfc2       $s3, $25 /* handwritten instruction */
/* D900 8001FCE0 00D01448 */  mfc2       $s4, $26 /* handwritten instruction */
/* D904 8001FCE4 23986A02 */  subu       $s3, $s3, $t2
/* D908 8001FCE8 23A08A02 */  subu       $s4, $s4, $t2
/* D90C 8001FCEC 12002A87 */  lh         $t2, 0x12($t9)
/* D910 8001FCF0 11008106 */  bgez       $s4, .L8001FD38
/* D914 8001FCF4 40004A31 */   andi      $t2, $t2, 0x40
/* D918 8001FCF8 1400238F */  lw         $v1, 0x14($t9)
/* D91C 8001FCFC 02004015 */  bnez       $t2, .L8001FD08
/* D920 8001FD00 56008884 */   lh        $t0, 0x56($a0)
/* D924 8001FD04 0C006104 */  bgez       $v1, .L8001FD38
.L8001FD08:
/* D928 8001FD08 54008384 */   lh        $v1, 0x54($a0)
/* D92C 8001FD0C 5A008A84 */  lh         $t2, 0x5A($a0)
/* D930 8001FD10 22981300 */  neg        $s3, $s3 /* handwritten instruction */
/* D934 8001FD14 22A01400 */  neg        $s4, $s4 /* handwritten instruction */
/* D938 8001FD18 22180300 */  neg        $v1, $v1 /* handwritten instruction */
/* D93C 8001FD1C 22400800 */  neg        $t0, $t0 /* handwritten instruction */
/* D940 8001FD20 22480900 */  neg        $t1, $t1 /* handwritten instruction */
/* D944 8001FD24 22500A00 */  neg        $t2, $t2 /* handwritten instruction */
/* D948 8001FD28 540083A4 */  sh         $v1, 0x54($a0)
/* D94C 8001FD2C 560088A4 */  sh         $t0, 0x56($a0)
/* D950 8001FD30 580089A4 */  sh         $t1, 0x58($a0)
/* D954 8001FD34 5A008AA4 */  sh         $t2, 0x5A($a0)
.L8001FD38:
/* D958 8001FD38 3C008384 */  lh         $v1, 0x3C($a0)
/* D95C 8001FD3C 06008884 */  lh         $t0, 0x6($a0)
/* D960 8001FD40 01006324 */  addiu      $v1, $v1, 0x1
/* D964 8001FD44 23406802 */  subu       $t0, $s3, $t0
/* D968 8001FD48 12002A87 */  lh         $t2, 0x12($t9)
/* D96C 8001FD4C C1000105 */  bgez       $t0, .L80020054
/* D970 8001FD50 3C0083A4 */   sh        $v1, 0x3C($a0)
/* D974 8001FD54 BF008006 */  bltz       $s4, .L80020054
/* D978 8001FD58 40004A31 */   andi      $t2, $t2, 0x40
/* D97C 8001FD5C 23407402 */  subu       $t0, $s3, $s4
/* D980 8001FD60 02004015 */  bnez       $t2, .L8001FD6C
/* D984 8001FD64 22181300 */   neg       $v1, $s3 /* handwritten instruction */
/* D988 8001FD68 BA00001D */  bgtz       $t0, .L80020054
.L8001FD6C:
/* D98C 8001FD6C 001B0300 */   sll       $v1, $v1, 12
/* D990 8001FD70 12006106 */  bgez       $s3, .L8001FDBC
/* D994 8001FD74 23409302 */   subu      $t0, $s4, $s3
/* D998 8001FD78 1A006800 */  div        $zero, $v1, $t0
/* D99C 8001FD7C 00008384 */  lh         $v1, 0x0($a0)
/* D9A0 8001FD80 10008884 */  lh         $t0, 0x10($a0)
/* D9A4 8001FD84 02008984 */  lh         $t1, 0x2($a0)
/* D9A8 8001FD88 12008A84 */  lh         $t2, 0x12($a0)
/* D9AC 8001FD8C 23186800 */  subu       $v1, $v1, $t0
/* D9B0 8001FD90 00488348 */  mtc2       $v1, $9 /* handwritten instruction */
/* D9B4 8001FD94 04008384 */  lh         $v1, 0x4($a0)
/* D9B8 8001FD98 14008884 */  lh         $t0, 0x14($a0)
/* D9BC 8001FD9C 23482A01 */  subu       $t1, $t1, $t2
/* D9C0 8001FDA0 00508948 */  mtc2       $t1, $10 /* handwritten instruction */
/* D9C4 8001FDA4 23186800 */  subu       $v1, $v1, $t0
/* D9C8 8001FDA8 00588348 */  mtc2       $v1, $11 /* handwritten instruction */
/* D9CC 8001FDAC 12180000 */  mflo       $v1
/* D9D0 8001FDB0 00408348 */  mtc2       $v1, $8 /* handwritten instruction */
/* D9D4 8001FDB4 0A000104 */  bgez       $zero, .L8001FDE0
/* D9D8 8001FDB8 01001524 */   addiu     $s5, $zero, 0x1
.L8001FDBC:
/* D9DC 8001FDBC 54008384 */  lh         $v1, 0x54($a0)
/* D9E0 8001FDC0 56008884 */  lh         $t0, 0x56($a0)
/* D9E4 8001FDC4 58008984 */  lh         $t1, 0x58($a0)
/* D9E8 8001FDC8 00409348 */  mtc2       $s3, $8 /* handwritten instruction */
/* D9EC 8001FDCC 00488348 */  mtc2       $v1, $9 /* handwritten instruction */
/* D9F0 8001FDD0 00508848 */  mtc2       $t0, $10 /* handwritten instruction */
/* D9F4 8001FDD4 00588948 */  mtc2       $t1, $11 /* handwritten instruction */
/* D9F8 8001FDD8 00001524 */  addiu      $s5, $zero, 0x0
/* D9FC 8001FDDC 00000000 */  nop
.L8001FDE0:
/* DA00 8001FDE0 3D00984B */  GPF        1
/* DA04 8001FDE4 00008384 */  lh         $v1, 0x0($a0)
/* DA08 8001FDE8 02008884 */  lh         $t0, 0x2($a0)
/* DA0C 8001FDEC 00C80A48 */  mfc2       $t2, $25 /* handwritten instruction */
/* DA10 8001FDF0 04008984 */  lh         $t1, 0x4($a0)
/* DA14 8001FDF4 23186A00 */  subu       $v1, $v1, $t2
/* DA18 8001FDF8 00D00A48 */  mfc2       $t2, $26 /* handwritten instruction */
/* DA1C 8001FDFC 5C0083A4 */  sh         $v1, 0x5C($a0)
/* DA20 8001FE00 23400A01 */  subu       $t0, $t0, $t2
/* DA24 8001FE04 00D80A48 */  mfc2       $t2, $27 /* handwritten instruction */
/* DA28 8001FE08 5E0088A4 */  sh         $t0, 0x5E($a0)
/* DA2C 8001FE0C 23482A01 */  subu       $t1, $t1, $t2
/* DA30 8001FE10 600089A4 */  sh         $t1, 0x60($a0)
/* DA34 8001FE14 21B08000 */  addu       $s6, $a0, $zero
/* DA38 8001FE18 D80085AC */  sw         $a1, 0xD8($a0)
/* DA3C 8001FE1C DC0086AC */  sw         $a2, 0xDC($a0)
/* DA40 8001FE20 E00087AC */  sw         $a3, 0xE0($a0)
/* DA44 8001FE24 4A7E000C */  jal        func_8001F928
/* DA48 8001FE28 4C008424 */   addiu     $a0, $a0, 0x4C
/* DA4C 8001FE2C 2120C002 */  addu       $a0, $s6, $zero
/* DA50 8001FE30 D800858C */  lw         $a1, 0xD8($a0)
/* DA54 8001FE34 DC00868C */  lw         $a2, 0xDC($a0)
/* DA58 8001FE38 86004004 */  bltz       $v0, .L80020054
/* DA5C 8001FE3C E000878C */   lw        $a3, 0xE0($a0)
/* DA60 8001FE40 4C008884 */  lh         $t0, 0x4C($a0)
/* DA64 8001FE44 0C00A012 */  beqz       $s5, .L8001FE78
/* DA68 8001FE48 4E008A84 */   lh        $t2, 0x4E($a0)
/* DA6C 8001FE4C 5C008384 */  lh         $v1, 0x5C($a0)
/* DA70 8001FE50 5E008984 */  lh         $t1, 0x5E($a0)
/* DA74 8001FE54 23186800 */  subu       $v1, $v1, $t0
/* DA78 8001FE58 E40083A4 */  sh         $v1, 0xE4($a0)
/* DA7C 8001FE5C 60008384 */  lh         $v1, 0x60($a0)
/* DA80 8001FE60 50008884 */  lh         $t0, 0x50($a0)
/* DA84 8001FE64 23482A01 */  subu       $t1, $t1, $t2
/* DA88 8001FE68 E60089A4 */  sh         $t1, 0xE6($a0)
/* DA8C 8001FE6C 23186800 */  subu       $v1, $v1, $t0
/* DA90 8001FE70 0B000104 */  bgez       $zero, .L8001FEA0
/* DA94 8001FE74 E80083A4 */   sh        $v1, 0xE8($a0)
.L8001FE78:
/* DA98 8001FE78 00008384 */  lh         $v1, 0x0($a0)
/* DA9C 8001FE7C 02008984 */  lh         $t1, 0x2($a0)
/* DAA0 8001FE80 23186800 */  subu       $v1, $v1, $t0
/* DAA4 8001FE84 E40083A4 */  sh         $v1, 0xE4($a0)
/* DAA8 8001FE88 04008384 */  lh         $v1, 0x4($a0)
/* DAAC 8001FE8C 50008884 */  lh         $t0, 0x50($a0)
/* DAB0 8001FE90 23482A01 */  subu       $t1, $t1, $t2
/* DAB4 8001FE94 E60089A4 */  sh         $t1, 0xE6($a0)
/* DAB8 8001FE98 23186800 */  subu       $v1, $v1, $t0
/* DABC 8001FE9C E80083A4 */  sh         $v1, 0xE8($a0)
.L8001FEA0:
/* DAC0 8001FEA0 E400838C */  lw         $v1, 0xE4($a0)
/* DAC4 8001FEA4 E8008884 */  lh         $t0, 0xE8($a0)
/* DAC8 8001FEA8 0000C348 */  ctc2       $v1, $0 /* handwritten instruction */
/* DACC 8001FEAC 0008C848 */  ctc2       $t0, $1 /* handwritten instruction */
/* DAD0 8001FEB0 E40080C8 */  lwc2       $0, 0xE4($a0)
/* DAD4 8001FEB4 E80081C8 */  lwc2       $1, 0xE8($a0)
/* DAD8 8001FEB8 00000000 */  nop
/* DADC 8001FEBC 00000000 */  nop
/* DAE0 8001FEC0 1260404A */  MVMVA      0, 0, 0, 3, 0
/* DAE4 8001FEC4 0800888C */  lw         $t0, 0x8($a0)
/* DAE8 8001FEC8 00C80348 */  mfc2       $v1, $25 /* handwritten instruction */
/* DAEC 8001FECC 6400998C */  lw         $t9, 0x64($a0)
/* DAF0 8001FED0 23406800 */  subu       $t0, $v1, $t0
/* DAF4 8001FED4 12003587 */  lh         $s5, 0x12($t9)
/* DAF8 8001FED8 5E00001D */  bgtz       $t0, .L80020054
/* DAFC 8001FEDC 4000A932 */   andi      $t1, $s5, 0x40
/* DB00 8001FEE0 0C002011 */  beqz       $t1, .L8001FF14
/* DB04 8001FEE4 06008984 */   lh        $t1, 0x6($a0)
/* DB08 8001FEE8 04006006 */  bltz       $s3, .L8001FEFC
/* DB0C 8001FEEC 23186902 */   subu      $v1, $s3, $t1
/* DB10 8001FEF0 23408902 */  subu       $t0, $s4, $t1
/* DB14 8001FEF4 25186800 */  or         $v1, $v1, $t0
/* DB18 8001FEF8 06006104 */  bgez       $v1, .L8001FF14
.L8001FEFC:
/* DB1C 8001FEFC A401838C */   lw        $v1, 0x1A4($a0)
/* DB20 8001FF00 38002993 */  lbu        $t1, 0x38($t9)
/* DB24 8001FF04 00000000 */  nop
/* DB28 8001FF08 25186900 */  or         $v1, $v1, $t1
/* DB2C 8001FF0C 51000104 */  bgez       $zero, .L80020054
/* DB30 8001FF10 A40183AC */   sw        $v1, 0x1A4($a0)
.L8001FF14:
/* DB34 8001FF14 06008984 */  lh         $t1, 0x6($a0)
/* DB38 8001FF18 84008A8C */  lw         $t2, 0x84($a0)
/* DB3C 8001FF1C 23189302 */  subu       $v1, $s4, $s3
/* DB40 8001FF20 06006010 */  beqz       $v1, .L8001FF3C
/* DB44 8001FF24 23483301 */   subu      $t1, $t1, $s3
/* DB48 8001FF28 004B0900 */  sll        $t1, $t1, 12
/* DB4C 8001FF2C 1A002301 */  div        $zero, $t1, $v1
/* DB50 8001FF30 00100824 */  addiu      $t0, $zero, 0x1000
/* DB54 8001FF34 12180000 */  mflo       $v1
/* DB58 8001FF38 23180301 */  subu       $v1, $t0, $v1
.L8001FF3C:
/* DB5C 8001FF3C 23406A00 */  subu       $t0, $v1, $t2
/* DB60 8001FF40 44000105 */  bgez       $t0, .L80020054
/* DB64 8001FF44 1000A832 */   andi      $t0, $s5, 0x10
/* DB68 8001FF48 07000011 */  beqz       $t0, .L8001FF68
/* DB6C 8001FF4C 0002A832 */   andi      $t0, $s5, 0x200
/* DB70 8001FF50 40000011 */  beqz       $t0, .L80020054
/* DB74 8001FF54 A401888C */   lw        $t0, 0x1A4($a0)
/* DB78 8001FF58 00000000 */  nop
/* DB7C 8001FF5C 00400835 */  ori        $t0, $t0, 0x4000
/* DB80 8001FF60 3C000104 */  bgez       $zero, .L80020054
/* DB84 8001FF64 A40188AC */   sw        $t0, 0x1A4($a0)
.L8001FF68:
/* DB88 8001FF68 840083AC */  sw         $v1, 0x84($a0)
/* DB8C 8001FF6C 0800A58C */  lw         $a1, 0x8($a1)
/* DB90 8001FF70 0800C68C */  lw         $a2, 0x8($a2)
/* DB94 8001FF74 0800E78C */  lw         $a3, 0x8($a3)
/* DB98 8001FF78 CC0085AC */  sw         $a1, 0xCC($a0)
/* DB9C 8001FF7C D00086AC */  sw         $a2, 0xD0($a0)
/* DBA0 8001FF80 D40087AC */  sw         $a3, 0xD4($a0)
/* DBA4 8001FF84 4C00888C */  lw         $t0, 0x4C($a0)
/* DBA8 8001FF88 5000898C */  lw         $t1, 0x50($a0)
/* DBAC 8001FF8C 680088AC */  sw         $t0, 0x68($a0)
/* DBB0 8001FF90 6C0089AC */  sw         $t1, 0x6C($a0)
/* DBB4 8001FF94 5400888C */  lw         $t0, 0x54($a0)
/* DBB8 8001FF98 5800898C */  lw         $t1, 0x58($a0)
/* DBBC 8001FF9C 700088AC */  sw         $t0, 0x70($a0)
/* DBC0 8001FFA0 740089AC */  sw         $t1, 0x74($a0)
/* DBC4 8001FFA4 5C00888C */  lw         $t0, 0x5C($a0)
/* DBC8 8001FFA8 6000898C */  lw         $t1, 0x60($a0)
/* DBCC 8001FFAC 780088AC */  sw         $t0, 0x78($a0)
/* DBD0 8001FFB0 7C0089AC */  sw         $t1, 0x7C($a0)
/* DBD4 8001FFB4 63008880 */  lb         $t0, 0x63($a0)
/* DBD8 8001FFB8 800099AC */  sw         $t9, 0x80($a0)
/* DBDC 8001FFBC 7F0088A0 */  sb         $t0, 0x7F($a0)
/* DBE0 8001FFC0 7E0082A0 */  sb         $v0, 0x7E($a0)
/* DBE4 8001FFC4 0500601C */  bgtz       $v1, .L8001FFDC
/* DBE8 8001FFC8 1000888C */   lw        $t0, 0x10($a0)
/* DBEC 8001FFCC 14008984 */  lh         $t1, 0x14($a0)
/* DBF0 8001FFD0 1C0088AC */  sw         $t0, 0x1C($a0)
/* DBF4 8001FFD4 1B000104 */  bgez       $zero, .L80020044
/* DBF8 8001FFD8 200089A4 */   sh        $t1, 0x20($a0)
.L8001FFDC:
/* DBFC 8001FFDC 00408348 */  mtc2       $v1, $8 /* handwritten instruction */
/* DC00 8001FFE0 00008384 */  lh         $v1, 0x0($a0)
/* DC04 8001FFE4 10008884 */  lh         $t0, 0x10($a0)
/* DC08 8001FFE8 02008984 */  lh         $t1, 0x2($a0)
/* DC0C 8001FFEC 12008A84 */  lh         $t2, 0x12($a0)
/* DC10 8001FFF0 23186800 */  subu       $v1, $v1, $t0
/* DC14 8001FFF4 00488348 */  mtc2       $v1, $9 /* handwritten instruction */
/* DC18 8001FFF8 04008384 */  lh         $v1, 0x4($a0)
/* DC1C 8001FFFC 14008884 */  lh         $t0, 0x14($a0)
/* DC20 80020000 23482A01 */  subu       $t1, $t1, $t2
/* DC24 80020004 00508948 */  mtc2       $t1, $10 /* handwritten instruction */
/* DC28 80020008 23186800 */  subu       $v1, $v1, $t0
/* DC2C 8002000C 00588348 */  mtc2       $v1, $11 /* handwritten instruction */
/* DC30 80020010 10008384 */  lh         $v1, 0x10($a0)
/* DC34 80020014 12008884 */  lh         $t0, 0x12($a0)
/* DC38 80020018 3D00984B */  GPF        1
/* DC3C 8002001C 00C80A48 */  mfc2       $t2, $25 /* handwritten instruction */
/* DC40 80020020 14008984 */  lh         $t1, 0x14($a0)
/* DC44 80020024 21186A00 */  addu       $v1, $v1, $t2
/* DC48 80020028 00D00A48 */  mfc2       $t2, $26 /* handwritten instruction */
/* DC4C 8002002C 1C0083A4 */  sh         $v1, 0x1C($a0)
/* DC50 80020030 21400A01 */  addu       $t0, $t0, $t2
/* DC54 80020034 00D80A48 */  mfc2       $t2, $27 /* handwritten instruction */
/* DC58 80020038 1E0088A4 */  sh         $t0, 0x1E($a0)
/* DC5C 8002003C 21482A01 */  addu       $t1, $t1, $t2
/* DC60 80020040 200089A4 */  sh         $t1, 0x20($a0)
.L80020044:
/* DC64 80020044 3E008884 */  lh         $t0, 0x3E($a0)
/* DC68 80020048 00000000 */  nop
/* DC6C 8002004C 01000825 */  addiu      $t0, $t0, 0x1
/* DC70 80020050 3E0088A4 */  sh         $t0, 0x3E($a0)
.L80020054:
/* DC74 80020054 1000BF8F */  lw         $ra, 0x10($sp)
/* DC78 80020058 00000000 */  nop
/* DC7C 8002005C 0800E003 */  jr         $ra
/* DC80 80020060 1400BD27 */   addiu     $sp, $sp, 0x14
.size COLL_TestTriangle_FindClosest, . - COLL_TestTriangle_FindClosest
