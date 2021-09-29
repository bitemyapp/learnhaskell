# 前言

这是根据帮助别人的经验总结而来的一条 Haskell 学习路线，其中列出了 [Haskell 书](https://haskellbook.com/)的作者之一所推荐的一系列学习资料。

#### _如果遇到不懂的地方也不要紧张。继续读下去！_

## 社群

IRC 频道：Freenode 上的 `#haskell-beginners`。

IRC web 版[客户端](http://webchat.freenode.net/)。

Haskell [邮件群组](https://wiki.haskell.org/Mailing_lists)。

### 社群参与原则

阅读我们的[社群参与原则](coc.md)，了解在 IRC 频道应遵守的原则。变相的攻讦行为将会被警告。请注意，这个频道是专为学习和教授 Haskell 的人准备的。

# 安装 Haskell

## 通过 Stack 使用 Haskell

获取 [Stack](https://haskellstack.org) 来安装 GHC 并构建你的项目。

如果你对 Stack 一无所知，又想了解一下，可以看看这个[全面的 Stack 视频教程](https://www.youtube.com/watch?v=sRonIB8ZStw)。

## 还有，不要安装 Haskell Platform

直接使用 Stack，而不要遵循 Haskell.org 里面的说明。

### 为什么不使用 platform?

https://mail.haskell.org/pipermail/haskell-community/2015-September/000014.html

# 我该如何学习 Haskell？

推荐的核心是阅读 cis194 课程（2013 年春季学期版）的讲解并完成所有习题和作业，然后是 FP 课程。下方列出了两门课的链接。其他的所有内容都可以视为选学内容，我们就在这里提一下是为了让你知道该到哪里找到它们。

## Haskell 编程：从第一原理开始

[@dmvianna](https://github.com/dmvianna) 让我告诉你，下面列出的都只是*免费*的推荐资料。如果你愿意看书，衷心推荐我们自己写的 [Haskell 书](https://haskellbook.com/)！如果你因为某些原因买不起这本书，请使用[支持页面](https://haskellbook.com/support.html)里的联系方式发邮件给我们。

### Haskell Book 书包含了这里列出的全部基础资料（包含的内容）

## Yorgey 的 cis194 课程

> 如果/你不打算买那本 Haskell 书，那就*先学习*本课程，它是最好的免费 Haskell 入门介绍。

[在线](https://www.seas.upenn.edu/~cis194/spring13/lectures.html)获取。

[Brent Yorgey](https://byorgey.wordpress.com) 的课程是迄今为止我所发现的最好的课程。 这门课程非常有价值，因为它不仅会教你编写基本的 Haskell，而且还会帮助你了解语法分析组合子。

只有当你不是程序员，或者是个缺乏经验的程序员时，你才不应该从 cis194 开始学。 如果你真的是这样，请从[Thompson 的这本书](https://www.haskellcraft.com/craft3e/Home.html)开始学并过渡到 cis194。

---

## 函数式编程课程

> 我们推荐你在完成 Yorgey 的 cis194 课程之后再学习这门课。

在 GitHub [这里](https://github.com/bitemyapp/fp-course)获取。

这门课会让你直接体验用代码实现 cis194 中介绍过的各种抽象并加深你对它们的理解。这样的练习对于让你熟悉 Haskell 中 Functor/Applicative/Monad 等等概念的日常使用至关重要。先学 cis194，然后学 FP，是我这篇指南的核心，也是我教大家 Haskell 的方式。

---

## cis194 和 FP 课程之后的补充课程

> 这门课提供了更多中级材料

cs240h 可从线上获取

- [2014 年春季学期版](http://www.scs.stanford.edu/14sp-cs240h/)
- [2016 年冬季学期版](http://www.scs.stanford.edu/16wi-cs240h/)

这是 [Bryan O'Sullivan](https://github.com/bos) 在斯坦福大学教的在线课程。如果你不知道他是谁，你可以去瞟一眼所有 Haskell 应用程序都总会需要的那些库，其中一半的库上都写着他的名字。如果你已经学过 Yorgey 的课程的话，要特别注意讲解幽灵类型、信息流控制、语言扩展、并发、管道和透镜的章节。

---

# 补充资料

这些资料不像 cis194 和 FP 课程那样经过了学习者的共同把关和评测，它们的链接都在[主题清单](/specific_topics.md)里，方便你知道从哪里开始。这里面涉及中高级的概念和课题，比如工具和文本编辑器。

## 译著

补充资料部分的旧版中译可从[这里](https://github.com/bitemyapp/learnhaskell/blob/213dcb9decdce7f6f472247f0d4b82447e015f1d/guide-zh_CN.md#---do--list-comprehension%E7%AE%80%E4%BE%BF%E8%AF%AD%E6%B3%95%E5%88%B0%E5%BA%95%E6%98%AF%E4%BB%80%E4%B9%88)获得。

## 对话记录

> 存放在[这个仓库](dialogues.md)里。

这些对话真的相当重要而会对你很有帮助，想深入了解各种主题请看这里。
