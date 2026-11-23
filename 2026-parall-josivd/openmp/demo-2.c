// Demonstração de numeração de threads em OpenMP.
// Inspiração em aula.

#include <stdio.h>
#include <omp.h>
#define NUM_THREADS 4

int main() {
	const char *messages[NUM_THREADS] = {"Ronaldo", "El Pepe", "Antedeguemon", "Authentic Games"};
	omp_set_num_threads(NUM_THREADS);
	#pragma omp parallel
	{
		int this_index = omp_get_thread_num();
		int total_num = omp_get_num_threads();
		printf("Thread %d/%d: %s\n", this_index+1, total_num, messages[this_index]);
	}
	return 0;
}

