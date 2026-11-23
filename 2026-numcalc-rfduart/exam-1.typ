// Reprodução adaptada de avaliação.

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
#let task = task.with(patterns: ("(1)", "a)"))

= 1ª Avaliação de Cálculo Numérico

Professor: Dr. Rafael Duarte

Data: 01/10/2026

== Questões

#task[
	*(1,50 pontos)* Considere uma máquina binária com base $beta = 2$, mantissa com $t = 3$ dígitos e expoente $e in [-5, 5]$. Determine a representação por truncamento e por arredondamento dos números abaixo nessa máquina. Quando o número não puder ser representado, indiqe se ocorre underflow ou overflow.

	#stack(
		dir: ltr,
		task[ $(35)_7$ ],
		1fr,
		task[ $(1003)_5$ ],
		1fr,
	)

	Nas questões *(2)*, *(3)* e *(4)*, utilize o critério de parada $|f(x̅)| < ε$, onde $x̅$ é a aproximação para o zero da função $f$.
]

#task[
	*(2,50 pontos)* Utilize o método da bissecção para encontrar o zero da função

	$ f(x) = x - 0.8 - 0.2*sin(x) $

	com intervalo inicial $[0, π/2]$ utillizando a precisão $ε = 10^(-2)$.

	Além disso, se utilizássemos o método da bissecção, o que seia mais provável: um número maior ou menor de iterações considerando o mesmo intervalo inicial $[0, π/2]$, precisão $ε = 10^(-2)$ e o mesmo critério de parada? Explique.
]

#task[
	*(2,00 pontos)* Encontre uma aproximação para o zero da função

	$ f(x) = sin(x - e^x) $

	utilizando o método de Newton-Raphson com aproximação inicial $x_0 = 04$ e precisão $ε = 10^(-3)$.
]

#task[
	*(2,00 pontos)* Considere a função

	$ f(x) = x^3 - 1 $

	Cuja raiz é $r = 1$.

	#task[
		Determine a fórmula de iteração do método de Newton-Raphson para $f$.
	]

	#task[
		Explique por que o método não pode ser aplicado tomando $x_0 = 0$.
	]

	#task[
		Considere agora $x_0 = 0,1$. Calcule $x_1$ e compare-o com a raiz $r = 1$.
	]

	#task[
		A partir dos resultados anteriores, explique geometricamente por que valores de $f'(x_n)$ iguais ou muito próximos de zero podem causar dificuldades na aplicação do método de Newton-Raphson.
	]
]
