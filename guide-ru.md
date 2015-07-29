# Как познать Haskell

Этот документ - рекомендованный путь к изучению языка Haskell, основанный на опыте помощи другим

## Это руководство доступно на других языках:

* [In English](README.md)

* [Auf Deutsch](guide-de.md)

<!-- * [Στην ελληνική](guide-el.md) -->

* [En Español](guide-es.md)

* [En Français](guide-fr.md)

* [In Italiano](guide-it.md)

* [Em Português](guide-pt.md)

* [繁體中文](guide-zh_tw.md)

#### *Не страдайте над одним топиком, который вы не можете понять сразу*. Двигайтесь дальше!

## Сообщество

IRC канал `#haskell-beginners` на Freenode.

IRC веб-клиент [здесь](http://webchat.freenode.net/).

[Почтовые рассылки](https://wiki.haskell.org/Mailing_lists).


### Политика сообщества

[Смотрите пост про обучение от Криса Дона](http://chrisdone.com/posts/teaching)

Будьте дружелюбны и вежливы. Грубость и хамство испугает собеседника
и отталкнет от участия в общении.

Слабая, неконструктивная критика удовлетворяет лишь
критикующего, но не помогает критикуемому.

Не описывайте вещи как "легкие" или "тривиальные".
Вы заставляете людей чувствовать себя ужасно за то,
что они усердно и много работают ради своего прогресса.
Медленно-обучающиеся люди зачастую самые дотошные обучающиеся,
этому наоборот надо радоваться!

Не симулируйте удивление. Не изображайте удивление, когда кто-либо
говорит, что он не знает что-то. Они будут чувствовать себя ужасно,
а вы не получите ничего, кроме резкости.

"ну, на самом деле". Когда кто-либо говорит что-то почти -
но не совсем - верное,
а вы говорите "ну, на самом деле..." и даете лишь мелкую правку.
Это особенно раздражает, когда поправка не относится к основной
теме разговора. Это не значит,
что этот канал не про поиск правды или что нам все равно на точность.
Просто почти все "ну, на самом деле" являются показухой, а не поиском правды.

Не делайте всю работу за обучающегося.
Если вы ввидите, что человек работает над проблемой,
вы не должны немедлено выдавать советы или готовые решения.
Дайте ему поработать и поизучать,
пока он сам не попросит помощи.
Избегать помех - [одна из основных причин существования #haskell-beginners](http://chrisdone.com/posts/teaching).

Никаких -измов. Расизм, сексизм, гомофобия,
трансофобия и другие виды фобий не приветствуются и не будут приняты терпимо.

---

[Правила хорошего тона от Recurse Center](https://www.recurse.com/manual). Спасибо за их публикацию Recurse Center.

# Что такое Haskell, GHC и Cabal?

Haskell - это язык программирования, изложенный в спецификациях,
последняя опубликована в 2010 году.
Эта спецификация доступна как [онлайн-документ](http://www.haskell.org/onlinereport/haskell2010/).

## GHC

[GHC](http://www.haskell.org/ghc/) - это самый популярный способ работы с языком Haskell. Он включает в себя компилятор, REPL (интерпритатор), пакетный менеджер и другие полезные вещи.

## Cabal

[Cabal](https://www.haskell.org/cabal/download.html) осуществляет менеджмент проектов и разрешение зависимостей.
Это способ установить проект, обычно в их песочницу (изолированное окружение).

Cabal аналогичен Bundler в Ruby, pip в Python, NPM в Node и так далее. GHC управляет пакетами сам, Cabal решает какие версии устанавливать.

# Установка GHC и Cabal

## Ubuntu

[Этот PPA](http://launchpad.net/~hvr/+archive/ghc) лучший и именно его я использую на
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

После этого, добавьте следующие пути к вашему `$PATH` (bash\_profile, zshrc, bashrc, и тп):

```
export PATH=$PATH:~/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.8.4/bin:/opt/happy/1.19.5/bin:/opt/alex/3.1.4/bin
```

*Опционально:* вы можете добавить также `.cabal-sandbox/bin` к вашему пути.
Код, который вы разрабатываете будет доступен вам из командной строки.
Это работает только тогда, когда ваша текущая рабочая папка - песочница cabal.

## Debian

### Использование Ubuntu PPA

Если вы не используете стабильный дистрибутив, вы можете повторить все теже шаги,
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
[это руководство]
(http://www.davesquared.net/2014/05/platformless-haskell.html), написанное для Mac OS X:

Замечания:

- Выставьте ваш префикс соответственно, когда конфигурируете ghc.
- Вместо того, чтобы забирать бинарник `cabal-install`, скачайте исходный код и запустите скрипт `bootstrap.sh`.

## Fedora 21

Чтобы уставновить Haskell 7.8.4 из неофициального репо (Fedora 22+ будут содержать его в официальном):

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
$ sudo pacman -S cabal-install ghc happy alex haddock
```

## Gentoo

На Gentoo вы можете установить индивидуальные компоненты Haskell Platform через Portage.
Если вы используете `ACCEPT_KEYWORDS=arch` (вместо `ACCEPT_KEYWORDS=~arch`),
Portage установит древние версии различных компонент Haskell. Помня это, если вы используете `ACCEPT_KEYWORDS=arch`, добавьте следующие строки в `/etc/portage/package.keywords`.

    dev-haskell/cabal-install
    dev-lang/ghc

Как только это сделано,


```bash
$ emerge -jav dev-lang/ghc dev-haskell/cabal-install
```

Gentoo хранит "стабильную" (читай "старую") версию `cabal-install` в дереве Portage, так что, если вы хотите использовать более современную версию `cabal-install`, выполните (заметтье, что слеши здесь нужны)

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

Если вы не знаете, какая оболочка у вас используется, то скорее всего это Bash. Если это Bash, то файл, в который вам надо добавлять эти строки - `~/.bashrc`. Если вы используете Z-shell, то это `~/.zshrc`. Вы можете понять, какая оболочка у вас используется, запустив:

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
которе включает в себя GHC и Cabal.
Оно предоставляет инструкции, как добавить GHC и Cabal в ваш путь,
после того как вы скопируете приложение `.app` куда-либо.

### 10.6-10.8

Выполните установку бинарников, которая описана ниже,
для [этого архива](https://www.haskell.org/platform/download/2014.2.0.0/ghc-7.8.3-x86_64-apple-darwin-r3.tar.bz2).

## Windows

- [Минимальный установщик GHC для Windows](http://neilmitchell.blogspot.com/2014/12/beta-testing-windows-minimal-ghc.html)
  способен скомпилировать `network` и тп. Технически, это бета версия,
  но должна работать для тех, кто читает это руководство.

Не забудьте запустить установщик как администратор, так как он захочет установить файлы в Program Files.

## Пользователям других Linux дистрибутивов

Скачайте последние бинарники cabal и ghc:

- [GHC](http://www.haskell.org/ghc/).

- [Cabal](https://www.haskell.org/cabal/download.html).


## Пользователям других Unix-подобных систем

Скачайте GHC и Cabal из вашего пакетного менеджера,
затем добавьте `~/.cabal/bin` в ваше `$PATH`.
Поосле этого обновите `cabal` и установите дополнительные инструменты `alex` и `happy`.

```bash
$ cabal update
$ cabal install cabal-install alex happy
```
