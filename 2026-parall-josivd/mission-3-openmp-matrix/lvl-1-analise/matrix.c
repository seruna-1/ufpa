/*
 * MISSÃO 3 - PROGRAMAÇÃO PARALELA COM OPENMP
 * Código-base SEQUENCIAL - Multiplicação de Matrizes
 *
 * Objetivo:
 * Este código é propositalmente sequencial. A equipe deverá analisá-lo
 * e desenvolver sua própria versão paralela utilizando OpenMP.
 *
 * Compilação (GCC):
 *   gcc -O2 -std=c11 -fopenmp multiplicacao_matrizes.c -o matrizes
 *
 * Linux/macOS:
 *   ./matrizes 500
 *
 * Windows (MinGW):
 *   matrizes.exe 500
 *
 * Observação:
 * Não há regiões paralelas neste arquivo. A biblioteca OpenMP é usada
 * exclusivamente para medir tempo decorrido com omp_get_wtime().
 */

#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <errno.h>
#include <limits.h>
#include <stdint.h>

static double tempo_atual(void) {
    return omp_get_wtime();
}

/*
 * Geração determinística:
 * para a mesma dimensão, os valores das matrizes serão sempre iguais.
 * Isso facilita a comparação entre a versão sequencial e a versão paralela.
 */
static void inicializar_matrizes(double *A, double *B, int n) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            A[(size_t)i * (size_t)n + (size_t)j] = (double)(((i * 17 + j * 13) % 100) + 1) / 100.0;
            B[(size_t)i * (size_t)n + (size_t)j] = (double)(((i * 11 + j * 19) % 100) + 1) / 100.0;
        }
    }
}

static void zerar_matriz(double *C, int n) {
    size_t total = (size_t)n * (size_t)n;
    for (size_t i = 0; i < total; i++) {
        C[i] = 0.0;
    }
}

/*
 * Região principal de processamento.
 * Analise cuidadosamente os laços e as dependências antes de modificar.
 */
static void multiplicar(const double *A, const double *B, double *C, int n) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            double soma = 0.0;
            for (int k = 0; k < n; k++) {
                soma += A[(size_t)i * (size_t)n + (size_t)k] * B[(size_t)k * (size_t)n + (size_t)j];
            }
            C[(size_t)i * (size_t)n + (size_t)j] = soma;
        }
    }
}

/*
 * Checksum simples para verificar se duas execuções produziram
 * resultados equivalentes. Não substitui uma validação numérica completa,
 * mas serve como referência didática para esta missão.
 */
static double calcular_checksum(const double *C, int n) {
    double soma = 0.0;
    size_t total = (size_t)n * (size_t)n;
    for (size_t i = 0; i < total; i++) {
        soma += C[i];
    }
    return soma;
}

static int dimensao_valida(int n) {
    return n == 500 || n == 1000 || n == 2000;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr,
                "Uso: %s <dimensao>\n"
                "Dimensoes padronizadas da missao: 500, 1000 ou 2000.\n",
                argv[0]);
        return EXIT_FAILURE;
    }

    errno = 0;
    char *fim_argumento = NULL;
    long valor = strtol(argv[1], &fim_argumento, 10);
    if (errno != 0 || fim_argumento == argv[1] || *fim_argumento != '\0' ||
        valor < INT_MIN || valor > INT_MAX) {
        fprintf(stderr, "Dimensao invalida. Utilize 500, 1000 ou 2000.\n");
        return EXIT_FAILURE;
    }
    int n = (int)valor;

    if (!dimensao_valida(n)) {
        fprintf(stderr,
                "Dimensao invalida. Utilize 500, 1000 ou 2000.\n");
        return EXIT_FAILURE;
    }

    size_t total = (size_t)n * (size_t)n;

    if (total > SIZE_MAX / sizeof(double)) {
        fprintf(stderr, "Dimensao muito grande para este sistema.\n");
        return EXIT_FAILURE;
    }

    double *A = malloc(total * sizeof(double));
    double *B = malloc(total * sizeof(double));
    double *C = malloc(total * sizeof(double));

    if (A == NULL || B == NULL || C == NULL) {
        fprintf(stderr, "Erro: memoria insuficiente para alocar as matrizes.\n");
        free(A);
        free(B);
        free(C);
        return EXIT_FAILURE;
    }

    printf("=== Multiplicacao de Matrizes ===\n");
    printf("Dimensao: %d x %d\n", n, n);
    printf("Modo: Sequencial\n\n");

    printf("Inicializando matrizes...\n");
    inicializar_matrizes(A, B, n);
    zerar_matriz(C, n);

    printf("Executando multiplicacao...\n");

    double inicio = tempo_atual();
    multiplicar(A, B, C, n);
    double fim = tempo_atual();

    double checksum = calcular_checksum(C, n);

    printf("\nTempo de execucao: %.6f segundos\n", fim - inicio);
    printf("Checksum: %.10f\n", checksum);
    printf("\nExecucao concluida.\n");

    free(A);
    free(B);
    free(C);

    return EXIT_SUCCESS;
}
