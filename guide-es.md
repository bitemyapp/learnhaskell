# La Guía

Este es el sendero que recomiendo para aprender Haskell.


#### Para tener en consideración: *no te preocupes por las cosas que no entiendes de inmediato*. Continúa a pesar de ello.

## Comunidad

Nuestro canal en IRC es `#haskell-beginners` en Freenode.

Cliente web IRC [aquí](http://webchat.freenode.net/).

La [lista de correo](https://wiki.haskell.org/Mailing_lists) de Haskel.

### Directrices de la Comunidad
[Ver el post de Chris Done sobre enseñanza](http://chrisdone.com/posts/teaching)

Se amable y cortés. Ser odioso y rudo ahuyenta a las personas y les desmotiva a participar.

Criticar por el placer de criticar es solo beneficial para las personas que lo practican, no para los que reciben la crítica.

No describas las cosas como "sencillas" o "simples". Vas a hacer sentir a las personas mal por tener que trabajar tan duro por su progreso. Los que aprenden mas lento son generalmente los mas meticulosos aprendices, lo cual merece aprobación!

No simules sorpresa. No actues sorprendido cuando alguien reconoce no saber algo, eso hará sentir terrible a la persona y no obtendras nada excepto hacerte ver sarcástico.

"Mmm...no, de hecho..." Cuando alguien dice algo que es casi pero no completamente correcto y dices, "bueno...no, de hecho..." y luego das una mínima corrección, es especialmente molesto si la corrección que realizas no es lo suficientemente relevante. Esto no significa que no hacerlo se trata de ignorar la verdad o que no nos importa ser precisos. El punto es que casi todos los "Mmm... no, de hecho..." son fanfarronerías, no procuradores de la verdad. 

No seas el copiloto pesado que siempre esta dando instrucciones al conductior del vehiculo.Si ves a alguien trabajando en un problema, no deberías interrumpir intermitentemente para dar consejo. Dejales trabajar hasta que pidan ayuda. Evitar interrupciones es [uno de los principios fundamentales de #haskell-beginners](http://chrisdone.com/posts/teaching).

Ningun sutil -ismo. Racismo, sexismo, homofobia, transfobia u otro tipo de prejuicios no son bienvenidos y no serán tolerados.

---

Directrices por [Manual de Recurse Center](https://www.recurse.com/manual). Gracias por la publicación, Recurse.

#Que son Haskell, GHC y Cabal?

Haskell es un lenguaje de programación establecido en el reporte de Haskell, siendo el mas reciente el de 2010. El reporte esta disponible [en linea](http://www.haskell.org/onlinereport/haskell2010/).

## GHC

[GHC](http://www.haskell.org/ghc/) es la manera mas popular de trabajar con el lenguaje de programación Haskell. Este incluye el compilador, REPL (el interprete interactivo), un administrador de paquetes además de otras utilidades.

## Cabal

[Cabal](https://www.haskell.org/cabal/download.html) se utiliza para realizar labores de administración de proyecto y resolución de dependencias. Es la herramienta que se utiliza para definir como se instalar los projectos, generalmente dentro de su propia caja de arena.

Cabal es equivalente al Bundler the Ruby, pip de Python, NPM de Node, Java Maven, etc. GHC administra paquetes por si mismo, mientras que Cabal elige que versiones instalar.

# Instalacion

## Ubuntu
[Este PPA](http://launchpad.net/~hvr/+archive/ghc) es excelente y es lo que uso en todas mis entornos Linux de desarrollo y construcción.

Especificamente:

```bash
$ sudo apt-get update
$ sudo apt-get install python-software-properties # v12.04 and below
$ sudo apt-get install software-properties-common # v12.10 and above
$ sudo add-apt-repository -y ppa:hvr/ghc
$ sudo apt-get update
$ sudo apt-get install cabal-install-1.20 ghc-7.8.4 happy-1.19.4 alex-3.1.3
```

Luego, incluye lo siguiente en tu `$PATH` (.bash\.profile, .zshrc, .bashrc, etc):

```
~/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.4/bin:/opt/happy/1.19.4/bin:/opt/alex/3.1.3/bin
```

*Opcional:* Puedes también incluir `.cabal-sandbox/bin` a tu ruta de directorio, lo cual hará el codigo que te encuentras activamente desarrollando disponible desde la linea de comandos. Esto solo se aplica cuando to actual directorio de trabajo es una caja de arena "cabal"(cabal sand-box).

## Debian

### Usando PPA de Ubuntu
Si no estas usando la version estable de Ubuntu (stable), puedes seguir los mismos pasos que en Ubuntu, pero ejecutando una serie de comandos adicionales. Inemdiatamente después de que `sudo add-apt-repository -y ppa:hvr/ghc` es ejecutado, correr:

```bash
$ sudo sed -i s/jessie/trusty/g /etc/apt/sources.list.d/hvr-ghc-jessie.list
```

Para otras versiones de Debian, solo reemplaza  `jessie` por el nombre de version (de Debian) en el comando superior.

Si por alguna razón, el archivo `/etc/apt/sources.list.d/hvr-ghc-jessie.list` no existe, entonces `/etc/apt/sources.list` deberia incluir una linea como esta:

    deb http://ppa.launchpad.net/hvr/ghc/ubuntu jessie main

Reemplaza `jessie` por  `trusty` en esta linea.

