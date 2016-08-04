#define G_SIZE 20 // size of Garbler's input array
#define E_SIZE 20 // size of Evaluator's input array
#define O_SIZE 1 // size of output array

// SEL(s, a, b) is equal to s?a:b
// Implemnet as a MUX
#define SEL(s, a, b) ((((a)^(b))&(s))^(b))

void gc_main(const int *g,  // Garbler's input array
             const int *e,  // Evaluator's input array
             int *o         // output array
            ) {
  int greater = 0;
  for(int i = 0; i < G_SIZE;i++) {
    // greater = (g[i] == e[i])?greater:(g[i] < e[i]);
    greater = SEL(g[i] == e[i], greater, g[i] < e[i]);
    o[i] = g[i] ^ e[i]; // dummy operation to avoid bad resgiter allocation
  }
  o[0] = greater;
}
