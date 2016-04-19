
#define G_SIZE 1 // size of Garbler's input array
#define E_SIZE 1 // size of Evaluator's input array
#define O_SIZE 1 // size of output array

void gc_main(const int *g,  // Garbler's input array
    const int *e,           // Evaluator's input array
    int *o                  // output array
    ) {
  int ret = 0;
  for (int i = 0; i < G_SIZE; ++i) {
    o[i] = g[i] + e[i];
  }
}
