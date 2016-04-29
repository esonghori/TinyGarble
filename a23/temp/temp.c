
#define G_SIZE 64 // size of Garbler's input array
#define E_SIZE 64 // size of Evaluator's input array
#define O_SIZE 1 // size of output array

void gc_main(const int *g,  // Garbler's input array
    const int *e,           // Evaluator's input array
    int *o                  // output array
    ) {

  int less = 0, eq = 1;
  for (int i = G_SIZE-1; i >= 0; i--)
  {
      less = (((g[i] < e[i])^less)&(eq == 1))^(g[i] < e[i]);
      eq = (((g[i] == e[i])^eq)&(eq == 1))^(g[i] == e[i]);
  }
  o[0] = less;
}
