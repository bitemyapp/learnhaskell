# Як вивчати Haskell

Цей документ є рекомендованим шляхом вивчання Haskell, який ґрунтується на досвіді допомоги іншим. Список рекомендацій від одного з авторів [HaskellBook](https://haskellbook.com/).

## Інші переклади

* [Auf Deutsch](guide-de.md)

<!-- * [Στην ελληνική](guide-el.md) -->

* [En Español](guide-es.md)

* [En Français](guide-fr.md)

* [In Italiano](guide-it.md)

* [Em Português](guide-pt.md)

* [În Română](guide-ro.md)

* [繁體中文](guide-zh_tw.md)

* [简体中文](guide-zh_CN.md)

* [По-русски](guide-ru.md)

* [Bahasa Indonesia](guide-id.md)

* [Srpski](guide-sr.md)

* [Sa Tagalog](guide-tl.md)

#### *Не намагайтесь одразу зрозуміти все*. Краще не зупиняйтесь і продовжуйте рухатись далі!

* [Ком’юніті](#3tk13ob3xi)
  * [Норми та правила спільноти](#z0u6gmyq6a)
* [Встановлення Haskell](#oe1pgrpja9)
  * [Використовуйте Stack для початку роботи з Haskell](#r8myxytjlei)
  * [НЕ ВСТАНОВЛЮЙТЕ HASKELL PLATFORM](#ztkqbo1sq3)
  * [Чому не Haskell Platform?](#o5hrogwpp8)
* [Як мені слід вивчати Haskell?](#ort1rb7igcj)
  * [Альтернативно...](#tdawnch6ke)
  * [Курс cis194 від Yorgey](#wl6ol1gl3w)
  * [Курс FP](#kyyvvwv3ajk)
  * [Додаткові матеріали після курсів cis194 та FP](#bhnz3etecx)
* [Ресурси, що розглядають конкретні теми Haskell](#u7sxorkrup)
* [Конкретні питання по Haskell](#auf3g0yr6n)
    * [Що роблять синтаксичні конструкції `<-` / `do` / спискове включення?](#p2oii8v6mr)
    * [Щоб зрозуміти списки та згортання списків (fold)](#dzsabjajkq)
    * [Щоб вивчити деякі відомі класи типів](#1qdxrl1einf)
    * [Розуміння базових повідомлень про помилки від Haskell](#rb8urvn9rr)
* [Лінивість, строгість, стримана рекурсія](#f5bvuqwetd)
  * [Маленька демонстрація](#ww1uetgpjx)
* [IO](#v7tt7f6naa)
* [Монади та їх трансформери](#rar1i9ok5mi)
  * [Трансформери монад](#bybo2puv5f)
* [Тестування, тести, специфікації, тестування властивостей та генеративне](#48mgsvlcwf)
* [Парсинг у Haskell](#z7obc2zall)
  * [Парсинг та генерація JSON](#jmuaapdq4w)
* [Структури даних та алгоритми для роботи з графами](#yxxu2nq4tc)
* [Середовище розробки](#2y4i08dcft)
  * [Emacs](#x0zikw4se7)
  * [Vim](#wipy3fxesv)
  * [Sublime Text](#8si1ofsehkf)
* [Робота із Cabal](#yv2p7qgmd3)
  * [Принципи роботи з Cabal](#i9ixdpgm6h)
  * [Stackage](#vco7jlujte)
* [Hoogle and Haddock](#dz0s4m6iz1)
  * [Шукайте код за сигнатурою типів](#r9xvferugo)
  * [Налаштування власної локальної копії Hoogle](#hex3csuu16)
  * [Haddock](#96azeun2pf)
  * [Що дійсно треба знати](#59pdx72t1a)
* [Цю команду можна записати в один рядок, але тоді приберіть слеші](#ab9lxcvksy)
* [TravisCI](#28uuo2zbme)
* [Frontend/JavaScript](#9agw3uhu3u)
  * [Яку мову використовувати для фронтенду](#83c1qr2ecef)
* [Для більш повного розуміння лінивості NF, WHNF](#nwacgyc07x)
  * [Дослідницькі папери про ліниве лямбда-числення](#4i0uklokx3)
* [Паралелізм/конкаренсі](#ng0xdfwx6k)
* [Lenses та Prisms](#5uea2v8yjf)
* [Схеми рекурсії](#9yin7ora6h)
* [GHC Core та оптимізація швидкості виконання](#9zycl4bnhf)
* [Типи та теорія категорій](#eydr938ubc)
  * [Книги](#gmc7vpz4lx)
* [Інші веселі теми](#t1yw35nfapj)
  * [Параметричність, ad-hoc та параметричний поліморфізм, вільні теореми](#2h3bczeca7)
  * [Initial та Final, DSL, Finally Tagless](#ldngh6akfj)
  * [Комонади](#ym4plrmult)
  * [Yoneda / CoYoneda](#tcro22kj1lh)
  * [Propositions vs. Judgments (обчислення)](#zrcdpsnfpy)
* [Залежна типізація](#1abec048ev)
* [Статична лінковка бінарників](#yzk6jpu9oy)
  * [Діалоги](#hqfdip8h3z)

# Ком’юніті <a name="3tk13ob3xi"></a>

Наш канал в IRC -  `#haskell-beginners` на серверах Freenode.

Веб-інтерфейс для IRC можна знайти [тут](http://webchat.freenode.net/).

Пов'язані з Haskell [поштові розсилки](https://wiki.haskell.org/Mailing_lists).

Отримати допомогу українською можна в [Slack-чаті KyivHaskell](https://github.com/KyivHaskell/KyivHaskell#join-our-slack-channel) або [Gitter-чаті dou-ua/fp](https://gitter.im/dou-ua/fp).

## Норми та правила спільноти <a name="z0u6gmyq6a"></a>

[Прочитайте допис Кріса Дона присвячений навчанню](http://chrisdone.com/posts/teaching)

Будьте ввічливими та доброзичливими. Грубість та неввічливість відлякують людей і відбивають в них бажання співпрацювати.

Легковажна і зверхня критика не сприймається адресатом і задовільняє лише того, хто критикує.

Не описуйте речі як "легкі" або "тривіальні". Люди, що важко працюють над вдосконаленням своїх знань, через такі ремарки будуть почуватись жахливо. Зазвичай повільно навчаються ті, хто водночас є найбільш стараними учнями і це є радше приводом для радощів!

Не треба удаваного здивування. Не зображуйте подив, коли хтось каже, що він чогось не знає. Люди знов таки будуть почуватись жахливо, а ви не досягнете майже нічого окрім різкості.

Ніяких "Насправді". Хтось каже щось, що майже, але не цілковито, правильне, і тут ви кажете "насправді..." і додаєте малосуттєве виправлення. Особливо це дратує, коли виправлення має мало спільного з темою обговорення. Це не значить, що наша спільнота не орієнтована на пошук істини чи що ми не вважаємо, що точність важлива. Майже усі "насправді" призначені для самозвеличення, а не для пошуку істини.

Намагайтесь не забігати поперед учня. Не треба періодично влізати із порадами якщо ви бачите, що людина працює над проблемою. Дайте їй шанс подолати проблему самотужки, а за потреби за порадою. Уникнення втручаннь є одним з найважливіших задумів #haskell-beginners.

Ніяких -измів, навіть замаскованих. Расизм, сексизм, гомофобія, трансфобія та інші види упередженності у жодному разі не припускаються.

Якщо ви не займаєтесь відвертим тролінгом, то на каналі ви можете отримати зауваження. Завжди зважайте на те, що канал створено для людей, які або самотужки вивчають Haskell або вчать програмуванню на ньому інших.

# Встановлення Haskell <a name="oe1pgrpja9"></a>

## Використовуйте Stack для початку роботи з Haskell <a name="r8myxytjlei"></a>

Встановіть [Stack](https://haskellstack.org/) щоби встановити GHC та збирати свої проекти.

Якщо ви не знаєте нічого про Stack та хотіли би отримати огляд — подивіться цей [відео туторіал](https://www.youtube.com/watch?v=sRonIB8ZStw).

## НЕ ВСТАНОВЛЮЙТЕ HASKELL PLATFORM <a name="ztkqbo1sq3"></a>

Замість того, щоб слідувати інструкції на Haskell.org, використовуйте Stack.

## Чому не Haskell Platform? <a name="o5hrogwpp8"></a>

https://mail.haskell.org/pipermail/haskell-community/2015-September/000014.html

# Як мені слід вивчати Haskell? <a name="ort1rb7igcj"></a>

Основна рекомендація - прочитати лекції та пройти всі вправи та домашні завдання версії Spring 13 курсу cis194, потім пройти курс FP (посилання на обидва курси нижче). Все інше можна вважати додатковим матеріалом, який згадується для того, щоб ви знали, де шукати.

## Альтернативно... <a name="tdawnch6ke"></a>

[@dmvianna](https://github.com/dmvianna) хотіла, щоби я вам передав, що це лише ресурси для безкоштовного вивчення. Якщо ви хочете купити книгу, ми сердешно рекомендуємо нашу власну [Haskell Book!](https://haskellbook.com/)! Ця книга замінює необхідність всіх інших ресурсів, перелічених тут.

## Курс cis194 від Yorgey <a name="wl6ol1gl3w"></a>

> *ПОЧНІТЬ З ЦЬОГО*, це головний рекомендований метод занурення в Haskell.

Доступний [онлайн](https://www.seas.upenn.edu/~cis194/spring13/lectures.html).

Курс [Брента Йорґі](https://byorgey.wordpress.com) (Brent Yorgey) - найкращій курс, який я знайшов на сьогодні. Особлива цінність цього курсу в тому, що він не тільки навчить вас писати базові речі на Haskell, але й допоможе зрозуміти комбінатори парсера.

Не слід починати з cis194 тільки в тому випадку, коли ви не програміст або програміст із маленьким досвідом. В цьому разі почніть з [цієї книги Томпсона](https://www.haskellcraft.com/craft3e/Home.html), після чого переходьте до cis194.

---

## Курс FP <a name="kyyvvwv3ajk"></a>

> Цей курс рекомендовано до вивчання після закінчення курсу cis194

Матеріали курсу доступні [на github](https://github.com/bitemyapp/fp-course).

Цей курс посилить та збагатить ваш досвід через реалізацію абстракцій, які були введені в курсі cis194. Такий практичний досвід є *критичним*, так як він надасть вам впевненості у повсякденному використанні Functor/Applicative/Monad/ін. у Haskell. Проходження cis194, а після нього FP - головна рекомендація цієї інструкції. Саме так ми вчимо Haskell всіх бажаючих.


---

## Додаткові матеріали після курсів cis194 та FP <a name="bhnz3etecx"></a>

> Додатковий матеріал на більш складні теми

Курс cs240h доступний [онлайн](http://www.scs.stanford.edu/14sp-cs240h/).

Цей курс, створений Брайаном О'Салліваном(https://github.com/bos) за мотивами його викладацької діяльності в університеті Стенфорду.
Щоб уявити хто це, зауважте такий факт: ледь не половина бібліотек, від яких залежить майже будь-яка програма на Haskell, містить його ім'я серед авторів. Після проходження курсу Йорґі особливо зверніть увагу на модулі присвячені фантомним типам, контролю потоку інформації, розширенням мови, сумісному виконанню, pipes та лінзам.

---

# Ресурси, що розглядають конкретні теми Haskell <a name="u7sxorkrup"></a>

На додаток пропонуються матеріали, присвячені поглибленному вивчанню більш складних тем, а також обговорюють інструменти розробки та текстові редактори. Ці матеріали не були випробувані у навчальних цілях так ретельно, як cis194 та FP, але їх список можна передивитись


# Конкретні питання по Haskell <a name="auf3g0yr6n"></a>

### Що роблять синтаксичні конструкції `<-` / `do` / спискове включення? <a name="p2oii8v6mr"></a>

[Чудова стаття](http://www.haskellforall.com/2014/10/how-to-desugar-haskell-code.html) розглядає ці питання.

### Щоб зрозуміти списки та згортання списків (fold) <a name="dzsabjajkq"></a>

- [Explain List Folds to Yourself](http://vimeo.com/64673035)

### Щоб вивчити деякі відомі класи типів <a name="1qdxrl1einf"></a>

Матеріал, що дуже корисний для розуміння `Functor`, `Applicative`, `Monad`, `Monoid` та інших класів типів в цілому, а також трохи специіфчної для Haskell теорії категорій.

- [Typeclassopedia](http://www.haskell.org/haskellwiki/Typeclassopedia)

### Розуміння базових повідомлень про помилки від Haskell <a name="rb8urvn9rr"></a>

- [Understanding basic error messages](http://ics.p.lodz.pl/~stolarek/_media/pl:research:stolarek_understanding_basic_haskell_error_messages.pdf)

---

# Лінивість, строгість, стримана рекурсія <a name="f5bvuqwetd"></a>

- [Книга Марлоу](http://chimera.labs.oreilly.com/books/1230000000929/ch02.html) (Marlow) про паралелизм та сумісне виконання має одне з
  найкращих введень в лінивість та нормальні форми. Якщо матеріал з неї не буде засвоюватись, зверніться до інших джерел.

- [More points for lazy evaluation](http://augustss.blogspot.hu/2011/05/more-points-for-lazy-evaluation-in.html)

- [Oh my laziness!](http://alpmestan.com/posts/2013-10-02-oh-my-laziness.html)

- Питання на Stack Overflow '[Does haskell have laziness?](https://stackoverflow.com/questions/13042353/does-haskell-have-tail-recursive-optimization)'

- Слайди з виступу [Johan Tibell](https://github.com/tibbe) на тему [reasoning about laziness](http://www.slideshare.net/tibbe/reasoning-about-laziness).

## Маленька демонстрація <a name="ww1uetgpjx"></a>

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

# IO <a name="v7tt7f6naa"></a>

- [Evaluation order and State tokens](https://www.fpcomplete.com/user/snoyberg/general-haskell/advanced/evaluation-order-and-state-tokens)

- [Unraveling the mystery of the IO monad](http://blog.ezyang.com/2011/05/unraveling-the-mystery-of-the-io-monad/).

- [First class "statements"](http://blog.jle.im/entry/first-class-statements).

- [Haddocks for System.IO.Unsafe.unsafePerformIO](http://hackage.haskell.org/package/base-4.7.0.1/docs/System-IO-Unsafe.html#v:unsafePerformIO)
  Обов'язково прочитайте документацію та перегляньте реалізацію unsafeDupablePerformIO

Коментар з обговорення в Reddit від `glaebhoerl`

> Цікаве зауваження: GHC мусить приховувати представлення токену стану за абстрактним типом IO через те, що
> токен стану завжди мусить використовуватись лінійно (не дублюватись або бути скинутим), але система типів не може примушувати до цього.
> Інша Haskell-подібна мова під назвою Clean має систему унікальних типів (які подібні до лінійних типів і, можливо, інші в аспектах, які я не знаю),
> і вони надають можливість прямої передачі World, маючи (не абстрактну) монаду IO тільки для зручності.


Оригінал:
> Interesting side note: GHC needs to hide the state token representation behind
> an abstract IO type because the state token must always be used linearly (not
> duplicated or dropped), but the type system can't enforce this. Clean, another
> lazy Haskell-like language, has uniqueness types (which are like linear types
> and possibly different in ways I'm not aware of), and they expose the
> World-passing directly and provide a (non-abstract) IO monad only for
> convenience.

# Монади та їх трансформери <a name="rar1i9ok5mi"></a>

> Не займатесь цим доки ви не розумієете класи типів, Monoid, Functor, Applicative!


Самотужки реалізуйте бібліотечні монади (List, Maybe, Cont, Error, Reader, Writer, State) для того, щоб зрозуміти їх краще. Тоді, наприклад, напишіть монадний інтерпретатор невеликої мови виразів за допомогою [Monad Transformers Step by Step](http://catamorph.de/documents/Transformers.pdf) (згадується також нижче, у розділі 'трансформери монад').

Написання декількох інтерпретаторів простою зміною монад для зміни семантики може надати додаткового розуміння про те, що відбувається.

Також заново реалізуйте `Control.Monad`. Функції накшталт `mapM` чи `sequence` є чудовою можливістю набути практики з написання узагаленного монадічного коду.

У якості путівника можна також використати курс FP, частиною якого також є написання власної реалізації Applicative.


Автори:

- Коментар на Reddit від htmltyp та Crandom [here](https://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5aj6).

- Коментар на Reddit від jozefg [here](https://www.reddit.com/r/haskell/comments/29eke6/basic_program_ideas_for_learning_about_monads/cik5trg).


## Трансформери монад <a name="bybo2puv5f"></a>

- [A gentle introduction to Monad Transformers](https://github.com/kqr/gists/blob/master/articles/gentle-introduction-monad-transformers.md).

- [Monad transformers step-by-step](http://catamorph.de/documents/Transformers.pdf).

# Тестування, тести, специфікації, тестування властивостей та генеративне <a name="48mgsvlcwf"></a>

- [Фантастичний посібник](https://github.com/kazu-yamamoto/unit-test-example/blob/master/markdown/en/tutorial.md) від Kazu Yamamoto.

- [Simple-Conduit](https://github.com/jwiegley/simple-conduit): Гарна маленька бібліотека, яка допомогає зрозуміти, як загалом працює потоковий IO. Це знання можна відобразити на бібліотеки типу Pipes та Conduit.

# Парсинг у Haskell <a name="z7obc2zall"></a>

- [Посібник](https://github.com/JakeWheat/intro_to_parsing) з комбінаторів парсеру із використанням Parsec

- [Writing your own micro-Parsec](http://olenhad.me/articles/monadic-parsers/)

## Парсинг та генерація JSON <a name="jmuaapdq4w"></a>

Aeson - стандартне рішення для парсингу [JSON](https://json.org) в Haskell. Цей пакет доступний на [hackage](https://hackage.haskell.org/package/aeson) та
[github](https://github.com/bos/aeson).

- [Parsing JSON using Aeson](http://blog.raynes.me/blog/2012/11/27/easy-json-parsing-in-haskell-with-aeson/)

- [Aeson and user created types](http://bitemyapp.com/posts/2014-04-11-aeson-and-user-created-types.html)

- [Parsing non-deterministic data with aeson and sum types](http://bitemyapp.com/posts/2014-04-17-parsing-nondeterministic-data-with-aeson-and-sum-types.html)

- [Aeson tutorial](https://www.fpcomplete.com/school/starting-with-haskell/libraries-and-frameworks/text-manipulation/json)

# Структури даних та алгоритми для роботи з графами <a name="yxxu2nq4tc"></a>

- [Пакет fgl](https://hackage.haskell.org/package/fgl), зокрема чисто функціональні [алгоритми найкоротшого шляху](http://hackage.haskell.org/package/fgl-5.4.2.2/docs/Data-Graph-Inductive-Query-SP.html).

- [Inductive graphs and Functional Graph Algorithms](http://web.engr.oregonstate.edu/~erwig/papers/abstracts.html#JFP01).

- [FGL/Haskell - A Functional Graph Library](http://web.engr.oregonstate.edu/~erwig/fgl/haskell/old/fgl0103.pdf).

- [Data.Graph source from Containers package](http://hackage.haskell.org/package/containers-0.5.5.1/docs/Data-Graph.html).

- [Пакет graphs](https://hackage.haskell.org/package/graphs).

- [Питання про PHOAS на Stack Overflow](https://stackoverflow.com/questions/24369954/separate-positive-and-negative-occurrences-of-phoas-variables-in-presence-of-rec)

- [PHOAS for free](https://www.fpcomplete.com/user/edwardk/phoas).

- [Tying the Knot](http://www.haskell.org/haskellwiki/Tying_the_Knot).

- [Hackage: dag](https://hackage.haskell.org/package/dag).

# Середовище розробки <a name="2y4i08dcft"></a>

## Emacs <a name="x0zikw4se7"></a>

- [Посібник від Alejandro Serras](https://github.com/serras/emacs-haskell-tutorial/blob/master/tutorial.md)

- [My dotfiles](https://github.com/bitemyapp/dotfiles/)

- [Chris Done's emacs config](https://github.com/chrisdone/chrisdone-emacs)

## Vim <a name="wipy3fxesv"></a>

- [Vim page on haskellwiki](http://www.haskell.org/haskellwiki/Vim)

- [Haskell-vim-now](https://github.com/begriffs/haskell-vim-now)

- [GHC-Mod](https://github.com/kazu-yamamoto/ghc-mod)

- [GHC-Mod vim plugin](https://github.com/eagletmt/ghcmod-vim)

- [Hindent](https://github.com/chrisdone/hindent)

## Sublime Text <a name="8si1ofsehkf"></a>

- [SublimeHaskell](https://github.com/SublimeHaskell/SublimeHaskell)

# Робота із Cabal <a name="yv2p7qgmd3"></a>

## Принципи роботи з Cabal <a name="i9ixdpgm6h"></a>

До того, як з'явились так звані сендбокси, користувачі Haskell стикались з проблемою, відомою як Cabal Hell. Встановлення пакетів поза сендбоксом призведе до реєстрації його у базі package-db, що є глобальною для користувача, і зазвичай це не дуже гарна ідея. Виключенням є лише найбазовіші пакети накшталт Cabal, alex, happy. Нічого іншого не мусить встановлюватись у package-db глобальний для системи або користувача окрім випадків, коли ви дійсно знаєте, що робите.

Поради як запобігти потраплянню в Cabal Hell, можна прочитати [тут](http://softwaresimply.blogspot.com/2014/07/haskell-best-practices-for-avoiding.html).

Для того, щоб поекспериментувати із пакетом, або розпочати новий проект, почніть зі створення сендбоксу у новій директорії: `cabal sandbox init`.

Якщо коротко:

- Завжди використовуйте сендбокси для інсталяції нових пакетів, збирання нових або існуючих проектів, або ж для експериментів.

- Для запуску інтерпретатору GHC у контексті проекту, завжди використовуйте `cabal repl`.


Рекомендований тут підхід, що базується на  використанні сендбоксів, призначений допомогти обійти проблеми із залежностями, але він не сумісний із тим, як Haskell Platform надає готові пакунки. Якщо ви ще тільки вивчаєте Haskell і не розумієте, як працють ghc-pkg and Cabal, *уникайте platform* і замість того використовуйте підхід, що описано раніше в цьому посібнику.

## Stackage <a name="vco7jlujte"></a>

Усі користувачі, в яких є проблеми з білдами (зазвичай це користувачі Yesod), мають можливість обміркувати використання Stackage.

- Непоганий огляд Stackage можна знайти [тут](https://www.fpcomplete.com/blog/2014/05/stackage-server).

Автор вважає, що Stackage, зазвичай, більш корисний, ніж `cabal freeze`.


# Hoogle and Haddock <a name="dz0s4m6iz1"></a>

## Шукайте код за сигнатурою типів <a name="r9xvferugo"></a>

[Пошуковий сервіс Hoogle](http://www.haskell.org/hoogle/) вміє шукати за типом.

Наприклад, подивіться на результати пошуку за виразом `(a -> b) -> [a] -> [b]`
[тут](http://www.haskell.org/hoogle/?hoogle=%28a+-%3E+b%29+-%3E+%5ba%5d+-%3E+%5bb%5d).

Ще одне дзеркало [на fpcomplete](https://www.fpcomplete.com/hoogle).

Ще є [Hayoo](http://holumbus.fh-wedel.de/hayoo/hayoo.html) (який для пошуку за замовченням використовує увесь зміст hackage).


## Налаштування власної локальної копії Hoogle <a name="hex3csuu16"></a>

[Описано тут](https://gist.github.com/bitemyapp/3e6a015760775e0679bf).

## Haddock <a name="96azeun2pf"></a>

1. [Fix your hackage documentation](http://fuuzetsu.co.uk/blog/posts/2014-01-06-Fix-your-Hackage-documentation.html)

2. [Hackage documentation v2](http://fuuzetsu.co.uk/blog/posts/2014-01-06-Hackage-documentation-v2.html)

Зауваження: обидві статті *трошки застаріли*: наприклад, зараз Hackage також показує новесеньку інформацію стосовно статусу білда і документації.


## Що дійсно треба знати <a name="59pdx72t1a"></a>

Для того, щоб haddocks містив документацію і з пакунків, які стосуються вашого проекту, треба додати `documentation: True` до вашого `~/.cabal/config`. Якщо було використане значення за замовчуванням (`False`) або `False` було встановлене вручну, то перед генерацією haddocks необхідно буде видалити всі ваші пакунки і заново переінсталювати їх.

Треба пам'ятати ще одну річ: через те, що Cabal, *а не ви*, інтерпретує параметр `$pkg`, параметри `html-location` та `content-location` *мусять бути записані у одинарних лапках* і введені в командний інтерпретатор або записані у скрипті інтерпретатора. Вони не будуть працювати у Makefile через те, що вони будуть інтерпретовані як змінні Make!

```bash
#! /usr/bin/env sh

# Цю команду можна записати в один рядок, але тоді приберіть слеші <a name="ab9lxcvksy"></a>
cabal haddock --hoogle --hyperlink-source                       \
 --html-location='http://hackage.haskell.org/package/$pkg/docs' \
 --contents-location='http://hackage.haskell.org/package/$pkg'
```

# TravisCI <a name="28uuo2zbme"></a>

Якщо ви є великим шанувальником [TravisCI](https://travis-ci.org), тоді *дуже* рекомендується подивитись на [multi-ghc-travis](https://github.com/hvr/multi-ghc-travis) як на базовий приклад `travis.yml` для ваших Haskell-проектів.

# Frontend/JavaScript <a name="9agw3uhu3u"></a>

Тут в нас є просто безліч різноманітних варіантів. Ось три базові рекомендації:

* [Haste](http://haste-lang.org/) компілятор із Haskell в Javascript
  -  [Компілятор](https://github.com/valderman/haste-compiler) на github.
  - Чудова [демка](http://www.airpair.com/haskell/posts/haskell-tutorial-introduction-to-web-apps) використання Haste із реальним проектом.

* [GHCJS](https://github.com/ghcjs/ghcjs)
  - [Введення у GHCJS](http://weblog.luite.com/wordpress/?p=14)
  - [Functional Reactive Web Interfaces with GHCJS and Sodium](http://weblog.luite.com/wordpress/?p=127)
  - [Writing Atom plugins in Haskell using ghcjs ](http://edsko.net/2015/02/14/atom-haskell/)

* [PureScript](http://www.purescript.org/)
  - Доволі популярний вибір серед прибічників Haskell, хоча, на відміну від Haste та GHCJS, це не зовсім Haskell.
  - Написано на Haskell під впливом Haskell
  - Спробувати PureScript прямо у браузері можна [тут](http://try.purescript.org/)
  - [Чудовий посібник](http://www.christopherbiscardi.com/2014/06/22/getting-started-with-purescript/) про те, як почати працювати з PureScript

## Яку мову використовувати для фронтенду <a name="83c1qr2ecef"></a>


І GHCJS, і Haste є повноцінними реалізаціями Haskell. Під GHCJS будуть працювати більше Haskell проектів, ніж із Haste, але це не дуже впливає на розробку фронтенд-проектів.
Purescript - це зовсім не Haskell і тому використовувати код із бекенду напряму не вийде.

GHCJS має найбільший розмір допоміжних бібліотек, необхідних для його роботи, який сягає 100Кб (luite працює над цією проблемою).
Haste та PureScript більш-менш однакові.

Інтеграція із інструментарем JS найкраща в PureScript (використовується gulp/grunt/bower), в той час як GHCJS та Haste краще працює із інструментами Haskell (Cabal).

Усі три - чудовий вибір і підходять для більшості фронтендових проектів.


# Для більш повного розуміння лінивості NF, WHNF <a name="nwacgyc07x"></a>

- [Notes on lambda calculus](https://vec.io/posts/notes-on-lambda-calculus).

## Дослідницькі папери про ліниве лямбда-числення <a name="4i0uklokx3"></a>

- [A call by need lambda calculus](http://homepages.inf.ed.ac.uk/wadler/topics/call-by-need.html#need-journal).

- [Demonstrating Lambda Calculus Reduction](http://www.itu.dk/~sestoft/papers/sestoft-lamreduce.pdf)

- [The lazy lambda calculus](http://www.cs.ox.ac.uk/files/293/lazy.pdf).

- [Lazy evaluation of Haskell](http://www.vex.net/~trebla/haskell/lazy.xhtml)

# Паралелізм/конкаренсі <a name="ng0xdfwx6k"></a>

- [Parallel and Concurrent Programming in Haskell](http://chimera.labs.oreilly.com/books/1230000000929). Ця книга за авторством Саймона Мерлоу (Simon Marlow) є, мабуть, однією із найкращих книг про паралелізм та конкаренсі


- Ґрунтовний [посібник](http://kukuruku.co/hub/haskell/haskell-testing-a-multithread-application)
  стосовно тестування та інкрементальної розробки багатопотокових програм на Haskell.


- [Functional Reactive Programming](http://www.haskell.org/haskellwiki/Functional_Reactive_Programming)

# Lenses та Prisms <a name="5uea2v8yjf"></a>

Після того, як ви набудете певності у роботі із Haskell, поставьтесь серйозно до вивчення Lenses та Prisms, навіть якщо ви просто "користувач". Для того, щоб вони стали вам у нагоді, не треба розуміти базові для них категорії.

Люди з легкістю переоцінюють складність використання Lens. Будь-хто із достатнім розумінням Functor/Foldable/Traversable (або навіть лише Functor) може використати лінзи та призми для того, щоб зробити своє життя трішечки краще.

Якщо коли небудь ви писали щось типу `(fmap . fmap)`, ви подумки використовували лінзи.

Ці дві статті є рекомендованим введенням в тему:

- [A little lens starter tutorial](https://www.fpcomplete.com/school/to-infinity-and-beyond/pick-of-the-week/a-little-lens-starter-tutorial)

- [Lens: Lenses, Folds and Traversals](https://github.com/ekmett/lens#lens-lenses-folds-and-traversals)

Для подальшої інформації звертайтесь сюди: [Lens package on hackage](http://hackage.haskell.org/package/lens).

# Схеми рекурсії <a name="9yin7ora6h"></a>

Деякі божевільні \*-morphism слова, які ви зустрічали, насправді говорять про рекурсію.
Зауважте: перед тим, як переходити до цього матеріалу, треба розуміти, як реалізувати foldr для списків і хочаб ще однієї структури даних, наприклад для дерев (fold - це катаморфізм). Розуміння реалізації unfold (анаморфізм)  для тих же структур ще більше полегшить вивчення теми.

Цей матеріал пов'язує між собою traversable та foldable.

- [An introduction to recursion schemes](http://patrickthomson.ghost.io/an-introduction-to-recursion-schemes/)

- [Don't fear the cat](http://fho.f12n.de/posts/2014-05-07-dont-fear-the-cat.html) -
  Цікава демонстрація того, що гілеоморфізм є композицією катаморфізму та анаморфізму.

- [Recursion Schemes](http://comonad.com/reader/2009/recursion-schemes/) - Блискучий практичний досвід

- [Functional Programming with Bananas, Lenses, Envelopes and Barbed Wire](http://eprints.eemcs.utwente.nl/7281/01/db-utwente-40501F46.pdf)

- [Catamorphisms](https://www.fpcomplete.com/user/edwardk/recursion-schemes/catamorphisms)

# GHC Core та оптимізація швидкості виконання <a name="9zycl4bnhf"></a>

- [Write Haskell as Fast as C](write_haskell_as_fast_as_c.md)

- [GHC Wiki: CoreSyn Type](https://ghc.haskell.org/trac/ghc/wiki/Commentary/Compiler/CoreSynType).

- [Hackage: GHC Core](https://hackage.haskell.org/package/ghc-core).

- [SO Question: Reading GHC Core](https://stackoverflow.com/questions/6121146/reading-ghc-core).

- [Haskell as fast as C](http://donsbot.wordpress.com/2008/06/04/haskell-as-fast-as-c-working-at-a-high-altitude-for-low-level-performance/).

- [Real World Haskell, Chapter 25: Profiling and Optimizations](http://book.realworldhaskell.org/read/profiling-and-optimization.html).

# Типи та теорія категорій <a name="eydr938ubc"></a>

> *НЕ ПОТРІБНА* для того, щоб просто писати на Haskell. Просто для тих, хто цікавиться.

Якщо ви маєте час та натхнення набути розуміння типів та теорії категорій:

- [Catster's Guide](http://byorgey.wordpress.com/2014/01/14/catsters-guide/) та
  [Catster's Guide 2](http://byorgey.wordpress.com/catsters-guide-2/)

- [Haskell wikibook](http://en.wikibooks.org/wiki/Haskell/Category_theory)
  містить непогані діаграми

- Сторінка [Category Theory](http://www.haskell.org/haskellwiki/Category_theory) у
  haskellwiki також містить чудові посилання на інші ресурси

- [Categories from scratch](http://science.raphael.poss.name/categories-from-scratch.html), містить також і практичні приклади.

- Список [Great Works in PL](http://www.cis.upenn.edu/~bcpierce/courses/670Fall04/GreatWorksInPL.shtml) за авторством Пірса.

## Книги <a name="gmc7vpz4lx"></a>

- [Quora Question: What is the best textbook for category theory?](http://www.quora.com/Category-Theory/What-is-the-best-textbook-for-Category-theory?share=1) Рекомендація Кметта (Kmett)

- [Awodey](http://ukcatalogue.oup.com/product/9780199237180.do) та
  [MacLane](http://www.amazon.com/Categories-Working-Mathematician-Graduate-Mathematics/dp/0387984038). Стандартні підручники з теорії категорій.

- [Harper's Practical Foundations for Programming Languages](http://www.cs.cmu.edu/~rwh/plbook/book.pdf) - найкраще введення у теорію типів із фокусом на мовах програмування.

- [Type theory and Functional Programming](http://www.cs.kent.ac.uk/people/staff/sjt/TTFP/).

# Інші веселі теми <a name="t1yw35nfapj"></a>

## Параметричність, ad-hoc та параметричний поліморфізм, вільні теореми <a name="2h3bczeca7"></a>

- [Parametricity](tony_parametricity.pdf).

- [TeX оригінали](https://github.com/tonymorris/parametricity/) вищевказанної доповіді

- [Making ad-hoc polymorphism less ad-hoc](http://swizec.com/blog/week-20-making-ad-hoc-polymorphism-less-ad-hoc/swizec/6564).

- [Theorems for Free!](http://ttic.uchicago.edu/~dreyer/course/papers/wadler.pdf).

## Initial та Final, DSL, Finally Tagless <a name="ldngh6akfj"></a>

- [Final Encodings, Part 1: A Quick Demonstration](http://creativelad.wordpress.com/2013/11/28/final-encodings-part-1-a-quick-demonstration/).

- [Transforming Polymorphic Values](http://martijn.van.steenbergen.nl/journal/2009/10/18/transforming-polymorphic-values/).

- [GADTs in Haskell 98](http://martijn.van.steenbergen.nl/journal/2009/11/12/gadts-in-haskell-98/).

- [Typed Tagless-Final Linear Lambda Calculus](https://www.fpcomplete.com/user/mutjida/typed-tagless-final-linear-lambda-calculus).

- [Typed tagless-final interpretations: Lecture notes](http://okmij.org/ftp/tagless-final/course/course.html).

- [Typed Tagless Final Interpreters](http://okmij.org/ftp/tagless-final/course/lecture.pdf).

- [The dog that didn't bark](http://existentialtype.wordpress.com/2011/03/21/the-dog-that-didnt-bark/) менш релевантна, але все одно цікава стаття.

## Комонади <a name="ym4plrmult"></a>

- [Comonads in Haskell](https://speakerdeck.com/dmoverton/comonads-in-haskell).

- [SO question: Can a Monad be a Comonad](https://stackoverflow.com/questions/16551734/can-a-monad-be-a-comonad).

## Yoneda / CoYoneda <a name="tcro22kj1lh"></a>

- [SO question: Step-by-step explanation of coyoneda](https://stackoverflow.com/questions/24000465/step-by-step-deep-explain-the-power-of-coyoneda-preferably-in-scala-throu).

- Free monads for Less, a sequence of three articles by Edward Kmett
  * [Part 1: Codensity](http://comonad.com/reader/2011/free-monads-for-less/).
  * [Part 2: Yoneda](http://comonad.com/reader/2011/free-monads-for-less-2/).
  * [Part 3: Yielding IO](http://comonad.com/reader/2011/free-monads-for-less-3/).

## Propositions vs. Judgments (обчислення) <a name="zrcdpsnfpy"></a>

- [StackExchange question: What is the difference between propositions and judgements](http://cstheory.stackexchange.com/questions/9826/what-is-the-difference-between-propositions-and-judgments).

- [Lecture notes from a short, three lecture course](http://www.ae-info.org/attach/User/Martin-L%C3%B6f_Per/OtherInformation/article.pdf)

# Залежна типізація <a name="1abec048ev"></a>

- [Grokking sum types, value constructors, and type constructors](http://bitemyapp.com/posts/2014-04-05-grokking-sums-and-constructors.html).

- [Lightweight Dependent-type Programming](http://okmij.org/ftp/Computation/lightweight-dependent-typing.html).

- [Idris programming language](http://www.idris-lang.org/).

# Статична лінковка бінарників <a name="yzk6jpu9oy"></a>

- [Static linking](https://wiki.haskell.org/Web/Literature/Static_linking)

- [Static linking with GHC on Arch Linux](http://www.edofic.com/posts/2014-05-03-ghc-arch-static.html)

- [Statically linking Linux binaries for ARM & MIPS](https://stackoverflow.com/questions/14270177/ghc-statically-linking-linux-binaries-for-arm-mips-processors)

- [Statically link GMP using GHC and LLVM](https://stackoverflow.com/questions/10539857/statically-link-gmp-to-an-haskell-application-using-ghc-llvm)



## Діалоги <a name="hqfdip8h3z"></a>

> Діалоги із IRC знаходяться [в цьому документі](dialogues.md).

Це дуже важлива та корисна інформація. Зазирніть туди щоб заглибитись у різноманітні теми.
