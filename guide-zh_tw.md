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


