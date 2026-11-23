// Exercício de preparação para avaliação.

#let task-depth = state("task-depth", 0)
#let task-counter = counter("task")
#let task(body, patterns: none) = {
	context {
		let depth = task-depth.get()
		task-counter.step(level: depth + 1)
	}
	[
		#strong(context {
			let depth = task-depth.get()
			let pattern = patterns.at(depth)
			let current-num = task-counter.get().at(depth)
			numbering(pattern, current-num)
		})
		#task-depth.update(d => d + 1)
		#body
		#task-depth.update(d => d - 1)
	]
}
#let task = task.with(patterns: ("QUESTÃO 1:", "a)"))
#show raw.where(block: true): it => pad(
	left: 1cm,
	right: 1cm,
	block(
		fill: luma(245),
		inset: 1em,
		width: 100%,
		it,
	)
)

= Programação Paralela - Exercícios - OpenMP

#task[
	Considere o código fonte abaixo, onde é realizada a contagem dos números primos:

	#raw(read("prime-counter.c"), block: true, lang: "C")

	#task[
		Faça as alterações necessárias (eliminando o paralelismo) e execute esse código de forma sequencial.
	]

	#task[
		Faça as alterações necessárias e execute esse código utilizando 1, 2, 4, 6 e 8 threads. Calcule o _speedup_, a eficiência e o desempenho.
	]

	#task[
		Se você aumentar o número de threads para 16, 32 e 64, isso resultará em algum impacto no tempo de processamento? E no _speedup_? Justifique através da execução do código.
	]

	#task[
		Se o tipo de escalonamento for alterado para _static_ (com Tam) ou guided, quais os impactos que serão observados na execução do código? Justifique através da utilização dos tipos de escalonamento citados.
	]
]

#task[
	Elabore um programa utilizando as funções do OpenMP que inicialize dois vetores com 100 posições pré-preenchidas aleatoriamente. Considere a execução do código por 5 threads.

	#task[
		Utilizando a diretiva *for*, calcule a soma desses dois vetores e escreva o ID da thread, a iteração e o valor do vetor calculado.
	]

	#task[
		Altere o tamanho dos vetores para 100.000 posições. Preencha um vetor somente com valores pares e outro vetor, somente com valores ímpares. Utilizando a cláusula *_reduction_*, realize uma soma *(operador: soma)* em cada um dos vetores separadamente, e no final, multiplique o resultado dos vetores utilizando a diretiva *_single_*.
	]
]

#task[
	Em uma simulação térmica bidimensional, o valor de cada ponto interno de uma matriz _T_new_ é atualizado com base na média dos seus quatro vizinhos imediatos na matriz _T_old_ (padrão Stencil). Um estudante tentou paralelizar o código abaixo, mas obteve resultados incorretos e não determinísticos:

	```C
	int i, j;
	double mean;
	#pragma omp parallel for
	for (i = 1; i < N - 1; i++) {
		for (j = 1; j < N - 1; j++) {
			mean = (T_old[i-1][j] + T_old[i+1][j] + T_old[i][j-1] + T_old[i][j+1]) / 4.0;
			T_new[i][j] = media;
		}
	}
	```

	Identifique o erro de concorrência presente no código do estudante e apresente a solução corrigida usando cláusulas de controle de escopo de dados do OpenMP.
]
