# Nível Bronze: Encontrando o Paralelismo

## Objetivo

Analisar a [implementação sequencial](matrix.c) usada atualmente e investigar como a aplicação poderá aproveitar múltiplas threads para executar operações simultaneamente, sem comprometer a correção dos resultados.

 1. Identificar e explicar as principais etapas executadas pelo algoritmo de multiplicação de matrizes.
 1. Identificar quais operações apresentam potencial para execução paralela, justificando tecnicamente a escolha.
 1. Explicar como diferentes threads poderiam dividir o trabalho realizado pela aplicação.
 1. Identificar quais dados precisam ser compartilhados entre as threads e quais podem ser tratados de forma independente, considerando possíveis condições de corrida.
 1. Representar, por meio de um diagrama simples ou pseudocódigo, a estratégia inicialmente proposta para paralelização.

