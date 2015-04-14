# 前言

這是我推薦的學習Haskell之路。

#### 請切記：*別在你現在不懂的地方打轉，繼續讀下去就對了！*

## 社群

我們的IRC頻道是Freenode上的 `#haskell-beginners`。

IRC web版用戶端可[在這裡取得](http://webchat.freenode.net/)。

Haskell[郵件群組](https://wiki.haskell.org/Mailing_lists)。

### 社群參與須知

請參考Chris Done所撰：[Teaching](http://chrisdone.com/posts/teaching)。

請友善待人，尖酸苛薄只會把人嚇跑、令人不願再參與而已。

低劣的批評只讓你自己覺得痛快，對聽者沒有任何幫助。

不要說『這很簡單』、『這無關緊要』。你會讓人覺得花這麼多功夫才得到進展是因為自己不如人，學得慢的人通常是學得最全面的人，這是值得讚美的！

不要假做驚訝。當別人說他不知道的時候，不要表現得你很驚訝他居然不知道的樣子。他會很難過，而你除了表現得自己好像很行，你什麼也沒得到。

不要說『其實...這樣才對...』(well, actually...)。當有人說了什麼『幾乎正確』的話，而你說『其實...這樣才對』來做些微修正，這很惱人，尤其當這個修正根本跟整個對話沒什麼關係。我並不是在說黑客們不在乎真實或精確，只是像這樣的發言通常都是作秀成分居多，而非追尋真實。

---

來自[the Hacker School manual](https://www.hackerschool.com/manual)的導覽。感謝你們的釋出！

# 什麼是Haskell、GHC和Cabal？

Haskell是個依據下列報告定義的程式語言，此報告最新版本為2010版：
[onlinereport](http://www.haskell.org/onlinereport/haskell2010/)

## GHC
[GHC](http://www.haskell.org/ghc/)是使用Haskell語言最主流的方式。
它包含編譯器、直譯器、套件管理，與其他輔助工具。

## Cabal
[Cabal](https://www.haskell.org/cabal/download.html)可協助你做專案管理與相依性解析。
這會是你用來安裝專案的主要方式，而標準的做法會是安裝至其自身的沙箱中。

Cabal相當於Ruby Bundler、Python pip、Node NPM、Maven等等。GHC包裝套件，Cabal則選擇
該安裝哪些版本。

# 環境設定

## Ubuntu
[這個PPA](http://launchpad.net/~hvr/+archive/ghc)很棒，我在我所有的Linux環境與建置機上都用這個。
(build machine =?)

詳細步驟如下：

```bash
$ sudo apt-get update
$ sudo apt-get install python-software-properties # v12.04 and below
$ sudo apt-get install software-properties-common # v12.10 and above
$ sudo add-apt-repository -y ppa:hvr/ghc
$ sudo apt-get update
$ sudo apt-get install cabal-install-1.20 ghc-7.8.4 happy-1.19.4 alex-3.1.3
```

接著，把以下路徑加入你的`$PATH`環境變數中(bash\_profile, zshrc, bashrc, etc)：

```
~/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.4/bin:/opt/happy/1.19.4/bin:/opt/alex/3.1.3/bin
```

*註:* 你也可以把`.cabal-sandbox/bin`加到你的路徑中。如此一來，只要你使用cabal sandbox開發，並且
留在相對的工作路徑中，你就可以在命令列中輕易取用你正在開發的執行檔。

## Debian

### 使用Ubuntu PPA

如果你沒有使用當前穩定版本，你可以用和Ubuntu一樣的流程，但會需要在下面這個命令後：

`sudo add-apt-repository -y ppa:hvr/ghc` 另外執行：

```bash
$ sudo sed -i s/jessie/trusty/g /etc/apt/sources.list.d/hvr-ghc-jessie.list
```

對於其他的Debian版本，只要把以上所有`jessie`都換成你的版本名即可。

如果基於某種理由，`/etc/apt/sources.list.d/hvr-ghc-jessie.list`不存在，那麼`/etc/apt/sources.list`應該要有一行：

    deb http://ppa.launchpad.net/hvr/ghc/ubuntu jessie main

把`jessie`換成`trusty`即可。

### 自行編譯

請參照這篇為Mac OSX所撰寫的指南：

注意：

- 根據你的狀況，在設定ghc時指定前綴(prefix)
- 不要直接下載`cabal-install`的二元檔，下載源碼並執行其`bootstrap.sh`腳本。

## Fedora 21

從非官方套件庫安裝Haskell 7.8.4 (Fedora 22以上已經有官方版本)：

```bash
$ sudo yum-config-manager --add-repo \
> https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/repo/fedora-21/petersen-ghc-7.8.4-fedora-21.repo 
$ sudo yum install ghc cabal-install
```

根據[petersen/ghc-7.8.4 copr page](https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/)，此版本的ghc
無法與Fedora/EPEL ghc並存。

## Arch Linux

從官方套件庫安裝：

```bash
$ sudo pacman -S cabal-install ghc happy alex haddock
```

## Gentoo

你可以透過Portage安裝Haskell Platform的子組件。如果你使用`ACCEPT_KEYWORDS=arch`，而非`ACCEPT_KETWORDS=~arch`，
Portage會弄個骨灰級的Haskell給你。因此，舉凡你用了`ACCEPT_KEYWORDS=arch`，就把下面這幾行加進去：

    dev-haskell/cabal-install
    dev-lang/ghc

完成後，

```bash
$ emerge -jav dev-lang/ghc dev-haskell/cabal-install
```

Gentoo會留一個『穩定』(換言之，老舊）的`cabal-install`在Portage的套件樹中，因此你可以用這個`cabal-install`來安裝
更新的版本。請注意，以下反斜線是必須的：

```bash
$ \cabal update                # The backslashes
$ \cabal install cabal-install # are intentional
```

現在你透過Protage在global scale中安裝了cabal，以及在你的家目錄中安裝了最新的`cabal-install`。
下一步是確定每次你在終端機執行`cabal`時，你的shell都是執行你家目錄中的最新版本：

```bash
PATH=$PATH:$HOME/.cabal/bin
alias cabal="$HOME/.cabal/bin/cabal"
```

如果你不知道你的shell是哪一個，那你很可能用的是Bash。如果你用的是Bash，你需要編輯的檔案為`~/.bashrc`。
如果你用的是Z-shell，那你需要編輯的是`~/.zshrc`，你可以透過下面這個命令來確定：

```bash
echo $SHELL | xargs basename
```

例如我用的是zsh，所以上列命令會輸出`zsh`。

當以上都完成，你會想要再另外安裝兩個工具：`alex`和`happy`：

```bash
$ cabal install alex happy
```

恭喜！你現在有了一個可用的Haskell！

## Mac OS X

### 10.9

請安裝[GHC for Mac OS X](http://ghcformacosx.github.io/)，它包含了GHC與Cabal。安裝完成後，
它還會指示你如何將GHC與Cabal加入你的系統路徑。

### 10.6-10.8

下載這個[tarball](https://www.haskell.org/platform/download/2014.2.0.0/ghc-7.8.3-x86_64-apple-darwin-r3.tar.bz2)，
並安裝其binary distribution。

## Windows

- [windows minimal GHC installer](http://neilmitchell.blogspot.com/2014/12/beta-testing-windows-minimal-ghc.html)
  可以編譯`network`等套件，嚴格說來它還在beta，但應該足夠任何在讀這篇導覽的人使用。

別忘了，要用administrator的身份來執行安裝檔，因為它需要安裝到Program Files目錄的權限。

## 其他Linux使用者

下載cabal與ghc的最新版本binary distribution

- [GHC](http://www.haskell.org/ghc/).

- [Cabal](https://www.haskell.org/cabal/download.html).

# 主要課程

## Yorgey's cis194課程

> *先做這個*，這是我推薦入門Haskell的主要方式。

此課程的教材可於[線上取得](http://www.seas.upenn.edu/~cis194/spring13/lectures.html)。

[Brent Yorgey](https://byorgey.wordpress.com)的課是我目前所知最好的。它之所以好，是因為
它不只教你些基礎知識，還教你parser combinators。

如果你不是個程式設計師，或是比較沒經驗，這門課可能就沒這麼適合你。建議你從
[Thompson的這本書](http://www.haskellcraft.com/craft3e/Home.html)開始，然後再
轉到cis194。

---

## NICTA課程

> 在你完成Yorgey的cis194後，我推薦這個課程

這門課發佈在[github上](https://github.com/NICTA/course)。

透過實作cis194中所介紹過的種種抽象表述，你會有更深入的了解。這樣的練習對於
熟悉Haskell中每天都會面對的Functor/Applicative/Monad等等至關重要。
先做cis194，緊接著NICTA，是這整篇Haskell學習導覽的核心，也是我教每個人Haskell的方式。

---

## 補充課程 cs240h

> 提供更多中階以上議題的教材

[線上教材](http://www.scs.stanford.edu/14sp-cs240h/)

這是[Bryan O'Sullivan](https://github.com/bos)在Stanford所教課程的線上版。
如果你不知道他是誰，去看看Haskell的函式庫吧！幾乎一半以上常用的都有他的名字。
特別是phantom types、information flow control、language extensions、concurrency、pipes和lenses。

---

## 以上三門課程的參考材料

[Learn You a Haskell for Great Good (LYAH)](http://learnyouahaskell.com)和
[Real World Haskell](http://book.realworldhaskell.org)都可線上閱讀，謝啦！

我推薦將RWH當作參考書(它很厚！)。關於parsing和monads的章節對了解monads非常有幫助。
有些人非常喜歡它，或許是因為在你了解Haskell的基本後，一些實用例會很有幫助吧？

### `<-` / `do` / list comprehension簡便語法到底是什麼？

[很棒的解釋](http://www.haskellforall.com/2014/10/how-to-desugar-haskell-code.html)。

### 了解list和fold

- [Explain List Folds to Yourself](http://vimeo.com/64673035)

### 學習常用的typeclasses

對瞭解`Functor`、`Applicative`、`Monad`、`Monoid｀和其他typeclasses很有幫助，而且還有
些針對Haskell的category theory：

- The [Typeclassopedia](http://www.haskell.org/haskellwiki/Typeclassopedia)

### 了解基本的Haskell錯誤訊息

- [Understanding basic error messages](http://ics.p.lodz.pl/~stolarek/_media/pl:research:stolarek_understanding_basic_haskell_error_messages.pdf)

---

# Laziness, strictness, guarded recursion

- [Marlow關於平行與同步的書](http://chimera.labs.oreilly.com/books/1230000000929/ch02.html)中，關於laziness與normal form的介紹
  是我所看過最好的。Use other material too if it doesn't stick immediately.

- [More points for lazy evaluation](http://augustss.blogspot.hu/2011/05/more-points-for-lazy-evaluation-in.html)

- [Oh my laziness!](http://alpmestan.com/posts/2013-10-02-oh-my-laziness.html)

- SO上的討論串'[Does haskell have laziness?](http://stackoverflow.com/questions/13042353/does-haskell-have-tail-recursive-optimization)'

- [Johan Tibell](https://github.com/tibbe)'在[reasoning about laziness](http://www.slideshare.net/tibbe/reasoning-about-laziness)這個talk的投影片

## 演示

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
  請讀unsafeDupablePerformIO的文件和實作筆記。

`glaebhoerl`在Reddit討論串的留言：

> Interesting side note: GHC需要將state token representation隱藏在抽象的IO型別後面，
> 因為state token必須線性地使用，不能複製或丟棄，但型別系統無法強制這件事。
> 某個乾淨、lazy、類似Haskell的語言的型別有uniqueness特性(類似linear type，但可能有些
> 我沒意識到的細微差別)，為了方便，它直接暴露World-passing並提供非抽象的IO monad。

# Monads and monad transformers

> 在你了解typeclasses、Monoid、Functor和Applicative之前，請不要做下列練習！

嘗試自行實作標準函式庫中的monads(List、Maybe、Cont、Error、Reader、Writer、State)，可以讓你
更了解它們。再來，不妨嘗試用下述技術實作一個小型expression language的monadic直譯器：
[Monad Transformers Step by Step](http://www.cs.virginia.edu/~wh5a/personal/Transformers.pdf)

透過用不同的monad改變語意，從而產生不同的直譯器，help convey what's going on。

- [Tony的演講](https://vimeo.com/73648150)完美演繹為何需要monad transformer，
  [投影片在此](https://dl.dropboxusercontent.com/u/7810909/talks/monad-transformers/cbaa991e0eb49224eb286c1e418e2b9828e1fb21/monad-transformers.pdf).

再來，實作`Control.Monad`中的函數，例如：`mapM`或`sequence`是個練習撰寫generic monadic code的好機會。

前面提到過的NICTA課程也可以用來當這個過程的指南，它也包括了如何撰寫你自己的Applicative。

Credits:

- Reddit上htmltyp和Crandom的[留言](http://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5aj6)。

- Reddit上jozefg[的留言](http://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5trg)。

## Monad transformers

- [A gentle introduction to Monad Transformers](https://github.com/kqr/gists/blob/master/articles/gentle-introduction-monad-transformers.md)。

- [Monad transformers step-by-step](http://www.cs.virginia.edu/~wh5a/personal/Transformers.pdf) (警告：程式碼已過期)。

# Testing, tests, specs, generative/property testing

- Kazu Yamamoto的[這篇教學](https://github.com/kazu-yamamoto/unit-test-example/blob/master/markdown/en/tutorial.md)  堪稱典範！

- [Simple-Conduit](https://github.com/jwiegley/simple-conduit)：這個簡單的函式庫對於學習IO串流如何工作很有幫助，
  所學亦可應用在其他函式庫，例如Pipes和Conduit。 

# Parsing in Haskell

- Parser combinator [tutorial](https://github.com/JakeWheat/intro_to_parsing)
  for Haskell using Parsec

- [Writing your own micro-Parsec](http://olenhad.me/articles/monadic-parsers/)

## Parsing與產生JSON

Aeson是Haskell標準的[JSON](https://json.org)parsing解決方案。你可以從[hackage](https://hackage.haskell.org/package/aeson)或[github](https://github.com/bos/aeson)取得。

- [Parsing JSON using Aeson](http://blog.raynes.me/blog/2012/11/27/easy-json-parsing-in-haskell-with-aeson/)

- [Aeson and user created types](http://bitemyapp.com/posts/2014-04-11-aeson-and-user-created-types.html)

- [Parsing non-deterministic data with aeson and sum types](http://bitemyapp.com/posts/2014-04-17-parsing-nondeterministic-data-with-aeson-and-sum-types.html)

- [Aeson教學](https://www.fpcomplete.com/school/starting-with-haskell/libraries-and-frameworks/text-manipulation/json)

# 圖學演算法與資料結構

- [fgl套件](https://hackage.haskell.org/package/fgl)。純函數式的最短路徑[演算法](http://hackage.haskell.org/package/fgl-5.4.2.2/docs/Data-Graph-Inductive-Query-SP.html)值得一看。

- [Inductive graphs and Functional Graph Algorithms](http://web.engr.oregonstate.edu/~erwig/papers/abstracts.html#JFP01).

- [FGL/Haskell - A Functional Graph Library](http://web.engr.oregonstate.edu/~erwig/fgl/haskell/old/fgl0103.pdf).

- [Containers套件中的Data.Graph源碼](http://hackage.haskell.org/package/containers-0.5.5.1/docs/Data-Graph.html).

- [graphs套件](https://hackage.haskell.org/package/graphs).

- [SO關於PHOAS的討論串](http://stackoverflow.com/questions/24369954/separate-positive-and-negative-occurrences-of-phoas-variables-in-presence-of-rec)

- [免費的PHOAS](https://www.fpcomplete.com/user/edwardk/phoas).

- [Tying the Knot](http://www.haskell.org/haskellwiki/Tying_the_Knot).

- [Hackage: dag](https://hackage.haskell.org/package/dag).

# 開發環境

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

# Cabal常見問答

## 一篇超讚的常見問答

不但對各種主題都有很好的導覽，也包含了Cabal的一些重要基礎。
- [What I wish I knew when learning Haskell](http://dev.stephendiehl.com/hask/)


## Cabal導覽
在引入沙箱(sandbox)前，Cabal地獄(Cabal Hell)對所有Haskell使用者來說都是一大問題。
在沙箱外安裝的套件會直接裝在你的用戶套件資料庫(user pacakge-db)中。除非是常用的基礎套件，
例如Cabal、alex、happy等，這絕不是個好方法。除非你很清楚你自己在做什麼，任何套件都不該
安裝在用戶資料褲或全域資料庫(global package-db)。

這裏有些如何避免Cabal地獄的[最佳指南](http://softwaresimply.blogspot.com/2014/07/haskell-best-practices-for-avoiding.html)。

如果要實驗新套件，或是起始新專案，在一個新目錄中執行`cabal sandbox init`。

簡言之：

- 無論是安裝新套件、建置新舊專案、做任何實驗，用沙箱。
- 用`cabal repl`來啟動project-scoped ghci實體。

我所建議這種以沙箱為基礎的方式，應該可以避免套件相依性的問題。但這與Haskell Platform提供
預先編譯套件的方法不相容。如果你還在學習Haskell，而且不太了解ghc-pkg和Cabal如何運作，
*不要用Haskell Platform*，改用前面所提的安裝方式。

## Stackage

如果你面臨一些建置上的問題(特別是Yesod)，不妨考慮用Stackage

- [Stackage是什麼](https://www.fpcomplete.com/blog/2014/05/stackage-server)

據作者所言，Stackage通常比`cabal freeze`更實用。

# Hoogle與Haddock

## 依型別表述搜尋源碼

[Hoogle搜尋引擎](http://www.haskell.org/hoogle/)可依型別搜尋。

比方說，請看以下搜尋`(a -> b) -> [a] -> [b]`的結果：

[搜尋結果](http://www.haskell.org/hoogle/?hoogle=%28a+-%3E+b%29+-%3E+%5ba%5d+-%3E+%5bb%5d).

fpcomplete所管理的[在此](https://www.fpcomplete.com/hoogle)。

另外[Hayoo](http://holumbus.fh-wedel.de/hayoo/hayoo.html)預設開啟了對所有hackage的搜尋。

## 設定你自己本地端的Hoogle

詳細方法請看[這篇文章](https://gist.github.com/bitemyapp/3e6a015760775e0679bf)。

## Haddock

1. 修正你的hackage文件 [Fix your hackage documentation](http://fuuzetsu.co.uk/blog/posts/2014-01-06-Fix-your-Hackage-documentation.html)

2. Hackage文件第二版 [Hackage documentation v2](http://fuuzetsu.co.uk/blog/posts/2014-01-06-Hackage-documentation-v2.html)

請注意，以上這些文章都*有些過期*，例如：現在Hacakge已支援shiny new info with documentation info and build status.

## 真正重要的事

為了讓haddocks含入相關套件的文件，你必須在`~/.cabal/config`設立`ducumentation: True`。如果它被設為`False`，或間接被default(`False`)關閉，你會需要刪除並重新安裝所有套件，再產生haddocks。

請記住，因為`$pkg`參數會被cabal內插，`html-location`和`content-location`參數*必須以單引號括入*，再插入shell命令或包含在shell腳本中。在Makefile中是不行的，因為它會被當作Make的變數！

```bash
#! /usr/bin/env sh

# 如果把反斜線去掉，你可以把它寫成一行
cabal haddock --hoogle --hyperlink-source                       \
 --html-location='http://hackage.haskell.org/package/$pkg/docs' \
 --contents-location='http://hackage.haskell.org/package/$pkg'
```

# TravisCI
如果你跟我一樣，是[TravisCI](https://travis-ci.org)的超級粉絲，那我*強力建議*你參考[multi-ghc-travis](https://github.com/hvr/multi-ghc-travis)為你的Haskell專案的`travis.yml`設定檔做基礎。

# 前端/JavaScript
我們的選擇多得驚人！我個人推薦三種：

* [Haste](http://haste-lang.org/) Haskell至JavaScript的編譯器。a Haskell to JavaScript compiler
  - [Github](https://github.com/valderman/haste-compiler)上的編譯器源碼
  - 範例專案的[精彩展示](http://www.airpair.com/haskell/posts/haskell-tutorial-introduction-to-web-apps)

* [GHCJS](https://github.com/ghcjs/ghcjs)
  - GHCJS簡介 [GHCJS Introduction](http://weblog.luite.com/wordpress/?p=14)
  - [Functional Reactive Web Interfaces with GHCJS and Sodium](http://weblog.luite.com/wordpress/?p=127)
  - 用Haskell搭配ghcjs撰寫Atom插件 [Writing Atom plugins in Haskell using ghcjs](http://edsko.net/2015/02/14/atom-haskell/)

* [PureScript](http://www.purescript.org/)
  - 不像Haste或GHCJS般是純Haskell，但是Haskller們的熱門選擇
  - 以Haskell實作，亦受Haskell啟發
  - 在瀏覽器上[試試](http://try.purescript.org/)
  - [起步導覽](http://www.christopherbiscardi.com/2014/06/22/getting-started-with-purescript/)

## 我用哪一種前端語言？

GHCJS和Haste都是純Haskell，GHCJS比Haste能和更多的Haskell套件相容，但這不會影響大多數的前端專案。PureScript並非Haskell，因此無法直接和你的後端分享源碼。

GHCJS的執行期payload是最大的，大約100kb (luite正在研究如何解決)，Haste和PureScript差不多。

PureScript有最好的JS工具鏈整合(用gulp/grunt/bower)，GHCJS和Haste則與Haskell工具鏈整合較佳(例如Cabal)。

以上三者都是極佳選擇，大多數的前端專案都適用。

# 想要更充分了解laziness、NF、WHNF

- [Notes on lambda calculus](https://vec.io/posts/notes-on-lambda-calculus).
 


