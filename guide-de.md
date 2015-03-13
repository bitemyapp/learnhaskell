# Die Einführung

Das ist meine empfohlene Art Haskell zu lernen.


#### Denk an folgendes: *Mach dir nichts draus, wenn du etwas nicht direkt verstehst*. Einfach weiter machen.

## Community

Unser IRC channel auf Freenode ist `#haskell-beginners`.

IRC web client [hier](http://webchat.freenode.net/).

Die Haskell [Mailing Listen](https://wiki.haskell.org/Mailing_lists).

### Community Richtlinien

[Siehe Chris Done's Post über Lehre](http://chrisdone.com/posts/teaching)

Sei freundlich und höflich. Unfreundlichkeit und Unhöflichkeit schreckt Leute ab, sodass sie nicht mehr mitmachen wollen.

Low-effort criticism is for the benefit of the person delivering it, not the person receiving it.

Beschreibe Dinge nicht als "einfach" oder "trivial". Leute, die hard für ihren Fortschritt arbeiten müssen, werden sich schlecht fühlen deswegen.
Langsame Lerner sind meistens die sorgfältigsten, das sollte gewürdigt werden!

Keine geheuchelte Überraschung. Spiele nicht überrascht, wenn jemand sagt, dass er etwas nicht weiß. Du erreichst nur, dass jemand sicht schlecht fühlt und du besonders toll.

Kein "also, eigentlich ...". Wenn jemand etwas sagt, das nahezu richtig ist - aber nicht exakt - und du sagst, "also, eigentlch..." und gibst eine kleine Korrektur. Das ist
besonders unnötig, da es keine Nutzen für die eigentlich Konversation hat. Das heißt nicht, dass die Hacker School nicht an Richtigkeit oder Genauigkeit interessiert ist.
Fast alle "also, eigentlich" sind Selbstdarstellung und keine konstruktiven Verbesserungen.

Kein ständiges reinreden. Wenn du siehst wie jemand ein Problem durcharbeitet, sollest du nicht immer wieder Vorschläge einwerfen. Lass es ihn herausfinden außer er fragt
nach Hilfe. Unterbrechungen zu vermeiden ist [eine der Gründe für #haskell-beginners](http://chrisdone.com/posts/teaching). 

Rassismus, Sexismus, Homophobie, Transphobie und andere Arten von Vorurteilen sind nicht erwünscht und werden nicht toleriert.

---

Richtlinien aus [the Hacker School manual](https://www.hackerschool.com/manual). Danke für die Veröffentlichung Hacker School.

# What are Haskell, GHC, und Cabal?

Haskell ist eine Programmiersprache wie in den Berichten(?) festgelegt, mit dem letzten von 2010.
Der Bericht(?) ist [online](http://www.haskell.org/onlinereport/haskell2010/) verfügbar.

## GHC

[GHC](http://www.haskell.org/ghc/) ist der beliebteste und bekannteste Weg mit Haskell zu arbeiten.
Es beinhaltet einen compiler, REPL (Interpreter), Paket Management, und ein paar weitere Dinge.

## Cabal

[Cabal](https://www.haskell.org/cabal/download.html) ist für Projekt Management und
Abhängigkeits Auflösung zuständig. Hiermit installierst du Projekte, normalerweise in ihre
eigene sandbox.

Cabal ist äquivalent zu Rubys Bundler, Pythons pip, Nodes NPM, Maven, etc. GHC
kümmert sich selber um Packaging(??), Cabal wählt die zu installierende Version aus.

# Getting set-up

## Ubuntu

[Dieses PPA](http://launchpad.net/~hvr/+archive/ghc) ist ausgezeichnet und ich benutze
es auf allen meine Linux Entwicklungs- und Buildmaschinen

Genauer:

```bash
$ sudo apt-get update
$ sudo apt-get install python-software-properties # v12.04 and below
$ sudo apt-get install software-properties-common # v12.10 and above
$ sudo add-apt-repository -y ppa:hvr/ghc
$ sudo apt-get update
$ sudo apt-get install cabal-install-1.20 ghc-7.8.3 happy-1.19.4 alex-3.1.3
```

Dann füge das folgende zu deinem `$PATH` (bash\_profile, zshrc, bashrc, etc) hinzu:

```
~/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.3/bin:/opt/happy/1.19.4/bin:/opt/alex/3.1.3/bin
```

*Optional:* Du kannst auch `.cabal-sandbox/bin` zu deinem PATH hinzufügen. Code, der gerade
entwickelt wird, ist dann verfügbar über die Kommandozeile. Das funktioniert aber nur,
wenn das aktuelle Verzeichnis eine Cabal Sandbox ist.

## Debian

### GHC Repository for debian stable

Wenn du Debian stable nutzt, ist es einfacher http://deb.haskell.org/ zu benutzen. 
Dafür mache folgendes:

- Füge die Zeile `deb http://deb.haskell.org/stable/ ./` zu `/etc/apt/sources.list` hinzu

```bash
## Add the key to avoid warnings
$ GET http://deb.haskell.org/deb.haskell.org.gpg-key | apt-key add -
$ sudo apt-get update
$ sudo apt-get install ghc-7.8.3 happy alex cabal-install
```

### Ubuntu PPA nutzen

Wenn du nicht stable benutzt, kannst du dieselben Schritte wie unter Ubuntu ausführen, aber du musst
ein weiteres Kommando ausführen. Direkt nachdem 
`sudo add-apt-repository -y ppa:hvr/ghc` ausgeführt wurde, starte:

```bash
$ sudo sed -i s/jessie/trusty/g /etc/apt/sources.list.d/hvr-ghc-jessie.list
```

Für alle anderen Debian Versionen, ersetze einfach alle Vorkommen von `jessie` mit dem entsprechenden
Versions Namen im Kommando oben.

Wenn, warum auch immer, die Datei `/etc/apt/sources.list.d/hvr-ghc-jessie.list` nicht existiert,
dann sollte `/etc/apt/sources.list` eine Liste, wie die folgende beinhalten:

    deb http://ppa.launchpad.net/hvr/ghc/ubuntu jessie main

Ersetze `jessie` durch `trusty` in dieser Zeile.

### Manuell Kompilieren

Du kannst
[dieser](http://www.davesquared.net/2014/05/platformless-haskell.html) Anleitung folgen
(geschrieben für Mac OS X):

Anmerkungen:

- Setze deinen Prefix entsprechend, wenn du GHC konfiguierst
- Anstatt die `cabal-install` Binary zu laden, lade die Quellen und führe das Skript
  `bootstrap.sh` aus.

## Fedora 21

Um Haskell 7.8.4 aus dem unoffiziellen Repo (Fedora 22+ wird es in den offiziellen beinhalten)
zu installieren:

```bash
$ sudo yum-config-manager --add-repo \
> https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/repo/fedora-21/petersen-ghc-7.8.4-fedora-21.repo 
$ sudo yum install ghc cabal-install
```

Wie in
[petersen/ghc-7.8.4 copr page](https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/)
beschrieben kann dieser ghc nicht parallel zu Fedora/EPEL ghc installiert werden.

## Arch Linux

Um Haskell aus den offiziellen Repos unter Arch Linux zu installieren, mache folgendes:

```bash
$ sudo pacman -S cabal-install ghc happy alex haddock
```

## Gentoo

Unter Gentoo kannst du verschiedene Komponenten der Haskell Platform
via Portage installieren. Wenn du `ACCEPT_KEYWORDS=arch` nutzt (anstatt
`ACCEPT_KEYWORDS=~arch`), installiert Portage die uralt Versionen der verschiedenen
Haskell Teile. Daher, füge wenn du, und *nur* wenn du `ACCEPT_KEYWORDS=arch` nutzt, das
folgende in `/etc/portage/package.keywords` ein.

    dev-haskell/cabal-install
    dev-lang/ghc

Wenn das getan ist,

```bash
$ emerge -jav dev-lang/ghc dev-haskell/cabal-install
```

Gentoo hat eine "stabile" (lies: alte) Version von `cabal-install` im Portage
tree, daher wirst du `cabal-install` nutzen wollen um eine neuere version zu installieren.
Beachte, dass backslashes Absicht sind.

```bash
$ \cabal update                # The backslashes
$ \cabal install cabal-install # are intentional
```

Du hast cabal jetzt global mit Portage und lokal in deinem Home Verzeichnis mit
`cabal-install` installiert. Der nächste Schritt ist sicherzustellen, dass, wenn du
`cabal` im Terminal ausführst, die aktuelle Version genommen wird.
Dafür kannst du folgende Zeilen zur Konfiguration deiner Shell hinzufügen:

```bash
PATH=$PATH:$HOME/.cabal/bin
alias cabal="$HOME/.cabal/bin/cabal"
```

Wenn du nicht weißt, was für eine Shell du nutzt, ist es mit hoher Wahrscheinlichkeit die Bash. 
Wenn du die Bash nutzt, musst du die Datei `~/.bashrc` editieren. Wenn du die Z-shell nutzt, ist
die Datei `~/.zshrc`. Du kannst folgendes Kommando ausführen, um herauszufinden, was für eine Shell
du benutzt:

```bash
echo $SHELL | xargs basename
```

Ich nutze zsh, daher ist die Ausgabe `zsh`, wenn ich es ausführe.

Wenn du all das getan hast, brauchst du die weiteren Tools`alex` und
`happy`.

```bash
$ cabal install alex happy
```

Glückwunsch! Du hast jetzt eine funktionierende Haskell installation!

## Mac OS X

### 10.9

Installiere die [GHC for Mac OS X](http://ghcformacosx.github.io/) App, welche
GHC und Cabal beinhaltet. Sie liefert Anweisungen, wie du GHC und Cabal zu deinem 
path hinzufügen kansnt, nachdem du die `.app` irgendwo ableget hast.

### 10.6-10.8

Installiere die Binary Distribution, wie unten beschrieben, mit [diesem tarball](https://www.haskell.org/platform/download/2014.2.0.0/ghc-7.8.3-x86_64-apple-darwin-r3.tar.bz2).

## Windows

- Der [windows minimal GHC installer](http://neilmitchell.blogspot.com/2014/12/beta-testing-windows-minimal-ghc.html)
  ist in der Lage `network` et al. zu installieren. Technisch gesehen in beta, sollte aber funktionieren für die Zwecke
  eines jeden der diese Anleitung ließt.

Vergesse nicht den Installer als Administrator auszuführen, da er in deinen Programmen installieren will.

## Andere Linux Nutzer

Lade die aktuellen Binary Distributions für cabal und ghc:

- [GHC](http://www.haskell.org/ghc/).

- [Cabal](https://www.haskell.org/cabal/download.html).

#### Detailierte Installationsanleitung für Mac OS X

Du musst das nicht machen, wenn du die .app nutzt, aber wenn das für dich nicht funktioniert, versuche
[das](http://www.davesquared.net/2014/05/platformless-haskell.html) mit der Binary Distribution.

# Grundlegende Kurse

## Yorgey's cis194 Kurs

> *Den solltest du zuerst machen*, das ist eine erstklassige Einführung
> in Haskell, die ich sehr empfehle

Verfügbar [online](http://www.seas.upenn.edu/~cis194/spring13/lectures.html).

[Brent Yorgey](https://byorgey.wordpress.com)s Kurs ist der beste, den ich bisher gefunden habe.
Dieser Kurs ist wertvoll, da du nicht nur Grundlegendes über Haskell lernst, sondern auch lernst
Parser Combinators zu verstehen.

Der einzige Fall, in dem du nicht mit cis194 anfangen solltest, ist, wenn du kein oder ein unerfahrener
Programmierer bist. Wenn das der Fall ist, starte mit
[Thompsons Buch](http://www.haskellcraft.com/craft3e/Home.html) und gehe über zu
cis194.

---

## NICTA Kurs

> Das ist der Kurs, den ich empfehle nach Yorgeys cis194 Kurs, zu machen

Verfügbar auf github [hier](https://github.com/NICTA/course).

Das wird dein Verständnis verbessern und dir Erfahrung mit der Implementierung der
Abstraktionen geben, die in cis194 eingeführt wurden, das ist die Praxis, die *ausschlaggebend* ist, um
mit der üblichen Nutzung von Functor/Applicative/Monad/etc. in Haskell vertraut zu verwerden.
Erst cis194 und dann den NICTA Kurs zu machen, ist die wesentliche Empfehlung meiner Anleitung
und ist der Weg, wie ich anderen Leuten Haskell beibringe.

---

## Zusätzliche Kurse cs240h

> Stellt weiteres Material für fortgeschrittene Themen bereit

Verfügbar [online](http://www.scs.stanford.edu/14sp-cs240h/).

Das ist [Bryan O'Sullivan](https://github.com/bos)s online Version des Kurses, den er
in Stanford unterrichtet. Wenn du nicht weißt, wer er ist, guck dir der Hälfte der Libraries
and, die jede Haskell Anwendunge am Ende braucht unnd sein Name wird dabei sein. 
Wenn du bereits den Yorgey Kurs gemacht hast, sind die Module über
phantom types, information flow control, language extensions, concurrency,
pipes, und lenses von besonderer Bedeutung.

---

## Referenz Material für die drei Kurse

[Learn You a Haskell for Great Good (LYAH)](http://learnyouahaskell.com) und
[Real World Haskell](http://book.realworldhaskell.org) (Danke bos!) sind
online verfügbar.

I empfehle RWH als Referenz (dickes Buch). Die Kapitel über Parsing und Monaden
sind sehr gut, um ein Verständnis dafür zu kriegen, wofür Monaten nützlich sind. Andere Leute sagen,
dass sie es oft verlinkt haben. Vermutlich eine gute Nachbereitung für die praktischen Teile
nachdem du die essentiellen Sachen in Haskell verstanden hast?

### Was macht dieser `<-` / `do` / list comprehension syntaktische Zucker?

Exzellenter [Artikel](http://www.haskellforall.com/2014/10/how-to-desugar-haskell-code.html).

### Um Listen und Fold zu verstehen

- [Explain List Folds to Yourself](http://vimeo.com/64673035)

### Um ein paar wesentliche Typ Klassen zu lernen

Nützlich um `Functor`, `Applicative`, `Monad`, `Monoid` und andere
Typ Klassen im Allgemeinen zu verstehen aber auch etwas Hask-bezogene Kategorien Theorie:

- Die [Typeclassopedia](http://www.haskell.org/haskellwiki/Typeclassopedia)

### Die grundlegenden Haskell Fehler Meldungen verstehen

- [Understanding basic error messages](http://ics.p.lodz.pl/~stolarek/_media/pl:research:stolarek_understanding_basic_haskell_error_messages.pdf)

---

# Laziness, strictness, guarded recursion

- Marlows [Buch](http://chimera.labs.oreilly.com/books/1230000000929/ch02.html)
  über Parallelisierung und Nebenläufigkeit hat eine der besten Einführungen über
  laziness und normal form, die ich finden konnte. Nutze anderes Material, wenn es nicth direkt
  verständlich ist.

- [More points for lazy evaluation](http://augustss.blogspot.hu/2011/05/more-points-for-lazy-evaluation-in.html)

- [Oh my laziness!](http://alpmestan.com/posts/2013-10-02-oh-my-laziness.html)

- SO Frage '[Does haskell have laziness?](http://stackoverflow.com/questions/13042353/does-haskell-have-tail-recursive-optimization)'

- [Johan Tibell](https://github.com/tibbe)s Folien von seinem Vortrag 
  [reasoning about laziness](http://www.slideshare.net/tibbe/reasoning-about-laziness).

## Kurze Demonstration

```haskell
let a = 1 : a -- guarded recursion, (:) is lazy and can be pattern matched.
let (v : _) = a
> v
1
> head a -- head a == v
1

let a = 1 * a -- not guarded, (*) is strict
> a
*** Exception: <<loop>>
```

# IO

- [Evaluation order and State tokens](https://www.fpcomplete.com/user/snoyberg/general-haskell/advanced/evaluation-order-and-state-tokens)

- [Unraveling the mystery of the IO monad](http://blog.ezyang.com/2011/05/unraveling-the-mystery-of-the-io-monad/).

- [First class "statements"](http://blog.jle.im/entry/first-class-statements).

- [Haddocks for System.IO.Unsafe.unsafePerformIO](http://hackage.haskell.org/package/base-4.7.0.1/docs/System-IO-Unsafe.html#v:unsafePerformIO)
  Lies die Dokumentation und Implementierung von unsafeDupablePerformIO

Kommentar auf Reddit von `glaebhoerl`

Übersetzt:
> Interessante Randbemerkung: GHC muss die state token Darstellung hinter
> einem abstrakten IO Typ verstecken, weil der state token immer linear benutzt werden muss (nicht
> dupliziert oder dropped(??)), aber das Typsystem kann das nicht erzwingen. Clean, ein andere
> lazy Haskell-ähnliche Sprache, hat eindeutige Typen (die ähnliche zu Linearen Typen sind
> und vermutlich anders in vielen Aspekten, die mir nicht bekannt sind), und sie stellen
> World-passing(??) direkt und eine (nicht abstrakte) IO Monade nur der Einfachheit halber
> bereit.

Original:
> Interesting side note: GHC needs to hide the state token representation behind
> an abstract IO type because the state token must always be used linearly (not
> duplicated or dropped), but the type system can't enforce this. Clean, another
> lazy Haskell-like language, has uniqueness types (which are like linear types
> and possibly different in ways I'm not aware of), and they expose the
> World-passing directly and provide a (non-abstract) IO monad only for
> convenience.