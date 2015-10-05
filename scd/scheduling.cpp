/*
 This file is part of TinyGarble.

 TinyGarble is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 TinyGarble is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with TinyGarble.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "scd/scheduling.h"
 
#include <cstring>

int TopSort(const vector<ReadGate>& G, int no_task, int *index) {
  
  // calculate static b-level
  int *sl = new int[no_task];

  for (int i = 0; i < no_task; i++)
    index[i] = i;

  for (int i = no_task - 1; i >= 0; i--) {
    int max = 0;
    for (int j = i + 1; j < no_task; j++) {
      if (G[j].input[0] == G[i].output)
        if (sl[j] > max)
          max = sl[j];
      if (G[j].input[1] == G[i].output)
        if (sl[j] > max)
          max = sl[j];
    }
    sl[i] = 1 + max;
  }

  // sort in descending order of static b-level
  QuickSort(sl, index, 0, no_task - 1);  

  delete[] sl;

  return 0;
}

int Schedule(const ReadCircuit &readCircuit, int no_core, int **core) {

  const vector<ReadGate>& G = readCircuit.gate_list;
  int no_task;

  int no_of_input_dff = readCircuit.no_of_inports + readCircuit.no_of_dffs;
  no_task = readCircuit.no_of_gates;

  int *index;
  index = new int[no_task];
  TopSort(G, no_task, index);

  // start of scheduling
  int *p0, *p1, *core_busy, *core_index;

  p0 = new int[no_task];
  memset(p0, -1, no_task * sizeof(int));
  p1 = new int[no_task];
  memset(p1, -1, no_task * sizeof(int));

  core_index = new int[no_core];
  memset(core_index, 0, no_core * sizeof(int));
  core_busy = new int[no_core];
  memset(core_busy, 0, no_core * sizeof(int));

  int scheduled = 0;
  while (scheduled < no_task) {
    for (int i = 0; i < no_task; i++) {
      if (p0[index[i]] == -1)  // not assigned yet
          {
        if (((G[index[i]].input[0] - no_of_input_dff < 0)
            || (p0[G[index[i]].input[0] - no_of_input_dff] > -1))) {
          if ((G[index[i]].input[1] - no_of_input_dff < 0)
              || (p0[G[index[i]].input[1] - no_of_input_dff] > -1))  //ready
              {
            p1[index[i]] = GetMinIndex(core_busy, no_core);
            core[p1[index[i]]][core_index[p1[index[i]]]] = index[i];
            core_index[p1[index[i]]]++;
            core_busy[p1[index[i]]] = core_busy[p1[index[i]]] + 1;
            scheduled++;
          }
        }
      }
    }

    for (int i = 0; i < no_task; i++) {
      p0[i] = p1[i];
    }
  }

  delete[] index;
  delete[] p0;
  delete[] p1;
  delete[] core_index;
  delete[] core_busy;

  return 0;
}

void QuickSort(int *arr, int *index, int left, int right) {
  int i = left, j = right;
  int tmp;
  int pivot = arr[(left + right) / 2];

  /* partition */
  while (i <= j) {
    while (arr[i] > pivot)
      i++;
    while (arr[j] < pivot)
      j--;
    if (i <= j) {
      tmp = arr[i];
      arr[i] = arr[j];
      arr[j] = tmp;

      tmp = index[i];
      index[i] = index[j];
      index[j] = tmp;

      i++;
      j--;
    }
  }
  /* recursion */
  if (left < j)
    QuickSort(arr, index, left, j);
  if (i < right)
    QuickSort(arr, index, i, right);
}

int GetMinIndex(int *arr, int size) {
  int minimum = arr[0], min_index = 0, i = 1;
  while (i < size) {
    if (arr[i] < minimum) {
      minimum = arr[i];
      min_index = i;
    }
    i++;
  }
  return min_index;
}

int GetMax(int *arr, int size) {
  int maximum = arr[0], i = 1;
  while (i < size) {
    if (arr[i] > maximum)
      maximum = arr[i];
    i++;
  }
  return maximum;
}

