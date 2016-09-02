#define G_SIZE 32 // size of Garbler's input array
#define E_SIZE 32 // size of Evaluator's input array
#define O_SIZE 32 // size of output array

typedef unsigned int uint;

void gc_main(const int *g,  // Garbler's input array
    const int *e,           // Evaluator's input array
    int *o                  // output array
    ) {
  uint carry = 0;
  for (uint i = 0; i < G_SIZE; ++i) {
    o[i] = g[i] + e[i] + carry;
    uint gm = (((uint)g[i])&1<<31)>>31;
    uint em = (((uint)e[i])&1<<31)>>31;
    uint om = (((uint)o[i])&1<<31)>>31;
    carry = ((gm^om)|(em^om))^om;
  }
}
