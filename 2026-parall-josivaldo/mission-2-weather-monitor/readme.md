# Missão 2: projeção de uma aplicação paralela

## Cenário

Um centro de pesquisa ambiental recebe diariamente dados de estações de monitoramento distribuídas por diferentes regiões do país.

Essas estações registram informações de temperatura, umidade, precipitação e qualidade do ar.

Atualmente, o processamento é sequencial e apresenta as seguintes características:

 - 5.000 estações de monitoramento.
 - 1 leitura por minuto.
 - 50 regiões monitoradas.
 - Aproximadamente 7 milhões de registros por dia.
 - Tempo atual de processamento: 48 minutos.
 - Tempo máximo desejado: 15 minutos.
 - Infraestrutura disponível: cluster com 32 nós computacionais.

O processamento possui quatro operações principais:

A — Validação: identifica registros incompletos ou inconsistentes.

B — Análise regional: calcula estatísticas dos dados correspondentes a cada região.

C — Detecção de eventos: identifica valores que possam representar eventos ambientais relevantes.

D — Consolidação: reúne os resultados das análises regionais e produz o relatório nacional.

As operações B e C dependem dos dados validados em A, enquanto a operação D depende dos resultados das análises anteriores.

## Objetivo

Aplicar designs de paralelismo ao sistema de monitoramento climático.

## Níveis

| Nível | Início | Fim | Objetivo |
|-|-|-|-|
| [Nível Bronze](./lvl-1-analise/readme.md) | 08/10/2026 | 10/10/2026 | Análise de dependências |
| [Nível Prata](./lvl-2-decompose/readme.md) | 13/10/2026 | 14/10/2026 | Decomposição do problema com PCAM |
| [Nível Ouro](./lvl-3-design/readme.md) | 15/10/2026 | 17/10/2026 | Projeção de solução |
| [Nível Diamante](./lvl-4-extend/readme.md) | 18/10/2026  | 20/10/2026 | Elastização |

