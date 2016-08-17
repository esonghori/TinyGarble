#define G_SIZE 16 // size of Garbler's input array
#define E_SIZE 16 // size of Evaluator's input array
#define O_SIZE 1 // size of output array

typedef unsigned char uint8_t;
typedef unsigned int uint32_t;

static int hamming_half_byte(const uint8_t g, const uint8_t e) {
  uint8_t t = g ^ e;
  uint32_t retj = 0;
  for (uint32_t i = 0; i < 4; i++) {
    retj += (t & (1 << i)) >> i;
  }
  return retj;
}

static int log2(uint32_t a) {
  uint32_t l = 0;
  while (a >>= 1) {
    ++l;
  }
  return l;
}

uint8_t dist[8 * G_SIZE * sizeof(int)];

void gc_main(const int *g,  // Garbler's input array
    const int *e,           // Evaluator's input array
    int *o                  // output array
    ) {

  const uint8_t* g8 = (const uint8_t*) g;
  const uint8_t* e8 = (const uint8_t*) e;

  for (int i=0;i<(G_SIZE * sizeof(int));i++) {
    for(int j=0;j<8;j++) {
      dist[i*8+j] = ((g8[i]^e8[i])&(1<<j))>>(j);
    }
  }

  for (int j = log2(8 * G_SIZE * sizeof(int))-1; j >= 0; j--) {
    for (int i = 0; i < (1 << j); i++) {
      dist[i] = dist[2 * i] + dist[2 * i + 1];
    }
  }
  o[0] = dist[0];
}