# La Guida
Questa è la via che raccomando per imparare Haskell.

## Per chi non parla italiano

* [Auf Deutsch](guide-de.md)

* [Στην ελληνική](guide-el.md)

* [En Français](guide-fr.md)

* [In English](README.md)

* [Em Português](guide-pt.md)

* [Türkçe](guide-tr.md)


#### Un consiglio: *non preoccupatevi se non capite qualcosa alla prima*. Andate avanti.

## Comunità
Il nostro canale IRC è `#haskell-beginners` su Freenode.

Un client web per IRC [qui](http://webchat.freenode.net/).

La [mailing list](https://wiki.haskell.org/Mailing_lists) di Haskell.

### Linee guida per la comunità

[Leggete il post di Chris Done  sull'insegnamento](http://chrisdone.com/posts/teaching).
Siate gentili e cortesi. Comportamenti crudeli o meschini spaventano gli altri e fanno passare alla gente la voglia di partecipare.

Crtitiche facili, in cui non mettete impegno, beneficiano solo la persona che le fa, non la persona che le riceve.

Non descrivete nulla con parole come "facile" o "banale". Chi legge si sentirà stupido perché per lui le cose che definite come triviali possono aver richiesto molto impegno. Spesso chi impara lentamente impara più profondamente, è una cosa che dovremmo celebrare invece!

Non fate finta di essere sorpresi. Non fate i sorpresi quando qualcuno vi dice che non sa qualcosa. Lo farete sentire stupido e non avrete ottenuto niente a parte sentirvi più furbi.

Non dite beh-in realtà. Quando qualcuno dice che qualcosa è quasi - ma non completamente corretto e voi cominciate a dire, "beh, in realtà…" e poi fate una piccola correzione. È molto irritante, specialmente quando la correzione non è pertinente alla conversazione che state avendo. Questo non significa che Hacker School non si preoccupi della verità o che non ci interessi essere precisi. Ma questi modi di fare sono quasi sempre più una questione di pavoneggiarmenti e non di verità.

Non dite agli altri cosa devono fare. Se qualcuno sta completando un esercizio non dovreste interromperlo a sprazzi con continui consigli. Lasciate che trovino la loro strada a meno che non chiedano esplicitame. Evitare interruzioni è [uno degli obiettivi fondamentali di  #haskell-beginners](http://chrisdone.com/posts/teaching).

Non abbiate sottili -ismi. Razzismo, sessismo, omofobia, transfobia, e altri tipi di pregiudizi non saranno tollerati

---

Linee guida tratte dal [manuale della Hacker School ](https://www.hackerschool.com/manual). Grazie per averlo reso pubblico, Hacker School.

# Cosa sono Haskell, GHC e Cabal?

Haskell è un linguaggio di programmazione, come potete leggere nei report, il più recente è stato eseguito nel 2010. Il report è disponibile come
[report online](http://www.haskell.org/onlinereport/haskell2010/).

## GHC

[GHC](http://www.haskell.org/ghc/) è il modo più popolare per lavorare in Haskell. Include un compilatore, una REPL (interprete), gestione automatica delle librerie, e altre cose in più.

## Cabal

[Cabal](https://www.haskell.org/cabal/download.html) gestisce il progetto e la risoluzione delle dipendenze. È lo strumento che vi permetterà di installare i progetti, tipicamente ciascuno nel proprio sandbox.

Cabal è equivalente a Bundler di Ruby, pip di Python, NPM di Node, Maven, etc. GHC
gestisce i pacchetti indipendentemente, Cabal sceglie che versione installare.

# Il set-up dei tool

## Ubuntu

[Questo PPA](http://launchpad.net/~hvr/+archive/ghc) è ottimo ed è quello che uso su tutte le mie macchine linux sia per i build automatici che per lo sviluppo. 

Istruzioni specifiche:

```bash
$ sudo apt-get update
$ sudo apt-get install python-software-properties # v12.04 and below
$ sudo apt-get install software-properties-common # v12.10 and above
$ sudo add-apt-repository -y ppa:hvr/ghc
$ sudo apt-get update
$ sudo apt-get install cabal-install-1.20 ghc-7.8.3 happy-1.19.4 alex-3.1.3
```

Poi aggiungete questa linea alla vostra `$PATH` (bash\_profile, zshrc, bashrc, etc):

```
~/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.3/bin:/opt/happy/1.19.4/bin:/opt/alex/3.1.3/bin
```

*Opzionale:* Potete anche aggiungere `.cabal-sandbox/bin` alla vostra path. Il codice che state sviluppando attivamente vi sarà disponibile dalla linea di comando.  Questo funziona solo quando la directory in cui siete è un sandbox di cabal.

## Debian

### Repository GHC  per debian stable

Se usate Debian stable, è più facile usare http://deb.haskell.org/. Per usarlo:

- Aggiungete la linea `deb http://deb.haskell.org/stable/ ./` a `/etc/apt/sources.list`

```bash
## Aggiungi la chiave per evitare warning
$ GET http://deb.haskell.org/deb.haskell.org.gpg-key | apt-key add -
$ sudo apt-get update
$ sudo apt-get install ghc-7.8.3 happy alex cabal-install
```

### Usando Ubuntu PPA

Se non state usando stable, le stesse istruzioni che abbiamo indicato per Ubuntu fuzioneranno, ma dovrete eseguire un comando in più. Imediatamente dopo
`sudo add-apt-repository -y ppa:hvr/ghc` è stato eseguito lanciate:

```bash
$ sudo sed -i s/jessie/trusty/g /etc/apt/sources.list.d/hvr-ghc-jessie.list
```

Per altre versioni di Debian, dovete solo rimpiazzare tutte le occorrenze di `jessie` con il nome della versione che avete nel comando appena sopra.

Se, per qualche ragione, il file `/etc/apt/sources.list.d/hvr-ghc-jessie.list` non esiste, allora `/etc/apt/sources.list` dovrebbe contenere una linea come questa:

    deb http://ppa.launchpad.net/hvr/ghc/ubuntu jessie main

Rimpiazzate `jessie` con `trusty` in questa linea.

### Compilazione manuale

Potete seguire
[questa](http://www.davesquared.net/2014/05/platformless-haskell.html) guida
scritta per Mac OS X:

Note:

- Quando configurate ghc settate il prefisso appropriato
- Invece di prendere il binario di `cabal-install`, prendete il codice sorgente e lanciate lo script
  `bootstrap.sh`.

## Fedora 21

Per installare Haskell 7.8.4 dalla repo non ufficiale (Fedora 22+ lo includerà in quella ufficiale):

```bash
$ sudo yum-config-manager --add-repo \
> https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/repo/fedora-21/petersen-ghc-7.8.4-fedora-21.repo 
$ sudo yum install ghc cabal-install
```

Come affermato in
[petersen/ghc-7.8.4 copr page](https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/)
questo ghc non può essere installato in parallelo con il ghc di Fedora/EPEL.

## Arch Linux

Per installare Haskell dalle repo ufficiale su Arch Linux, lanciate

```bash
$ sudo pacman -S cabal-install ghc happy alex haddock
```

## Gentoo

Su Gentoo, potete installare i singoli componenti della Haskell Platform
attraverso Portage. Se usate `ACCEPT_KEYWORDS=arch` (invece che
`ACCEPT_KEYWORDS=~arch`), Portage invece installerà versioni antiche delle varie cose Haskell. Tenendone di conto, se usate `ACCEPT_KEYWORDS=arch`, aggiungete le linee seguenti a `/etc/portage/package.keywords`.

    dev-haskell/cabal-install
    dev-lang/ghc

Una volta fatto quello,

```bash
$ emerge -jav dev-lang/ghc dev-haskell/cabal-install
```

Gentoo tiene una versione "stabile" (leggi: vecchia) di `cabal-install` nell'albero di Portage, quindi vorrete usare `cabal-install` per installare le versioni più recenti. I backslash sono intenzionali.

```bash
$ \cabal update                # I backslash
$ \cabal install cabal-install # sono intentionali
```

Adesso avete installato cabal a livello globale con portage, e localmente nella vostra directory home con `cabal-install`. Il prossimo passo è assicurarsi che quando lanciate `cabal` in un terminale, la vostra shell lanci la versione più recente che è nella directory home. Aggiugete le linee seguenti nel file di configurazione della vostra shell:

```bash
PATH=$PATH:$HOME/.cabal/bin
alias cabal="$HOME/.cabal/bin/cabal"
```

Se non sapete quale shell avete, è molto probabile che la vostra shell sia Bash. Se usate Bash, il file che dovete editare è `~/.bashrc`. se usate Z-shell, il file è `~/.zshrc`. Potete lanciare il seguete comando per sapere qual'è la vostra shell.

```bash
echo $SHELL | xargs basename
```

Io uso zsh, quindi il comando restituisce `zsh` quando lo lancio.

Una volta fatto tutto questo, vorrete installare i tool addizionali `alex` e
`happy`.

```bash
$ cabal install alex happy
```

Congratulazioni! Adesso avete una installazione di Haskell funzionante!

## Mac OS X

### 10.9

Installate [GHC per Mac OS X](http://ghcformacosx.github.io/), che include GHC e Cabal. Vi darà istruzioni su come installare GHC e Cabal nella vostra path una volta che avete copiato la .app da qualche parte sul disco fisso.

### 10.6-10.8

Eseguite l'installazione dei binari come scritto qui sotto usando [questa tarball](https://www.haskell.org/platform/download/2014.2.0.0/ghc-7.8.3-x86_64-apple-darwin-r3.tar.bz2).

## Windows

- L' [installer minimo per windows di GHC](http://neilmitchell.blogspot.com/2014/12/beta-testing-windows-minimal-ghc.html)
  è in grado di compilare `network` e altro. È tecnicamente in beta ma dovrebbe funzionare per gli scopi di chiunque legga questa guida.

Non dimenticatevi di lanciare l'installer come amministratore, dato che richiede l'accesso alla directory di sistema 'Programmi'.

## Altri utenti Linux

Scaricate l'ultima distribuzione binaria di cabal e ghc:

- [GHC](http://www.haskell.org/ghc/).

- [Cabal](https://www.haskell.org/cabal/download.html).

# Corsi primari

## Il corso cis194 di Yorgey

> *Seguite questo per primo*, questa è la via che raccomando per il primo contatto con
> Haskell.

Disponibile [online](http://www.seas.upenn.edu/~cis194/spring13/lectures.html).

Il corso di [Brent Yorgey](https://byorgey.wordpress.com) è il migliore che ho trovato finora.  Questo corso ha valore non solo perché vi rende in grado di scrivere Haskell basilare ma anche perché vi aiuterà a comprendere i parser combinators.

L'unica ragione per cui non dovreste cominciare con cis194 è se non siete programmatori o se non avete molta esperienza. In questo caso, cominciate con il 
[libro di Thompson](http://www.haskellcraft.com/craft3e/Home.html) e poi passate a cis194.

---

## Il corso NICTA

> Questo è il corso che raccomando dopo cis194 di Yorgey's

Disponibile su github [qui](https://github.com/NICTA/course).

Questo vi darà esperienza nell'implementare direttamente le astrazioni introdotte in cis194, questi esercizi sono *critici* per sviluppare confidenza con gli usi comuni di Functor/Applicative/Monad/etc. in Haskell. La raccomandazione chiave della mia guida é seguire cis194 e poi NICTA, e questo é il percorso che seguo per insegnare Haskell a tutti.

---

## Corso Supplementare cs240h

> Fornisce più materiale sugli argomenti intermedi

Disponibile [online](http://www.scs.stanford.edu/14sp-cs240h/).

Questo é il corso online di [Bryan O'Sullivan](https://github.com/bos) tratto dal corso che insegna a Stanford. Se non sapete chi é date un'occhiata alla metà delle librerie che qualunque progetto Haskell finisce per richiedere e ci troverete il suo nome. Sa avete già seguito il corso di Yorgey sono particolarmente rilevanti i moduli sui phantom types, il flusso di controllo delle informazioni, le estensioni del linguaggio, concorrenza, pipes e lenses.

---

## Materiale di riferimento per i tre corsi

[Learn You a Haskell for Great Good (LYAH)](http://learnyouahaskell.com) e
[Real World Haskell](http://book.realworldhaskell.org) (Grazie bos!) sono disponibili online.

Raccomando RWH come referenza (é un libro spesso). I capitoli sul parsing e sulle monadi
sono ottimi per ottenere un'intuizione sull'utilità delle monadi. Altri hanno detto che gli é piaciuto molto. Forse un buon seguito per imparare gli idiomi in modo pratico, una volta che avete imparato le cose essenziali di Haskell? 

### Cosa fa quel syntactic sugar `<-` / `do` / sulle list comprehension?

Eccellente [articolo](http://www.haskellforall.com/2014/10/how-to-desugar-haskell-code.html).

### Per capire list e fold

- [Come imparare i List Fold](http://vimeo.com/64673035)

### Per imparare alcune Typeclass comuni

Utile per capire `Functor`, `Applicative`, `Monad`, `Monoid` e altre Typeclass in general, ma anche per certa Category Theory specifica ad Hask:

- LA [Typeclassopedia](http://www.haskell.org/haskellwiki/Typeclassopedia)

### Capire i messaggi di errore più comuni di Haskell

- [Capire i messaggi di errore più comuni](http://ics.p.lodz.pl/~stolarek/_media/pl:research:stolarek_understanding_basic_haskell_error_messages.pdf)

---

# Laziness, strictness, guarded recursion

- Il libro di Marlow [book](http://chimera.labs.oreilly.com/books/1230000000929/ch02.html)
  sul parallelismo e la concorrenza ha una delle migliori introduzioni a alla laziness e alla normal form che abbia trovato. Usate altro materiale in più se non acquisite i concetti subito.

- [Più punti per la lazy evaluation](http://augustss.blogspot.hu/2011/05/more-points-for-lazy-evaluation-in.html)

- [Oh my laziness!](http://alpmestan.com/posts/2013-10-02-oh-my-laziness.html)

- Domanda su SO '[Haskell ha laziness?](http://stackoverflow.com/questions/13042353/does-haskell-have-tail-recursive-optimization)'

- LA presentazione di [Johan Tibell](https://github.com/tibbe) su
  [ragionare sulla laziness](http://www.slideshare.net/tibbe/reasoning-about-laziness).

## Breve dimostrazione

```haskell
let a = 1 : a -- guarded recursion, (:) é lazy su di esso si può usare pattern matching.
let (v : _) = a
> v
1
> head a -- head a == v
1

let a = 1 * a -- non guarded, (*) é strict
> a
*** Exception: <<loop>>
```

# IO

- [Evaluation order e State tokens](https://www.fpcomplete.com/user/snoyberg/general-haskell/advanced/evaluation-order-and-state-tokens)

- [Svelare il mistero della monade IO](http://blog.ezyang.com/2011/05/unraveling-the-mystery-of-the-io-monad/).

- [First class "statements"](http://blog.jle.im/entry/first-class-statements).

- [Haddocks per System.IO.Unsafe.unsafePerformIO](http://hackage.haskell.org/package/base-4.7.0.1/docs/System-IO-Unsafe.html#v:unsafePerformIO)
  Leggete la documentazione e le note sulla impplementazione di unsafeDupablePerformIO

Commento da un thread di Reddit, di `glaebhoerl`

> Nota interessante: GHC deve nascondere la rappresentazione dello state token 
> dietro un tipo IO astratto perche lo state token deve sempre essere usato linearmente (non
> duplicated o droppato), ma il type system non può garantire che accada. Clean, un altro
> linguaggio lazy come Haskell, ha uniqueness types (sono come i linear types
> e possibilmente diversi in modi di cui non sono a conoscenza), e espongono 
> World-passing direttamente e forniscono una monade IO (non astratta) solo per
> convenienza.

# Monadi and monad transformers

> Non cominciate a imparali finché non capite typeclasse, Monoid, Functor e
> Applicative!

Implementate per conto vostro le monadi nella libreria standard ( List, Maybe, Cont, Error, Reader,
Writer, State ) per capirli meglio. Poi potreste scrivere un interprete monadico per un small expression language usando la paper
[Monad Transformer Passo dopo Passo](http://www.cs.virginia.edu/~wh5a/personal/Transformers.pdf) (menzionata in 'monad transformers' qui sotto).

Scrivere molti interpreti cambiando solo la monade per cambiare la semantica può aiutarvi a capire in che cosa consiste.

- [Questa resentazioe](https://vimeo.com/73648150) di Tony dà un eccellente motivazione per i monad
  transformers, [le slide](https://dl.dropboxusercontent.com/u/7810909/talks/monad-transformers/cbaa991e0eb49224eb286c1e418e2b9828e1fb21/monad-transformers.pdf).

Poi reimplementate `Control.Monad`. Funzioni come `mapM` o `sequence` sono buone opportunità per fare esercizio nello scrivere codice monadico generico.

Il corso NICTA può essere usato come una guida a questo processo, che include anche scrivere il vostro Applicative.

Referenza:

- Commenti su Reddit di htmltyp and Crandom [qui](http://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5aj6).

- Commenti su Reddit di jozefg [qui](http://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5trg).

## Monad transformers

- [Un'introduzione gentile ai Monad Transformers](https://github.com/kqr/gists/blob/master/articles/gentle-introduction-monad-transformers.md).

- [Monad transformers passo dopo passo](http://www.cs.virginia.edu/~wh5a/personal/Transformers.pdf) (warning, code out of date).

# Testare, test, specifiche, testare generative/property

- Questo [tutorial](https://github.com/kazu-yamamoto/unit-test-example/blob/master/markdown/en/tutorial.md) di Kazu Yamamoto è fantastico.

- [Simple-Conduit](https://github.com/jwiegley/simple-conduit): Good simple
  library for learning how streaming IO works in general, knowledge
  transferrable to libraries like Pipes and Conduit

# Parsing in Haskell

- Parser combinator [tutorial](https://github.com/JakeWheat/intro_to_parsing)
  for Haskell using Parsec

- [Writing your own micro-Parsec](http://olenhad.me/articles/monadic-parsers/)

## Parsing and generating JSON

Aeson is the standard [JSON](https://json.org) parsing solution in
haskell. Available from [hackage](https://hackage.haskell.org/package/aeson) and
[github](https://github.com/bos/aeson).

- [Parsing JSON using Aeson](http://blog.raynes.me/blog/2012/11/27/easy-json-parsing-in-haskell-with-aeson/)

- [Aeson and user created types](http://bitemyapp.com/posts/2014-04-11-aeson-and-user-created-types.html)

- [Parsing non-deterministic data with aeson and sum types](http://bitemyapp.com/posts/2014-04-17-parsing-nondeterministic-data-with-aeson-and-sum-types.html)

- [Aeson tutorial](https://www.fpcomplete.com/school/starting-with-haskell/libraries-and-frameworks/text-manipulation/json)

# Graph algorithms and data structures

- The [fgl package](https://hackage.haskell.org/package/fgl) particularly the
  purely functional shortest path [algos](http://hackage.haskell.org/package/fgl-5.4.2.2/docs/Data-Graph-Inductive-Query-SP.html).

- [Inductive graphs and Functional Graph Algorithms](http://web.engr.oregonstate.edu/~erwig/papers/abstracts.html#JFP01).

- [FGL/Haskell - A Functional Graph Library](http://web.engr.oregonstate.edu/~erwig/fgl/haskell/old/fgl0103.pdf).

- [Data.Graph source from Containers package](http://hackage.haskell.org/package/containers-0.5.5.1/docs/Data-Graph.html).

- The [graphs package](https://hackage.haskell.org/package/graphs).

- [SO question about PHOAS](http://stackoverflow.com/questions/24369954/separate-positive-and-negative-occurrences-of-phoas-variables-in-presence-of-rec)

- [PHOAS for free](https://www.fpcomplete.com/user/edwardk/phoas).

- [Tying the Knot](http://www.haskell.org/haskellwiki/Tying_the_Knot).

- [Hackage: dag](https://hackage.haskell.org/package/dag).

# Development Environment

## Emacs

- [Alejandro Serras's tutorial](https://github.com/serras/emacs-haskell-tutorial/blob/master/tutorial.md)

- [My dotfiles](https://github.com/bitemyapp/dotfiles/)

- [Chris Done's emacs config](https://github.com/chrisdone/chrisdone-emacs)

## Vim

- [Vim page on haskellwiki](http://www.haskell.org/haskellwiki/Vim)

- [Haskell-vim-now](https://github.com/begriffs/haskell-vim-now)

- [A vim+haskell workflow](http://www.stephendiehl.com/posts/vim_haskell.html)

- [GHC-Mod](https://github.com/kazu-yamamoto/ghc-mod)

- [GHC-Mod vim plugin](https://github.com/eagletmt/ghcmod-vim)

- [Hindent](https://github.com/chrisdone/hindent)

## Sublime Text

- [SublimeHaskell](https://github.com/SublimeHaskell/SublimeHaskell)

# FAQ and working with Cabal

## Fantastic FAQ

In addition to being an amazing guide for all kinds of things such as GADTs,
this also covers some useful basics for Cabal

- [What I wish I knew when learning Haskell](http://dev.stephendiehl.com/hask/)
  also on github [here](https://github.com/sdiehl/wiwinwlh).

## Cabal guidelines

Cabal Hell was a problem for Haskell users before the introduction of
sandboxes. Installing outside of a sandbox will install into your user
package-db. This is *not* a good idea except for foundational packages like
Cabal, alex, and happy. Nothing else should be installed in the user or global
package-dbs unless you know what you're doing.

Some best practices for avoiding cabal hell are available
[here](http://softwaresimply.blogspot.com/2014/07/haskell-best-practices-for-avoiding.html).

To experiment with a package or start a project, begin by doing
`cabal sandbox init` in a new directory.

Put briefly:

- Always use sandboxes for installing new packages, building new or existing
  projects, or starting experiments

- Use `cabal repl` to start a project-scoped ghci instance

The sandbox-based approach I suggest should avoid package-dependency problems,
but it's incompatible with the way the Haskell Platform provides pre-built
packages. If you're still learning Haskell and don't understand how ghc-pkg and
Cabal work, *avoid platform* and instead use the install instructions earlier in
the guide.

## Stackage

For any users (usually Yesod users) that have build problems, consider Stackage.

- A good summary of Stackage is
  [here](https://www.fpcomplete.com/blog/2014/05/stackage-server).

In the author's opinion, Stackage is usually more useful than `cabal freeze`.

# Hoogle and Haddock

## Search code by type signature

The [Hoogle search engine](http://www.haskell.org/hoogle/) can search by type.

For example, look at the search results for `(a -> b) -> [a] -> [b]`
[here](http://www.haskell.org/hoogle/?hoogle=%28a+-%3E+b%29+-%3E+%5ba%5d+-%3E+%5bb%5d).

Also hosted by fpcomplete [here](https://www.fpcomplete.com/hoogle).

Also [Hayoo](http://holumbus.fh-wedel.de/hayoo/hayoo.html) (which has all of
hackage enabled for search by default).

## Setting up your own local instance of Hoogle

Take a look [here](https://gist.github.com/bitemyapp/3e6a015760775e0679bf).

## Haddock

1. [Fix your hackage documentation](http://fuuzetsu.co.uk/blog/posts/2014-01-06-Fix-your-Hackage-documentation.html)

2. [Hackage documentation v2](http://fuuzetsu.co.uk/blog/posts/2014-01-06-Hackage-documentation-v2.html)

Note that these posts are *slightly out of date*: for example, now Hackage sports
shiny new info with documentation info and build status.

## What you really need to know

In order to have haddocks include documentation for related packages, you have
to set `documentation: True` in your `~/.cabal/config`. If it was left on the
default (`False`) or set to `False`, you'll have to delete all your packages and
reinstall before generating haddocks.

The other thing to keep in mind is that due to the way the `$pkg` parameter gets
interpolated *by* cabal, not by you, the `html-location` and `content-location`
parameters *must be in single quotes* and entered into a shell or contained in a
shell script. They will not work in a Makefile, because it will think they are
Make variables!

```bash
#! /usr/bin/env sh

# You can write it one one line by skipping the backslashes
cabal haddock --hoogle --hyperlink-source                       \
 --html-location='http://hackage.haskell.org/package/$pkg/docs' \
 --contents-location='http://hackage.haskell.org/package/$pkg'
```

# TravisCI

If you're as big a fan of [TravisCI](https://travis-ci.org) as I am, then I
*strongly* recommend you take a look at
[multi-ghc-travis](https://github.com/hvr/multi-ghc-travis) by as the basis of
the `travis.yml` for your Haskell projects.

# Frontend/JavaScript

We have an embarrassment of riches! There are three main choices I would
recommend:

* [Haste](http://haste-lang.org/) a Haskell to JavaScript compiler
  - The [compiler](https://github.com/valderman/haste-compiler) on github.
  - An excellent
    [demo](http://www.airpair.com/haskell/posts/haskell-tutorial-introduction-to-web-apps)
    of Haste with an example project.

* [GHCJS](https://github.com/ghcjs/ghcjs)
  - [GHCJS Introduction](http://weblog.luite.com/wordpress/?p=14)
  - [Functional Reactive Web Interfaces with GHCJS and Sodium](http://weblog.luite.com/wordpress/?p=127)
  - [Writing Atom plugins in Haskell using ghcjs ](http://edsko.net/2015/02/14/atom-haskell/)

* [PureScript](http://www.purescript.org/)
  - Not strictly Haskell like Haste and GHCJS, but a popular choice among
    Haskellers
  - Written in and inspired by haskell
  - Try purescript in you browser [here](http://try.purescript.org/)
  - Great guide for [getting started](http://www.christopherbiscardi.com/2014/06/22/getting-started-with-purescript/)

## Which frontend language do I use?

GHCJS and Haste are both fully Haskell. GHCJS will work with more Haskell
packages than Haste, but this doesn't affect a lot of frontend
projects. PureScript isn't Haskell at all, so direct code sharing with your
backend will not work.

GHCJS has the fattest runtime payload overhead at about 100kb (luite is working
on this). Haste and PureScript are competitive.

PureScript has the best JS tooling integration (uses gulp/grunt/bower), GHCJS
and Haste integrate better with Haskell's tooling (Cabal).

All three are great choices and will work for most frontend projects.

# For a more thorough understanding of laziness, NF, WHNF

- [Notes on lambda calculus](https://vec.io/posts/notes-on-lambda-calculus).

## Research papers about lazy lambda calculi

- [A call by need lambda calculus](http://homepages.inf.ed.ac.uk/wadler/topics/call-by-need.html#need-journal).

- [Demonstrating Lambda Calculus Reduction](http://www.itu.dk/~sestoft/papers/sestoft-lamreduce.pdf)

- [The lazy lambda calculus](http://www.cs.ox.ac.uk/files/293/lazy.pdf).

- [Lazy evaluation of Haskell](http://www.vex.net/~trebla/haskell/lazy.xhtlm)

# Parallelism/Concurrency

- [Parallel and Concurrent Programming in Haskell](http://chimera.labs.oreilly.com/books/1230000000929). This
  book by Simon Marlow is probably the best I've ever read on the topics of
  Parallelism and Concurrency.

- A thorough [walk-through](http://kukuruku.co/hub/haskell/haskell-testing-a-multithread-application)
  on testing & incremental development of a multi-threaded application in
  Haskell.

- [Functional Reactive Programming](http://www.haskell.org/haskellwiki/Functional_Reactive_Programming)

# Lenses and Prisms

After you're comfortable with Haskell, strongly consider learning Lenses and
Prisms, even if just as a "user". You don't need to understand the underlying
category for it to be useful.

People vastly overestimate the difficulty of using Lens. Anybody comfortable
with Functor/Foldable/Traversable (or even just the first one) can leverage
lenses and prisms to make their life happier.

If you've ever done something like: `(fmap . fmap)` you were "lensing" in your
head.

I recommend these two tutorials/introductions:

- [A little lens starter tutorial](https://www.fpcomplete.com/school/to-infinity-and-beyond/pick-of-the-week/a-little-lens-starter-tutorial)

- [Lens: Lenses, Folds and Traversals](https://github.com/ekmett/lens#lens-lenses-folds-and-traversals)

Look here for more information: [Lens package on hackage](http://hackage.haskell.org/package/lens).

# Recursion Schemes

Some of the crazy \*-morphism words you've heard are actually about
recursion. NB - before tackling this material you should know how to implement
foldr for lists and at least one other data structure, such as a tree. (folds
are catamorphisms) Knowing how to implement an unfold (anamorphism) for the same
will round things out a bit.

This material dovetails with traversable and foldable.

- [An introduction to recursion schemes](http://patrickthomson.ghost.io/an-introduction-to-recursion-schemes/)

- [Don't fear the cat](http://fho.f12n.de/posts/2014-05-07-dont-fear-the-cat.html) -
  Good demonstration of how hylomorphism is the composition of cata and ana.

- [Recursion Schemes](http://comonad.com/reader/2009/recursion-schemes/) - This
  field guide is excellent.

- [Functional Programming with Bananas, Lenses, Envelopes and Barbed Wire](http://eprints.eemcs.utwente.nl/7281/01/db-utwente-40501F46.pdf)

- [Catamorphisms](https://www.fpcomplete.com/user/edwardk/recursion-schemes/catamorphisms)

# GHC Core and performance tuning

- [Write Haskell as Fast as C](write_haskell_as_fast_as_c.md)

- [GHC Wiki: CoreSyn Type](https://ghc.haskell.org/trac/ghc/wiki/Commentary/Compiler/CoreSynType).

- [Hackage: GHC Core](https://hackage.haskell.org/package/ghc-core).

- [SO Question: Reading GHC Core](http://stackoverflow.com/questions/6121146/reading-ghc-core).

- [Haskell as fast as C](http://donsbot.wordpress.com/2008/06/04/haskell-as-fast-as-c-working-at-a-high-altitude-for-low-level-performance/).

- [Real World Haskell, Chapter 25: Profiling and Optimizations](http://book.realworldhaskell.org/read/profiling-and-optimization.html).

# Type and Category Theory

> *Not* needed to actually write Haskell, just for those interested!

If you want to follow up on type and category theory:

- [Catster's Guide](http://byorgey.wordpress.com/2014/01/14/catsters-guide/) and
  [Catster's Guide 2](http://byorgey.wordpress.com/catsters-guide-2/)

- The [haskell wikibook](http://en.wikibooks.org/wiki/Haskell/Category_theory)
  has nice diagrams

- [Category Theory](http://www.haskell.org/haskellwiki/Category_theory) on
  haskellwiki, also has good links to other resources

- [Categories from scratch](http://science.raphael.poss.name/categories-from-scratch.html), Includes some practical examples.

- Pierce's [Great Works in PL](http://www.cis.upenn.edu/~bcpierce/courses/670Fall04/GreatWorksInPL.shtml) list.

## Books

- [Quora Question: What is the best textbook for category theory?](http://www.quora.com/Category-Theory/What-is-the-best-textbook-for-Category-theory?share=1) Kmett's recommendations

- [Awodey](http://ukcatalogue.oup.com/product/9780199237180.do) and
  [MacLane](http://www.amazon.com/Categories-Working-Mathematician-Graduate-Mathematics/dp/0387984038). The standard textbooks on category theory.

- [Harper's Practical Foundations for Programming Languages](http://www.cs.cmu.edu/~rwh/plbook/book.pdf) is the best PL focused intro to type theory I've read.

- [Type theory and Functional Programming](http://www.cs.kent.ac.uk/people/staff/sjt/TTFP/).

## Stephen's Nifty "How to get to monad" posts

- [Adjunctions](http://www.stephendiehl.com/posts/adjunctions.html).

- [Monads](http://www.stephendiehl.com/posts/monads.html).

# Other fun topics

## Parametricity, ad-hoc vs. parametric polymorphism, free theorems

- [Parametricity](tony_parametricity.pdf).

- [TeX sources](https://github.com/tonymorris/parametricity/) for the
  above talk.

- [Making ad-hoc polymorphism less ad-hoc](http://swizec.com/blog/week-20-making-ad-hoc-polymorphism-less-ad-hoc/swizec/6564).

- [Theorems for Free!](http://ttic.uchicago.edu/~dreyer/course/papers/wadler.pdf).

## Initial and Final, DSLs, Finally Tagless

- [Final Encodings, Part 1: A Quick Demonstration](http://creativelad.wordpress.com/2013/11/28/final-encodings-part-1-a-quick-demonstration/).

- [Transforming Polymorphic Values](http://martijn.van.steenbergen.nl/journal/2009/10/18/transforming-polymorphic-values/).

- [GADTs in Haskell 98](http://martijn.van.steenbergen.nl/journal/2009/11/12/gadts-in-haskell-98/).

- [Typed Tagless-Final Linear Lambda Calculus](https://www.fpcomplete.com/user/mutjida/typed-tagless-final-linear-lambda-calculus).

- [Typed tagless-final interpretations: Lecture notes](http://okmij.org/ftp/tagless-final/course/course.html).

- [Typed Tagless Final Interpreters](http://okmij.org/ftp/tagless-final/course/lecture.pdf).

- [The dog that didn't bark](http://existentialtype.wordpress.com/2011/03/21/the-dog-that-didnt-bark/) less specifically relevant but interesting.

## Comonads

- [Comonads in Haskell](https://speakerdeck.com/dmoverton/comonads-in-haskell).

- [SO question: Can a Monad be a Comonad](http://stackoverflow.com/questions/16551734/can-a-monad-be-a-comonad).

## Yoneda / CoYoneda

- [SO question: Step-by-step explanation of coyoneda](http://stackoverflow.com/questions/24000465/step-by-step-deep-explain-the-power-of-coyoneda-preferably-in-scala-throu).

- Free monads for Less, a sequence of three articles by Edward Kmett
  * [Part 1: Codensity](http://comonad.com/reader/2011/free-monads-for-less/).
  * [Part 2: Yoneda](http://comonad.com/reader/2011/free-monads-for-less-2/).
  * [Part 3: Yielding IO](http://comonad.com/reader/2011/free-monads-for-less-3/).

## Propositions vs. Judgments (computation)

- [StackExchange question: What is the difference between propositions and judgements](http://cstheory.stackexchange.com/questions/9826/what-is-the-difference-between-propositions-and-judgments).

- [Lecture notes from a short, three lecture course](http://www.ae-info.org/attach/User/Martin-L%C3%B6f_Per/OtherInformation/article.pdf)

# Dependent typing

- [Grokking sum types, value constructors, and type constructors](http://bitemyapp.com/posts/2014-04-05-grokking-sums-and-constructors.html) squint hard.

- [Lightweight Dependent-type Programming](http://okmij.org/ftp/Computation/lightweight-dependent-typing.html).

- [Idris programming language](http://www.idris-lang.org/).

# Statically linking binaries

- [Static linking](https://wiki.haskell.org/Web/Literature/Static_linking)

- [Static linking with GHC on Arch Linux](http://www.edofic.com/posts/2014-05-03-ghc-arch-static.html)

- [Statically linking Linux binaries for ARM & MIPS](http://stackoverflow.com/questions/14270177/ghc-statically-linking-linux-binaries-for-arm-mips-processors)

- [Statically link GMP using GHC and LLVM](http://stackoverflow.com/questions/10539857/statically-link-gmp-to-an-haskell-application-using-ghc-llvm)

# Extended Reading list

> Some are already included here

- [Essential Haskell Reading List](http://www.stephendiehl.com/posts/essential_haskell.html)

## Dialogues

> Hosted in this repository [here](dialogues.md).

These are actually pretty important and helpful. Look here for deep dives on a
variety of topics.

