This is my recommended path for learning Haskell.

#### Something to keep in mind: *don't sweat the stuff you don't understand immediately*. Just keep moving.

# Primary course

## Getting started

### Ubuntu

This PPA is excellent and is what I use on all my Linux dev and build machines: http://launchpad.net/~hvr/+archive/ghc

Specifically:

- `sudo apt-get update`
- `sudo apt-get install python-software-properties`
- `sudo add-apt-repository -y ppa:hvr/ghc`
- `sudo apt-get update`
- `sudo apt-get install cabal-install-1.20 ghc-7.8.2 happy-1.19.3 alex-3.1.3`

Then add `~/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.2/bin:/opt/happy/1.19.3/bin:/opt/alex/3.1.3/bin` to your PATH (bash_profile, zshrc, bashrc, etc)

### Arch Linux

To install Haskell from the official repos on Arch Linux

Update your mirrorlist
- `sudo pacman -Syy`

Download Haskell
- `sudo pacman -S cabal-install ghc happy alex haddock`

### Mac OS X

Install the GHC for Mac OS X app, which includes GHC and Cabal. It provides instructions on how to add GHC and Cabal to your path after you've dropped the .app somewhere.

- http://ghcformacosx.github.io/

### Windows and other Linux users

Download the latest binary distributions for cabal and ghc:

#### GHC

GHC is the most popular way to work in the Haskell language. It includes a compiler, REPL (interpreter), package management, and other things besides.

- http://www.haskell.org/ghc/

#### Cabal

Cabal does project management and dependency resolution. It's how you'll install projects, typically into their own sandbox.

- https://www.haskell.org/cabal/download.html

#### Detailed manual install guide for Mac OS X

You don't need this if you use the .app, but if it doesn't work for you, try this with the binary distribution.

- http://www.davesquared.net/2014/05/platformless-haskell.html

## Yorgey course - Do this first, this is the primary way I recommend being introduced to Haskell.

http://www.seas.upenn.edu/~cis194/lectures.html Brent Yorgey's course is the best I've found so far and replaces both Yann Esposito's HF&H and the NICTA course. This course is particularly valuable as it will not only equip you to write Haskell but also help you understand parser combinators. 

## Supplementary course that provides more material on intermediate topics

This is Bryan O'Sullivan's online course from the class he teaches at Stanford. If you don't know who he is, take a gander at half the libraries any Haskell application ends up needing and his name is on it. Of particular note if you've already done the Yorgey course are the modules on phantom types, information flow control, language extensions, concurrency, pipes, and lenses.

- http://www.scs.stanford.edu/14sp-cs240h/

## Development Environment

### Emacs

- http://tim.dysinger.net/posts/2014-02-18-haskell-with-emacs.html

### Vim

- http://www.haskell.org/haskellwiki/Vim

- http://www.stephendiehl.com/posts/vim_haskell.html

- https://github.com/kazu-yamamoto/ghc-mod

- https://github.com/eagletmt/ghcmod-vim

### Sublime Text

- https://github.com/SublimeHaskell/SublimeHaskell

## FAQ and working with Cabal

### Fantastic FAQ

In addition to being an amazing guide for all kinds of things such as GADTs, this also covers some useful basics for Cabal

- http://dev.stephendiehl.com/hask/

### Cabal guidelines

Cabal Hell was a problem for Haskell users before the introduction of sandboxes. Installing outside of a sandbox will install into your user package-db. This is *not* a good idea except for foundational packages like Cabal, alex, and happy. Nothing else should be installed in the user or global package-dbs unless you know what you're doing.

To experiment with a package or start a project, begin by doing `cabal sandbox init` in a new directory.

Put briefly:

- Always use sandboxes for installing new packages, building new or existing projects, or starting experiments
- Use `cabal repl` to start a project-scoped ghci instance

## Exercises for practice

You should do Yorgey's course before attempting this: https://github.com/NICTA/course/

## Secondary material, references

