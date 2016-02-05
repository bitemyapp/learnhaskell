# Architecture

- [Architecture of open source applications](http://www.aosabook.org/en/ghc.html)

# Trac

Good for digging up recent'ish development history of various topics.

- [Trac](https://ghc.haskell.org/trac/ghc/)

- [Use this example query to search Trac since the search functionality is useless](https://www.google.com/?gws_rd=ssl#q=site:https:%2F%2Fghc.haskell.org%2Ftrac%2Fghc%2F+garbage+collection)

# Memory management / Garbage collection

- https://wiki.haskell.org/GHC/Memory_Management

- Current GC: [Parallel Generational-Copying Garbage Collection with a Block-Structured Heap; Simon Marlow, Tim Harris, Roshan P. James, Simon Peyton Jones](http://community.haskell.org/~simonmar/papers/parallel-gc.pdf)

- Experimental concurrent GC abandoned for worsening performance too much: [Multicore Garbage Collection with Local Heaps; Simon Marlow, Simon Peyton Jones](http://community.haskell.org/~simonmar/papers/local-gc.pdf)

- [RTS notes on the garbage collector](https://ghc.haskell.org/trac/ghc/wiki/Commentary/Rts/Storage/GC)

# Thread scheduling

- [Dynamic Circular Work-stealing Deque; David Chase, Yossi Lev](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.170.1097&rep=rep1&type=pdf)

- [Wool - fine grained independent task parallelism in C](https://www.sics.se/~kff/wool/)

# GHC commentary

- [Commentary top level](https://ghc.haskell.org/trac/ghc/wiki/Commentary)

- [RTS](https://ghc.haskell.org/trac/ghc/wiki/Commentary/Rts)

- [Heap and Stack](https://ghc.haskell.org/trac/ghc/wiki/Commentary/Rts/Storage)

# Build system

- https://ghc.haskell.org/trac/ghc/wiki/Building/Architecture

# Porting GHC to a new architecture

- https://ghc.haskell.org/trac/ghc/wiki/Building/Porting

- https://ghc.haskell.org/trac/ghc/wiki/CrossCompilation

