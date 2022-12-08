# Haskellを学ぶ

これは、他の人を助けた経験に基づくHaskellを学ぶための推奨経路であり、[Haskell Book](https://haskellbook.com)の著者の一人によるおすすめリストです。

#### _すぐに理解できないことを気にする必要はありません_. 前に進みましょう!

## コミュニティ

私たちの IRC チャンネルは `#haskell-beginners` で、[Libera Chat](https://libera.chat/)にあります。

IRCウェブクライアントは[ここ](https://web.libera.chat/)にあります。

Haskellのメーリングリストは[ここ](https://wiki.haskell.org/Mailing_lists)です。

### コミュニティ・ガイドライン

IRCチャンネルで求められる行為については、[コミュニティ・ガイドライン](coc.md)を参照してください。荒らしかどうか判然としない場合は警告処分となりますが、このチャンネルは Haskell を学習したり教えたりする人たちだけのものであることに注意してください。

# Haskell のインストール

## Haskell を始めるには Stack を使う

GHC をインストールし、プロジェクトをビルドするためには [Stack](https://haskellstack.org) を入手します。

もしStackについて何も知らず、概要を知りたいのであれば、この[Stackビデオチュートリアル](https://www.youtube.com/watch?v=sRonIB8ZStw)をチェックしてみてください。

## **Haskell Platform をインストールしないでください**

Haskell.orgの指示には従わず、Stackを入手してください。

### なぜ？

https://mail.haskell.org/pipermail/haskell-community/2015-September/000014.html

# Haskell をどのように学ぶべきですか？

13年春学期の cis1940 の講義・演習・宿題を修了した後にFPコースを受講することをお勧めします。どちらも下にリンクがあります。他の科目は選択コースです。

## Haskell プログラミングの基礎

[@dmvianna](https://github.com/dmvianna) は、以下のリソースはあくまで無料の推奨リソースであると言っています。
もし本を入手できるなら、[Haskell Book](https://haskellbook.com) を入手することを心からお勧めします。もし入手できないなら、 [サポートページ](https://haskellbook.com/support.html) から私たちにメールを送ってください。

### Haskell Book は、ここで推奨されている主要なリソースをすべて含んでいます。

## Yorgey の cis1940 コース

> Haskell Book を入手していないなら、まずこれをやってください。

[オンライン](https://www.seas.upenn.edu/~cis1940/spring13/lectures.html)で入手可能です。

[Brent Yorgey](https://byorgey.wordpress.com) のコースは、私がこれまで見つけた中で最も優れています。
このコースは、基本的な Haskell を書くだけではなく、パーサコンビネータを理解するのにも役立ちます。

あなたがプログラマーでないかまたは経験の浅い場合にはcis1940を始めるべきではありません。
そのような場合は、[Thompson's book](https://www.haskellcraft.com/craft3e/Home.html) から始めて、cis1940に移行してください。

---

## 関数型プログラミングコース

> Yorgeyのcis1940コースの後に行うことをお勧めするコースです。

GitHub上のレポジトリ[bitemyapp/fp-course](https://github.com/bitemyapp/fp-course)で公開されています。

このコースでは、cis1940で紹介された抽象化を直接実装します。これは、関手やアプリカティブ、モナドなどの使い方に慣れるために重要です。
cis1940とFPコースはこのガイドの核であり、すべての人にHaskellを教える方法なのです。

---

## cis1940とFPコースの後の補足コース

> 中級者向けのトピックをより多く提供します。

cs240h はオンラインで利用可能です。

- [14年春学期](http://www.scs.stanford.edu/14sp-cs240h/)
- [16年冬学期](http://www.scs.stanford.edu/16wi-cs240h/)

[Bryan O'Sullivan](https://github.com/bos)がスタンフォード大学で教えているクラスのオンラインコースです。
彼の名前は、Haskellアプリケーションが必要とするライブラリの約半数に載っています。特に Yorgey のコースを既に受講しているなら、ファントムタイプ、情報フロー制御、言語拡張、並行処理、パイプ、レンズ、パイプ、レンズなどのモジュールに特に注目すべきです。

---

# Haskellの特定のトピックのためのリソース

> [トピックリスト](specific_topic.md)

これらのリソースは、cis1940やFPコースのように学習者によって十分に精査されたものではありませんが、 中級・上級のコンセプトや、ツールやテキストエディタなどのテーマを含みます。

## 議論

> [議論](dialogues.md)

これらは様々なトピックを深く掘り下げており、とても重要です。
