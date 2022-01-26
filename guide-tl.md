# Paano matuto ng Haskell

Ito ay ang maipapayong daan upang matutunan ang Haskell base sa karanasan na makatutulong sa iba. Mayroong listahang ng mga rekomendasyon sa isa sa mga may akda ng [Haskell Book.](https://haskellbook.com)

## Para sa mga di nag-Iingles

* [Auf Deutsch](guide-de.md)

* [En Español](guide-es.md)

* [En Français](guide-fr.md)

* [In Italiano](guide-it.md)

* [Em Português](guide-pt.md)

* [În Română](guide-ro.md)

* [繁體中文](guide-zh_tw.md)

* [简体中文](guide-zh_CN.md)

* [По-русски](guide-ru.md)

* [Українською](guide-ua.md)

* [Bahasa Indonesia](guide-id.md)

* [Srpski](guide-sr.md)

* [Sa Tagalog](guide-tl.md)


#### *Wag kang kabahan sa mga bagay na hindi mo naiintindihan agad*. Mag-patuloy ka lamang!

# Nilalaman
* [Komunidad](#3xqtdy1q1k)
  * [Patakaran ng Komunidad](#c1sjj5tgr5)
* [Pag-iinstall ng Haskell](#nn858p6d7c)
  * [Gamitin ang Stack upang makapag simula sa Haskell](#aw6kswji0ji)
  * [WAG I-INSTALL ANG HASKELL PLATFORM](#04gl3ld6or)
    * [Bakit hindi ang platform?](#n88tcepd3t)
* [Paano ko pag-aaralan ang Haskell?](#4n8aqz4j3v)
  * [Haskell Programming from First Principles.](#9t2hn4np2x)
    * [Ang Haskell Book ay nilalathala ang lahat ng primerong mapagaaralan dito](#2r07eur90j)
  * [Kursong cis194 ni Yorgey](#yo31opgvds)
  * [Kurso ng Functional Programming](#m7vgoy6516j)
  * [Dagdag kurso pagkatapos ng cis194 at FP course](#nu7y1d344w)
* [Pang-kaalaman para sa tiyak na paksa sa Haskell](#b7lsghkcm9)
  * [Dalwausap](#k77egjm3af)

# Komunidad <a name="3xqtdy1q1k"></a>

Ang aming IRC channel ay `#haskell-beginners` sa Freenode.

Kliyenteng pang-websayt [dito](http://webchat.freenode.net/).

Haskell,[listahan ng padadalhan ng sulat](https://wiki.haskell.org/Mailing_lists).

## Patakaran ng Komunidad <a name="c1sjj5tgr5"></a>
Tignan [ang patakaran ng komunidad](coc.md) upang malaman ang adhikain sa IRC channel. Mabibigyan ka ng babala kung hindi ka halatang nanloloko, ngunit maging maingat sapagkat ang channel ay para lamang sa mga gustong matuto o nag-tuturo ng Haskell.

# Pag-iinstall ng Haskell <a name="nn858p6d7c"></a>

## Gamitin ang Stack upang makapag simula sa Haskell <a name="aw6kswji0ji"></a>

I-install ang [Stack](https://haskellstack.org) upang ma-install ang GHC para makapagtayo ng sariling proyekto.

Kung wala kang alam sa kahit ano mang bagay tungkol sa Stack at gustong matuto tungkol dito, tignan itong [unawaan ng Stack bidyo tutorial](https://www.youtube.com/watch?v=sRonIB8ZStw)

## WAG I-INSTALL ANG HASKELL PLATFORM <a name="04gl3ld6or"></a>

Datapwa't sundin lamang ang instruksyon sa Haskell.org para makuha ang Stack.

### Bakit hindi ang platform? <a name="n88tcepd3t"></a>

https://mail.haskell.org/pipermail/haskell-community/2015-September/000014.html

# Paano ko pag-aaralan ang Haskell? <a name="4n8aqz4j3v"></a>

Ang pinaka-rekomendasyon ay basahin ang mga lektura at tapusin ang mga pagsasanay/takdang aralin para sa Spring 13 version ng cis194 tapos ang kurso ng FP. Ang dalawa ay naka-takda sa ibaba. Ang iba ay hindi na kailangan ngunit ini-mungkahi para sa iyong kapakanan.

## Haskell Programming from First Principles. <a name="9t2hn4np2x"></a>

I-Pinapaalam ni [@dmvianna](https://github.com/dmvianna) na ang mga nasa babaya _libreng_ mga rekomendasyon pang-kaalaman. Kung gusto mong tumingin ng libro, inirerekomenda na kumuha ng iyong sariling [Haskell Book](https://haskellbook.com). Kung hindi mo makakayang bilhin ang libro sa anumang dahilan, maaaring mag-sumite saamin ng email gamit ang [aming pahinang pang-suporta](https://haskellbook.com/support.html).

### Ang Haskell Book ay nilalathala ang lahat ng primerong mapagaaralan dito <a name="2r07eur90j"></a>

## Kursong cis194 ni Yorgey <a name="yo31opgvds"></a>

> *Talakayin muna ito* kung hindi mo bibilhin ang Haskell Book, ito ay ang pinakamagandang _libreng_ introduksyon sa Haskell.

Makukuha [online](https://www.seas.upenn.edu/~cis194/spring13/lectures.html).

Ang kurso ni [Brent Yorgey](https://byorgey.wordpress.com) ay ang pinakamaganda
sa pagkakaalam ko. Itong kurso ay mahalaga dahil hindi ka lamang tuturuan mag-sulat ng
pinakapundomental na Haskell ngunit matutulungan karin maintindihan ang mga
parser combinators.

Ang tanging dahilan para wag mag-simula sa cis194 ay kung ikaw ay hindi programmer
o hindi eksperyensado. Kung yun ang kaso, mag-simula sa [Libro ni Thompson](https://www.haskellcraft.com/craft3e/Home.html)
at tyaka lumipat sa cis194.

---

## Kurso ng Functional Programming <a name="m7vgoy6516j"></a>

> Ito ang inirerekomenda naming kurso pagkatapos ng Kursong cis194 ni Yorgey

Makukuha sa [dito](https://github.com/bitemyapp/fp-course) sa github.

Ito ay magbibigay lakas at karanasan sayo sa pag-implementa ng
kabasalan na itinuro sa cis194, ito ay isang gawi na *kritikal* upang
maing kumportable sa pang-araw araw na pag-gamit ng Functor/Applicative/Monad/etc. sa
Haskell. Ang pag-talakay sa cis194 at sa FP course ay ang nag-rerepresenta ng ubod
ng rekomendasyon ng aking patnubay at kung paano kami nag-tuturo ng Haskell sa lahat.

---

## Dagdag kurso pagkatapos ng cis194 at FP course <a name="nu7y1d344w"></a>

> Nag-bibigay kaalaman sa mga nakalalalim ng paksa.

Makukuha ang cs240h online:
* [Spring 14](http://www.scs.stanford.edu/14sp-cs240h/)
* [Winter 16](http://www.scs.stanford.edu/16wi-cs240h/)

Ito ay mga online na kurso ni [Bryan O'Sullivan](https://github.com/bos) mula sa
klaseng tinuturuan niya sa Stanford. Kung hindi mo siya kilala, Silyapan lamang
ang kalahati ng aklatan ng kahit anong Haskell application at makikita mo ang kanyang ngalan.
Kung nasagawa mo na ang Kurso ni Yorgey nanduon ang modules sa
phantom types, information flow control, language extensions, concurrency,
pipes, at lenses.

---

# Pang-kaalaman para sa tiyak na paksa sa Haskell <a name="b7lsghkcm9"></a>

Ang mga mapagkukunan na ito ay hindi tiyak para sa mga nag-aaral di katulad ng cis194 at FP course, ngunit sila'y linked in [sa listahan ng paksa](specific_topics.md) upang ikaw ay mag-ka ideya kung saan mag-sisimula. Naisasama dito ang mga intermediate/advanced na ideya at paksa katulad ng tooling at text editors.


## Dalwausap <a name="k77egjm3af"></a>

> Naisalagay dito sa repository [dito](dialogues.md).

Ito ay napakamatulungin at importante. Tignan dito para sa mga malalalim na
mga uri ng paksa.