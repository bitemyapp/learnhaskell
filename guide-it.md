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
