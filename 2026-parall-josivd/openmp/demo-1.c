// Hello world em OpenMP.
// Código inspirado em aula.

#include <stdio.h>
#include <omp.h>

int main() {
	omp_set_num_threads(4);
	#pragma omp parallel
	{
		printf(":3\n");
	}
	return 0;
}

