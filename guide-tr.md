# Nasıl Haskell Öğrenirim - Kılavuz

 Başkalarına yardım ederek deneyimlenmiş, Haskell öğrenmek için önerilen yöntemdir. [Haskell Book](http://haskellbook.com) kitabının yazarlarından birine ait önerilerin listesidir. 

## Türkçe Bilmeyenler İçin

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

- [Srpski](guide-sr.md)

- [Sa Tagalog](guide-tl.md)

- [Українською](guide-ua.md)

- [简体中文](guide-zh_CN.md)

- [繁體中文](guide-zh_tw.md)

- [Magyarul](guide-hu.md)


#### _Anlamadığın şeyleri hemen başına dert etme_. Devam et!

## Topluluk

İnternet söyleşi kanalımıza Freenode üzerinden `#haskell-beginners` etiketi ile ulaşabilirsiniz.

İnternet söyleşi kanalımızın ağ istemcisi [için](http://webchat.freenode.net/).

Haskell [e-posta listesi](https://wiki.haskell.org/Mailing_lists).

### Topluluk Kuralları

[Chris Done'ın eğitim hakkındaki gönderisine göz atın](http://chrisdone.com/posts/teaching)

Nazik ve kibar olun. Kabalık ve edepsizlik insanları korkutur ve onları iletişime katkı yapmalarını engeller.

Yapıcı olmayan eleştiriler sadece söyleyene yarar sağlar, dinleyene değil.

Olayları "çok basit" veya "önemsiz" olarak nitelendirmeyin. Bu şekilde insanlar sıkı çalışmaları gerektiğinde kötü hissederler. Yavaş öğrenen kişiler genellikle titizlerdir ve bu övülmesi gereken bir şeydir!

Şaşırmış gibi yapmayın. Birisi size bir şeyi bilmediğini söylediğinde şaşırmış numarası yapmayın. Bu durumda karşınızdaki berbat hisseder ve siz de kendinizi uyanık hissetmekten başka hiçbir şey elde etmezsiniz.

"Aslında..." cümlesini kurmayın. Biri, çoğunluğu doğru olan - fakat tamamı değil  - bir şey söylediğinde, siz de, "Aslında…" diyip küçük bir düzeltme yaparsınız. Bu özellikle yapılan düzeltme ana konuyla alakasız bir şey olduğu zaman irite edici olabilir. Ayrıca bu durum #haskell-beginners kanalının doğruluğa ve kusursuz olmaya önem vermeyen bir kanal olduğu anlamına gelmez. "Aslında ..." diye başlayan cümlelerin çoğu gösterişle alakalıdır, doğruluğa ulaşmakla alakalı değildir.

Üzerinize vazife olmayan konularda akıl vermeyin. Bir problemi çözmeye çalışan kişiler gördüğünüzde hemen araya kendi tavsiyelerinizi sıkıştırmaya çalışmayın. Biri yardım isteyene kadar onları çalışmalarıyla başbaşa bırakın. Birbirinin sözünü kesmeden konuşmak [#haskell-beginners kanalının kuruluş amaçlarından biridir](http://chrisdone.com/posts/teaching). 

Irkçılık, seksistlik, homofobi, transfobi, veya herhangi bir önyargı ya da nefret söylemi hoş karşılanmayacak ve kesinlikle müsamaha gösterilmeyecektir.

---

 İlkeler [Recurse Center](https://www.recurse.com/manual) 'ın yayınladığı kılavuzdan alınmıştır. Recurse Center'a yayınladığı için teşekkürler!
 
 # What are Haskell, GHC, and Cabal?
 
 Haskell raporlarda belirtildiği üzere bir programlama dilidir, son sürümü 2010 yılında çıkmıştır. Rapora 
 [buradan](http://www.haskell.org/onlinereport/haskell2010/) ulaşabilirsiniz.
 
 ## GHC
 
 [GHC](http://www.haskell.org/ghc/) , Haskell çalışmak için en yaygın yoldur. Derleyicinin yanında, REPL (yorumlayıcı - "interpreter"), paket yöneticisi, ve diğer yararlı şeyleri kapsar.
 
 ## Cabal
 
 [Cabal](https://www.haskell.org/cabal/download.html) proje yönetimini ve
 bağımlılık çözümünü yapar. Cabal ile projeleri oluşturabilir ve genellikle kendi yalıtılmış ortamına ("sandbox") indirebilirsiniz.
 
 Cabal Ruby'deki Bundler, Python'daki pip, Node'daki NPM ve Maven'e eş değerdir. GHC
 paketleri yönetir, Cabal hangi sürümlerin kurulacağına karar verir.

# Haskell Kurulum Rehberi

## Haskell'e başlamak için Stack kullanın

GHC indirmek ve projelerinizi oluşturmak için [Stack'ı edinin](http://haskellstack.org) .

Eğer Stack hakkında hiçbir bilginiz yoksa ve genel bir tanıtıma ihtiyacınız varsa, kapsamlı Stack video eğitimine [buradan](https://www.youtube.com/watch?v=sRonIB8ZStw) ulaşabilirsiniz.

## HASKELL PLATFORM İNDİRMEYİN

Haskell.org'da bulunan yönergeyi izlemek yerine Stack edinin.

### Neden Haskell Platform kullanmıyoruz?

https://mail.haskell.org/pipermail/haskell-community/2015-September/000014.html

# Aşağıdaki yönergeler artık kullanılmamaktadır

Aşağıdaki yönergeleri izlemek yerine [Stack](http://haskellstack.org) edinmenizi öneriyoruz, fakat asgari düzeyde kurulum yapmak isteyenler için yönergeler muhafaza edilmektedir.

# GHC & Cabal Kurulumu

## Ubuntu

[Bu arşiv (PPA)](http://launchpad.net/~hvr/+archive/ghc) mükemmel ve tüm Linux makinelerimde bunu kullanıyorum.

Yani:

```bash
$ sudo apt-get update
$ sudo apt-get install python-software-properties # v12.04 and below
$ sudo apt-get install software-properties-common # v12.10 and above
$ sudo add-apt-repository -y ppa:hvr/ghc
$ sudo apt-get update
$ sudo apt-get install cabal-install-1.24 ghc-7.10.3 happy-1.19.5 alex-3.1.4
```

Ardından aşağıdakini `$PATH` değişkeninize ekleyin (bash\_profile, zshrc, bashrc, etc):

```
export PATH=~/.cabal/bin:/opt/cabal/1.24/bin:/opt/ghc/7.10.3/bin:/opt/happy/1.19.5/bin:/opt/alex/3.1.4/bin:$PATH
```

*Opsiyonel:* Path değişkeninize `.cabal-sandbox/bin` de ekleyebilirsiniz. Geliştirdiğiniz
 koda komut satırından erişebilirsiniz. Bu sadece şu anda çalıştığınız dizin Cabal sandbox ise çalışır.

## Debian

### Ubuntu PPA kullanarak

Eğer stabil sürümü kullanmıyorsanız, Ubuntu'daki adımları olduğu gibi yapabilirsiniz, fakat ekstradan
bir komut daha çalıştırmanız gerekecek.
`sudo add-apt-repository -y ppa:hvr/ghc` çalıştırıldıktan hemen sonra aşağıdaki kodu çalıştırın:

```bash
$ sudo sed -i s/jessie/trusty/g /etc/apt/sources.list.d/hvr-ghc-jessie.list
```

Diğer Debian sürümleri için, yukarda gördüğünüz komuttaki
bütün `jessie`'leri kendi sürümünüzün adıyla değiştirin.

Herhangi bir sebepten ötürü, `/etc/apt/sources.list.d/hvr-ghc-jessie.list` dosyası
yoksa, `/etc/apt/sources.list` dosyası aşağıdaki gibi bir satır içermelidir:

    deb http://ppa.launchpad.net/hvr/ghc/ubuntu jessie main

Bu satırda `jessie` yerine `trusty` yazın.

### Manuel compilation

Mac OS X için yazılmış olan
[buradaki](http://www.davesquared.net/2014/05/platformless-haskell.html) kılavuzu
kullanabilirsiniz:

Not:

- GHC'yi yapılandırırken ön eklerinizi (prefix) de düzenleyin.
- `cabal-install` dosyası yerine, kaynağı indirin ve
  `bootstrap.sh` komut dizisini çalıştırın.

## Fedora 21

Haskell 7.8.4 sürümünü resmi olmayan repodan kurmak istiyorsanız (Fedora 22+ resmi sürümü
içerir):

```bash
$ sudo yum-config-manager --add-repo \
> https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/repo/fedora-21/petersen-ghc-7.8.4-fedora-21.repo
$ sudo yum install ghc cabal-install
```

[petersen/ghc-7.8.4 copr page](https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/) 'de bahsedildiği gibi 
bu ghc, Fedora/EPEL ghc ile birlikte kurulamaz.

## Arch Linux

Haskell'i Arch Linux'ün resmi reposundan indirip kurmak için 
aşağıdaki komutu çalıştırın:

```bash
$ sudo pacman -S cabal-install ghc happy alex haddock
```

## Gentoo

Gentoo'da, Haskell Platform'un parçalarını Portage aracılığı ile ayrı ayrı
kurabilirsiniz. Eğer `ACCEPT_KEYWORDS=arch` kullanırsanız (
`ACCEPT_KEYWORDS=~arch` yerine) Portage, Haskell'deki eski bazı şeyleri de kuracaktır.
Bunu göz önünde bulundurarak, sadece ve sadece `ACCEPT_KEYWORDS=arch` kullanacaksanız, aşağıdaki
 satırları `/etc/portage/package.keywords` dosyasına ekleyin.

    dev-haskell/cabal-install
    dev-lang/ghc

Bunu tamamladıktan sonra aşağıdaki komutları çalıştırın:

```bash
$ emerge -jav dev-lang/ghc dev-haskell/cabal-install
```

Gentoo `cabal-install`'ın "stabil" (diğer bir tabirle: eski) bir sürümünü Portage
ağacında tutar. Eğer `cabal-install`'ın daha yeni bir sürümü kullanmak istiyorsanız 
aşağıdaki komutları çalıştırın. Burada "\" işaretlerinin gerekli olduğuna dikkat edin.

```bash
$ \cabal update                # Ters eğik çizgiler
$ \cabal install cabal-install #     gereklidir.
```

Şu anda Cabal'ı Portage kullanarak global şekilde ve  `cabal-install` kullanarak
ana dizininize kurdunuz. Sonraki adım terminalde `cabal` çalıştırdığınızda 
shell'in ana dizininizdeki güncel sürümü çalıştırdığından emin olmak
Bunu da aşağıdaki satırları shell'in konfigürasyon dosyası ekleyerek yapabilirsiniz:

```bash
PATH=$PATH:$HOME/.cabal/bin
alias cabal="$HOME/.cabal/bin/cabal"
```

Shell'in ne olduğunu bilmiyorsanız, büyük bir ihtimalle,shell Bash olarak geçmektedir.
Eğer Bash kullanıyorsanız, düzenleyeceğiniz dosya `~/.bashrc` olmalı. Eğer Z-shell kullanıyorsanız, 
dosyanın ismi `~/.zshrc`. Kullandığınız shell'in ne olduğunu öğrenmek için aşağıdaki komutları 
çalıştırabilirsiniz.

```bash
echo $SHELL | xargs basename
```

Örneğin ben zsh kullanıyorum, bu yüzden komutu çalıştırdığımda `zsh` yanıtını aldım.

Bunların hepsini yaptıktan sonra, ek araçlar olarak `alex` ve `happy` kurun. Bunun için:
    
```bash
$ cabal install alex happy
```

Tebrikler! Şu anda çalışan bir Haskell kurulumuna sahipsin!

## Mac OS X

### 10.9

GHC ve Cabal içeren [GHC for Mac OS X](http://ghcformacosx.github.io/) uygulamasını kurun.
Uygulamada, `.app` dosyasını bir yere koyduktan sonra GHC ve Cabal'ı 
path değişkenine nasıl ekleyeceğinizi anlatan yönergeleri de bulabilirsiniz.

### 10.6-10.8

 [Buradaki tar dosyasını](https://www.haskell.org/platform/download/2014.2.0.0/ghc-7.8.3-x86_64-apple-darwin-r3.tar.bz2) indirip kurulumu gerçekleştirin.

## Windows

- [Minimum GHC Installer](https://github.com/fpco/minghc#using-the-installer)
  `network` kütüphanesini ve diğer kütüphaneleri derleyebilmektedir. Minimal GHC ortamının ("environment") yanında
  Cabal ve MSYS'yi ( `network` gibi kütüphaneleri indirmenize yarayan derleyici ortamı) de içerir.

 [minghc](https://github.com/fpco/minghc) web sayfasında birkaç detaya rastlayabilirsiniz, fakat normal olanın
 tüm sistem dizini yerine sadece local AppData dizinine kurmanız olduğunu unutmayın.
(C:\Users\<kullaniciadi>\AppData\Local\Programs)

## Diğer Linux Kullanıcıları

 Cabal and ghc'nin son sürümlerini aşağıdaki linklerden indirebilirsiniz:

- [GHC](http://www.haskell.org/ghc/).

- [Cabal](https://www.haskell.org/cabal/download.html).


## Diğer Unix-benzeri Sistem Kullanıcıları

Paket yükleyicinizden GHC ve Cabal'i indirip kurun, sonra `$PATH` değişkeninize `~/.cabal/bin` dizinini atayın. Son olarak `cabal`'ı güncelleyin ve `alex` ve `happy`'i kurun.
    
```bash
$ cabal update
$ cabal install cabal-install alex happy
```

# Nasıl Haskell öğrenmeliyim?

Ana tavsiyemiz, cis1940 kursunun Bahar'13 versiyonundaki ve İşlevsel Programlama kursundaki dersleri okumanız ve tüm alıştırma/ödevleri tamamlamanızdır. İkisini de aşağıda bulabilirsiniz. Bunlar dışındaki her şey opsiyoneldir ve size nereye bakmanız gerektiğiyle ilgili fikir vermek için bahsedilmiştir.

## "Haskell Programming from First Principles" - Kitap.

[@dmvianna](https://github.com/dmvianna) size tavsiye edilen kaynaklardan sadece _ücretsiz_ olanlarının aşağıda olduğunu hatırlatmamı istedi. Eğer bir kitap incelemek istiyorsanız, kendimize ait [Haskell Book!](http://haskellbook.com) kitabını içtenlikle öneririz. Herhangi bir sebepten ötürü kitabın ücretini karşılayamıyorsanız, lütfen [destek sayfamızdaki](http://haskellbook.com/support.html) iletişim bilgilerini kullanarak bize mail atın.

### "Haskell Book" Kitabı burada önerilen birincil kaynakların hepsini içerir.

## Yorgey'in cis1940 kursu 

> _Bununla başlayın;_ Eğer "Haskell Book" kitabını almayı düşünmüyorsanız bu kurs Haskell'e giriş için en iyi _ücretsiz_  kaynak.

Çevrimiçi [erişim](http://www.seas.upenn.edu/~cis1940/spring13/lectures.html).

[Brent Yorgey](https://byorgey.wordpress.com)'in kursu şu ana kadar bulabildiğim 
en iyi kurs. Bu kurs sadece Haskell yazmayı öğretmekle kalmayıp üstüne "Parser Combinator"ler
hakkında bilgi sahibi olmanızı sağladığından dolayı çok değerli bir kaynak.
Eğer bilgisayar programcısı değilseniz veya yeterince deneyminiz yoksa cis1940 
kursuyla başlamanızı tavsiye etmiyoruz. Bu durumda 
[Simon Thompson'ın kitabıyla](http://www.haskellcraft.com/craft3e/Home.html) başlayıp
daha sonra cis1940 kursuna geçin.

---

## İşlevsel Programlama Kursu

> Bu kursu Yorgey'in cis1940 kursunu tamamladıktan sonra öneriyoruz.

Kursa github üzerinden erişmek için [tıklayınız](https://github.com/bitemyapp/fp-course).

Bu kurs cis1940 kursunda bahsedilen kavramları uygulayarak size deneyim katacak
ve Haskell'deki Functor/Applicative/Monad/vb. kavramlarını rahatça kullanmanıza 
_kritik_ düzeyde katkı sağlayacak bir kurs. cis1940 ve ardından İşlevsel Programlama
kursunu tamamlamak benim tavsiyelerimin özünü oluşturuyor ve biz herkese Haskell'i
bu şekilde öğretiyoruz.

---

## Tamamlayıcı Kurs - cis1940 ve İşlevsel Programlama kursundan sonra 

> Orta seviye konularda daha fazla materyal içerir

cs240h kursuna çevrimiçi olarak aşağıdaki linklerden erişebilirsiniz:

- [Spring 14](http://www.scs.stanford.edu/14sp-cs240h/)
- [Winter 16](http://www.scs.stanford.edu/16wi-cs240h/)

Bu kurs [Bryan O'Sullivan](https://github.com/bos) 'ın Standford'da verdiği
derslerin online derlenmiş hali. Eğer kendisinin kim olduğunu bilmiyorsanız, 
herhangi bir Haskell uygulamasının kütüphanelerine göz atın. En az yarısında
ismine rastlayacaksınızdır. Eğer Yorgey'in kursunu tamamladıysanız
phantom types, bilgi akışı kontrolü, dil eklentileri, concurrency,
pipes, ve lenses hakkındaki modüller ilginizi çekebilir.

---

# Haskell'deki Belirli Konular için Kaynaklar

Bu kaynaklar cis1940 and IP kurslarının aksine test edilmemiştir, yine de [konu listesi](specific_topics.md)'den nereden başlamanız gerektiğine dair bilgi alabilirsiniz. Belgede orta/ileri düzeydeki konseptleri ve "işleme" ve "metin editörleri" gibi konuları bulabilirsiniz.

# Araçlar 

## Eğer acemiyseniz ghc-mod indirmeyin ve kullanmaya çalışmayın

Biraz kırılgan ve daha yavaştır, çaba sarfetmeye değmez.

## Text Editors

- Emacs
  - [haskell-mode yükleyin](https://github.com/bitemyapp/dotfiles/blob/master/.emacs#L31)
  - [flycheck yükleyin](https://github.com/bitemyapp/dotfiles/blob/master/.emacs#L29)
  - Haskell'i etkinleştirin ve ayarlayın, diğer şeyleri önemsemiyorsanız `(require 'haskell)` modülünü gerektirir.
  - [flycheck'i etkinleştirin](https://github.com/bitemyapp/dotfiles/blob/master/.emacs#L97)
  - Stack'in `/usr/bin` dizinine kısayol bağlantısını yapın veya flycheck'in onu görebildiğinden emin olun.
  - [dunzo.](https://twitter.com/bitemyapp/status/693621160571985920)

- Vim
  - Biz [Stephen Diehl'in vim yönergesini](http://www.stephendiehl.com/posts/vim_2016.html) öneriyoruz fakat şimdilik ghc-mod'u aşağıdaki satırlarla değiştirin.
  - Vim'de type hatalarını eksiksiz biçimde almak için (ghc-mod yerine)
```
autocmd FileType haskell setlocal makeprg=stack\ build
autocmd FileType haskell setlocal errorformat=%f:%l:%v:%m
```

- [Sublime Text](https://github.com/SublimeHaskell/SublimeHaskell)

- [Atom](https://atom.io/packages/ide-haskell)

- [IntelliJ](https://github.com/carymrobbins/intellij-haskforce)

- Notepad++, Haskell destekler.

- gedit, Haskell destekler.

## Other

- Haskell For Mac

## Diyaloglar

> [Burada](dialogues.md) muhafaza edilmektedir.

Bu diyaloglar aslında çok önemli ve öğreticidir. Birçok konuda derin sohbetler
için buraya bakabilirsiniz.
