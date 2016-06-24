#define G_SIZE 4 // size of Garbler's input array
#define E_SIZE 4 // size of Evaluator's input array
#define O_SIZE 4 // size of output array

#define COMPUTESBOX 1

typedef unsigned char uint8_t;
typedef unsigned int  uint32_t;



/*****************************************************************************/
/* Defines:                                                                  */
/*****************************************************************************/
// The number of columns comprising a state in AES. This is a constant in AES. Value=4
#define Nb 4
// The number of 32 bit words in a key.
#define Nk 4
// Key length in bytes [128 bit]
#define KEYLEN 16
// The number of rounds in AES Cipher.
#define Nr 10

// jcallan@github points out that declaring Multiply as a function 
// reduces code size considerably with the Keil ARM compiler.
// See this link for more information: https://github.com/kokke/tiny-AES128-C/pull/3
#ifndef MULTIPLY_AS_A_FUNCTION
  #define MULTIPLY_AS_A_FUNCTION 0
#endif


/*****************************************************************************/
/* Private variables:                                                        */
/*****************************************************************************/
// state - array holding the intermediate results during decryption.
typedef uint8_t state_t[4][4];
static state_t* state;

// The array that stores the round keys.
static uint8_t RoundKey[176];

// The Key input to the AES Program
static const uint8_t* Key;

// The lookup-tables are marked const so they can be placed in read-only storage instead of RAM
// The numbers below can be computed dynamically trading ROM for RAM - 
// This can be useful in (embedded) bootloader applications, where ROM is often limited.
static const uint8_t __attribute__((aligned(256))) sbox[256] =   {
  //0     1    2      3     4    5     6     7      8    9     A      B    C     D     E     F
  0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76,
  0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0, 0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0,
  0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15,
  0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75,
  0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84,
  0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf,
  0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8,
  0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5, 0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2,
  0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73,
  0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb,
  0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c, 0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79,
  0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08,
  0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a,
  0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e,
  0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf,
  0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16 };

// The round constant word array, Rcon[i], contains the values given by 
// x to th e power (i-1) being powers of x (x is denoted as {02}) in the field GF(2^8)
// Note that i starts at 1, not 0).
static const uint8_t Rcon[11] = {
  0x8d, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36};


/*****************************************************************************/
/* Private functions:                                                        */
/*****************************************************************************/

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
	uint8_t byte;
}byte;

inline static void gf_2_4_square(byte* q, byte a){
	q->bits.bit0 = a.bits.bit0^a.bits.bit2;
	q->bits.bit1 = a.bits.bit2;
	q->bits.bit2 = a.bits.bit1^a.bits.bit3;
	q->bits.bit3 = a.bits.bit3;
}

inline static void gf_2_4_mult(byte* q, byte a, byte b){
	byte t;
	t.bits.bit0 = a.bits.bit0^a.bits.bit3;
	t.bits.bit1 = a.bits.bit2^a.bits.bit3;
	t.bits.bit2 = a.bits.bit1^a.bits.bit2;
	
	q->bits.bit0 = (a.bits.bit0&b.bits.bit0)^(a.bits.bit3&b.bits.bit1)^(a.bits.bit2&b.bits.bit2)^(a.bits.bit1&b.bits.bit3);
	q->bits.bit1 = (a.bits.bit1&b.bits.bit0)^(t.bits.bit0&b.bits.bit1)^(t.bits.bit1&b.bits.bit2)^(t.bits.bit2&b.bits.bit3);
	q->bits.bit2 = (a.bits.bit2&b.bits.bit0)^(a.bits.bit1&b.bits.bit1)^(t.bits.bit0&b.bits.bit2)^(t.bits.bit1&b.bits.bit3);
	q->bits.bit3 = (a.bits.bit3&b.bits.bit0)^(a.bits.bit2&b.bits.bit1)^(a.bits.bit1&b.bits.bit2)^(t.bits.bit0&b.bits.bit3);
}

inline static void gf_2_4_inv(byte* q, byte a){
	byte t;
	t.bits.bit0 = a.bits.bit1^a.bits.bit2^a.bits.bit3^(a.bits.bit1&a.bits.bit2&a.bits.bit3);
	
	q->bits.bit0 = t.bits.bit0^a.bits.bit0^(a.bits.bit0&a.bits.bit2)^(a.bits.bit1&a.bits.bit2)^(a.bits.bit0&a.bits.bit1&a.bits.bit2);
	q->bits.bit1 = (a.bits.bit0&a.bits.bit1)^(a.bits.bit0&a.bits.bit2)^(a.bits.bit1&a.bits.bit2)^a.bits.bit3^(a.bits.bit1&a.bits.bit3)^(a.bits.bit0&a.bits.bit1&a.bits.bit3);
	q->bits.bit2 = (a.bits.bit0&a.bits.bit1)^a.bits.bit2^(a.bits.bit0&a.bits.bit2)^a.bits.bit3^(a.bits.bit0&a.bits.bit3)^(a.bits.bit0&a.bits.bit2&a.bits.bit3);
	q->bits.bit3 = t.bits.bit0^(a.bits.bit0&a.bits.bit3)^(a.bits.bit1&a.bits.bit3)^(a.bits.bit2&a.bits.bit3);
}

