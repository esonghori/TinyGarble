#define G_SIZE 2 // size of Garbler's input array
#define E_SIZE 2 // size of Evaluator's input array
#define O_SIZE 1 // size of output array

void gc_main(const int *g,  // Garbler's input array
             const int *e,  // Evaluator's input array
             int *o         // output array
            ) {
  int equal = 1;
  int greater = 0;
  for(int i = G_SIZE - 1; i >= 0;i--) {
      greater |= equal & (g[i] < e[i]);
      equal = equal & (g[i] == e[i]);
  }
  o[0] = greater;
}
