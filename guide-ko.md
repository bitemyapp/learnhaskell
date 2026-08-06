# 하스켈 학습 가이드

이 글은 여러분이 하스켈을 배우는데 도움이 될 수 있도록 경험을 바탕으로 만들어진 가이드로 [하스켈 북 (Haskell Book)](https://haskellbook.com)의 저자 중 한 사람의 추천 목록입니다.

## 비 영어권 사람들을 위한 번역

- [In English](README.md)

- [Auf Deutsch](guide-de.md)

- [En Español](guide-es.md)

- [En Français](guide-fr.md)

- [Na Hrvatskom](guide-hr.md)

- [Bahasa Indonesia](guide-id.md)

- [In Italiano](guide-it.md)

- [日本語](guide-ja.md)

- [Em Português](guide-pt.md)

- [În Română](guide-ro.md)

- [По-русски](guide-ru.md)

- [Srpski](guide-sr.md)

- [Sa Tagalog](guide-tl.md)

- [Türkçe](guide-tr.md)

- [Українською](guide-ua.md)

- [简体中文](guide-zh_CN.md)

- [繁體中文](guide-zh_tw.md)

- [Magyarul](guide-hu.md)

#### _이해가 잘 안된다고 계속 붙잡고 있지 마세요_. 진도를 계속 나가세요!

## 커뮤니티

저희 IRC 체널은 Freenode의 `#haskell-beginners` 입니다.

IRC 웹 클라이언트 [here](http://webchat.freenode.net/).

하스켈 [메일링 리스트](https://wiki.haskell.org/Mailing_lists).

### 커뮤니티 규칙

IRC 체널의 [커뮤니티 규칙](cdc.md)을 꼭 읽어주세요. 여러분이 지나치게 트롤링을 하지 않는 한 경고로 끝나겠지만, 반드시 이 체널은 하스켈을 배우고 가르치는 공간이라는 점을 명심해주세요.

# 하스켈 설치하기

## 하스켈을 설치하기 위해 Stack을 사용하세요

GHC를 설치하고 프로젝트를 만들기 위해 [Stack](https://haskellstack.org)을 사용하세요.

Stack을 처음 들어보거나 개요를 보기 원하신다면, [comprehensive Stack video tutorial](https://www.youtube.com/watch?v=sRonIB8ZStw)을 참고하세요.

## 그리고 HASKELL PLATFORM으로 설치하지 마세요

Haskell.org에서 지시하는 대로 설치하지 마시고, Stack을 사용하세요.

### 왜 platform을 사용하면 안되나요?

https://mail.haskell.org/pipermail/haskell-community/2015-September/000014.html

# 하스켈을 어떻게 배워야 하나요?

저희들은 2013년 봄학기 cis1940 강의에 있는 모든 문제를 풀어본 다음에 FP강의를 듣는 방법을 추천합니다. 두 강의 모두 아래에 링크가 걸려있습니다. 그 외에는 선택이며, 여러분이 찾을 수 있도록 아래에 링크가 있습니다.

## Haskell Programming from First Principles.

[@dmvianna](https://github.com/dmvianna)는 아래의 내용이 무료 권장 자료 일 뿐이라는 사실을 알려 드리고자합니다. 하지만 만약 책으로 보고 싶다면, 제가 쓴 [Haskell Book!](https://haskellbook.com)을 진심으로 추천합니다. 만약 어떤 이유로든 책을 구입할 여유가 없으면 [our support page](https://haskellbook.com/support.html)로 연락해주세요.

### Haskell Book은 여기에서 권장되는 모든 주요 내용을 포함합니다.

## Yorgey의 cis1940 강의

> Haskell Book을 구매하지 않았다면 이 강의를 먼저 들으세요. Haskell 입문을 위한 최고의 수업입니다.

[온라인](https://www.seas.upenn.edu/~cis1940/spring13/lectures.html)에서 보실 수 있습니다.

[Brent Yorgey](https://byorgey.wordpress.com)의 강의는 제가 찾아 본 것중 가장 좋은 강의입니다. 이 강의는 기본적인 하스켈 코딩능력을 갖춰줄 뿐만이 아니라 parser combinator를 이해하는데 도움을 주기 때문에 중요합니다.

만약 여러분이 프로그래머가 아니거나 프로그래밍을 해본적이 없다면 이 강의로 시작하는 것을 추천하지 않습니다. 그렇다면, [Thompson의 책](https://www.haskellcraft.com/craft3e/Home.html)을 먼저 보고 cis1940로 돌아가세요.

---

## 함수형 프로그래밍 강의

> 이 강의는 Yorgey의 cis1940 강의를 모두 보신 후에 추천드리는 강의입니다.

[GitHub](https://github.com/bitemyapp/fp-course)에서 볼 수 있습니다.

이 강의는 cis1940에서 소개한 추상화기법을 직접 사용해보고 실력을 길러줍니다.
이 강의는 하스켈에서 Functor, Applicative, Monad처럼 매일 사용되는 개념들에 익숙해지도록 훈련해주는 중요한 강의입니다.
cis1940를 먼저 보고 FP강의를 보는 방법이 저희들이 추천하는 하스켈 학습방법입니다.

---

## cis1940와 FP강의를 본 후의 보충강의

> 더 많은 자료와 중급 주제를 제공합니다.

cs240h는 온라인에서 볼 수 있습니다.

- [14년 봄학기](http://www.scs.stanford.edu/14sp-cs240h/)
- [16년 겨울학기](http://www.scs.stanford.edu/16wi-cs240h/)

이 강의는 Stanford에서 강의하시는 [Bryan O'Sullivan](https://github.com/bos)의 온라인 강의입니다. 만약 이분을 모르신다면, 나중에 필요하게 될 하스켈 라이브러리들을 살펴보면 그의 이름을 발견할 수 있습니다.
cis1940를 끝마쳤다면 phantom types나 information flow control, language extensions, concurrency, pipes, lenses 내용은 보신적이 있을 겁니다.

---

# Haskell의 특정 주제에 대한 자료

이 자료들은 cis1940와 FP강의를 들은 사람들에 대해 점검해보지 않았지만, 여러분이 어디서 시작해야 할지 도와주기 위해 [주제 리스트](specific_topucs.md)에 링크를 모아두었습니다. 이 리스트에는 툴과 에디터 같은 중급이나 고급정도의 개념들과 주제도 담겨있습니다.

## 토론

> [이 저장소](dialogues.md)에 있습니다.

이것들은 꽤 중요하고 도움이 될겁니다. 여기에 들어가서 다양한 주제들을 만나보실 수 있습니다.
