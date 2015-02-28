# The Guide

This is my recommended path for learning Haskell.

#### Something to keep in mind: *don't sweat the stuff you don't understand immediately*. Just keep moving.

## Community

Our IRC channel is `#haskell-beginners` on Freenode.

IRC web client [here](http://webchat.freenode.net/).

The haskell [mailing lists](https://wiki.haskell.org/Mailing_lists).

### Community Guidelines

[See Chris Done's post on teaching](http://chrisdone.com/posts/teaching)

Be kind and courteous. Being mean or rude scares people off and makes people not want to participate.

Low-effort criticism is for the benefit of the person delivering it, not the person receiving it.

Don't describe things as "easy" or "trivial". You'll making people feel terrible for having to work hard for their progress. Slow learners are often the most thorough learners, this is something to celebrate!

No feigning surprise. Don't act surprised when somebody says they don't know something. They'll feel terrible and you've accomplished nothing except to make yourself feel sharp.

No well-actually's. When someone says something that's almost - but not entirely - correct, and you say, "well, actually…" and then give a minor correction. This is especially annoying when the correction has no bearing on the actual conversation. This doesn't mean Hacker School isn't about truth-seeking or that we don't care about being precise. Almost all well-actually's are about grandstanding, not truth-seeking.

No back-seat driving. If you see people working through a problem, you shouldn't intermittently interject advice. Let them work it out unless someone asks for help. Avoiding interruptions is [one of the founding purposes of #haskell-beginners](http://chrisdone.com/posts/teaching). 

No subtle -isms. Racism, sexism, homophobia, transphobia, and other kinds of bias are not welcome and will not be tolerated.

---

Guidelines by [the Hacker School manual](https://www.hackerschool.com/manual). Thanks for releasing it Hacker School.

# What are Haskell, GHC, and Cabal?

Haskell is a programming language as laid out in the reports, most recent one
being in 2010. The report is available as the
[onlinereport](http://www.haskell.org/onlinereport/haskell2010/).

## GHC

[GHC](http://www.haskell.org/ghc/) is the most popular way to work in the
Haskell language. It includes a compiler, REPL (interpreter), package
management, and other things besides.

## Cabal

[Cabal](https://www.haskell.org/cabal/download.html) does project management and
dependency resolution. It's how you'll install projects, typically into their
own sandbox.

Cabal is equivalent to Ruby's Bundler, Python's pip, Node's NPM, Maven, etc. GHC
manages packaging itself, Cabal chooses what versions to install.

# Getting set-up

## Ubuntu

[This PPA](http://launchpad.net/~hvr/+archive/ghc) is excellent and is what I
use on all my Linux dev and build machines.

Specifically:

```bash
$ sudo apt-get update
$ sudo apt-get install python-software-properties # v12.04 and below
$ sudo apt-get install software-properties-common # v12.10 and above
$ sudo add-apt-repository -y ppa:hvr/ghc
$ sudo apt-get update
$ sudo apt-get install cabal-install-1.20 ghc-7.8.3 happy-1.19.4 alex-3.1.3
```

Then add the following to your `$PATH` (bash\_profile, zshrc, bashrc, etc):

```
~/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.3/bin:/opt/happy/1.19.4/bin:/opt/alex/3.1.3/bin
```

*Optional:* You could also add `.cabal-sandbox/bin` to your path. Code that you
are actively developing will be available to you from the command line.  This
only works when your current working directory is a cabal sandbox.

## Debian

### GHC Repository for debian stable

If you use Debian stable, it is easier to use http://deb.haskell.org/. To
use it:

- Add the line `deb http://deb.haskell.org/stable/ ./` to `/etc/apt/sources.list`

```bash
## Add the key to avoid warnings
$ GET http://deb.haskell.org/deb.haskell.org.gpg-key | apt-key add -
$ sudo apt-get update
$ sudo apt-get install ghc-7.8.3 happy alex cabal-install
```

### Using Ubuntu PPA

If you're not using stable, you can follow the same steps as Ubuntu, but will
have to execute an additional command. Immediately after
`sudo add-apt-repository -y ppa:hvr/ghc` is executed run:

```bash
$ sudo sed -i s/jessie/trusty/g /etc/apt/sources.list.d/hvr-ghc-jessie.list
```

For other Debian versions, just replace all occurences of `jessie` with your
version name in the command above.

If, for some reason, the file `/etc/apt/sources.list.d/hvr-ghc-jessie.list` does
not exist, then `/etc/apt/sources.list` should contain a line like this:

    deb http://ppa.launchpad.net/hvr/ghc/ubuntu jessie main

Replace `jessie` with `trusty` in this line.

### Manual compilation

You can follow
[this](http://www.davesquared.net/2014/05/platformless-haskell.html) guide
written for Mac OS X:

Notes:

- Set your prefix accordingly when configuring ghc.
- Instead of grabbing the `cabal-install` binary, grab the source and then run
  `bootstrap.sh` script.

## Fedora 21

To install Haskell 7.8.4 from the unofficial repo (Fedora 22+ will include it in
the official one):

```bash
$ sudo yum-config-manager --add-repo \
> https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/repo/fedora-21/petersen-ghc-7.8.4-fedora-21.repo 
$ sudo yum install ghc cabal-install
```

As stated in
[petersen/ghc-7.8.4 copr page](https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/)
this ghc cannot be installed in parallel with Fedora/EPEL ghc.

## Arch Linux

To install Haskell from the official repos on Arch Linux, run

```bash
$ sudo pacman -S cabal-install ghc happy alex haddock
```

## Gentoo

On Gentoo, you can install the individual components of the Haskell Platform
through Portage. If you use `ACCEPT_KEYWORDS=arch` (as opposed to
`ACCEPT_KEYWORDS=~arch`), Portage will install ancient versions of the various
Haskell things. With that in mind, iff you use `ACCEPT_KEYWORDS=arch`, add the
following to `/etc/portage/package.keywords`.

    dev-haskell/cabal-install
    dev-lang/ghc

Once that is done,

```bash
$ emerge -jav dev-lang/ghc dev-haskell/cabal-install
```

Gentoo keeps a "stable" (read: old) version of `cabal-install` in the Portage
tree, so you'll want to use `cabal-install` to install the more recent
version. Note that the backslashes are intentional.

```bash
$ \cabal update                # The backslashes
$ \cabal install cabal-install # are intentional
```

You have now installed cabal on a global scale with portage, and locally in your
home directory with `cabal-install`. The next step is to make sure that when you
run `cabal` in a terminal, your shell will run the up-to-date version in your
home directory. You will want to add the following lines to your shell's
configuration file:

```bash
PATH=$PATH:$HOME/.cabal/bin
alias cabal="$HOME/.cabal/bin/cabal"
```

If you don't know what your shell is, more than likely, your shell is Bash. If
you use Bash, the file you will edit is `~/.bashrc`. If you use Z-shell, the
file is `~/.zshrc`. You can run the following command to find out what your
shell is.

```bash
echo $SHELL | xargs basename
```

I use zsh, so that command outputs `zsh` when I run it.

Once you do all of that, you'll want to install the additional tools `alex` and
`happy`.

```bash
$ cabal install alex happy
```

Congratulations! You now have a working Haskell installation!

## Mac OS X

### 10.9

Install the [GHC for Mac OS X](http://ghcformacosx.github.io/) app, which
includes GHC and Cabal. It provides instructions on how to add GHC and Cabal to
your path after you've dropped the `.app` somewhere.

### 10.6-10.8

Do the binary distribution install described below with [this tarball](https://www.haskell.org/platform/download/2014.2.0.0/ghc-7.8.3-x86_64-apple-darwin-r3.tar.bz2).

## Windows

- The [windows minimal GHC installer](http://neilmitchell.blogspot.com/2014/12/beta-testing-windows-minimal-ghc.html)
  is able to compile `network` et al. Technically in beta but should work for
  the purposes of anybody reading this guide.

Don't forget to run the installer as administrator as it will want to install in
your Program Files.

## Other Linux users

Download the latest binary distributions for cabal and ghc:

- [GHC](http://www.haskell.org/ghc/).

- [Cabal](https://www.haskell.org/cabal/download.html).

#### Detailed manual install guide for Mac OS X

You don't need this if you use the .app, but if it doesn't work for you, try
[this](http://www.davesquared.net/2014/05/platformless-haskell.html) with the
binary distribution.

# Primary Courses

## Yorgey's cis194 course

> *Do this first*, this is the primary way I recommend being introduced to
> Haskell.

Available [online](http://www.seas.upenn.edu/~cis194/spring13/lectures.html).

[Brent Yorgey](https://byorgey.wordpress.com)'s course is the best I've found so
far.  This course is valuable as it will not only equip you to write basic
Haskell but also help you to understand parser combinators.

The only reason you shouldn't start with cis194 is if you are not a programmer
or are an inexperienced one. If that's the case, start with
[Thompson's book](http://www.haskellcraft.com/craft3e/Home.html) and transition
to cis194.

---

## NICTA course

> This is the course I recommend doing after Yorgey's cis194 course

Available on github [here](https://github.com/NICTA/course).

This will reinforce and give you experience directly implementing the
abstractions introduced in cis194, this is practice which is *critical* to
becoming comfortable with everyday uses of Functor/Applicative/Monad/etc. in
Haskell. Doing cis194 and then the NICTA course represents the core
recommendation of my guide and is how I teach everyone Haskell.

---

## Supplementary Course cs240h

> Provides more material on intermediate topics

Available [online](http://www.scs.stanford.edu/14sp-cs240h/).

This is [Bryan O'Sullivan](https://github.com/bos)'s online course from the
class he teaches at Stanford. If you don't know who he is, take a gander at half
the libraries any Haskell application ends up needing and his name is on it. Of
particular note if you've already done the Yorgey course are the modules on
phantom types, information flow control, language extensions, concurrency,
pipes, and lenses.

---

## Reference material for the three courses

[Learn You a Haskell for Great Good (LYAH)](http://learnyouahaskell.com) and
[Real World Haskell](http://book.realworldhaskell.org) (Thanks bos!) are
available online.

I recommend RWH as a reference (thick book). The chapters for parsing and monads
are great for getting a sense for where monads are useful. Other people have
said that they've liked it a lot. Perhaps a good follow-up for practical idioms
after you've got the essentials of Haskell down?

### What does that `<-` / `do` / list comprehension syntactic sugar do?

Excellent [article](http://www.haskellforall.com/2014/10/how-to-desugar-haskell-code.html).

### For understanding list and fold

- [Explain List Folds to Yourself](http://vimeo.com/64673035)

### For learning some common typeclasses

Useful for understanding `Functor`, `Applicative`, `Monad`, `Monoid` and other
typeclasses in general but also some Hask-specific category theory:

- The [Typeclassopedia](http://www.haskell.org/haskellwiki/Typeclassopedia)

### Understanding basic Haskell error messages

- [Understanding basic error messages](http://ics.p.lodz.pl/~stolarek/_media/pl:research:stolarek_understanding_basic_haskell_error_messages.pdf)

---

# Laziness, strictness, guarded recursion

- Marlow's [book](http://chimera.labs.oreilly.com/books/1230000000929/ch02.html)
  about parallelism and concurrency has one of the best introductions to
  laziness and normal form I've found. Use other material too if it doesn't
  stick immediately.

- [More points for lazy evaluation](http://augustss.blogspot.hu/2011/05/more-points-for-lazy-evaluation-in.html)

- [Oh my laziness!](http://alpmestan.com/posts/2013-10-02-oh-my-laziness.html)

- SO question '[Does haskell have laziness?](http://stackoverflow.com/questions/13042353/does-haskell-have-tail-recursive-optimization)'

- [Johan Tibell](https://github.com/tibbe)'s slides from a talk on
  [reasoning about laziness](http://www.slideshare.net/tibbe/reasoning-about-laziness).

## Brief demonstration

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
  Read the docs and note implementation of unsafeDupablePerformIO

Comment from Reddit thread by `glaebhoerl`

> Interesting side note: GHC needs to hide the state token representation behind
> an abstract IO type because the state token must always be used linearly (not
> duplicated or dropped), but the type system can't enforce this. Clean, another
> lazy Haskell-like language, has uniqueness types (which are like linear types
> and possibly different in ways I'm not aware of), and they expose the
> World-passing directly and provide a (non-abstract) IO monad only for
> convenience.

# Monads and monad transformers

> Do not do these until you understand typeclasses, Monoid, Functor, and
> Applicative!

Implement the standard library monads ( List, Maybe, Cont, Error, Reader,
Writer, State ) for yourself to understand them better. Then maybe write an
monadic interpreter for a small expression language using
[Monad Transformers Step by Step](http://www.cs.virginia.edu/~wh5a/personal/Transformers.pdf)
paper (mentioned in 'monad transformers' below).

Writing many interpreters by just changing the monad to change the semantics can
help convey what's going on.

- [This talk](https://vimeo.com/73648150) by Tony excellently motivates monad
  transformers, [the slides](https://dl.dropboxusercontent.com/u/7810909/talks/monad-transformers/cbaa991e0eb49224eb286c1e418e2b9828e1fb21/monad-transformers.pdf).

Also, reimplement `Control.Monad`. Functions like `mapM` or `sequence` are good
opportunities to practice writing generic monadic code.

The NICTA course can be used as a guide to this process, which will also involve
writing your own Applicative as well.

Credits:

- Reddit comment by htmltyp and Crandom [here](http://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5aj6).

- Reddit comment by jozefg [here](http://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5trg).

## Monad transformers

- [A gentle introduction to Monad Transformers](https://github.com/kqr/gists/blob/master/articles/gentle-introduction-monad-transformers.md).

- [Monad transformers step-by-step](http://www.cs.virginia.edu/~wh5a/personal/Transformers.pdf) (warning, code out of date).

# Testing, tests, specs, generative/property testing

- This [tutorial](https://github.com/kazu-yamamoto/unit-test-example/blob/master/markdown/en/tutorial.md) by Kazu Yamamoto is fantastic.

- [Simple-Conduit](https://github.com/jwiegley/simple-conduit): Good simple
  library for learning how streaming IO works in general, knowledge
  transferrable to libraries like Pipes and Conduit

# Parsing in Haskell

- Parser combinator [tutorial](https://github.com/JakeWheat/intro_to_parsing)
  for Haskell using Parsec

- [Writing your own micro-Parsec](http://olenhad.me/articles/monadic-parsers/)

## Parsing and generating JSON

Aeson is the standard [JSON](https://json.org) parsing solution in
haskell. Available from [hackage](https://hackage.haskell.org/package/aeson) and
[github](https://github.com/bos/aeson).

- [Parsing JSON using Aeson](http://blog.raynes.me/blog/2012/11/27/easy-json-parsing-in-haskell-with-aeson/)

- [Aeson and user created types](http://bitemyapp.com/posts/2014-04-11-aeson-and-user-created-types.html)

- [Parsing non-deterministic data with aeson and sum types](http://bitemyapp.com/posts/2014-04-17-parsing-nondeterministic-data-with-aeson-and-sum-types.html)

- [Aeson tutorial](https://www.fpcomplete.com/school/starting-with-haskell/libraries-and-frameworks/text-manipulation/json)

# Graph algorithms and data structures

- The [fgl package](https://hackage.haskell.org/package/fgl) particularly the
  purely functional shortest path [algos](http://hackage.haskell.org/package/fgl-5.4.2.2/docs/Data-Graph-Inductive-Query-SP.html).

- [Inductive graphs and Functional Graph Algorithms](http://web.engr.oregonstate.edu/~erwig/papers/abstracts.html#JFP01).

- [FGL/Haskell - A Functional Graph Library](http://web.engr.oregonstate.edu/~erwig/fgl/haskell/old/fgl0103.pdf).

- [Data.Graph source from Containers package](http://hackage.haskell.org/package/containers-0.5.5.1/docs/Data-Graph.html).

- The [graphs package](https://hackage.haskell.org/package/graphs).

- [SO question about PHOAS](http://stackoverflow.com/questions/24369954/separate-positive-and-negative-occurrences-of-phoas-variables-in-presence-of-rec)

- [PHOAS for free](https://www.fpcomplete.com/user/edwardk/phoas).

- [Tying the Knot](http://www.haskell.org/haskellwiki/Tying_the_Knot).

- [Hackage: dag](https://hackage.haskell.org/package/dag).

# Development Environment

## Emacs

- [Alejandro Serras's tutorial](https://github.com/serras/emacs-haskell-tutorial/blob/master/tutorial.md)

- [My dotfiles](https://github.com/bitemyapp/dotfiles/)

- [Chris Done's emacs config](https://github.com/chrisdone/chrisdone-emacs)

## Vim

- [Vim page on haskellwiki](http://www.haskell.org/haskellwiki/Vim)

- [Haskell-vim-now](https://github.com/begriffs/haskell-vim-now)

- [A vim+haskell workflow](http://www.stephendiehl.com/posts/vim_haskell.html)

- [GHC-Mod](https://github.com/kazu-yamamoto/ghc-mod)

- [GHC-Mod vim plugin](https://github.com/eagletmt/ghcmod-vim)

- [Hindent](https://github.com/chrisdone/hindent)

## Sublime Text

- [SublimeHaskell](https://github.com/SublimeHaskell/SublimeHaskell)

# FAQ and working with Cabal

## Fantastic FAQ

In addition to being an amazing guide for all kinds of things such as GADTs,
this also covers some useful basics for Cabal

- [What I wish I knew when learning Haskell](http://dev.stephendiehl.com/hask/)
  also on github [here](https://github.com/sdiehl/wiwinwlh).

## Cabal guidelines

Cabal Hell was a problem for Haskell users before the introduction of
sandboxes. Installing outside of a sandbox will install into your user
package-db. This is *not* a good idea except for foundational packages like
Cabal, alex, and happy. Nothing else should be installed in the user or global
package-dbs unless you know what you're doing.

Some best practices for avoiding cabal hell are available
[here](http://softwaresimply.blogspot.com/2014/07/haskell-best-practices-for-avoiding.html).

To experiment with a package or start a project, begin by doing
`cabal sandbox init` in a new directory.

Put briefly:

- Always use sandboxes for installing new packages, building new or existing
  projects, or starting experiments

- Use `cabal repl` to start a project-scoped ghci instance

The sandbox-based approach I suggest should avoid package-dependency problems,
but it's incompatible with the way the Haskell Platform provides pre-built
packages. If you're still learning Haskell and don't understand how ghc-pkg and
Cabal work, *avoid platform* and instead use the install instructions earlier in
the guide.

## Stackage

For any users (usually Yesod users) that have build problems, consider Stackage.

- A good summary of Stackage is
  [here](https://www.fpcomplete.com/blog/2014/05/stackage-server).

In the author's opinion, Stackage is usually more useful than `cabal freeze`.

# Hoogle and Haddock

## Search code by type signature

The [Hoogle search engine](http://www.haskell.org/hoogle/) can search by type.

For example, look at the search results for `(a -> b) -> [a] -> [b]`
[here](http://www.haskell.org/hoogle/?hoogle=%28a+-%3E+b%29+-%3E+%5ba%5d+-%3E+%5bb%5d).

Also hosted by fpcomplete [here](https://www.fpcomplete.com/hoogle).

Also [Hayoo](http://holumbus.fh-wedel.de/hayoo/hayoo.html) (which has all of
hackage enabled for search by default).

## Setting up your own local instance of Hoogle

Take a look [here](https://gist.github.com/bitemyapp/3e6a015760775e0679bf).

## Haddock

1. [Fix your hackage documentation](http://fuuzetsu.co.uk/blog/posts/2014-01-06-Fix-your-Hackage-documentation.html)

2. [Hackage documentation v2](http://fuuzetsu.co.uk/blog/posts/2014-01-06-Hackage-documentation-v2.html)

Note that these posts are *slightly out of date*: for example, now Hackage sports
shiny new info with documentation info and build status.

## What you really need to know

In order to have haddocks include documentation for related packages, you have
to set `documentation: True` in your `~/.cabal/config`. If it was left on the
default (`False`) or set to `False`, you'll have to delete all your packages and
reinstall before generating haddocks.

The other thing to keep in mind is that due to the way the `$pkg` parameter gets
interpolated *by* cabal, not by you, the `html-location` and `content-location`
parameters *must be in single quotes* and entered into a shell or contained in a
shell script. They will not work in a Makefile, because it will think they are
Make variables!

```bash
#! /usr/bin/env sh

# You can write it one one line by skipping the backslashes
cabal haddock --hoogle --hyperlink-source                       \
 --html-location='http://hackage.haskell.org/package/$pkg/docs' \
 --contents-location='http://hackage.haskell.org/package/$pkg'
```

# TravisCI

If you're as big a fan of [TravisCI](https://travis-ci.org) as I am, then I
*strongly* recommend you take a look at
[multi-ghc-travis](https://github.com/hvr/multi-ghc-travis) by as the basis of
the `travis.yml` for your Haskell projects.

# Frontend/JavaScript

We have an embarrassment of riches! There are three main choices I would
recommend:

* [Haste](http://haste-lang.org/) a Haskell to JavaScript compiler
  - The [compiler](https://github.com/valderman/haste-compiler) on github.
  - An excellent
    [demo](http://www.airpair.com/haskell/posts/haskell-tutorial-introduction-to-web-apps)
    of Haste with an example project.

* [GHCJS](https://github.com/ghcjs/ghcjs)
  - [GHCJS Introduction](http://weblog.luite.com/wordpress/?p=14)
  - [Functional Reactive Web Interfaces with GHCJS and Sodium](http://weblog.luite.com/wordpress/?p=127)
  - [Writing Atom plugins in Haskell using ghcjs ](http://edsko.net/2015/02/14/atom-haskell/)

* [PureScript](http://www.purescript.org/)
  - Not strictly Haskell like Haste and GHCJS, but a popular choice among
    Haskellers
  - Written in and inspired by haskell
  - Try purescript in you browser [here](http://try.purescript.org/)
  - Great guide for [getting started](http://www.christopherbiscardi.com/2014/06/22/getting-started-with-purescript/)

## Which frontend language do I use?

GHCJS and Haste are both fully Haskell. GHCJS will work with more Haskell
packages than Haste, but this doesn't affect a lot of frontend
projects. PureScript isn't Haskell at all, so direct code sharing with your
backend will not work.

GHCJS has the fattest runtime payload overhead at about 100kb (luite is working
on this). Haste and PureScript are competitive.

PureScript has the best JS tooling integration (uses gulp/grunt/bower), GHCJS
and Haste integrate better with Haskell's tooling (Cabal).

All three are great choices and will work for most frontend projects.

# For a more thorough understanding of laziness, NF, WHNF

- [Notes on lambda calculus](https://vec.io/posts/notes-on-lambda-calculus).

## Research papers about lazy lambda calculi

- [A call by need lambda calculus](http://homepages.inf.ed.ac.uk/wadler/topics/call-by-need.html#need-journal).

- [Demonstrating Lambda Calculus Reduction](http://www.itu.dk/~sestoft/papers/sestoft-lamreduce.pdf)

- [The lazy lambda calculus](http://www.cs.ox.ac.uk/files/293/lazy.pdf).

- [Lazy evaluation of Haskell](http://www.vex.net/~trebla/haskell/lazy.xhtlm)

# Parallelism/Concurrency

- [Parallel and Concurrent Programming in Haskell](http://chimera.labs.oreilly.com/books/1230000000929). This
  book by Simon Marlow is probably the best I've ever read on the topics of
  Parallelism and Concurrency.

- A thorough [walk-through](http://kukuruku.co/hub/haskell/haskell-testing-a-multithread-application)
  on testing & incremental development of a multi-threaded application in
  Haskell.

- [Functional Reactive Programming](http://www.haskell.org/haskellwiki/Functional_Reactive_Programming)

# Lenses and Prisms

After you're comfortable with Haskell, strongly consider learning Lenses and
Prisms, even if just as a "user". You don't need to understand the underlying
category for it to be useful.

People vastly overestimate the difficulty of using Lens. Anybody comfortable
with Functor/Foldable/Traversable (or even just the first one) can leverage
lenses and prisms to make their life happier.

If you've ever done something like: `(fmap . fmap)` you were "lensing" in your
head.

I recommend these two tutorials/introductions:

- [A little lens starter tutorial](https://www.fpcomplete.com/school/to-infinity-and-beyond/pick-of-the-week/a-little-lens-starter-tutorial)

- [Lens: Lenses, Folds and Traversals](https://github.com/ekmett/lens#lens-lenses-folds-and-traversals)

Look here for more information: [Lens package on hackage](http://hackage.haskell.org/package/lens).

# Recursion Schemes

Some of the crazy \*-morphism words you've heard are actually about
recursion. NB - before tackling this material you should know how to implement
foldr for lists and at least one other data structure, such as a tree. (folds
are catamorphisms) Knowing how to implement an unfold (anamorphism) for the same
will round things out a bit.

This material dovetails with traversable and foldable.

- [An introduction to recursion schemes](http://patrickthomson.ghost.io/an-introduction-to-recursion-schemes/)

- [Don't fear the cat](http://fho.f12n.de/posts/2014-05-07-dont-fear-the-cat.html) -
  Good demonstration of how hylomorphism is the composition of cata and ana.

- [Recursion Schemes](http://comonad.com/reader/2009/recursion-schemes/) - This
  field guide is excellent.

- [Functional Programming with Bananas, Lenses, Envelopes and Barbed Wire](http://eprints.eemcs.utwente.nl/7281/01/db-utwente-40501F46.pdf)

- [Catamorphisms](https://www.fpcomplete.com/user/edwardk/recursion-schemes/catamorphisms)

# GHC Core and performance tuning

- [Write Haskell as Fast as C](write_haskell_as_fast_as_c.md)

- [GHC Wiki: CoreSyn Type](https://ghc.haskell.org/trac/ghc/wiki/Commentary/Compiler/CoreSynType).

- [Hackage: GHC Core](https://hackage.haskell.org/package/ghc-core).

- [SO Question: Reading GHC Core](http://stackoverflow.com/questions/6121146/reading-ghc-core).

- [Haskell as fast as C](http://donsbot.wordpress.com/2008/06/04/haskell-as-fast-as-c-working-at-a-high-altitude-for-low-level-performance/).

- [Real World Haskell, Chapter 25: Profiling and Optimizations](http://book.realworldhaskell.org/read/profiling-and-optimization.html).

# Type and Category Theory

> *Not* needed to actually write Haskell, just for those interested!

If you want to follow up on type and category theory:

- [Catster's Guide](http://byorgey.wordpress.com/2014/01/14/catsters-guide/) and
  [Catster's Guide 2](http://byorgey.wordpress.com/catsters-guide-2/)

- The [haskell wikibook](http://en.wikibooks.org/wiki/Haskell/Category_theory)
  has nice diagrams

- [Category Theory](http://www.haskell.org/haskellwiki/Category_theory) on
  haskellwiki, also has good links to other resources

- [Categories from scratch](http://science.raphael.poss.name/categories-from-scratch.html), Includes some practical examples.

- Pierce's [Great Works in PL](http://www.cis.upenn.edu/~bcpierce/courses/670Fall04/GreatWorksInPL.shtml) list.

## Books

- [Quora Question: What is the best textbook for category theory?](http://www.quora.com/Category-Theory/What-is-the-best-textbook-for-Category-theory?share=1) Kmett's recommendations

- [Awodey](http://ukcatalogue.oup.com/product/9780199237180.do) and
  [MacLane](http://www.amazon.com/Categories-Working-Mathematician-Graduate-Mathematics/dp/0387984038). The standard textbooks on category theory.

- [Harper's Practical Foundations for Programming Languages](http://www.cs.cmu.edu/~rwh/plbook/book.pdf) is the best PL focused intro to type theory I've read.

- [Type theory and Functional Programming](http://www.cs.kent.ac.uk/people/staff/sjt/TTFP/).

## Stephen's Nifty "How to get to monad" posts

- [Adjunctions](http://www.stephendiehl.com/posts/adjunctions.html).

- [Monads](http://www.stephendiehl.com/posts/monads.html).

# Other fun topics

## Parametricity, ad-hoc vs. parametric polymorphism, free theorems

- [Parametricity](tony_parametricity.pdf).

- [TeX sources](https://github.com/tonymorris/parametricity/) for the
  above talk.

- [Making ad-hoc polymorphism less ad-hoc](http://swizec.com/blog/week-20-making-ad-hoc-polymorphism-less-ad-hoc/swizec/6564).

- [Theorems for Free!](http://ttic.uchicago.edu/~dreyer/course/papers/wadler.pdf).

## Initial and Final, DSLs, Finally Tagless

- [Final Encodings, Part 1: A Quick Demonstration](http://creativelad.wordpress.com/2013/11/28/final-encodings-part-1-a-quick-demonstration/).

- [Transforming Polymorphic Values](http://martijn.van.steenbergen.nl/journal/2009/10/18/transforming-polymorphic-values/).

- [GADTs in Haskell 98](http://martijn.van.steenbergen.nl/journal/2009/11/12/gadts-in-haskell-98/).

- [Typed Tagless-Final Linear Lambda Calculus](https://www.fpcomplete.com/user/mutjida/typed-tagless-final-linear-lambda-calculus).

- [Typed tagless-final interpretations: Lecture notes](http://okmij.org/ftp/tagless-final/course/course.html).

- [Typed Tagless Final Interpreters](http://okmij.org/ftp/tagless-final/course/lecture.pdf).

- [The dog that didn't bark](http://existentialtype.wordpress.com/2011/03/21/the-dog-that-didnt-bark/) less specifically relevant but interesting.

## Comonads

- [Comonads in Haskell](https://speakerdeck.com/dmoverton/comonads-in-haskell).

- [SO question: Can a Monad be a Comonad](http://stackoverflow.com/questions/16551734/can-a-monad-be-a-comonad).

## Yoneda / CoYoneda

- [SO question: Step-by-step explanation of coyoneda](http://stackoverflow.com/questions/24000465/step-by-step-deep-explain-the-power-of-coyoneda-preferably-in-scala-throu).

- Free monads for Less, a sequence of three articles by Edward Kmett
  * [Part 1: Codensity](http://comonad.com/reader/2011/free-monads-for-less/).
  * [Part 2: Yoneda](http://comonad.com/reader/2011/free-monads-for-less-2/).
  * [Part 3: Yielding IO](http://comonad.com/reader/2011/free-monads-for-less-3/).

## Propositions vs. Judgments (computation)

- [StackExchange question: What is the difference between propositions and judgements](http://cstheory.stackexchange.com/questions/9826/what-is-the-difference-between-propositions-and-judgments).

- [Lecture notes from a short, three lecture course](http://www.ae-info.org/attach/User/Martin-L%C3%B6f_Per/OtherInformation/article.pdf)

# Dependent typing

- [Grokking sum types, value constructors, and type constructors](http://bitemyapp.com/posts/2014-04-05-grokking-sums-and-constructors.html) squint hard.

- [Lightweight Dependent-type Programming](http://okmij.org/ftp/Computation/lightweight-dependent-typing.html).

- [Idris programming language](http://www.idris-lang.org/).

# Statically linking binaries

- [Static linking](https://wiki.haskell.org/Web/Literature/Static_linking)

- [Static linking with GHC on Arch Linux](http://www.edofic.com/posts/2014-05-03-ghc-arch-static.html)

- [Statically linking Linux binaries for ARM & MIPS](http://stackoverflow.com/questions/14270177/ghc-statically-linking-linux-binaries-for-arm-mips-processors)

- [Statically link GMP using GHC and LLVM](http://stackoverflow.com/questions/10539857/statically-link-gmp-to-an-haskell-application-using-ghc-llvm)

# Extended Reading list

> Some are already included here

- [Essential Haskell Reading List](http://www.stephendiehl.com/posts/essential_haskell.html)

## Dialogues

> Hosted in this repository [here](dialogues.md).

These are actually pretty important and helpful. Look here for deep dives on a
variety of topics.
