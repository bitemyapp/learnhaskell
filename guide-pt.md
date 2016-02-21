# Como aprender Haskell

Esse é o caminho recomendado para aprender Haskell baseado na experiência ganhada ao ajudar outras pessoas.


#### *Não se preocupe se você não entender algo nesse momento*. Continue lendo!


## Community

Nosso canal no IRC é `#haskell-beginners` no Freenode.

Esse é um cliente web para o IRC [aqui](http://webchat.freenode.net/).

As [lista de emails](https://wiki.haskell.org/Mailing_lists) do Haskell.


### Community Guidelines

Veja [o guia de orientações](coc.md) para entender a conduta esperada no canal do IRC. Você receberá um aviso se você não estiver claramente trollando, mas entenda que o canal é exclusivo para aqueles que estiverem aprendendo ou estudando Haskell.


# Installando Haskell

## Use a ferramenta Stack para começar a com Haskell

Instale [Stack](http://haskellstack.org) para ter o GHC (Glasgow Haskell Compiler) instalado e para poder compilar seus projetos.

Se você não sabe nada sobre Stack e gostaria de uma visão geral, confira o [tutorial em videl sobre Stack](https://www.youtube.com/watch?v=sRonIB8ZStw).


## NÃO INSTALLE "HASKELL PLATFORM"

Ao invés de utilizar as instruções disponível em Haskell.org, instale Stack.

### Por quê não utilizar "Haskell Platform"?

https://mail.haskell.org/pipermail/haskell-community/2015-September/000014.html


# Como eu deveria aprender Haskell?

A recomendação principal é ler as aulas e completar os exercícios/tarefas para a versão "Spring 13" do curso cis194, seguido do curso NICTA. Ambos estão linkados abaixo. Todos os outros cursos são considerados opicionais e são mencionados para que você saiba onde olhar.

## Curso cis194 do Yorgey

> Faça esse curso primeiro, esse é o primeiro método recomendado para ser introduzido ao Haskell.

Disponível [online](http://www.seas.upenn.edu/~cis194/spring13/lectures.html).

O curso do [Brent Yorgey](https://byorgey.wordpress.com) é o melhor que encontrei até agora.
Esse curso é valioso por não apenas te preparar para escrever Haskell básico
mas também para ajudar a entender "parser combinators".

O único motivo que você não deveria iniciar com o cis194 é se você não é programador
ou é um programador iniciante.
Caso este seja o caso, comece pelo [livro do Thompson](http://www.haskellcraft.com/craft3e/Home.html) e transicione para o cis194.

---

## Curso NICTA

> Esse curso é recomendado após terminar o curso cis194 do Yorgey

Disponível no github [aqui](https://github.com/NICTA/course).

Esse curso irá reinforçar e trazer mais experiência implementando as abstrações
introduzidas no curso cis194, o que quer dizer praticar o que é *critico* para
se tornar confortável com os usos diários de Funtores/Aplicativos/Monad/etc. em
Haskell.
Fazer o curso cis194 e depois o curso NICTA representa a recomendação principal
do meu guia e é como ensinamos todos sobre Haskell.

---

## Cursos sumplementares depois dos cursos cis194 e NICTA

> Provê mais material em tópicos intermediários

cs240h está disponível [online](http://www.scs.stanford.edu/14sp-cs240h/).

Esse é o curso online do [Bryan O'Sullivan](https://github.com/bos) das aulas que ele ensina em Stanford.
Se você ainda não conhece ele, procure por metade das bibliotecas que qualquer
aplicação Haskell você precisará e você verá o nome dele.
Caso você já tenha feito o curso do Yorgey, você pode focar principalmente nos
modules sobre "phantom types", "information flow control", "language
extensions", "concurrency", ""pipes", e "lenses".

---

# Recursos para tópicos especificos

Esses recursos não estão vetados ou testados com que estudantes tanto quanto os cursos cis194 e NICTA foram, mas estão linkados na [lista de tópicos](specific_topics.md) para que você tenha alguma idea de por onde começar. Essa lista inclui coisas como conceitos intermediários e avançados, e assuntos como ferramentas e editores de textos.

## Diálogos

> Disponível [aqui](dialogues.md) nesse repositório.

Esses diálogos são, na verdade, importantes e úteis para se aprofundar em uma variedade de tópicos.
