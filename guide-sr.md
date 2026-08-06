# Kako učiti Haskell

Ovo je preporučeni put za učenje Haskell-a zasnovan na iskustvu u pomaganju drugim ljudima. Ovo je lista preporuka jednog od autora [Haskell knjige](https://haskellbook.com)

## Za one koji ne govore Srpski

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

- [По-русски](guide-ru.md)

- [Sa Tagalog](guide-tl.md)

- [Türkçe](guide-tr.md)

- [Українською](guide-ua.md)

- [简体中文](guide-zh_CN.md)

- [繁體中文](guide-zh_tw.md)

- [Magyarul](guide-hu.md)

#### *Ne obraćajte mnogo pažnju na stvari koje ne razumete iz prve*. Samo idite napred!

## Zajednica

Naš IRC kanal je `#haskell-beginners` na Freenode-u.

IRC web [klijent](http://webchat.freenode.net/).

Haskell [email lista](https://wiki.haskell.org/Mailing_lists).


### Smernice zajednice

Pogledajte [smernice zajednice](coc.md) da bi razumeli kakvo ponašanje se očekuje na IRC kanalu. Bićete upozoreni ako očigledno "trolujete" , ali budite svesni toga da kanal služi isključivo onima koji uče ili podučavaju Haskell.


# Instaliranje Haskell-a

## Koristite Stack da bi krenuli sa Haskell-om

Preuzmite [Stack](https://haskellstack.org) da bi uz pomoć njega instalirali GHC za bildovanje projekata.

Ako ne znata ništa o Stack-u a želeli biste da saznate, pogledajte ovo [Stack video tutorial](https://www.youtube.com/watch?v=sRonIB8ZStw).


## Takodje, NEMOJTE INSTALIRATI HASKELL PLATFORMU

Umesto da pratite uputstva sa Haskell.org instalirajte Stack.

### Zašto ne platforma ?

https://mail.haskell.org/pipermail/haskell-community/2015-September/000014.html


# Kako da učim Haskell?

Glavna preporuka je da pročitate lekcije i završite sve vezbe iz Spring 13 verzije cis1940 kursa posle koga ide FP kurs. Oba linka su ispod. Sve ostalo može da se smatra opcionim i pomenuto je ovde da bi znali gde da tražite resurse.

## Alternativno...

[@dmvianna](https://github.com/dmvianna) je želela da napomenem da su ovo samo besplatni i preporučeni resursi, ako ste zainteresovani da pogledate knjigu preporučujemo od sveg srca našu [Haskell Knjigu!](https://haskellbook.com) Ova knjiga zamenjuje sve pomenuto.

## Yorgey-jev cis1940 kurs

> *Pročitajte ovo prvo*, ovo je primarni način koji preporučujemo za upoznavanje sa Haskell-om

Dostupno [online](https://www.seas.upenn.edu/~cis1940/spring13/lectures.html).

[Brent Yorgey](https://byorgey.wordpress.com)-jev kurs je najbolji kurs koji sam video do sada. Ovaj kurs je vredan zato što ne samo da će Vas spremiti da pišete osnovni Haskell već će i pomoći da razumete parser kombinatore.

Jedini razlog da ne počnete sa cis1940 kursom je ako niste programer ili ste programer sa malo iskustva. 
U tom slučaju počnite sa [Thompson-ovom knjigom](https://www.haskellcraft.com/craft3e/Home.html) i posle predjite na cis1940.

---

## FP kurs

> Ovo je kurs koji preporučujemo posle Yorgey-jevog cis1940 kursa

Dostupan je na github/u [ovde](https://github.com/bitemyapp/fp-course).

On će utvrditi iskustvo u direktnom implementiranju abstrakcija koje
su uvedene u cis1940 kursu. Ovo je praksa koja je *kritična* da bi se osećali
prijatno sa svakodnevnom upotrebom Fanktora/Aplikativa/Monada itd. u Haskell-u.
Glavna preporuka ovog vodiča je da predjete cis1940 a zatim FP kurs i to je način
na koji učimo Haskell sve zainteresovane.

---

## Dodatni kurs posle cis1940 i FP

> Sadrži više materijala o srednje naprednim temama

cs240h je dostupan [online](http://www.scs.stanford.edu/14sp-cs240h/).

Ovo je [Bryan O'Sullivan](https://github.com/bos)-ov online kurs kojim on predaje na
Stanford-u. Ako ne znate ko je on bacite oko i videćete da je njegovo ime na pola Haskell
biblioteka koje se potrebne bilo kojem Haskell programu.
Naročito treba pomenuti, ako ste već završili Yorgey-jev kurs,
module sa fantomskim tipovima, kontrola toka informacija, ekstenzije jezika, konkurentnost,
pipes i lenses biblioteke.

---

# Resursi za specifične teme u Haskell-u

Ovi resursi nisu testirani sa učenicima kao što su kursevi cis1940 i FP ali se nalaze u [listingu tema](specific_topics.md) tako da imate predstavu odakle da krenete. Ovo uključuje srednje/napredne koncepte i teme kao što su alati i tekst editori.


## Dijalozi

> Nalaze se u ovom repozitorijumu [ovde](dialogues.md).

Ovo je naročito važno i korisno. Ovo je dublji pregled različitih tema.
