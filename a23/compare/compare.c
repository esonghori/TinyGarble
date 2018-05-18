#define G_SIZE 32 // size of Garbler's input array
#define E_SIZE 32 // size of Evaluator's input array
#define O_SIZE 1 // size of output array

typedef unsigned int uint;

static int compare_array(const int *g, const int *e, int *o);

#ifdef __arm__
static int compare_array(const int *g, const int *e, int *o) {
  uint carry = 1;
  for(int i = 0; i < G_SIZE;i++) {
    uint nei = ~e[i];
    uint dumm = 0;
    asm (
      "cmp %[d], #1\n\t"
      "adcs %[c], %[a], %[b]\n\t"
      "mov %[dd], #0\n\t"
      "movhs %[dd], #1"  :
      [c] "=r" (dumm), [dd] "=r" (carry)  : [a] "r" (g[i]), [b] "r" (nei), [d] "r" (carry)
    );
  }
  return !carry;
}
#else 
static int compare_array(const int *g, const int *e, int *o) {
  int greater = 0;
  for(int i = 0; i < G_SIZE;i++) {
    greater = (g[i] == e[i])?greater:(g[i] < e[i]);
  }
  return greater;
}
#endif

void gc_main(const int *g,  // Garbler's input array
             const int *e,  // Evaluator's input array
             int *o         // output array
            ) {
  o[0] = compare_array(g, e, o);
}
