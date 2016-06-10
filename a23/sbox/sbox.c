#define G_SIZE 1 // size of Garbler's input array
#define E_SIZE 1 // size of Evaluator's input array
#define O_SIZE 1 // size of output array

typedef union{
	struct {
		unsigned int bit0 : 1;
		unsigned int bit1 : 1;
		unsigned int bit2 : 1;
		unsigned int bit3 : 1;
		unsigned int bit4 : 1;
		unsigned int bit5 : 1;
		unsigned int bit6 : 1;
		unsigned int bit7 : 1;
	}bits;
	unsigned char byte;
}byte;

void gf_2_4_square(byte* q, byte a){
	q->bits.bit0 = a.bits.bit0^a.bits.bit2;
	q->bits.bit1 = a.bits.bit2;
	q->bits.bit2 = a.bits.bit1^a.bits.bit3;
	q->bits.bit3 = a.bits.bit3;
}

#if 0
void gf_2_4_mult(byte* q, byte a, byte b){
	byte t;
	t.bits.bit0 = a.bits.bit0^a.bits.bit3;
	t.bits.bit1 = a.bits.bit2^a.bits.bit3;
	t.bits.bit2 = a.bits.bit1^a.bits.bit2;
	
	byte u1, v1, w1, u2, v2, w2;
	
	u1.bits.bit0 = a.bits.bit0;
	u1.bits.bit1 = a.bits.bit3;
	u1.bits.bit2 = a.bits.bit2;
	u1.bits.bit3 = a.bits.bit1;
	u1.bits.bit4 = a.bits.bit1;
	u1.bits.bit5 = t.bits.bit0;
	u1.bits.bit6 = t.bits.bit1;
	u1.bits.bit7 = t.bits.bit2;
	
	v1.bits.bit0 = b.bits.bit0;
	v1.bits.bit1 = b.bits.bit1;
	v1.bits.bit2 = b.bits.bit2;
	v1.bits.bit3 = b.bits.bit3;
	v1.bits.bit4 = b.bits.bit0;
	v1.bits.bit5 = b.bits.bit1;
	v1.bits.bit6 = b.bits.bit2;
	v1.bits.bit7 = b.bits.bit3;
	
	w1.byte = u1.byte&v1.byte;	
	
	u2.bits.bit0 = a.bits.bit2;
	u2.bits.bit1 = a.bits.bit1;
	u2.bits.bit2 = t.bits.bit0;
	u2.bits.bit3 = t.bits.bit1;
	u2.bits.bit4 = a.bits.bit3;
	u2.bits.bit5 = a.bits.bit2;
	u2.bits.bit6 = a.bits.bit1;
	u2.bits.bit7 = t.bits.bit0;
	
	v2.bits.bit0 = b.bits.bit0;
	v2.bits.bit1 = b.bits.bit1;
	v2.bits.bit2 = b.bits.bit2;
	v2.bits.bit3 = b.bits.bit3;
	v2.bits.bit4 = b.bits.bit0;
	v2.bits.bit5 = b.bits.bit1;
	v2.bits.bit6 = b.bits.bit2;
	v2.bits.bit7 = b.bits.bit3;
	
	w2.byte = u2.byte&v2.byte;
	
	q->bits.bit0 = w1.bits.bit0^w1.bits.bit1^w1.bits.bit2^w1.bits.bit3;
	q->bits.bit1 = w1.bits.bit4^w1.bits.bit5^w1.bits.bit6^w1.bits.bit7;
	q->bits.bit2 = w2.bits.bit0^w2.bits.bit1^w2.bits.bit2^w2.bits.bit3;
	q->bits.bit3 = w2.bits.bit4^w2.bits.bit5^w2.bits.bit6^w2.bits.bit7;
}

void gf_2_4_inv(byte* q, byte a){	
	byte u1, v1, w1, u2, v2, w2;
	
	u1.bits.bit0 = a.bits.bit0;
	u1.bits.bit1 = a.bits.bit1;
	u1.bits.bit2 = a.bits.bit0;
	u1.bits.bit3 = a.bits.bit1;
	u1.bits.bit4 = a.bits.bit0;
	u1.bits.bit5 = a.bits.bit2;
	
	v1.bits.bit0 = a.bits.bit2;
	v1.bits.bit1 = a.bits.bit2;
	v1.bits.bit2 = a.bits.bit1;
	v1.bits.bit3 = a.bits.bit3;
	v1.bits.bit4 = a.bits.bit3;
	v1.bits.bit5 = a.bits.bit3;
	
	w1.byte = u1.byte&v1.byte;
	
	u2.bits.bit0 = a.bits.bit3;
	u2.bits.bit1 = a.bits.bit0;
	u2.bits.bit2 = a.bits.bit3;
	u2.bits.bit3 = a.bits.bit3;
	
	v2.bits.bit0 = w1.bits.bit1;
	v2.bits.bit1 = w1.bits.bit1;
	v2.bits.bit2 = w1.bits.bit2;
	v2.bits.bit3 = w1.bits.bit0;
	
	w2.byte = u2.byte&v2.byte;
	
	byte t;
	t.bits.bit0 = a.bits.bit1^a.bits.bit2^a.bits.bit3^w2.bits.bit0;
	
	q->bits.bit0 = t.bits.bit0^a.bits.bit0^w1.bits.bit0^w1.bits.bit1^w2.bits.bit1;
	q->bits.bit1 = w1.bits.bit2^w1.bits.bit0^w1.bits.bit1^a.bits.bit3^w1.bits.bit3^w2.bits.bit2;
	q->bits.bit2 = w1.bits.bit2^a.bits.bit2^w1.bits.bit0^a.bits.bit3^w1.bits.bit4^w2.bits.bit3;
	q->bits.bit3 = t.bits.bit0^w1.bits.bit4^w1.bits.bit3^w1.bits.bit5;
}

