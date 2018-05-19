#define G_SIZE 1 // size of Garbler's input array
#define E_SIZE 1 // size of Evaluator's input array
#define O_SIZE 1 // size of output array

typedef unsigned char uint8_t;

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

//previous implementation following "An ASIC Implementation of the AES SBoxes" is removed and can be found in earlier commits
//this implementation follows http://cs-www.cs.yale.edu/homes/peralta/CircuitStuff/CMT.html

uint8_t getSBoxValue(uint8_t num){
	
	byte x, s;
	x.byte = num;
	
	byte y[3], t[8], z[2];
	
	y[1].bits.bit6	=	x.bits.bit4	^	x.bits.bit2;
	y[1].bits.bit5	=	x.bits.bit7	^	x.bits.bit1;
	y[1].bits.bit1	=	x.bits.bit7	^	x.bits.bit4;
	y[1].bits.bit0	=	x.bits.bit7	^	x.bits.bit2;
	t[0].bits.bit0	=	x.bits.bit6	^	x.bits.bit5;
	y[0].bits.bit1	=	t[0].bits.bit0	^	x.bits.bit0;
	y[0].bits.bit4	=	y[0].bits.bit1	^	x.bits.bit4;
	y[1].bits.bit4	=	y[1].bits.bit5	^	y[1].bits.bit6;
	y[0].bits.bit2	=	y[0].bits.bit1	^	x.bits.bit7;
	y[0].bits.bit5	=	y[0].bits.bit1	^	x.bits.bit1;
	y[0].bits.bit3	=	y[0].bits.bit5	^	y[1].bits.bit0;
	t[0].bits.bit1	=	x.bits.bit3	^	y[1].bits.bit4;
	y[1].bits.bit7	=	t[0].bits.bit1	^	x.bits.bit2;
	y[2].bits.bit4	=	t[0].bits.bit1	^	x.bits.bit6;
	y[0].bits.bit6	=	y[1].bits.bit7	^	x.bits.bit0;
	y[1].bits.bit2	=	y[1].bits.bit7	^	t[0].bits.bit0;
	y[1].bits.bit3	=	y[2].bits.bit4	^	y[1].bits.bit1;
	y[0].bits.bit7	=	x.bits.bit0	^	y[1].bits.bit3;
	y[2].bits.bit1	=	y[1].bits.bit2	^	y[1].bits.bit3;
	y[2].bits.bit3	=	y[1].bits.bit2	^	y[1].bits.bit0;
	y[2].bits.bit0	=	t[0].bits.bit0	^	y[1].bits.bit3;
	y[2].bits.bit5	=	y[1].bits.bit5	^	y[2].bits.bit0;
	y[2].bits.bit2	=	x.bits.bit7	^	y[2].bits.bit0;

	t[0].bits.bit2	=	y[1].bits.bit4	&	y[1].bits.bit7;
	t[0].bits.bit3	=	y[0].bits.bit3	&	y[0].bits.bit6;
	t[0].bits.bit4	=	t[0].bits.bit3	^	t[0].bits.bit2;
	t[0].bits.bit5	=	y[0].bits.bit4	&	x.bits.bit0;
	t[0].bits.bit6	=	t[0].bits.bit5	^	t[0].bits.bit2;
	t[0].bits.bit7	=	y[1].bits.bit5	&	y[2].bits.bit0;
	t[1].bits.bit0	=	y[0].bits.bit5	&	y[0].bits.bit1;
	t[1].bits.bit1	=	t[1].bits.bit0	^	t[0].bits.bit7;
	t[1].bits.bit2	=	y[0].bits.bit2	&	y[0].bits.bit7;
	t[1].bits.bit3	=	t[1].bits.bit2	^	t[0].bits.bit7;
	t[1].bits.bit4	=	y[1].bits.bit1	&	y[1].bits.bit3;
	t[1].bits.bit5	=	y[1].bits.bit6	&	y[2].bits.bit1;
	t[1].bits.bit6	=	t[1].bits.bit5	^	t[1].bits.bit4;
	t[1].bits.bit7	=	y[1].bits.bit0	&	y[1].bits.bit2;
	t[2].bits.bit0	=	t[1].bits.bit7	^	t[1].bits.bit4;
	t[2].bits.bit1	=	t[0].bits.bit4	^	t[1].bits.bit6;
	t[2].bits.bit2	=	t[0].bits.bit6	^	t[2].bits.bit0;
	t[2].bits.bit3	=	t[1].bits.bit1	^	t[1].bits.bit6;
	t[2].bits.bit4	=	t[1].bits.bit3	^	t[2].bits.bit0;
	t[2].bits.bit5	=	t[2].bits.bit1	^	y[2].bits.bit4;
	t[2].bits.bit6	=	t[2].bits.bit2	^	y[2].bits.bit3;
	t[2].bits.bit7	=	t[2].bits.bit3	^	y[2].bits.bit5;
	t[3].bits.bit0	=	t[2].bits.bit4	^	y[2].bits.bit2;

	t[3].bits.bit1	=	t[2].bits.bit5	^	t[2].bits.bit6;
	t[3].bits.bit2	=	t[2].bits.bit5	&	t[2].bits.bit7;
	t[3].bits.bit3	=	t[3].bits.bit0	^	t[3].bits.bit2;
	t[3].bits.bit4	=	t[3].bits.bit1	&	t[3].bits.bit3;
	t[3].bits.bit5	=	t[3].bits.bit4	^	t[2].bits.bit6;
	t[3].bits.bit6	=	t[2].bits.bit7	^	t[3].bits.bit0;
	t[3].bits.bit7	=	t[2].bits.bit6	^	t[3].bits.bit2;
	t[4].bits.bit0	=	t[3].bits.bit7	&	t[3].bits.bit6;
	t[4].bits.bit1	=	t[4].bits.bit0	^	t[3].bits.bit0;
	t[4].bits.bit2	=	t[2].bits.bit7	^	t[4].bits.bit1;
	t[4].bits.bit3	=	t[3].bits.bit3	^	t[4].bits.bit1;
	t[4].bits.bit4	=	t[3].bits.bit0	&	t[4].bits.bit3;
	t[4].bits.bit5	=	t[4].bits.bit4	^	t[4].bits.bit2;
	t[4].bits.bit6	=	t[3].bits.bit3	^	t[4].bits.bit4;
	t[4].bits.bit7	=	t[3].bits.bit5	&	t[4].bits.bit6;
	t[5].bits.bit0	=	t[3].bits.bit1	^	t[4].bits.bit7;

	t[5].bits.bit1	=	t[5].bits.bit0	^	t[4].bits.bit5;
	t[5].bits.bit2	=	t[3].bits.bit5	^	t[4].bits.bit1;
	t[5].bits.bit3	=	t[3].bits.bit5	^	t[5].bits.bit0;
	t[5].bits.bit4	=	t[4].bits.bit1	^	t[4].bits.bit5;
	t[5].bits.bit5	=	t[5].bits.bit2	^	t[5].bits.bit1;
	z[0].bits.bit0	=	t[5].bits.bit4	&	y[1].bits.bit7;
	z[0].bits.bit1	=	t[4].bits.bit5	&	y[0].bits.bit6;
	z[0].bits.bit2	=	t[4].bits.bit1	&	x.bits.bit0;
	z[0].bits.bit3	=	t[5].bits.bit3	&	y[2].bits.bit0;
	z[0].bits.bit4	=	t[5].bits.bit0	&	y[0].bits.bit1;
	z[0].bits.bit5	=	t[3].bits.bit5	&	y[0].bits.bit7;
	z[0].bits.bit6	=	t[5].bits.bit2	&	y[1].bits.bit3;
	z[0].bits.bit7	=	t[5].bits.bit5	&	y[2].bits.bit1;
	z[1].bits.bit0	=	t[5].bits.bit1	&	y[1].bits.bit2;
	z[1].bits.bit1	=	t[5].bits.bit4	&	y[1].bits.bit4;
	z[1].bits.bit2	=	t[4].bits.bit5	&	y[0].bits.bit3;
	z[1].bits.bit3	=	t[4].bits.bit1	&	y[0].bits.bit4;
	z[1].bits.bit4	=	t[5].bits.bit3	&	y[1].bits.bit5;
	z[1].bits.bit5	=	t[5].bits.bit0	&	y[0].bits.bit5;
	z[1].bits.bit6	=	t[3].bits.bit5	&	y[0].bits.bit2;
	z[1].bits.bit7	=	t[5].bits.bit2	&	y[1].bits.bit1;
	z[2].bits.bit0	=	t[5].bits.bit5	&	y[1].bits.bit6;
	z[2].bits.bit1	=	t[5].bits.bit1	&	y[1].bits.bit0;

	t[5].bits.bit6	=	z[1].bits.bit7	^	z[2].bits.bit0;
	t[5].bits.bit7	=	z[1].bits.bit2	^	z[1].bits.bit3;
	t[6].bits.bit0	=	z[0].bits.bit5	^	z[1].bits.bit5;
	t[6].bits.bit1	=	z[1].bits.bit1	^	z[1].bits.bit2;
	t[6].bits.bit2	=	z[0].bits.bit2	^	z[1].bits.bit4;
	t[6].bits.bit3	=	z[0].bits.bit2	^	z[0].bits.bit5;
	t[6].bits.bit4	=	z[0].bits.bit7	^	z[1].bits.bit0;
	t[6].bits.bit5	=	z[0].bits.bit0	^	z[0].bits.bit3;
	t[6].bits.bit6	=	z[0].bits.bit6	^	z[0].bits.bit7;
	t[6].bits.bit7	=	z[2].bits.bit0	^	z[2].bits.bit1;
	t[7].bits.bit0	=	z[1].bits.bit4	^	t[6].bits.bit0;
	t[7].bits.bit1	=	t[6].bits.bit2	^	t[6].bits.bit5;
	t[7].bits.bit2	=	z[0].bits.bit4	^	t[5].bits.bit6;
	t[7].bits.bit3	=	z[0].bits.bit3	^	t[6].bits.bit6;
	t[7].bits.bit4	=	t[5].bits.bit6	^	t[7].bits.bit1;
	t[7].bits.bit5	=	z[1].bits.bit6	^	t[7].bits.bit1;
	t[7].bits.bit6	=	t[6].bits.bit4	^	t[7].bits.bit2;
	t[7].bits.bit7	=	t[6].bits.bit1	^	t[7].bits.bit2;
	t[8].bits.bit0	=	z[0].bits.bit4	^	t[7].bits.bit3;
	t[8].bits.bit1	=	t[7].bits.bit5	^	t[7].bits.bit6;
	t[8].bits.bit2	=	z[0].bits.bit1	^	t[7].bits.bit7;
	s.bits.bit7	=	t[7].bits.bit3	^	t[7].bits.bit7;
	s.bits.bit1	=	~t[7].bits.bit0	^	t[7].bits.bit6;
	s.bits.bit0	=	~t[6].bits.bit0	^	t[7].bits.bit4;
	t[8].bits.bit3	=	t[8].bits.bit0	^	t[8].bits.bit1;
	s.bits.bit4	=	t[6].bits.bit5	^	t[8].bits.bit2;
	s.bits.bit3	=	t[6].bits.bit3	^	t[8].bits.bit2;
	s.bits.bit2	=	t[5].bits.bit7	^	t[8].bits.bit1;
	s.bits.bit6	=	~t[8].bits.bit0	^	s.bits.bit4;
	s.bits.bit5	=	~t[6].bits.bit7	^	t[8].bits.bit3;
	
	uint8_t SubByte;
	SubByte = s.byte;
	return SubByte;
}
 

void gc_main(const int *g,  // Garbler's input array
             const int *e,           // Evaluator's input array
             int *o                  // output array
            ) {
				
	uint8_t num, SubByte;
	
	num = ((uint8_t)g[0]^(uint8_t)e[0]);
	
	SubByte = getSBoxValue(num);
	
	o[0] = SubByte;
}