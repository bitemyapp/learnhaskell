# Nasıl Haskell Öğrenirim - Kılavuz

 Başkalarına yardım ederek deneyimlenmiş Haskell öğrenmek için önerilen yöntemdir. [Haskell Book.](http://haskellbook.com) kitabının yazarlarından birine ait önerilerin listesidir. 

## Türkçe Bilmeyenler İçin

- [In English](README.md)

- [Auf Deutsch](guide-de.md)

- [En Español](guide-es.md)

- [En Français](guide-fr.md)

- [In Italiano](guide-it.md)

- [Em Português](guide-pt.md)

- [În Română](guide-ro.md)

- [繁體中文](guide-zh_tw.md)

- [简体中文](guide-zh_CN.md)

- [По-русски](guide-ru.md)

- [Українською](guide-ua.md)

- [Bahasa Indonesia](guide-id.md)

- [Srpski](guide-sr.md)

- [Sa Tagalog](guide-tl.md)

- [한국어](guide-ko.md)

#### _Anlamadığın şeyleri hemen başına dert etme_. Devam et!

## Topluluk

İnternet söyleşi kanalımıza Freenode üzerinden `#haskell-beginners` etiketi ile ulaşabilirsiniz.

İnternet söyleşi kanalımızın ağ istemcisi [için](http://webchat.freenode.net/).

Haskell [e-posta listesi](https://wiki.haskell.org/Mailing_lists).

### Topluluk Kuralları

[Topluluk Kuralları Dosyası](coc.md) söyleşi kanalımızdaki davranış kurallarını içermektedir. Davranış kuralları çerçevesinin dışına bilmeden çıkarsanız uyarı alırsınız, fakat kanalın yalnızca Haskell öğrenenler ve/veya öğretenler için olduğunun her zaman farkında olun.

# Haskell Yükleme Rehberi

## Haskell'e başlamak için Stack kullanın

GHC indirmek ve projelerinizi oluşturmak için [Stack'ı edinin](http://haskellstack.org) .

Eğer Stack hakkında hiçbir bilginiz yoksa ve genel bir tanıtıma ihtiyacınız varsa, kapsamlı Stack video eğitimine [buradan](https://www.youtube.com/watch?v=sRonIB8ZStw) ulaşabilirsiniz.

## Ayrıca, HASKELL PLATFORM İNDİRMEYİN

Haskell.org'da bulunan yönergeyi izlemek yerine Stack edinin.

### Neden Haskell Platform kullanmıyoruz?

https://mail.haskell.org/pipermail/haskell-community/2015-September/000014.html

# Nasıl Haskell öğrenmeliyim?

Ana tavsiyemiz, cis194 kursunun Bahar'13 versiyonundaki ve İşlevsel Programlama kursundaki dersleri okumanız ve tüm alıştırma/ödevleri tamamlamanızdır. İkisini de aşağıda bulabilirsiniz. Bunlar dışındaki her şey opsiyoneldir ve size nereye bakmanız gerektiğiyle alakalı fikir vermek için bahsedilmiştir.

## "Haskell Programming from First Principles" - Kitap.

[@dmvianna](https://github.com/dmvianna) size tavsiye edilen kaynaklardan sadece _ücretsiz_ olanlarının aşağıda olduğunu hatırlatmamı istedi. Eğer bir kitap incelemek istiyorsanız, kendimize ait [Haskell Book!](http://haskellbook.com) kitabını içtenlikle öneririz. Herhangi bir sebepten ötürü kitabın ücretini karşılayamıyorsanız, lütfen [destek sayfamızdaki](http://haskellbook.com/support.html) iletişim bilgilerini kullanarak bize mail atın.

### "Haskell Book" Kitabı burada önerilen birincil kaynakların hepsini içerir.

## Yorgey'in cis194 kursu 

> _Bununla başlayın_ Eğer "Haskell Book" kitabını almayı düşünmüyorsanız bu kurs Haskell'e giriş için en iyi _ücretsiz_  kaynak.

Çevrimiçi [erişim](http://www.seas.upenn.edu/~cis194/spring13/lectures.html).

[Brent Yorgey](https://byorgey.wordpress.com)'in şu ana kadar bulabildiğin 
en iyi kurs. Bu kurs sadece Haskell yazmayı öğretmekle kalmayıp üstüne "Parser Combinator"ler
hakkında bilgi sahibi olmanızı sağladığından dolayı çok değerli bir kaynak.
Eğer bilgisayar programcısı değilseniz veya yeterince deneyiminiz yoksa cis194 
kursuyla başlamanızı tavsiye etmiyoruz. Bu durumda 
[Simon Thompson'ın kitabıyla](http://www.haskellcraft.com/craft3e/Home.html) başlayıp
daha sonra cis194 kursuna geçin.

---

## İşlevsel Programlama Kursu

> Bu kursu Yorgey'in cis194 kursunu tamamladıktan sonra öneriyoruz.

Kursa github üzerinden erişmek için [tıklayınız](https://github.com/bitemyapp/fp-course).

Bu kurs cis194 kursunda bahsedilen kavramları uygulayarak size deneyim katacak
ve Haskell'deki Functor/Applicative/Monad/vb. kavramlarını rahatça kullanmanıza 
_kritik_ düzeyde katkı sağlayacak bir kurs. cis194 ve ardından İşlevsel Programlama
kursunu tamamlamak benim tavsiyelerimin özünü oluşturuyor ve biz herkese Haskell'i
bu şekilde öğretiyoruz.

---

##  cis194 ve İşlevsel Programlama kursundan sonra Tamamlayıcı Kurs

> Orta seviye konularda daha fazla materyal içerir

cs240h kursuna çevrimiçi olarak aşağıdaki linklerden erişebilirsiniz:

- [Spring 14](http://www.scs.stanford.edu/14sp-cs240h/)
- [Winter 16](http://www.scs.stanford.edu/16wi-cs240h/)

Bu kurs [Bryan O'Sullivan](https://github.com/bos) 'ın Standford'da verdiği
derslerin online derlenmiş hali. Eğer kendisinin kim olduğunu bilmiyorsanız, 
herhangi bir Haskell uygulamasının kütüphanelerine göz atın. En az yarısında
ismine rastlayacaksınız. Eğer Yorgey'in kursunu tamamladıysanız
phantom types, bilgi akışı kontrolü, dil eklentileri, concurrency,
pipes, ve lenses hakkındaki modüller ilginizi çekebilir.

---

# Haskell'deki Belirli Konular için Kaynaklar

Bu kaynaklar cis194 and IP kurslarının aksine test edilmemiştir, yine de [konu listesi](specific_topics.md)'nden nereden başlamanız gerektiğine dair bilgi alabilirsiniz. Belgede orta/ileri düzeydeki konseptleri ve "işleme" ve "metin editörleri" gibi konuları bulabilirsiniz.

## Diyaloglar

> [Burada](dialogues.md) muhafaza edilmektedir.

Bu diyaloglar aslında çok önemli ve öğretici. Birçok konuda derin sohbetler
için buraya bakabilirsiniz.
