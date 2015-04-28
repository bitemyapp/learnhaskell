# La Guía

Este es el sendero que recomiendo para aprender Haskell.


#### Para tener en consideración: *no te preocupes por las cosas que no entiendes de inmediato*. Continúa a pesar de ello.

## Comunidad

Nuestro canal en IRC es `#haskell-beginners` en Freenode.

Cliente web IRC [aquí](http://webchat.freenode.net/).

La [lista de correo](https://wiki.haskell.org/Mailing_lists) de Haskel.

### Directrices de la Comunidad
[Ver el post de Chris Done sobre enseñanza](http://chrisdone.com/posts/teaching)

Se amable y cortés. Ser odioso y rudo ahuyenta a la gente y les desmotiva a participar.

Criticar por el placer de criticar es solo benéfico para las personas que lo practican, no para los que reciben la crítica.

No describas las cosas como "sencillas" o "simples". Vas a hacer sentir a las personas mal por tener que trabajar tan duro por su progreso. Los que aprenden mas lento son generalmente los mas meticulosos aprendices, ¡lo cual merece aprobación!

No simules sorpresa. No actues sorprendido cuando alguien reconoce no saber algo, eso hará sentir terrible a la persona y no obtendras nada excepto hacerte ver sarcástico.

"Mmm...no, de hecho..." Cuando alguien dice algo que es casi pero no completamente correcto y dices, "bueno...no, de hecho..." y luego das una mínima corrección, es especialmente molesto si la corrección que realizas no es lo suficientemente relevante. Esto no significa que al no hacerlo tratamos de ignorar la verdad o que no nos importa ser precisos. El punto es que casi todos los "Mmm... no, de hecho..." son fanfarronerías, no procuradores de la verdad. 

No seas el copiloto pesado que siempre esta dando instrucciones al conductior del vehículo.Si ves a alguien trabajando en un problema, no deberías interrumpir intermitentemente para dar consejo. Déjales trabajar hasta que pidan ayuda. Evitar interrupciones es [uno de los principios fundamentales de #haskell-beginners](http://chrisdone.com/posts/teaching).

Ningún sutil -ismo. Racismo, sexismo, homofobia, transfobia u otro tipo de prejuicios no son bienvenidos y no serán tolerados.

---

Directrices del [Manual de Recurse Center](https://www.recurse.com/manual). Gracias por la publicación, Recurse.

#Que son Haskell, GHC y Cabal?

Haskell es un lenguaje de programación establecido en el reporte del lenguaje Haskell, siendo el mas reciente el de 2010. El reporte esta disponible [en linea](http://www.haskell.org/onlinereport/haskell2010/).

## GHC

[GHC](http://www.haskell.org/ghc/) es la manera más popular de trabajar con el lenguaje de programación Haskell. Este incluye el compilador, REPL (el interprete interactivo), un administrador de paquetes además de otras utilidades.

## Cabal

[Cabal](https://www.haskell.org/cabal/download.html) se utiliza para realizar labores de administración de proyecto y resolución de dependencias. Es la herramienta que se utiliza para definir como se instalan los proyectos, generalmente dentro de su propia caja de arena (sandbox).

Cabal es equivalente al Bundler the Ruby, pip de Python, NPM de Node, Java Maven, etc. GHC administra paquetes por sí mismo, mientras que Cabal elige que versiones instalar.

# Instalando

## Ubuntu
[Este PPA](http://launchpad.net/~hvr/+archive/ghc) es excelente y es lo que uso en todos mis entornos Linux de desarrollo e implementación.

Especificamente:

```bash
$ sudo apt-get update
$ sudo apt-get install python-software-properties # v12.04 and below
$ sudo apt-get install software-properties-common # v12.10 and above
$ sudo add-apt-repository -y ppa:hvr/ghc
$ sudo apt-get update
$ sudo apt-get install cabal-install-1.20 ghc-7.8.4 happy-1.19.4 alex-3.1.3
```

Luego, incluye lo siguiente en tu `$PATH` (.bash\_profile, .zshrc, .bashrc, etc):

```
~/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.4/bin:/opt/happy/1.19.4/bin:/opt/alex/3.1.3/bin
```

*Opcional:* Puedes también incluir `.cabal-sandbox/bin` a tu ruta de directorio, lo cual hará el codigo que te encuentras activamente desarrollando disponible desde la linea de comandos. Esto solo se aplica cuando to actual directorio de trabajo es una caja de arena "cabal" (cabal sand-box).

## Debian

### Usando PPA de Ubuntu
Si no estas usando la version estable de Ubuntu (stable), puedes seguir los mismos pasos que en Ubuntu, pero ejecutando una serie de comandos adicionales. Inemdiatamente después de que `sudo add-apt-repository -y ppa:hvr/ghc` es ejecutado, correr:

```bash
$ sudo sed -i s/jessie/trusty/g /etc/apt/sources.list.d/hvr-ghc-jessie.list
```

Para otras versiones de Debian, solo reemplaza  `jessie` por el nombre de version (de Debian) en el comando superior.

Si por alguna razón, el archivo `/etc/apt/sources.list.d/hvr-ghc-jessie.list` no existe, entonces `/etc/apt/sources.list` deberia incluir una linea como esta:

    deb http://ppa.launchpad.net/hvr/ghc/ubuntu jessie main

Reemplaza `jessie` por  `trusty` en esta línea.

### Compilación manual

Puedes seguir [esta](http://www.davesquared.net/2014/05/platformless-haskell.html) guía excrita para mac OSX:

Notes:

- Setea tu prefijo en consecuencia al configurar ghc.
- En vez de tomar el binario `cabal-install`, ocupa el archivo fuente y ejecuta el script
  `bootstrap.sh`.

## Fedora 21

Para Instalar Haskel 7.8.4 dede el repositorio no oficial (Fedora 22+ va a incluirlo en el oficial):

```bash
$ sudo yum-config-manager --add-repo \
> https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/repo/fedora-21/petersen-ghc-7.8.4-fedora-21.repo
$ sudo yum install ghc cabal-install
```

Como esta establecido en
[petersen/ghc-7.8.4 copr page](https://copr.fedoraproject.org/coprs/petersen/ghc-7.8.4/)
este ghc no puede instalarse en paralelo con Fedora/EPEL ghc.

## Arch Linux

Para installar Haskell desde los repositorios oficiales de Arch Linux, ejecuta

```bash
$ sudo pacman -S cabal-install ghc happy alex haddock
```
## Gentoo

En Gentoo puedes instalar componentes individuales de la plataforma Haskel
mediante Portage. Si usas `ACCEPT_KEYWORDS=arch` (a diferencia de
`ACCEPT_KEYWORDS=~arch`), Portage instalará antiguas versiones
de distintas cosas de Haskell. Tomando esto en consideración, si usas
`ACCEPT_KEYWORDS=arch`, incluye lo siguiente en `/etc/portage/package.keywords`.

    dev-haskell/cabal-install
    dev-lang/ghc

Luego de ello,

```bash
$ emerge -jav dev-lang/ghc dev-haskell/cabal-install
```

Gentoo mantiene una versión "estable" (en otras palabras: antigua) de `cabal-install`
en el árbol de Portage, de modo que querrás usar `cabal-install` para instalar
la versión mas reciente. Nota que los backslashes son internacionales.

```bash
$ \cabal update                # The backslashes
$ \cabal install cabal-install # are intentional
```

Hasta aquí  has instalado cabal a escala global con portage, y localmente en tu
directorio home con `cabal-install`. El próximo paso es asegurarse que cuando
ejecutas `cabal` en el terminal, tu Shell va a correr la version actualizada
en tu directorio home. Tienes que agregar las siguientes lineas al archivo
de configuración de tu Shell:

```bash
PATH=$PATH:$HOME/.cabal/bin
alias cabal="$HOME/.cabal/bin/cabal"
```
Si no sabes cual Shell estas ocupando, es muy probable que tu Shell es Bash.
Si ocupas Bash, el archivo a editar es `~/.bashrc`. Si ocupas Z-shell,
el archivo es `~/.zshrc`. Puedes correr el sigueinte comando para ver
que shell usas.

```bash
echo $SHELL | xargs basename
```

Yo uso zsh, asi que el comando me da como resultado `zsh`.

Luego de todo ello, instala `alex` y `happy`, las herramientas adicionales.

```bash
$ cabal install alex happy
```

Felicitaciones!. Ya tienes una instalación de Haskell corriendo en tu equipo! 

## Mac OS X

### 10.9

Instala la applicación [GHC para Mac OS X](http://ghcformacosx.github.io/),
que incluye GHC y Cabal, la cual proporciona instrucciones sobre como incorporar
GCH y Cabal a tu ruta de archivos luego de que has colocado la `.app` en alguna parte.

### 10.6-10.8

Puedes preparar la distribución binaria del instalador como describe [este tarball](https://www.haskell.org/platform/download/2014.2.0.0/ghc-7.8.3-x86_64-apple-darwin-r3.tar.bz2).

## Windows

- La [Instalación mínima de GHC para Windows](http://neilmitchell.blogspot.com/2014/12/beta-testing-windows-minimal-ghc.html)
  puede compilar `nework` y otros. Tecnicamente esta en beta pero puede resultar útil
  dentro de las necesidades de aquellos que leen esta guía.

No olvides correr el instalador como administrador ya que necesitará realizar la instalación
en tus Archivos de Programa.

## Otras distribuciones Linux

Descarga las últimas distribuciones binarias de cabal y ghc:

- [GHC](http://www.haskell.org/ghc/).

- [Cabal](https://www.haskell.org/cabal/download.html).
