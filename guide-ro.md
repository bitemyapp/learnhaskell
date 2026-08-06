# Ghid pentru a învăța Haskell

Acest tutorial reprezintă calea recomandată pentru a învăța Haskell, pe baza experiențelor avute ajutând alte persoane. Lista de recomandări este creată de unul din autorii [Haskell Book](https://haskellbook.com).

#### *Nu vă stresați prea mult pentru lucrurile pe care nu le înțelegeți imediat*. Mergeți mai departe!

## Comunitate

Canalul de IRC este `#haskell-beginners` de pe Freenode.

Un client web the IRC este [aici](http://webchat.freenode.net/).

[Lista de discuții](https://wiki.haskell.org/Mailing_lists).

### Recomandări pentru integrarea în comunitate

Citiți [lista de sfaturi](coc.md) pentru a înțelege regulile de bună purtare așteptate pe canalul de IRC. Veți primi un avertisment dacă nu sunteți foarte nesimțiți, dar trebuie să știți că acest canal este exclusiv dedicat celor care învață sau predau Haskell.

# Instalarea Haskell

## Folosiți Stack pentru a lucra în Haskell

Obțineți [Stack](https://haskellstack.org) pentru a instala GHC și a construi proiecte.

Dacă nu știți nimic despre Stack și vreți o descriere, vizionați acest [tutorial Stack detaliat](https://www.youtube.com/watch?v=sRonIB8ZStw).

## De asemenea, NU INSTALAȚI HASKELL PLATFORM

În loc să urmăriți instrucțiunile de pe Haskell.org, folosiți Stack.

### De ce nu Haskell platform?

https://mail.haskell.org/pipermail/haskell-community/2015-September/000014.html

# Cum puteți învăța Haskell?

Recomandarea principală este să citiți lecrurile și să rezolvați toate exercițiile/temele acasă din versiunea de toamnă, 2013, a cursului cis1940, urmate de a face același lucru și pentru cursul FP. Ambele cursuri sunt referite mai jos. Orice altceva poate fi considerat opțional, celelate referințe de mai jos sunt doar ca să știți unde vă mai puteți uita.

## Alternativ...

[@dmvianna](https://github.com/dmvianna) a dorit să vă anunț că recomandările de aici sunt doar resursele _gratuite_. Dacă doriți să citiți o carte, vă recomandăm cu mare placere cartea noastră, [Haskell Book!](https://haskellbook.com). Aceasta înlocuiește în principiu toate recomandările de aici.

## Cursul cis1940 al lui Yorgey

> *Treceți prin acest curs prima dată*, acesta este modul principal prin care recomandăm
> primul contact cu Haskell.

Este disponibil [online](https://www.seas.upenn.edu/~cis1940/spring13/lectures.html).

Cursul lui [Brent Yorgey](https://byorgey.wordpress.com) este cel mai bun pe care l-am găsit până acum.
Este foarte valoros mai ales că nu numai că vă va învăța cum să scrieți cod Haskell de bază dar vă va
și ajuta să înțelegi combinatorii de analiză gramaticală.

Singurul caz în care acest curs nu este recomandat este dacă nu sunteți programator/programatoare sau nu aveți multă experiență în domeniu.
În acest caz, recomandarea este să începeți cu
[cartea lui Thompson](https://www.haskellcraft.com/craft3e/Home.html) și să tranziționați ulterior la cis1940.

---

## Cursul FP

> Este cursul pe care-l recomandăm după ce ați trecut prin cursul lui Yorgey

Este disponibil pe GitHub [aici](https://github.com/bitemyapp/fp-course).

Acesta vă va oferi experiența de a implementa abstracțiile din cis1940, o practică **esențială** pentru a fi obișnuiți cu utilizarea comună a Functor/Applicative/Monad/etc în Haskell
Principala recomandare a acestui ghid este să treceți întâi prin cis1940 și apoi prin FP și reprezintă exact modul în care noi predăm Haskell.

---

## Cursuri suplimentare după cis1940 și FP

> Oferă mai multe materiale pe subiecte de dificultate medie

cs240h este disponibil [online](http://www.scs.stanford.edu/14sp-cs240h/).

Acesta este cursul online al lui [Bryan O'Sullivan](https://github.com/bos) de la
Stanford. Dacă nu știți cine este, uitați-vă la faptul că jumătate din bibliotecile
pe care orice aplicație Haskell ajunge să le folosească poartă numele lui. Dacă alegeți
să faceți acest curs, importante sunt capitolele legate de phantom types, fluxul informației,
extensiile de limbaj, concurență, pipes și lenses.

---

# Resourse pentru topicuri specifice în Haskell

Aceste resurse nu sunt validate în practică la aceeași profunzime ca cis1940 și FP, dar sunt referite în
[lista de topicuri](specific_topics.md) ca să aveți o idee de unde să începeți.
Lucruri precum concepte de nivel mediu/avansat și subiecte precum instrumente de dezvoltare și editoare de text sunt incluse.

## Dialoguri

> Stocate în repository-ul de [aici](dialogues.md).

De fapt, acestea sunt foarte importante și ajută. Citiți aceste dialoguri pentru a aprofunda o varietate de topicuri.
