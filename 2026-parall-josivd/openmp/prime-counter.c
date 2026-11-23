// Contagem de números primos.
// Adaptação do original, disponibilizado no exercício impresso.

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <omp.h>

int prime(long int n) {
	long int i;
	for (i = 3; i < sqrt(n) + 1; i += 2) {
		if (n % i == 0) {
			return 0;
		}
	}
	return 1;
}

int main(int argc, char *argv[]) {
	double t_start, t_end;
	long int i, n, total;
	if (argc < 2) {
		printf("Valor inválido. Entre com o valor do maior inteiro.\n");
		return 0;
	}
	n = strtol(argv[1], (char **)NULL, 10);
	total = 0;
	t_start = omp_get_wtime();
	#pragma omp parallel for reduction(+:total) schedule(static)
	for (i = 3; i <= n; i += 2) {
		if (prime(i) == 1) {
			total++;
		}
	}
	total += 1;
	t_end = omp_get_wtime();
	printf("Quantidade de primos entre 1 e %ld: %ld\n", n, total);
	printf("Tempo de execução: %f com %d threads\n", (t_end - t_start), omp_get_max_threads());
	return 0;
}
