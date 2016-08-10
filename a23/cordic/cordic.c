#define G_SIZE 1 // size of Garbler's input array
#define E_SIZE 1 // size of Evaluator's input array
#define O_SIZE 2 // size of output array

//Source: http://www.dcs.gla.ac.uk/~jhw/cordic/
//Cordic in 32 bit signed fixed point math
//Function is valid for arguments in range -pi/2 -- pi/2
//for values pi/2--pi: value = half_pi-(theta-half_pi) and similarly for values -pi---pi/2
//
// 1.0 = 1073741824
// 1/k = 0.6072529350088812561694
// pi = 3.1415926535897932384626
//Constants
#define cordic_1K 0x26DD3B6A
#define half_pi 0x6487ED51
#define MUL 1073741824.000000
#define CORDIC_NTAB 32
int cordic_ctab[] = { 0x3243F6A8, 0x1DAC6705, 0x0FADBAFC, 0x07F56EA6,
    0x03FEAB76, 0x01FFD55B, 0x00FFFAAA, 0x007FFF55, 0x003FFFEA, 0x001FFFFD,
    0x000FFFFF, 0x0007FFFF, 0x0003FFFF, 0x0001FFFF, 0x0000FFFF, 0x00007FFF,
    0x00003FFF, 0x00001FFF, 0x00000FFF, 0x000007FF, 0x000003FF, 0x000001FF,
    0x000000FF, 0x0000007F, 0x0000003F, 0x0000001F, 0x0000000F, 0x00000008,
    0x00000004, 0x00000002, 0x00000001, 0x00000000, };

static void cordic(int theta, int *s, int *c) {
  int k, d, tx, ty, tz;
  int x = cordic_1K, y = 0, z = theta;
  //n = (n > CORDIC_NTAB) ? CORDIC_NTAB : n;
  for (k = 0; k < CORDIC_NTAB; ++k) {
    d = z >> 31;  //get sign.
    tx = x - (((y >> k) ^ d) - d);
    ty = y + (((x >> k) ^ d) - d);
    tz = z - ((cordic_ctab[k] ^ d) - d);
    x = tx;
    y = ty;
    z = tz;
  }
  *c = x;
  *s = y;
}

void gc_main(const int *g,  // Garbler's input array
    const int *e,           // Evaluator's input array
    int *o                  // output array
    ) {
  int theta = g[0] ^ e[0];
  cordic(theta, &o[0], &o[1]);
}
