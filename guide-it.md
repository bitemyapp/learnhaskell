# La Guida
Questa è la strada che raccomando per imparare Haskell.

## Per chi non parla italiano

- [In English](README.md)

- [Auf Deutsch](guide-de.md)

- [En Español](guide-es.md)

- [En Français](guide-fr.md)

- [Na Hrvatskom](guide-hr.md)

- [Bahasa Indonesia](guide-id.md)

- [日本語](guide-ja.md)

- [한국어](guide-ko.md)

- [Em Português](guide-pt.md)

- [În Română](guide-ro.md)

- [По-русски](guide-ru.md)

- [Srpski](guide-sr.md)

- [Sa Tagalog](guide-tl.md)

- [Türkçe](guide-tr.md)

- [Українською](guide-ua.md)

- [简体中文](guide-zh_CN.md)

- [繁體中文](guide-zh_tw.md)

- [Magyarul](guide-hu.md)


#### Un consiglio: *non preoccupatevi se non capite qualcosa alla prima lettura*. Andate avanti.

## Comunità
Il nostro canale IRC è `#haskell-beginners` su Freenode.

Un client web per IRC è disponibile [qui](http://webchat.freenode.net/).

La [mailing list](https://wiki.haskell.org/Mailing_lists) di Haskell.

### Linee guida per la comunità

[Leggete il post di Chris Done sull'insegnamento](http://chrisdone.com/posts/teaching).
Siate gentili e cortesi. Comportamenti crudeli o meschini spaventano gli altri e fanno passare la voglia di partecipare.

Crtitiche facili, in cui non mettete impegno, beneficiano soltanto voi e non la persona che le riceve.

Non descrivete niente con parole come "facile" o "banale". Chi legge si sentirà stupido perché le cose che definite come triviali possono aver richiesto molto impegno. Spesso chi impara lentamente impara più profondamente, è una cosa che dovremmo perseguire!

Non fate finta di essere sorpresi quando qualcuno vi dice che non sa qualcosa. Lo farete sentire soltanto stupido e non avrete ottenuto niente a parte sentirvi più furbi.

Non dite beh-in realtà. Come quando qualcuno dice che qualcosa è quasi, ma non completamente corretta, e voi cominciate a dire, "beh, in realtà…" e poi fate una piccola correzione. È molto irritante, specialmente quando la correzione non è pertinente alla conversazione che state avendo. Questo non significa che l'Hacker School non si preoccupi della verità o che non ci interessi essere precisi. Ma questi modi di fare sono quasi sempre più una questione di pavoneggiamento che altro.

Non dite agli altri cosa devono fare. Se qualcuno sta completando un esercizio non dovreste interromperlo continuamente con consigli. Lasciate che trovi la sua strada a meno che non lo chieda esplicitamente. Evitare interruzioni è [uno degli obiettivi fondamentali di  #haskell-beginners](http://chrisdone.com/posts/teaching).

Non lasciate spazio a sottili "ismi". Razzismo, sessismo, omofobia, transfobia, e altri tipi di pregiudizi non saranno tollerati.

---

Linee guida tratte dal [manuale della Hacker School ](https://www.hackerschool.com/manual). Grazie per averle rese pubbliche.

# Cosa sono Haskell, GHC e Cabal?

Haskell è un linguaggio di programmazione, e come potete leggere nei report, la versione più recente è stata rilasciata nel 2010. Il report è disponibile online:
[report](http://www.haskell.org/onlinereport/haskell2010/).

## GHC

[GHC](http://www.haskell.org/ghc/) è il modo più classico per lavorare in Haskell. Include un compilatore, un REPL (interprete), un gestore automatico di pacchetti e librerie, ed altro.

## Cabal

[Cabal](https://www.haskell.org/cabal/download.html) è software per gestire i progetti haskell e risolvere le dipendenze. È lo strumento che vi permetterà di installare i pacchetti, tipicamente ciascuno nel proprio sandbox.

Cabal è equivalente a Bundler di Ruby, pip di Python, NPM di Node, Maven, etc. GHC
gestisce i pacchetti indipendentemente, Cabal sceglie quale versione installare.

# Il set-up dei tool

## Ubuntu

[Questo PPA](http://launchpad.net/~hvr/+archive/ghc) è ottimo ed è quello che uso su tutte le mie macchine linux, sia per i build automatici che per lo sviluppo. 

Istruzioni specifiche:

```bash
$ sudo apt-get update
$ sudo apt-get install python-software-properties # v12.04 and below
$ sudo apt-get install software-properties-common # v12.10 and above
$ sudo add-apt-repository -y ppa:hvr/ghc
$ sudo apt-get update
$ sudo apt-get install cabal-install-1.20 ghc-7.8.3 happy-1.19.4 alex-3.1.3
```

Aggiungete poi la seguente linea al vostro `$PATH` (bash\_profile, zshrc, bashrc, etc):

```
~/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.3/bin:/opt/happy/1.19.4/bin:/opt/alex/3.1.3/bin
```

*Opzionale:* Potete anche aggiungere `.cabal-sandbox/bin` al vostro path. Il codice che state sviluppando attivamente sarà così disponibile dalla linea di comando. Questo funziona solo quando la directory in cui siete è un sandbox di cabal.

## Debian

### Usando Ubuntu PPA

Se non state usando Debian stable, le stesse istruzioni che abbiamo indicato per Ubuntu fuzionano, ma dovrete eseguire un comando in più. Immediatamente dopo che il comando
`sudo add-apt-repository -y ppa:hvr/ghc` 

lanciate:

```bash
$ sudo sed -i s/jessie/trusty/g /etc/apt/sources.list.d/hvr-ghc-jessie.list
```

Per altre versioni di Debian dovete solo rimpiazzare tutte le occorrenze di `jessie` con il nome della versione che state utilizzando nel comando di cui sopra.

Se per qualche ragione il file `/etc/apt/sources.list.d/hvr-ghc-jessie.list` non dovesse esistere, allora `/etc/apt/sources.list` dovrebbe contenere una linea come questa:

    deb http://ppa.launchpad.net/hvr/ghc/ubuntu jessie main

Rimpiazzate quindi in quella linea `jessie` con `trusty`.

### Compilazione manuale

Potete seguire
[questa](http://www.davesquared.net/2014/05/platformless-haskell.html) guida scritta per Mac OS X:

Note:

- Quando configurate ghc settate il prefisso appropriato
- Invece di prendere il binario di `cabal-install`, scaricate il codice sorgente e lanciate lo script
  `bootstrap.sh`.

## Fedora 21

Per installare Haskell 7.8.4 dal repository non ufficiale (Fedora 22+ lo includerà ufficialmente):

```bash
$ sudo yum-config-manager --add-repo \
> https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/repo/fedora-21/petersen-ghc-7.8.4-fedora-21.repo 
$ sudo yum install ghc cabal-install
```

Come affermato in
[petersen/ghc-7.8.4 copr page](https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/)
questo ghc non può essere installato insieme con il ghc di Fedora/EPEL.

## Arch Linux

Per installare Haskell dal repository ufficiale su Arch Linux, lanciate

```bash
$ sudo pacman -S cabal-install ghc happy alex haskell-haddock-library
```

## Gentoo

Su Gentoo, potete installare i singoli componenti della Haskell Platform
attraverso Portage. Se usate `ACCEPT_KEYWORDS=arch` (invece che
`ACCEPT_KEYWORDS=~arch`), Portage installerà versioni più vecchie di Haskell. Tenendone di conto, se usate `ACCEPT_KEYWORDS=arch`, aggiungete le seguenti linee a `/etc/portage/package.accept_keywords`.

    dev-haskell/cabal-install ~arch
    dev-lang/ghc ~arch

Una volta fatto quello, lanciate:

```bash
$ emerge -jav dev-lang/ghc dev-haskell/cabal-install
```

Gentoo include una versione "stabile" (leggi: vecchia) di `cabal-install` nell'albero di Portage, quindi vorrete usare `cabal-install` per installare la versione più recente. I backslash sono intenzionali.

```bash
$ \cabal update                # I backslash
$ \cabal install cabal-install # sono intentionali
```

Adesso avete installato cabal a livello globale con portage, e localmente nella vostra home directory con `cabal-install`. Il prossimo passo è assicurarsi che quando lanciate `cabal` in un terminale, la vostra shell lanci la versione più recente che è nella vostra home directory. Aggiugete le linee seguenti nel file di configurazione della vostra shell:

```bash
PATH=$PATH:$HOME/.cabal/bin
alias cabal="$HOME/.cabal/bin/cabal"
```

Se non sapete quale shell avete, è molto probabile che la vostra shell sia Bash. Se usate Bash, il file che dovete editare è `~/.bashrc`. se usate Z-shell, il file è `~/.zshrc`. Potete lanciare il seguete comando per sapere qual'è la vostra shell.

```bash
echo $SHELL | xargs basename
```

Io uso zsh, quindi il comando restituisce `zsh` quando lo lancio.

Una volta fatto tutto questo, dovrete installare i tool addizionali `alex` e `happy`.

```bash
$ cabal install alex happy
```

Congratulazioni! Adesso avete una installazione di Haskell funzionante!

## Mac OS X

### 10.9

Installate [GHC per Mac OS X](http://ghcformacosx.github.io/), che include GHC e Cabal. La guida vi darà istruzioni su come installare GHC e Cabal nel vostro path una volta che avete copiato la .app da qualche parte sul disco fisso.

### 10.6-10.8

Eseguite l'installazione dei binari come scritto qui sotto usando [questo tarball](https://www.haskell.org/platform/download/2014.2.0.0/ghc-7.8.3-x86_64-apple-darwin-r3.tar.bz2).

## Windows

- L' [installer minimo per windows di GHC](http://neilmitchell.blogspot.com/2014/12/beta-testing-windows-minimal-ghc.html) 
è in grado di compilare `network` e altro. È tecnicamente in beta ma dovrebbe funzionare per gli scopi di chiunque legga questa guida.

Non dimenticatevi di lanciare l'installer come amministratore, dato che è richiesto l'accesso alla directory di sistema 'Programmi'.

## Altri utenti Linux

Scaricate l'ultima distribuzione binaria di cabal e ghc:

- [GHC](http://www.haskell.org/ghc/).

- [Cabal](https://www.haskell.org/cabal/download.html).

# Corsi primari

## Il corso cis1940 di Yorgey

> *Seguite questo per primo*, è la strada che raccomando per il primo approccio ad
> Haskell.

Disponibile [online](https://www.seas.upenn.edu/~cis1940/spring13/lectures.html).

Il corso di [Brent Yorgey](https://byorgey.wordpress.com) è il migliore che ho trovato finora.  Questo corso ha valore non solo perché vi rende in grado di scrivere codice Haskell basilare ma anche perché vi aiuterà a comprendere i parser combinators.

L'unica ragione per cui non dovreste cominciare con cis1940 è se non siete programmatori o se non avete molta esperienza. In questo caso, suggerisco di iniziare con il 
[libro di Thompson](https://www.haskellcraft.com/craft3e/Home.html) e poi passate a cis1940.

---

## Il corso FP

> Questo è il corso che raccomando dopo cis1940 di Yorgey

Disponibile su github [qui](https://github.com/bitemyapp/fp-course).

Questo vi darà esperienza nell'implementare direttamente le astrazioni introdotte in cis1940. Questi esercizi sono *fondamentali* per sviluppare confidenza con gli usi comuni di Functor/Applicative/Monad/etc. in Haskell. La raccomandazione principale di questa guida è seguire cis1940 e poi FP: questo è il percorso che seguo per insegnare Haskell a tutti.

---

## Corso Supplementare cs240h

> Fornisce più materiale sugli argomenti intermedi

Disponibile [online](http://www.scs.stanford.edu/14sp-cs240h/).

Questo è il corso online di [Bryan O'Sullivan](https://github.com/bos) tratto dal corso che insegna a Stanford. Se non sapete chi è, date un'occhiata alla metà delle librerie che qualsiasi progetto Haskell richiede e ci troverete il suo nome. Sa avete già seguito il corso di Yorgey sono particolarmente rilevanti i moduli sui phantom types, il flusso di controllo delle informazioni, le estensioni del linguaggio, le concorrenza, le librerie pipes e lenses.

---

## Materiale di riferimento per i tre corsi

[Learn You a Haskell for Great Good (LYAH)](http://learnyouahaskell.com) e
[Real World Haskell](http://book.realworldhaskell.org) (Grazie bos!) sono disponibili online.

Raccomando RWH come referenza (è un libro spesso). I capitoli sul parsing e sulle monadi
sono ottimi per arrivare a capire l'utilità delle monadi stesse. Alcuni hanno detto che è piaciuto molto. Probabilmente è un buon follow-up per imparare gli idiomi in modo pratico, una volta che avete imparato le cose essenziali di Haskell? 

### Cosa fa quel syntactic sugar `<-` / `do` / sulle list comprehension?

Eccellente [articolo](http://www.haskellforall.com/2014/10/how-to-desugar-haskell-code.html).

### Per capire list e fold

- [Explain List Folds to Yourself](http://vimeo.com/64673035)

### Per imparare alcune Typeclass di uso comune

Utile per capire `Functor`, `Applicative`, `Monad`, `Monoid` e altre Typeclass di uso comune, ma anche informazioni specifiche di Hask e di Teoria delle Categorie:

- La [Typeclassopedia](http://www.haskell.org/haskellwiki/Typeclassopedia)

### Capire i messaggi di errore più comuni di Haskell

- [Capire i messaggi di errore più comuni](http://ics.p.lodz.pl/~stolarek/_media/pl:research:stolarek_understanding_basic_haskell_error_messages.pdf)

---

# Laziness, strictness, guarded recursion

- Il [libro](http://chimera.labs.oreilly.com/books/1230000000929/ch02.html) di Marlow 
  sul parallelismo e la concorrenza ha una delle migliori introduzioni alla laziness e alla normal form che abbia trovato. Avrete bisogno di materiale in più se non acquisite i concetti subito.

- [More points for lazy evaluation](http://augustss.blogspot.hu/2011/05/more-points-for-lazy-evaluation-in.html)

- [Oh my laziness!](http://alpmestan.com/posts/2013-10-02-oh-my-laziness.html)

- Domanda su Stack Overflow '[Does haskell have laziness?](https://stackoverflow.com/questions/13042353/does-haskell-have-tail-recursive-optimization)'

- La presentazione di [Johan Tibell](https://github.com/tibbe) su
  [reasoning about laziness](http://www.slideshare.net/tibbe/reasoning-about-laziness).

## Breve dimostrazione

```haskell
let a = 1 : a -- guarded recursion, (:) è lazy su di esso si può usare pattern matching.
let (v : _) = a
> v
1
> head a -- head a == v
1

let a = 1 * a -- non guarded, (*) è strict
> a
*** Exception: <<loop>>
```

# IO

- [Evaluation order and State tokens](https://www.fpcomplete.com/user/snoyberg/general-haskell/advanced/evaluation-order-and-state-tokens)

- [Unraveling the mystery of the IO monad](http://blog.ezyang.com/2011/05/unraveling-the-mystery-of-the-io-monad/).

- [First class "statements"](http://blog.jle.im/entry/first-class-statements).

- [Haddocks for System.IO.Unsafe.unsafePerformIO](http://hackage.haskell.org/package/base-4.7.0.1/docs/System-IO-Unsafe.html#v:unsafePerformIO)
  Leggete la documentazione e le note sulla implementazione di unsafeDupablePerformIO

Commento da un thread di Reddit, di `glaebhoerl`

> Nota interessante: GHC deve nascondere la rappresentazione dello state token 
> dietro un tipo IO astratto perché lo state token deve sempre essere usato linearmente (non
> duplicato o droppato), ma il type system non può garantire che questo accada. Clean, un altro
> linguaggio lazy come Haskell, ha 'uniqueness types' (sono come i linear types
> e possibilmente diversi per aspetti  di cui non sono a conoscenza), e espongono 
> World-passing direttamente e forniscono una monade IO (non astratta) solo per
> convenienza.

# Monadi and monad transformers

> Non cominciate a imparali finché non capite typeclass, Monoid, Functor e
> Applicative!

Implementate per conto vostro le monadi della libreria standard (List, Maybe, Cont, Error, Reader,
Writer, State) per capirle meglio. Poi potreste provare a scrivere un interprete monadico per piccole espressioni facendo riferimento all'articolo
[Monad Transformers Step by Step](http://www.cs.virginia.edu/~wh5a/personal/Transformers.pdf) (menzionata in 'monad transformers' qui sotto).

Scrivere diversi interpreti cambiando solo la monade per cambiare la semantica può aiutarvi a capire in che cosa consiste.

Poi reimplementate `Control.Monad`. Funzioni come `mapM` o `sequence` sono buone opportunità per fare esercizio e scrivere codice monadico generico.

Il corso FP può essere usato come guida a questo scopo, che include anche lo scrivere la vostra typeclass Applicative.

Referenza:

- Commenti su Reddit di htmltyp and Crandom [qui](https://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5aj6).

- Commenti su Reddit di jozefg [qui](https://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5trg).

## Monad transformers

- [A gentle introduction to Monad Transformers](https://github.com/kqr/gists/blob/master/articles/gentle-introduction-monad-transformers.md).

- [Monad transformers step-by-step](http://www.cs.virginia.edu/~wh5a/personal/Transformers.pdf) (attenzione il codice riportato è datato).

# Testare, test, specifiche, testing generativo e di proprietà

- Questo [tutorial](https://github.com/kazu-yamamoto/unit-test-example/blob/master/markdown/en/tutorial.md) di Kazu Yamamoto è fantastico.

- [Simple-Conduit](https://github.com/jwiegley/simple-conduit): Un'ottima libreria per imparare in modo semplice come funziona lo streaming IO in generale; la conoscenza è trasferibile a librerie più complesse come Pipes e Conduit

# Parsing in Haskell

- [Tutorial](https://github.com/JakeWheat/intro_to_parsing) sui Parser combinator
  per Haskell, usando Parsec

- [Writing your own micro-Parsec](http://olenhad.me/articles/monadic-parsers/)

## Parsare e generare JSON

Aeson è la soluzione di parsing [JSON](https://json.org) standard in
haskell. Disponibile su [hackage](https://hackage.haskell.org/package/aeson) e
[github](https://github.com/bos/aeson).

- [Parsing JSON using Aeson](http://blog.raynes.me/blog/2012/11/27/easy-json-parsing-in-haskell-with-aeson/)

- [Aeson and user created types](http://bitemyapp.com/posts/2014-04-11-aeson-and-user-created-types.html)

- [Parsing non-deterministic data with aeson and sum types](http://bitemyapp.com/posts/2014-04-17-parsing-nondeterministic-data-with-aeson-and-sum-types.html)

- [Tutorial di Aeson](https://www.fpcomplete.com/school/starting-with-haskell/libraries-and-frameworks/text-manipulation/json)

# Algoritmi per grafi e strutture dati

- Il [pacchetto fgl](https://hackage.haskell.org/package/fgl) gli [algoritmi](http://hackage.haskell.org/package/fgl-5.4.2.2/docs/Data-Graph-Inductive-Query-SP.html) puramente funzionali per trovare la strada più breve.

- [Inductive graphs and Functional Graph Algorithms](http://web.engr.oregonstate.edu/~erwig/papers/abstracts.html#JFP01).

- [FGL/Haskell - A Functional Graph Library](http://web.engr.oregonstate.edu/~erwig/fgl/haskell/old/fgl0103.pdf).

- [Data.Graph source from Containers package](http://hackage.haskell.org/package/containers-0.5.5.1/docs/Data-Graph.html).

- Il [pacchetto graphs](https://hackage.haskell.org/package/graphs).

- [Domande su SO riguardo a PHOAS](https://stackoverflow.com/questions/24369954/separate-positive-and-negative-occurrences-of-phoas-variables-in-presence-of-rec)

- [PHOAS for free](https://www.fpcomplete.com/user/edwardk/phoas).

- [Tying the Knot](http://www.haskell.org/haskellwiki/Tying_the_Knot).

- [Hackage: dag](https://hackage.haskell.org/package/dag).

# Ambienti di sviluppo

## Emacs

- [Il tutorial di Alejandro Serras](https://github.com/serras/emacs-haskell-tutorial/blob/master/tutorial.md)

- [I miei dotfiles](https://github.com/bitemyapp/dotfiles/)

- [Il config emacs di Chris Done](https://github.com/chrisdone/chrisdone-emacs)

## Vim

- [Pagina di Vim su haskellwiki](http://www.haskell.org/haskellwiki/Vim)

- [Haskell-vim-now](https://github.com/begriffs/haskell-vim-now)

- [GHC-Mod](https://github.com/kazu-yamamoto/ghc-mod)

- [GHC-Mod vim plugin](https://github.com/eagletmt/ghcmod-vim)

- [Hindent](https://github.com/chrisdone/hindent)

## Sublime Text

- [SublimeHaskell](https://github.com/SublimeHaskell/SublimeHaskell)

# Lavorare con Cabal

## Linee guida di Cabal

Prima dell'introduzione dei sandbox, gli utenti Haskell incappavano nel problema definito Cabal Hell (Inferno di Cabal). Se non utilizzate una sandbox, cabal installerà il pacchetto nel vostro user package-db. Questa *non* è in genere una buona idea, fatta l'eccezione per alcuni pacchetti di base come
Cabal, alex e happy. Nient'altro dovrebbe essere installato nel package-db dell'utente né tanto meno a livello globale, a meno che non sappiate cosa state facendo.

Alcune raccomandazioni per non cadere nel Cabal Hell sono disponibili
[qui](http://softwaresimply.blogspot.com/2014/07/haskell-best-practices-for-avoiding.html).

Per provare un pacchetto o cominciare un progetto, iniziate lanciando
`cabal sandbox init` in una nuova directory.

In poche parole:

- Quando installate nuovi pacchetti, create nuovi progetti o pre-esistenti, o cominciate esperimenti usate sempre i sandbox. 

- Usate `cabal repl` invece per iniziare una istanza di ghci come project-scoped

Questo approccio basato sui sandbox dovrebbe scamparvi dai problemi relativi alle dipendenze dei paccheti, ma è incompatibile con il modo in cui la Haskell Platform fornisce i pacchetti binari. Se state imparando Haskell e non capite come funzionano ghc-pkg e Cabal, *evitate la haskell platform*, ed usate invece le istruzioni all'inizio della guida.

## Stackage

Tutti gli utenti (di solito utenti di Yesod) che hanno problemi di build potrebbero provare ad utilizzare Stackage.

- Un buon riassunto di Stackage è
  [qui](https://www.fpcomplete.com/blog/2014/05/stackage-server).

Secondo l'opinione dell'autore, Stackage è in genere più utile di `cabal freeze`.

# Hoogle e Haddock

## Ricerca di codice mediante type signature

Il [motore di ricerca Hoogle](http://www.haskell.org/hoogle/) può cercare per tipo.

Per esempio, guardate i risultati della ricerca per `(a -> b) -> [a] -> [b]`
[qui](http://www.haskell.org/hoogle/?hoogle=%28a+-%3E+b%29+-%3E+%5ba%5d+-%3E+%5bb%5d).

Lo trovate anche su fpcomplete [qui](https://www.fpcomplete.com/hoogle).

Anche [Hayoo](http://holumbus.fh-wedel.de/hayoo/hayoo.html) (che cerca su tutto Hackage per default).

## Setup della tua istanza locale di Hoogle

Guardate [qui](https://gist.github.com/bitemyapp/3e6a015760775e0679bf).

## Haddock

1. [Aggiusta la tua documentazione hackage](http://fuuzetsu.co.uk/blog/posts/2014-01-06-Fix-your-Hackage-documentation.html)

2. [Documentazione Hackage v2](http://fuuzetsu.co.uk/blog/posts/2014-01-06-Hackage-documentation-v2.html)

Fate attenzione, questi post sono *lievemente obsoleti*: per esempio, adesso Hackage vanta nuovi modi di mostrare informazioni, documentazione e stato del build.

## Quello che davvero avete bisogno di sapere

Per far includere ad haddocks la documentazione per i pacchetti correlati, dovete settare `documentation: True` nel vostro `~/.cabal/config`. Se lasciato sul valore di default (`False`) o settato a `False`, prima di rigenerare la documentazione dovrete rimuovere tutti i vostri pacchetti e reinstallarli.

L'altra cosa da tenere a mente è che a causa del modo in cui il parametro `$pkg` viene interpretato *da* cabal, non da voi, i parametri `html-location` e `content-location` *devono essere fra apici* e inseriti in una shell o in uno shell script. Non funzioneranno in un Makefile, perché crederanno di essere variabili di Make!

```bash
#! /usr/bin/env sh

# potete scrivero su una linea sola non mettendo backslash
cabal haddock --hoogle --hyperlink-source                       \
 --html-location='http://hackage.haskell.org/package/$pkg/docs' \
 --contents-location='http://hackage.haskell.org/package/$pkg'
```

# TravisCI

Se siete fan di [TravisCI](https://travis-ci.org) come lo sono io, allora vi consiglio
*caldamente* di dare un'occhiata a
[multi-ghc-travis](https://github.com/hvr/multi-ghc-travis) come base per il `travis.yml` dei vostri progetti Haskell.

# Frontend/JavaScript

Abbiamo l'imbarazzo della scelta! Ci sono tre scelte principali che raccomanderei:

* [Haste](http://haste-lang.org/) un compilatore da Haskell a JavaScript
  - Il [compilatore](https://github.com/valderman/haste-compiler) su github.
  - Una [demo](http://www.airpair.com/haskell/posts/haskell-tutorial-introduction-to-web-apps)
    eccellente di Haste con un progetto di esempio.

* [GHCJS](https://github.com/ghcjs/ghcjs)
  - [Introduzione a GHCJS](http://weblog.luite.com/wordpress/?p=14)
  - [Functional Reactive Web Interfaces with GHCJS and Sodium](http://weblog.luite.com/wordpress/?p=127)
  - [Writing Atom plugins in Haskell using ghcjs ](http://edsko.net/2015/02/14/atom-haskell/)

* [PureScript](http://www.purescript.org/)
  - Non è strettamente Haskell come Haste e GHCJS, ma è una scelta popolare fra i programmatori Haskell
  - Scritto in ed ispirato ad Haskell
  - Provate purescript nel vostro browser [here](http://try.purescript.org/)
  - Ottima guida per [cominciare a usarlo](http://www.christopherbiscardi.com/2014/06/22/getting-started-with-purescript/)

## Quale linguaggio scegliere per il frontend?

GHCJS e Haste sono entrambi interamente compatibili con Haskell. GHCJS è compatibile con un numero maggiore di pacchetti Haskell rispetto a Haste, ma questo non è rilevante per molti progetti frontend. Al contrario, PureScript non è Haskell, per tanto non potrete condividere il codice fra frontend e backend.

GHCJS ha un runtime più grande, a 100kb (luite ci sta lavorando). Haste e PureScript sono competitivi.

PureScript ha la migliore integrazione con i tool di JS (usa gulp/grunt/bower), mentre GHCJS
e Haste si integrano meglio con i tool di Haskell (Cabal).

Tutti e tre sono un'ottima scelta e possono funzionare per la maggioranza dei progetti frontend.

# Per una comprensione più profonda della laziness, NF, WHNF

- [Notes on lambda calculus](https://vec.io/posts/notes-on-lambda-calculus).

## Articoli di ricerca sul lazy lambda calculi

- [A call by need lambda calculus](http://homepages.inf.ed.ac.uk/wadler/topics/call-by-need.html#need-journal).

- [Demonstrating Lambda Calculus Reduction](http://www.itu.dk/~sestoft/papers/sestoft-lamreduce.pdf)

- [The lazy lambda calculus](http://www.cs.ox.ac.uk/files/293/lazy.pdf).

- [Lazy evaluation of Haskell](http://www.vex.net/~trebla/haskell/lazy.xhtlm)

# Parallelismo/Concorrenza

- Il libro [Parallel and Concurrent Programming in Haskell](http://chimera.labs.oreilly.com/books/1230000000929) di Simon Marlow è probabilmente il migliore che abbia mai letto sull'argomento.

- Un [walk-through](http://kukuruku.co/hub/haskell/haskell-testing-a-multithread-application) completo su testing e incremental development di un applicazione multi-threaded in Haskell.

- [Functional Reactive Programming](http://www.haskell.org/haskellwiki/Functional_Reactive_Programming)

# Lenses e Prisms

Una volta che vi trovate a vostro agio con Haskell, è molto utile imparare Lens e
Prism, anche se solo come "utente". Non avete bisogno di capire le categorie sottostanti
perchè vi siano utili.

La difficoltà di usare la libreria Lens è generalmente sovrastimata. Chiunque sia a suo agio con Functor/Foldable/Traversable (o anche solo il primo) può usare lens e prism per rendersi la vita più facile.

Se vi è capitato di fare qualcosa come: `(fmap . fmap)` stavate usando mentalmente le 'lenti'.

Raccomando questi due tutorial/introduzioni:

- [A little lens starter tutorial](https://www.fpcomplete.com/school/to-infinity-and-beyond/pick-of-the-week/a-little-lens-starter-tutorial)

- [Lens: Lenses, Folds and Traversals](https://github.com/ekmett/lens#lens-lenses-folds-and-traversals)

Leggete questo per maggiori informazioni: [pacchetto Lens su hackage](http://hackage.haskell.org/package/lens).

# Schemi di ricorsione

Alcune delle pazze parole di cui avete sentito parlare che finiscono con \*-morfismo riguardano la ricorsione. NB - prima di iniziare a studiare il materiale che segue dovreste sapere come implementare foldr per le liste e almeno un'altra struttura di dati, tipo un albero. (i fold sono catamorfismi) Sapere come implementare un unfold (anamorfismo) per le stesse strutture dati è complementare.

Questo materiale si compenetra con traversable e foldable.

- [An introduction to recursion schemes](http://patrickthomson.ghost.io/an-introduction-to-recursion-schemes/)

- [Don't fear the cat](http://fho.f12n.de/posts/2014-05-07-dont-fear-the-cat.html) -
  Buona dimostrazione su come l'ilomorfismo sia la composizione di cata e ana.

- [Recursion Schemes](http://comonad.com/reader/2009/recursion-schemes/) - Questa guida è ottima.

- [Functional Programming with Bananas, Lenses, Envelopes and Barbed Wire](http://eprints.eemcs.utwente.nl/7281/01/db-utwente-40501F46.pdf)

- [Catamorphisms](https://www.fpcomplete.com/user/edwardk/recursion-schemes/catamorphisms)

# GHC Core e ottimizzazione della performance

- [Write Haskell as Fast as C](write_haskell_as_fast_as_c.md)

- [GHC Wiki: CoreSyn Type](https://ghc.haskell.org/trac/ghc/wiki/Commentary/Compiler/CoreSynType).

- [Hackage: GHC Core](https://hackage.haskell.org/package/ghc-core).

- [SO Question: Reading GHC Core](https://stackoverflow.com/questions/6121146/reading-ghc-core).

- [Haskell as fast as C](http://donsbot.wordpress.com/2008/06/04/haskell-as-fast-as-c-working-at-a-high-altitude-for-low-level-performance/).

- [Real World Haskell, Chapter 25: Profiling and Optimizations](http://book.realworldhaskell.org/read/profiling-and-optimization.html).

# Tipi e Teoria delle Categorie

> *Non* è necessaria per scrivere Haskell, solo per quelli interessati!

Se volete imparare di più su tipi e teoria delle categorie:

- [La guida di Catster](http://byorgey.wordpress.com/2014/01/14/catsters-guide/) e [La seconda guida Catster](http://byorgey.wordpress.com/catsters-guide-2/)

- Il [wikibook haskell](http://en.wikibooks.org/wiki/Haskell/Category_theory) ha dei bei diagrammi

- [Teoria delle categorie](http://www.haskell.org/haskellwiki/Category_theory) su haskellwiki, ha anche buoni link ad altre risorse

- [Categories from scratch](http://science.raphael.poss.name/categories-from-scratch.html), include alcuni esempi pratici.

- La lista [Great Works in PL](http://www.cis.upenn.edu/~bcpierce/courses/670Fall04/GreatWorksInPL.shtml) di Pierce.

## Libri

- [Quora Question: What is the best textbook for category theory?](http://www.quora.com/Category-Theory/What-is-the-best-textbook-for-Category-theory?share=1) le raccomandazioni di Kmett

- [Awodey](http://ukcatalogue.oup.com/product/9780199237180.do) e
  [MacLane](http://www.amazon.com/Categories-Working-Mathematician-Graduate-Mathematics/dp/0387984038). I libri di testo standard sulla teoria delle categorie

- [Harper's Practical Foundations for Programming Languages](http://www.cs.cmu.edu/~rwh/plbook/book.pdf) è la miglior introduzione alla teoria delle categorie focalizzata sui linguaggi di programmazione.

- [Type theory and Functional Programming](http://www.cs.kent.ac.uk/people/staff/sjt/TTFP/).

# Altri argomenti divertenti

## Parametricità, ad-hoc vs. polimorfismo parametrico e teoremi liberi

- [Parametricity](tony_parametricity.pdf).

- [Sorgenti TeX](https://github.com/tonymorris/parametricity/) per la presentazione di cui sopra.

- [Making ad-hoc polymorphism less ad-hoc](http://swizec.com/blog/week-20-making-ad-hoc-polymorphism-less-ad-hoc/swizec/6564).

- [Theorems for Free!](http://ttic.uchicago.edu/~dreyer/course/papers/wadler.pdf).

## Inizial e Final, DSL, Finally Tagless

- [Final Encodings, Part 1: A Quick Demonstration](http://creativelad.wordpress.com/2013/11/28/final-encodings-part-1-a-quick-demonstration/).

- [Transforming Polymorphic Values](http://martijn.van.steenbergen.nl/journal/2009/10/18/transforming-polymorphic-values/).

- [GADTs in Haskell 98](http://martijn.van.steenbergen.nl/journal/2009/11/12/gadts-in-haskell-98/).

- [Typed Tagless-Final Linear Lambda Calculus](https://www.fpcomplete.com/user/mutjida/typed-tagless-final-linear-lambda-calculus).

- [Typed tagless-final interpretations: Lecture notes](http://okmij.org/ftp/tagless-final/course/course.html).

- [Typed Tagless Final Interpreters](http://okmij.org/ftp/tagless-final/course/lecture.pdf).

- [The dog that didn't bark](http://existentialtype.wordpress.com/2011/03/21/the-dog-that-didnt-bark/) meno rilevante nello specifico ma comunque interessante.

## Comonadi

- [Comonads in Haskell](https://speakerdeck.com/dmoverton/comonads-in-haskell).

- [SO question: Can a Monad be a Comonad](https://stackoverflow.com/questions/16551734/can-a-monad-be-a-comonad).

## Yoneda / CoYoneda

- [SO question: Step-by-step explanation of coyoneda](https://stackoverflow.com/questions/24000465/step-by-step-deep-explain-the-power-of-coyoneda-preferably-in-scala-throu).

- Free monads for Less, una sequenza di tre articoli di Edward Kmett
  * [Part 1: Codensity](http://comonad.com/reader/2011/free-monads-for-less/).
  * [Part 2: Yoneda](http://comonad.com/reader/2011/free-monads-for-less-2/).
  * [Part 3: Yielding IO](http://comonad.com/reader/2011/free-monads-for-less-3/).

## Propositions vs. Judgments (computazione)

- [StackExchange question: What is the difference between propositions and judgements](http://cstheory.stackexchange.com/questions/9826/what-is-the-difference-between-propositions-and-judgments).

- [Lecture notes from a short, three lecture course](http://www.ae-info.org/attach/User/Martin-L%C3%B6f_Per/OtherInformation/article.pdf)

# Tipi dipendenti

- [Grokking sum types, value constructors, and type constructors](http://bitemyapp.com/posts/2014-04-05-grokking-sums-and-constructors.html) strizzate gli occhi.

- [Lightweight Dependent-type Programming](http://okmij.org/ftp/Computation/lightweight-dependent-typing.html).

- [Idris programming language](http://www.idris-lang.org/).

# Linkare binari staticamente

- [Static linking](https://wiki.haskell.org/Web/Literature/Static_linking)

- [Static linking with GHC on Arch Linux](http://www.edofic.com/posts/2014-05-03-ghc-arch-static.html)

- [Statically linking Linux binaries for ARM & MIPS](https://stackoverflow.com/questions/14270177/ghc-statically-linking-linux-binaries-for-arm-mips-processors)

- [Statically link GMP using GHC and LLVM](https://stackoverflow.com/questions/10539857/statically-link-gmp-to-an-haskell-application-using-ghc-llvm)

## Dialoghi

> Disponibile in questo repository [qui](dialogues.md).

Questi sono in realtà importanti e utili. Leggeteli per approfondimenti su una varietà di argomenti.
