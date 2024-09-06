.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel COLL_SearchTree_FindQuadblock_Touching
/* C72C 8001EB0C 1800E700 */  mult       $a3, $a3
/* C730 8001EB10 0600C7A4 */  sh         $a3, 0x6($a2)
/* C734 8001EB14 1600C7A4 */  sh         $a3, 0x16($a2)
/* C738 8001EB18 4200C0A4 */  sh         $zero, 0x42($a2)
/* C73C 8001EB1C 3C00C0A4 */  sh         $zero, 0x3C($a2)
/* C740 8001EB20 3E00C0A4 */  sh         $zero, 0x3E($a2)
/* C744 8001EB24 A401C0AC */  sw         $zero, 0x1A4($a2)
/* C748 8001EB28 2C00C38C */  lw         $v1, 0x2C($a2)
/* C74C 8001EB2C C400C0AC */  sw         $zero, 0xC4($a2)
/* C750 8001EB30 0000888C */  lw         $t0, 0x0($a0)
/* C754 8001EB34 04008984 */  lh         $t1, 0x4($a0)
/* C758 8001EB38 1800648C */  lw         $a0, 0x18($v1)
/* C75C 8001EB3C 0000C8AC */  sw         $t0, 0x0($a2)
/* C760 8001EB40 0400C9A4 */  sh         $t1, 0x4($a2)
/* C764 8001EB44 1C00C8AC */  sw         $t0, 0x1C($a2)
/* C768 8001EB48 2000C9A4 */  sh         $t1, 0x20($a2)
/* C76C 8001EB4C 0000A88C */  lw         $t0, 0x0($a1)
/* C770 8001EB50 0400A984 */  lh         $t1, 0x4($a1)
/* C774 8001EB54 1000C8AC */  sw         $t0, 0x10($a2)
/* C778 8001EB58 1400C9A4 */  sh         $t1, 0x14($a2)
/* C77C 8001EB5C 12180000 */  mflo       $v1
/* C780 8001EB60 00100824 */  addiu      $t0, $zero, 0x1000
/* C784 8001EB64 8400C8AC */  sw         $t0, 0x84($a2)
/* C788 8001EB68 0800C3AC */  sw         $v1, 0x8($a2)
/* C78C 8001EB6C 1800C3AC */  sw         $v1, 0x18($a2)
/* C790 8001EB70 0000C384 */  lh         $v1, 0x0($a2)
/* C794 8001EB74 1000C884 */  lh         $t0, 0x10($a2)
/* C798 8001EB78 0200C984 */  lh         $t1, 0x2($a2)
/* C79C 8001EB7C 1200CA84 */  lh         $t2, 0x12($a2)
/* C7A0 8001EB80 23386800 */  subu       $a3, $v1, $t0
/* C7A4 8001EB84 0300E104 */  bgez       $a3, .L8001EB94
/* C7A8 8001EB88 21386000 */   addu      $a3, $v1, $zero
/* C7AC 8001EB8C 21180001 */  addu       $v1, $t0, $zero
/* C7B0 8001EB90 2140E000 */  addu       $t0, $a3, $zero
.L8001EB94:
/* C7B4 8001EB94 3600C3A4 */  sh         $v1, 0x36($a2)
/* C7B8 8001EB98 3000C8A4 */  sh         $t0, 0x30($a2)
/* C7BC 8001EB9C 0400C384 */  lh         $v1, 0x4($a2)
/* C7C0 8001EBA0 1400C884 */  lh         $t0, 0x14($a2)
/* C7C4 8001EBA4 23382A01 */  subu       $a3, $t1, $t2
/* C7C8 8001EBA8 0300E104 */  bgez       $a3, .L8001EBB8
/* C7CC 8001EBAC 21382001 */   addu      $a3, $t1, $zero
/* C7D0 8001EBB0 21484001 */  addu       $t1, $t2, $zero
/* C7D4 8001EBB4 2150E000 */  addu       $t2, $a3, $zero
.L8001EBB8:
/* C7D8 8001EBB8 3800C9A4 */  sh         $t1, 0x38($a2)
/* C7DC 8001EBBC 3200CAA4 */  sh         $t2, 0x32($a2)
/* C7E0 8001EBC0 23386800 */  subu       $a3, $v1, $t0
/* C7E4 8001EBC4 0300E104 */  bgez       $a3, .L8001EBD4
/* C7E8 8001EBC8 21386000 */   addu      $a3, $v1, $zero
/* C7EC 8001EBCC 21180001 */  addu       $v1, $t0, $zero
/* C7F0 8001EBD0 2140E000 */  addu       $t0, $a3, $zero
.L8001EBD4:
/* C7F4 8001EBD4 3A00C3A4 */  sh         $v1, 0x3A($a2)
/* C7F8 8001EBD8 3400C8A4 */  sh         $t0, 0x34($a2)
/* C7FC 8001EBDC 3000C524 */  addiu      $a1, $a2, 0x30
/* C800 8001EBE0 2138C000 */  addu       $a3, $a2, $zero
/* C804 8001EBE4 0280063C */  lui        $a2, %hi(COLL_PerBspLeaf_CheckQuadblocks_Touching)
/* C808 8001EBE8 F0F5C624 */  addiu      $a2, $a2, %lo(COLL_PerBspLeaf_CheckQuadblocks_Touching)
.size COLL_SearchTree_FindQuadblock_Touching, . - COLL_SearchTree_FindQuadblock_Touching