inline static void gf_2_4_mult_e(byte* q, byte a){
	byte t;
	t.bits.bit0 = a.bits.bit0^a.bits.bit1;
	t.bits.bit1 = a.bits.bit2^a.bits.bit3;
	
	q->bits.bit0 = a.bits.bit1^t.bits.bit1;
	q->bits.bit1 = t.bits.bit0;
	q->bits.bit2 = t.bits.bit0^a.bits.bit2;
	q->bits.bit3 = t.bits.bit0^t.bits.bit1;
}

inline static void gf_map_2_8_to_2_4(byte* al, byte* ah, byte a){
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

inline static void gf_map_2_4_to_2_8(byte* a, byte al, byte ah){
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

inline static void gf_2_8_inv(byte* q, byte a){
	byte al, ah;
	gf_map_2_8_to_2_4(&al, &ah, a);
		
	byte d;
	{
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
		gf_2_4_inv(&d, d_inv);
	}
	
	byte ah_prime;
	gf_2_4_mult(&ah_prime, ah, d);
	
	byte al_prime;	
	{
		byte ah_xor_al;
		ah_xor_al.byte = ah.byte^al.byte;
		gf_2_4_mult(&al_prime, ah_xor_al, d);
	}
	
	gf_map_2_4_to_2_8(q, al_prime, ah_prime);	
}

inline static void aff_trans(byte* q, byte a){
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
 
#if COMPUTESBOX
static uint8_t getSBoxValue(uint8_t num){
	uint8_t SubByte;
	byte q, a, a_inv;
	
	a.byte = num;
	gf_2_8_inv(&a_inv, a);
	aff_trans(&q, a_inv);
	SubByte = q.byte;
	
	return SubByte;
}

#else

static uint8_t getSBoxValue(uint8_t num)
{
  return sbox[num];
}

#endif

// This function produces Nb(Nr+1) round keys. The round keys are used in each round to decrypt the states. 
inline static void KeyExpansion(void)
{
  uint32_t i, j, k;
  uint8_t tempa[4]; // Used for the column/row operations
  
  // The first round key is the key itself.
  for(i = 0; i < Nk; ++i)
  {
    RoundKey[(i * 4) + 0] = Key[(i * 4) + 0];
    RoundKey[(i * 4) + 1] = Key[(i * 4) + 1];
    RoundKey[(i * 4) + 2] = Key[(i * 4) + 2];
    RoundKey[(i * 4) + 3] = Key[(i * 4) + 3];
  }

  // All other round keys are found from the previous round keys.
  for(; (i < (Nb * (Nr + 1))); ++i)
  {
    for(j = 0; j < 4; ++j)
    {
      tempa[j]=RoundKey[(i-1) * 4 + j];
    }
    if (i % Nk == 0)
    {
      // This function rotates the 4 bytes in a word to the left once.
      // [a0,a1,a2,a3] becomes [a1,a2,a3,a0]

      // Function RotWord()
      {
        k = tempa[0];
        tempa[0] = tempa[1];
        tempa[1] = tempa[2];
        tempa[2] = tempa[3];
        tempa[3] = k;
      }

      // SubWord() is a function that takes a four-byte input word and 
      // applies the S-box to each of the four bytes to produce an output word.

      // Function Subword()
      {
        tempa[0] = getSBoxValue(tempa[0]);
        tempa[1] = getSBoxValue(tempa[1]);
        tempa[2] = getSBoxValue(tempa[2]);
        tempa[3] = getSBoxValue(tempa[3]);
      }

      tempa[0] =  tempa[0] ^ Rcon[i/Nk];
    }
    else if (Nk > 6 && i % Nk == 4)
    {
      // Function Subword()
      {
        tempa[0] = getSBoxValue(tempa[0]);
        tempa[1] = getSBoxValue(tempa[1]);
        tempa[2] = getSBoxValue(tempa[2]);
        tempa[3] = getSBoxValue(tempa[3]);
      }
    }
    RoundKey[i * 4 + 0] = RoundKey[(i - Nk) * 4 + 0] ^ tempa[0];
    RoundKey[i * 4 + 1] = RoundKey[(i - Nk) * 4 + 1] ^ tempa[1];
    RoundKey[i * 4 + 2] = RoundKey[(i - Nk) * 4 + 2] ^ tempa[2];
    RoundKey[i * 4 + 3] = RoundKey[(i - Nk) * 4 + 3] ^ tempa[3];
  }
}

// This function adds the round key to state.
// The round key is added to the state by an XOR function.
inline static void AddRoundKey(uint8_t round)
{
  uint8_t i,j;
  for(i=0;i<4;++i)
  {
    for(j = 0; j < 4; ++j)
    {
      (*state)[i][j] ^= RoundKey[round * Nb * 4 + i * Nb + j];
    }
  }
}

// The SubBytes Function Substitutes the values in the
// state matrix with values in an S-box.
inline static void SubBytes(void)
{
  uint8_t i, j;
  for(i = 0; i < 4; ++i)
  {
    for(j = 0; j < 4; ++j)
    {
      (*state)[j][i] = getSBoxValue((*state)[j][i]);
    }
  }
}

// The ShiftRows() function shifts the rows in the state to the left.
// Each row is shifted with different offset.
// Offset = Row number. So the first row is not shifted.
inline static void ShiftRows(void)
{
  uint8_t temp;

  // Rotate first row 1 columns to left  
  temp           = (*state)[0][1];
  (*state)[0][1] = (*state)[1][1];
  (*state)[1][1] = (*state)[2][1];
  (*state)[2][1] = (*state)[3][1];
  (*state)[3][1] = temp;

  // Rotate second row 2 columns to left  
  temp           = (*state)[0][2];
  (*state)[0][2] = (*state)[2][2];
  (*state)[2][2] = temp;

  temp       = (*state)[1][2];
  (*state)[1][2] = (*state)[3][2];
  (*state)[3][2] = temp;

  // Rotate third row 3 columns to left
  temp       = (*state)[0][3];
  (*state)[0][3] = (*state)[3][3];
  (*state)[3][3] = (*state)[2][3];
  (*state)[2][3] = (*state)[1][3];
  (*state)[1][3] = temp;
}

inline static uint8_t xtime(uint8_t x)
{
  return ((x<<1) ^ (((x>>7) & 1) * 0x1b));
}

// MixColumns function mixes the columns of the state matrix
inline static void MixColumns(void)
{
  uint8_t i;
  uint8_t Tmp,Tm,t;
  for(i = 0; i < 4; ++i)
  {  
    t   = (*state)[i][0];
    Tmp = (*state)[i][0] ^ (*state)[i][1] ^ (*state)[i][2] ^ (*state)[i][3] ;
    Tm  = (*state)[i][0] ^ (*state)[i][1] ; Tm = xtime(Tm);  (*state)[i][0] ^= Tm ^ Tmp ;
    Tm  = (*state)[i][1] ^ (*state)[i][2] ; Tm = xtime(Tm);  (*state)[i][1] ^= Tm ^ Tmp ;
    Tm  = (*state)[i][2] ^ (*state)[i][3] ; Tm = xtime(Tm);  (*state)[i][2] ^= Tm ^ Tmp ;
    Tm  = (*state)[i][3] ^ t ;        Tm = xtime(Tm);  (*state)[i][3] ^= Tm ^ Tmp ;
  }
}

// Cipher is the main function that encrypts the PlainText.
inline static void Cipher(void)
{
  uint8_t round = 0;

  // Add the First round key to the state before starting the rounds.
  AddRoundKey(0); 
  
  // There will be Nr rounds.
  // The first Nr-1 rounds are identical.
  // These Nr-1 rounds are executed in the loop below.
  for(round = 1; round < Nr; ++round)
  {
    SubBytes();
    ShiftRows();
    MixColumns();
    AddRoundKey(round);
  }
  
  // The last round is given below.
  // The MixColumns function is not here in the last round.
  SubBytes();
  ShiftRows();
  AddRoundKey(Nr);
}

inline static void BlockCopy(uint8_t* output, const uint8_t* input)
{
  uint8_t i;
  for (i=0;i<KEYLEN;++i)
  {
    output[i] = input[i];
  }
}

inline static void AES128_ECB_encrypt(const uint8_t* input, const uint8_t* key, uint8_t* output)
{
  // Copy input to output, and work in-memory on output
  BlockCopy(output, input);
  state = (state_t*)output;

  Key = key;
  KeyExpansion();

  // The next function call encrypts the PlainText
  // with the Key using AES algorithm.
  Cipher();
}

void gc_main(const int *g,  // Garbler's input array (AES key)
    const int *e,           // Evaluator's input array (AES message)
    int *o                  // output array
    ) {
  AES128_ECB_encrypt((const uint8_t *)e, (const uint8_t *)g, (uint8_t *)o);
}

