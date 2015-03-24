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

