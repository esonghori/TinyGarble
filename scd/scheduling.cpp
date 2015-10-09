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
#include "util/common.h"

int TopSort(const vector<ReadGate>& G, int64_t no_task, int64_t *index) {

  // calculate static b-level
  int64_t *sl = new int64_t[no_task];

  for (int64_t i = 0; i < no_task; i++)
    index[i] = i;

  for (int64_t i = no_task - 1; i >= 0; i--) {
    int64_t max = 0;
    for (int64_t j = i + 1; j < no_task; j++) {
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
  return SUCCESS;
}

int Schedule(const ReadCircuit &readCircuit, int64_t no_core, int64_t **core) {

  const vector<ReadGate>& G = readCircuit.gate_list;
  int64_t no_task;

  int64_t input_size = readCircuit.g_init_size + readCircuit.e_init_size
      + readCircuit.g_input_size + readCircuit.e_input_size;

  int64_t no_of_input_dff = input_size + readCircuit.dff_size;
  no_task = readCircuit.gate_size;

  int64_t *index;
  index = new int64_t[no_task];
  TopSort(G, no_task, index);

  // start of scheduling
  int64_t *p0, *p1, *core_busy, *core_index;

  p0 = new int64_t[no_task];
  memset(p0, -1, no_task * sizeof(int64_t));
  p1 = new int64_t[no_task];
  memset(p1, -1, no_task * sizeof(int64_t));

  core_index = new int64_t[no_core];
  memset(core_index, 0, no_core * sizeof(int64_t));
  core_busy = new int64_t[no_core];
  memset(core_busy, 0, no_core * sizeof(int64_t));

  int64_t scheduled = 0;
  while (scheduled < no_task) {
    for (int64_t i = 0; i < no_task; i++) {
      if (p0[index[i]] == ((int64_t)-1))  // not assigned yet
          {
        if (((G[index[i]].input[0] - no_of_input_dff < 0)
            || (p0[G[index[i]].input[0] - no_of_input_dff] != int64_t(-1)))) {
          if ((G[index[i]].input[1] - no_of_input_dff < 0)
              || (p0[G[index[i]].input[1] - no_of_input_dff] != int64_t(-1)))  //ready
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

    for (int64_t i = 0; i < no_task; i++) {
      p0[i] = p1[i];
    }
  }

  delete[] index;
  delete[] p0;
  delete[] p1;
  delete[] core_index;
  delete[] core_busy;

  return SUCCESS;
}

int QuickSort(int64_t *arr, int64_t *index, int64_t left, int64_t right) {
  int64_t i = left, j = right;
  int64_t tmp;
  int64_t pivot = arr[(left + right) / 2];

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

  return SUCCESS;
}

int64_t GetMinIndex(int64_t *arr, int64_t size) {
  int64_t minimum = arr[0], min_index = 0, i = 1;
  while (i < size) {
    if (arr[i] < minimum) {
      minimum = arr[i];
      min_index = i;
    }
    i++;
  }
  return min_index;
}

int64_t GetMax(int64_t *arr, int64_t size) {
  int64_t maximum = arr[0], i = 1;
  while (i < size) {
    if (arr[i] > maximum)
      maximum = arr[i];
    i++;
  }
  return maximum;
}