#else
void gf_2_4_mult(byte* q, byte a, byte b){
	byte t;
	t.bits.bit0 = a.bits.bit0^a.bits.bit3;
	t.bits.bit1 = a.bits.bit2^a.bits.bit3;
	t.bits.bit2 = a.bits.bit1^a.bits.bit2;
	
	q->bits.bit0 = (a.bits.bit0&b.bits.bit0)^(a.bits.bit3&b.bits.bit1)^(a.bits.bit2&b.bits.bit2)^(a.bits.bit1&b.bits.bit3);
	q->bits.bit1 = (a.bits.bit1&b.bits.bit0)^(t.bits.bit0&b.bits.bit1)^(t.bits.bit1&b.bits.bit2)^(t.bits.bit2&b.bits.bit3);
	q->bits.bit2 = (a.bits.bit2&b.bits.bit0)^(a.bits.bit1&b.bits.bit1)^(t.bits.bit0&b.bits.bit2)^(t.bits.bit1&b.bits.bit3);
	q->bits.bit3 = (a.bits.bit3&b.bits.bit0)^(a.bits.bit2&b.bits.bit1)^(a.bits.bit1&b.bits.bit2)^(t.bits.bit0&b.bits.bit3);
}

void gf_2_4_inv(byte* q, byte a){
	byte t;
	t.bits.bit0 = a.bits.bit1^a.bits.bit2^a.bits.bit3^(a.bits.bit1&a.bits.bit2&a.bits.bit3);
	
	q->bits.bit0 = t.bits.bit0^a.bits.bit0^(a.bits.bit0&a.bits.bit2)^(a.bits.bit1&a.bits.bit2)^(a.bits.bit0&a.bits.bit1&a.bits.bit2);
	q->bits.bit1 = (a.bits.bit0&a.bits.bit1)^(a.bits.bit0&a.bits.bit2)^(a.bits.bit1&a.bits.bit2)^a.bits.bit3^(a.bits.bit1&a.bits.bit3)^(a.bits.bit0&a.bits.bit1&a.bits.bit3);
	q->bits.bit2 = (a.bits.bit0&a.bits.bit1)^a.bits.bit2^(a.bits.bit0&a.bits.bit2)^a.bits.bit3^(a.bits.bit0&a.bits.bit3)^(a.bits.bit0&a.bits.bit2&a.bits.bit3);
	q->bits.bit3 = t.bits.bit0^(a.bits.bit0&a.bits.bit3)^(a.bits.bit1&a.bits.bit3)^(a.bits.bit2&a.bits.bit3);
}
#endif

void gf_2_4_mult_e(byte* q, byte a){
	byte t;
	t.bits.bit0 = a.bits.bit0^a.bits.bit1;
	t.bits.bit1 = a.bits.bit2^a.bits.bit3;
	
	q->bits.bit0 = a.bits.bit1^t.bits.bit1;
	q->bits.bit1 = t.bits.bit0;
	q->bits.bit2 = t.bits.bit0^a.bits.bit2;
	q->bits.bit3 = t.bits.bit0^t.bits.bit1;
}

void gf_map_2_8_to_2_4(byte* al, byte* ah, byte a){
	byte t;	
	t.bits.bit0 = a.bits.bit1^a.bits.bit7;
	t.bits.bit1 = a.bits.bit5^a.bits.bit7;
	t.bits.bit2 = a.bits.bit4^a.bits.bit6;
	
	al->bits.bit0 = t.bits.bit2^a.bits.bit0^a.bits.bit5;
	al->bits.bit1 = a.bits.bit1^a.bits.bit2;
	al->bits.bit2 = t.bits.bit0;
	al->bits.bit3 = a.bits.bit2^a.bits.bit4;
	
	ah->bits.bit0 = t.bits.bit2^a.bits.bit5;
	ah->bits.bit1 = t.bits.bit0^t.bits.bit2;
	ah->bits.bit2 = t.bits.bit1^a.bits.bit2^a.bits.bit3;
	ah->bits.bit3 = t.bits.bit1;
}

