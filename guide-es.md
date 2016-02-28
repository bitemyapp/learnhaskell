# La Guía

Este es el sendero que recomiendo para aprender Haskell.


#### Para tener en consideración: *no te preocupes por las cosas que no entiendes de inmediato*. Continúa a pesar de ello.

## Comunidad

Nuestro canal en IRC es `#haskell-beginners` en Freenode.

Cliente web IRC [aquí](http://webchat.freenode.net/).

La [lista de correo](https://wiki.haskell.org/Mailing_lists) de Haskell.

### Directrices de la Comunidad
[Ver el post de Chris Done sobre enseñanza](http://chrisdone.com/posts/teaching)

Se amable y cortés. Ser odioso y rudo ahuyenta a la gente y les desmotiva a participar.

Criticar por el placer de criticar es solo benéfico para las personas que lo practican, no para los que reciben la crítica.

No describas las cosas como "sencillas" o "simples". Vas a hacer sentir a las personas mal por tener que trabajar tan duro por su progreso. Los que aprenden mas lento son generalmente los mas meticulosos aprendices, ¡lo cual merece aprobación!

No simules sorpresa. No actúes sorprendido cuando alguien reconoce no saber algo, eso hará sentir terrible a la persona y no obtendrás nada excepto hacerte ver sarcástico.

"Mmm...no, de hecho..." Cuando alguien dice algo que es casi pero no completamente correcto y dices, "bueno...no, de hecho..." y luego das una mínima corrección, es especialmente molesto si la corrección que realizas no es lo suficientemente relevante. Esto no significa que al no hacerlo tratamos de ignorar la verdad o que no nos importa ser precisos. El punto es que casi todos los "Mmm... no, de hecho..." son fanfarronerías, no procuradores de la verdad. 

No seas el copiloto pesado que siempre esta dando instrucciones al conductor del vehículo.Si ves a alguien trabajando en un problema, no deberías interrumpir intermitentemente para dar consejo. Déjales trabajar hasta que pidan ayuda. Evitar interrupciones es [uno de los principios fundamentales de #haskell-beginners](http://chrisdone.com/posts/teaching).

Ningún sutil -ismo. Racismo, sexismo, homofobia, transfobia u otro tipo de prejuicios no son bienvenidos y no serán tolerados.

---

Directrices del [Manual de Recurse Center](https://www.recurse.com/manual). Gracias por la publicación, Recurse.

# Instalación de Haskell

## Use la herramienta Stack para empezar con Haskell

Instale [Stack](http://haskellstack.org) para tener el GHC (Glasgow Haskell Compiler) listo y para compilar sus proyectos.

En el caso de que usted no conozca nada sobre Stack y le gustaria tener una visión general, hay un [tutorial en vídeo sobre Stack](https://www.youtube.com/watch?v=sRonIB8ZStw).


## NO INSTALE "HASKELL PLATFORM"

En lugar de utilizar las instrucciones disponibles en Haskell.org, utilize Stack.

### ¿Por qué no utilizar "Haskell Platform"?

https://mail.haskell.org/pipermail/haskell-community/2015-September/000014.html

# ¿Cómo debería aprender Haskell?

La recomendación principal es leer las clases y completar todos los ejercicios de la versión 13 de cis194 seguidos por el curso NICTA. Los links de ambos se encuentran abajo. Todo lo demas puede ser considerado opcional y es mencionado para que así sepas donde mirar.

## Curso cis194 de Yorgey

> *Haz esto primero*, esta es la vía principal que recomendamos al ser introducido a Haskell.

Disponible [online](http://www.seas.upenn.edu/~cis194/spring13/lectures.html).

[Brent Yorgey](https://byorgey.wordpress.com) Este curso es el mejor que he encontrado hasta ahora. Este curso es valioso ya que no te equipara para escribir Haskell basico, sino que ademas te ayudara a entender combinatoria.

La unica razón por la que no deberías empezar con cis194 es si no eres un programador o eres uno con poca experiencia. Si ese es el caso, empieza con [El libro de Thompson (ingles)](http://www.haskellcraft.com/craft3e/Home.html) y haz la transición a cis194.

---

## Curso NICTA

> Este es el curso que recomendamos hacer despues del curso cis194 de Yorgey.

Disponible en github [aquí](https://github.com/NICTA/course).

Esto reforzara y te dara experiencia implementando directamente las abstracciones introducidas en cis194, esto es practica que es *critica* para estar cada vez mas comodo con el uso diario de Functor/Aplicativo/Monada/etc en Haskell. Realizando cis194 y luego el curso NICTA es la recomendación principal de mi guia y es como enseñamos Haskell a cualquier persona.

---

## Curso suplementario despues de los cursos cis194 y NICTA

> Proporciona mas material en temas intermediarios

cs240h esta disponible [en linea](http://www.scs.stanford.edu/14sp-cs240h/).

Este es el curso online de [Bryan O'Sullivan](https://github.com/bos) de la clase que el enseña en Stanford. Si no sabes quien es el, dale un vistazo a la mitad de las librerías que cualquier aplicación de Haskell necesita y veras su nombre en estas.Si  ya haz hecho el curso de Yorgey te interesara particularmente los modulos de tipos fantasma, control de flujo de información, extensión del lenguaje, concurrencia, pipes, y lenses.

---

# Recursos para temas especificos en Haskell

Estos recursos no han sido investigados o probados con aprendices como los cursos cis194 y NICTAT, pero estan listados en [la lista de temas](specific_topics.md) para que así tengas ideas de donde empezar.Esto incluye cosas como conceptos y temas intermedios/avanzados, por ejemplo herramientas y editores de texto.


## Dialogos

> Alojado en este repositorio [Aquí](dialogues.md).

Estos son de hecho muy importantes y de gran ayuda. Da un vistazo a estos para inmersiones profundas en una variedad de temas.






