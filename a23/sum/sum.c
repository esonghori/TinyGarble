#define G_SIZE 32 // size of Garbler's input array
#define E_SIZE 32 // size of Evaluator's input array
#define O_SIZE 32 // size of output array

typedef unsigned int uint;

// o = g + e
void sum_array(const int *g, const int *e, int *o);

#ifdef __arm__
void sum_array(const int *g, const int *e, int *o) {
  uint carry = 0;
  for (uint i = 0; i < G_SIZE-1; ++i) {
    asm (
      "cmp %[d], #1\n\t"
      "adcs %[c], %[a], %[b]\n\t"
      "mov %[dd], #0\n\t"
      "movhs %[dd], #1"  :
      [c] "=r" (o[i]), [dd] "=r" (carry) :
      [a] "r" (g[i]), [b] "r" (e[i]), [d] "r" (carry)
    );
  }
  asm (
    "cmp %[d], #1\n\t"
    "adc %[c], %[a], %[b]\n\t" :
    [c] "=r" (o[G_SIZE-1]) :
    [a] "r" (g[G_SIZE-1]), [b] "r" (e[G_SIZE-1]), [d] "r" (carry)
  );
}
#else 
void sum_array(const int *g, const int *e, int *o) {
  uint carry = 0;
  for (uint i = 0; i < G_SIZE; ++i) {
    o[i] = g[i] + e[i] + carry;
    uint gm = (((uint)g[i])&1<<31)>>31;
    uint em = (((uint)e[i])&1<<31)>>31;
    uint om = (((uint)o[i])&1<<31)>>31;
    carry = ((gm^om)|(em^om))^om;
  }
}
#endif


void gc_main(const int *g,  // Garbler's input array
    const int *e,           // Evaluator's input array
    int *o                  // output array
    ) {
  sum_array(g, e, o);
}
