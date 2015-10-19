# 하스켈을 배우는 방법

이 글은 다른 사람들을 도울 수 있는 경험을 기반으로 하스켈을 배우기위한 추천 경로입니다.


## 비영어권 사람들을 위한 문서

* [Auf Deutsch](guide-de.md)

<!-- * [Στην ελληνική](guide-el.md) -->

* [En Español](guide-es.md)

* [En Français](guide-fr.md)

* [In Italiano](guide-it.md)

* [Em Português](guide-pt.md)

* [繁體中文](guide-zh_tw.md)

* [По-русски](guide-ru.md)

* [Українською](guide-ua.md)

#### * 바로 이해하지 못한다고 걱정하지 마십시오.*계속 진행하세요!

## 커뮤니티

저희의 IRC 채널은 Freenode의`#haskell-beginners` 입니다.

IRC 웹 클라이언트 [여기] (http://webchat.freenode.net/).

하스켈 [메일링 리스트] (https://wiki.haskell.org/Mailing_lists).


### 커뮤니티 가이드 라인

IRC 채널에서 예상되는 행동을 이해하기 위해 [커뮤니티 가이드 라인] (coc.md)를 참조하십시오.당신이 명백하게 트롤링을 하지 않은 한 경고를 받는 것으로 그치겠지만,
이 채널은 하스켈을 배우고 가르치는 사람들은 위한 곳이라는 것을 명심하시기 바랍니다.

# 하스켈 설치하기

## haskell platform은 설치하지 마십시오

Haskell.org의 지침을 따르는 대신, GHC 및 Cabal [설치 설명서]  (install.md)의 지침을  참조하십시오.

# 어떻게 하스켈를 배워야할까요?

추천하는 방법은 cis194 13년 봄학기 버전의 모든 운동 / 숙제를 완료하고 NICTA강의를 듣는 것입니다.모두 아래에 링크되어 있습니다.다른 모든 선택 사항으로 간주 될 수 있으며, 당신이 그것들이 어디있는지 알도록 언급했다.

## Yorgey의 cis194 코스

> * 가장 먼저 들으세요*, 이것은 우리가 하스켈을 시작할 때 가장 먼저 추천하는 강의입니다.


[온라인] (http://www.seas.upenn.edu/~cis194/spring13/lectures.html)을 통해 들을 실 수 있습니다.

[Bren Yorgey] (https://byorgey.wordpress.com)의 과정은 지금까지 발견 된 것 중에 최고입니다.그것은 단지 당신이 기본적인 하스켈 코드를 작성하는 방법뿐만 아니라 파서 조합들(parser combinators)을 이해하는 데 도움이 되므로 이 과정은 가치가있다.

만약 당신이 프로그래머가 아니거나 프로그래밍을 해본 경험이 없는 경우, cis 194로 시작해서는 안됩니다.그런 경우, [톰슨의 책 (http://www.haskellcraft.com/craft3e/Home.html) 및 전환과 함께 시작합니다.

---


## NICTA 코스

> 이 강의는 Yorgey의 cis194를 끝냈을 때 그 다음으로 추천하는 강의입니다.

[여기] GitHub에서 사용이 가능합니다. (https://github.com/NICTA/course).

이 강의는 cis194에서 소개되었던 추상적인 개념들은 직접
실행하는 경험을 제공하고 강화시켜줍니다, 이 연습은 하스켈에서 Functor/Applicative/Monad/그외의 사용에 익숙해지는데 *중요*합니다.cis194를 먼저 보고 NICTA 코스를 진행하는 것은 제 가이드의 핵심 권고사항이고, 저희들이 모두에게 하스켈를 가치는 방법입니다.

---

## cs194와 NICTA 코스 이후의 보충 강의

> 중급 주제에 대한 더 많은 자료를 제공합니다.

cs240h는 [온라인] (http://www.scs.stanford.edu/14sp-cs240h/)으로 볼 수 있습니다.

이것은 [브라이언 설리번] (https://github.com/bos)가 스탠포드 대학에서 가르치는 수업의 온라인 과정입니다.혹시 그가 누군지 모른다면, 대부분의 하스켈 응용 프로그램이 필요로 하는 라이브러리의 절반에서 그가 활동했다는 것을 볼 수 있을 겁니다.Yourgey 코스를 끝냈다면 phantom types, information flow control, language extensions, concurrency,
pipes, 그리고 lenses의 모듈들은 특정 노트에 있습니다.

---

# Haskell의 특정 주제의 출처

이 출처들은 cis194와 NICTA 코스를 끝낸 학습자로 부터 조사되거나 시험되지 않았습니다만, 그것들은 어디서 시작해야할지 알 수 있도록 [주제 리스트](specific_topics.md)에 링크되어있습니다.이 리스트는 중간/고급 개념들과 툴제작과 텍스트 에디터같은 주제들도 포함하고 있습니다.


## 대화

> 이 저장소에 마련되어있습니다. [이곳](dialogues.md).

이것들은 실제로 꽤 중요하고 도움이 될 것입니다.다양한 주제를 깊게 다루고 싶다면 보세요.
