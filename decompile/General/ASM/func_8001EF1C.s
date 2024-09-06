.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include "macro.inc"
glabel func_8001EF1C
/* CB3C 8001EF1C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* CB40 8001EF20 1000B0AF */  sw         $s0, 0x10($sp)
/* CB44 8001EF24 1400B1AF */  sw         $s1, 0x14($sp)
/* CB48 8001EF28 1C00BFAF */  sw         $ra, 0x1C($sp)
/* CB4C 8001EF2C 1800B2AF */  sw         $s2, 0x18($sp)
/* CB50 8001EF30 DD7B000C */  jal        func_8001EF74
/* CB54 8001EF34 58008A8C */   lw        $t2, 0x58($a0)
/* CB58 8001EF38 1C00BF8F */  lw         $ra, 0x1C($sp)
/* CB5C 8001EF3C 1800B28F */  lw         $s2, 0x18($sp)
/* CB60 8001EF40 1400B18F */  lw         $s1, 0x14($sp)
/* CB64 8001EF44 1000B08F */  lw         $s0, 0x10($sp)
/* CB68 8001EF48 0800E003 */  jr         $ra
/* CB6C 8001EF4C 2000BD27 */   addiu     $sp, $sp, 0x20
.size func_8001EF1C, . - func_8001EF1C
