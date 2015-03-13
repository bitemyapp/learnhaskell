# Le Guide

Ceci est ma façcon recommandée d'apprendre Haskell.


#### Quelque chose à garder en tête: *ne bloquez pas sur les points que vous ne comprenez pas immédiatement*. Continuez à avancer.

## Communauté

Notre canal IRC est `#haskell-beginners` sur Freenode.

Client web IRC [ici](http://webchat.freenode.net/).

Les [listes de diffusion](https://wiki.haskell.org/Mailing_lists) Haskell.

# Qu'est ce que Haskell, GHC, et Cabal?

Haskell est un langage de programmation, défini par une spécification, la plus récente datant de 2010. Celle-ci est disponible [en ligne](http://www.haskell.org/onlinereport/haskell2010/).

## GHC

[GHC](http://www.haskell.org/ghc/) est le moyen le plus populaire de travailler avec le langage Haskell. Il inclut compilateur, REPL(interpréteur), gestion de paquets, et plus encore.

## Cabal

[Cabal](https://www.haskell.org/cabal/download.html) s'occupe de la gestion du projet et de la résolution des dépendances. C'est lui qui aide à l'installation de projets, typiquement dans leurs propres sandbox.

Cabal est l'équivalent de Bundler pour Ruby, de pip pour Python, de NPM pour Node, Maven, etc. GHC gère le packaging lui-même, Cabal choisit quelles versions doivent être installées.
