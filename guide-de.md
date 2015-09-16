# Die Einführung

Das ist mein empfohlener Weg Haskell zu lernen.

*Beachte: Diese Einführung ist zwar in Deutsch, aber alle Referenzen sind leider noch in Englisch.*

#### Denk an folgendes: *Mach dir nichts draus, wenn du etwas nicht direkt verstehst*. Einfach weiter machen.

## Community

Unser IRC channel auf Freenode ist `#haskell-beginners`.

IRC web client [hier](http://webchat.freenode.net/).

Die Haskell [Mailing Listen](https://wiki.haskell.org/Mailing_lists).

### Community Richtlinien

[Siehe Chris Done's Post über Lehre](http://chrisdone.com/posts/teaching)

Sei freundlich und höflich. Unfreundlichkeit und Unhöflichkeit schreckt Leute ab, sodass sie nicht mehr mitmachen wollen.

Wenn du dir keine Mühe bei deiner Kritik gibst, hilft sie der Person, die sie erhält, auch nicht.

Beschreibe Dinge nicht als "einfach" oder "trivial". Leute, die hart für ihren Fortschritt arbeiten müssen, werden sich schlecht fühlen deswegen.
Langsame Lerner sind meistens die sorgfältigsten, das sollte gewürdigt werden!

Keine geheuchelte Überraschung. Spiele nicht überrascht, wenn jemand sagt, dass er etwas nicht weiß. Du erreichst nur, dass jemand sicht schlecht fühlt und du dich besonders toll.

Kein "also, eigentlich ...". Wenn jemand etwas sagt, das nahezu richtig ist - aber nicht exakt - und du sagst, "also, eigentlich..." und gibst eine kleine Korrektur. Das ist
besonders unnötig, da es keine Nutzen für die eigentlich Konversation hat. Das heißt nicht, dass die Recurse Center nicht an Richtigkeit oder Genauigkeit interessiert ist.
Fast alle "also, eigentlich" sind Selbstdarstellung und keine konstruktiven Verbesserungen.

Kein ständiges Reinreden. Wenn du siehst wie jemand ein Problem durcharbeitet, sollest du nicht immer wieder Vorschläge einwerfen. Lass es ihn herausfinden außer er fragt
nach Hilfe. Unterbrechungen zu vermeiden ist [eine der Gründe für #haskell-beginners](http://chrisdone.com/posts/teaching).

Rassismus, Sexismus, Homophobie, Transphobie und andere Arten von Vorurteilen sind nicht erwünscht und werden nicht toleriert.

---

Richtlinien aus [the Recurse Center manual](https://www.recurse.com/manual). Danke für die Veröffentlichung Recurse Center.

# Was sind Haskell, GHC, und Cabal?

Haskell ist eine Programmiersprache, die in einem Report festgelegt wird, der letzte ist von 2010.
Der Report ist [online](http://www.haskell.org/onlinereport/haskell2010/) verfügbar.

## GHC

[GHC](http://www.haskell.org/ghc/) ist der beliebteste und bekannteste Weg mit Haskell zu arbeiten.
Er beinhaltet einen Compiler, REPL (Interpreter), Paket Management, und ein paar weitere Dinge.

## Cabal

[Cabal](https://www.haskell.org/cabal/download.html) ist für Projekt Management und
Abhängigkeitsauflösung zuständig. Hiermit installierst du Projekte, normalerweise in ihre
eigene Sandbox.

Cabal ist äquivalent zu Rubys Bundler, Pythons pip, Nodes NPM, Maven, etc. GHC
kümmert sich selber um die Paketierung, Cabal wählt die zu installierende Version aus.

# Installation

## Ubuntu

[Dieses PPA](http://launchpad.net/~hvr/+archive/ghc) ist ausgezeichnet und ich benutze
es auf allen meine Linux Entwicklungs- und Buildmaschinen.

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

### Ubuntu PPA nutzen

Wenn du nicht stable benutzt, kannst du dieselben Schritte wie unter Ubuntu ausführen, aber du musst
ein weiteres Kommando ausführen. Direkt nachdem
`sudo add-apt-repository -y ppa:hvr/ghc` ausgeführt wurde, starte:

```bash
$ sudo sed -i s/jessie/trusty/g /etc/apt/sources.list.d/hvr-ghc-jessie.list
```

Für alle anderen Debian Versionen, ersetze einfach alle Vorkommen von `jessie` mit dem entsprechenden
Versionsnamen im Kommando oben.

Wenn, warum auch immer, die Datei `/etc/apt/sources.list.d/hvr-ghc-jessie.list` nicht existiert,
dann sollte `/etc/apt/sources.list` eine Liste, wie die folgende beinhalten:

    deb http://ppa.launchpad.net/hvr/ghc/ubuntu jessie main

Ersetze `jessie` durch `trusty` in dieser Zeile.

### Manuell Kompilieren

Du kannst
[dieser](http://www.davesquared.net/2014/05/platformless-haskell.html) Anleitung folgen
(geschrieben für Mac OS X):

Anmerkungen:

- Setze deinen Präfix entsprechend, wenn du GHC konfiguierst
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

Wie in auf der Seite
[petersen/ghc-7.8.4 copr](https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/)
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
Haskell Teile. Daher füge, wenn du, und *nur* wenn du `ACCEPT_KEYWORDS=arch` nutzt, das
Folgende in `/etc/portage/package.keywords` ein.

    dev-haskell/cabal-install
    dev-lang/ghc

Wenn das getan ist:

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

- Der [minimale ghc Installer für Windows](http://neilmitchell.blogspot.com/2014/12/beta-testing-windows-minimal-ghc.html)
  ist in der Lage `network` und andere zu installieren. Technisch gesehen befindet er sich in der Beta, sollte aber für die Zwecke eines jeden der diese Anleitung ließt funktionieren.

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

> Das ist der Kurs, den ich nach Yorgeys cis194 Kurs empfehle zu machen

Verfügbar [hier](https://github.com/NICTA/course) auf github

Das wird dein Verständnis verbessern und dir Erfahrung mit der Implementierung der
Abstraktionen geben, die in cis194 eingeführt wurden, das ist die Praxis, die *ausschlaggebend* ist, um
mit der üblichen Nutzung von Functor/Applicative/Monad/etc. in Haskell vertraut zu werden.
Erst cis194 und dann den NICTA Kurs zu machen, ist die wesentliche Empfehlung meiner Anleitung
und ist der Weg, wie ich anderen Leuten Haskell beibringe.

---

## Deutsche Ressourcen

*Anmerkung: Dieser Abschnitt wurde bei der Übersetzung eingefügt, um hilfreiche deutsche Inhalte zu verlinken*

* [funktionale-programmierung.de](http://funktionale-programmierung.de/tags-archive.html#Haskell) ist ein Blog über Funktionale Programmierung
  im Allgemeinen, welcher auch Posts über Haskell beinhaltet.

* [Skript](http://verify.rwth-aachen.de/fp14/FP14.pdf) der Vorlesung Funktionale Programmierung an der RWTH Aachen. Beinhaltet eine kurze Einführung
  in Haskell, sowie Kapitel über den Lambda Kalkül und Typüberprüfung und -inferenz.

---

## Zusätzliche Kurse cs240h

> Stellt weiteres Material für fortgeschrittene Themen bereit

Verfügbar [online](http://www.scs.stanford.edu/14sp-cs240h/).

Das ist [Bryan O'Sullivan](https://github.com/bos)s online Version des Kurses, den er
in Stanford unterrichtet. Wenn du nicht weißt, wer er ist, guck dir der Hälfte der Libraries
an, die jede Haskell Anwendung am Ende braucht und sein Name wird dabei sein.
Wenn du bereits den Yorgey Kurs gemacht hast, sind die Module über
phantom types, information flow control, language extensions, concurrency,
pipes, und lenses von besonderer Bedeutung.

---

## Referenz Material für die drei Kurse

[Learn You a Haskell for Great Good (LYAH)](http://learnyouahaskell.com) und
[Real World Haskell](http://book.realworldhaskell.org) (Danke bos!) sind
online verfügbar.

I empfehle RWH als Referenz (dickes Buch). Die Kapitel über Parsen und Monaden
sind sehr gut, um ein Verständnis dafür zu kriegen, wofür Monaden nützlich sind. Andere Leute sagen,
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
  laziness und normal form, die ich finden konnte. Nutze anderes Material, wenn es nicht direkt
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

# Monaden und Monaden Transformer (monad transformers)

> Versuche nicht diese zu lernen bis du nicht Typ Klassen, Monoide, Funktoren
> und Applikativen verstanden hast

Implementiere die Monaden aus der Standard Bibliothek ( List, Maybe, Cont, Error, Reader,
Writer, State ) für dich selbst, um sie besser zu verstehen. Dann schreibe vielleicht einen
monadischen Interpreter für eine kleine Expression Sprache mit dem
[Monad Transformers Step by Step](http://catamorph.de/documents/Transformers.pdf)
Paper (erwähnt in 'monad transformers' im folgenden).

Mehrere Interpreter zu schreiben, indem man einfach nur die Monade ändert um die Semantik zu verändern
kann helfen, zu verstehen was passiert.

- [Dieser Vortrag](https://vimeo.com/73648150) von Tony motiviert Monad
  Transformers sehr gut, [die Folien](https://dl.dropboxusercontent.com/u/7810909/talks/monad-transformers/cbaa991e0eb49224eb286c1e418e2b9828e1fb21/monad-transformers.pdf).

Zusätzlich, implementiere `Control.Monad` selbst. Funktionen wie `mapM` oder `sequence` sind gute
Möglichkeiten, um zu üben, generischen monadischen Code zu schreiben.

Der NICTA Kurs kann als Anleitung für diese Prozess genutzt werden, was auch beinhaltet
eine eigene Applicative zu schreiben.

Credits:

- Reddit Kommentar von htmltyp und Crandom [hier](http://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5aj6).

- Reddit Kommentar von jozefg [hier](http://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5trg).

## Monad transformers
 
- [A gentle introduction to Monad Transformers](https://github.com/kqr/gists/blob/master/articles/gentle-introduction-monad-transformers.md).

- [Monad transformers step-by-step](http://catamorph.de/documents/Transformers.pdf).

# Testen, Tests, Specs, generative/property testing

- Dieses [Tutorial](https://github.com/kazu-yamamoto/unit-test-example/blob/master/markdown/en/tutorial.md) von Kazu Yamamoto ist fantastisch.

- [Simple-Conduit](https://github.com/jwiegley/simple-conduit): Gute, einfache
  Bibliothek um zu lernen, wie streaming IO funktioniert im Allgemeinen, die Konzepte
  sind transferierbar auf Bibliotheken wie Pipes und Conduit

# Parsen in Haskell

- Parser combinator [tutorial](https://github.com/JakeWheat/intro_to_parsing)
  für Haskell mit Parsec

- [Writing your own micro-Parsec](http://olenhad.me/articles/monadic-parsers/)

## Parsen und generieren von JSON

Aeson ist die standard Lösung für parsen von [JSON](https://json.org) in
Haskell. Verfübar über [hackage](https://hackage.haskell.org/package/aeson) und
[github](https://github.com/bos/aeson).

- [Parsing JSON using Aeson](http://blog.raynes.me/blog/2012/11/27/easy-json-parsing-in-haskell-with-aeson/)

- [Aeson and user created types](http://bitemyapp.com/posts/2014-04-11-aeson-and-user-created-types.html)

- [Parsing non-deterministic data with aeson and sum types](http://bitemyapp.com/posts/2014-04-17-parsing-nondeterministic-data-with-aeson-and-sum-types.html)

- [Aeson tutorial](https://www.fpcomplete.com/school/starting-with-haskell/libraries-and-frameworks/text-manipulation/json)

# Graph Algorithmen und Datenstrukturen

- Das [fgl Paket](https://hackage.haskell.org/package/fgl) im Besonderen die
  puren, funktionalen kürzester Pfad [Algorithmen](http://hackage.haskell.org/package/fgl-5.4.2.2/docs/Data-Graph-Inductive-Query-SP.html).

- [Inductive graphs and Functional Graph Algorithms](http://web.engr.oregonstate.edu/~erwig/papers/abstracts.html#JFP01).

- [FGL/Haskell - A Functional Graph Library](http://web.engr.oregonstate.edu/~erwig/fgl/haskell/old/fgl0103.pdf).

- [Data.Graph Quellcode vom Containers Paket](http://hackage.haskell.org/package/containers-0.5.5.1/docs/Data-Graph.html).

- Das [graphs Paket](https://hackage.haskell.org/package/graphs).

- [SO Frage zu PHOAS](http://stackoverflow.com/questions/24369954/separate-positive-and-negative-occurrences-of-phoas-variables-in-presence-of-rec)

- [PHOAS for free](https://www.fpcomplete.com/user/edwardk/phoas).

- [Tying the Knot](http://www.haskell.org/haskellwiki/Tying_the_Knot).

- [Hackage: dag](https://hackage.haskell.org/package/dag).

# Entwicklungsumgebung

## Emacs

- [Alejandro Serrass Tutorial](https://github.com/serras/emacs-haskell-tutorial/blob/master/tutorial.md)

- [Meine dotfiles](https://github.com/bitemyapp/dotfiles/)
  *Anmerkung: Dotfiles sind die Konfigurationsdateien für Shell und Editor, wie z.b. `.vimrc`*

- [Chris Done's emacs Konfiuration](https://github.com/chrisdone/chrisdone-emacs)

## Vim

- [Vim Seite im Haskell Wiki](http://www.haskell.org/haskellwiki/Vim)

- [Haskell-vim-now](https://github.com/begriffs/haskell-vim-now)

- [GHC-Mod](https://github.com/kazu-yamamoto/ghc-mod)

- [GHC-Mod vim plugin](https://github.com/eagletmt/ghcmod-vim)

- [Hindent](https://github.com/chrisdone/hindent)

## Sublime Text

- [SublimeHaskell](https://github.com/SublimeHaskell/SublimeHaskell)

# Arbeiten mit Cabal

## Cabal Leitfaden

Cabal Hell war ein Problem für Haskell Nutzer vor der Einführung von
Sandboxes. Eine Installation außerhalb einer sandbox wird in die user
package-db installieren. Das ist *keine* gute Idee außer für grundlegende Pakete wie
Cabal, alex, und happy. Nichts anderes sollte in den user oder der globalen
package-db installiert sein, außer du weißt was du tust

[Hier](http://softwaresimply.blogspot.com/2014/07/haskell-best-practices-for-avoiding.html) gibt es ein
paar gute Praktiken um Cabal hell zu verhindern.


Um mit einem Paket zu experimentieren oder ein Projekt zu starten, beginne mit
`cabal sandbox init` in einem neuen Verzeichnis.

Kurz gesagt:

- Nutze immer Sandboxes, um neue Pakete zu installieren, neue oder existierende Projekte zu bauen oder
  Experimente zu starten

- Nutze `cabal repl` um eine Projekt bezogene ghci Instanz zu starten

Die vorgeschlagene, sandbox-basierte Methode sollte Paket Abhängigkeits Probleme vermeiden
aber sie ist inkompatibel zu der Art wie die Haskell Plattform fertig gebaute Pakete bereitstellt.
Wenn du momentan noch Haskell lernst und nicht verstehst wie ghc-pkg und Cabal funktionieren,
*nutze nicht die Plattform* und stattdessen die Instruktionen, die zu Beginn erklärt wurden.

## Stackage

Für alle Nutzer (normalerweise Yesod Nutzer), die Build Probleme haben, zieht Stackage in Erwägung:

- Eine gute Zusammenfassung ist
  [hier](https://www.fpcomplete.com/blog/2014/05/stackage-server).

Der Meinung des Authors nach, ist Stackage normalerweise nützlicher als ein `cabal freeze`.

# Hoogle und Haddock

## Suche Code nach der Typ Signatur

Die [Hoogle Suchmaschine](http://www.haskell.org/hoogle/) kann nach Typen suchen.

Zum Beispiel, guck dir die such Resultate für `(a -> b) -> [a] -> [b]`
[an](http://www.haskell.org/hoogle/?hoogle=%28a+-%3E+b%29+-%3E+%5ba%5d+-%3E+%5bb%5d).

Auch verfügbar über FPComplete [hier](https://www.fpcomplete.com/hoogle).

Außerdem gibt es [Hayoo](http://holumbus.fh-wedel.de/hayoo/hayoo.html) (welches standardmäßig ganz
hackage durchsucht).

## Eine eigene lokale Instanz von Hoogle aufsetzen

Siehe [hier](https://gist.github.com/bitemyapp/3e6a015760775e0679bf).

## Haddock

1. [Fix your hackage documentation](http://fuuzetsu.co.uk/blog/posts/2014-01-06-Fix-your-Hackage-documentation.html)

2. [Hackage Dokumentation v2](http://fuuzetsu.co.uk/blog/posts/2014-01-06-Hackage-documentation-v2.html)

Beachte, dass diese Artikel *etwas veraltet* sind: Zum Beispiel hat Hackage jetzt eine neue
Info mit Dokumentations- und Build-Status.

## Was du wirklich wissen solltest

Damit Haddock Dokumentation für verwandte Pakete inkludiert, musst du `documentation: True`
in deiner `~/.cabal/config` setzen. Wenn es auf Standard Wert (`False`) gelassen wurde,
musst du alle Pakete löschen und neu installieren bevor die Haddocks generiert werden.

Die andere Sache, an die man denken sollte, ist, dass aufgrund der Art wie `$pkg` interpoliert
wird *von* cabal, nicht von dir, die `html-location` und `content-location` Parameter
*in Apostrophen* stehen *müssen* und in die Shell eingegeben werden oder in einem Shell Skript stehen.
Sie werden nicht in einer Makefile funktionieren, da Make denken wird es seien Make Variablen.

```bash
#! /usr/bin/env sh

# You can write it one one line by skipping the backslashes
cabal haddock --hoogle --hyperlink-source                       \
 --html-location='http://hackage.haskell.org/package/$pkg/docs' \
 --contents-location='http://hackage.haskell.org/package/$pkg'
```

# TravisCI

Wenn du, wie ich, ein großer Fan von [TravisCI](https://travis-ci.org) bist, dann empfehle
ich *sehr* [multi-ghc-travis](https://github.com/hvr/multi-ghc-travis) anzugucken für die Basis
der `travis.yml` für deine Haskell Projekte.

# Frontend/JavaScript

Wir haben eine große Auswahl! Im Grunde gibt es drei Möglichkeiten,
die ich empfehlen würde:

* [Haste](http://haste-lang.org/) ein Haskell zu JavaScript Compiler
  - Der [Compiler](https://github.com/valderman/haste-compiler) auf github.
  - Eine tolle
    [Demo](http://www.airpair.com/haskell/posts/haskell-tutorial-introduction-to-web-apps)
    von Haste mit einem Beispiel Projekt.

* [GHCJS](https://github.com/ghcjs/ghcjs)
  - [GHCJS Einführung](http://weblog.luite.com/wordpress/?p=14)
  - [Functional Reactive Web Interfaces with GHCJS and Sodium](http://weblog.luite.com/wordpress/?p=127)
  - [Writing Atom plugins in Haskell using ghcjs ](http://edsko.net/2015/02/14/atom-haskell/)

* [PureScript](http://www.purescript.org/)
  - Nicht direkt Haskell, wie Haste und GHCJS, aber eine beliebte Wahl unter Haskellern
  - Geschrieben in und inspiriert durch Haskell
  - Teste Purescript in deinem Browser [hier](http://try.purescript.org/)
  - Gute Anleitung für [die ersten Schritte](http://www.christopherbiscardi.com/2014/06/22/getting-started-with-purescript/)

## Welche Frontend Sprache nutze ich?

GHCJS und Haste sind beide komplett Haskell. GHCJS wird mit mehr Haskell
Paketen funktionieren als Haste, aber ist egal für viele Frontend Projekte.
Purescript ist kein Haskell, daher ist es nicht möglich Code direkt
mit dem Backend zu teilen.

GHCJS hat den größten Laufzeit Overhead mit über 100kb (luite arbeitet daran).
Haste und Purescript sind vergleichbar.

PureScript hat die beste JS Tooling Integration (nutzt gulp/grunt/bower), GHCJS
und Haste integrieren besser mit Haskells Tooling (Cabal).

Alle drei sind eine gute Wahl und werden für die meisten Frontend Projekte genügen.

# Für ein tiefergehendes Verständnis für Laziness, NF, WHNF

- [Notes on lambda calculus](https://vec.io/posts/notes-on-lambda-calculus).

## Forschungs Paper über Lazy Lambda Calculi

- [A call by need lambda calculus](http://homepages.inf.ed.ac.uk/wadler/topics/call-by-need.html#need-journal).

- [Demonstrating Lambda Calculus Reduction](http://www.itu.dk/~sestoft/papers/sestoft-lamreduce.pdf)

- [The lazy lambda calculus](http://www.cs.ox.ac.uk/files/293/lazy.pdf).

- [Lazy evaluation of Haskell](http://www.vex.net/~trebla/haskell/lazy.xhtml)

# Parallelisierung/Nebenläufigkeit

- [Parallel and Concurrent Programming in Haskell](http://chimera.labs.oreilly.com/books/1230000000929). Dieses
  Buch von Simon Marlow ist vermutlich das beste, was ich je gelesen habe über
  Parallelisierung und Nebenläufigkeit.

- Ein ausführliches [Tutorial](http://kukuruku.co/hub/haskell/haskell-testing-a-multithread-application)
  über Testen & schrittweise Entwicklung einer Multi-thread Anwendung in
  Haskell.

- [Functional Reactive Programming](http://www.haskell.org/haskellwiki/Functional_Reactive_Programming)

# Lenses und Prisms

Nachdem du vertraut bist mit Haskell, solltest du unbedingt in Betracht ziehen
Lenses und Prims zu lernen, auch wenn du nur ein "Nutzer" bist. Du brauchst nicht
du zu grunde liegende Kategorie zu verstehen damit es nützlich ist.

Die Schwierigkeit Lens zu nutzen wird oft stark überschätzt. Jeder der vertraut ist
mit Functor/Foldable/Traversable (oder nur dem ersten der drei) kann Lenses und
Prisms bereits nutzen, um sein Leben leichter zu machen.

Wenn du jemals etwas wie `(fmap . fmap)` gemacht hast, hast du bereits in deinem
Kopf "lensing" gemacht.

Ich empfehle zwei dieser Tutorials/Einführungen:

- [A little lens starter tutorial](https://www.fpcomplete.com/school/to-infinity-and-beyond/pick-of-the-week/a-little-lens-starter-tutorial)

- [Lens: Lenses, Folds and Traversals](https://github.com/ekmett/lens#lens-lenses-folds-and-traversals)

Siehe hier für weitere Informationen: [Lens Paket auf Hackage](http://hackage.haskell.org/package/lens).

# Recursion Schemes

Einige der verrückten \*-morphismus wörter, die du gehört hast, sind eigentlich
über Rekursion. Beachte - Bevor du diese Material betrachtest, solltest du wissen,
wie man foldr für Listen implementiert und mindestens eine andere Datenstruktur,
wie z.B. einen Baum (folds sind Catamorphismen). Wenn du auch noch weißt, wie man
ein unfold (Anamorphismus) implementiert, ist das hilfreich.

Diese Material passt gut mit Traversable und Foldable zusammen.

- [An introduction to recursion schemes](http://patrickthomson.ghost.io/an-introduction-to-recursion-schemes/)

- [Don't fear the cat](http://fho.f12n.de/posts/2014-05-07-dont-fear-the-cat.html) -
  Gute Demonstration, warum Hylomorphismus die Komposition von cata und ana ist

- [Recursion Schemes](http://comonad.com/reader/2009/recursion-schemes/) - Diese
  Einführung ist echt gut.

- [Functional Programming with Bananas, Lenses, Envelopes and Barbed Wire](http://eprints.eemcs.utwente.nl/7281/01/db-utwente-40501F46.pdf)

- [Catamorphisms](https://www.fpcomplete.com/user/edwardk/recursion-schemes/catamorphisms)

# GHC Core und Performance Verbesserungen

- [Write Haskell as Fast as C](write_haskell_as_fast_as_c.md)

- [GHC Wiki: CoreSyn Type](https://ghc.haskell.org/trac/ghc/wiki/Commentary/Compiler/CoreSynType).

- [Hackage: GHC Core](https://hackage.haskell.org/package/ghc-core).

- [Stackoverflow Frage: Reading GHC Core](http://stackoverflow.com/questions/6121146/reading-ghc-core).

- [Haskell as fast as C](http://donsbot.wordpress.com/2008/06/04/haskell-as-fast-as-c-working-at-a-high-altitude-for-low-level-performance/).

- [Real World Haskell, Kapitel 25: Profiling and Optimizations](http://book.realworldhaskell.org/read/profiling-and-optimization.html).

# Typ und Kategorien Theorie

> *Nicht* notwending um in Haskell zu entwickeln, nur für Interessierte!

Wenn du dich mit Typ- oder Kategorien Theorie beschäftigen willst:

- [Catster's Guide](http://byorgey.wordpress.com/2014/01/14/catsters-guide/) und
  [Catster's Guide 2](http://byorgey.wordpress.com/catsters-guide-2/)

- Das [Haskell Wikibuch](http://en.wikibooks.org/wiki/Haskell/Category_theory)
  hat anschauliche Abbildungen

- [Category Theory](http://www.haskell.org/haskellwiki/Category_theory) im
  Haskell Wiki hat auch gute Links zu anderen Ressourcen

- [Categories from scratch](http://science.raphael.poss.name/categories-from-scratch.html), beinhaltet ein paar praktische Beispiele

- Pierces [Great Works in PL](http://www.cis.upenn.edu/~bcpierce/courses/670Fall04/GreatWorksInPL.shtml) Liste.

## Bücher

- [Quora Frage: What is the best textbook for category theory?](http://www.quora.com/Category-Theory/What-is-the-best-textbook-for-Category-theory?share=1) Kmett's recommendations

- [Awodey](http://ukcatalogue.oup.com/product/9780199237180.do) und
  [MacLane](http://www.amazon.com/Categories-Working-Mathematician-Graduate-Mathematics/dp/0387984038).
  Die Standard Bücher über Kategorien Theorie.

- [Harper's Practical Foundations for Programming Languages](http://www.cs.cmu.edu/~rwh/plbook/book.pdf)
  ist die beste auf Programmiersprachen fokussierte Einführung in Typentheorie,
  die ich gelesen habe.

- [Type theory and Functional Programming](http://www.cs.kent.ac.uk/people/staff/sjt/TTFP/).

# Andere interessante Themen

## Parametricity, ad-hoc vs. parametric polymorphism, free theorems

- [Parametricity](tony_parametricity.pdf).

- [TeX Quellen](https://github.com/tonymorris/parametricity/) für den Vortrag
  von oben.

- [Making ad-hoc polymorphism less ad-hoc](http://swizec.com/blog/week-20-making-ad-hoc-polymorphism-less-ad-hoc/swizec/6564).

- [Theorems for Free!](http://ttic.uchicago.edu/~dreyer/course/papers/wadler.pdf).

## Initial und Final, DSLs, Finally Tagless

- [Final Encodings, Part 1: A Quick Demonstration](http://creativelad.wordpress.com/2013/11/28/final-encodings-part-1-a-quick-demonstration/).

- [Transforming Polymorphic Values](http://martijn.van.steenbergen.nl/journal/2009/10/18/transforming-polymorphic-values/).

- [GADTs in Haskell 98](http://martijn.van.steenbergen.nl/journal/2009/11/12/gadts-in-haskell-98/).

- [Typed Tagless-Final Linear Lambda Calculus](https://www.fpcomplete.com/user/mutjida/typed-tagless-final-linear-lambda-calculus).

- [Typed tagless-final interpretations: Lecture notes](http://okmij.org/ftp/tagless-final/course/course.html).

- [Typed Tagless Final Interpreters](http://okmij.org/ftp/tagless-final/course/lecture.pdf).

- [The dog that didn't bark](http://existentialtype.wordpress.com/2011/03/21/the-dog-that-didnt-bark/) nicht unbedingt relevant aber interessant.

## Comonads

- [Comonads in Haskell](https://speakerdeck.com/dmoverton/comonads-in-haskell).

- [Stackoverflow Frage: Can a Monad be a Comonad](http://stackoverflow.com/questions/16551734/can-a-monad-be-a-comonad).

## Yoneda / CoYoneda

- [Stackoverflow Frage: Step-by-step explanation of coyoneda](http://stackoverflow.com/questions/24000465/step-by-step-deep-explain-the-power-of-coyoneda-preferably-in-scala-throu).

- Free monads for Less, eine Reihe von drei Artikeln von Edward Kmett
  * [Part 1: Codensity](http://comonad.com/reader/2011/free-monads-for-less/).
  * [Part 2: Yoneda](http://comonad.com/reader/2011/free-monads-for-less-2/).
  * [Part 3: Yielding IO](http://comonad.com/reader/2011/free-monads-for-less-3/).

## Propositions vs. Judgments (computation)

- [StackExchange Frage: What is the difference between propositions and judgements](http://cstheory.stackexchange.com/questions/9826/what-is-the-difference-between-propositions-and-judgments).

- [Vorlesungs Notizen eines kurzen, dreiteiligen Kurses](http://www.ae-info.org/attach/User/Martin-L%C3%B6f_Per/OtherInformation/article.pdf)

# Dependent typing

- [Grokking sum types, value constructors, and type constructors](http://bitemyapp.com/posts/2014-04-05-grokking-sums-and-constructors.html) squint hard.

- [Lightweight Dependent-type Programming](http://okmij.org/ftp/Computation/lightweight-dependent-typing.html).

- [Idris programming language](http://www.idris-lang.org/).

# Statisch gelinkte Binaries

- [Static linking](https://wiki.haskell.org/Web/Literature/Static_linking)

- [Static linking with GHC on Arch Linux](http://www.edofic.com/posts/2014-05-03-ghc-arch-static.html)

- [Statically linking Linux binaries for ARM & MIPS](http://stackoverflow.com/questions/14270177/ghc-statically-linking-linux-binaries-for-arm-mips-processors)

- [Statically link GMP using GHC and LLVM](http://stackoverflow.com/questions/10539857/statically-link-gmp-to-an-haskell-application-using-ghc-llvm)

## Dialog

> In diesem Repository zu finden, siehe [hier](dialogues.md).

Die sind eigentlich sehr wichtig und hilfreich. Schaue hier für tiefere Einblicke
in eine Vielzahl von Themen.
