#define X_SIZE 1
#define Y_SIZE 1
#define Z_SIZE 1

int data0 [7] = {0x12, 0x13, 0x16, 0x22, 0xa4, 0x3d, 0x56};
int data1 [7] = {};
int data2 [7] = {};

void gc_main(const int *x,const int *y, int *z) {
  for(int i=0;i<7;i++){
    data1[i] = data0[i];
  }
  for(int i=0;i<7;i++){
    data2[i] = data1[i];
  }

  z[0] = data2[6];
}