void gf_map_2_4_to_2_8(byte* a, byte al, byte ah){
	byte t;	
	t.bits.bit0 = al.bits.bit1^ah.bits.bit3;
	t.bits.bit1 = ah.bits.bit0^ah.bits.bit1;
	
	a->bits.bit0 = al.bits.bit0^ah.bits.bit0;
	a->bits.bit1 = t.bits.bit1^ah.bits.bit3;
	a->bits.bit2 = t.bits.bit0^t.bits.bit1;
	a->bits.bit3 = t.bits.bit1^al.bits.bit1^ah.bits.bit2;
	a->bits.bit4 = t.bits.bit0 ^t.bits.bit1^al.bits.bit3;
	a->bits.bit5 = t.bits.bit1^al.bits.bit2;
	a->bits.bit6 = t.bits.bit0 ^al.bits.bit2^al.bits.bit3^ah.bits.bit0;
	a->bits.bit7 = t.bits.bit1^al.bits.bit2^ah.bits.bit3;
}

void gf_2_8_inv(byte* q, byte a){
	byte al, ah;
	gf_map_2_8_to_2_4(&al, &ah, a);
	
	byte ah_sqr;
	gf_2_4_square(&ah_sqr, ah);
	byte ah_sqr_times_e;
	gf_2_4_mult_e(&ah_sqr_times_e, ah_sqr);
	byte ah_times_al;
	gf_2_4_mult(&ah_times_al, ah, al);
	byte al_sqr;
	gf_2_4_square(&al_sqr, al);	
	byte d_inv;
	d_inv.byte = ah_sqr_times_e.byte^ah_times_al.byte^al_sqr.byte;	
	byte d;
	gf_2_4_inv(&d, d_inv);
	
	byte ah_prime;
	gf_2_4_mult(&ah_prime, ah, d);
	
	byte ah_xor_al;
	ah_xor_al.byte = ah.byte^al.byte;
	byte al_prime;	
	gf_2_4_mult(&al_prime, ah_xor_al, d);
	
	gf_map_2_4_to_2_8(q, al_prime, ah_prime);	
}

void aff_trans(byte* q, byte a){
	byte t;
	t.bits.bit0 = a.bits.bit0^a.bits.bit1;
	t.bits.bit1 = a.bits.bit2^a.bits.bit3;
	t.bits.bit2 = a.bits.bit4^a.bits.bit5;
	t.bits.bit3 = a.bits.bit6^a.bits.bit7;
	
	q->bits.bit0 = (~a.bits.bit0)^t.bits.bit2^t.bits.bit3;
	q->bits.bit1 = (~a.bits.bit5)^t.bits.bit0^t.bits.bit3;
	q->bits.bit2 = a.bits.bit2^t.bits.bit0^t.bits.bit3;
	q->bits.bit3 = a.bits.bit7^t.bits.bit0^t.bits.bit1;
	q->bits.bit4 = a.bits.bit4^t.bits.bit0^t.bits.bit1;
	q->bits.bit5 = (~a.bits.bit1)^t.bits.bit1^t.bits.bit2;
	q->bits.bit6 = (~a.bits.bit6)^t.bits.bit1^t.bits.bit2;
	q->bits.bit7 = a.bits.bit3^t.bits.bit2^t.bits.bit3;
}

void inv_aff_trans(byte* q, byte a){
	byte t;
	t.bits.bit0 = a.bits.bit0^a.bits.bit5;
	t.bits.bit1 = a.bits.bit1^a.bits.bit4;
	t.bits.bit2 = a.bits.bit2^a.bits.bit7;
	t.bits.bit3 = a.bits.bit3^a.bits.bit6;
	
	q->bits.bit0 = (~a.bits.bit5)^t.bits.bit2;
	q->bits.bit1 = a.bits.bit0^t.bits.bit3;
	q->bits.bit2 = (~a.bits.bit7)^t.bits.bit1;
	q->bits.bit3 = a.bits.bit2^t.bits.bit0;
	q->bits.bit4 = a.bits.bit1^t.bits.bit3;
	q->bits.bit5 = a.bits.bit4^t.bits.bit2;
	q->bits.bit6 = a.bits.bit3^t.bits.bit0;
	q->bits.bit7 = a.bits.bit6^t.bits.bit1;
}

void  sub_byte(byte* q, byte a){  
	byte a_inv;
	gf_2_8_inv(&a_inv, a);
	aff_trans(q, a_inv);
}  

void  inv_sub_byte(byte* q, byte a){  
	byte q_inv;
	inv_aff_trans(&q_inv, a);
	gf_2_8_inv(q, q_inv);
}  
 

void gc_main(const int *g,  // Garbler's input array
             const int *e,           // Evaluator's input array
             int *o                  // output array
            ) {
				
	byte A, A_sub;
	
	A.byte = (unsigned char)((unsigned char)g[0]^(unsigned char)e[0]);
	
	sub_byte(&A_sub, A);
	
	o[0] = A_sub.byte;
}