[Learn You a Haskell for Great Good (LYAH)](http://learnyouahaskell.com) and [Real World Haskell](http://book.realworldhaskell.org) (Thanks bos!) are available online.

I recommend RWH as a reference (thick book). The chapters for parsing and monads are great for getting a sense for where monads are useful. Other people have said that they've liked it a lot. Perhaps a good follow-up for practical idioms after you've got the essentials of Haskell down?

## For learning some common typeclasses

Useful for understanding typeclasses in general but also some Hask-specific category theory:
- http://www.haskell.org/haskellwiki/Typeclassopedia

## Search code by type signature

The Hoogle search engine can search by type:

http://www.haskell.org/hoogle/?hoogle=%28a+-%3E+b%29+-%3E+%5ba%5d+-%3E+%5bb%5d

Alternately:

https://www.fpcomplete.com/hoogle

Also Hayoo (which has all of hackage enabled for search by default): http://holumbus.fh-wedel.de/hayoo/hayoo.html

## Fun Stuff

After you're comfortable with Haskell, strongly consider learning Lenses and Prisms, even if just as a "user". You don't need to understand the underlying category for it to be useful.

Seen here: http://hackage.haskell.org/package/lens

## Frontend/JavaScript

If you need JavaScript, you probably want Purescript for generating JS. Purescript is *not* strictly Haskell but it is very similar and quite pleasant.

- http://www.purescript.org/
- http://try.purescript.org/

## Parallelism/Concurrency

- http://chimera.labs.oreilly.com/books/1230000000929 This book by Simon Marlow is probably the best I've ever read on the topics of Parallelism and Concurrency: 

- http://kukuruku.co/hub/haskell/haskell-testing-a-multithread-application A thorough walk-through on testing & incremental development of a multi-threaded application in Haskell

- http://www.haskell.org/haskellwiki/Functional_Reactive_Programming

## Recursion Schemes

Some of the crazy *-morphism words you've heard are actually about recursion. NB - before tackling this material you should know how to implement foldr for lists and at least one other data structure, such as a tree. (folds are catamorphisms) Knowing how to implement an unfold (anamorphism) for the same will round things out a bit.

This material dovetails with traversable and foldable.

- http://patrickthomson.ghost.io/an-introduction-to-recursion-schemes/

- http://fho.f12n.de/posts/2014-05-07-dont-fear-the-cat.html - good demonstration of how hylomorphism is the composition of cata and ana.

- http://comonad.com/reader/2009/recursion-schemes/ - this field guide is excellent.

- http://eprints.eemcs.utwente.nl/7281/01/db-utwente-40501F46.pdf

- https://www.fpcomplete.com/user/edwardk/recursion-schemes/catamorphisms

## Lenses and Prisms

People vastly overestimate the difficulty of using Lens. Anybody comfortable with Functor/Foldable/Traversable (or even just the first one) can leverage lenses and prisms to make their life happier.

If you've ever done something like: `(fmap . fmap)` you were "lensing" in your head.

I recommend these two tutorials/introductions:

- https://www.fpcomplete.com/school/to-infinity-and-beyond/pick-of-the-week/a-little-lens-starter-tutorial

- https://github.com/ekmett/lens#lens-lenses-folds-and-traversals

## Type and Category Theory (*not* needed to actually write Haskell, just for those interested!)

If you want to follow up on the type and category theory:

- http://www.cs.cmu.edu/~rwh/plbook/book.pdf Harper's Practical Foundations for Programming Languages is the best PL focused intro to type theory I've read.

- http://www.quora.com/Category-Theory/What-is-the-best-textbook-for-Category-theory?share=1 Kmett's recommendations

- http://en.wikibooks.org/wiki/Haskell/Category_theory nice diagrams

- http://www.haskell.org/haskellwiki/Category_theory good links to other resources

- http://science.raphael.poss.name/categories-from-scratch.html includes practical examples

- https://www.google.com/search?q=Awodey+Category+Theory the standard text along with MacLane

- http://www.cs.kent.ac.uk/people/staff/sjt/TTFP/

- http://www.cis.upenn.edu/~bcpierce/courses/670Fall04/GreatWorksInPL.shtml Pierce's Great Works in PL list

### Stephen's Nifty "How to get to monad" posts

Didn't know where else to put these:

- http://www.stephendiehl.com/posts/adjunctions.html

- http://www.stephendiehl.com/posts/monads.html

## Ad-hoc & parametric polymorphism, free theorems

- http://swizec.com/blog/week-20-making-ad-hoc-polymorphism-less-ad-hoc/swizec/6564

- http://ttic.uchicago.edu/~dreyer/course/papers/wadler.pdf

## Initial and Final, DSLs, Finally Tagless

- http://martijn.van.steenbergen.nl/journal/2009/10/18/transforming-polymorphic-values/

- http://martijn.van.steenbergen.nl/journal/2009/11/12/gadts-in-haskell-98/

- https://www.fpcomplete.com/user/mutjida/typed-tagless-final-linear-lambda-calculus

- http://okmij.org/ftp/tagless-final/course/course.html

- http://okmij.org/ftp/tagless-final/course/lecture.pdf

- http://existentialtype.wordpress.com/2011/03/21/the-dog-that-didnt-bark/ less specifically relevant but interesting

## Comonads

- https://speakerdeck.com/dmoverton/comonads-in-haskell

- http://stackoverflow.com/questions/16551734/can-a-monad-be-a-comonad

## Yoneda / CoYoneda

- http://stackoverflow.com/questions/24000465/step-by-step-deep-explain-the-power-of-coyoneda-preferably-in-scala-throu

## Dependent typing

- http://bitemyapp.com/posts/2014-04-05-grokking-sums-and-constructors.html squint hard.

- http://okmij.org/ftp/Computation/lightweight-dependent-typing.html

- http://www.idris-lang.org/

## Extended Reading list (some is already included here)

- http://www.stephendiehl.com/posts/essential_haskell.html
