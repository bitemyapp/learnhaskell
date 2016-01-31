# These instructions are deprecated

We now recommend you use [Stack](http://haskellstack.org) instead, but the instructions are preserved here for those that might want a minimal install.

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

# Installing GHC & Cabal

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
$ sudo apt-get install cabal-install-1.24 ghc-7.10.3 happy-1.19.5 alex-3.1.4
```

Then prepend the following to your `$PATH` (bash\_profile, zshrc, bashrc, etc):

```
export PATH=~/.cabal/bin:/opt/cabal/1.24/bin:/opt/ghc/7.10.3/bin:/opt/happy/1.19.5/bin:/opt/alex/3.1.4/bin:$PATH
```

*Optional:* You could also add `.cabal-sandbox/bin` to your path. Code that you
are actively developing will be available to you from the command line.  This
only works when your current working directory is a cabal sandbox.

## Debian

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

Once you do all of that, you'll want to install the additional tools `alex` and `happy`.
    
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

- The [Minimum GHC Installer](https://github.com/fpco/minghc#using-the-installer)
  is able to compile `network` and other libraries. It includes a minimal GHC environment along with Cabal
  and MSYS (the compiler environment that allows you to install things like `network`.

The [minghc](https://github.com/fpco/minghc) web page does have a few additional details, but note that the 
default is to install to your local AppData directory rather than a system-wide directory.
(C:\Users\<username>\AppData\Local\Programs)

## Other Linux users

Download the latest binary distributions for cabal and ghc:

- [GHC](http://www.haskell.org/ghc/).

- [Cabal](https://www.haskell.org/cabal/download.html).


## Users of other Unix-like Systems

Install GHC and Cabal from your package system, then add `~/.cabal/bin` to your `$PATH`. Finally update `cabal` and install the additional tools `alex` and `happy`.
    
```bash
$ cabal update
$ cabal install cabal-install alex happy
```
