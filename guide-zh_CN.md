# 前言

这是我推荐的学习Haskell之路。

#### 请切记：*别在不懂的地方打转，先继续读下去！*

## 社群

IRC频道是Freenode上的`#haskell-beginners`。

IRC web版用户端可[在这里取得](http://webchat.freenode.net/)。

Haskell[邮件群组](https://wiki.haskell.org/Mailing_lists)。

### 社群参与原则

请参考Chris Done所撰：[Teaching](http://chrisdone.com/posts/teaching)。

请友善待人，尖酸苛薄只会把人吓跑、令人不愿再参与而已。

低劣的批评只让你自己痛快，对听者毫无帮助。

别说『这很简单』、『这没什么』。这会让人觉得要花这么多功夫来弄懂是因为自不如人，学得慢的人通常是学得最全面的人，这值得称赞！

当别人承认他不知道的时候，不要故作惊讶。这会让他难过，而你除了表现得好像很行，什么也没得到。

不要说『其实...这样才对...』(well, actually...)。当有人说了什么『几乎正确』的话，而你说些『其实...这样才对』来做些枝微末节的修正，这很恼人，尤其这常常跟整个讨论根本八竿子打不着。我并不是在说人们不在乎精确，只是像这样的发言通常是作秀成分居多，而非为了追寻真实。

---

以上部分内容来自[the Recurse Center手册](https://www.recurse.com/manual)。感谢他们愿意公开分享！

# 安装Haskell

## 通过 Stack 使用 Haskell

获取 [Stack](http://haskellstack.org) 来安装 GHC 构建你的项目。

如果你从未了解过 Stack 并需要它的概述，请看这个[comprehensive Stack video tutorial](https://www.youtube.com/watch?v=sRonIB8ZStw)。

## 不要安装 HASKELL PLATFORM

不要遵循 Haskell.org 里面的说明，直接使用 Stack。

### 为什么不用 platform?

https://mail.haskell.org/pipermail/haskell-community/2015-September/000014.html


# 主要学习课程

## Yorgey's cis194课程

> *请先通过这门课学习*，这是我最推荐入门Haskell的课。

此课程的教材可于[线上取得](http://www.seas.upenn.edu/~cis194/spring13/lectures.html)。

[Brent Yorgey](https://byorgey.wordpress.com)的课是我目前所知最好的。它之所以好，因为
它不只教你些基础知识，还教你parser combinators。

如果你不是个程序设计师，或缺乏经验，那么这门课可能没这么适合。建议你从
[Thompson的这本书](http://www.haskellcraft.com/craft3e/Home.html)开始，然后再转到cis194。

---

## FP课程

> 在你完成上述Yorgey的cis194后，我推荐继续挑战此课程。

这门课发布在[github上](https://github.com/bitemyapp/fp-course)。

透过实现cis194中所介绍过的种种抽象表述，你会有更深入的了解。这样的练习对于
熟悉Haskell中每天都会面对的Functor/Applicative/Monad等等至关重要。
先做cis194，紧接着FP，是这整篇Haskell学习导览的核心，也是我​​教每个人Haskell的方式。

---

## 补充课程cs240h

> 提供更多中阶以上议题的教材

[线上教材](http://www.scs.stanford.edu/14sp-cs240h/)

这是[Bryan O'Sullivan](https://github.com/bos)在Stanford所教课程的线上版。
如果你不知道他是谁，去翻翻Haskell的函式库吧！几乎一半以上常用的套件都有他的名字。
特别是phantom types、information flow control、language extensions、concurrency、pipes和lenses。

---

### `<-` / `do` / list comprehension简便语法到底是什么？

[很棒的解释](http://www.haskellforall.com/2014/10/how-to-desugar-haskell-code.html)。

### 了解list和fold

- [Explain List Folds to Yourself](http://vimeo.com/64673035)

### 学习常用的typeclasses

对了解`Functor`、`Applicative`、`Monad`、`Monoid｀和其他typeclasses很有帮助，而且还有
些针对Haskell的范畴论(category theory)的解释：

- [Typeclassopedia](http://www.haskell.org/haskellwiki/Typeclassopedia)

### 了解基本的Haskell错误讯息

- [Understanding basic error messages](http://ics.p.lodz.pl/~stolarek/_media/pl:research:stolarek_understanding_basic_haskell_error_messages.pdf)

---

# Laziness, strictness, guarded recursion

- [Marlow关于并行与并发的书](http://chimera.labs.oreilly.com/books/1230000000929/ch02.html)中，关于laziness与normal form的介绍
  是我所看过最好的。如果没有立即理解，不妨搭配以下补充材料。

- [More points for lazy evaluation](http://augustss.blogspot.hu/2011/05/more-points-for-lazy-evaluation-in.html)

- [Oh my laziness!](http://alpmestan.com/posts/2013-10-02-oh-my-laziness.html)

- SO上的讨论串'[Does haskell have laziness?](http://stackoverflow.com/questions/13042353/does-haskell-have-tail-recursive-optimization)'

- [Johan Tibell](https://github.com/tibbe)'在[reasoning about laziness](http://www.slideshare.net/tibbe/reasoning-about-laziness)这个演讲的投影片

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
  请读unsafeDupablePerformIO的文档和实现笔记。

`glaebhoerl`在Reddit讨论串的留言：

> 有趣的补充笔记: GHC需要将state token representation隐藏在抽象的IO类型后面，
> 因为state token必须线性地使用，不能复制或丢弃，但类型系统无法强制这件事。
> 某个干净、lazy、类似Haskell的语言有uniqueness特性(类似linear type，但可能有些
> 我没意识到的细微差别)，为了方便，它直接暴露World-passing并提供非抽象的IO monad。

# Monads and monad transformers

> 在你了解typeclasses、Monoid、Functor和Applicative之前，请不要做下列练习！

尝试自行实现标准函式库中的monads(List、Maybe、Cont、Error、Reader、Writer、State)，可以让你
更了解它们。再来，不妨尝试用下述技术实现一个小型expression language的monadic解释器：
[Monad Transformers Step by Step](http://catamorph.de/documents/Transformers.pdf)(在下列monad transformer章节亦有提及)

通过用不同的monad改变语意，从而产生不同的解释器，help convey what's going on。

再来，实现`Control.Monad`中的函数，例如：`mapM`或`sequence`是个练习撰写generic monadic code的好机会。

前面提到过的FP课程也可以用来当这个过程的指南，它也包括了如何撰写你自己的Applicative。

Credits:

- Reddit上htmltyp和Crandom的[留言](http://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5aj6)。

- Reddit上jozefg[的留言](http://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5trg)。

## Monad transformers

- [A gentle introduction to Monad Transformers](https://github.com/kqr/gists/blob/master/articles/gentle-introduction-monad-transformers.md)。

- [Monad Transformers Step by Step](http://catamorph.de/documents/Transformers.pdf)

# Testing, tests, specs, generative/property testing

- Kazu Yamamoto的[这篇教学](https://github.com/kazu-yamamoto/unit-test-example/blob/master/markdown/en/tutorial.md)堪称典范！

- [Simple-Conduit](https://github.com/jwiegley/simple-conduit)：这个简单的函式库对于学习IO串流如何工作很有帮助，
  所学亦可应用在其他函式库，例如Pipes和Conduit。

# Parsing in Haskell

- Parser combinator [tutorial](https://github.com/JakeWheat/intro_to_parsing)
  for Haskell using Parsec

- [Writing your own micro-Parsec](http://olenhad.me/articles/monadic-parsers/)

## Parsing与产生JSON

Aeson是Haskell标准的[JSON](https://json.org)parsing解决方案。你可以从[hackage](https://hackage.haskell.org/package/aeson)或[github](https://github.com/bos/aeson)取得。

- [Parsing JSON using Aeson](http://blog.raynes.me/blog/2012/11/27/easy-json-parsing-in-haskell-with-aeson/)

- [Aeson and user created types](http://bitemyapp.com/posts/2014-04-11-aeson-and-user-created-types.html)

- [Parsing non-deterministic data with aeson and sum types](http://bitemyapp.com/posts/2014-04-17-parsing-nondeterministic-data-with-aeson-and-sum-types.html)

- [Aeson教学](https://www.fpcomplete.com/school/starting-with-haskell/libraries-and-frameworks/text-manipulation/json)

# 图算法与数据结构

- [fgl套件](https://hackage.haskell.org/package/fgl)。纯函数式的最短路径[演算法](http://hackage.haskell.org/package/fgl-5.4.2.2/docs/Data-Graph-Inductive-Query-SP.html)值得一看。

- [Inductive graphs and Functional Graph Algorithms](http://web.engr.oregonstate.edu/~erwig/papers/abstracts.html#JFP01).

- [FGL/Haskell - A Functional Graph Library](http://web.engr.oregonstate.edu/~erwig/fgl/haskell/old/fgl0103.pdf).

- [Containers套件中的Data.Graph源码](http://hackage.haskell.org/package/containers-0.5.5.1/docs/Data-Graph.html).

- [graphs套件](https://hackage.haskell.org/package/graphs).

- [SO关于PHOAS的讨论串](http://stackoverflow.com/questions/24369954/separate-positive-and-negative-occurrences-of-phoas-variables-in-presence-of-rec)

- [免费的PHOAS](https://www.fpcomplete.com/user/edwardk/phoas).

- [Tying the Knot](http://www.haskell.org/haskellwiki/Tying_the_Knot).

- [Hackage: dag](https://hackage.haskell.org/package/dag).

# 开发环境

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

# Cabal常见问答

## 一篇超赞的常见问答

不但对各种主题都有很好的导览，也包含了Cabal的一些重要基础。
- [What I wish I knew when learning Haskell](http://dev.stephendiehl.com/hask/)

## Cabal导览
在引入沙箱(sandbox)前，Cabal地狱(Cabal Hell)对所有Haskell使用者来说都是一大问题。
在沙箱外安装的套件会直接装在你的用户套件资料库(user pacakge-db)中。除非是常用的基础套件，
例如Cabal、alex、happy等，这绝不是个好方法。除非你很清楚你自己在做什么，任何套件都不该
安装在用户资料库或全域资料库(global package-db)。

这里有些如何避免Cabal地狱的[最佳指南](http://softwaresimply.blogspot.com/2014/07/haskell-best-practices-for-avoiding.html)。

如果要实验新套件，或是起始新专案，在一个新目录中执行`cabal sandbox init`。

简言之：

- 无论是安装新套件、建置新旧专案、做任何实验，请用沙箱。
- 用`cabal repl`来启动project-scoped ghci实体。

我所建议这种以沙箱为基础的方式，应该可以避免套件相依性的问题。但这与Haskell Platform提供
预先编译套件的方法不相容。如果你还在学习Haskell，而且不太了解ghc-pkg和Cabal如何运作，
*不要用Haskell Platform*，改用前面所提的安装方式。

## Stackage

如果你面临一些构建上的问题(特别是Yesod)，不妨考虑用Stackage：

- [Stackage是什么](https://www.fpcomplete.com/blog/2014/05/stackage-server)

据作者所言，Stackage通常比`cabal freeze`更实用。

# Hoogle与Haddock

## 依类型签名搜索代码

[Hoogle搜索引擎](http://www.haskell.org/hoogle/)可依型别搜寻。

比方说，请看以下搜索`(a -> b) -> [a] -> [b]`的结果：

[搜索结果](http://www.haskell.org/hoogle/?hoogle=%28a+-%3E+b%29+-%3E+%5ba%5d+-%3E+%5bb%5d).

fpcomplete所管理的[在此](https://www.fpcomplete.com/hoogle)。

另外[Hayoo](http://holumbus.fh-wedel.de/hayoo/hayoo.html)预设开启了对所有hackage的搜寻。

## 设定你自己本地端的Hoogle

详细方法请看[这篇文章](https://gist.github.com/bitemyapp/3e6a015760775e0679bf)。

## Haddock

1. 修正你的hackage文件[Fix your hackage documentation](http://fuuzetsu.co.uk/blog/posts/2014-01-06-Fix-your-Hackage-documentation.html)

2. Hackage文件第二版[Hackage documentation v2](http://fuuzetsu.co.uk/blog/posts/2014-01-06-Hackage-documentation-v2.html)

请注意，以上这些文章都*有些过期*，例如：现在Hacakge已支援shiny new info with documentation info and build status.

## 真正重要的事

为了让haddocks含入相关套件的文件，你必须在`~/.cabal/config`设立`ducumentation: True`。如果它被设为`False`，或间接被default(`False`)关闭，你会需要删除并重新安装所有套件，再产生haddocks。

请记住，因为`$pkg`参数会被cabal内插，`html-location`和`content-location`参数*必须以单引号括入*，再插入shell命令或包含在shell脚本中。在Makefile中是不行的，因为它会被当作Make的变数！

```bash
#! /usr/bin/env sh

# 如果把反斜线去掉，你可以把它写成一行
cabal haddock --hoogle --hyperlink-source \
 --html-location='http://hackage.haskell.org/package/$pkg/docs' \
 --contents-location='http://hackage.haskell.org/package/$pkg'
```

# TravisCI
如果你跟我一样，是[TravisCI](https://travis-ci.org)的超级粉丝，那我*强力建议*你参考[multi-ghc-travis](https://github.com/hvr/multi-ghc-travis)为你的Haskell专案的`travis.yml`作基础。

# 前端/JavaScript
我们的选择多得惊人！我个人推荐三种：

* [Haste](http://haste-lang.org/) Haskell至JavaScript的编译器。a H​​askell to JavaScript compiler
  - [Github](https://github.com/valderman/haste-compiler)上的编译器源码
  - 范例专案的[精彩展示](http://www.airpair.com/haskell/posts/haskell-tutorial-introduction-to-web-apps)

* [GHCJS](https://github.com/ghcjs/ghcjs)
  - GHCJS简介[GHCJS Introduction](http://weblog.luite.com/wordpress/?p=14)
  - [Functional Reactive Web Interfaces with GHCJS and Sodium](http://weblog.luite.com/wordpress/?p=127)
  - 用Haskell搭配ghcjs撰写A​​tom插件[Writing Atom plugins in Haskell using ghcjs](http://edsko.net/2015/02/14/atom-haskell/)

* [PureScript](http://www.purescript.org/)
  - 不像Haste或GHCJS般是纯Haskell，但是Haskller们的热门选择
  - 以Haskell实作，亦受Haskell启发
  - 在浏览器上[试试](http://try.purescript.org/)
  - [起步导览](http://www.christopherbiscardi.com/2014/06/22/getting-started-with-purescript/)

## 我该用哪一种前端语言？

GHCJS和Haste都是纯Haskell，GHCJS比Haste能和更多的Haskell套件相容，但这不会影响大多数的前端专案。PureScript并非Haskell，因此无法直接和你的后端共享源码。

GHCJS的执行期payload是最大的，大约100kb (luite正在研究如何解决此问题)，Haste则和PureScript差不多。

PureScript有最好的JS工具链整合(用gulp/grunt/bower)，GHCJS和Haste则与Haskell工具链整合较好(例如Cabal)。

以上三者都是极佳选择，大多数的前端专案都适用。

# 想要更充分了解laziness、NF、WHNF

- [Notes on lambda calculus](https://vec.io/posts/notes-on-lambda-calculus).

## 关于lazy lambda calculus的研究论文

- [A call by need lambda calculus](http://homepages.inf.ed.ac.uk/wadler/topics/call-by-need.html#need-journal).

- [Demonstrating Lambda Calculus Reduction](http://www.itu.dk/~sestoft/papers/sestoft-lamreduce.pdf)

- [The lazy lambda calculus](http://www.cs.ox.ac.uk/files/293/lazy.pdf).

- [Lazy evaluation of Haskell](http://www.vex.net/~trebla/haskell/lazy.xhtml)

# 并行／并发(Parallelism/Concurrency)

- [Parallel and Concurrent Programming in Haskell](http://chimera.labs.oreilly.com/books/1230000000929)。在我所读过的文献中，Simon Marlow所撰的这本书是此主题的佼佼者。

- [这篇教学](http://kukuruku.co/hub/haskell/haskell-testing-a-multithread-application)带领你一步步学习如何用Haskell测试、渐进开发多绪应用程式。

- [Functional Reactive Programming](http://www.haskell.org/haskellwiki/Functional_Reactive_Programming)

# Lenses and Prisms

在你习惯Haskell后，我强烈建议你学习Lenses与Prisms。你不必了解底层的原理，只要当一个使用者，就很受用。

大家普遍误会Lens是个很难用的东西，其实任何一个了解Functor/Foldable/Traversable，甚至只知道Functor的人，都可以运用Lenses与Prisms来让他们的开发生涯更快乐。

如果你曾经做过：`(fmap . fmap)`，你其实已经有Lense的思维了。

我推荐以下两篇教学：

- [A little lens starter tutorial](https://www.fpcomplete.com/school/to-infinity-and-beyond/pick-of-the-week/a-little-lens-starter-tutorial)

- [Le​​ns: Lenses, Folds and Traversals](https://github.com/ekmett/lens#lens-lenses-folds-and-traversals)

详细资料请看这里：[Lens package on hackage](http://hackage.haskell.org/package/lens).

# 递归范式(Recursion Schemes)

你一定听过些疯狂的『\*-morphism』，他们其实只是递归。在尝试搞懂前，你应该要先知道如何为list以及至少一种其他数据结构实现foldr，例如tree (folds叫做catamorphisms)。再进一步了解如何在以上数据结构实现unfold (anamorphism)会让整体知识完善些。

以下资料与traversable和foldable的概念相合。

- [An introduction to recursion schemes](http://patrickthomson.ghost.io/an-introduction-to-recursion-schemes/)

- [Don't fear the cat](http://fho.f12n.de/posts/2014-05-07-dont-fear-the-cat.html) -
  Good demonstration of how hylomorphism is the composition of cata and ana.

- [Recursion Schemes](http://comonad.com/reader/2009/recursion-schemes/) - This
  field guide is excellent.

- [Functional Programming with Bananas, Lenses, Envelopes and Barbed Wire](http://eprints.eemcs.utwente.nl/7281/01/db-utwente-40501F46.pdf)

- [Catamorphisms](https://www.fpcomplete.com/user/edwardk/recursion-schemes/catamorphisms)

# GHC Core与效能调校

- [Write Haskell as Fast as C](write_haskell_as_fast_as_c.md)

- [GHC Wiki: CoreSyn Type](https://ghc.haskell.org/trac/ghc/wiki/Commentary/Compiler/CoreSynType).

- [Hackage: GHC Core](https://hackage.haskell.org/package/ghc-core).

- [SO Question: Reading GHC Core](http://stackoverflow.com/questions/6121146/reading-ghc-core).

- [Haskell as fast as C](http://donsbot.wordpress.com/2008/06/04/haskell-as-fast-as-c-working-at-a-high-altitude-for-low-level-performance/).

- [Real World Haskell, Chapter 25: Profiling and Optimizations](http://book.realworldhaskell.org/read/profiling-and-optimization.html).

# 类型(Type)与范畴论(Category Theory)

> 写Haskell*不用学*，仅供有兴趣的人参考！

如果你想开始学习类型与范畴论：

- [Catster's Guide](http://byorgey.wordpress.com/2014/01/14/catsters-guide/) and
  [Catster's Guide 2](http://byorgey.wordpress.com/catsters-guide-2/)

- [haskell wikibook](http://en.wikibooks.org/wiki/Haskell/Category_theory) 有不错的图解。

- Haskellwiki上的[Category Theory](http://www.haskell.org/haskellwiki/Category_theory)也有不错的参考资料。

- [Categories from scratch](http://science.raphael.poss.name/categories-from-scratch.html)，有实例。

- Pierce的[Great Works in PL](http://www.cis.upenn.edu/~bcpierce/courses/670Fall04/GreatWorksInPL.shtml)列表。

## 书籍

- Kmett推荐：[Quora Question: What is the best textbook for category theory?](http://www.quora.com/Category-Theory/What-is-the-best-textbook-for-Category-theory?share=1)

- [Awodey](http://ukcatalogue.oup.com/product/9780199237180.do)和
  [MacLane](http://www.amazon.com/Categories-Working-Mathematician-Graduate-Mathematics/dp/0387984038)。范畴学的标准教科书。

- [Harper's Practical Foundations for Programming Languages​​](http://www.cs.cmu.edu/~rwh/plbook/book.pdf)是我读过以程式语言角度切入的最佳介绍。

- [Type theory and Functional Programming](http://www.cs.kent.ac.uk/people/staff/sjt/TTFP/).

## Stephen俏皮的"How to get to monad"文章

- [Adjunctions](http://www.stephendiehl.com/posts/adjunctions.html).

- [Monads](http://www.stephendiehl.com/posts/monads.html).

# 其他有趣的主题

## Parametricity, ad-hoc vs. parametric polymorphism, free theorems

- [Parametricity](tony_parametricity.pdf).

- [TeX sources](https://github.com/tonymorris/parametricity/)上述演讲的TeX源。

- [Making ad-hoc polymorphism less ad-hoc](http://swizec.com/blog/week-20-making-ad-hoc-polymorphism-less-ad-hoc/swizec/6564).

- [Theorems for Free!](http://ttic.uchicago.edu/~dreyer/course/papers/wadler.pdf).

## Initial与Final、DSLs、与Tagless

- [Final Encodings, Part 1: A Quick Demonstration](http://creativelad.wordpress.com/2013/11/28/final-encodings-part-1-a-quick-demonstration/).

- [Transforming Polymorphic Values​​](http://martijn.van.steenbergen.nl/journal/2009/10/18/transforming-polymorphic-values​​/).

- [GADTs in Haskell 98](http://martijn.van.steenbergen.nl/journal/2009/11/12/gadts-in-haskell-98/).

- [Typed Tagless-Final Linear Lambda Calculus](https://www.fpcomplete.com/user/mutjida/typed-tagless-final-linear-lambda-calculus).

- [Typed tagless-final interpretations: Lecture notes](http://okmij.org/ftp/tagless-final/course/course.html).

- [Typed Tagless Final Interpreters](http://okmij.org/ftp/tagless-final/course/lecture.pdf).

- [The dog that didn't bark](http://existentialtype.wordpress.com/2011/03/21/the-dog-that-didnt-bark/)较无相关，但非常有趣。

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

- [Le​​cture notes from a short, three lecture course](http://www.ae-info.org/attach/User/Martin-L%C3%B6f_Per/OtherInformation/article.pdf)

# Dependent typing

- [Grokking sum types, value constructors, and type constructors](http://bitemyapp.com/posts/2014-04-05-grokking-sums-and-constructors.html) squint hard.

- [Lightweight Dependent-type Programming](http://okmij.org/ftp/Computation/lightweight-dependent-typing.html).

- [Idris programming language](http://www.idris-lang.org/).

# 静态链接二进制档 Statically linking binaries

- [Static linking](https://wiki.haskell.org/Web/Literature/Static_linking)

- [Static linking with GHC on Arch Linux](http://www.edofic.com/posts/2014-05-03-ghc-arch-static.html)

- [Statically linking Linux binaries for ARM & MIPS](http://stackoverflow.com/questions/14270177/ghc-statically-linking-linux-binaries-for-arm-mips-processors)

- [Statically link GMP using GHC and LLVM](http://stackoverflow.com/questions/10539857/statically-link-gmp-to-an-haskell-application-using-ghc-llvm)

# 补充资料

> 有部分已在本文提及

- [Essential Haskell Reading List](http://www.stephendiehl.com/posts/essential_haskell.html)

## 对话记录

> 在[本储存库中](dialogues.md)。

里面有些非常重要而有帮助的资讯，可协助你深入了解许多不同的议题。
