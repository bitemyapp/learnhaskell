# Le Guide

Ceci est ma façon recommandée d'apprendre Haskell.


#### Quelque chose à garder en tête: *ne bloquez pas sur les points que vous ne comprenez pas immédiatement*. Continuez à avancer.

## Communauté

Notre canal IRC est `#haskell-beginners` sur Freenode.

Un client web IRC [ici](http://webchat.freenode.net/).

Les [listes de diffusion](https://wiki.haskell.org/Mailing_lists) Haskell.

### Règles d'usage de la communauté

[Voir le post sur l'enseignement de Chris Done](http://chrisdone.com/posts/teaching)

Soyez gentils et courtois. Etre méchant ou désagréable fait peur aux autres et ne les encourage pas à participer.

Une critique pour le plaisir de critiquer ne sert que la personne qui la fait, pas celle qui la reçoit.

Ne décrivez pas quelquechose comme "facile" ou "trivial". Vous créeriez un malaise chez ceux qui doivent travailler plus durement pour progresser. Les personnes qui apprennent lentement sont souvent celles qui font un apprentissage plus approfondi, c'est quelque chose que nous devons célébrer et encourager !

Ne pas feindre la surprise. N'ayez pas l'air surpris lorsque quelqu'un affirme ne pas savoir quelque chose. La personne se sentira mal et vous n'aurez rien accompli mis à part flatter votre égo.

Pas de "en fait…". Lorsqu'une personne dit quelque chose de presque - mais pas entièrement - correct, et vous répondez, "Ouais… en fait…" puis les corrigez. C'est particulièrement gênant lorsque la correction n'a aucune incidence sur la conversation actuelle. Cela ne signifie pas que Recurse Center ne se soucie pas de la recherche de la vérité ou que nous ne nous soucions pas d'être précis. Presque tous les "Ouais… en fait…" sont un moyen de se mettre en valeur, et non de la recherche de la vérité.

Pas de conduite accompagnée. Si vous voyez des personnes buter sur un problème, vous ne devez pas immédiatement donner des conseils. Laissez travailler dessus à moins que quelqu'un demande de l'aide. Eviter les interruptions est [un des objectifs fondateurs du canal #haskell-beginners](http://chrisdone.com/posts/teaching).

Pas de -ismes. Racisme, sexisme, homophobie, transphobie, et autres biais ne sont pas bienvenus et ne seront pas tolérés.

---

Recommandations du [manuel de the Recurse Center](https://www.recurse.com/manual). Merci de l'avoir publié Recurse Center.

# Qu'est ce que Haskell, GHC, et Cabal?

Haskell est un langage de programmation, défini par une spécification, la plus récente datant de 2010. Celle-ci est disponible [en ligne](http://www.haskell.org/onlinereport/haskell2010/).

## GHC

[GHC](http://www.haskell.org/ghc/) est le moyen le plus populaire de travailler avec le langage Haskell. Il inclut un compilateur, un REPL (interpréteur), la gestion de paquets, et plus encore.

## Cabal

[Cabal](https://www.haskell.org/cabal/download.html) s'occupe de la gestion du projet et de la résolution des dépendances. C'est lui qui aide à l'installation de projets, typiquement dans leurs propres bac à sable.

Cabal est l'équivalent de Bundler pour Ruby, de pip pour Python, de NPM pour Node, Maven, etc. GHC gère le packaging lui-même, Cabal choisit quelles versions doivent être installées.

# Mise en place

## Ubuntu

[Ce PPA](http://launchpad.net/~hvr/+archive/ghc) est excellent. C'est ce que j'utilise sur toutes mes machines Linux dédiées au développement.

Plus précisément:

```bash
$ sudo apt-get update
$ sudo apt-get install python-software-properties # v12.04 and below
$ sudo apt-get install software-properties-common # v12.10 and above
$ sudo add-apt-repository -y ppa:hvr/ghc
$ sudo apt-get update
$ sudo apt-get install cabal-install-1.20 ghc-7.8.3 happy-1.19.4 alex-3.1.3
```

Après, ajoutez ce qui suit à votre `$PATH` (bash\_profile, zshrc, bashrc, etc.) :

```
~/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.3/bin:/opt/happy/1.19.4/bin:/opt/alex/3.1.3/bin
```

*Optionnel:* Vous pouvez aussi ajouter `.cabal-sandbox/bin` à votre _path_.
Ainsi, vous aurez accès au code que vous serez en train de développer directement
en ligne de commandes. Cela ne marchera que si votre répertoire de travail actuel
contient un _bac à sable_ cabal.

## Debian

### Utiliser le PPA d'Ubuntu

Si vous n'utilisez pas la version stable, vous pouvez suivre les mêmes étapes
que pour Ubuntu mais vous aurez besoin d'exécuter un commande supplémentaire.
Immédiatement après l'exécution de `sudo add-apt-repository -y ppa:hvr/ghc`,
lancez:

```bash
$ sudo sed -i s/jessie/trusty/g /etc/apt/sources.list.d/hvr-ghc-jessie.list
```

Pour les autres versions de Debian, il suffit de remplacer les occurrences de
`jessie` par le nom de votre version dans la commandes ci-dessus.

Si, pour une raison quelconque, le fichier
`/etc/apt/sources.list.d/hvr-ghc-jessie.list` n'existe pas, alors
`/etc/apt/sources.list` devrait contenir une ligne de ce genre:

    deb http://ppa.launchpad.net/hvr/ghc/ubuntu jessie main

Remplacez alors `jessie` par `trusty` dans cette ligne.

### Compilation depuis les sources

Vous pouvez suivre
[ce guide](http://www.davesquared.net/2014/05/platformless-haskell.html)
écrit pour Mac OS X:

Notes:

- Configurez votre préfixe de manière adéquate lorsque vous configurez ghc.
- Au lieu de récupérer l'exécutable de `cabal-install`, récupérez les sources
et ensuite lancez le script `bootstrap.sh`.

## Fedora 21

Pour installer Haskell 7.8.4 depuis le dépôt non-officiel
(Fedora 22+ l'inclura dans l'officiel) :

```bash
$ sudo yum-config-manager --add-repo \
> https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/repo/fedora-21/petersen-ghc-7.8.4-fedora-21.repo
$ sudo yum install ghc cabal-install
```

Comme indiqué dans
[la page copr petersen/ghc-7.8.4](https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/)
cette version de ghc ne peut pas être installée en même temps que la version
Fedora/EPEL de ghc.

## Arch Linux

Pour installer Haskell depuis le dépôt officiel d'Arch Linux, lancez:

```bash
$ sudo pacman -S cabal-install ghc happy alex haddock
```

## Gentoo

Sur Gentoo, vous pouvez installer les différents composants de la plateforme
Haskell depuis Portage. Si vous utilisez `ACCEPT_KEYWORDS=arch` (par opposition à
`ACCEPT_KEYWORDS=~arch`), Portage installera d'anciennes versions des différents
composants Haskell. Maintenant que vous avez ça en tête, si et seulement si vous
utilisez `ACCEPT_KEYWORDS=arch`, ajoutez ce qui suit à
`/etc/portage/package.keywords`.

    dev-haskell/cabal-install
    dev-lang/ghc

Une fois que cela est fait,

```bash
$ emerge -jav dev-lang/ghc dev-haskell/cabal-install
```

Gentoo garde une version "stable" (comprenez: vieille) de `cabal-install`
dans la hiérarchie de Portage. Donc vous allez devoir utiliser
`cabal-install` pour installer la dernière version. Notez que les backslashes
sont intentionnels dans ce qui suit.

```bash
$ \cabal update                # Les  backslashes
$ \cabal install cabal-install # sont intentionnels
```

Vous avez maintenant installé cabal au niveau global avec portage, et dans votre
répertoire personnel avec `cabal-install`. L'étape suivante est de s'assurer que
quand vous lancez `cabal` dans un terminal, votre shell lancera la version à jour
dans votre répertoire personnel. Vous allez donc devoir ajouter les lignes
suivantes à votre fichier de configuration du shell :

```bash
PATH=$PATH:$HOME/.cabal/bin
alias cabal="$HOME/.cabal/bin/cabal"
```

Si vous ne savez quel est votre shell, il y a de fortes chances que ce soit
Bash. Si vous utilisez Bash, le fichier à modifier est `~/.bashrc`. Si vous
utilisez Z-shell, il s'agit du fichier `~/.zshrc`. Vous pouvez lancer la commande
suivante pour savoir quel est votre shell :

```bash
echo $SHELL | xargs basename
```

J'utilise zsh, donc cette commande renvoie `zsh` quand je la lance.

Une fois que vous avez fait tout cela, vous allez devoir installer les outils
complémentaires `alex` et `happy`.

```bash
$ cabal install alex happy
```

Félicitations ! Vous avez maintenant une installation de Haskell en état de marche !

## Mac OS X

### 10.9

Installez l'app [GHC pour Mac OS X](http://ghcformacosx.github.io/) qui inclus
GHC et Cabal. Elle vous indiquera comment ajouter GHC et cabal à votre path
après que vous ayez déposé le `.app` quelque part.

### 10.6-10.8

Faites l'installation décrite ci-dessus avec cette [archive](https://www.haskell.org/platform/download/2014.2.0.0/ghc-7.8.3-x86_64-apple-darwin-r3.tar.bz2).

## Windows

- L'[installeur minimal pour GHC](http://neilmitchell.blogspot.com/2014/12/beta-testing-windows-minimal-ghc.html)
est capable de compiler `network` et les autres. Techniquement, il s'agit d'une
beta mais cela devrait répondre au besoin de quiconque lira ce guide.

N'oubliez pas de lancer l'installation en tant qu'administrateur puisque le
programme cherchera à s'installer dans votre répertoire Program Files.

## Utilisateurs d'autres versions de Linux

Téléchargez la dernière version des exécutables pour cabal et ghc

- [GHC](http://www.haskell.org/ghc/).

- [Cabal](https://www.haskell.org/cabal/download.html).


# Cours de base

## Le cours cis194 de Yorgey

> *Faites le en premier*, c'est la principale introduction à Haskell que je recommande.

Disponible [en ligne](http://www.seas.upenn.edu/~cis194/spring13/lectures.html).

Le cours de [Brent Yorgey](https://byorgey.wordpress.com) est le meilleur que j'ai trouvé jusque là.
Ce cours vous donnera les bases pour écrire du code en Haskell mais vous
aidera aussi à comprendre les combinateurs d'analyse (parser combinators).

La seule raison pour laquelle vous ne devriez pas commencer avec cis194 est si vous n'êtes pas un
développeur ou inexpérimenté. Si c'est le cas, commencez par le
[livre de Thompson](http://www.haskellcraft.com/craft3e/Home.html) puis enchainez avec cis194.

---

## Le cours NICTA

> C'est le cours que je recommande après avoir suivi le cours cis194 de Yorgey

Disponible sur github [ici](https://github.com/NICTA/course).

Ce cours va renforcer vos connaissances et vous fera acquérir de l'experience en
implémentant directement les abstractions introduites dans le cis194, c'est un
exercice *capital* pour être à l'aise avec les usages habituels des
Functors/Applicatives/Monades/etc. en Haskell. Suivre les cours cis194 puis
NICTA est la recommendation principale de mon guide et c'est comme ca que
j'enseigne Haskell à tout le monde.

---

## Cours supplémentaire cs240h

> Fournit plus de matière sur des sujets intermédiaires

Disponible [en ligne](http://www.scs.stanford.edu/14sp-cs240h/).

C'est la version en ligne du cours de [Bryan O'Sullivan](https://github.com/bos)
enseigné à Stanford. Si vous ne savez qui il est, jetez un coup d'oeil à la moitié
des libraries utilisées par les applications Haskell, son nom y figure. À regarder de
plus près, si vous avez déjà fait le cours de Yorgey, les modules sur les
types fantômes, les contrôles des flux d'informations, les extensions de language,
la concurrence, les pipes, et les lenses.

---

### Que sont les sucres syntactiques `<-` / `do` / comprehension de listes ?

Un [article](http://www.haskellforall.com/2014/10/how-to-desugar-haskell-code.html) excellent.

### Pour comprendre list et fold

- [Comprendre List et Folds](http://vimeo.com/64673035)

### Pour apprendre quelques typeclasses courantes

Utile pour comprendre `Functor`, `Applicative`, `Monad`, `Monoid` et autres
typeclasses en général mais aussi un peu de théorie des catégories spécifique
à Hask:

- La [Typeclassopedia](http://www.haskell.org/haskellwiki/Typeclassopedia)

### Comprendre les messages d'erreur standards d'Haskell

- [Comprendre les messages d'erreur standards](http://ics.p.lodz.pl/~stolarek/_media/pl:research:stolarek_understanding_basic_haskell_error_messages.pdf)

---

# Evaluation stricte et paresseuse, _guarded recursion_

- Le [livre](http://chimera.labs.oreilly.com/books/1230000000929/ch02.html)
écrit par Marlow au sujet du parallélisme et de la concurrence est une des
meilleures introduction au sujet de l'évaluation paresseuse et des formes
normales que j'ai trouvé. N'hésitez pas à utiliser d'autres ressources si
vous n'accrochez pas immédiatement à celle ci.

- [Des points en plus pour l'evaluation paresseuse](http://augustss.blogspot.hu/2011/05/more-points-for-lazy-evaluation-in.html)

- [Oh ma paresse !](http://alpmestan.com/posts/2013-10-02-oh-my-laziness.html)

- Question sur SO : '[Haskell a-t-il une évaluation paresseuse ?](http://stackoverflow.com/questions/13042353/does-haskell-have-tail-recursive-optimization)'

- les slides de [Johan Tibell](https://github.com/tibbe) tirés d'une présentation
intitulée [raisonner avec l'évaluation paresseuse](http://www.slideshare.net/tibbe/reasoning-about-laziness).

## Brève démonstration

```haskell
let a = 1 : a   -- guarded recursion, (:) est évalué paresseusement
let (v : _) = a -- et on peut lui appliquer du pattern matching
> v
1
> head a -- head a == v
1

let a = 1 * a -- not guarded, (*) is strict
> a
*** Exception: <<loop>>
```

# IO

- [Ordre d'évaluation et jetons d'états](https://www.fpcomplete.com/user/snoyberg/general-haskell/advanced/evaluation-order-and-state-tokens)

- [Révéler les mystères de la monade IO](http://blog.ezyang.com/2011/05/unraveling-the-mystery-of-the-io-monad/).

- ["instructions" du premier ordre](http://blog.jle.im/entry/first-class-statements).

- [Haddocks pour System.IO.Unsafe.unsafePerformIO](http://hackage.haskell.org/package/base-4.7.0.1/docs/System-IO-Unsafe.html#v:unsafePerformIO)
  Lisez la documentation et remarquez l'implémentation de `unsafeDupablePerformIO`

Commentaire sur un fil Reddit de `glaebhoerl` :

> Une intéressante note annexe: GHC a besoin de cacher la représentation du
> jeton d'état derrière un type abstrait IO car le jeton d'état doit toujours
> être utilisé linéairement (il ne doit pas être dupliqué ou abandonné), mais
> son système de types ne peut l'imposer. Clean, un autre langage paresseux
> à la Haskell, a des types uniques (qui sont des types linéaires et qui sont
> peut être différents sur d'autre points que j'ignore). Ils exposent le passage
> du Monde explicitement et proposent une monade IO (non-abstraite) uniquement
> pour plus de commodités.

# Monades et transformateurs de monades

> Ne faites pas ça avant de comprendre les typeclasses, Monoid, Functor et
> Applicative !

Implémenter les monades de la librairie standard (List, Maybe, Cont, Error,
Reader, Writer, State) par vous-même afin de mieux les comprendre. Après, vous
pouvez peut-être écrire un interpréteur monadique pour un langage avec des petites
expressions en utilisant le papier sur les
[transformateurs de monades étape par étape](http://catamorph.de/documents/Transformers.pdf)
(mentionné dans la section "transformateurs de monades" ci-dessous).

Écrire plusieurs interpréteurs en changeant juste le Monde pour changer les
sémantiques peut aider à comprendre ce qui se passe.

- [Cette présentation](https://vimeo.com/73648150) de Tony justifie avec brio
l'utilité des transformateurs de monades. Les slides sont également
[disponibles](https://dl.dropboxusercontent.com/u/7810909/talks/monad-transformers/cbaa991e0eb49224eb286c1e418e2b9828e1fb21/monad-transformers.pdf).

De la même manière, ré-implémenter `Control.Monad`. Des fonctions comme `mapM`
ou `sequence` sont de bonnes opportunités pour s'entrainer à écrire du code
monadique.

Le cours du NICTA peut être utilisé comme un guide lors de ce processus,
guide qui vous demandera également d'écrire vos propres Applicatives.

Crédits:

- Commentaires de htmltyp et Crandom sur Reddit
[ici](http://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5aj6).

- Commentaire de jozefg
[ici](http://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5trg).

# Test, spécifications, tests de propriétés (tests par génération)

- Ce [tutoriel](https://github.com/kazu-yamamoto/unit-test-example/blob/master/markdown/en/tutorial.md)
de Kazu Yamamoto est fantastique.

- [Simple-Conduit](https://github.com/jwiegley/simple-conduit): Une bonne librairie simple pour apprendre comment le streaming d'IO fonctionne en général. Les connaissances acquises ici sont transférables à Pipes et Conduit.
 
# Parsing en Haskell

- [Tutoriel](https://github.com/JakeWheat/intro_to_parsing) sur les parser
combinators en Haskell utilisant Parsec.

- [Ecrivez votre propre micro-Parsec](http://olenhad.me/articles/monadic-parsers/)

## Parsing et génération de JSON

Aeson est la solution standard de parsing de [JSON](https://json.org) en haskell.
Disponible sur [hackage](https://hackage.haskell.org/package/aeson) et
[github](https://github.com/bos/aeson).

- [Parser du JSON avec Aeson](http://blog.raynes.me/blog/2012/11/27/easy-json-parsing-in-haskell-with-aeson/)

- [Aeson et les types personalisés](http://bitemyapp.com/posts/2014-04-11-aeson-and-user-created-types.html)

- [Parser des données non-deterministiques avec aeson et les types sum](http://bitemyapp.com/posts/2014-04-17-parsing-nondeterministic-data-with-aeson-and-sum-types.html)

- [tutoriel Aeson](https://www.fpcomplete.com/school/starting-with-haskell/libraries-and-frameworks/text-manipulation/json)

# Algorithmes de graphes et structures de données

- Le [package fgl](https://hackage.haskell.org/package/fgl) en particulier
  le plus court chemin purement fonctionnel [algos](http://hackage.haskell.org/package/fgl-5.4.2.2/docs/Data-Graph-Inductive-Query-SP.html).

- [Graphes inductifs et Algorithmes de Graphes Fonctionnels](http://web.engr.oregonstate.edu/~erwig/papers/abstracts.html#JFP01).

- [FGL/Haskell - Une bibliothèque de Graphes Fonctionnels](http://web.engr.oregonstate.edu/~erwig/fgl/haskell/old/fgl0103.pdf).

- [source de Data.Graph extraite du package Containers](http://hackage.haskell.org/package/containers-0.5.5.1/docs/Data-Graph.html).

- Le [package graphs](https://hackage.haskell.org/package/graphs).

- [une question SO sur PHOAS](http://stackoverflow.com/questions/24369954/separate-positive-and-negative-occurrences-of-phoas-variables-in-presence-of-rec)

- [un article sur PHOAS](https://www.fpcomplete.com/user/edwardk/phoas).

- [Attacher le noeud](http://www.haskell.org/haskellwiki/Tying_the_Knot).

- [Hackage: dag](https://hackage.haskell.org/package/dag).

# Environment de développement

## Emacs

- [le tutoriel d'Alejandro Serras](https://github.com/serras/emacs-haskell-tutorial/blob/master/tutorial.md)

- [Mes dotfiles](https://github.com/bitemyapp/dotfiles/)

- [la config emacs de Chris Done](https://github.com/chrisdone/chrisdone-emacs)

## Vim

- [la page Vim sur haskellwiki](http://www.haskell.org/haskellwiki/Vim)

- [Haskell-vim-now](https://github.com/begriffs/haskell-vim-now)

- [GHC-Mod](https://github.com/kazu-yamamoto/ghc-mod)

- [plugin vim GHC-Mod](https://github.com/eagletmt/ghcmod-vim)

- [Hindent](https://github.com/chrisdone/hindent)

## Sublime Text

- [SublimeHaskell](https://github.com/SublimeHaskell/SublimeHaskell)

# Utilisation de Cabal

## Recommandations pour Cabal

L'enfer de Cabal était un problème pour les utilisateurs d'Haskell avant
l'introduction des bacs à sable. Une installation en dehors d'un bac à sable se
fera dans le package-db de l'utilisateur. Ce n'est *pas* une bonne idée mis à part
pour quelques librairies fondamentales comme Cabal, alex, et happy. Rien d'autre ne
devrait être installé dans le package-db de l'utilisateur ou le global à moins que
vous ne sachiez ce que vous faites.

Quelques bonnes pratiques pour éviter l'enfer de cabal sont disponibles
[ici](http://softwaresimply.blogspot.com/2014/07/haskell-best-practices-for-avoiding.html).

Pour faire des expérimentation avec un package ou démarrer un projet, commencez
par `cabal sandbox init` dans un nouveau dossier.

Pour résumer:

- Toujours utiliser des bacs à sable pour installer de nouveaux packages, créer des
  projets, ou démarrer des experimentations

- Utiliser `cabal repl` pour démarrer une instance ghci dans un projet

L'approche basée sur les bacs à sable que je suggère permet d'éviter les problèmes
liés à la gestion des dépendances des packages, mais elle n'est pas compatible avec
les packages pré-construits fournis par Haskell Platform.
Si vous apprenez Haskell et ne comprenez pas comment ghc-pkg et Cabal fonctionnent,
*évitez platform* et utilisez les instructions préalables du guide à la place.

## Stackage

Pour les utilisateurs (de Yesod généralement) qui ont des problèmes de build, considérez Stackage.

- Un bon résumé de ce qu'est Stackage
  [ici](https://www.fpcomplete.com/blog/2014/05/stackage-server).

L'auteur estime que Stackage est généralement plus utile que `cabal freeze`.

# Hoogle et Haddock

## Chercher du code à partir de la signature des types

Le [moteur de recherche Hoogle](http://www.haskell.org/hoogle/) permet des
recherches par type.

Par exemple, le résultat d'une recherche avec `(a -> b) -> [a] -> [b]`
sont disponibles [ici](http://www.haskell.org/hoogle/?hoogle=%28a+-%3E+b%29+-%3E+%5ba%5d+-%3E+%5bb%5d).

Hoogle est également hébergé par fpcomplete
[ici](https://www.fpcomplete.com/hoogle).

Il existe aussi [Hayoo](http://holumbus.fh-wedel.de/hayoo/hayoo.html) (qui
contient tout hackage par défaut).

## Mettre en place propre instance local de Hoogle

Vous pouvez regarder [ici](https://gist.github.com/bitemyapp/3e6a015760775e0679bf).

## Haddock

1. [Réparer votre documentation Hackage](http://fuuzetsu.co.uk/blog/posts/2014-01-06-Fix-your-Hackage-documentation.html)

2. [La v2 de la documentation de Hackage](http://fuuzetsu.co.uk/blog/posts/2014-01-06-Hackage-documentation-v2.html)

Notez que ces billets sont *légèrement obsolètes*: par exemple, Hackage contient
maintenant de nouvelles informations concernant la documentation et le statut
du build.

## Ce que vous avez vraiment besoin de savoir

Afin qu'Haddock inclue la documentation des paquets référencés, vous devez
mettre `documentation: True` dans votre `~/.cabal/config`. Si vous avez laissé la valeur
par défaut (`False`) ou l'avez délibérément définie comme `False`, vous devrez
supprimer tous vos paquets et les réinstaller avant de générer des haddocks.

Une autre chose que vous devez garder en tête est que comme le paramètre `$pkg`
est interprété *par* cabal, et non par vous, les paramètres `html-location` et
`content-location` *doivent être entourés de guillemets simples* et entrés dans
un shell ou contenus dans un script shell. Ils ne fonctionneront pas dans un Makefile,
car on pensera alors qu'il s'agit de variables pour Make.

```bash
#! /usr/bin/env sh

# Vous pouvez écrire ceci ligne par ligne en omettant les backslashes
cabal haddock --hoogle --hyperlink-source                       \
 --html-location='http://hackage.haskell.org/package/$pkg/docs' \
 --contents-location='http://hackage.haskell.org/package/$pkg'
```

# TravisCI

Si vous êtes comme moi un grand fan de [TravisCI](https://travis-ci.org), je
vous recommande alors *fortement* de jeter un oeil à
[multi-ghc-travis](https://github.com/hvr/multi-ghc-travis) pour avoir une base
de fichier `travis.yml` pour vos projets Haskell.

# Frontend/JavaScript

Nous avons des problèmes de riches ! Voilà les trois principaux choix que je
peux recommander:

* [Haste](http://haste-lang.org/) un compilateur de Haskell vers JavaScript
  - Le [compilateur](https://github.com/valderman/haste-compiler) sur github.
  - Une excellente
    [démo](http://www.airpair.com/haskell/posts/haskell-tutorial-introduction-to-web-apps)
    de Haste avec un exemple de projet.

* [GHCJS](https://github.com/ghcjs/ghcjs)
  - [Introduction à GHCJS](http://weblog.luite.com/wordpress/?p=14)
  - [Des interfaces web réactives avec GHCJS and Sodium](http://weblog.luite.com/wordpress/?p=127)
  - [Écrire des extensions Atom en Haskell en utilisant ghcjs](http://edsko.net/2015/02/14/atom-haskell/)

* [PureScript](http://www.purescript.org/)
  - Pas strictement du Haskell comme Haste and GHCJS, mais un choix populaire
    chez les Haskellers.
  - Écrit en et inspiré par Haskell.
  - Essayez PureScript dans votre navigateur [ici](http://try.purescript.org/)
  - Un très bon guide pour [démarrer](http://www.christopherbiscardi.com/2014/06/22/getting-started-with-purescript/)

## Quel langage frontend utiliser ?

GHCJS et Haste sont tous deux du pur Haskell. GHCJS marchera avec de plus
nombreux paquets Haskell que Haste, mais cela n'impacte pas un grand nombre
de projets frontend. PureScript n'est pas du tout du Haskell, donc un partage
direct du code avec votre backend ne fonctionnera pas.

GHCJS a le plus gros coût en terme de poids, avec environ 100ko (Luite
travaille sur ce point). Haste et PureScript sont compétitifs.

PureScript a la meilleure intégration dans la suite d'outils javascript (il
utilise gulp/grunt/bower), GHCJS et Haste s'intègrent mieux avec les outils
Haskell (Cabal).

Les trois sont de très bons choix et sont adaptés à la plupart des projets
frontend.

# Pour mieux comprendre l'évaluation paresseuse, NF, WHNF

- [Notes sur lambda-calcul](https://vec.io/posts/notes-on-lambda-calculus).

## Documents de recherche sur le lambda-calcul paresseux

- [La nécessité du lambda-calcul](http://homepages.inf.ed.ac.uk/wadler/topics/call-by-need.html#need-journal).

- [Démonstration de la réduction avec lambda-calcul](http://www.itu.dk/~sestoft/papers/sestoft-lamreduce.pdf)

- [Le lambda-calcul paresseux](http://www.cs.ox.ac.uk/files/293/lazy.pdf).

- [Evaluation paresseuse en Haskell](http://www.vex.net/~trebla/haskell/lazy.xhtml)

# Parallelisme / Concurrence

- [Programmation Parallele et Concurrente en Haskell](http://chimera.labs.oreilly.com/books/1230000000929)
  Ce livre de Simon Marlow est probablement le meilleur que j'ai lu sur le sujet du parallélisme et de
  la concurrence.

- Un [pas à pas](http://kukuruku.co/hub/haskell/haskell-testing-a-multithread-application) complet
  sur les tests et le développement incrémental d'une application multi-threadée en Haskell.

- [Programmation Fonctionnelle Réactive](http://www.haskell.org/haskellwiki/Functional_Reactive_Programming)

# Lenses et Prisms

Une fois que êtes confortables avec Haskell, vous devriez considérer fortement l'apprentissage
des Lenses et Prisms, même en tant que simple "utilisateur". Vous n'avez pas besoin de comprendre
la catégorie sous-jascente pour que cela vous soit utile.

Les gens sur-estiment grandement la difficulté d'utiliser les Lens. Quiconque confortable
avec Functor/Foldable/Traversable (ou juste le premier) peux utiliser les
lenses et prisms et se simplifier la vie.

Si vous avez déjà fait quelque chose comme: `(fmap . fmap)` vous étiez en train de "lenser" dans votre tête.

Je recommande ces deux tutoriels / introductions:

- [Un petit tutoriel sur Lens pour commencer](https://www.fpcomplete.com/school/to-infinity-and-beyond/pick-of-the-week/a-little-lens-starter-tutorial)

- [Lens: Lenses, Folds et Traversals](https://github.com/ekmett/lens#lens-lenses-folds-and-traversals)

Regardez ici pour plus d'informations: [Lens package on hackage](http://hackage.haskell.org/package/lens).

# Schémas de récursion

Certains des mots en \*-morphisme dont vous avez entendu parler jusque là renvoient à la
récursion. NB - avant de vous attaquer à la suite vous devriez savoir comment implementer
foldr pour des listes et au moins une autre structure de données, comme les arbres. (les folds
sont des catamorphismes) Savoir comment implementer un unfold (anamorphisme) pour les même structures
devrait clarifier un peu les choses.

Ces documents se limitent aux traversables et foldables.

- [Une introduction aux schémas de récursion](http://patrickthomson.ghost.io/an-introduction-to-recursion-schemes/)

- [N'ayez pas peur du chat](http://fho.f12n.de/posts/2014-05-07-dont-fear-the-cat.html) (un jeu de mot entre "cat" (chat) et le prefixe cata) -
  Une bonne démonstration sur comment l'hylomorphisme est une composition de cata et ana.

- [Schémas de Récursion](http://comonad.com/reader/2009/recursion-schemes/) - Ce
  guide pratique est excellent.

- [Programmation Fonctionnelle avec des Bananes, des Lenses, des Enveloppes et du Fil barbelé](http://eprints.eemcs.utwente.nl/7281/01/db-utwente-40501F46.pdf)

- [Catamorphismes](https://www.fpcomplete.com/user/edwardk/recursion-schemes/catamorphisms)

# GHC Core et tuning de performance

- [Ecrire du Haskell aussi rapide que du C](write_haskell_as_fast_as_c.md)

- [GHC Wiki: le Type CoreSyn](https://ghc.haskell.org/trac/ghc/wiki/Commentary/Compiler/CoreSynType).

- [Hackage: GHC Core](https://hackage.haskell.org/package/ghc-core).

- [Question sur SO: Lire GHC Core](http://stackoverflow.com/questions/6121146/reading-ghc-core).

- [Haskell aussi rapide que du C](http://donsbot.wordpress.com/2008/06/04/haskell-as-fast-as-c-working-at-a-high-altitude-for-low-level-performance/).

- [Real World Haskell, Chapitre 25: Profilage and Optimisations](http://book.realworldhaskell.org/read/profiling-and-optimization.html).

# Type et Théorie des Catégories

> *Pas* nécessaire pour écrire du Haskell, juste pour ceux intéressés !

Si vous voulez en apprendre plus sur les types et la théorie des catégories:

- [Le guide de Catster](http://byorgey.wordpress.com/2014/01/14/catsters-guide/) et
  [Le guide de Catster 2](http://byorgey.wordpress.com/catsters-guide-2/)

- Le [wikibook haskell](http://en.wikibooks.org/wiki/Haskell/Category_theory)
  a de beaux diagrammes.

- [Théorie des Catégories](http://www.haskell.org/haskellwiki/Category_theory) sur
  haskellwiki, dispose de bons liens vers d'autres ressources.

- [Categories à partir de rien](http://science.raphael.poss.name/categories-from-scratch.html), inclus des exemples concrets.

- La liste [Superbes travaux sur les languages de programmation](http://www.cis.upenn.edu/~bcpierce/courses/670Fall04/GreatWorksInPL.shtml) de Pierce.

## Livres

- [Question sur Quora: Quel est le meilleur livre sur la théorie des catégories ?](http://www.quora.com/Category-Theory/What-is-the-best-textbook-for-Category-theory?share=1) les recommandations de Kmett

- [Awodey](http://ukcatalogue.oup.com/product/9780199237180.do) et
  [MacLane](http://www.amazon.com/Categories-Working-Mathematician-Graduate-Mathematics/dp/0387984038). Les livres de référence sur la théorie des catégories.

- [Fondations Pratiques pour les Languages de Programmation de Harper](http://www.cs.cmu.edu/~rwh/plbook/book.pdf) est la meilleure introduction à la théorie des catégories d'un point de vue des languages de programmation.

- [La théorie des Types et la Programmation Functionnelle](http://www.cs.kent.ac.uk/people/staff/sjt/TTFP/).

# Autres sujets amusants

## Paramétricité, ad-hoc vs. polymorphisme paramétrique, théorèmes libres

- [Paramétricité](tony_parametricity.pdf).

- [Les sources TeX](https://github.com/tonymorris/parametricity/) du
  talk ci-dessus.

- [Rendre le polymorphisme ad-hoc moins ad-hoc](http://swizec.com/blog/week-20-making-ad-hoc-polymorphism-less-ad-hoc/swizec/6564).

- [Théorèmes gratuits !](http://ttic.uchicago.edu/~dreyer/course/papers/wadler.pdf).

## Initial et Final, les DSL, Finally Tagless

- [Encodages finaux, Partie 1: Une Démonstration rapide](http://creativelad.wordpress.com/2013/11/28/final-encodings-part-1-a-quick-demonstration/).

- [Transformer des valeurs Polymorphiques](http://martijn.van.steenbergen.nl/journal/2009/10/18/transforming-polymorphic-values/).

- [Les GADT en Haskell 98](http://martijn.van.steenbergen.nl/journal/2009/11/12/gadts-in-haskell-98/).

- [Lambda-calcul linéaire Typed Tagless-Final](https://www.fpcomplete.com/user/mutjida/typed-tagless-final-linear-lambda-calculus).

- [Interprétations de Typed tagless-final: notes de Lecture](http://okmij.org/ftp/tagless-final/course/course.html).

- [Les interpréteurs Typed Tagless Final](http://okmij.org/ftp/tagless-final/course/lecture.pdf).

- [Le chien qui n'aboyait pas](http://existentialtype.wordpress.com/2011/03/21/the-dog-that-didnt-bark/) moins spécifique mais intéressant tout de même.

## Co-monades

- [Co-monades en Haskell](https://speakerdeck.com/dmoverton/comonads-in-haskell).

- [question sur SO: Est-ce qu'une monade peut être une co-monade ?](http://stackoverflow.com/questions/16551734/can-a-monad-be-a-comonad).

## Yoneda / Co-Yoneda

- [question sur SO: explication pas-à-pas de co-yoneda](http://stackoverflow.com/questions/24000465/step-by-step-deep-explain-the-power-of-coyoneda-preferably-in-scala-throu).

- Free monads for Less, une séquence de trois articles par Edward Kmett
  * [Partie 1: Co-densité](http://comonad.com/reader/2011/free-monads-for-less/).
  * [Partie 2: Yoneda](http://comonad.com/reader/2011/free-monads-for-less-2/).
  * [Partie 3: Yielding IO](http://comonad.com/reader/2011/free-monads-for-less-3/).

## Propositions vs. Jugements (informatique)

- [une question sur StackExchange: Quelle est la difference entre les propositions et les jugements ?](http://cstheory.stackexchange.com/questions/9826/what-is-the-difference-between-propositions-and-judgments).

- [Notes de lecture d'un petit cours de trois lectures](http://www.ae-info.org/attach/User/Martin-L%C3%B6f_Per/OtherInformation/article.pdf)

# Typage Dépendent

- [Intégrer les type sum, les value constructors, et les type constructors](http://bitemyapp.com/posts/2014-04-05-grokking-sums-and-constructors.html).

- [Programmation légère avec typage dépendant](http://okmij.org/ftp/Computation/lightweight-dependent-typing.html).

- [Le language de programmation Idris](http://www.idris-lang.org/).

# Interconnexion de binaires statique

- [Interconnexion statique](https://wiki.haskell.org/Web/Literature/Static_linking)

- [Interconnexion statique avec GHC sur Arch Linux](http://www.edofic.com/posts/2014-05-03-ghc-arch-static.html)

- [Interconnexion statique de binaires Linux pour ARM & MIPS](http://stackoverflow.com/questions/14270177/ghc-statically-linking-linux-binaries-for-arm-mips-processors)

- [Interconnexion statique GMP avec GHC et LLVM](http://stackoverflow.com/questions/10539857/statically-link-gmp-to-an-haskell-application-using-ghc-llvm)

## Dialogues

> Hébergés dans un dépôt [ici](dialogues.md).

Ils sont importants et utiles. A regarder pour une compréhension approfondie sur
des sujets variés.
