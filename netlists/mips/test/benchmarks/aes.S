.text
#ifdef OPENSSL_FIPSCANISTER
# include <openssl/fipssyms.h>
#endif

#if !defined(__vxworks) || defined(__pic__)
.option	pic2
#endif
.set	noat
.align	5
.ent	_mips_AES_encrypt
_mips_AES_encrypt:
	.frame	$29,0,$31
	.set	reorder
	lw	$12,0($6)
	lw	$13,4($6)
	lw	$14,8($6)
	lw	$15,12($6)
	lw	$30,240($6)
	add $3,$6,16

	xor	$8 ,$8 ,$12
	xor	$9 ,$9 ,$13
	xor	$10,$10,$14
	xor	$11,$11,$15

	sub	$30,1
	srl	$1,$9,6
.Loop_enc:
	srl	$2,$10,6
	srl	$24,$11,6
	srl	$25,$8,6
	and	$1 ,$1 ,0x3fc
	and	$2 ,$2 ,0x3fc
	and	$24,$24,0x3fc
	and	$25,$25,0x3fc
	add $1 ,$1 ,$7
	add $2 ,$2 ,$7
	add $24,$24,$7
	add $25,$25,$7
	lwl	$12,2($1)		# Te1[s1>>16]
	lwl	$13,2($2)		# Te1[s2>>16]
	lwl	$14,2($24)		# Te1[s3>>16]
	lwl	$15,2($25)		# Te1[s0>>16]
	lwr	$12,3($1)		# Te1[s1>>16]
	lwr	$13,3($2)		# Te1[s2>>16]
	lwr	$14,3($24)		# Te1[s3>>16]
	lwr	$15,3($25)		# Te1[s0>>16]

	srl	$1,$10,14
	srl	$2,$11,14
	srl	$24,$8,14
	srl	$25,$9,14
	and	$1 ,$1 ,0x3fc
	and	$2 ,$2 ,0x3fc
	and	$24,$24,0x3fc
	and	$25,$25,0x3fc
	add $1 ,$1 ,$7
	add $2 ,$2 ,$7
	add $24,$24,$7
	add $25,$25,$7
	lwl	$16,1($1)		# Te2[s2>>8]
	lwl	$17,1($2)		# Te2[s3>>8]
	lwl	$18,1($24)		# Te2[s0>>8]
	lwl	$19,1($25)		# Te2[s1>>8]
	lwr	$16,2($1)		# Te2[s2>>8]
	lwr	$17,2($2)		# Te2[s3>>8]
	lwr	$18,2($24)		# Te2[s0>>8]
	lwr	$19,2($25)		# Te2[s1>>8]

	srl	$1,$11,22
	srl	$2,$8,22
	srl	$24,$9,22
	srl	$25,$10,22
	and	$1 ,$1 ,0x3fc
	and	$2 ,$2 ,0x3fc
	and	$24,$24,0x3fc
	and	$25,$25,0x3fc
	add $1 ,$1 ,$7
	add $2 ,$2 ,$7
	add $24,$24,$7
	add $25,$25,$7
	lwl	$20,0($1)		# Te3[s3]
	lwl	$21,0($2)		# Te3[s0]
	lwl	$22,0($24)		# Te3[s1]
	lwl	$23,0($25)		# Te3[s2]
	lwr	$20,1($1)		# Te3[s3]
	lwr	$21,1($2)		# Te3[s0]
	lwr	$22,1($24)		# Te3[s1]
	lwr	$23,1($25)		# Te3[s2]

	sll	$1,$8,2
	sll	$2,$9,2
	sll	$24,$10,2
	sll	$25,$11,2
	and	$1 ,$1 ,0x3fc
	and	$2 ,$2 ,0x3fc
	and	$24,$24,0x3fc
	and	$25,$25,0x3fc
	add $1 ,$1 ,$7
	add $2 ,$2 ,$7
	add $24,$24,$7
	add $25,$25,$7
	xor	$12,$12,$16
	xor	$13,$13,$17
	xor	$14,$14,$18
	xor	$15,$15,$19
	lw	$16,0($1)		# Te0[s0>>24]
	lw	$17,0($2)		# Te0[s1>>24]
	lw	$18,0($24)		# Te0[s2>>24]
	lw	$19,0($25)		# Te0[s3>>24]

	lw	$8,0($3)
	lw	$9,4($3)
	lw	$10,8($3)
	lw	$11,12($3)

	xor	$12,$12,$20
	xor	$13,$13,$21
	xor	$14,$14,$22
	xor	$15,$15,$23

	xor	$12,$12,$16
	xor	$13,$13,$17
	xor	$14,$14,$18
	xor	$15,$15,$19

	sub	$30,1
	add $3,$3,16
	xor	$8 ,$8 ,$12
	xor	$9 ,$9 ,$13
	xor	$10,$10,$14
	xor	$11,$11,$15
	.set	noreorder
	bnez	$30,.Loop_enc
	srl	$1,$9,6

	.set	reorder
	srl	$2,$10,6
	srl	$24,$11,6
	srl	$25,$8,6
	and	$1 ,$1 ,0x3fc
	and	$2 ,$2 ,0x3fc
	and	$24,$24,0x3fc
	and	$25,$25,0x3fc
	add $1 ,$1 ,$7
	add $2 ,$2 ,$7
	add $24,$24,$7
	add $25,$25,$7
	lbu	$12,2($1)		# Te4[s1>>16]
	lbu	$13,2($2)		# Te4[s2>>16]
	lbu	$14,2($24)		# Te4[s3>>16]
	lbu	$15,2($25)		# Te4[s0>>16]

	srl	$1,$10,14
	srl	$2,$11,14
	srl	$24,$8,14
	srl	$25,$9,14
	and	$1 ,$1 ,0x3fc
	and	$2 ,$2 ,0x3fc
	and	$24,$24,0x3fc
	and	$25,$25,0x3fc
	add $1 ,$1 ,$7
	add $2 ,$2 ,$7
	add $24,$24,$7
	add $25,$25,$7
	lbu	$16,2($1)		# Te4[s2>>8]
	lbu	$17,2($2)		# Te4[s3>>8]
	lbu	$18,2($24)		# Te4[s0>>8]
	lbu	$19,2($25)		# Te4[s1>>8]

	sll	$1,$8,2
	sll	$2,$9,2
	sll	$24,$10,2
	sll	$25,$11,2
	and	$1 ,$1 ,0x3fc
	and	$2 ,$2 ,0x3fc
	and	$24,$24,0x3fc
	and	$25,$25,0x3fc
	add $1 ,$1 ,$7
	add $2 ,$2 ,$7
	add $24,$24,$7
	add $25,$25,$7
	lbu	$20,2($1)		# Te4[s0>>24]
	lbu	$21,2($2)		# Te4[s1>>24]
	lbu	$22,2($24)		# Te4[s2>>24]
	lbu	$23,2($25)		# Te4[s3>>24]

	srl	$1,$11,22
	srl	$2,$8,22
	srl	$24,$9,22
	srl	$25,$10,22
	and	$1 ,$1 ,0x3fc
	and	$2 ,$2 ,0x3fc
	and	$24,$24,0x3fc
	and	$25,$25,0x3fc

	sll	$12,$12,8
	sll	$13,$13,8
	sll	$14,$14,8
	sll	$15,$15,8

	sll	$16,$16,16
	sll	$17,$17,16
	sll	$18,$18,16
	sll	$19,$19,16

	xor	$12,$12,$16
	xor	$13,$13,$17
	xor	$14,$14,$18
	xor	$15,$15,$19

	add $1 ,$1 ,$7
	add $2 ,$2 ,$7
	add $24,$24,$7
	add $25,$25,$7
	lbu	$16,2($1)		# Te4[s3]
	lbu	$17,2($2)		# Te4[s0]
	lbu	$18,2($24)		# Te4[s1]
	lbu	$19,2($25)		# Te4[s2]

	#sll	$20,$20,0
	#sll	$21,$21,0
	#sll	$22,$22,0
	#sll	$23,$23,0

	lw	$8,0($3)
	lw	$9,4($3)
	lw	$10,8($3)
	lw	$11,12($3)

	xor	$12,$12,$20
	xor	$13,$13,$21
	xor	$14,$14,$22
	xor	$15,$15,$23

	sll	$16,$16,24
	sll	$17,$17,24
	sll	$18,$18,24
	sll	$19,$19,24

	xor	$12,$12,$16
	xor	$13,$13,$17
	xor	$14,$14,$18
	xor	$15,$15,$19

	xor	$8 ,$8 ,$12
	xor	$9 ,$9 ,$13
	xor	$10,$10,$14
	xor	$11,$11,$15

	jr	$31
.end	_mips_AES_encrypt