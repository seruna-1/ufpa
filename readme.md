# UFPA Computer Science Beacon

Repositório Git como um diário de estudo do **Curso de Ciência da Computação da UFPA**.

| Diretório | Descrição |
|-|-|
| [`log/`](log/readme.md) | Diário de aula. |
| [`task/`](task/readme.md) | Tarefas. |
| [`doc/`](about/readme.md) | Informações gerais. |
| [`awesome/`](awesome/readme.md) | Seleção de repositórios externos. |

## Funcionamento

As aulas são registradas diariamente em [`log/`](log/readme.md). Quando uma tarefa surge, ela é referenciada no diário e registrada em [`task/`](task/readme.md), em um subdiretório dedicado, cujo nome fica ao critério da criatividade.

Do outro lado, o aluno começa clonando o repositório central (esse, o beacon) e criando uma branch para si, com seu nick. Essa nova branch vai conter as soluções do aluno para as tarefas que vão surgindo no repositório central, na branch `beacon`.

Após a clonagem, é importante trocar a branch principal de `beacon` para a branch do aluno nas configurações do repositório.

Depois, o processo é repetitivo: uma tarefa surge na branch `beacon` do repositório central, o aluno atualiza a branch `beacon` do seu repositório clonado, lê a tarefa, implementa a solução na branch pessoal e depois mescla a branch `beacon` em cima da pessoal.

## Diário



## Tarefas

Cada diretório de tarefa fica com um arquivo `task.md` dentro para descrever o enunciado da tarefa e a contextualização (professor, data, disciplina). O motivo disso ficar no `task.md` é que o `readme.md` é específico para explicar cada implementação de cada aluno. Se a tarefa tiver arquivos auxiliares, eles podem ficar dentro de um diretório `task/`, e o `task.md` também pode ficar lá.

Eventualmente, mais de uma tarefa com enunciados complementares, parecidos ou literalmente iguais podem (e vão) surgir. O ideal quando isso ocorre é unir esses enunciados. Se dois enunciados esperam a mesma solução, não tem razão para o mesmo aluno criar duas soluções com poucas diferenças ou tecnicamente iguais.

No caso em que os enunciados se complementam, mas podem ser satisfeitos por uma mesma solução, eles ficam juntos no arquivo `task.md`, em seções diferentes, cada uma com título contendo o professor, a disciplina e o ano relativos àquela tarefa. Esse tipo de junção aumenta o tamanho ou a complexidade da solução porque mais requisitos vão sendo empilhados, por isso deve ser usada na medida do razoável.

```md
# Tarefa

## Professor - Disciplina - Ano

Enunciado...

## Outro Professor - Outra Disciplina - Outro Ano*

Outro enunciado...
```

No caso de enunciados basicamente iguais, diferindo apenas em ano, disciplina ou professor, as informações da primeira aparição ficam no título e as demais vem logo abaixo, em itálico. Geralmente isso acontece quando o professor reutiliza o mesmo material de ensino para vários anos ou usa material de outro professor.

```md
# Tarefa

## Professor - Disciplina - Ano

*Professor - Disciplina - Outro Ano*

*Outro Professor - Disciplina - Outro Ano*

Enunciado...
```

## Comentários de aluno

Tanto no diário quanto em enunciados de tarefa, o aluno que está documentando pode deixar um comentário, mas deve deixar claro que é um comentário e incluir o seu nome.

```md
> Meu comentário aqui.
>
> *-- Seruna*
```

## Commits

Cada alteração é registrada por um commit, com um título conciso de idealmente até 60 caracteres, contendo o local da mudança, se houver um específico, e uma breve descrição da mudança em si. O local da mudança é um dos diretórios principais, e, no caso de uma tarefa, o nome do subdiretório da tarefa em si. Exemplos:

```
awesome: add X from Someone
log: 2026-06-02
task/minishell: register
task/minishell: feat: add X and Y
```

---

> *Nos meus primeiros dois semestres eu não anotava nada e, bom, a falta de informação sempre virava uma bola de neve.*
>
> *Comecei a organizar as coisas melhor ao longo do terceiro semestre.*
>
> *As informações aqui estão longe de serem completas. Mas serve para mim. E é o que eu consigo deixar para talvez servir para alguém no futuro.*
>
> *Carinhosamente,*
>
> *Seruna*
>
> (❍ᴥ❍ʋ)
