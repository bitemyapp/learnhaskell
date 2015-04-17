# 前言

這是我推薦的學習Haskell之路。

#### 請切記：*別在不懂的地方打轉，先繼續讀下去！*

## 社群

IRC頻道是Freenode上的`#haskell-beginners`。

IRC web版用戶端可[在這裡取得](http://webchat.freenode.net/)。

Haskell[郵件群組](https://wiki.haskell.org/Mailing_lists)。

### 社群參與原則

請參考Chris Done所撰：[Teaching](http://chrisdone.com/posts/teaching)。

請友善待人，尖酸苛薄只會把人嚇跑、令人不願再參與而已。

低劣的批評只讓你自己痛快，對聽者毫無幫助。

別說『這很簡單』、『這沒什麼』。這會讓人覺得要花這麼多功夫來弄懂是因為自不如人，學得慢的人通常是學得最全面的人，這值得稱讚！

當別人承認他不知道的時候，不要故作驚訝。這會讓他難過，而你除了表現得好像很行，什麼也沒得到。

不要說『其實...這樣才對...』(well, actually...)。當有人說了什麼『幾乎正確』的話，而你說些『其實...這樣才對』來做些枝微末節的修正，這很惱人，尤其這常常跟整個討論根本八竿子打不著。我並不是在說人們不在乎精確，只是像這樣的發言通常是作秀成分居多，而非為了追尋真實。

---

以上部分內容來自[the Recurse Center手冊](https://www.recurse.com/manual)。感謝他們願意公開分享！

# 什麼是Haskell、GHC和Cabal？

Haskell的規格可在下面這篇報告找到，此報告最新版本為2010版：
[onlinereport](http://www.haskell.org/onlinereport/haskell2010/)

## GHC
[GHC](http://www.haskell.org/ghc/)是Haskell語言的主流工具選擇。它包含編譯器、直譯器、套件管理，與其他輔助工具。

## Cabal
[Cabal](https://www.haskell.org/cabal/download.html)可用來做專案管理與套件相依性解析。
這會是你用來安裝專案、套件的主要工具，其常見的做法是安裝到專屬的沙箱(cabal sandbox)中。

Cabal相當於Ruby Bundler、Python pip、Node NPM、Maven等等。你可以用GHC來打包套件，Cabal則可用來選擇你想要的版本安裝。

# 環境設定

## Ubuntu
[這個PPA](http://launchpad.net/~hvr/+archive/ghc)很棒，我在我所有的Linux環境與建置用機器上都靠它。

詳細設定步驟如下：

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

*註:* 你不妨把`.cabal-sandbox/bin`加到你的路徑中。如此一來，只要你使用沙箱(cabal sandbox)開發，並且
留在專案的工作路徑中，你就可以在命令列中輕易取用你正在開發的二進位檔。

## Debian

### 使用Ubuntu PPA

如果不打算使用官方提供的穩定版本，你可以用上面提過和Ubuntu一樣的流程，但會需要在下面這個命令後：

`sudo add-apt-repository -y ppa:hvr/ghc` 加上：

```bash
$ sudo sed -i s/jessie/trusty/g /etc/apt/sources.list.d/hvr-ghc-jessie.list
```

其他的Debian版本，只需將`jessie`都換成你的版本名即可。

如果`/etc/apt/sources.list.d/hvr-ghc-jessie.list`不存在，那麼`/etc/apt/sources.list`應該會有：

    deb http://ppa.launchpad.net/hvr/ghc/ubuntu jessie main

把上列`jessie`換成`trusty`即可。

### 自行編譯

請參照這篇為Mac OSX所撰的指南：

請注意：

- 根據你個人的工作環境，設定ghc時指定目錄前綴(prefix)
- 不要直接下載`cabal-install`的二進位檔，請下載源碼並執行其`bootstrap.sh`腳本。

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

你可以透過Portage來分別安裝Haskell Platform的各個組件。如果你使用`ACCEPT_KEYWORDS=arch`，而非`ACCEPT_KETWORDS=~arch`，
Portage會弄個老舊的Haskell給你。因此，舉凡用了`ACCEPT_KEYWORDS=arch`，請把下面這幾行加進去：

    dev-haskell/cabal-install
    dev-lang/ghc

接著請執行：

```bash
$ emerge -jav dev-lang/ghc dev-haskell/cabal-install
```

Gentoo會留一個『穩定』(換言之：老舊）的`cabal-install`在Portage的套件樹中，你可以利用這個`cabal-install`來安裝
新版的`cabal-install`。請注意，以下反斜線是必須的：

```bash
$ \cabal update                # The backslashes
$ \cabal install cabal-install # are intentional
```

如此一來，你便透過Protage在系統中安裝了cabal，又在你的個人環境中安裝了最新的`cabal-install`。
下一步是確定每次你在終端機執行`cabal`時，你的shell都是執行你個人環境中的最新版本：

```bash
PATH=$PATH:$HOME/.cabal/bin
alias cabal="$HOME/.cabal/bin/cabal"
```

不知道你的shell是哪一個？那你很可能用的是Bash。如果你用的是Bash，你需要編輯`~/.bashrc`。
如果是Z-shell，則是`~/.zshrc`，可用以下面命令來查詢：

```bash
echo $SHELL | xargs basename
```

例如我用的是zsh，所以上列命令會輸出`zsh`。

當以上都完成，請再另外安裝兩個工具：`alex`和`happy`：

```bash
$ cabal install alex happy
```

恭喜！你有了一個正常運作的Haskell！

## Mac OS X

### 10.9

請安裝[GHC for Mac OS X](http://ghcformacosx.github.io/)，它包含了GHC與Cabal。安裝完成後，
它會指示你如何將GHC與Cabal加入你的系統路徑。

### 10.6-10.8

請下載這個[tarball](https://www.haskell.org/platform/download/2014.2.0.0/ghc-7.8.3-x86_64-apple-darwin-r3.tar.bz2)，
並安裝其包含的二進位版。

## Windows

- [windows minimal GHC installer](http://neilmitchell.blogspot.com/2014/12/beta-testing-windows-minimal-ghc.html)
  它可以用來編譯`network`等套件，雖然嚴格說它還在beta，但應該足夠讓任何讀這篇導覽的人使用。

別忘了，要用系統管理者的身份來安裝，因為它需要新增到Program Files的權限。

## 其他Linux使用者

下載cabal與ghc的最新版二進位檔。

- [GHC](http://www.haskell.org/ghc/).

- [Cabal](https://www.haskell.org/cabal/download.html).

# 主要學習課程

## Yorgey's cis194課程

> *請先透過這門課學習*，這是我最推薦入門Haskell的課。

此課程的教材可於[線上取得](http://www.seas.upenn.edu/~cis194/spring13/lectures.html)。

[Brent Yorgey](https://byorgey.wordpress.com)的課是我目前所知最好的。它之所以好，因為
它不只教你些基礎知識，還教你parser combinators。

如果你不是個程式設計師，或缺乏經驗，那麼這門課可能沒這麼適合。建議你從
[Thompson的這本書](http://www.haskellcraft.com/craft3e/Home.html)開始，然後再轉到cis194。

---

## NICTA課程

> 在你完成上述Yorgey的cis194後，我推薦繼續挑戰此課程。

這門課發佈在[github上](https://github.com/NICTA/course)。

透過實作cis194中所介紹過的種種抽象表述，你會有更深入的了解。這樣的練習對於
熟悉Haskell中每天都會面對的Functor/Applicative/Monad等等至關重要。
先做cis194，緊接著NICTA，是這整篇Haskell學習導覽的核心，也是我教每個人Haskell的方式。

---

## 補充課程 cs240h

> 提供更多中階以上議題的教材

[線上教材](http://www.scs.stanford.edu/14sp-cs240h/)

這是[Bryan O'Sullivan](https://github.com/bos)在Stanford所教課程的線上版。
如果你不知道他是誰，去翻翻Haskell的函式庫吧！幾乎一半以上常用的套件都有他的名字。
特別是phantom types、information flow control、language extensions、concurrency、pipes和lenses。

---

### `<-` / `do` / list comprehension簡便語法到底是什麼？

[很棒的解釋](http://www.haskellforall.com/2014/10/how-to-desugar-haskell-code.html)。

### 了解list和fold

- [Explain List Folds to Yourself](http://vimeo.com/64673035)

### 學習常用的typeclasses

對瞭解`Functor`、`Applicative`、`Monad`、`Monoid｀和其他typeclasses很有幫助，而且還有
些針對Haskell的範疇論(category theory)的解釋：

- [Typeclassopedia](http://www.haskell.org/haskellwiki/Typeclassopedia)

### 了解基本的Haskell錯誤訊息

- [Understanding basic error messages](http://ics.p.lodz.pl/~stolarek/_media/pl:research:stolarek_understanding_basic_haskell_error_messages.pdf)

---

# Laziness, strictness, guarded recursion

- [Marlow關於平行與同步的書](http://chimera.labs.oreilly.com/books/1230000000929/ch02.html)中，關於laziness與normal form的介紹
  是我所看過最好的。如果沒有立即理解，不妨搭配以下補充材料。

- [More points for lazy evaluation](http://augustss.blogspot.hu/2011/05/more-points-for-lazy-evaluation-in.html)

- [Oh my laziness!](http://alpmestan.com/posts/2013-10-02-oh-my-laziness.html)

- SO上的討論串'[Does haskell have laziness?](http://stackoverflow.com/questions/13042353/does-haskell-have-tail-recursive-optimization)'

- [Johan Tibell](https://github.com/tibbe)'在[reasoning about laziness](http://www.slideshare.net/tibbe/reasoning-about-laziness)這個演講的投影片

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

> 有趣的補充筆記: GHC需要將state token representation隱藏在抽象的IO型別後面，
> 因為state token必須線性地使用，不能複製或丟棄，但型別系統無法強制這件事。
> 某個乾淨、lazy、類似Haskell的語言的型別有uniqueness特性(類似linear type，但可能有些
> 我沒意識到的細微差別)，為了方便，它直接暴露World-passing並提供非抽象的IO monad。

# Monads and monad transformers

> 在你了解typeclasses、Monoid、Functor和Applicative之前，請不要做下列練習！

嘗試自行實作標準函式庫中的monads(List、Maybe、Cont、Error、Reader、Writer、State)，可以讓你
更了解它們。再來，不妨嘗試用下述技術實作一個小型expression language的monadic直譯器：
[Monad Transformers Step by Step](http://catamorph.de/documents/Transformers.pdf)(在下列monad transformer章節亦有提及)

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

- [Monad Transformers Step by Step](http://catamorph.de/documents/Transformers.pdf)

# Testing, tests, specs, generative/property testing

- Kazu Yamamoto的[這篇教學](https://github.com/kazu-yamamoto/unit-test-example/blob/master/markdown/en/tutorial.md)堪稱典範！

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

- 無論是安裝新套件、建置新舊專案、做任何實驗，請用沙箱。
- 用`cabal repl`來啟動project-scoped ghci實體。

我所建議這種以沙箱為基礎的方式，應該可以避免套件相依性的問題。但這與Haskell Platform提供
預先編譯套件的方法不相容。如果你還在學習Haskell，而且不太了解ghc-pkg和Cabal如何運作，
*不要用Haskell Platform*，改用前面所提的安裝方式。

## Stackage

如果你面臨一些建置上的問題(特別是Yesod)，不妨考慮用Stackage：

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

GHCJS的執行期payload是最大的，大約100kb (luite正在研究如何解決此問題)，Haste則和PureScript差不多。

PureScript有最好的JS工具鏈整合(用gulp/grunt/bower)，GHCJS和Haste則與Haskell工具鏈整合較佳(例如Cabal)。

以上三者都是極佳選擇，大多數的前端專案都適用。

# 想要更充分了解laziness、NF、WHNF

- [Notes on lambda calculus](https://vec.io/posts/notes-on-lambda-calculus).

## 關於lazy lambda calculus的研究論文

- [A call by need lambda calculus](http://homepages.inf.ed.ac.uk/wadler/topics/call-by-need.html#need-journal).

- [Demonstrating Lambda Calculus Reduction](http://www.itu.dk/~sestoft/papers/sestoft-lamreduce.pdf)

- [The lazy lambda calculus](http://www.cs.ox.ac.uk/files/293/lazy.pdf).

- [Lazy evaluation of Haskell](http://www.vex.net/~trebla/haskell/lazy.xhtml)

# 平行／並行(Parallelism/Concurrency)

- [Parallel and Concurrent Programming in Haskell](http://chimera.labs.oreilly.com/books/1230000000929)。在我所讀過的文獻中，Simon Marlow所撰的這本書是此主題的佼佼者。

- [這篇教學](http://kukuruku.co/hub/haskell/haskell-testing-a-multithread-application)帶領你一步步學習如何用Haskell測試、漸進開發多緒應用程式。

- [Functional Reactive Programming](http://www.haskell.org/haskellwiki/Functional_Reactive_Programming)
 
# Lenses and Prisms

在你習慣Haskell後，我強烈建議你學習Lenses與Prisms。你不必了解底層的原理，只要當一個使用者，就很受用。

大家普遍誤會Lens是個很難用的東西，其實任何一個了解Functor/Foldable/Traversable，甚至只知道Functor的人，都可以運用Lenses與Prisms來讓他們的開發生涯更快樂。

如果你曾經做過：`(fmap . fmap)`，你其實已經有Lense的思維了。

我推薦以下兩篇教學：

- [A little lens starter tutorial](https://www.fpcomplete.com/school/to-infinity-and-beyond/pick-of-the-week/a-little-lens-starter-tutorial)

- [Lens: Lenses, Folds and Traversals](https://github.com/ekmett/lens#lens-lenses-folds-and-traversals)

詳細資料請看這裡：[Lens package on hackage](http://hackage.haskell.org/package/lens).

# 遞迴範式 (Recursion Schemes)

你一定聽過些瘋狂的『\*-morphism』，他們其實只是遞迴。在嘗試搞懂前，你應該要先知道如何實作list至少一種其他資料結構的foldr，例如tree (folds叫做catamorphisms)。再進一步瞭解如何在以上資料結構實作unfold (anamorphism)會讓整體知識完善些。

以下資料與traversable和foldable的概念相合。

- [An introduction to recursion schemes](http://patrickthomson.ghost.io/an-introduction-to-recursion-schemes/)

- [Don't fear the cat](http://fho.f12n.de/posts/2014-05-07-dont-fear-the-cat.html) -
  Good demonstration of how hylomorphism is the composition of cata and ana.

- [Recursion Schemes](http://comonad.com/reader/2009/recursion-schemes/) - This
  field guide is excellent.

- [Functional Programming with Bananas, Lenses, Envelopes and Barbed Wire](http://eprints.eemcs.utwente.nl/7281/01/db-utwente-40501F46.pdf)

- [Catamorphisms](https://www.fpcomplete.com/user/edwardk/recursion-schemes/catamorphisms)

# GHC核心與效能調校

- [Write Haskell as Fast as C](write_haskell_as_fast_as_c.md)

- [GHC Wiki: CoreSyn Type](https://ghc.haskell.org/trac/ghc/wiki/Commentary/Compiler/CoreSynType).

- [Hackage: GHC Core](https://hackage.haskell.org/package/ghc-core).

- [SO Question: Reading GHC Core](http://stackoverflow.com/questions/6121146/reading-ghc-core).

- [Haskell as fast as C](http://donsbot.wordpress.com/2008/06/04/haskell-as-fast-as-c-working-at-a-high-altitude-for-low-level-performance/).

- [Real World Haskell, Chapter 25: Profiling and Optimizations](http://book.realworldhaskell.org/read/profiling-and-optimization.html).

# 型別(Type)與範疇論(Category Theory)

> 寫Haskell*不用學*，僅供有興趣的人參考！

如果你想開始學習型別與範疇論：

- [Catster's Guide](http://byorgey.wordpress.com/2014/01/14/catsters-guide/) and
  [Catster's Guide 2](http://byorgey.wordpress.com/catsters-guide-2/)

- [haskell wikibook](http://en.wikibooks.org/wiki/Haskell/Category_theory) 有不錯的圖解。

- Haskellwiki上的[Category Theory](http://www.haskell.org/haskellwiki/Category_theory)也有不錯的參考資料。

- [Categories from scratch](http://science.raphael.poss.name/categories-from-scratch.html)，有實例。

- Pierce的[Great Works in PL](http://www.cis.upenn.edu/~bcpierce/courses/670Fall04/GreatWorksInPL.shtml)列表。

## 書籍

- Kmett推薦：[Quora Question: What is the best textbook for category theory?](http://www.quora.com/Category-Theory/What-is-the-best-textbook-for-Category-theory?share=1)

- [Awodey](http://ukcatalogue.oup.com/product/9780199237180.do)和
  [MacLane](http://www.amazon.com/Categories-Working-Mathematician-Graduate-Mathematics/dp/0387984038)。範疇學的標準教科書。

- [Harper's Practical Foundations for Programming Languages](http://www.cs.cmu.edu/~rwh/plbook/book.pdf)是我讀過以程式語言角度切入的最佳介紹。

- [Type theory and Functional Programming](http://www.cs.kent.ac.uk/people/staff/sjt/TTFP/).

## Stephen俏皮的"How to get to monad"文章

- [Adjunctions](http://www.stephendiehl.com/posts/adjunctions.html).

- [Monads](http://www.stephendiehl.com/posts/monads.html).

# 其他有趣的主題

## Parametricity, ad-hoc vs. parametric polymorphism, free theorems

- [Parametricity](tony_parametricity.pdf).

- [TeX sources](https://github.com/tonymorris/parametricity/)上述演講的TeX源。

- [Making ad-hoc polymorphism less ad-hoc](http://swizec.com/blog/week-20-making-ad-hoc-polymorphism-less-ad-hoc/swizec/6564).

- [Theorems for Free!](http://ttic.uchicago.edu/~dreyer/course/papers/wadler.pdf).

## Initial與Final、DSLs、與Tagless

- [Final Encodings, Part 1: A Quick Demonstration](http://creativelad.wordpress.com/2013/11/28/final-encodings-part-1-a-quick-demonstration/).

- [Transforming Polymorphic Values](http://martijn.van.steenbergen.nl/journal/2009/10/18/transforming-polymorphic-values/).

- [GADTs in Haskell 98](http://martijn.van.steenbergen.nl/journal/2009/11/12/gadts-in-haskell-98/).

- [Typed Tagless-Final Linear Lambda Calculus](https://www.fpcomplete.com/user/mutjida/typed-tagless-final-linear-lambda-calculus).

- [Typed tagless-final interpretations: Lecture notes](http://okmij.org/ftp/tagless-final/course/course.html).

- [Typed Tagless Final Interpreters](http://okmij.org/ftp/tagless-final/course/lecture.pdf).

- [The dog that didn't bark](http://existentialtype.wordpress.com/2011/03/21/the-dog-that-didnt-bark/)較無相關，但非常有趣。

## Comonads

- [Comonads in Haskell](https://speakerdeck.com/dmoverton/comonads-in-haskell).

- [SO question: Can a Monad be a Comonad](http://stackoverflow.com/questions/16551734/can-a-monad-be-a-comonad).

## Yoneda / CoYoneda

- [SO question: Step-by-step explanation of coyoneda](http://stackoverflow.com/questions/24000465/step-by-step-deep-explain-the-power-of-coyoneda-preferably-in-scala-throu).

- Free monads for Less, Edward Kmett的系列文章
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

# 靜態連結二元檔Statically linking binaries

- [Static linking](https://wiki.haskell.org/Web/Literature/Static_linking)

- [Static linking with GHC on Arch Linux](http://www.edofic.com/posts/2014-05-03-ghc-arch-static.html)

- [Statically linking Linux binaries for ARM & MIPS](http://stackoverflow.com/questions/14270177/ghc-statically-linking-linux-binaries-for-arm-mips-processors)

- [Statically link GMP using GHC and LLVM](http://stackoverflow.com/questions/10539857/statically-link-gmp-to-an-haskell-application-using-ghc-llvm)

# 補充資料

> 有部分已在本文提及

- [Essential Haskell Reading List](http://www.stephendiehl.com/posts/essential_haskell.html)

## 對話記錄

> 在[本儲存庫中](dialogues.md)。

裡面有些非常重要而有幫助的資訊，可協助你深入了解許多不同的議題。

