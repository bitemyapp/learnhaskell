# Bagaimana cara belajar Haskell

Ini adalah langkah yang direkomendasikan untuk belajar Haskell berdasarkan pengalaman membantu orang lain. Daftar rekomendasi bersumber dari salah satu penulis [Haskell Book.](http://haskellbook.com)

## Untuk pembicara non-English 

- [In English](README.md)

- [Auf Deutsch](guide-de.md)

- [En Español](guide-es.md)

- [En Français](guide-fr.md)

- [Na Hrvatskom](guide-hr.md)

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

#### *Jangan memikirkan hal yang tidak langsung anda mengerti*. Lanjutkan terus! 

## Komunitas

Kanal IRC kami adalah `#haskell-beginners` di Freenode.

Situs klien IRC [disini](http://webchat.freenode.net/).

Haskell [milis](https://wiki.haskell.org/Mailing_lists).


### Panduan Komunitas 

Lihat [Panduak Komunitas](coc.md) untuk mengerti etika yang diharapkan ketika berada pada kanal IRC. Anda akan mendapatkan peringatan jika Anda melakukan hasutan yang tidak jelas, namun perlu menjadi perhatian bahwa kanal secara eksklusif untuk siapa yang belajar atau mengajarkan Haskell.


# Memasang Haskell

## Gunakan Stack untuk melanjutkan dengan Haskell

Dapatkan [Stack](https://haskellstack.org) untuk mendapatkan GHC terpasang dan membuat proyek anda.

Jika Anda tidak tau apapun tentang Stack dan ingin sebuah ikhtisar, periksa ini [Video pengajaran Stack komprehensif](https://www.youtube.com/watch?v=sRonIB8ZStw).


## Dan juga, JANGAN PASANG HASKELL PLATFORM

Sebagai ganti mengikuti instruksi pada Haskell.org, dapatkan Stack.

### Mengapa bukan platform?

https://mail.haskell.org/pipermail/haskell-community/2015-September/000014.html


# Bagaimana seharusnya Saya mempelajari Haskell?

Yang paling direkomendasikan adalah untuk membaca materi kuliah dan menyelesaikan seluruh latihan/pekerjaan rumah untuk versi Spring 13 dari cis1940 diikuti dengan pelajaran FP. Keduanya ditautkan dibawah. Selain dari itu dapat dikategorikan sebagai opsional dan diberitahukan agar anda mengetahui kemana harus mencarinya.

## Haskell Programming from First Principles

[@dmvianna](https://github.com/dmvianna) menginginkan saya untuk memberitahu bahwa dibawah ini adalah rekomendasi sumber yang _gratis_. Jika anda ingin memiliki buku, kami sangat merekomendasikan buku kami  [Haskell Book!](http://haskellbook.com). Jika kamu tidak mampu membeli bukunya karena alasan apapun, silahkan hubungi kami dengan surat elektronik menggunakan kontak di [our support page](http://haskellbook.com/support.html).

## Kursus cis1940 Yorgey

> *Lakukan ini terlebih dahulu*, ini adalah langkah awal yang kami rekomendasikan untuk dikenalkan kepada 
> Haskell.

Tersedia [online](https://www.seas.upenn.edu/~cis1940/spring13/lectures.html).

Mata kuliah [Brent Yorgey](https://byorgey.wordpress.com) adalah yang terbaik yang saya temukan sejauh ini.
Mata kuliah ini berharga karena tidak hanya membekali anda untuk menulis dasar
Haskell namun juga membantu anda untuk mengerti parser combinators.

Satu-satunya alasan anda tidak seharusnya mulai dengan cis1940 adalah jika anda bukanlah programmer
atau adalah yang tidak berpengalaman. Jika demikian, mulailah dengan
[Thompson's book](https://www.haskellcraft.com/craft3e/Home.html) kemudian beralih 
ke cis1940.


---

## Pelajaran FP 

> Ini adalah pelajaran yang kami rekomendasikan untuk dikerjakan setelah mata kuliah cis1940 Yorgey.

Tersedia di github [disini](https://github.com/bitemyapp/fp-course).

Ini akan membantu dan memberikan anda pengalaman secara langsung mengimplementasikan 
abstraksi yang dikenalkan di cis1940, ini adalah latihan yang _penting_ untuk 
menjadi nyaman dengan penggunaan Functor/Applicative/Monad/dll sehari-hari pada
Haskell. Menempuh cis1940 dan kemudian pelajaran FP mewakili rekomendasi utama
dari panduan saya dan bagaimana kami mengajarkan Haskell kepada semua orang.

---

## Pelajaran tambahan setelah pelajaran cis1940 dan FP

> Menyediakan materi tambahan untuk topik menengah.

cs240h tersedia secara online:
- [Spring 14](http://www.scs.stanford.edu/14sp-cs240h/)
- [Winter 16](http://www.scs.stanford.edu/16wi-cs240h/)

Ini adalah pelajaran online [Bryan O'Sullivan](https://github.com/bos) dari kelas
yang ia ajar di Stanford. Jika anda tidak mengetahui siapa ia, coba lihat sebentar pada setengah
pustaka setiap aplikasi Haskell yang dibutuhkan dan namanya ada pada pustaka tersebut. Dengan
catatan tersendiri bahwa anda telah menyelesaikan pelajaran Yorgey yang ada di modul
phantom types, information flow control, language extensions, concurrency,
pipes, dan lenses.

---

# Sumber untuk topik spesifik pada Haskell

Sumber-sumber ini tidak diperiksa atau dicoba kepada pelajar seperti pelajaran cis1940 dan FP, tapi ditautkan pada [the topic listing](specific_topics.md) sehingga anda memiliki gambaran mengenai darimana harus memulai. Hal ini juga termasuk konsep menengah/lanjutan dan subyek seperti alat-alat dan editor teks.


## Dialog

> Di pasang pada repositori [disini](dialogues.md).

Ini sebenarnya lumayan penting dan membantu. Lihat kesini untuk mengenal lebih dalam pada beberapa 
variasi topik.
