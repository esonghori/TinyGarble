#ifndef SCHEDULING
#define SCHEDULING

#include <cstring>
#include "parse_netlist.h"

#define DEBUG_SCHEDULER 0

void top_sort(GarbledGate *, int, int  *);
void schedule(int, int **, string);
void arrange_in_time(GarbledGate *, int, int, int  **, int  **, int *);
void quickSort(int *, int *, int, int);
int get_min_index(int *, int);
int get_max(int *, int);

#endif