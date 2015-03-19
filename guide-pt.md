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

Não descreva coisas como "fáceis" ou "triviais". Você fará pessoas se sentirem mal por ter que trabalhar duro por progredir naquilo. Pessoas que aprendem lentamente frequentemente são aquelas que aprendem melhor, isso é algo para ser celebrado!

Sem surpresa fingida. Não se faça de surpreso quando alguém diz que não sabe alguma coisa. Essa pessoa se sentirá mal e você terá conseguido nada além de se sentir afiado.

Sem "bom, na verdade". Quando alguém diz algo que está quase - mas não totalmente - correto, e você diz, "bom, na verdade..." e então faz uma correção pequena. Isso é especialmente incômodo quando a correção não tem relação com o assunto conversado. Isso não significa que a Escola de Hackers não é sobre a busca de verdade ou que nós não nos importamos em ser precisos. Quase todos esses "bom, na verdade" são com intenção de se aparecer, não em benefício da verdade.

Sem essa de dirigir no banco de trás. Se você vê as pessoas trabalhando em um problema, você não deveria lançar conselhos intermitentemente. Deixe-as trabalhar a menos que alguém peça por ajuda. Evitar interrupções é [um dos propósitos fundamentais do #haskell-beginners](http://chrisdone.com/posts/teaching)

Sem "-ismos" sutis. Racismo, sexismo, homofobia, transfobia, e outros tipos de preconceito não são bem vindos e não serão tolerados.

---

Diretrizes do [manual da Hacker School(Escola de Hackers)](https://www.hackerschool.com/manual). 
Obrigado por disponibilizar isso, Hacker School.

# O que é Haskell, GHC, e Cabal?

Haskell é uma linguagem de programação como é definido nos relatórios, o 
mais recente sendo o de 2010. O relatório está disponível como 
[onlinereport](http://www.haskell.org/onlinereport/haskell2010/).

## GHC

[GHC](http://www.haskell.org/ghc/) é o meio mais popular de se trabalhar na 
linguagem Haskell. Ele inclui um compilador, REPL (interpretador), gerenciamento 
de pacotes, e outras coisas mais.

## Cabal

[Cabal](https://www.haskell.org/cabal/download.html) realiza gerenciamento de projetos e
resolução de dependências. É como você instalará projetos, tipicamente na própria sandbox deles.

Cabal é equivalente ao Bundler do Ruby, pip do Python, NPM do Node.js, Maven, 
etc. O GHC é responsável pelos pacotes propriamente ditos, o Cabal escolhe 
quais versões serão instaladas.

# Configurações iniciais

## Ubuntu

[Este PPA](http://launchpad.net/~hvr/+archive/ghc) é excelente e é o que eu 
uso em todas as máquinas Linux de desenvolvimento e produção.

Especificamente:

```bash
$ sudo apt-get update
$ sudo apt-get install python-software-properties # v12.04 and below
$ sudo apt-get install software-properties-common # v12.10 and above
$ sudo add-apt-repository -y ppa:hvr/ghc
$ sudo apt-get update
$ sudo apt-get install cabal-install-1.20 ghc-7.8.4 happy-1.19.4 alex-3.1.3
```

Então adicione o seguinte ao seu `$PATH` (bash\_profile, zshrc, bashrc, etc):

```
~/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.4/bin:/opt/happy/1.19.4/bin:/opt/alex/3.1.3/bin
```

*Opcional:* Você também pode adicionar `.cabal-sandbox/bin` ao seu path. 
Código que você está desenvolvendo ativamente estará disponível a partir 
da sua linha de comando. Isso funciona apenas quando o diretório de trabalho 
atual é uma sandbox do cabal.

## Debian

### Usando Ubuntu PPA

Se você não está usando o stable, pode seguir os mesmos passos do Ubuntu, mas
precisará executar um comando adicional. Imediatamente após o
`sudo add-apt-repository -y ppa:hvr/ghc`, execute: 

```bash
$ sudo sed -i s/jessie/trusty/g /etc/apt/sources.list.d/hvr-ghc-jessie.list
```

Para outras versões do Debian, apenas substitua todas as ocorrências de `jessie`
com o nome da sua versão no comando acima.

Se, por alguma razão, o arquivo `/etc/apt/sources.list.d/hvr-ghc-jessie-list` não
existir, então `/etc/apt/sources.list` deve conter uma linha assim:


    deb http://ppa.launchpad.net/hvr/ghc/ubuntu jessie main

Substitua `jessie` por `trusty` nesta linha.

### Compilação manual

Você pode seguir [este](http://www.davesquared.net/2014/05/platformless-haskell.html) 
guia escrito para Mac OS X:

Notas:

- Configure o seu prefixo adequadamente quando configurar o ghc.
- Em vez de pegar o binário do `cabal-install`, pegue o código fonte e execute
o script `bootstrap.sh`.

## Fedora 21

Para instalar o Haskell 7.8.4 a partir do repositório não-oficial (versões 22+ do Fedora vão incluí-lo
no oficial):

```bash
$ sudo yum-config-manager --add-repo \
> https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/repo/fedora-21/petersen-ghc-7.8.4-fedora-21.repo 
$ sudo yum install ghc cabal-install
```

Como dito na [página do copr
petersen/ghc-7.8.4](https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/)
este ghc não pode ser instalado em paralelo com o ghc do Fedora/EPEL.

## Arch Linux

Para instalar o Haskell dos repositórios oficiais no Arch Linux, execute

```bash
$ sudo pacman -S cabal-install ghc happy alex haddock
```

## Gentoo

No Gentoo, você pode instalar os componentes individuais da Plataforma Haskell 
através do Portage. Se você usar `ACCEPT_KEYWORDS=arch` (em vez de `ACCEPT_KEYWORDS=~arch`),
o Portage vai instalar versões antigas dos vários componentes do Haskell. 
Com isso em mente, se você usar `ACCEPT_KEYWORDS=arch`, adicione o seguinte ao 
`/etc/portage/package.keywords`:

    dev-haskell/cabal-install
    dev-lang/ghc

Uma vez que isso foi feito,

```bash
$ emerge -jav dev-lang/ghc dev-haskell/cabal-install
```

O Gentoo mantém uma versão "estável" (leia-se: antiga) do `cabal-install` na 
árvore do Portage, então você vai querer usar o `cabal-install` para instalar 
a versão mais recente. Note que as contrabarras são intencionais.

```bash
$ \cabal update                # As contrabarras
$ \cabal install cabal-install # são intencionais
```

Agora você instalou o cabal num escopo global com o portage, e localmente no 
seu diretório home com o `cabal-install`. O próximo passo é garantir que 
quando você executar o comando `cabal` num terminal, seu shell vai executar a 
versão recente que está no seu diretório home. Para isso, as seguintes linhas
devem ser adicionadas ao arquivo de configuração do seu shell:

```bash
PATH=$PATH:$HOME/.cabal/bin
alias cabal="$HOME/.cabal/bin/cabal"
```

Se não sabe qual shell é o seu, provavelmente ele é o Bash. Se você usa o
Bash, o arquivo a ser editado é o `~/.bashrc`. Se você usa o Z-shell(zsh), o
arquivo é o `~/.zshrc`. Você pode executar o seguinte comando para descobrir
qual é o seu shell.

```bash
echo $SHELL | xargs basename
```

Eu uso o zsh, então esse comando produz `zsh` como saída.

Uma vez que você fez tudo isso, você vai querer instalar as ferramentas adicionais
`alex` e `happy`.

```bash
$ cabal install alex happy
```

Parabéns! Agora você tem uma instalação funcional do Haskell!

## Mac OS X

### 10.9

Instale o app [GHC for Mac OS X](http://ghcformacosx.github.io/), que inclui o
GHC e o Cabal. Ele traz instruções sobre como adicionar o GHC e o Cabal ao seu
path depois de ter arrastado o `.app` para algum lugar.

### 10.6-10.8

Faça a instalação da distribuição binária descrita 
[neste arquivo](https://www.haskell.org/platform/download/2014.2.0.0/ghc-7.8.3-x86_64-apple-darwin-r3.tar.bz2).

## Windows

- O [instalador mínimo do GHC para Windows] (http://neilmitchell.blogspot.com/2014/12/beta-testing-windows-minimal-ghc.html)
  é capaz de compilar `network` e etc. Tecnicamente está em beta, mas deve
  funcionar para os propósitos de qualquer um que está lendo este guia.

Não esqueça de rodar o instalador como administrador, já que ele vai querer
instalar no seu Arquivos de Programas.

## Usuários de outros Linux

Baixe as últimas distribuições binárias para o cabal e ghc:

- [GHC](http://www.haskell.org/ghc/).

- [Cabal](https://www.haskell.org/cabal/download.html).

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
com o uso diário de Functors/Applicatives/Monads/etc em Haskell. Fazer o cis194
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
interessantes os módulos sobre tipos fantasma (phantom types), controle de fluxo
da informação (information flow control), extensões de linguagem (language extensions), 
concorrência, pipes e lenses.

--- 

## Material de referência para os três cursos

[Learn You a Haskell for Great Good (LYAH)](http://learnyouahaskell.com) e o
[Real World Haskell](http://book.realworldhaskell.org) (Obrigado, bos!) estão
disponíveis online.

Eu recomendo o RWH como referência (livro grosso). Os capítulos sobre
parsing e monads são ótimos para entender onde monads são úteis. Outras pessoas
já disseram que gostaram muito deles. Talvez seja um bom seguimento para
aplicações práticas depois que você já está acostumado com o essencial de Haskell.

### O que os açúcares sintáticos `<-` / `do` / compreensão de listas fazem exatamente?

Excelente [artigo](http://www.haskellforall.com/2014/10/how-to-desugar-haskell-code.html).

### Para entender listas e folds

- [Explique folds em Listas para si mesmo](http://vimeo.com/64673035)
 
### Para aprender typeclasses comuns
Útil para entender `Functor`, `Applicative`, `Monad`, `Monoid` e outras typeclasses
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
  [raciociando sobre avaliação preguiçosa](http://www.slideshare.net/tibbe/reasoning-about-laziness).

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

- [Revelando o mistério da IO monad](http://blog.ezyang.com/2011/05/unraveling-the-mystery-of-the-io-monad/).

- ["Afirmações" de primeira classe](http://blog.jle.im/entry/first-class-statements).

- [Haddocks para System.IO.Unsafe.unsafePerformIO](http://hackage.haskell.org/package/base-4.7.0.1/docs/System-IO-Unsafe.html#v:unsafePerformIO)
  Leia a documentação e nota de implementação da função `unsagedupableperformio`

Comentário de thread no Reddit por `glaebhoerl`

> Nota importante: o GHC precisa esconder a representação do símbolo de 
> estado atrás de um tipo abstrato de IO porque o símbolo de estado sempre 
> deve ser usado linearmente (não duplicado ou abandonado), mas o sistema de
> não pode reforçar isso. Clean, uma outra linguagem preguiçosa semelhante a
> Haskell, tem tipos de unicidade (que são como tipos lineares e possivelmente
> diferente em maneiras das quais não estou informado), e eles expõe a "passagem
> do Mundo" diretamente e fornece a monad (não abstrata) apenas por conveniência.

# monads e transformadores de monad (monad transformers)

> Não faça esses até que você entenda typeclasses, Monoid, Functor e Applicative!

Implemente as monads da biblioteca padrão ( List, Maybe, Cont, Error, Reader,
Writer, State ) por si mesmo para entendê-las melhor. Então talvez escreva um
interpretador monádico para uma pequena linguagem de expressões usando o artigo
[Passo-a-passo em Monad Transformers](http://www.cs.virginia.edu/~wh5a/personal/Transformers.pdf)
(mencionado abaixo em 'monad trabsformers').

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

- [Uma introdução gentil a Monad Transformers](https://github.com/kqr/gists/blob/master/articles/gentle-introduction-monad-transformers.md).

- [passo-a-passo em Monad transformers] (http://www.cs.virginia.edu/~wh5a/personal/Transformers.pdf) (Aviso! Código desatualizado).

# Testando, testes, especificações, teste de propriedades/generativo

- Este [tutorial](https://github.com/kazu-yamamoto/unit-test-example/blob/master/markdown/en/tutorial.md) por Kazu Yamamoto é fantástico.

- [Simple-Conduit](https://github.com/jwiegley/simple-conduit): Biblioteca simples e boa
  para aprender como funciona *streaming IO* em geral, conhecimento transferível
  para biliotecas como Pipes e Conduit.

# Parsing em Haskell

- [Tutorial](https://github.com/JakeWheat/intro_to_parsing) em parser combinators
  para Haskell usando a Parsec

- [Escrevendo a sua própria micro-parsec](http://olenhad.me/articles/monadic-parsers/)

## Parsing e geração de JSON

Aeson é a solução padrão para parsing de [JSON](https://json.org) em Haskell. 
Disponível no [hackage](https://hackage.haskell.org/package/aeson) e
[github](https://github.com/bos/aeson).

- [Fazendo parsing de JSON usando a Aeson](http://blog.raynes.me/blog/2012/11/27/easy-json-parsing-in-haskell-with-aeson/)

- [Aeson tipos criados pelo usuário](http://bitemyapp.com/posts/2014-04-11-aeson-and-user-created-types.html)

- [Fazendo o parsing de dados não-determinísticos com a aeson tipos de soma](http://bitemyapp.com/posts/2014-04-17-parsing-nondeterministic-data-with-aeson-and-sum-types.html)

- [Tutorial Aeson](https://www.fpcomplete.com/school/starting-with-haskell/libraries-and-frameworks/text-manipulation/json)

# Graph algorithms and data structures
# Algoritmos de Grafo e Estrutura de Dados

- O [pacote fgl](https://hackage.haskell.org/package/fgl) particularmente o 
  caminho mais curto puramente funcionamente [algos](http://hackage.haskell.org/package/fgl-5.4.2.2/docs/Data-Graph-Inductive-Query-SP.html).

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

- [Meus dotfiles](https://github.com/bitemyapp/dotfiles/)

- [Configuração do emacs do Chris Done](https://github.com/chrisdone/chrisdone-emacs)

## Vim

- [Página do Vim no haskellwiki](http://www.haskell.org/haskellwiki/Vim)

- [Haskell-vim-now](https://github.com/begriffs/haskell-vim-now)

- [Um workflow com vim+haskell](http://www.stephendiehl.com/posts/vim_haskell.html)

- [GHC-Mod](https://github.com/kazu-yamamoto/ghc-mod)

- [plugin do vim para o GHC-Mod](https://github.com/eagletmt/ghcmod-vim)

- [Hindent](https://github.com/chrisdone/hindent)

## Sublime Text

- [SublimeHaskell](https://github.com/SublimeHaskell/SublimeHaskell)

# FAQ e trabalhando com o Cabal

## FAQ fantástico

Além de ser um ótimo guia para todos tipo de coisa como GADTs,
isto também cobre alguns pontos básicos do Cabal.

- [O que eu gostaria de ter sabido quando estava aprendendo Haskell](http://dev.stephendiehl.com/hask/)
  também no github [aqui](https://github.com/sdiehl/wiwinwlh).

## Diretrizes do Cabal

O *Cabal Hell* (Inferno do Cabal) era um problema para usuário de Haskell
antes da introdução das *sandboxes*. Instalar fora de uma *sandbox* vai instalar
no package-db de seu usuário. Isso *não* é uma boa ideia, exceto para pacotes 
fundamentais como Cabal, alex e happy. Nada além diss deve ser instalado nos
package-dbs do usuário ou global a menos que você saiba o que está fazendo.

Algumas melhores práticas para evitar o cabal hell estão disponíveis 
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
ghc-pkg e o Cabal funcinoam, *evite a plataforma* e em vez dela use as instruções para
instalação no começo deste guia.


## Stackage

Para qualquer usuários (principalmente os do Yesod) que tem problemas de compilação,
considere o Stackage.
- Um bom sumário do Stackage [aqui](https://www.fpcomplete.com/blog/2014/05/stackage-server).

Na opinião do autor, o Stackage é geralmente mais útil do que o `cabal freeze`.

# Hoogle e Haddock

## Pesquise código pela *type signature*

O [motor de buscas Hoogle](http://www.haskell.org/hoogle/) pode pesquisar pelos tipos.

Por exemplo, olho os resultados de busca para `(a -> b) -> [a] -> [b]` 
[aqui](http://www.haskell.org/hoogle/?hoogle=%28a+-%3E+b%29+-%3E+%5ba%5d+-%3E+%5bb%5d).

Também hospedado pelo fpcomplete [aqui](https://www.fpcomplete.com/hoogle).

Também o [Hayoo](http://holumbus.fh-wedel.de/hayoo/hayoo.html) (que por padrão tem tudo do
hackage disponível para pesquisa).

## Configurando sua própria instância local do Hoogle

Dê uma olhada [aqui](https://gist.github.com/bitemyapp/3e6a015760775e0679bf).

## Haddock

1. [Conserte sua documentação do hackage](http://fuuzetsu.co.uk/blog/posts/2014-01-06-Fix-your-Hackage-documentation.html)

2. [Documentação v2 do Hackage](http://fuuzetsu.co.uk/blog/posts/2014-01-06-Hackage-documentation-v2.html)

Perceba que essas postagens estão *levemente desatualizadas*: por exemplo, agora o Hackage ostenta
informação nova com informação de documentação a estado da build.

## O que você realmente precisa saber

Para fazer com que o haddocks inclua documentação para pacotes relacionados,
você deve setar `documentation: True` no seu `~/.cabal/config`. Se ele for deixado
no padrão (`False`) ou setado para `False`, você vai precisar deletar todos os seus
pacotes e reinstalar antes de gerar os haddocks.

Outra coisa para se ter em mente é que devido ao modo como o parâmetro `$pkg` é
interpolado *pelo* cabal, não por você, os parâmetros `html-location` e `content-location`
*precisam estar em aspas simples* e configurados num shell ou contidos num shell script.
Eles não vão funcionar num Makefile, porque ele vai pensar que são variáveis para o Make!

```bash
#! /usr/bin/env sh

# You can write it one one line by skipping the backslashes
cabal haddock --hoogle --hyperlink-source                       \
 --html-location='http://hackage.haskell.org/package/$pkg/docs' \
 --contents-location='http://hackage.haskell.org/package/$pkg'
```
