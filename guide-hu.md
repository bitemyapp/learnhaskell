# Hogyan tanuljunk Haskellt?

A következőekben egy, a mi tapasztalatainkra alapuló ajánlott tanulási út kerül bemutatásra. Ez a [Haskell Könyv](https://haskellbook.com) egyik szerzőjének ajánlólistája alapján készült.

#### _Ne aggódj, ha valamit nem értesz azonnal_. Csak haladj tovább!

## Közösség

Az IRC csatornánk `#haskell-beginners` a [Libera Chat](https://libera.chat/) platformon található.

IRC web kliens [itt](https://web.libera.chat/).

A Haskell levelezőlisták pedig [itt](https://wiki.haskell.org/Mailing_lists) találhatóak.

### Közösségi irányelvek

Tekintsd meg a [közösségi irányelveket](coc.md), hogy megértsd, milyen magatartást várunk el az IRC csatornán. Figyelmeztetést kapsz, ha nem egyértelműen trollkodsz, de vedd figyelembe, hogy a csatorna kizárólag a Haskell tanulására vagy tanítására szolgál.

# Haskell telepítése

## Használd a Stacket a Haskell telepítéséhez

Töltsd le a [Stacket](https://haskellstack.org), hogy telepíthesd a GHC-t és projekteket hozhass létre.

Ha semmit sem tudsz a Stack-ről, és áttekintést szeretnél kapni, nézd meg ezt az [átfogó Stack videó oktatóanyagot](https://www.youtube.com/watch?v=sRonIB8ZStw).

## NE TELEPÍTSD A HASKELL PLATFORMOT

Ahelyett, hogy a haskell.org utasításait követnéd, használd a Stacket.

### Miért ne használd a platformot?

https://mail.haskell.org/pipermail/haskell-community/2015-September/000014.html

# Hogyan tanuljam meg a Haskellt?

A fő ajánlás az, hogy olvasd el az előadásokat, és végezd el az összes gyakorlatot/házi feladatot a cis1940 2013-as tavaszi változatából, majd folytasd az FP kurzussal. Mindkettő lentebb van belinkelve. Minden más opcionálisnak tekinthető, de azért megemlítjük, hol találod meg őket.

## Haskell programozás az alapoktól

[@dmvianna](https://github.com/dmvianna) szeretné, ha tudnád, hogy az alábbiak csak az _ingyenes_ ajánlott források. Ha hajlandó vagy egy könyvet is megnézni, szívből ajánljuk a saját [Haskell könyvünket!](https://haskellbook.com) Ha valamilyen okból nem engedheted meg magadnak a könyvet, kérlek írj nekünk az [oldalunkon](https://haskellbook.com/support.html) található elérhetőségeken.

### A Haskell Könyv lefedi az itt ajánlott elsődleges forrásokat

## Yorgey cis1940 kurzusa

> _Ezt csináld először_, ha nem vásárolod meg a Haskell Könyvet, ez a legjobb _ingyenes_ bevezető a Haskellbe.

Elérhető [online](https://www.seas.upenn.edu/~cis1940/spring13/lectures.html).

[Brent Yorgey](https://byorgey.wordpress.com) kurzusa a legjobb, amit eddig találtam.
Ez a kurzus nemcsak alapvető Haskell nyelvben való programozásra készít fel, hanem segít a parser kombinátorok megértésében is.

Ha nem vagy programozó, vagy épp tapasztalatlan vagy, akkor ne kezd ezzel. Ebben az esetben kezdj [Thompson könyvével](https://www.haskellcraft.com/craft3e/Home.html), és utána vágj bele a cis1940 kurzusba.

---

## Funkcionális programozási kurzus

> Ezt a kurzust ajánljuk Yorgey cis1940 kurzusa után

Elérhető GitHubon [itt](https://github.com/bitemyapp/fp-course).

Ez megerősíti az eddigi tudásodat, közvetlenül begyakoroltatva veled a cis1940-ban bevezetett absztrakciókat. Ez a gyakorlás _kritikus_ ahhoz, hogy kényelmesen használd majd a Functor/Applicative/Monad/stb. szerkezeteket Haskellben. A cis1940 és az FP kurzus elvégzése a legfőbb ajánlás az útmutatómban. Mi így tanítunk meg mindenkit Haskellre.

---

## Kiegészítő kurzus a cis1940 és az FP kurzus után

> További anyagok középhaladó témákban

A cs240h online elérhető:

- ['14 Tavaszi kurzus](http://www.scs.stanford.edu/14sp-cs240h/)
- ['16 Téli kurzus](http://www.scs.stanford.edu/16wi-cs240h/)

Ez [Bryan O'Sullivan](https://github.com/bos) online kurzusa, amelyet a Stanfordon tanít.
Ha nem tudod, ki ő, nézd meg a Haskell alkalmazásokhoz szükséges könyvtárak felét, és az ő neve lesz rajta. Különösen érdekesek a modulok, ha már elvégezted a Yorgey kurzust: fantom típusok (*phantom types*), információáramlás ellenőrzése (*flow control*), nyelvi kiterjesztések (*language extenstions*), párhuzamosság (*concurrency*), csövek (*pipes*), és lencsék (*lenses*).

---

# Források Haskell specifikus témákhoz

Ezek az anyagok nincsenek olyan mélységben tesztelve, mint a cis1940 és az FP kurzusok, de a [témák listájában](specific_topics.md) linkelve vannak, hogy ötleteket kapj, hogy honnan érdemes nekifogni. Ez olyan dolgokat foglal magában, mint a középhaladó/haladó fogalmak, és olyan témák, mint az eszközök (*tools*) és szövegszerkesztők (*text editors*).

## Párbeszédek

> Ebben a repositoryban találhatóak [itt](dialogues.md).

Ezek valójában nagyon fontosak és hasznosak. Itt találsz mélyebb betekintéseket különböző témákba.
