#define G_SIZE 64 // size of Garbler's input array
#define E_SIZE 64 // size of Evaluator's input array
#define O_SIZE 8 // size of output array

#define V 8
#define INT_MAX 32767


int graph[V][V];

// A utility function to find the vertex with minimum distance value, from
// the set of vertices not yet included in shortest path tree
int minDistance(int dist[], int sptSet[]) {
  // Initialize min value
  int min = INT_MAX, min_index;

  for (int v = 0; v < V; v++) {
    if (sptSet[v] == 0 && dist[v] <= min) {
      min = dist[v];
      min_index = v;
    }
  }

  return min_index;
}

// Function that implements Dijkstra's single source shortest path algorithm
// for a graph represented using adjacency matrix representation
void dijkstra(int src, int dist[]) {
  int sptSet[V];  // sptSet[i] will true if vertex i is included in shortest
                    // path tree or shortest distance from src to i is finalized

  // Initialize all distances as INFINITE and stpSet[] as false
  for (int i = 0; i < V; i++) {
    dist[i] = INT_MAX;
    sptSet[i] = 0;
  }

  // Distance of source vertex from itself is always 0
  dist[src] = 0;

  // Find shortest path for all vertices
  for (int count = 0; count < V - 1; count++) {
    // Pick the minimum distance vertex from the set of vertices not
    // yet processed. u is always equal to src in first iteration.
    int u = minDistance(dist, sptSet);

    // Mark the picked vertex as processed
    sptSet[u] = 0;

    // Update dist value of the adjacent vertices of the picked vertex.
    for (int v = 0; v < V; v++) {
      // Update dist[v] only if is not in sptSet, there is an edge from 
      // u to v, and total weight of path from src to  v through u is 
      // smaller than current value of dist[v]
      if (!sptSet[v] && graph[u][v] && dist[u] != INT_MAX
          && dist[u] + graph[u][v] < dist[v]) {
        dist[v] = dist[u] + graph[u][v];
      }
    }
  }
}

void gc_main(const int *g,  // xor-shared adjacency matrix representation
    const int *e,           // xor-shared adjacency matrix representation
    int *o                  // output distance
    ) {

  for (int i = 0; i < V; ++i) {
    for (int j = 0; j < V; ++j) {
      graph[i][j] = g[V * i + j] ^ e[V * i + j];
    }
  }

  dijkstra(0, o);
}
