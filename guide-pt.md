# O Guia

Este é o caminho que recomendo para se aprender Haskell.

#### Uma coisa para se lembrar sempre: *não se preocupe com aquilo que não entender imediatamente*. Apenas continue.

## Comunidade

Nosso canal no IRC é `#haskell-beginners` no Freenode.

Cliente web para IRC [aqui](http://webchat.freenode.net/).

[Listas de e-mails](https://wiki.haskell.org/Mailing_lists) relacionadas a Haskell.

## Diretrizes para a Comunidade

[Leia a postagem de Chris Done sobre ensino](http://chrisdone.com/posts/teaching) (Em inglês)

Seja gentil e cortês. Ser cruel ou rude assusta as pessoas e as desencoraja a participar.

Criticismo barato beneficia apenas a pessoa que o emite, não a pessoa que o recebe.

Não descreva coisas como "fáceis" ou "triviais". Você fará pessoas se sentirem mal por terem que trabalhar duro para progredirem. Pessoas que aprendem lentamente frequentemente são aquelas que aprendem melhor, isso é algo para ser celebrado!

Sem surpresa fingida. Não se faça de surpreso quando alguém diz que não sabe alguma coisa. Essa pessoa se sentirá mal e você terá conseguido nada além de se sentir afiado.

Sem "bom, na verdade". Quando alguém diz algo que está quase - mas não totalmente - correto, e você diz, "bom, na verdade..." e então faz uma correção pequena. Isso é especialmente incômodo quando a correção não tem relação com o assunto conversado. Isso não significa que o Recurse Center não é sobre a busca de verdade ou que nós não nos importamos em ser precisos. Quase todos esses "bom, na verdade" são com intenção de se aparecer, não em benefício da verdade.

Sem essa de dirigir no banco de trás. Se você vê as pessoas trabalhando em um problema, você não deveria lançar conselhos intermitentemente. Deixe-as trabalhar a menos que alguém peça por ajuda. Evitar interrupções é [um dos propósitos fundamentais do #haskell-beginners](http://chrisdone.com/posts/teaching)

Sem "-ismos" sutis. Racismo, sexismo, homofobia, transfobia, e outros tipos de preconceito não são bem vindos e não serão tolerados.

---

Diretrizes do [manual do Recurse Center](https://www.recurse.com/manual). 
Obrigado por disponibilizar isso, Recurse Center.

# Instalando Haskell

## Use a ferramenta Stack para começar com Haskell

Instale [Stack](http://haskellstack.org) para ter o GHC (Glasgow Haskell Compiler) instalado e para poder compilar seus projetos.

Se você não sabe nada sobre Stack e gostaria de uma visão geral, confira o [tutorial em video sobre Stack](https://www.youtube.com/watch?v=sRonIB8ZStw).


## NÃO INSTALE "HASKELL PLATFORM"

Ao invés de utilizar as instruções disponível em Haskell.org, instale Stack.

### Por quê não utilizar "Haskell Platform"?

https://mail.haskell.org/pipermail/haskell-community/2015-September/000014.html


# Cursos Iniciais

## Curso cis194 do Yorgey

> *Faça este primeiro*, esta é a minha recomendação de como ser introduzido 
> ao Haskell.

Disponível [online](http://www.seas.upenn.edu/~cis194/spring13/lectures.html).

O curso de [Brent Yorgey](https://byorgey.wordpress.com) é o melhor que eu
encontrei até agora. Esse curso é importante porque ele não só vai equipá-lo
a escrever Haskell básico mas também vai ajudá-lo a entender *parser combinators*.

A única razão pela qual você não deveria começar com o cis194 é se você não
for um programador ou se for um que é inexperiente. Se esse é o caso, comece
com o [livro do Thompson](http://www.haskellcraft.com/craft3e/Home.html) e depois
o cis194.

---

## Curso NICTA

> Este é o curso que recomendo fazer após o curso cis194 do Yorgey.

Disponível no github [aqui](https://github.com/NICTA/course).

Isso vai reforçar e lhe dar experiência implementado diretamente as abstrações
introduzidas no cis194. Essa prática é *crítica* para alguém se tornar confortável
com o uso diário de *Functors*/*Applicatives*/*Monads*/etc em Haskell. Fazer o cis194
e então o curso do NICTA representa a recomendação fundamental do meu guia, 
e é como eu ensino Haskell para todo mundo.

--- 

## Curso suplementar cs240h

> Fornece mais materiais em tópicos intermediários

Disponível [online](http://www.scs.stanford.edu/14sp-cs240h/).

Essa é a versão online do curso que o [Bryan O'Sullivan](https://github.com/bos)
leciona em Stanford. Se você não sabe quem ele é, dê uma olhada em metade
das bibliotecas que qualquer aplicação em Haskell acaba precisando e o nome
dele estará nela. Se você já fez o curso do Yorgey, são particularmente 
interessantes os módulos sobre tipos fantasma (*phantom types*), controle de fluxo
da informação (*information flow control*), extensões de linguagem (*language extensions*), 
concorrência, *pipes* e *lenses*.

--- 

## Material de referência para os três cursos

[Learn You a Haskell for Great Good (LYAH)](http://learnyouahaskell.com) e o
[Real World Haskell](http://book.realworldhaskell.org) (Obrigado, bos!) estão
disponíveis online.

Eu recomendo o RWH como referência (livro grosso). Os capítulos sobre
*parsing* e *monads* são ótimos para entender onde *monads* são úteis. Outras pessoas
já disseram que gostaram muito deles. Talvez seja um bom seguimento para
aplicações práticas depois que você já está acostumado com o essencial de Haskell.

### O que os açúcares sintáticos `<-` / `do` / compreensão de listas fazem exatamente?

Excelente [artigo](http://www.haskellforall.com/2014/10/how-to-desugar-haskell-code.html).

### Para entender listas e *folds*

- [Explique *folds* em Listas para si mesmo](http://vimeo.com/64673035)
 
### Para aprender *typeclasses* comuns
Útil para entender `Functor`, `Applicative`, `Monad`, `Monoid` e outras *typeclasses*
em geral, mas também conceitos de Teoria das Categorias específicos à Hask.

- A [Typeclassopedia](http://www.haskell.org/haskellwiki/Typeclassopedia)

### Entendendo mensagens de erro básicas do Haskell

- [Entendendo mensagens de erro básicas](http://ics.p.lodz.pl/~stolarek/_media/pl:research:stolarek_understanding_basic_haskell_error_messages.pdf)

### Avaliação preguiçosa, estrita, recursão guardada

- O [livro](http://chimera.labs.oreilly.com/books/1230000000929/ch02.html) de Marlow
  paralelismo e concorrência tem uma das melhores introduções sobre avaliação preguiçosa
  e forma normal que já encontrei. Use outros materiais também se não fizer sentido imediatamente.

- [Mais pontos para a avaliação preguiçosa](http://augustss.blogspot.hu/2011/05/more-points-for-lazy-evaluation-in.html)

- [Oh minha preguiça!](http://alpmestan.com/posts/2013-10-02-oh-my-laziness.html)

- Questão no SO '[Haskell tem otimização de recursão de cauda?](http://stackoverflow.com/questions/13042353/does-haskell-have-tail-recursive-optimization)'

- Slides do [Johan Tibell](https://github.com/tibbe) de uma palestra sobre
  [raciocinando sobre avaliação preguiçosa](http://www.slideshare.net/tibbe/reasoning-about-laziness).

## Breve demonstração

```haskell
let a = 1 : a -- recursão guardada, (:) é preguiçoso
let (v : _) = a -- e é possível fazer *pattern matching*

> v
1
> head a -- head a == v
1

let a = 1 * a -- recursão não guardada, (*) é estrito
> a
*** Exception: <<loop>>
```

# IO

- [Ordem de avaliação e símbolos de Estado](https://www.fpcomplete.com/user/snoyberg/general-haskell/advanced/evaluation-order-and-state-tokens)

- [Revelando o mistério da IO *monad*](http://blog.ezyang.com/2011/05/unraveling-the-mystery-of-the-io-monad/).

- ["Afirmações" de primeira classe](http://blog.jle.im/entry/first-class-statements).

- [Haddocks para System.IO.Unsafe.unsafePerformIO](http://hackage.haskell.org/package/base-4.7.0.1/docs/System-IO-Unsafe.html#v:unsafePerformIO)
  Leia a documentação e nota de implementação da função `unsagedupableperformio`

Comentário de *thread* no Reddit por `glaebhoerl`

> Nota importante: o GHC precisa esconder a representação do símbolo de 
> estado atrás de um tipo abstrato de IO porque o símbolo de estado sempre 
> deve ser usado linearmente (não duplicado ou abandonado), mas o sistema de
> não pode reforçar isso. Clean, uma outra linguagem preguiçosa semelhante a
> Haskell, tem tipos de unicidade (que são como tipos lineares e possivelmente
> diferente em maneiras das quais não estou informado), e eles expõe a "passagem
> do Mundo" diretamente e fornece a *monad* (não abstrata) apenas por conveniência.

# *monads* e transformadores de *monad* (*monad transformers*)

> Não faça esses até que você entenda *typeclasses*, *Monoid*, *Functor* e *Applicative*!

Implemente as *monads* da biblioteca padrão ( *List*, *Maybe*, *Cont*, *Error*, *Reader*,
*Writer*, *State* ) por si mesmo para entendê-las melhor. Então talvez escreva um
interpretador monádico para uma pequena linguagem de expressões usando o artigo
[Passo-a-passo em *Monad Transformers*](http://www.cs.virginia.edu/~wh5a/personal/Transformers.pdf)
(mencionado abaixo em 'monad transformers').

Escrever vários interpretadores apenas mudando a *monad* para mudar a semântica
pode ajudar a entender o que está acontecendo.

- [Esta palestra](https://vimeo.com/73648150) feita pelo Tony motiva de maneira
  excelente o uso de *monad transformers*. [Os slides](https://dl.dropboxusercontent.com/u/7810909/talks/monad-transformers/cbaa991e0eb49224eb286c1e418e2b9828e1fb21/monad-transformers.pdf).

Além disso, reimplemente `Control.Monad`. Funções como `mapM` ou `sequence` são boas
oportunidades para praticar escrevendo código monádico genérico.

O curso NICTA pode ser usado como um guia para esse processo, o que também vai
envolver escrever seu próprio *Applicative*.

Créditos:

- comentário no Reddit feito por htmltyp e Crandom [aqui](http://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5aj6).

- comentário no Reddit feito por jozefg [aqui](http://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5trg).

## Monad Transformers

- [Uma introdução gentil a *Monad Transformers*](https://github.com/kqr/gists/blob/master/articles/gentle-introduction-monad-transformers.md).

- [passo-a-passo em *Monad transformers*] (http://www.cs.virginia.edu/~wh5a/personal/Transformers.pdf) (Aviso! Código desatualizado).

# Testando, testes, especificações, teste de propriedades/generativo

- Este [tutorial](https://github.com/kazu-yamamoto/unit-test-example/blob/master/markdown/en/tutorial.md) por Kazu Yamamoto é fantástico.

- [Simple-Conduit](https://github.com/jwiegley/simple-conduit): Biblioteca simples e boa
  para aprender como funciona *streaming IO* em geral, conhecimento transferível
  para bibliotecas como Pipes e Conduit.

# *Parsing* em Haskell

- [Tutorial](https://github.com/JakeWheat/intro_to_parsing) em *parser combinators*
  para Haskell usando a Parsec

- [Escrevendo a sua própria micro-parsec](http://olenhad.me/articles/monadic-parsers/)

## *Parsing* e geração de JSON

Aeson é a solução padrão para *parsing* de [JSON](https://json.org) em Haskell. 
Disponível no [hackage](https://hackage.haskell.org/package/aeson) e
[github](https://github.com/bos/aeson).

- [Fazendo *parsing* de JSON usando a Aeson](http://blog.raynes.me/blog/2012/11/27/easy-json-parsing-in-haskell-with-aeson/)

- [Aeson tipos criados pelo usuário](http://bitemyapp.com/posts/2014-04-11-aeson-and-user-created-types.html)

- [Fazendo o *parsing* de dados não-determinísticos com a aeson tipos de soma](http://bitemyapp.com/posts/2014-04-17-parsing-nondeterministic-data-with-aeson-and-sum-types.html)

- [Tutorial Aeson](https://www.fpcomplete.com/school/starting-with-haskell/libraries-and-frameworks/text-manipulation/json)

# Algoritmos de Grafo e Estrutura de Dados

- O [pacote fgl](https://hackage.haskell.org/package/fgl) particularmente o 
  caminho mais curto puramente funcional, o [algos](http://hackage.haskell.org/package/fgl-5.4.2.2/docs/Data-Graph-Inductive-Query-SP.html).

- [Grafos Indutivos e Algoritmos de Grafos Funcionais](http://web.engr.oregonstate.edu/~erwig/papers/abstracts.html#JFP01).

- [FGL/Haskell - Uma Biblioteca de Grafos Funcional](http://web.engr.oregonstate.edu/~erwig/fgl/haskell/old/fgl0103.pdf).

- [Código fonte da Data.Graph do pacote Containers](http://hackage.haskell.org/package/containers-0.5.5.1/docs/Data-Graph.html).

- O [pacote graphs](https://hackage.haskell.org/package/graphs).

- [Pergunta no SO sobre PHOAS](http://stackoverflow.com/questions/24369954/separate-positive-and-negative-occurrences-of-phoas-variables-in-presence-of-rec)

- [PHOAS de brinde](https://www.fpcomplete.com/user/edwardk/phoas).

- [Amarrando o nó](http://www.haskell.org/haskellwiki/Tying_the_Knot).

- [Hackage: dag](https://hackage.haskell.org/package/dag).

# Ambiente de Desenvolvimento

## Emacs

- [Tutorial de Alejandro Serras](https://github.com/serras/emacs-haskell-tutorial/blob/master/tutorial.md)

- [Meus *dotfiles*](https://github.com/bitemyapp/dotfiles/)

- [Configuração do emacs do Chris Done](https://github.com/chrisdone/chrisdone-emacs)

## Vim

- [Página do Vim no haskellwiki](http://www.haskell.org/haskellwiki/Vim)

- [Haskell-vim-now](https://github.com/begriffs/haskell-vim-now)

- [GHC-Mod](https://github.com/kazu-yamamoto/ghc-mod)

- [Plugin do vim para o GHC-Mod](https://github.com/eagletmt/ghcmod-vim)

- [Hindent](https://github.com/chrisdone/hindent)

## Sublime Text

- [SublimeHaskell](https://github.com/SublimeHaskell/SublimeHaskell)

# Trabalhando com Cabal

## Diretrizes do Cabal

O *Cabal Hell* (Inferno do Cabal) era um problema para usuário de Haskell
antes da introdução das *sandboxes*. Instalar fora de uma *sandbox* vai instalar
no package-db de seu usuário. Isso *não* é uma boa ideia, exceto para pacotes 
fundamentais como Cabal, alex e happy. Nada além disso deve ser instalado nos
package-dbs do usuário ou global a menos que você saiba o que está fazendo.

Algumas melhores práticas para evitar o *cabal hell* estão disponíveis 
[aqui](http://softwaresimply.blogspot.com/2014/07/haskell-best-practices-for-avoiding.html).

Para experimentar um pacote ou iniciar um projeto, comece fazendo
`cabal sandbox init` num novo diretório.

Colocando brevemente:

- Sempre use *sandboxes* para instalar novos pacotes, compilar projetos
  novos ou existentes, ou iniciar experimentos.
- Use o `cabal repl` para iniciar uma instância do ghci com escopo limitado ao projeto.

A abordagem baseada em *sandbox* que sugiro deve evitar problemas em dependência
de pactes, mas é incompatível com a maneira que a Plataforma Haskell fornece
pacotes pré-compilados. Se você ainda está aprendendo Haskell e não entende como o
ghc-pkg e o Cabal funcionam, *evite a plataforma* e em vez dela use as instruções para
instalação no começo deste guia.


## Stackage

Para qualquer usuários (principalmente os do Yesod) que tem problemas de compilação,
considere o Stackage.
- Um bom sumário do Stackage [aqui](https://www.fpcomplete.com/blog/2014/05/stackage-server).

Na opinião do autor, o Stackage é geralmente mais útil do que o `cabal freeze`.

# Hoogle e Haddock

## Pesquise código pela *type signature*

O [motor de buscas Hoogle](http://www.haskell.org/hoogle/) pode pesquisar pelos tipos.

Por exemplo, olhe os resultados de busca para `(a -> b) -> [a] -> [b]` 
[aqui](http://www.haskell.org/hoogle/?hoogle=%28a+-%3E+b%29+-%3E+%5ba%5d+-%3E+%5bb%5d).

Também hospedado pelo fpcomplete [aqui](https://www.fpcomplete.com/hoogle).

Também o [Hayoo](http://holumbus.fh-wedel.de/hayoo/hayoo.html) (que por padrão tem tudo do
hackage disponível para pesquisa).

## Configurando sua própria instância local do Hoogle

Dê uma olhada [aqui](https://gist.github.com/bitemyapp/3e6a015760775e0679bf).

## Haddock

1. [Conserte sua documentação do hackage](http://fuuzetsu.co.uk/blog/posts/2014-01-06-Fix-your-Hackage-documentation.html)

2. [Documentação v2 do Hackage](http://fuuzetsu.co.uk/blog/posts/2014-01-06-Hackage-documentation-v2.html)

Perceba que essas postagens estão *levemente desatualizadas*: por exemplo, agora o Hackage exibe
informação nova com destaque com informação de documentação e o estado da *build*.

## O que você realmente precisa saber

Para fazer com que o haddocks inclua documentação para pacotes relacionados,
você deve setar `documentation: True` no seu `~/.cabal/config`. Se ele for deixado
no padrão (`False`) ou setado para `False`, você vai precisar deletar todos os seus
pacotes e reinstalar antes de gerar os haddocks.

Outra coisa para se ter em mente é que devido ao modo como o parâmetro `$pkg` é
interpolado *pelo* cabal, não por você, os parâmetros `html-location` e `content-location`
*precisam estar em aspas simples* e configurados num *shell* ou contidos num *shell script*.
Eles não vão funcionar num Makefile, porque ele vai pensar que são variáveis para o Make!

```bash
#! /usr/bin/env sh

# You can write it one one line by skipping the backslashes
cabal haddock --hoogle --hyperlink-source                       \
 --html-location='http://hackage.haskell.org/package/$pkg/docs' \
 --contents-location='http://hackage.haskell.org/package/$pkg'
```

# TravisCI

Se você é um grande fã do [TravisCI](https://travis-ci.org) como eu sou, 
então recomendo *fortemente* que considere o 
[multi-ghc-travis](https://github.com/hvr/multi-ghc-travis) como base para
o `travis.yml` em seus projetos em Haskell.

# *Frontend*/Javascript

Nós temos muita coisa nessa área! Existem três opções principais que eu recomendaria:

* [Haste](http://haste-lang.org/) um compilador de Haskell para Javascript
- O [compilador](https://github.com/valderman/haste-compiler) no github.
  - Uma excelente
    [demonstração](http://www.airpair.com/haskell/posts/haskell-tutorial-introduction-to-web-apps)
    do Haste com um projeto de exemplo

* [GHCJS](https://github.com/ghcjs/ghcjs)
  - [Introdução ao GHCJS](http://weblog.luite.com/wordpress/?p=14)
  - [Interfaces Web Funcionais e Reativas com GHCJS e Sodium](http://weblog.luite.com/wordpress/?p=127)
  - [Escrevendo plugins para o Atom em Haskell usando ghcjs](http://edsko.net/2015/02/14/atom-haskell/)

* [PureScript](http://www.purescript.org/)
  - Não é estritamente Haskell como o Haste e o GHCJS, mas é uma escolha
    popular entre os Haskellers
  - Escrito em e inspirado pelo Haskell
  - Experimente o purescript em seu navegador [aqui](http://try.purescript.org/)
  - Ótimo guia para [começar](http://www.christopherbiscardi.com/2014/06/22/getting-started-with-purescript/)

## Qual linguagem *frontend* eu deveria usar?

GHCJS e Haste são ambos totalmente Haskell. O GHCJS vai funcionar com mais 
pacotes Haskell do que o Haste, mas isso não influencia muitos projetos de 
*frontend*. Purescript sequer é Haskell, então compartilhamento direto de 
código com seu backend não vai funcionar.

O custo em tempo de execução do GHC é o mais caro próximo dos 10KB (luite está trabalhando nisso). O Haste e o PureScript são competitivos.

O PureScript tem a melhor integração com as ferramentas JavaScript (ele usa gulp/grunt/bower), o GHCJS e o Haste se integram melhor com as ferramentas Haskell (Cabal).

Todos os três são ótimas escolhas e vão funcionar bem para a maior parte dos projetos de *frontend*.

# Para um entendimento mais completo sobre avaliação preguiçosa, NF, WHNF

- [Notas sobre cálculo lambda](https://vec.io/posts/notes-on-lambda-calculus).

## Artigos de pesquisa sobre cálculo lambda preguiçoso

- [Um cálculo lambda com chamada por necessidade](http://homepages.inf.ed.ac.uk/wadler/topics/call-by-need.html#need-journal).

- [Demonstrando Redução em Cálculo Lambda](http://www.itu.dk/~sestoft/papers/sestoft-lamreduce.pdf)

- [O cálculo lambda preguiçoso](http://www.cs.ox.ac.uk/files/293/lazy.pdf).

- [Avaliação preguiçosa em Haskell](http://www.vex.net/~trebla/haskell/lazy.xhtml)

# Paralelismo/Concorrência

- [Programação Paralela e Concorrente em Haskell](http://chimera.labs.oreilly.com/books/1230000000929). 
Este livro de Simon Marlow é provavelmente o melhor que já li no tema de 
Paralelismo e Concorrência.
- Um bom [passeio](http://kukuruku.co/hub/haskell/haskell-testing-a-multithread-application) 
  através do processo de teste e desenvolvimento incremental de uma aplicação 
  multi-*thread* em Haskell.

- [Programação Funcional Reativa](http://www.haskell.org/haskellwiki/Functional_Reactive_Programming)

# *Lenses* e *Prisms*

Depois de estar confortável em Haskell, considere seriamente aprender *Lenses* e *Prisms*, 
mesmo que somente como "usuário". Você não precisa aprender a teoria das categorias 
utilizada para que eles sejam úteis.

Muitos superestimam demais a dificuldade em se usar Lens. Qualquer um confortável com
*Functor*/*Foldable*/*Traversable* (ou até mesmo só com o primeiro) pode usar *lenses* e *prisms*
para tornar sua vida mais feliz.

Se você já fez algo como: `(fmap . fmap)` você está utilizando *lenses* na sua cabeça.

Eu recomendo estes dois tutoriais/introduções:

- [Um pequeno tutorial iniciante em lens](https://www.fpcomplete.com/school/to-infinity-and-beyond/pick-of-the-week/a-little-lens-starter-tutorial)

- [Lens: *Lenses*, *Folds* e *Traversals*](https://github.com/ekmett/lens#lens-lenses-folds-and-traversals)

Olhe aqui para mais informações: [Pacote Lens no hackage](http://hackage.haskell.org/package/lens).

# Esquemas de Recursão

Algumas das palavras \*-morfismo que você já ouviu tratam na verdade de recursão. Nota - 
antes de se aventurar neste material, você deveria saber como implementar o `foldr` para listas
e para pelo menos mais uma estrutura de dados, como uma árvore. (*folds* são catamorfismos)
Saber como se implementa um `unfold` (anamorfismo) para a mesma estrutura vai facilitar
um pouco as coisas.

Este material se encaixa com *traversable* e *foldable*.

- [Uma introdução a esquemas de recursão](http://patrickthomson.ghost.io/an-introduction-to-recursion-schemes/)

- [Não tema o *cat*](http://fho.f12n.de/posts/2014-05-07-dont-fear-the-cat.html) (NT - em inglês existe um trocadilho
  com o prefixo de catamorfismo - cat - e o termo cat (gato))
  Boa demonstração de como hilomorfismo é a composição de catamorfismo e de anamorfismo.

- [Esquemas de Recursão](http://comonad.com/reader/2009/recursion-schemes/) - Este guia é
  excelente.

- [Programação Funcional com bananas, *lenses*, envelopes e arame farpado(http://eprints.eemcs.utwente.nl/7281/01/db-utwente-40501F46.pdf)

- [Catamorfismos](https://www.fpcomplete.com/user/edwardk/recursion-schemes/catamorphisms)

# GHC Core e tunando a performance

- [Escreva Haskell tão rápido quanto C](write_haskell_as_fast_as_c.md)

- [Wiki do GHC: CoreSyn Type](https://ghc.haskell.org/trac/ghc/wiki/Commentary/Compiler/CoreSynType).

- [Hackage: GHC Core](https://hackage.haskell.org/package/ghc-core).

- [Questão no SO:  Lendo o GHC Core](http://stackoverflow.com/questions/6121146/reading-ghc-core).

- [Haskell tão rápido quanto C](http://donsbot.wordpress.com/2008/06/04/haskell-as-fast-as-c-working-at-a-high-altitude-for-low-level-performance/).

- [Real World Haskell, Capítulo 25: Perfilação e Otimização](http://book.realworldhaskell.org/read/profiling-and-optimization.html).

# Teorias dos Tipos e das Categorias

> *Não é* necessário saber isso para programar em Haskell, é apenas para 
  quem se interessar!

Se você quiser um material complementar em teoria dos tipos e das categorias:


- [Guia do Catster](http://byorgey.wordpress.com/2014/01/14/catsters-guide/) e
  [Guia do Catster - 2](http://byorgey.wordpress.com/catsters-guide-2/)

- O [wikibook haskell](http://en.wikibooks.org/wiki/Haskell/Category_theory)
  tem bons diagramas

- [Teoria das Categorias](http://www.haskell.org/haskellwiki/Category_theory) no
  haskellwiki, também tem bons links para outros materiais

- [Categorias do zero](http://science.raphael.poss.name/categories-from-scratch.html), inclui alguns exemplos práticos.

- Lista de [Grandes Trabalhos em LP](http://www.cis.upenn.edu/~bcpierce/courses/670Fall04/GreatWorksInPL.shtml) do Pierce.

## Livros

- [Questão no Quora: Qual o melhor livro-texto para teoria das Categorias?](http://www.quora.com/Category-Theory/What-is-the-best-textbook-for-Category-theory?share=1)     
  Recomendações do Kmett

- [Awodey](http://ukcatalogue.oup.com/product/9780199237180.do) e
  [MacLane](http://www.amazon.com/Categories-Working-Mathematician-Graduate-Mathematics/dp/0387984038).
  Os livros-texto padrão sobre o tema.

- [Fundamentos Práticos para Linguagens de Programação, do Harper](http://www.cs.cmu.edu/~rwh/plbook/book.pdf) é a melhor introdução
  à teoria dos tipos que já li.

- [Teoria dos tipos e Programação Funcional](http://www.cs.kent.ac.uk/people/staff/sjt/TTFP/).

# Outros tópicos divertidos

## Parametricidade, polimorfismo ad-hoc vs. paramétrico, teoremas livres

- [Parametricidade](tony_parametricity.pdf).

- [Fontes em TeX](https://github.com/tonymorris/parametricity/) para o texto acima.

- [Tornando o polimorfismo ad-hoc menos ad-hoc](http://swizec.com/blog/week-20-making-ad-hoc-polymorphism-less-ad-hoc/swizec/6564).

- [Teoremas de graça!](http://ttic.uchicago.edu/~dreyer/course/papers/wadler.pdf).

## Inicial e Final, DSLs, Finally Tagless

- [Codificação Final, Parte 1: Uma breve demonstração](http://creativelad.wordpress.com/2013/11/28/final-encodings-part-1-a-quick-demonstration/).

- [Transformando Valores Polimórficos](http://martijn.van.steenbergen.nl/journal/2009/10/18/transforming-polymorphic-values/).

- [GADTs em Haskell 98](http://martijn.van.steenbergen.nl/journal/2009/11/12/gadts-in-haskell-98/).

- [Cálculo Lambda Linear Tipado Tagless-Final](https://www.fpcomplete.com/user/mutjida/typed-tagless-final-linear-lambda-calculus).

- [Interpretação de tagless-final tipado: Notas de Aula](http://okmij.org/ftp/tagless-final/course/course.html).

- [Interpretadores Tagless Final Tipado](http://okmij.org/ftp/tagless-final/course/lecture.pdf).

- [O cachorro que não latia](http://existentialtype.wordpress.com/2011/03/21/the-dog-that-didnt-bark/) 
  menos especificamente relevante, mas interessante.

## Comonads

- [Comonads em Haskell](https://speakerdeck.com/dmoverton/comonads-in-haskell).

- [Questão no SO: Uma *monad* pode ser uma *comonad*?](http://stackoverflow.com/questions/16551734/can-a-monad-be-a-comonad).

## Yoneda / CoYoneda

- [Questão no SO: Explicação passo-a-passo de coyoneda](http://stackoverflow.com/questions/24000465/step-by-step-deep-explain-the-power-of-coyoneda-preferably-in-scala-throu).

- *Free monads for Less*, uma sequência de três artigos por Edward Kmett.
  * [Parte 1: Codensidade](http://comonad.com/reader/2011/free-monads-for-less/).
  * [Parte 2: Yoneda](http://comonad.com/reader/2011/free-monads-for-less-2/).
  * [Parte 3: Produzindo IO](http://comonad.com/reader/2011/free-monads-for-less-3/).

## Proposições vs. Julgamentos (computação)

- [Questão no StackExchange: Qual a diferença entre proposições e julgamentos?](http://cstheory.stackexchange.com/questions/9826/what-is-the-difference-between-propositions-and-judgments).

- [Notas de aula de um curso curto, de três aulas](http://www.ae-info.org/attach/User/Martin-L%C3%B6f_Per/OtherInformation/article.pdf)

# Tipagem dependente

- [Entendendo tipos de soma, construtores de valor, e construtores de tipo](http://bitemyapp.com/posts/2014-04-05-grokking-sums-and-constructors.html) difícil de deixar vesgo.

- [Programação dependente de tipos leve](http://okmij.org/ftp/Computation/lightweight-dependent-typing.html).

- [Linguagem de Programação Idris](http://www.idris-lang.org/).

# Linkando binários estaticamente

- [Linkagem Estática](https://wiki.haskell.org/Web/Literature/Static_linking)

- [Linkagem Estática com o GHC no Arch Linux](http://www.edofic.com/posts/2014-05-03-ghc-arch-static.html)

- [Linkando Estaticamente binários do Linux para ARM & MIPS](http://stackoverflow.com/questions/14270177/ghc-statically-linking-linux-binaries-for-arm-mips-processors)

- [Linkando Estaticamente GMP usando GHC e LLVM](http://stackoverflow.com/questions/10539857/statically-link-gmp-to-an-haskell-application-using-ghc-llvm)

## Diálogos

> Hospedado [neste](dialogues.md) repositório.

Esses são tópicos bastante importantes e úteis. Olhe aqui para mergulhar mais fundo 
numa variedade de tópicos.
