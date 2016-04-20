
#define G_SIZE 2 // size of Garbler's input array
#define E_SIZE 2 // size of Evaluator's input array
#define O_SIZE 1 // size of output array

void gc_main(const int *g,  // Garbler's input array
    const int *e,           // Evaluator's input array
    int *o                  // output array
    ) {
  int ret = 0;
  for(int j = 0; j < G_SIZE; j++) {
    unsigned int t = (unsigned int)(g[j]^e[j]); 
    for(unsigned int i = 0; i < 8*sizeof(int); i++) {
      ret += (t&(1<<i))>>i;
    }
  }
  o[0] = ret;
}
