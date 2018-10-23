# How to learn Haskell

This is a recommended path for learning Haskell based on experience helping others. A list of recommendations from one of the authors of the [Haskell Book.](http://haskellbook.com)


## For non-English speakers

* [Auf Deutsch](guide-de.md)

* [En Español](guide-es.md)

* [En Français](guide-fr.md)

* [In Italiano](guide-it.md)

* [Em Português](guide-pt.md)

* [În Română](guide-ro.md)

* [繁體中文](guide-zh_tw.md)

* [简体中文](guide-zh_CN.md)

* [По-русски](guide-ru.md)

* [Українською](guide-ua.md)

* [Bahasa Indonesia](guide-id.md)

* [Srpski](guide-sr.md)

#### *Don't sweat the stuff you don't understand immediately*. Keep moving!

## Community

Our IRC channel is `#haskell-beginners` on Freenode.

IRC web client [here](http://webchat.freenode.net/).

The haskell [mailing lists](https://wiki.haskell.org/Mailing_lists).


### Community Guidelines

See [the community guidelines](coc.md) to understand the conduct that is expected in the IRC channel. You'll get a warning if you're not obviously trolling, but be aware the channel is exclusively for those learning or teaching Haskell.


# Installing Haskell

## Use Stack to get going with Haskell

Get [Stack](http://haskellstack.org) to get GHC installed and to build your projects.

If you don't know anything about Stack and would like an overview, check out this [comprehensive Stack video tutorial](https://www.youtube.com/watch?v=sRonIB8ZStw).


## Also, DO NOT INSTALL HASKELL PLATFORM

Instead of following the instructions on Haskell.org, get Stack.

### Why not platform?

https://mail.haskell.org/pipermail/haskell-community/2015-September/000014.html


# How should I learn Haskell?

The core recommendation is to read the lectures and complete all exercises/homework for the Spring 13 version of cis194 followed by the FP course. Both are linked below. Everything else can be considered optional and is mentioned so you know where to look.

## Haskell Programming from First Principles.

[@dmvianna](https://github.com/dmvianna) wanted me to let you know that the below are just the _free_ recommended resources. If you're willing to check out a book, we heartily recommend our own [Haskell Book!](http://haskellbook.com) If you can't afford the book for any reasons, please email us using the contact information at [our support page](http://haskellbook.com/support.html).

### Haskell Book subsumes all of the primary resources recommended here

## Yorgey's cis194 course

> *Do this first* if aren't getting the Haskell Book, this is the best _free_ introduction to Haskell.

Available [online](https://www.seas.upenn.edu/~cis194/fall16/).

[Brent Yorgey](https://byorgey.wordpress.com)'s course is the best I've found so
far.  This course is valuable as it will not only equip you to write basic
Haskell but also help you to understand parser combinators.

The only reason you shouldn't start with cis194 is if you are not a programmer
or are an inexperienced one. If that's the case, start with
[Thompson's book](http://www.haskellcraft.com/craft3e/Home.html) and transition
to cis194.

---

## Functional Programming course

> This is the course we recommend doing after Yorgey's cis194 course

Available on github [here](https://github.com/bitemyapp/fp-course).

This will reinforce and give you experience directly implementing the
abstractions introduced in cis194, this is practice which is *critical* to
becoming comfortable with everyday uses of Functor/Applicative/Monad/etc. in
Haskell. Doing cis194 and then the FP course represents the core
recommendation of my guide and is how we teach everyone Haskell.

---

## Supplementary course after cis194 and the FP course

> Provides more material on intermediate topics

cs240h is available online:
* [Spring 14](http://www.scs.stanford.edu/14sp-cs240h/)
* [Winter 16](http://www.scs.stanford.edu/16wi-cs240h/)

This is [Bryan O'Sullivan](https://github.com/bos)'s online course from the
class he teaches at Stanford. If you don't know who he is, take a gander at half
the libraries any Haskell application ends up needing and his name is on it. Of
particular note if you've already done the Yorgey course are the modules on
phantom types, information flow control, language extensions, concurrency,
pipes, and lenses.

---

# Resources for specific topics in Haskell

These resources are not vetted or tested with learners as cis194 and FP course have been, but they're linked in [the topic listing](specific_topics.md) so you have ideas on where to begin. This includes things like intermediate/advanced concepts and subjects like tooling and text editors.


## Dialogues

> Hosted in this repository [here](dialogues.md).

These are actually pretty important and helpful. Look here for deep dives on a
variety of topics.
