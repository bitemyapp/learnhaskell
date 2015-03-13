# Le Guide

Ceci est ma façcon recommandée d'apprendre Haskell.


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
