# Как познать Haskell

Этот документ — рекомендованный путь к изучению языка Haskell, основанный на опыте помощи другим.

## Это руководство доступно на других языках:

- [In English](README.md)

- [Auf Deutsch](guide-de.md)

- [En Español](guide-es.md)

- [En Français](guide-fr.md)

- [Na Hrvatskom](guide-hr.md)

- [Bahasa Indonesia](guide-id.md)

- [In Italiano](guide-it.md)

- [日本語](guide-ja.md)

- [한국어](guide-ko.md)

- [Em Português](guide-pt.md)

- [În Română](guide-ro.md)

- [Srpski](guide-sr.md)

- [Sa Tagalog](guide-tl.md)

- [Türkçe](guide-tr.md)

- [Українською](guide-ua.md)

- [简体中文](guide-zh_CN.md)

- [繁體中文](guide-zh_tw.md)

- [Magyarul](guide-hu.md)

#### *Не мучайтесь над одним топиком, который вы не можете понять сразу*. Двигайтесь дальше!

## Сообщество

IRC канал `#haskell-beginners` на Freenode.

[IRC веб-клиент](http://webchat.freenode.net/).

[Почтовые рассылки](https://wiki.haskell.org/Mailing_lists).


### Политика сообщества

[Смотрите пост про обучение от Криса Дона](http://chrisdone.com/posts/teaching).

Будьте дружелюбны и вежливы. Грубость и хамство испугает собеседника
и оттолкнет от участия в общении.

Слабая, неконструктивная критика удовлетворяет лишь
критикующего, но не помогает критикуемому.

Не описывайте вещи как «легкие» или «тривиальные».
Вы заставляете людей чувствовать себя ужасно за то,
что они усердно и много работают ради своего прогресса.
Медленные в обучении люди зачастую самые дотошные,
этому наоборот надо радоваться!

Не симулируйте удивление. Не изображайте удивление, когда кто-либо
говорит, что он не знает что-то. Он будут чувствовать себя ужасно,
а вы не получите ничего, кроме резкости.

«Ну, на самом деле». Когда кто-либо говорит что-то почти — но не совсем — верное,
а вы говорите «ну, на самом деле...» и даете лишь мелкую правку.
Это особенно раздражает, когда поправка не относится к основной
теме разговора. Это не значит,
что этот канал не про поиск правды или что нам все равно на точность.
Просто почти все «ну, на самом деле» являются показухой, а не поиском правды.

Не делайте всю работу за обучающегося.
Если вы видите, что человек работает над проблемой,
вы не должны немедленно выдавать советы или готовые решения.
Дайте ему поработать и поизучать,
пока он сам не попросит помощи.
Избегать помех — [одна из основных причин существования #haskell-beginners](http://chrisdone.com/posts/teaching).

Никаких -измов. Расизм, сексизм, гомофобия,
трансофобия и другие виды фобий не приветствуются и не будут приняты терпимо.

---

[Правила хорошего тона от Recurse Center](https://www.recurse.com/manual). Спасибо за их публикацию Recurse Center.

# Что такое Haskell, GHC и Cabal?

Haskell — это язык программирования, изложенный в спецификациях,
последняя версия которых опубликована в 2010 году.
Эта спецификация доступна как [онлайн-документ](http://www.haskell.org/onlinereport/haskell2010/).

## GHC

[GHC](http://www.haskell.org/ghc/) — это самый популярный способ работы с языком Haskell. Он включает в себя компилятор, REPL (интерпретатор), пакетный менеджер и другие полезные вещи.

## Cabal

[Cabal](https://www.haskell.org/cabal/download.html) позволяет управлять проектами и разрешает зависимости.
При помощи него вы устанавливаете и создаете проекты, обычно в песочницу (изолированное окружение).

Cabal аналогичен Bundler в Ruby, pip в Python, NPM в Node и так далее. GHC управляет пакетами сам, Cabal решает какие версии устанавливать.

# Установка Haskell

## НЕ УСТАНАВЛИВАЙТЕ HASKELL PLATFORM

Вместо следования инструкциям на Haskell.org, смотри инструкции ниже, как установить GHC и Cabal.

# Установка GHC и Cabal

## Ubuntu

[Этот PPA](http://launchpad.net/~hvr/+archive/ghc) лучший, и именно его я использую на
всех моих серверах и локальных машинах с Linux.

А именно:
```bash
$ sudo apt-get update
$ sudo apt-get install python-software-properties # v12.04 and below
$ sudo apt-get install software-properties-common # v12.10 and above
$ sudo add-apt-repository -y ppa:hvr/ghc
$ sudo apt-get update
$ sudo apt-get install cabal-install-1.22 ghc-7.8.4 happy-1.19.5 alex-3.1.4
```

После этого, добавьте следующие пути к вашему `$PATH` (bash\_profile, zshrc, bashrc, и т. п.):

```
export PATH=$PATH:~/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.8.4/bin:/opt/happy/1.19.5/bin:/opt/alex/3.1.4/bin
```

*Опционально:* вы можете добавить также `.cabal-sandbox/bin` к вашему пути.
Код, который вы разрабатываете, будет доступен вам из командной строки.
Это работает только тогда, когда ваша текущая рабочая папка — песочница cabal.

## Debian

### Использование Ubuntu PPA

Если вы не используете стабильный дистрибутив, вы можете повторить все те же шаги,
что и для Ubuntu, но вам надо будет выполнить дополнительную команду.
Сразу после `sudo add-apt-repository -y ppa:hvr/ghc` выполните:

```bash
$ sudo sed -i s/jessie/trusty/g /etc/apt/sources.list.d/hvr-ghc-jessie.list
```

Для остальных версий Debian, просто замените все `jessie` именем вашей версии в команде выше.

Если по какой-то причине файл `/etc/apt/sources.list.d/hvr-ghc-jessie.list`
не существует, то `/etc/apt/sources.list` должен содержать строку со ссылкой вроде этой:

    deb http://ppa.launchpad.net/hvr/ghc/ubuntu jessie main

Замените `jessie` на `trusty` в этой строке.

### Сборка из исходников

Вы можете использовать
[это руководство](http://www.davesquared.net/2014/05/platformless-haskell.html), написанное для Mac OS X:

Замечания:

- Выставьте ваш префикс соответственно, когда конфигурируете ghc.
- Вместо того, чтобы забирать бинарник `cabal-install`, скачайте исходный код и запустите скрипт `bootstrap.sh`.

## Fedora 21

Чтобы установить Haskell 7.8.4 из неофициального репо (Fedora 22+ будут содержать его в официальном):

```bash
$ sudo yum-config-manager --add-repo \
> https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/repo/fedora-21/petersen-ghc-7.8.4-fedora-21.repo
$ sudo yum install ghc cabal-install
```

Как указано на странице
[petersen/ghc-7.8.4](https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/)
этот ghc не может быть установлен вместе с Fedora/EPEL ghc.

## Arch Linux

Чтобы установить Haskell из официального репо на Arch Linux, выполните:

```bash
$ sudo pacman -S cabal-install ghc happy alex haskell-haddock-library
```

## Gentoo

На Gentoo вы можете установить индивидуальные компоненты Haskell Platform через Portage.
Если вы используете `ACCEPT_KEYWORDS=arch` (вместо `ACCEPT_KEYWORDS=~arch`),
Portage установит древние версии различных компонент Haskell. Помня это, если вы используете `ACCEPT_KEYWORDS=arch`, добавьте следующие строки в `/etc/portage/package.accept_keywords`.

    dev-haskell/cabal-install ~arch
    dev-lang/ghc ~arch

Как только это сделано,


```bash
$ emerge -jav dev-lang/ghc dev-haskell/cabal-install
```

Gentoo хранит «стабильную» (читай «старую») версию `cabal-install` в дереве Portage, так что, если вы хотите использовать более современную версию `cabal-install`, выполните (заметьте, что слеши здесь нужны)

```bash
$ \cabal update                # Слеши здесь
$ \cabal install cabal-install # нужны
```

Вы установили cabal глобально через Portage и локально в вашей домашней директории с `cabal-install`.
Следующий шаг, это убедиться, что когда вы запускаете `cabal` в вашем терминале,
ваша оболочка запускает последнюю версию в вашей домашней директории.
Вам нужно добавить следующие строки к конфигурационному файлу вашей оболочки.

```bash
PATH=$PATH:$HOME/.cabal/bin
alias cabal="$HOME/.cabal/bin/cabal"
```

Если вы не знаете, какая оболочка у вас используется, то скорее всего это Bash. Если это Bash, то файл, в который вам надо добавлять эти строки — `~/.bashrc`. Если вы используете Z-shell, то это `~/.zshrc`. Вы можете понять, какая оболочка у вас используется, запустив:

```bash
echo $SHELL | xargs basename
```

Я использую zsh, так что вывод этой команды у меня выглядит как `zsh`.

После всего этого вы захотите установить дополнительные инструменты `alex` и `happy`.

```bash
$ cabal install alex happy
```

Поздравляю! Теперь у вас рабочий Haskell!

## Mac OS X

### 10.9

Установите [GHC для Mac OS X](http://ghcformacosx.github.io/) приложение,
которое включает в себя GHC и Cabal.
Оно предоставляет инструкции, как добавить GHC и Cabal в ваш путь,
после того как вы скопируете приложение `.app` куда-либо.

### 10.6—10.8

Выполните установку бинарников, которая описана ниже,
для [этого архива](https://www.haskell.org/platform/download/2014.2.0.0/ghc-7.8.3-x86_64-apple-darwin-r3.tar.bz2).

## Windows

- [Минимальный установщик GHC для Windows](http://neilmitchell.blogspot.com/2014/12/beta-testing-windows-minimal-ghc.html)
  способен скомпилировать `network` и т. п. Технически, это бета версия,
  но должна работать для тех, кто читает это руководство.

Не забудьте запустить установщик как администратор, так как он захочет установить файлы в Program Files.

## Пользователям других Linux дистрибутивов

Скачайте последние бинарники Cabal и GHC:

- [GHC](http://www.haskell.org/ghc/).

- [Cabal](https://www.haskell.org/cabal/download.html).


## Пользователям других Unix-подобных систем

Скачайте GHC и Cabal из вашего пакетного менеджера,
затем добавьте `~/.cabal/bin` в ваше `$PATH`.
После этого обновите `cabal` и установите дополнительные инструменты `alex` и `happy`.

```bash
$ cabal update
$ cabal install cabal-install alex happy
```

# Как я должен изучать Haskell?

Основная рекомендация, это читать лекции и выполнять все упражнения/домашние задания для Spring 13 версии курса cis1940.
Затем то же для курса FP.
На оба курса ссылки представлены ниже.
Все остальное может быть рассмотрено как опциональное,
и вы просто будете знать куда смотреть по определенной теме.

## Курс Yorgey cis1940

> *Выполните его в первую очередь*, это лучший путь получить представление о Haskell

Доступен [онлайн](https://www.seas.upenn.edu/~cis1940/spring13/lectures.html).

Курс от [Brent Yorgey](https://byorgey.wordpress.com), это лучшее, что я пока нашел.
Этот курс ценен тем, что он не только научит вас писать базовый код на Haskell,
но и также поможет вам понять комбинаторы парсера.

Единственная причина, по которой вам не стоит начинать с курса cis1940,
это если вы не программист или вы неопытный программист.
В этом случае, начинайте с [книги от Thompson](https://www.haskellcraft.com/craft3e/Home.html)
и после этого уже курс cis1940.

---

## Курс FP

> Этот курс мы рекомендуем выполнять после курса  Yorgey cis1940.

[Доступен на Github](https://github.com/bitemyapp/fp-course).

Этот курс укрепит и добавит опыта реализации абстракций,
представленных в курсе cis1940.
Эта практика *критически важна* для комфортного использования
в дальнейшем таких абстракций как Functor/Applicative/Monad/и т. п. в Haskell.
Выполнение cis1940 и затем FP курсов представляет собой основную рекомендацию моего руководства и того, как научить любого языку Haskell.

---

## Дополнительный курс после cis1940 и FP

> Предоставляет больше информации по продвинутым темам

cs240h доступен [онлайн](http://www.scs.stanford.edu/14sp-cs240h/).

Это онлайн курс от [Bryan O’Sullivan](https://github.com/bos), который он преподает в Стенфорде.
Если вы не знаете кто он такой, взгляните на половину библиотек,
от которых зависят все приложения на Haskell, и вы увидите его имя в их авторах.
Если вы уже закончили курс Yorgey, особого внимания в этом курсе заслуживают разделы о фантомных типах, контроле потоков информации, расширениях языка, конкурентном выполнении, pipes и линзах.

---

# Специфичные топики Haskell

Эти источники не были проверены на учащихся так,
как cis1940 и FP, но с их помощью вы поймете с чего начинать изучение определенной темы.
Они включают продвинутые и сложные темы и топики посвященные инструментам и текстовым редакторам.

### Что делает `<-` / `do` / синтаксический сахар включения списков?

Отличная [статья](http://www.haskellforall.com/2014/10/how-to-desugar-haskell-code.html).

### Для понимания списков и свертки

- [Explain List Folds to Yourself](http://vimeo.com/64673035)

### Для изучения некоторых из стандартных классов типов

Полезно для понимания `Functor`, `Applicative`, `Monad`, `Monoid` и других
классов типов в целом, а также немного специфичной для Haskell теории категорий:

- The [Typeclassopedia](http://www.haskell.org/haskellwiki/Typeclassopedia)

### Понимание базовых сообщений об ошибках в Haskell

- [Understanding basic error messages](http://ics.p.lodz.pl/~stolarek/_media/pl:research:stolarek_understanding_basic_haskell_error_messages.pdf)

---

# Laziness, strictness, guarded recursion

- [Книга Marlow](http://chimera.labs.oreilly.com/books/1230000000929/ch02.html)
  про параллелизм и конкаренси содержит одно из лучших представлений laziness
  и нормальных форм, которые я нашел. Используйте другие источники, если не поймете
  сразу из этого.

- [More points for lazy evaluation](http://augustss.blogspot.hu/2011/05/more-points-for-lazy-evaluation-in.html)

- [Oh my laziness!](http://alpmestan.com/posts/2013-10-02-oh-my-laziness.html)

- Вопрос на Stack Overflow — [Does haskell have laziness?](https://stackoverflow.com/questions/13042353/does-haskell-have-tail-recursive-optimization)

- Слайды [Johan Tibell](https://github.com/tibbe) из доклада
  [reasoning about laziness](http://www.slideshare.net/tibbe/reasoning-about-laziness).

## Краткая демонстрация

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

- [First class “statements”](http://blog.jle.im/entry/first-class-statements).

- [Haddocks for System.IO.Unsafe.unsafePerformIO](http://hackage.haskell.org/package/base-4.7.0.1/docs/System-IO-Unsafe.html#v:unsafePerformIO)
  При прочтении, обратите внимание на реализацию unsafeDupablePerformIO

Комментарий с обсуждения на Reddit от `glaebhoerl`

Перевод:

<!-- TODO: I don’t really understand this, so I can’t translate properly -->
> Интересное замечание: GHC должен скрывать отображение токена статуса
> абстрактного типа IO, потому что токен статуса должен все время быть использован
> линейно (не быть дуплицирован или сброшен), но система типов не может принудительно
> этого делать. Clean, другой ленивый подобный Haskell язык, имеет типы, гарантирующие уникальность
> (которые подобны линейным типам и возможно отличаются, но я не знаю как), и они разкрывают
> передачу в Мир напрямую и предоставляют (не абстрактную) IO монаду только для соблюдения соглашения.

Оригинал:

> Interesting side note: GHC needs to hide the state token representation behind
> an abstract IO type because the state token must always be used linearly (not
> duplicated or dropped), but the type system can’t enforce this. Clean, another
> lazy Haskell-like language, has uniqueness types (which are like linear types
> and possibly different in ways I’m not aware of), and they expose the
> World-passing directly and provide a (non-abstract) IO monad only for
> convenience.

# Монады и трансформеры монад

> Не делайте этого пока вы не поняли классы типов Monoid, Funcor и Applicative!

Реализуйте монады из стандартной библиотеки (List, Maybe, Cont, Error, Reader,
Writer, State) для себя, чтобы понять их лучше. Затем, может быть, напишите
монадный интерпретатор для маленького языка выражений используя документ
[Monad Transformers Step by Step](http://catamorph.de/documents/Transformers.pdf)
(упомянут в «трансформеры монад» ниже).

Написание многих интерпретаторов просто изменяя монаду для изменения семантики
может помочь лучше понять, что происходит.

Также, реализуйте `Control.Monad`. Функции типа `mapM` или `sequence` — хорошая
возможность попрактиковаться в написании общего кода монад.

Курс FP может быть использован как руководство для этого, он также включает написание
своего собственного Applicative.

Упоминания:

- [Комментарии](https://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5aj6) на Reddit от htmltyp и Crandom.

- [Комментарий](https://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5trg) на Reddit от jozefg.

## Трансформеры монад

- [A gentle introduction to Monad Transformers](https://github.com/kqr/gists/blob/master/articles/gentle-introduction-monad-transformers.md).

- [Monad transformers step-by-step](http://catamorph.de/documents/Transformers.pdf).

# Тестирование, тесты, спеки, generative/property тестирование

- Это [руководство](https://github.com/kazu-yamamoto/unit-test-example/blob/master/markdown/en/tutorial.md) от Kazu Yamamoto — просто фантастичecкое.

- [Simple-Conduit](https://github.com/jwiegley/simple-conduit): Хорошая простая
  библиотека для изучения, как работает стриминг IO в целом, знания, применимые также
  к таким библиотекам как Pipes и Conduit.

# Парсинг в Haskell

- [Руководство по Parser комбинаторy](https://github.com/JakeWheat/intro_to_parsing)
  для Haskell с использованием Parsec

- [Writing your own micro-Parsec](http://olenhad.me/articles/monadic-parsers/)

## Парсинг и генерация JSON

Aeson — это стандартное решение для парсинга [JSON](https://json.org) в Haskell.
Доступно из [hackage](https://hackage.haskell.org/package/aeson) и
[github](https://github.com/bos/aeson).

- [Parsing JSON using Aeson](http://blog.raynes.me/blog/2012/11/27/easy-json-parsing-in-haskell-with-aeson/)

- [Aeson and user created types](http://bitemyapp.com/posts/2014-04-11-aeson-and-user-created-types.html)

- [Parsing non-deterministic data with aeson and sum types](http://bitemyapp.com/posts/2014-04-17-parsing-nondeterministic-data-with-aeson-and-sum-types.html)

- [Aeson tutorial](https://www.fpcomplete.com/school/starting-with-haskell/libraries-and-frameworks/text-manipulation/json)

# Алгоритмы графов и структуры данных

- [Пакет fgl](https://hackage.haskell.org/package/fgl) частично чисто функциональный кратчайший путь
  [algos](http://hackage.haskell.org/package/fgl-5.4.2.2/docs/Data-Graph-Inductive-Query-SP.html).

- [Inductive graphs and Functional Graph Algorithms](http://web.engr.oregonstate.edu/~erwig/papers/abstracts.html#JFP01).

- [FGL/Haskell — A Functional Graph Library](http://web.engr.oregonstate.edu/~erwig/fgl/haskell/old/fgl0103.pdf).

- [Data.Graph source from Containers package](http://hackage.haskell.org/package/containers-0.5.5.1/docs/Data-Graph.html).

- [Пакет graphs](https://hackage.haskell.org/package/graphs).

- [SO вопрос про PHOAS](https://stackoverflow.com/questions/24369954/separate-positive-and-negative-occurrences-of-phoas-variables-in-presence-of-rec)

- [PHOAS бесплатно](https://www.fpcomplete.com/user/edwardk/phoas).

- [Tying the Knot](http://www.haskell.org/haskellwiki/Tying_the_Knot).

- [Hackage: dag](https://hackage.haskell.org/package/dag).

# Окружение разработки

## Emacs

- [Alejandro Serras’s tutorial](https://github.com/serras/emacs-haskell-tutorial/blob/master/tutorial.md)

- [My dotfiles](https://github.com/bitemyapp/dotfiles/)

- [Chris Done’s emacs config](https://github.com/chrisdone/chrisdone-emacs)

## Vim

- [Vim page on haskellwiki](http://www.haskell.org/haskellwiki/Vim)

- [Haskell-vim-now](https://github.com/begriffs/haskell-vim-now)

- [GHC-Mod](https://github.com/kazu-yamamoto/ghc-mod)

- [GHC-Mod vim plugin](https://github.com/eagletmt/ghcmod-vim)

- [Hindent](https://github.com/chrisdone/hindent)

## Sublime Text

- [SublimeHaskell](https://github.com/SublimeHaskell/SublimeHaskell)

# Работа с Cabal

## Руководства по Cabal

Cabal Hell был проблемой для пользователей Haskell до появления песочниц (sandboxes).
Установка вне песочницы происходит в вашу пользовательскую базу данных пакетов.
Это *не очень* хорошая идея, за исключением основных пакетов, таких как Cabal, alex и happy.
Более ничто не должно быть установлено глобально или в пользовательскую базу данных пакетов,
если вы не уверены в том, что делаете.

 [Советы](http://softwaresimply.blogspot.com/2014/07/haskell-best-practices-for-avoiding.html) как избежать cabal hell.

Для экспериментов с пакетом или в начале нового проекта, начните с команды
`cabal sandbox init` в новой папке.

Кратко:

- Всегда используйте песочницы для установки новых пакетов, создания новых проектов,
  или для экспериментов.

- Используйте `cabal repl` для использования ghci внутри проекта.

Основанный на песочницах подход, который я советую, поможет избежать проблем с
зависимостями пакетов, но он не совместим со способом, предоставляемым Haskell Platform для
собранных пакетов. Если вы все еще изучаете Haskell и не понимаете как ghc-pkg и Cabal
работает, *избегайте платформу* и вместо этого используйте инструкции по установке, описанные выше.

## Stackage

Для любых пользователей (обычно для пользователей Yesod), которые испытывают проблемы со сборкой,
существует Stackage.

- [Хороший обзор Stackage](https://www.fpcomplete.com/blog/2014/05/stackage-server).

По мнению автора, Stackage обычно более полезен, чем `cabal freeze`.

# Hoogle и Haddock

## Поиск кода по сигнатуре типов

[Поисковый движок Hoogle](http://www.haskell.org/hoogle/) может искать по типам.

Например, взгляните на результат поиска для [`(a -> b) -> [a] -> [b]`](http://www.haskell.org/hoogle/?hoogle=%28a+-%3E+b%29+-%3E+%5ba%5d+-%3E+%5bb%5d).

Так же он доступен [на fpcomplete](https://www.fpcomplete.com/hoogle).

Еще есть [Hayoo](http://holumbus.fh-wedel.de/hayoo/hayoo.html) (который включает все пакеты
hackage для поиска по дефолту).

## Разворачивание собственного локального Hoogle

Взгляните [сюда](https://gist.github.com/bitemyapp/3e6a015760775e0679bf).

## Haddock

1. [Fix your hackage documentation](http://fuuzetsu.co.uk/blog/posts/2014-01-06-Fix-your-Hackage-documentation.html)

2. [Hackage documentation v2](http://fuuzetsu.co.uk/blog/posts/2014-01-06-Hackage-documentation-v2.html)

Заметьте, что эти публикации *слегка устарели*: например, теперь Hackage поддерживает
новую информацию с информацией о документации и статус сборки.

## Что вам правда нужно знать

Чтобы haddock включал документацию для зависимых пакетов, вам нужно выставить
`documentation: True` в вашем `~/.cabal/config`. Если это было выставлено по дефолту (`False`)
или выставлено непосредственно в `False`, вам нужно будет удалить все ваши пакеты
и переустановить перед генерацией haddock.

Другая вещь, о которой надо помнить, это то, что из-за способа, которым `$pkg` параметр
интерполируется *посредством* cabal, не вами, `html-location` и `content-location`
параметры *должны быть в одиночных кавычках* и набираться в оболочке или содержаться в
shell-скрипте. Они не будут работать в Makefile, потому что haddock будет думать, что они
являются переменными Make!

```bash
#! /usr/bin/env sh

# Вы можете набирать это одной строкой без обратных слешей
cabal haddock --hoogle --hyperlink-source                       \
 --html-location='http://hackage.haskell.org/package/$pkg/docs' \
 --contents-location='http://hackage.haskell.org/package/$pkg'
```

# TravisCI

Если вы такой же большой фанат [TravisCI](https://travis-ci.org) как я,
тогда *очень* рекомендую вам взглянуть на
[multi-ghc-travis](https://github.com/hvr/multi-ghc-travis) как основу для
`travis.yml` ваших Haskell проектов.

# Frontend/JavaScript

Мы обладаем огромными богатствами! Есть три основных вещи, которые я рекомендую:

* [Haste](http://haste-lang.org/) компилятор Haskell в JavaScript
  - [Компилятор](https://github.com/valderman/haste-compiler) на github
  - [Отличное демо](http://www.airpair.com/haskell/posts/haskell-tutorial-introduction-to-web-apps)
    Haste с примером проекта

* [GHCJS](https://github.com/ghcjs/ghcjs)
  - [GHCJS Introduction](http://weblog.luite.com/wordpress/?p=14)
  - [Functional Reactive Web Interfaces with GHCJS and Sodium](http://weblog.luite.com/wordpress/?p=127)
  - [Writing Atom plugins in Haskell using ghcjs ](http://edsko.net/2015/02/14/atom-haskell/)

* [PureScript](http://www.purescript.org/)
  - Не совсем Haskell как Haste или GHCJS, но популярный выбор многих пользователей Haskell.
  - Написан и вдохновлен языком Haskell.
  - Попробуйте [PureScript](http://try.purescript.org/) в вашем браузере.
  - Отличное руководство для [начала](https://www.christopherbiscardi.com/2014/6/22/getting-started-with-purescript/).

## Какой фронтенд язык мне использовать?

GHCJS и Haste оба являются полноценным Haskell. GHCJS будет работать с большим
числом пакетов, нежели Haste, но это не затрагивает большинство фронтенд проектов.
PureScript совсем не Haskell, так что использовать Haskell код из вашего бекенда совсем не получится.

GHCJS имеет самое быстрое время выполнение на уровне 100kb (luite работает на этом).
Haste и PureScript сравнимы.

PureScript имеет наилучшую интеграцию с JS инструментами (использует gulp/grunt/bower),
GHCJS и Haste интегрируются лучше с инструментами Haskell (Cabal).

Все три являются отличным выбором и будут работать для большинства фронтэнд проектов.

# Для более глубокого понимания laziness, NF, WHNF

- [Notes on lambda calculus](https://vec.io/posts/notes-on-lambda-calculus)

## Исследовательские документы про lazy lambda calculi

- [A call by need lambda calculus](http://homepages.inf.ed.ac.uk/wadler/topics/call-by-need.html#need-journal)

- [Demonstrating Lambda Calculus Reduction](http://www.itu.dk/~sestoft/papers/sestoft-lamreduce.pdf)

- [The lazy lambda calculus](http://www.cs.ox.ac.uk/files/293/lazy.pdf)

- [Lazy evaluation of Haskell](http://www.vex.net/~trebla/haskell/lazy.xhtml)

# Parallelism/Concurrency

- [Parallel and Concurrent Programming in Haskell](http://chimera.labs.oreilly.com/books/1230000000929).
  Эта книга от Simon Marlow, наверное лучшее, что я когда-либо читал о параллелизме и конкаренси.

- Хорошее [руководство](http://kukuruku.co/hub/haskell/haskell-testing-a-multithread-application)
  по тестированию и инкрементальной разработке многопоточного приложения в Haskell.

- [Functional Reactive Programming](http://www.haskell.org/haskellwiki/Functional_Reactive_Programming).

# Линзы и призмы

Как только вы почувствуете себя комфортно с Haskell, очень рекомендую изучить Lenses
и Prisms, даже лишь в качестве «пользователя». Вам не обязательно нужно понимать лежащую
в основе категорию для того, чтобы они были полезны.

Люди зачастую завышают сложность использования линз. Все, кто комфортно чувствует
себя используя Functor/Foldable/Traversable (или даже если лишь первый) могут
начать использовать линзы и призмы для облегчения своей жизни.

Если вы когда-либо делали что-то вроде: `(fmap . fmap)`, вы уже «использовали линзы»
в своей голове.

Я рекомендую следующие два руководства:

- [A little lens starter tutorial](https://www.fpcomplete.com/school/to-infinity-and-beyond/pick-of-the-week/a-little-lens-starter-tutorial)

- [Lens: Lenses, Folds and Traversals](https://github.com/ekmett/lens#lens-lenses-folds-and-traversals)

За дальнейшей информацией смотрите: [Lens package on hackage](http://hackage.haskell.org/package/lens).

# Схемы рекурсии

Некоторые сумасшедшие \*-morphism слова, которые вы могли слышать, на самом деле о рекурсии.
Но перед тем как трогать этот материал, вы должны знать как реализовать
foldr для списков и хотя бы одну структуру данных, такую как дерево. (folds являются
catamorphisms). Знание о том, как реализовать unfold (anamorphism), также помогут в осознании этих вещей.

Этот материал согласуется с traversable и foldable.

- [An introduction to recursion schemes](http://patrickthomson.ghost.io/an-introduction-to-recursion-schemes/)

- [Don’t fear the cat](http://fho.f12n.de/posts/2014-05-07-dont-fear-the-cat.html) — хорошая демонстрация того, как hylomorphism, это композиция из cata и ana

- [Recursion Schemes](http://comonad.com/reader/2009/recursion-schemes/) — это
  руководство просто замечательно!

- [Functional Programming with Bananas, Lenses, Envelopes and Barbed Wire](http://eprints.eemcs.utwente.nl/7281/01/db-utwente-40501F46.pdf)

- [Catamorphisms](https://www.fpcomplete.com/user/edwardk/recursion-schemes/catamorphisms)

# Ядро GHC и настройка производительности

- [Write Haskell as Fast as C](write_haskell_as_fast_as_c.md)

- [GHC Wiki: CoreSyn Type](https://ghc.haskell.org/trac/ghc/wiki/Commentary/Compiler/CoreSynType)

- [Hackage: GHC Core](https://hackage.haskell.org/package/ghc-core)

- [SO Question: Reading GHC Core](https://stackoverflow.com/questions/6121146/reading-ghc-core)

- [Haskell as fast as C](http://donsbot.wordpress.com/2008/06/04/haskell-as-fast-as-c-working-at-a-high-altitude-for-low-level-performance/)

- [Real World Haskell, Chapter 25: Profiling and Optimizations](http://book.realworldhaskell.org/read/profiling-and-optimization.html)

# Тип и теория категорий

> *Не* необходимо для работы с Haskell, просто для тех, кто интересуется!

Если вы хотите вникнуть в типы и теорию категорий:

- [Catster’s Guide](http://byorgey.wordpress.com/2014/01/14/catsters-guide/) и
  [Catster’s Guide 2](http://byorgey.wordpress.com/catsters-guide-2/).

- [Вики-книга haskell](http://en.wikibooks.org/wiki/Haskell/Category_theory)
  содержит неплохие диаграммы.

- [Category Theory](http://www.haskell.org/haskellwiki/Category_theory)
  на haskellwiki, также содержит хорошие ссылки.

- [Categories from scratch](http://science.raphael.poss.name/categories-from-scratch.html), содержит несколько практических примеров.

- Список Pierce [Great Works in PL](http://www.cis.upenn.edu/~bcpierce/courses/670Fall04/GreatWorksInPL.shtml).

## Книги

- Рекомендации Kmett: [Quora Question: What is the best textbook for category theory?](http://www.quora.com/Category-Theory/What-is-the-best-textbook-for-Category-theory?share=1)

- [Awodey](http://ukcatalogue.oup.com/product/9780199237180.do) и
  [MacLane](http://www.amazon.com/Categories-Working-Mathematician-Graduate-Mathematics/dp/0387984038). Стандартные книги про теорию категорий.

- [Harper’s Practical Foundations for Programming Languages](http://www.cs.cmu.edu/~rwh/plbook/book.pdf)
  лучшее PL интро к теории типов, которое я читал.

- [Type theory and Functional Programming](http://www.cs.kent.ac.uk/people/staff/sjt/TTFP/).

# Другие веселые темы

## Parametricity, ad-hoc vs. parametric polymorphism, free theorems

- [Parametricity](tony_parametricity.pdf).

- [Исходники в TeX](https://github.com/tonymorris/parametricity/) для доклада выше.

- [Making ad-hoc polymorphism less ad-hoc](http://swizec.com/blog/week-20-making-ad-hoc-polymorphism-less-ad-hoc/swizec/6564).

- [Theorems for Free!](http://ttic.uchicago.edu/~dreyer/course/papers/wadler.pdf)

## Initial and Final, DSLs, Finally Tagless

- [Final Encodings, Part 1: A Quick Demonstration](http://creativelad.wordpress.com/2013/11/28/final-encodings-part-1-a-quick-demonstration/).

- [Transforming Polymorphic Values](http://martijn.van.steenbergen.nl/journal/2009/10/18/transforming-polymorphic-values/).

- [GADTs in Haskell 98](http://martijn.van.steenbergen.nl/journal/2009/11/12/gadts-in-haskell-98/).

- [Typed Tagless-Final Linear Lambda Calculus](https://www.fpcomplete.com/user/mutjida/typed-tagless-final-linear-lambda-calculus).

- [Typed tagless-final interpretations: Lecture notes](http://okmij.org/ftp/tagless-final/course/course.html).

- [Typed Tagless Final Interpreters](http://okmij.org/ftp/tagless-final/course/lecture.pdf).

- [The dog that didn’t bark](http://existentialtype.wordpress.com/2011/03/21/the-dog-that-didnt-bark/) less specifically relevant but interesting.

## Comonads

- [Comonads in Haskell](https://speakerdeck.com/dmoverton/comonads-in-haskell)

- [SO question: Can a Monad be a Comonad](https://stackoverflow.com/questions/16551734/can-a-monad-be-a-comonad)

## Yoneda / CoYoneda

- [SO question: Step-by-step explanation of coyoneda](https://stackoverflow.com/questions/24000465/step-by-step-deep-explain-the-power-of-coyoneda-preferably-in-scala-throu).

- Свободные монады для Less, серия из трех публикаций от Edward Kmett
  * [Part 1: Codensity](http://comonad.com/reader/2011/free-monads-for-less/)
  * [Part 2: Yoneda](http://comonad.com/reader/2011/free-monads-for-less-2/)
  * [Part 3: Yielding IO](http://comonad.com/reader/2011/free-monads-for-less-3/)

## Propositions vs. Judgments (computation)

- [StackExchange question: What is the difference between propositions and judgements](http://cstheory.stackexchange.com/questions/9826/what-is-the-difference-between-propositions-and-judgments)

- [Lecture notes from a short, three lecture course](http://www.ae-info.org/attach/User/Martin-L%C3%B6f_Per/OtherInformation/article.pdf)

# Зависимая типизация

- [Grokking sum types, value constructors, and type constructors](http://bitemyapp.com/posts/2014-04-05-grokking-sums-and-constructors.html) squint hard

- [Lightweight Dependent-type Programming](http://okmij.org/ftp/Computation/lightweight-dependent-typing.html)

- [Idris programming language](http://www.idris-lang.org/)

# Statically linking binaries

- [Static linking](https://wiki.haskell.org/Web/Literature/Static_linking)

- [Static linking with GHC on Arch Linux](http://www.edofic.com/posts/2014-05-03-ghc-arch-static.html)

- [Statically linking Linux binaries for ARM & MIPS](https://stackoverflow.com/questions/14270177/ghc-statically-linking-linux-binaries-for-arm-mips-processors)

- [Statically link GMP using GHC and LLVM](https://stackoverflow.com/questions/10539857/statically-link-gmp-to-an-haskell-application-using-ghc-llvm)

## Диалоги

> Хранятся в этом репозитории [в dialogues.md](dialogues.md).

Они на самом деле достаточно важны и полезны. Просмотрите для погружения в некоторые из тем.
