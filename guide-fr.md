# Le Guide

Ceci est ma façon recommandée d'apprendre Haskell.


#### Quelque chose à garder en tête: *ne bloquez pas sur les points que vous ne comprenez pas immédiatement*. Continuez à avancer.

## Communauté

Notre canal IRC est `#haskell-beginners` sur Freenode.

Client web IRC [ici](http://webchat.freenode.net/).

Les [listes de diffusion](https://wiki.haskell.org/Mailing_lists) Haskell.

### Lignes directrices de la communauté

[Voir le post sur l'enseignement de Chris Done](http://chrisdone.com/posts/teaching)

Soyez gentils  et courtois. Etre méchant ou déagréable fait peur aux autres et ne les encourage pas à participer.

Une critique pour le plaisir de critiquer ne sers que la personne qui la fait, pas celle qui la reçoit.

Ne décrivez pas les choses comme "faciles" ou "triviales". Vous créerez un malaise pour les autres qui auraient la sensation de devoir travailler plus durement pour progresser. Les personnes qui apprenent lentement sont souvent celles qui font un apprentissage plus approfondi, c'est quelque chose que nous devons célébrer et encourager !

Ne pas feindre la surprise. N'ayez pas l'air surpris lorsque quelqu'un affirme ne pas savoir quelque chose. La personne se sentira mal et vous n'aurez rien accompli mis à part flatter votre égo.

Pas de "en fait...". Lorsqu'une personne dit quelque chose de presque - mais pas entièrement - correct, et vous répondez, "Ouais… en fait…" puis les corrigez. C'est particulièrement ennuyeux lorsque la correction n'a aucune incidence sur la conversation actuelle. Cela ne signifie pas que Hacker School ne se souci pas de la recherche de la vérité ou que nous ne nous soucions pas d'être précis. Presque tous les "Ouais… en fait…" sont de la démagogie, et non de la recherche de la vérité.

Pas de conduite accompagnée. Si vous voyez des personnes buter sur un problème, vous ne devez pas immédiatement donner des conseils. Laissez travailler dessus à moins que quelqu'un demande de l'aide. Eviter les interruptions est [un des objectifs fondateurs du canal #haskell-beginners](http://chrisdone.com/posts/teaching).

Pas de -ismes. Racisme, sexisme, homophobie, transphobie, et autres biais ne sont pas bienvenus et ne seront pas tolerés.

---

Lignes directrices du [manuel de the Hacker School](https://www.hackerschool.com/manual). Merci de l'avoir partagé Hacker School.

# Qu'est ce que Haskell, GHC, et Cabal?

Haskell est un langage de programmation, défini par une spécification, la plus récente datant de 2010. Celle-ci est disponible [en ligne](http://www.haskell.org/onlinereport/haskell2010/).

## GHC

[GHC](http://www.haskell.org/ghc/) est le moyen le plus populaire de travailler avec le langage Haskell. Il inclut compilateur, REPL(interpréteur), gestion de paquets, et plus encore.

## Cabal

[Cabal](https://www.haskell.org/cabal/download.html) s'occupe de la gestion du projet et de la résolution des dépendances. C'est lui qui aide à l'installation de projets, typiquement dans leurs propres sandbox.

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
contient une _sandbox_ cabal.

## Debian

### Dêpot GHC pour debian stable

Si vous utilisez la version stable de Debian, il est plus simple d'utiliser
http://deb.haskell.org/. Pour cela:

- Ajouter la ligne `deb http://deb.haskell.org/stable/ ./` à `/etc/apt/sources.list`

```bash
## Ajoute la clé pour supprimer les messages d'avertissement
$ GET http://deb.haskell.org/deb.haskell.org.gpg-key | apt-key add -
$ sudo apt-get update
$ sudo apt-get install ghc-7.8.3 happy alex cabal-install
```

### Utiliser le PPA d'Ubuntu

Si vous n'utilisez pas la version stable, vous pouvez suivre les mêmes étapes
que pour Ubuntu mais vous aurez besoin d'exécuter un commande supplémentaire.
Immédiatement après l'exécution de `sudo add-apt-repository -y ppa:hvr/ghc`,
lancez :

```bash
$ sudo sed -i s/jessie/trusty/g /etc/apt/sources.list.d/hvr-ghc-jessie.list
```

Pour les autres versions de Debian, il suffit de remplacer les occurences de
`jessie` par le nom de votre version dans la commandes ci-dessus.

Si, pour une quelconque raison, le fichier
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
- Au lieu de récupérez l'exécutable de `cabal-install`, récupérez les sources
et ensuite lancez le script `bootstrap.sh`.

## Fedora 21

Pour installer Haskell 7.8.4 depuis le dépôt non-officiel
(Fedora 22+ l'incluera dans l'officiel) :

```bash
$ sudo yum-config-manager --add-repo \
> https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/repo/fedora-21/petersen-ghc-7.8.4-fedora-21.repo
$ sudo yum install ghc cabal-install
```

Comme indiqué dans
[petersen/ghc-7.8.4 copr page](https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/)
cette version de ghc ne peut pas être installé en même temps que la version
Fedora/EPEL de ghc.

## Arch Linux

Pour installer Haskell depuis le dépôt officiel d'Arch Linux, lancez :

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

Gentoo garde une version "stable" (comprenez : vieille) de `cabal-install`
dans la hierarchie de Portage. Donc, si vous allez devoir utiliser
`cabal-install` pour installer la dernière version.  Notez que les backslashes
sont intentionnels dans ce qui suit.

```bash
$ \cabal update                # Les  backslashes
$ \cabal install cabal-install # sont intentionels
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

Installez l'app [GHC pour Mac OS X](http://ghcformacosx.github.io/) qui inclue
GHC et Cabal. Elle vous indiquera comment ajouter GHC et cabal à votre path
après que vous ayez déposé le `.app` quelquepart.

### 10.6-10.8

Faites l'installation décrite ci-dessous avec cette [archive](https://www.haskell.org/platform/download/2014.2.0.0/ghc-7.8.3-x86_64-apple-darwin-r3.tar.bz2).

## Windows

- L'[installeur minimal pour GHC](http://neilmitchell.blogspot.com/2014/12/beta-testing-windows-minimal-ghc.html)
est capable de compiler `network` et les autres. Techniquement, il s'agit d'une
beta mais cela devrait répondre au besoin de quiconque lira ce guide.

N'oubliez pas de lancer l'installation en tant qu'administrateur puisque le
programme cherchera à s'installer dans votre répertoire Program Files.

### Guide d'installation détaillé pour Mac OS X

Vous n'avez pas besoin de cela si vous utilisez le `.app` mais si cela ne
marche pas pour vous, essayez
[cela](http://www.davesquared.net/2014/05/platformless-haskell.html)
avec la version exécutable.


# Cours de base

## Le cours cis194 de Yorgey

> *Faites le en premier*, c'est la principale introduction à Haskell que je recommande.

Disponible [en ligne](http://www.seas.upenn.edu/~cis194/spring13/lectures.html).

Le cours de [Brent Yorgey](https://byorgey.wordpress.com) est le meilleur que j'ai trouvé jusque là.
La valeur de ce cours est qu'il vous équipera pour écrire du code basique en Haskell mais aussi vous
aidera à comprendre les combinateurs d'analyse (parser combinators).

La seule raison pour laquelle vous ne devriez pas commencer avec cis194 est si vous n'êtes pas un
developpeur ou un inexprimenté. Si c'est le cas, commencez par le
[livre de Thompson](http://www.haskellcraft.com/craft3e/Home.html) puis enchainez avec cis194.

---

## Le cours NICTA

> C'est le cours que je recommande après avoir suivi le cis194 de Yorgey

Disponible sur github [ici](https://github.com/NICTA/course).

Ce cours va renforcer et vous donnera de l'experience en implémentant directement
les abstractions introduites dans le cis194, c'est un exercice *critique* pour
être confortable avec les usages habituels des Functors/Applicatives/Monads/etc. en
Haskell. Suivre les cours cis194 puis NICTA est la recommendation principale
de mon guide et c'est comme ca que j'enseigne Haskell à tout le monde.

---

## Cours supplémentaire cs240h

> Fournit plus de matière sur des sujets intermédiaires

Disponible [en ligne](http://www.scs.stanford.edu/14sp-cs240h/).

C'est la version en ligne du cours de [Bryan O'Sullivan](https://github.com/bos)
enseigné à Stanford. Si vous ne savez qui il est, jetez un coup d'oeil à la moitié
des libraries utilisées par les applications  Haskell, son nom est dessus. A souligner
si vous avez déjà fait le cours de Yorgey les modules sur les
types fantomes, les controles des flux d'informations, les extensions de language,
la concurrence, les pipes, et les lenses.

---

## Documentation de référence pour les trois cours

[Learn You a Haskell for Great Good (LYAH)](http://learnyouahaskell.com) et
[Real World Haskell](http://book.realworldhaskell.org) (Merci bos !) sont
disponibles en ligne.

Je recommande RWH comme reference (un livre épais). Les chapitres sur le parsing et
les monades sont super pour comprendre où les monades sont utiles. D'autres ont confirmé
qu'il l'avaient beaucoup apprécié. Certainement une bonne suite pour des idomes plus pratiques
lorsque vous aurez intégré les bases d'Haskell.

### Que sont les sucres syntactiques `<-` / `do` / comprehension de listes ?

Un [article](http://www.haskellforall.com/2014/10/how-to-desugar-haskell-code.html) excellent.

### Pour comprendre list et fold

- [Explain List Folds to Yourself](http://vimeo.com/64673035)

### Pour apprendre quelques typeclasses courantes

Utile pour comprendre `Functor`, `Applicative`, `Monad`, `Monoid` et autres
typeclasses en general mais aussi une peu de théorie des catégories spécifique
à Haskell:

- La [Typeclassopedia](http://www.haskell.org/haskellwiki/Typeclassopedia)

### Comprendre les messages d'erreurs standards d'Haskell

- [Understanding basic error messages](http://ics.p.lodz.pl/~stolarek/_media/pl:research:stolarek_understanding_basic_haskell_error_messages.pdf)

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

- les slides de [Johan Tibell](https://github.com/tibbe) pour une présentation
intitulé [raisoner avec l'évaluation paresseuse](http://www.slideshare.net/tibbe/reasoning-about-laziness).

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

- [Ordre d'évaluation et State tokens](https://www.fpcomplete.com/user/snoyberg/general-haskell/advanced/evaluation-order-and-state-tokens)

- [Révéler les mytères de la monade IO](http://blog.ezyang.com/2011/05/unraveling-the-mystery-of-the-io-monad/).

- ["instructions" du premier ordre](http://blog.jle.im/entry/first-class-statements).

- [Haddocks pour System.IO.Unsafe.unsafePerformIO](http://hackage.haskell.org/package/base-4.7.0.1/docs/System-IO-Unsafe.html#v:unsafePerformIO)
  Lire la documentation et remarquez l'implémentation de `unsafeDupablePerformIO`

Commentaire sur un fil Reddit de `glaebhoerl` :

> Une intéressante note annexe: GHC a besoin de cacher la représentation du
> jeton d'état derrière un type abstrait IO car le jeton d'état doit toujours
> être utilisé linéairement (il ne doit pas être dupliqué ou abandonné), mais
> son système de types ne peut l'imposer. Clean, un autre langage paresseux
> à la Haskell, a des types uniques (qui sont des types linéaires et qui sont
> peut être différent sur d'autre points que j0ignore). Ils exposent le passage
> du Monde explicitement et proposent une monade IO (non-abstraite) uniquement
> pour plus de commodités.

# Monades et transformateurs de monades

> Ne faites pas ça vant de comprendres les typeclasses, Monoid, Functor et
> Applicative !

Implémenter les monades de la librairie standard (List, Maybe, Cont, Error,
Reader, Writer, State) par vous-même afin de mieux les comprendre. Après, vous
pouvez peut-être écrire un interpréteur monadique pour un langage avec des petites
expressions en utilisant le papier sur les
[transformateurs de monades étape par étape](http://www.cs.virginia.edu/~wh5a/personal/Transformers.pdf)
(mentioné dans la section "transformateurs de monades" ci-dessous).

Ecrire plusieurs interpréteurs en changeant juste la monde pour changer les
sémantiques peut aider à comprendre ce qui se passe.

- [Cette présentation](https://vimeo.com/73648150) de Tony justifie avec brio
l'utilité des transformateurs de monades. Les slides sont également
[disponibles](https://dl.dropboxusercontent.com/u/7810909/talks/monad-transformers/cbaa991e0eb49224eb286c1e418e2b9828e1fb21/monad-transformers.pdf).

De la même manière, réimplémanter `Control.Monad`. Des fonctions comme `mapM`
ou `sequence` sont de bonnes opportunités pour s'entrainer à écrire du code
monadique.

Le cours du NICTA peuvent être utiliser comme un guide lors de ce processus,
guide qui vous demandera également d'écrire vos propres Applicatives.

Crédits:

- Commentaires de htmltyp et Crandom sur Reddit
[ici](http://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5aj6).

- Commentaire de jozefg
[ici](http://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5trg).

# Test, specification, test de propriétés (tests par génération)

- Ce [tutoriel](https://github.com/kazu-yamamoto/unit-test-example/blob/master/markdown/en/tutorial.md)
de Kazu Yamamoto est fantastique.

- [Simple-Conduit](https://github.com/jwiegley/simple-conduit): Une bonne librairie simple pour apprendre comment le streaming d'IO fonctionne en général. Les connaissances acquises ici sont transférables à Pipes et Conduit.

# Parsing en Haskell

- [Tutoriel](https://github.com/JakeWheat/intro_to_parsing) sur les parser
combinators en Haskell utilisant Parsec.

- [Ecrivez votre propre micro-Parsec](http://olenhad.me/articles/monadic-parsers/)
