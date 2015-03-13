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