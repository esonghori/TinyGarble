#include "include/read_netlist.h"


void top_sort(GarbledGateS *G, int n, int no_task, int  *index)
{
	int i, j, k, max;
	int *sl;
	
	// calculate static b-level
	sl = new int[no_task];
	
	for (i = 0; i < no_task; i++)
		index[i] = i;
	
	for (i = no_task-1; i >= 0; i--)
	{
		max = 0;
		for (j = i+1; j < no_task; j++)
		{
			if (G[j].input[0].index == i + n)
				if (sl[j] > max) max = sl[j];
			if (G[j].input[1].index == i + n)
				if (sl[j] > max) max = sl[j];
		}
		sl[i] = get_weight(G[i].type)/*G[i].w*/+ max;
	}
	
	quickSort(sl, index, 0, no_task-1); // sort in descending order of static b-level
	
	delete [] sl;
}

void schedule(int no_core, int  **core, const string &filename){

	int i, j, max;
	
	GarbledGateS *G;
	GarbledGateS *D;
	int circuit_size[4];
	int no_task;	
	read_circuit_list(G, D, circuit_size, filename);

	int n = circuit_size[0];
	no_task = circuit_size[2];
	

	int *index;	
	index = new int[no_task];
	top_sort(G, n , no_task, index);
		
	// start of scheduling
	int *p0, *p1, *core_busy, *core_index;
	
	p0 = new int[no_task];
	memset (p0, -1, no_task*sizeof(int));	
	p1 = new int[no_task];
	memset (p1, -1, no_task*sizeof(int));
	
	core_index = new int[no_core];
	memset (core_index, 0, no_core*sizeof(int));
	core_busy = new int[no_core];
	memset (core_busy, 0, no_core*sizeof(int));

	int scheduled = 0;
	while (scheduled < no_task){
		for (i = 0; i < no_task; i ++){
			if (p0[index[i]] == -1) // not assigned yet
				if(
							((G[index[i]].input[0].is_port == 1)||(p0[G[index[i]].input[0].index - n] > -1))
						&& 	((G[index[i]].input[1].is_port == 1)||(G[index[i]].input[1].index == -1)||(p0[G[index[i]].input[1].index - n] > -1))){ //ready
					p1[index[i]] = get_min_index(core_busy, no_core);
					core[p1[index[i]]][core_index[p1[index[i]]]] = index[i];
					core_index[p1[index[i]]]++;
					core_busy[p1[index[i]]] = core_busy[p1[index[i]]] + /*G[index[i]].w*/get_weight(G[index[i]].type);
					scheduled ++;
					//cout << "scheduled: " << scheduled << endl;
				}
		}
		
		for (i = 0; i < no_task; i++)
			p0[i] = p1[i];
	}	
	
	delete [] index, p0, p1, core_index, core_busy;
}

void arrange_in_time(GarbledGateS *G, int no_task, int no_core, int  **core, int  **core_x, int* end_time){
	int i, j, k;
	
	int *cti, *cur_task_done, *core_end_time, *core_completed;
	cti = new int[no_core];
	memset (cti, 0, no_core*sizeof(int));
	cur_task_done = new int[no_core];
	memset (cur_task_done, 0, no_core*sizeof(int));
	core_end_time = new int[no_core];
	memset (core_end_time, 0, no_core*sizeof(int));
	core_completed  = new int[no_core];
	memset (core_completed, 0, no_core*sizeof(int));
	int no_core_completed = 0;
	
	int *q0, *q1;
	q0 = new int[no_task];
	memset (q0, -1, no_task*sizeof(int));
	q1 = new int[no_task];
	memset (q1, -1, no_task*sizeof(int));
	
	
	i = 0;
	while (no_core_completed < no_core){
		for (j = 0; j < no_core; j++){
			if (core[j][cti[j]] > -1){
				if ( ((G[core[j][cti[j]]].input[0].is_port == 1) || (q0[G[core[j][cti[j]]].input[0].index] > -1)) && ((G[core[j][cti[j]]].input[1].is_port == 1) || (G[core[j][cti[j]]].input[1].index == -1) || (q0[G[core[j][cti[j]]].input[1].index] > -1)) ) {
					core_x[j][i] = core[j][cti[j]];
					cur_task_done[j]++;
					if (cur_task_done[j] == get_weight(G[core[j][cti[j]]].type)/*G[core[j][cti[j]]].w*/){
						q1[core[j][cti[j]]] = 0;
						cti[j]++;
						cur_task_done[j] = 0;
					}
				}
			core_end_time[j]++;
			}
			else{
				if (!core_completed[j]) no_core_completed++;
				core_completed[j] = 1;
			}
		}
		
		for (k = 0; k < no_task; k++)
			q0[k] = q1[k];
		
		i++;
	}
			
	*end_time = get_max(core_end_time, no_core);
	
	delete [] cti, cur_task_done, core_end_time, core_completed, q0, q1;
}


void quickSort(int *arr, int *index, int left, int right){
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
	quickSort(arr, index, left, j);
if (i < right)
	quickSort(arr, index, i, right);
}

int get_min_index(int *arr, int size){
	int minimum = arr[0], min_index = 0, i = 1;
	while (i < size){
		if (arr[i] < minimum){
			minimum = arr[i];
			min_index = i;
		}
		i++;
	}
	return min_index;
}

int get_max(int *arr, int size){
	int maximum = arr[0], i = 1;
	while (i < size){
		if (arr[i] > maximum)
			maximum = arr[i];
		i++;
	}
	return maximum;
}

