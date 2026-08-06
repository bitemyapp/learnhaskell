# Kako naučiti Haskell

Ovo je preporučeni put za učenje Haskella zasnovan na iskustvu u pomaganju drugim ljudima. Ovo je lista preporuka jednog od autora [Haskell knjige](https://haskellbook.com)

## Za one koji ne govore Hrvatski

- [In English](README.md)

- [Auf Deutsch](guide-de.md)

- [En Español](guide-es.md)

- [En Français](guide-fr.md)

- [Bahasa Indonesia](guide-id.md)

- [In Italiano](guide-it.md)

- [日本語](guide-ja.md)

- [한국어](guide-ko.md)

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

#### *Ne obraćajte mnogo pažnje na stvari koje iz prve ne razumijete*. Samo idite naprijed!

## Zajednica

Naš IRC kanal je `#haskell-beginners` na Freenodeu.

IRC web [klijent](http://webchat.freenode.net/).

Haskell [email lista](https://wiki.haskell.org/Mailing_lists).


### Smjernice zajednice

Pogledajte [smjernice zajednice](coc.md) da bi razumjeli kakvo ponašanje se očekuje na IRC kanalu. Bit ćete upozoreni ako očigledno "trolate" , ali budite svjesni toga da kanal služi isključivo onima koji uče ili podučavaju Haskell.


# Instaliranje Haskella

## Koristite Stack da biste krenuli sa Haskellom

Preuzmite [Stack](https://haskellstack.org) da bi uz pomoć njega instalirali GHC za gradnju projekata.

Ako ne znate ništa o Stacku a željeli biste saznati, pogledajte ovaj [Stack video tutorial](https://www.youtube.com/watch?v=sRonIB8ZStw).


## Također, NEMOJTE INSTALIRATI HASKELL PLATFORMU

Umjesto da pratite uputstva sa Haskell.org instalirajte Stack.

### Zašto ne platforma ?

https://mail.haskell.org/pipermail/haskell-community/2015-September/000014.html


# Kako da naučim Haskell?

Glavna preporuka je da pročitate lekcije i završite sve vježbe iz Spring 13 verzije cis1940 tečaja nakon kojega ide FP tečaj. Oba linka su ispod. Sve ostalo može se smatrati opcionalnim i spomenuto je ovdje da biste znali gdje da tražite resurse.

## Alternativno...

[@dmvianna](https://github.com/dmvianna) je željela da napomenem da su ovo samo besplatni i preporučeni resursi, ako ste zainteresirani da pogledate knjigu preporučujemo od sveg srca našu [Haskell Knjigu!](https://haskellbook.com) Ova knjiga zamjenjuje sve spomenuto.

## Yorgeyjev cis1940 tečaj

> *Pročitajte ovo prvo*, ovo je primarni način koji preporučujemo za upoznavanje sa Haskellom

Dostupno [online](https://www.seas.upenn.edu/~cis1940/spring13/lectures.html).

[Brent Yorgey](https://byorgey.wordpress.com)jev tečaj je najbolji tečaj koji sam vidio do sada. Ovaj tečaj je vrijedan zato što ne samo da će Vas pripremiti da pišete osnovni Haskell već će Vam i pomoći da razumijete parser kombinatore.

Jedini razlog da ne počnete sa cis1940 tečajem je ako niste programer ili ste programer sa malo iskustva. 
U tom slučaju počnite sa [Thompsonovom knjigom](https://www.haskellcraft.com/craft3e/Home.html) i nakon nje prijeđite na cis1940.

---

## FP tečaj

> Ovo je tečaj koji preporučujemo nakon Yorgeyjevog cis1940 tečaja

Dostupan je na [githubu](https://github.com/bitemyapp/fp-course).

On će utvrditi iskustvo u direktnom implementiranju apstrakcija koje
su uvedene u cis1940 tečaju. Ovo je praksa koja je *kritična* da bi se osjećali
ugodno sa svakodnevnom upotrebom Fanktora/Aplikativa/Monada itd. u Haskellu.
Glavna preporuka ovog vodiča je da prijeđete cis1940 a zatim FP tečaj i to je način
na koji učimo Haskell sve zainteresirane.

---

## Dodatni tečaj nakon cis1940 i FP

> Sadrži više materijala o srednje naprednim temama

cs240h je dostupan [online](http://www.scs.stanford.edu/14sp-cs240h/).

Ovo je [Bryan O'Sullivan](https://github.com/bos)ov online tečaj kojim on predaje na
Stanfordu. Ako ne znate tko je on bacite oko i vidjet ćete da je njegovo ime na pola Haskell
biblioteka koje su potrebne bilo kojem Haskell programu.
Naročito treba spomenuti, ako ste već završili Yorgeyjev tečaj,
module sa fantomskim tipovima, kontrola toka informacija, ekstenzije jezika, konkurentnost,
pipes i lenses biblioteke.

---

# Resursi za specifične teme u Haskellu

Ovi resursi nisu testirani sa učenicima kao što su tečajevi cis1940 i FP ali se nalaze u [listingu tema](specific_topics.md) tako da imate ideju odakle krenuti. Ovo uključuje srednje/napredne koncepte i teme kao što su alati i tekst editori.


## Dijalozi

> Nalaze se u ovom [repozitoriju](dialogues.md).

Ovo je naročito važno i korisno. Ovo je dublji pregled različitih tema.
