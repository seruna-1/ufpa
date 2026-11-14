#import "@local/brazilian-computer-society:0.1.0" as sbc

#show: sbc.brazilian-computing-society-article.with(
	title: "Missão 3 - Nível Bronze - Equipe 06",
	authors: (
        (
            name: "João M. B. Muniz",
            affiliation: "Instituto de Ciências Exatas e Naturais - Universidade Federal do Pará",
            email: "mjoao8219@gmail.com",
        ),
        (
            name: "Mateus C. Barreto",
            affiliation: "Instituto de Ciências Exatas e Naturais - Universidade Federal do Pará",
            email: "mateus.cezario.barreto@gmail.com",
        ),
        (
            name: "Nicolas G. C. Alho",
            affiliation: "Instituto de Ciências Exatas e Naturais - Universidade Federal do Pará",
            email: "nicolas.alho38@gmail.com",
        ),
    )
)

= Identificar e explicar as principais etapas executadas pelo algoritmo de multiplicação de matrizes.

O algoritmo começa alocando memória para três matrizes: A e B, que são as matrizes que serão multiplicadas, mais o espaço para uma matriz C, que será o resultado dessa multiplicação. A dimensão das matrizes A e B é definida com base no argumento passado pela linha de comando. Após ser lido e validado, o argumento de dimensão das matrizes é usado na alocação de memória.

$
	A_(n times n): "Fator" \
	B_(n times n): "Fator" \
	C_(n times n): "Matriz resultado"
$

Com o espaço de memória alocado para as matrizes, a matriz C, que armazenará o resultado da operação, é inicialmente zerada. As matrizes A e B são inicializadas usando dois critérios diferentes (@matrices-init-rules), onde $A_(i j)$ e $B_(i j)$ são elementos das matrizes $A$ e $B$, respectivamente, em uma linha $i$ e coluna $j$. 

$
	A_(i j) = (((i*17 + j*13) mod 100) + 1) / 100 \
	B_(i j) = (((i*11 + j*19) mod 100) + 1) / 100
$ <matrices-init-rules>

Uma vez inicializadas, as matrizes são $A$ e $B$ multiplicadas, e o resultado é armazenado em $C$. O algoritmo de multiplicação busca definir cada elemento da matriz $C$, um de cada vez (@resultant-element). Considerando que o elemento $C_(i j)$ esteja na linha $i$ e na posição $j$, o algoritmo define $C_(i j)$ como a soma de $n$ produtos ($n$ é a dimensão das matrizes). Cada produto contém um par de fatores, sendo um deles originário da matriz $A$, na linha $i$, e o outro da matriz $B$, na coluna $j$. Como $A$ e $B$ são igualmente dimensionadas, o pareamento é feito sem sobras.

$
	C_(i j) = sum_(k=0)^n A_(i k) * B_(k j)
$ <resultant-element>

Por fim, um número de verificação, também chamado de soma de verificação (checksum) ou código hash, é gerado com relação à matriz $C$, para resumir a informação carregada em seus elementos. O algoritmo de resumo numérico é uma soma simples dos elementos da matriz (@checksum-algorithm).

$
	h = sum_(i=0)^n sum_(j=0)^n C_(i j)
$ <checksum-algorithm>

= Identificar quais operações apresentam potencial para execução paralela, justificando tecnicamente a escolha.

A definição dos elementos das matrizes $A$ e $B$ depende apenas da linha $i$ e da coluna $j$ em que o elemento se encontra. Ou seja, cada elemento de $A$ e $B$ pode ser calculado de forma independente.

De forma semelhante, a definição de cada elemento da matriz resultante depende apenas da leitura de uma linha da matriz $A$ e de uma coluna da matriz $B$. Por essa razão, cada um desses elementos resultantes pode ser calculado isoladamente em relação aos demais elementos de $C$.

Já o cálculo do número de verificação da forma como é feito no algoritmo sequencial, como a acumulação dos elementos, pode ser paralelizado aproveitando a associatividade da soma, que é a única operação usada: os elementos da matriz $C$ podem ser divididos em grupos menores, e o código de verificação final será exatamente a soma dos códigos gerados nesses subgrupos (@checksum-partitioning).

#figure(
	image("checksum-partitioning.svg", width: 60%),
	caption: [Particionamento da geração do código verificação do resultado da multiplicação das matrizes.]
) <checksum-partitioning>

= Explicar como diferentes threads poderiam dividir o trabalho realizado pela aplicação.

Pelo fato das matrizes $A$, $B$ e $C$ serem quadradas e igualmente dimensionadas entre si, é interessante erguer $g$ grupos, cada um atribuído a uma thread responsável por calcular seus $(n^2)/g$ elementos, com as mesmas posições nas três matrizes (@thread-work).

#figure(
	image("thread-work.svg", width: 60%),
	caption: [Distribuição de trabalho para threads.]
) <thread-work>

Uma escolha interessante para o número de grupos é o número de threads disponíveis no sistema para serem usadas. Mais que isso faria com que alguma thread lidasse com mais de um grupo de elementos, o que não representaria ganho de processamento comparado com apenas uma escolha de grupos maiores. Na realidade, existiria um leve gargalo a mais, referente ao agendamento de mais threads para um número menor de núcleos reais de processamento pelo sistema operacional.

Idealmente, a divisão de $n^2$ elementos para $g$ grupos não terá resto, ou seja, as threads realizarão o mesmo número de instruções (@thread-work). No entanto, no caso da divisão dos $n^2$ elementos pelas threads disponíveis resultar em resto, algumas threads terão que lidar com instruções para elementos a mais em relação a outras (@uneven-thread-work). Ainda assim, a diferença entre a thread com maior carga de trabalho e a de menor seria de 1 elemento para cada matriz.

#figure(
	image("uneven-thread-work.svg", width: 50%),
	caption: [Distribuição levemente desarmônica de trabalho para threads.]
) <uneven-thread-work>


= Identificar quais dados precisam ser compartilhados entre as threads e quais podem ser tratados de forma independente, considerando possíveis condições de corrida.

Tanto na etapa de inicialização de elementos quanto na etapa de geração do checksum, não há sobreposição do espaço de escrita e leitura entre as threads. Em outras palavras, nenhuma thread irá sobrescrever algum dado já posto por outra thread, e cada uma lê apenas os elementos da matriz referentes ao seu grupo. No que se refere à escrita, também não há condições de corrida na etapa da multiplicação, já que cada elemento da matriz resultante é escrito apenas uma vez, pela única thread responsável.

Já no contexto da leitura na multiplicação, existe sobreposição no sentido de que vários elementos na matriz resultante precisam que os elementos de uma mesma linha na matriz $A$ ou de uma mesma coluna na matriz $B$ sejam lidos no cálculo. Isso implica na releitura dos elementos de $A$ e $B$ ao longo da definição dos elementos de $C$. Ainda assim, é seguro que o espço de memória das matrizes fatores seja compartilhado entre as threads, visto que esse espaço não sofrerá escrita por nenhuma thread, e sairá da operação da mesma forma que entrou.

= Representar, por meio de um diagrama simples ou pseudocódigo, a estratégia inicialmente proposta para paralelização.



//#bibliography("../../bibliography.yaml", style: "sbc.csl", title: "Referências")

