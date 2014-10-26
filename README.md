This is my recommended path for learning Haskell.

#### Something to keep in mind: *don't sweat the stuff you don't understand immediately*. Just keep moving.

# Community

Our IRC channel is `#haskell-beginners` on Freenode.

IRC web client here: http://webchat.freenode.net/

## Community Guidelines

[Letter to a Young Haskell Enthusiast](http://comonad.com/reader/2014/letter-to-a-young-haskell-enthusiast/)

Be nice above all else!

# Primary course

## What are Haskell, GHC, and Cabal?

Haskell is a programming language as laid out in the reports, most recent one being in 2010. http://www.haskell.org/onlinereport/haskell2010/

GHC is the most popular compiler for Haskell and is what you'll install along with Cabal. Cabal is the project and dependency management tool used with GHC. You almost definitely want both if you're going to start writing Haskell.

Cabal is equivalent to Ruby's Bundler, Python's pip, Node's NPM, Maven, etc. GHC manages packaging itself, Cabal chooses what versions to install.

## Getting started

### Ubuntu

This PPA is excellent and is what I use on all my Linux dev and build machines: http://launchpad.net/~hvr/+archive/ghc

Specifically:

- `sudo apt-get update`
- **12.04 and below** -> `sudo apt-get install python-software-properties`
- **12.04 and above** -> `sudo apt-get install software-properties-common`
- `sudo add-apt-repository -y ppa:hvr/ghc`
- `sudo apt-get update`
- `sudo apt-get install cabal-install-1.20 ghc-7.8.3 happy-1.19.4 alex-3.1.3`

Then add `~/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.3/bin:/opt/happy/1.19.4/bin:/opt/alex/3.1.3/bin` to your PATH (bash_profile, zshrc, bashrc, etc)

*Optional* You could also add `.cabal-sandbox/bin` to your path. Code that you are actively developing will be available to you from the command line.
This only works when your current working directory is a cabal sandbox.

### Debian

#### GHC Repository for debian stable
If you use debian stable, it is easier to use this: http://deb.haskell.org/. After installing GHC:
- Get `cabal-install` source at https://www.haskell.org/cabal/download.html
- Run `bootstrap.sh`
- Run `cabal update && cabal install cabal cabal-install alex happy`

#### Using Ubuntu PPA
If you're not using stable, you can follow the same steps as Ubuntu, but has to execute an additional command. Immediately after `sudo add-apt-repository -y ppa:hvr/ghc` is ran, run:

- `sudo sed -i s/jessie/trusty/g /etc/apt/sources.list.d/hvr-ghc-jessie.list`

For other Debian versions, just replace all occurences of "jessie" with your version name in the command above.

If, for some reason, the file `/etc/apt/sources.list.d/hvr-ghc-jessie.list` does
not exist, then `/etc/apt/sources.list` should contain a line like this:

```
deb http://ppa.launchpad.net/hvr/ghc/ubuntu jessie main
```

Replace "jessie" with "trusty" in this line.

#### Manual compilation
You can follow the guide written for Mac OS X: http://www.davesquared.net/2014/05/platformless-haskell.html. Notes:
- set your prefix accordingly when configuring ghc
- instead of grabbing the `cabal-install` binary, grab the source and then run `bootstrap.sh` script.

### Fedora 20

To install Haskell 7.8x from the unofficial repo (Fedora 21+ will include it in the official one:
- Add https://copr.fedoraproject.org/coprs/petersen/ghc-7.8/repo/fedora-20/petersen-ghc-7.8-fedora-20.repo as  petersen-ghc-7.8-fedora-20.repo
- `sudo yum install ghc`

### Arch Linux

To install Haskell from the official repos on Arch Linux, run

    su -c "pacman -S cabal-install ghc happy alex haddock"

### Gentoo

On Gentoo, you can install the individual components of the Haskell Platform
through Portage. If you use `ACCEPT_KEYWORDS=arch` (as opposed to
`ACCEPT_KEYWORDS=~arch`), Portage will install ancient versions of the various
Haskell things. With that in mind, iff you use `ACCEPT_KEYWORDS=arch`, add the
following to `/etc/portage/package.keywords`, replacing `amd64` with your
architecture.

    >=dev-haskell/cabal-install-1.18.0.3 ~amd64
    >=dev-lang/ghc-7.8.3 ~amd64

 Once that is done,

    emerge --jobs --ask --verbose dev-lang/ghc dev-haskell/cabal-install dev-haskell/happy dev-haskell/alex

Gentoo keeps a "stable" (read: old) version of `cabal-install` in the Portage
tree, so you'll want to use `cabal-install` to install the more recent version.

    cabal update
    cabal install cabal-install

Once you do that, you'll want to install the additional tools `alex` and `happy`.

    cabal install alex happy

### Mac OS X

#### 10.9

Install the GHC for Mac OS X app, which includes GHC and Cabal. It provides instructions on how to add GHC and Cabal to your path after you've dropped the .app somewhere.

- http://ghcformacosx.github.io/

#### 10.6-10.8

Do the binary distribution install described below with this tarball:

- https://www.haskell.org/platform/download/2014.2.0.0/ghc-7.8.3-x86_64-apple-darwin-r3.tar.bz2

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

---

## Yorgey course - *Do this first*, this is the primary way I recommend being introduced to Haskell.


http://www.seas.upenn.edu/~cis194/spring13/index.html Brent Yorgey's course is the best I've found so far and replaces both Yann Esposito's HF&H. This course is valuable as it will not only equip you to write basic Haskell but also help you to understand parser combinators.

The only reason you shouldn't start with cis194 is if you are not a programmer or are an inexperienced one. If that's the case, start with http://learnyouahaskell.com/ and transition to cis194.

Learn You A Haskell and http://book.realworldhaskell.org/ are recommended primarily as supplemental references for completing the cis194 course if you are not new to programming. RWH has some additional material that LYAH does not that is useful to people using Haskell in production as well.

---

## Supplementary course that provides more material on intermediate topics

This is Bryan O'Sullivan's online course from the class he teaches at Stanford. If you don't know who he is, take a gander at half the libraries any Haskell application ends up needing and his name is on it. Of particular note if you've already done the Yorgey course are the modules on phantom types, information flow control, language extensions, concurrency, pipes, and lenses.

- http://www.scs.stanford.edu/14sp-cs240h/

## Exercises for practice (the NICTA course)

You should do Yorgey's course before attempting this: https://github.com/NICTA/course/

## Secondary material, references

[Learn You a Haskell for Great Good (LYAH)](http://learnyouahaskell.com) and [Real World Haskell](http://book.realworldhaskell.org) (Thanks bos!) are available online.

I recommend RWH as a reference (thick book). The chapters for parsing and monads are great for getting a sense for where monads are useful. Other people have said that they've liked it a lot. Perhaps a good follow-up for practical idioms after you've got the essentials of Haskell down?

### For learning some common typeclasses

Useful for understanding `Functor`, `Applicative`, `Monad`, `Monoid` and other typeclasses in general but also some Hask-specific category theory:
- http://www.haskell.org/haskellwiki/Typeclassopedia

### Understanding basic Haskell error messages

- http://ics.p.lodz.pl/~stolarek/_media/pl:research:stolarek_understanding_basic_haskell_error_messages.pdf

## Development Environment

### Emacs

- https://github.com/serras/emacs-haskell-tutorial/blob/master/tutorial.md

- https://github.com/bitemyapp/dotfiles/

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

- http://softwaresimply.blogspot.com/2014/07/haskell-best-practices-for-avoiding.html

Cabal Hell was a problem for Haskell users before the introduction of sandboxes. Installing outside of a sandbox will install into your user package-db. This is *not* a good idea except for foundational packages like Cabal, alex, and happy. Nothing else should be installed in the user or global package-dbs unless you know what you're doing.

To experiment with a package or start a project, begin by doing `cabal sandbox init` in a new directory.

Put briefly:

- Always use sandboxes for installing new packages, building new or existing projects, or starting experiments
- Use `cabal repl` to start a project-scoped ghci instance

The sandbox-based approach I suggest should avoid package-dependency problems, but it's incompatible with the way the Haskell Platform provides pre-built packages. If you're still learning Haskell and don't understand how ghc-pkg and Cabal work, *avoid Platform* and instead use the install instructions earlier in the guide.

## Search code by type signature

The Hoogle search engine can search by type:

http://www.haskell.org/hoogle/?hoogle=%28a+-%3E+b%29+-%3E+%5ba%5d+-%3E+%5bb%5d

Alternately:

https://www.fpcomplete.com/hoogle

Also Hayoo (which has all of hackage enabled for search by default): http://holumbus.fh-wedel.de/hayoo/hayoo.html

### Setting up your own local instance of Hoogle

https://gist.github.com/bitemyapp/3e6a015760775e0679bf

## Haddock

- First: http://fuuzetsu.co.uk/blog/posts/2014-01-06-Fix-your-Hackage-documentation.html
- Second: http://fuuzetsu.co.uk/blog/posts/2014-01-06-Hackage-documentation-v2.html

### What you really need to know

In order to have haddocks include documentation for related packages, you have to set documentation: True in your ~/.cabal/config. If it was left on the default (False) or set to False, you'll have to delete all your packages and reinstall before generating haddocks.

The other thing to keep in mind is that due to the way the $pkg parameter gets interpolated *by* haddock, not by you, the html-location and content-location parameters must be in single quotes and entered into a shell or contained in a shell script. They will not work in a Makefile, because it will think they are Make variables!

```bash
#!/bin/bash

cabal haddock --hoogle --hyperlink-source --html-location='http://hackage.haskell.org/package/$pkg/docs' --contents-location='http://hackage.haskell.org/package/$pkg'
```

## Fun Stuff

After you're comfortable with Haskell, strongly consider learning Lenses and Prisms, even if just as a "user". You don't need to understand the underlying category for it to be useful.

Seen here: http://hackage.haskell.org/package/lens

## Frontend/JavaScript

If you need JavaScript, you probably want Purescript for generating JS. Purescript is *not* strictly Haskell but it is very similar and quite pleasant.

- http://www.purescript.org/

- http://try.purescript.org/

- http://www.christopherbiscardi.com/2014/06/22/getting-started-with-purescript/ Great guide for getting started

## Parsing in Haskell

- Parser combinator tutorial for Haskell using Parsec: https://github.com/JakeWheat/intro_to_parsing

- Writing your own micro-Parsec: http://olenhad.me/articles/monadic-parsers/

### Parsing and generating JSON

- http://blog.raynes.me/blog/2012/11/27/easy-json-parsing-in-haskell-with-aeson/

- http://bitemyapp.com/posts/2014-04-11-aeson-and-user-created-types.html

- http://bitemyapp.com/posts/2014-04-17-parsing-nondeterministic-data-with-aeson-and-sum-types.html

- https://www.fpcomplete.com/school/starting-with-haskell/libraries-and-frameworks/text-manipulation/json

## Laziness, strictness, guarded recursion

- http://chimera.labs.oreilly.com/books/1230000000929/ch02.html Marlow's book about parallelism and concurrency has one of the best introductions to laziness and normal form I've found. Use other material too if it doesn't stick immediately.

- http://augustss.blogspot.hu/2011/05/more-points-for-lazy-evaluation-in.html

- http://alpmestan.com/2013/10/02/oh-my-laziness/

- http://stackoverflow.com/questions/13042353/does-haskell-have-tail-recursive-optimization

- http://www.slideshare.net/tibbe/reasoning-about-laziness

### For a more thorough understanding of laziness, NF, WHNF

- https://vec.io/posts/notes-on-lambda-calculus

- http://homepages.inf.ed.ac.uk/wadler/topics/call-by-need.html#need-journal

- http://www.itu.dk/~sestoft/papers/sestoft-lamreduce.pdf

- http://www.cs.ox.ac.uk/files/293/lazy.pdf

### Brief demonstration

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

- http://www.vex.net/~trebla/haskell/lazy.xhtml

## Parallelism/Concurrency

- http://chimera.labs.oreilly.com/books/1230000000929 This book by Simon Marlow is probably the best I've ever read on the topics of Parallelism and Concurrency:

- http://kukuruku.co/hub/haskell/haskell-testing-a-multithread-application A thorough walk-through on testing & incremental development of a multi-threaded application in Haskell

- http://www.haskell.org/haskellwiki/Functional_Reactive_Programming

## Lenses and Prisms

People vastly overestimate the difficulty of using Lens. Anybody comfortable with Functor/Foldable/Traversable (or even just the first one) can leverage lenses and prisms to make their life happier.

If you've ever done something like: `(fmap . fmap)` you were "lensing" in your head.

I recommend these two tutorials/introductions:

- https://www.fpcomplete.com/school/to-infinity-and-beyond/pick-of-the-week/a-little-lens-starter-tutorial

- https://github.com/ekmett/lens#lens-lenses-folds-and-traversals

## Monads and monad transformers

### Do not do these until you understand typeclasses, Monoid, Functor, and Applicative!

Implement the standard library monads ( List, Maybe, Cont, Error, Reader, Writer, State ) for yourself to understand them better. Then maybe write an monadic interpreter for a small expression language using Monad Transformers Step by Step paper.

Writing many interpreters by just changing the monad to change the semantics can help convey what's going on.

- https://vimeo.com/73648150 This talk by Tony excellently motivates monad transformers

Also, reimplement Control.Monad. Functions like `mapM` or `sequence` are good opportunities to practice writing generic monadic code.

The NICTA course can be used as a guide to this process, which will also involve writing your own Applicative as well.

From:
- http://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5aj6
- http://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5trg

### Monad transformers

- https://github.com/kqr/gists/blob/master/articles/gentle-introduction-monad-transformers.md

- http://www.cs.virginia.edu/~wh5a/personal/Transformers.pdf (warning, code out of date)

## Testing, tests, specs, generative/property testing

- https://github.com/kazu-yamamoto/unit-test-example/blob/master/markdown/en/tutorial.md This tutorial by Kazu Yamamoto is fantastic.


## Resource handling, finalization, cleanup

- Overview of resourceT by Snoyman: https://www.fpcomplete.com/user/snoyberg/library-documentation/resourcet

## Streaming IO

- https://github.com/jwiegley/simple-conduit Good simple library for learning how streaming IO works in general, knowledge transferrable to libraries like Pipes and Conduit

## Recursion Schemes

Some of the crazy *-morphism words you've heard are actually about recursion. NB - before tackling this material you should know how to implement foldr for lists and at least one other data structure, such as a tree. (folds are catamorphisms) Knowing how to implement an unfold (anamorphism) for the same will round things out a bit.

This material dovetails with traversable and foldable.

- http://patrickthomson.ghost.io/an-introduction-to-recursion-schemes/

- http://fho.f12n.de/posts/2014-05-07-dont-fear-the-cat.html - good demonstration of how hylomorphism is the composition of cata and ana.

- http://comonad.com/reader/2009/recursion-schemes/ - this field guide is excellent.

- http://eprints.eemcs.utwente.nl/7281/01/db-utwente-40501F46.pdf

- https://www.fpcomplete.com/user/edwardk/recursion-schemes/catamorphisms

## Type and Category Theory (*not* needed to actually write Haskell, just for those interested!)

If you want to follow up on the type and category theory:

- http://byorgey.wordpress.com/2014/01/14/catsters-guide/ and http://byorgey.wordpress.com/catsters-guide-2/

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

## Parametricity, ad-hoc vs. parametric polymorphism, free theorems

- http://dl.dropboxusercontent.com/u/7810909/media/doc/parametricity.pdf

- https://github.com/tonymorris/parametricity/

- http://swizec.com/blog/week-20-making-ad-hoc-polymorphism-less-ad-hoc/swizec/6564

- http://ttic.uchicago.edu/~dreyer/course/papers/wadler.pdf

## Initial and Final, DSLs, Finally Tagless

- http://creativelad.wordpress.com/2013/11/28/final-encodings-part-1-a-quick-demonstration/

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

- http://comonad.com/reader/2011/free-monads-for-less/

- http://comonad.com/reader/2011/free-monads-for-less-2/

- http://comonad.com/reader/2011/free-monads-for-less-3/

## IO

- https://www.fpcomplete.com/user/snoyberg/general-haskell/advanced/evaluation-order-and-state-tokens

Comment from Reddit thread by `glaebhoerl`


Interesting side note: GHC needs to hide the state token representation behind an abstract IO type because the state token must always be used linearly (not duplicated or dropped), but the type system can't enforce this. Clean, another lazy Haskell-like language, has uniqueness types (which are like linear types and possibly different in ways I'm not aware of), and they expose the World-passing directly and provide a (non-abstract) IO monad only for convenience.

- http://blog.ezyang.com/2011/05/unraveling-the-mystery-of-the-io-monad/

- http://blog.jle.im/entry/first-class-statements

- http://hackage.haskell.org/package/base-4.7.0.1/docs/System-IO-Unsafe.html#v:unsafePerformIO Read the docs and note implementation of unsafeDupablePerformIO

## GHC Core and performance tuning

- [Write Haskell as Fast as C](write_haskell_as_fast_as_c.md)

- https://ghc.haskell.org/trac/ghc/wiki/Commentary/Compiler/CoreSynType

- https://hackage.haskell.org/package/ghc-core

- http://stackoverflow.com/questions/6121146/reading-ghc-core

- http://donsbot.wordpress.com/2008/06/04/haskell-as-fast-as-c-working-at-a-high-altitude-for-low-level-performance/

- http://book.realworldhaskell.org/read/profiling-and-optimization.html

## Dependent typing

- http://bitemyapp.com/posts/2014-04-05-grokking-sums-and-constructors.html squint hard.

- http://okmij.org/ftp/Computation/lightweight-dependent-typing.html

- http://www.idris-lang.org/

## Propositions vs. Judgments (computation)

- http://cstheory.stackexchange.com/questions/9826/what-is-the-difference-between-propositions-and-judgments

- http://www.ae-info.org/attach/User/Martin-L%C3%B6f_Per/OtherInformation/article.pdf

## Graph algorithms and data structures

- https://hackage.haskell.org/package/fgl particularly the shortest path algos here which are pure: http://hackage.haskell.org/package/fgl-5.4.2.2/docs/Data-Graph-Inductive-Query-SP.html

- http://web.engr.oregonstate.edu/~erwig/papers/abstracts.html#JFP01

- http://web.engr.oregonstate.edu/~erwig/fgl/haskell/old/fgl0103.pdf

- http://hackage.haskell.org/package/containers-0.5.5.1/docs/Data-Graph.html

- https://hackage.haskell.org/package/graphs

- http://stackoverflow.com/questions/24369954/separate-positive-and-negative-occurrences-of-phoas-variables-in-presence-of-rec

- https://www.fpcomplete.com/user/edwardk/phoas

- http://www.haskell.org/haskellwiki/Tying_the_Knot

## Extended Reading list (some is already included here)

- http://www.stephendiehl.com/posts/essential_haskell.html

## Stackage

For any users (usually Yesod users) that have build problems, consider Stackage.

- A good summary of Stackage is here: https://www.fpcomplete.com/blog/2014/05/stackage-server

In the author's opinion, Stackage is usually more useful than `cabal freeze`.

## Dialogues

[Dialogues](dialogues.md) these are actually pretty important and
helpful. Look here for deep dives on a variety of topics.
