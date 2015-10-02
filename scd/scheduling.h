#ifndef SCD_SCHEDULING_H_
#define SCD_SCHEDULING_H_

#include "scd/v_2_scd.h"

int top_sort(const vector<ReadGate>& G, int no_task, int *index);
int schedule(const ReadCircuit& readCircuit, int no_core, int **core);
void quickSort(int *arr, int *index, int left, int right);
int get_min_index(int *arr, int size);
int get_max(int *arr, int size);

#endif /* SCD_SCHEDULING_H_ */