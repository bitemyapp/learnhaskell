# Bagaimana cara belajar Haskell

Ini adalah langkah yang direkomendasikan untuk belajar Haskell berdasarkan pengalaman membantu orang lain.

## Untuk pembicara non-English

* [Auf Deutsch](guide-de.md)

<!-- * [Στην ελληνική](guide-el.md) -->

* [En Español](guide-es.md)

* [En Français](guide-fr.md)

* [In Italiano](guide-it.md)

* [Em Português](guide-pt.md)

* [繁體中文](guide-zh_tw.md)

* [简体中文](guide-zh_CN.md)

* [По-русски](guide-ru.md)

* [Українською](guide-ua.md)

* [Bahasa Indonesia](guide-id.md)

* [Srpski](guide-sr.md)

#### *Jangan memikirkan hal yang tidak langsung anda mengerti*. Lanjutkan terus!

# Isi
* [Komunitas](#hxx8uxkrzu)
  * [Panduan Komunitas](#xux0vqb4um)
* [Memasang Haskell](#jxknwf5dgb)
  * [Gunakan Stack untuk melanjutkan dengan Haskell](#x4d0fcsobg)
  * [Dan juga, JANGAN PASANG HASKELL PLATFORM](#p7bm84lgt7)
    * [Mengapa bukan platform?](#35yzgg78ed)
* [Bagaimana seharusnya Saya mempelajari Haskell?](#di32a1eue6)
  * [Kursus cis194 Yorgey](#3y0l9td7s1)
  * [Pelajaran FP](#lzs5y25m7e)
  * [Pelajaran tambahan setelah pelajaran cis194 dan FP](#pwckvvr3v9)
* [Sumber untuk topik spesifik pada Haskell](#9ez5kl4plcj)
  * [Dialog](#0clttkef4n)

# Komunitas <a name="hxx8uxkrzu"></a>

Kanal IRC kami adalah `#haskell-beginners` di Freenode.

Situs klien IRC [disini](http://webchat.freenode.net/).

Haskell [milis](https://wiki.haskell.org/Mailing_lists).


## Panduan Komunitas  <a name="xux0vqb4um"></a>

Lihat [Panduak Komunitas](coc.md) untuk mengerti etika yang diharapkan ketika berada pada kanal IRC. Anda akan mendapatkan peringatan jika Anda melakukan hasutan yang tidak jelas, namun perlu menjadi perhatian bahwa kanal secara eksklusif untuk siapa yang belajar atau mengajarkan Haskell.


# Memasang Haskell <a name="jxknwf5dgb"></a>

## Gunakan Stack untuk melanjutkan dengan Haskell <a name="x4d0fcsobg"></a>

Dapatkan [Stack](https://haskellstack.org) untuk mendapatkan GHC terpasang dan membuat proyek anda.

Jika Anda tidak tau apapun tentang Stack dan ingin sebuah ikhtisar, periksa ini [Video pengajaran Stack komprehensif](https://www.youtube.com/watch?v=sRonIB8ZStw).


## Dan juga, JANGAN PASANG HASKELL PLATFORM <a name="p7bm84lgt7"></a>

Sebagai ganti mengikuti instruksi pada Haskell.org, dapatkan Stack.

### Mengapa bukan platform? <a name="35yzgg78ed"></a>

https://mail.haskell.org/pipermail/haskell-community/2015-September/000014.html


# Bagaimana seharusnya Saya mempelajari Haskell? <a name="di32a1eue6"></a>

Yang paling direkomendasikan adalah untuk membaca materi kuliah dan menyelesaikan seluruh latihan/pekerjaan rumah untuk versi Spring 13 dari cis194 diikuti dengan pelajaran FP. Keduanya ditautkan dibawah. Selain dari itu dapat dikategorikan sebagai opsional dan diberitahukan agar anda mengetahui kemana harus mencarinya.

## Kursus cis194 Yorgey <a name="3y0l9td7s1"></a>

> *Lakukan ini terlebih dahulu*, ini adalah langkah awal yang kami rekomendasikan untuk dikenalkan kepada 
> Haskell.

Tersedia [online](https://www.seas.upenn.edu/~cis194/spring13/lectures.html).

Mata kuliah [Brent Yorgey](https://byorgey.wordpress.com) adalah yang terbaik yang saya temukan sejauh ini.
Mata kuliah ini berharga karena tidak hanya membekali anda untuk menulis dasar
Haskell namun juga membantu anda untuk mengerti parser combinators.

Satu-satunya alasan anda tidak seharusnya mulai dengan cis194 adalah jika anda bukanlah programmer
atau adalah yang tidak berpengalaman. Jika demikian, mulailah dengan
[Thompson's book](https://www.haskellcraft.com/craft3e/Home.html) kemudian beralih 
ke cis194.


---

## Pelajaran FP  <a name="lzs5y25m7e"></a>

> Ini adalah pelajaran yang kami rekomendasikan untuk dikerjakan setelah mata kuliah cis194 Yorgey.

Tersedia di github [disini](https://github.com/bitemyapp/fp-course).

Ini akan membantu dan memberikan anda pengalaman secara langsung mengimplementasikan 
abstraksi yang dikenalkan di cis194, ini adalah latihan yang *penting* untuk 
menjadi nyaman dengan penggunaan Functor/Applicative/Monad/dll sehari-hari pada
Haskell. Menempuh cis194 dan kemudian pelajaran FP mewakili rekomendasi utama
dari panduan saya dan bagaimana kami mengajarkan Haskell kepada semua orang.

---

## Pelajaran tambahan setelah pelajaran cis194 dan FP <a name="pwckvvr3v9"></a>

> Menyediakan materi tambahan untuk topik menengah.

cs240h tersedia secara [online](http://www.scs.stanford.edu/14sp-cs240h/).

Ini adalah pelajaran online [Bryan O'Sullivan](https://github.com/bos) dari kelas
yang ia ajar di Stanford. Jika anda tidak mengetahui siapa ia, coba lihat sebentar pada setengah
pustaka setiap aplikasi Haskell yang dibutuhkan dan namanya ada pada pustaka tersebut. Dengan
catatan tersendiri bahwa anda telah menyelesaikan pelajaran Yorgey yang ada di modul
phantom types, information flow control, language extensions, concurrency,
pipes, dan lenses.

---

# Sumber untuk topik spesifik pada Haskell <a name="9ez5kl4plcj"></a>

Sumber-sumber ini tidak diperiksa atau dicoba kepada pelajar seperti pelajaran cis194 dan FP, tapi ditautkan pada [the topic listing](specific_topics.md) sehingga anda memiliki gambaran mengenai darimana harus memulai. Hal ini juga termasuk konsep menengah/lanjutan dan subyek seperti alat-alat dan editor teks.


## Dialog <a name="0clttkef4n"></a>

> Di pasang pada repositori [disini](dialogues.md).

Ini sebenarnya lumayan penting dan membantu. Lihat kesini untuk mengenal lebih dalam pada beberapa 
variasi topik.
