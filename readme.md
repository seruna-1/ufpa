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

## Tarefas

Cada diretório de tarefa fica com um arquivo `task.md` dentro para descrever o enunciado da tarefa e a contextualização (professor, data, disciplina). O motivo disso ficar no `task.md` é que o `readme.md` é específico para explicar cada implementação de cada aluno. Se a tarefa tiver arquivos auxiliares, eles podem ficar dentro de um diretório `task/`, e o `task.md` também pode ficar lá.

Eventualmente, mais de uma tarefa com enunciados bem parecidos ou literalmente iguais podem (e vão) surgir. Se dois enunciados puderem ser unidos, então o ideal é uní-los. Se dois enunciados esperam a mesma solução, não tem razão para o mesmo aluno criar duas soluções diferentes mas tecnicamente iguais. Se os enunciados puderem ser satisfeitos por uma mesma solução ao mesmo tempo, então eles ficam registrados no mesmo diretório, cada um em um arquivo com prefixo `task-`. Exemplo: `task-fulano-2025.md`, `task-ciclano-2026.md`.

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
