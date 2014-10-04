#ifndef FILE_IO
#define FILE_IO

#include <string>
#include <cstring>

using namespace std;

void write_gate_list(GarbledGateS* , int *, string );
void read_gate_list(GarbledGateS*& , int *, string );
void write_task_schedule(int *, int , string );
void read_task_schedule(int *, int , string );

#endif