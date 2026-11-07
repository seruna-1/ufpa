# Missão 1: fundamentos de programação paralela

## Cenário

A empresa TransBrasil Express é responsável pelo processamento de grandes volumes de pedidos e pela definição de rotas de entrega em diferentes regiões do país.

Atualmente, a empresa processa aproximadamente 180 mil pedidos por dia. O sistema responsável por esse processamento executa suas principais operações de forma sequencial e leva aproximadamente 5 horas e 40 minutos para concluir o processamento diário.

Dados técnicos:

 - Pedidos processados diariamente: 180.000.
 - Tempo de processamento: 5h40min.
 - Crescimento estimado: 100% em dois anos.
 - Servidor disponível: Sistema multicore com 16 núcleos.
 - Operações independentes identificadas: processamento de diferentes conjuntos de pedidos.
 - Operações dependentes: consolidação e geração do resultado final.

## Problema

A previsão é que o número de pedidos dobre nos próximos dois anos.

Antes de investir em uma nova infraestrutura e modificar sua aplicação, a TransBrasil Express precisa descobrir se a Computação de Alto Desempenho e a Programação Paralela podem ajudá-la.

## Objetivo

Apontar motivos pelos quais investir em sistemas paralelos ajudará a empresa a lidar melhor com o crescimento da carga de trabalho, e discorrer sobre como a nova estrutura de processamento se pareceria.

## Níveis

| Nível | Início | Fim | Objetivo |
|-|-|-|-|
| [Nível Bronze](./lvl-1-diagnose/readme.md) | 21/09/2026 | 23/09/2026 | Diagnóstico inicial |
| [Nível Prata](./lvl-2-compare/readme.md) | 23/09/2026 | 25/09/2026 | Avaliação de opções |
| [Nível Ouro](./lvl-3-design/readme.md) | 25/09/2026 | 28/09/2026 | Projeção de solução |
| [Nível Diamante](./lvl-4-extend/readme.md) | 29/09/2026  | 01/10/2026 | Elastização da solução |

