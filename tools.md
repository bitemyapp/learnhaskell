# Tools


## Don't install or try to use ghc-mod if you're a beginner

It's a bit fragile, more than a bit slow, and it's not worth the grief.


## Text Editors

- Emacs
  - [Install haskell-mode](https://github.com/bitemyapp/dotfiles/blob/master/.emacs#L31)
  - [Install flycheck](https://github.com/bitemyapp/dotfiles/blob/master/.emacs#L29)
  - Enable and configure Haskell, this can be just `(require 'haskell)` if you don't care about anything else.
  - [Enable flycheck](https://github.com/bitemyapp/dotfiles/blob/master/.emacs#L97)
  - Symlink Stack to `/usr/bin` or otherwise make sure flycheck can find it
  - [dunzo.](https://twitter.com/bitemyapp/status/693621160571985920)

- For Vim, we recommend [Stephen Diehl's instructions](http://www.stephendiehl.com/posts/vim_2016.html), though we'd recommend not bothering with ghc-mod if possible.

- [Sublime Text](https://github.com/SublimeHaskell/SublimeHaskell)

- [Atom](https://atom.io/packages/ide-haskell)

- [IntelliJ](https://github.com/carymrobbins/intellij-haskforce)

- Notepad++ has basic Haskell support built in.

- gedit has basic Haskell support built in.


## Other

- Haskell For Mac
