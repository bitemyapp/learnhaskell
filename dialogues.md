# Dialogues from the IRC channel or other places

## On $ and . operator

```haskell
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther list = reverse .doubleEveryOtherForward . reverse $ list
```

```
03:28 < bitemyapp> fbernier: reverse the list, double every other number, re-reverse the list.
03:28 < bitemyapp> fbernier: the "dot" operator is just function composition.
03:28 < bitemyapp> it's nothing special, just another function.
03:28 < bitemyapp> :t (.)
03:28 < lambdabot> (b -> c) -> (a -> b) -> a -> c
03:30 < bitemyapp> fbernier: the use of $ in that function is a little idiosyncratic and unnecessary, but not problematic.
03:37 < ReinH> fbernier: there's a missing space after the . is all
03:38 < ReinH> fbernier: f x = foo $ x ==> f = foo
03:39 < ReinH> so f x = foo . bar $ x ==> f = foo . bar
03:39 < bitemyapp> fbernier: I think it's just making it point-free in this case.
03:39 < bitemyapp> @pl f x = c . b . a $ x
03:39 < lambdabot> f = c . b . a
03:39 < bitemyapp> yeah, that ^^
03:39 < bitemyapp> fbernier: identical ^^
03:40 < ReinH> fbernier: generally, when you see a $ you can wrap the things on either side with parens and get the same expression:
03:40 < ReinH> f x = foo . bar . bazz $ x ==> f x = (foo . bar . bazz) x
03:40 < ReinH> since (x) = x, ofc
03:41 < bitemyapp> @src ($)
03:41 < lambdabot> f $ x = f x
03:41 < bitemyapp> fbernier: That's the definition of $, only other thing missing is the high precedence set for it.
03:41 < ReinH> the exception is chains of $, like foo $ bar $ baz, where you have to parenthesize in the right direction
03:41 < ReinH> or the left direction, depending on how you look at it
03:42 < bitemyapp> fbernier: http://hackage.haskell.org/package/base-4.7.0.1/docs/Prelude.html ctrl-f for $ to see more
03:42 < bitemyapp> fbernier: infixr 0 is the precedence, highest there is AFAIK
03:42 < bitemyapp> fbernier: the "infixr" means it's right associative
03:42 < bitemyapp> fbernier: as opposed to infixl which would mean left associative
03:43 < ReinH> bitemyapp: or lowest, depending on how you look at it. ;)
03:43 < bitemyapp> foo $ bar $ baz ~ foo (bar (baz))
03:43 < bitemyapp> but if it was infixl
03:43 < bitemyapp> (((foo) bar) baz)
```

## Infix operators as prefix

```
04:12 < ReinH> all infix operators can be written prefix
04:12 < ReinH> with this one weird trick. Other haskellers hate him.
04:13 < bitemyapp> > ($) id 1
04:13 < lambdabot>  1
04:13 < bitemyapp> > id $ 1
04:13 < lambdabot>  1
04:13 < bitemyapp> > id 1
04:13 < lambdabot>  1
```

## Reduction, strict evaluation, ASTs, fold, reduce

```
05:00 < ReinH> pyro-: well, "reduce" already has a typeclass, depending on what you mean
05:00 < ReinH> so does "evaluation", depending on what you mean
05:02 < pyro-> ReinH: reduce is lambda calculus under strict evaluation
05:02 < ReinH> Yep, and it's also the other thing too.
05:02 < ReinH> ;)
05:03 < pyro-> :|
05:03 < pyro-> oh, like on lists?
05:04 < mm_freak_> dealing with ASTs is a real joy in haskell, because most of the code writes itself =)
```

## Continuation passing style, CPS transform

```
05:10 < pyro-> now i am writing a cpsTransform function :D
05:10 < pyro-> it already works, but the current version introduces superflous continuations
05:10 < pyro-> so i am trying to fix :D
05:10 < ReinH> pyro-: Here's a CPS transform function: flip ($)
05:11 < pyro-> i will find out about flip
05:11 < ReinH> @src flip
05:11 < lambdabot> flip f x y = f y x
05:11 < ReinH> pyro-: the essence of CPS can be described as follows:
05:11 < ReinH> :t flip ($)
05:11 < lambdabot> b -> (b -> c) -> c
05:12 < ReinH> is the type of a function which takes a value and produces a suspended computation that takes a continuation and runs it against the value
05:12 < ReinH> for example:
05:12 < ReinH> > let c = flip ($) 3 in c show
05:12 < lambdabot>  "3"
05:12 < ReinH> > let c = flip ($) 3 in c succ
05:12 < lambdabot>  4
05:13 < mm_freak_> direct style:  f x = 3*x + 1
05:13 < mm_freak_> CPS:  f x k = k (3*x + 1)
05:13 < mm_freak_> the rules are:  take a continuation argument and be fully polymorphic on the result type
05:13 < mm_freak_> f :: Integer -> (Integer -> r) -> r
05:14 < mm_freak_> as long as your result type is fully polymorphic and doesn't unify with anything else in the type signature you can't do anything wrong other than to descend
                   into an infinite recursion =)
05:14 < mm_freak_> good:  (Integer -> r) -> r
05:15 < mm_freak_> bad:  (Integer -> String) -> String
05:15 < mm_freak_> bad: (Num r) => (Integer -> r) -> r
05:15 < mm_freak_> bad:  r -> (Integer -> r) -> r
05:15 < pyro-> but flip ($) is not what i had in mind :D
05:16 < mm_freak_> that's just one CPS transform…  there are many others =)
05:16 < ReinH> No, it's probably not.
05:16 < ReinH> But other things are pretty much generalizations of that
```

```haskell
type Variable = String

data Expression = Reference Variable
                | Lambda Variable Expression
                | Combination Expression Expression

type Kvariable = String

data Uatom = Procedure Variable Kvariable Call
           | Ureference Variable

data Katom = Continuation Variable Call
           | Kreference Variable
           | Absorb

data Call = Application Uatom Uatom Katom
          | Invocation Katom Uatom

cpsTransform :: Expression -> Katom -> Call
cpsTransform (Reference r) k = Invocation k $ Ureference r
cpsTransform (Lambda p b) k = Invocation k $ Procedure p
                                             "k" $
                                cpsTransform b $ Kreference "k"
cpsTransform (Combination a b) k = cpsTransform  a $ Continuation "v" $ cpsTransform b k
```

### Later...

```
05:38 < ReinH> So for example, if you have an incredibly simple expression language like data Expr a = Val a | Neg a | Add a a
05:38 < ReinH> a (more) initial encoding of an expression would be Add (Val 1) (Neg (Val 1))
05:38 < ReinH> A (more) final encoding might be (1 - 1) or even 0
05:39 < ReinH> The initial encoding generally is more flexible (you can still write a double-negation elimination rule, for instance
05:39 < ReinH> the final encoding is less flexible, but also does more work up-front
05:40 < ReinH> More initial encodings tend to force you to use quantification and type-level tricks, CPS and pre-applied functions tend to appear more in final encodings
05:40 < ReinH> An even smaller example:
05:40 < ReinH> \f z -> foldr f z [1,2,3] is a final encoding of the list [1,2,3]
05:41 < ReinH> pyro-: I'm not really a lisper, but I'm always looking for good reading material
05:41 < ReinH> for bonus points, the foldr encoding is *invertible* as well :)
05:44 < ReinH> pyro-: the relevance is that you seem to be using the cps transform in a more initial encoding than I usually see it
05:44 < ReinH> not that this is at all bad
05:46 < bitemyapp> ReinH: where does the invertibility in the final encoding come from?
05:46 < ReinH> foldr (:) [] :)
05:46 < ReinH> it's not generally so
05:46 < bitemyapp> > foldr (:) [] [1, 2, 3]
05:46 < lambdabot>  [1,2,3]
05:47 < bitemyapp> I may not understand the proper meaning of invertibility in this case.
05:47 < bitemyapp> Do you mean invertibility from final to initial encoding?
05:47 < ReinH> Just that, yes
05:47 < bitemyapp> how would it get you back to final from initial?
05:47 < ReinH> I'm not sure if that's the correct term
05:47 < bitemyapp> I don't think it is, but the intent is understood and appreciated.
05:48 < bitemyapp> invertibility implies isomorphism, implies ability to go final -> initial -> final
05:48 < ReinH> well, there is an isomorphism
05:48 < bitemyapp> well, we've established final -> initial, where's initial -> final for this example?
05:49 < bitemyapp> I figured it was a morphism of some sort, but with only a final -> initial and not a way to get back, I wasn't sure which.
05:49 < ReinH> toInitial k = k (:) []; toFinal xs = \f z -> foldr f z xs
05:49 < bitemyapp> thank you :)
```

### Something about adjunctions. I don't know.

```
05:51 < ReinH> bitemyapp: usually one loses information going from initial to final though
05:51 < ReinH> there's probably an adjunction here
05:51 < ReinH> there's always an adjunction
05:52 < ReinH> lol of course there's an adjunction
```

## Data structures with efficient head and tail manipulation

Asker:

I am teaching myself haskell. The first impression is very good.
But phrase "haskell is polynomially reducible" is making me sad :(.
Anyway I am trying to backport my algorithm written in C. The key to
performance is to have ability to remove element from the end of a
list in O(1).
But the original haskell functions last and init are O(n).
My questions are:
1) Is last function is something like "black box" written in C++ which
perform O(1)?
So I shouldn't even try to imagine some haskell O(1) equivalent.
2) Or will optimizer (llvm?) reduce init&last complexity to 1?
3) Some people suggest to use sequences package, but still how do they
implement O(1) init&last sequences equivalent in haskell?

* * * * *

Tom Ellis:

I'm rather confused about your question.  If you want a Haskell data
structure that supports O(1) head, tail, init and last why not indeed use
Data.Sequence as has been suggested?  As for how it's implemented, it uses
the (very cool) fingertree datastructure.  See here for more details:

* * * * *

Asker:

Tom said that finger tree gives us O(1) on removing last element, but
in haskell all data is persistent.
So function should return list as is minus last element. How it could
be O(1)? This is just blows my mind...

My hypothesis is that somehow compiler reduces creating of a new list
to just adding or removing one element. If it is not so.
Then even ':' which is just adding to list head would be an O(n)
operation just because it should return brand new list with one elem
added. Or maybe functional approach uses pretty much different
complexity metric, there copying of some structure "list" for example
is just O(1)? If so then Q about compiler is still exists.

* * * * *

Tom Ellis:

Sounds like magic doesn't it :)

But no, there's no compiler magic, just an amazing datastructure.  The
caveat is that the complexity is amortised, not guaranteed for every
operation.  Have a look at the paper if you learn about how it works.  It's
linked from the Hackage docs.

   http://hackage.haskell.org/package/containers-0.2.0.1/docs/Data-Sequence.html


* * * * *

Asker:

Jake It would be great if you give some examples when find your
notebook :) And link to the book about pure functional data structures
which you are talking about.
Also If some "haskell.org" maintainers are here I'd like to recommend
them to pay more attention to optimality/performance questions.
Because almost first question which is apeared  in head of standart
C/C++ programmer is "Do I get same perfomance?" (even if he do not
need it).
Maybe some simple and cool PDF tutorial which describes why haskell
could be as fast as others will be great to have.

* * * * *

Richard A. O'Keefe:


> I am teaching myself haskell. The first impression is very good...
> Anyway I am trying to backport my algorithm written in C. The key to
> performance is to have ability to remove element from the end of a
> list in O(1).

You can't.  Not in *any* programming language.  That's because
lists are one of many possible implementations of the "sequence"
concept, and they are optimised to support some operations at
the expense of others.  At the beginning level, you should think
of all Haskell data structures as immutable; fixed; frozen;
forever unchanged.  You can't even remove an element from the
front of a Haskell list, at all.  All you can do is to forget
about the original list and concentrate on its tail.

> But the original haskell functions last and init are O(n).

Haskell lists are singly linked lists.  Even by going to
assembly code, you could not make these operations O(1)
without *using a different data structure*.

> My questions are:
> 1) Is last function is something like "black box" written in C++ which
> perform O(1)?

No.

> 2) Or will optimizer (llvm?) reduce init&last complexity to 1?

No.

> 3) Some people suggest to use sequences package, but still how do they
> implement O(1) init&last sequences equivalent in haskell?

Well, you could try reading Chris Okasaki's functional data
structures book.

There is a classic queue representation devised for Lisp
last century which represents
 <a,b,c,d,e>
by ([a,b],[e,d,c])
so that you can push and pop at either end.
When the end you are working on runs out, you
reverse the other end, e.g.,
  ([],[e,d,c]) -> ([c,d,e],[]).

That can give you a queue with *amortised* constant time.
(There is a technical issue which I'll avoid for now.)

But let's start at the beginning.
You have an interesting problem, P.
You have an algorithm for it, A, written in C.
You want an algorithm for it, H, written in Haskell.
Your idea is to make small local syntactic changes
to A to turn in into H.
That's probably going to fail, because C just
loves to smash things, and Haskell hates to.
Maybe you should be using quite a different approach,
one that would be literally unthinkable in C.
After all, being able to do things that are unthinkable
in C is one of the reasons for learning Haskell.

Why not tell us what problem P is?

* * * * *

Tony Morris:

data SnocList a = SnocList ([a] -> [a])

Inserts to the front and end in O(1).

### I consider the following conclusive

Edward Kmett:

Note: all of the options for playing with lists and queues and fingertrees come with trade-offs.

Finger trees give you O(log n) appends and random access, O(1) cons/uncons/snoc/unsnoc etc. but _cost you_ infinite lists.

Realtime queues give you the O(1) uncons/snoc. There are catenable output restricted deques that can preserve those and can upgrade you to O(1) append, but we've lost unsnoc and random access along the way.

Skew binary random access lists give you O(log n) drop and random access and O(1) cons/uncons, but lose the infinite lists, etc.

Tarjan and Mihaescu's deque may get you back worst-case bounds on more of the, but we still lose O(log n) random access and infinite lists.

Difference lists give you an O(1) append, but alternating between inspection and construction can hit your asymptotics.

Lists are used by default because they cleanly extend to the infinite cases, anything more clever necessarily loses some of that power.

## listen in Writer monad

```
20:26 < ifesdjee_> hey guys, could anyone point me to the place where I could read up on how `listen` of writer monad works?
20:26 < ifesdjee_> can't understand it from type signature, don't really know wether it does what i want..
20:30 < ReinH> :t listen
20:30 < lambdabot> MonadWriter w m => m a -> m (a, w)
20:31 < mm_freak_> ifesdjee_: try this: runWriterT (listen (tell "abc" >> tell "def") >>= liftIO . putStrLn . snd)
20:33 < mm_freak_> in any case 'listen' really just embeds a writer action and gives you access to what it produced
20:33 < ifesdjee_> most likely i misunderstood what happens in `listen`...
20:34 < ifesdjee_> i thought i could access current "state" of writer
20:34 < mm_freak_> remember that the embedded writer's log still becomes part of the overall log
20:34 < mm_freak_> execWriter (listen (tell "abc") >> tell "def") = "abcdef"
20:35 < mm_freak_> all you get is access to that "abc" from within the writer action
20:35 < ifesdjee_> yup, I see
20:35 < ifesdjee_> thank you a lot!
20:35 < mm_freak_> my pleasure
20:37 < mm_freak_> i wonder why there is no evalWriter*
20:37 < ifesdjee_> not sure, really
```

## Introduction and origination of free monads

```
21:32 < sclv> does anyone have a citation for the introduction of free monads?
21:33 < sclv> they’re so universally used in the literature nobody cites where they came from anymore
21:33 < sclv> in a computational context goes back to ’91 at least
21:40 < sclv> found it
21:40 < sclv> coequalizers and free triples, barr, 1970
```

http://link.springer.com/article/10.1007%2FBF01111838#page-1

Note: Seeing a paper on free monoids dating to 1972 by Eduardo J. Dubuc.

## Rank 2 types and type inference

```
03:13 < shachaf> dolio: Do you know what people mean when they say rank-2 types are inferrable?
03:14 < dolio> Not really. I've never taken the time to understand it.
03:16 < dolio> One reading makes no sense, I think. Because rank-2 is sufficient to lack principal types, isn't it?
03:17 < dolio> Or perhaps it isn't....
03:17 < shachaf> Well, you can encode existentials.
03:17 < dolio> Can you?
03:17 < dolio> forall r. (forall a. a -> r) -> r
03:17 < dolio> I guess that's rank-2.
03:18 < shachaf> You can give rank-2 types to expressions like (\x -> x x)
03:18 < shachaf> What type do you pick for x?
03:19 < dolio> forall a. a -> β
03:19 < dolio> Presumably.
03:20 < shachaf> Does β mean something special here?
03:20 < dolio> It's still open.
03:20 < dolio> Greek for unification variables.
03:21 < shachaf> OK, but what type do you infer for the whole thing?03:21 < dolio> forall r. (forall a. a -> r) -> r
03:23 < dolio> (\f -> f 6) : forall r. (Int -> r) -> r
03:23 < dolio> Is that a principal type?
03:23 < shachaf> Do you allow type classes?
03:24 < dolio> People who say rank-2 is decidable certainly shouldn't be thinking about type classes.
03:24 < shachaf> I guess with impredicativity the type you gave works... Well, does it?
03:25 < dolio> Maybe rank-2 is sufficient to eliminate all ambiguities.
03:25 < dolio> Like, one common example is: [id]
03:25 < dolio> Is that forall a. [a -> a] or [forall a. a -> a]
03:25 < dolio> But, we're not talking about Haskell, we're talking about something like system f.
03:26 < dolio> So you'd have to encode.
03:26 < dolio> And: (forall r. ((forall a. a -> a) -> r -> r) -> r -> r) is rank-3.
03:27 < shachaf> I guess...
03:27 < dolio> If I had to guess, that's what the answer is.
```

- Practical type inference for arbitrary-rank types - Peyton Jones, Vytinotis, Weirich, Shields

- http://stackoverflow.com/questions/9259921/haskell-existential-quantification-in-detail

- http://en.wikibooks.org/wiki/Haskell/Polymorphism

## Function types and why a -> b has b^a inhabitants

```
02:17 < bartleby> so I understand sum and product types, but why does a -> b have b^a cardinality?
02:23 < Iceland_jack> How many functions are there of type
02:23 < Iceland_jack>     () -> b
02:23 < Iceland_jack> if b has 5 inhabitants?
02:23 < bartleby> 5
02:24 < Iceland_jack> which is 5^1 right?
02:24 < Iceland_jack> You'll want to look at Chris's blog: http://chris-taylor.github.io/blog/2013/02/10/the-algebra-of-algebraic-data-types/
02:24 < bartleby> yes
02:24 < bartleby> purple link, hm... I've been there, might've missed that.
02:25 < Iceland_jack> Now what about
02:25 < Iceland_jack>     Bool -> b
02:25 < Iceland_jack> if b has 3 inhabitants
02:25 < Iceland_jack> You can gain your intuition by working these things out for increasingly more involved types
02:26 < bartleby> I was trying this, but it looked like a product type... I'm doing something wrong
02:26 < bartleby> let me see this case
02:26 < Iceland_jack> sure
02:27 < bartleby> wait, if I have one pattern for True and another for False, does it count as a single function? or two?
02:28 < Iceland_jack> If they're two patterns in the same function then it's the same function
02:28 < Iceland_jack> I.e. in the function definition
02:28 < Iceland_jack>     f True  = ...
02:28 < Iceland_jack>     f False = ...
02:28 < Iceland_jack> 'f' is a single function
02:29 < Iceland_jack> and for the first ellipsis '...' you have one of three choices (b = {b1, b2, b3}) and same for the second one
02:29 < pyro-> does b^a include non total functions?
02:29 < Iceland_jack> no
02:29 < pyro-> why is that?
02:30 < Iceland_jack> Because it breaks all sorts of reasoning and makes it more complicated
02:30 < pyro-> :D
02:30 < bartleby> no? I thought that was what I was missing...
02:30 < Iceland_jack> bartleby: How many functions of type
02:30 < Iceland_jack>     Bool -> ()
02:31 < bartleby> yes, that's where I'm confused. I'd guess one?
02:31 < Iceland_jack> Right, because the only choice is
02:31 < Iceland_jack>     fn True  = ()
02:31 < Iceland_jack>     fn False = ()
02:31 < bartleby> matching True and False, but only returning ()
02:32 < Iceland_jack> so the number of function |Bool -> ()| is |()| ^ |Bool|
02:32 < Iceland_jack>       |()| ^ |Bool|
02:32 < Iceland_jack>     = 1 ^ 2
02:32 < Iceland_jack>     = 1
02:32 < bartleby> ah, I think I get it
02:33 < Iceland_jack> And there are 2 functions from
02:33 < Iceland_jack>     Bool -> ()
02:33 < Iceland_jack> conversely
02:33 < Iceland_jack> oops, () -> Bool I meant
02:33 < pyro-> Just by sitting in this channel I a learning things :D bartleby, how is it that cardinality of a type has interested you? I haven't even heard the term before
02:33 < Iceland_jack> 'const False' and 'const True' respectively
02:33 < bartleby> Iceland_jack: because 2^1
02:33 < Iceland_jack> Precisely
02:34 < Iceland_jack> pyro-: You should definitely read up on the 'Algebra of Algebraic Data Types'
                      http://chris-taylor.github.io/blog/2013/02/10/the-algebra-of-algebraic-data-types/
02:34 < pyro-> thanks
02:34 < Iceland_jack> Lated parts discuss some more advanced uses
02:34 < Iceland_jack> *Later
02:34 < bartleby> pyro-: Algebraic Data Types, means you have an algebra for dealing with them.
02:35 < Iceland_jack> Just like you knew that
02:35 < Iceland_jack>     1 + 2 = 2 + 1
02:35 < Iceland_jack> in grade school so you can know that
02:35 < Iceland_jack>     Either () Bool ≅ Either Bool ()
02:35 < bartleby> blowed my mind when I read about zippers, but I hadn't seen it with functions yet
02:36 < Iceland_jack> viewing (+) = Either, 1 = () and 2 = Bool
02:36 < Iceland_jack> It also means that you can define Bool as
02:36 < Iceland_jack>     type Bool = Either () ()
02:36 < Iceland_jack> rather than
02:36 < Iceland_jack>     data Bool = False | True
02:36 < Iceland_jack> since
02:36 < Iceland_jack>     1 + 1 ≅ 2
02:37 < Iceland_jack> Given the recent pattern synonyms extensions (PatternSynonyms) you can even use the same constructors and pattern match
02:37 < pyro-> Thats interesting
02:37 < Iceland_jack>     type (+)  = Either
02:37 < Iceland_jack>     type BOOL = () + ()
02:37 < Iceland_jack>     pattern TRUE  = Right () :: BOOL
02:37 < Iceland_jack>     pattern FALSE = Left  () :: BOOL
02:38 < Iceland_jack> and then
02:38 < Iceland_jack>     not :: BOOL -> BOOL
02:38 < Iceland_jack>     not TRUE  = FALSE
02:38 < Iceland_jack>     not FALSE = TRUE
02:38 < pyro-> what abut values instead of types? 1 + 2 = 2 + 1 works for Int. what about algebra for values of other type?
02:38 < Iceland_jack> pyro-: You're not actually using numbers
02:38 < Iceland_jack> 1 is just a nice and confusing way to refer to the type ()
02:38 < pyro-> i understand
02:38 < bartleby> whoa, easy there boy! I'm overheating with 2^2 here
02:38 < Iceland_jack> not the value 1
02:38 < bartleby> :-D
02:38 < pyro-> thanks
02:39 < Iceland_jack> bartleby: Slowing down :)
02:39 < pyro-> actually that i'm not using numbers is kind of the point right?
02:39 < Iceland_jack> well it makes the analogy with elementary arithmetic clearer
02:39 < bartleby> pyro-:  you are counting possible values of that type
02:40 < Iceland_jack> So you can write '2' for Bool because Bool has two things
02:40 < bartleby> so Either () Bool has three because: Left (), or Right True, or Right False
02:40 < Iceland_jack> Maybe Bool would be 3
02:40 < Iceland_jack> Yes exactly
02:40 < Iceland_jack> and thus
02:40 < Iceland_jack>     Either () Bool ≅ Maybe Bool
02:41 < Iceland_jack> and also
02:41 < Iceland_jack>     Maybe a ≅ Either () a
02:41 < Iceland_jack> If you define
02:41 < Iceland_jack>     Maybe    b = 1 + b
02:41 < Iceland_jack>     Either a b = a + b
02:41 < Iceland_jack> then it becomes fairly clear
02:44 < bartleby> ah, I think it clicked here. I managed to list Bool -> Bool, four different functions
02:46 < Iceland_jack> and then for Bool -> Three where |Three| = 3 you have 3 independent choices for True and False so you have 3 * 3 = 3^2
02:46 < Iceland_jack> and so forth
02:46 < Iceland_jack> hope this clears things up a bit
02:46 < bartleby> I was unsure about partial fuctions, but now it makes sense. It's just a permutations of b I think (not sure if permutation is the right word)
02:47 < bartleby> how many arrangements with `a` elements of type `b` can I make?
02:51 < bartleby> Iceland_jack: thank you. I see that I have that page bookmarked, but I think I didn't get that Functions sections at the time
02:52 < bartleby> in fact, it's still confusing...
02:52 < bartleby> "Then each of First, Second and Third can map to two possible values, and in total there are 2⋅2⋅2 = 2^3 = 8 functions of type Trio -> Bool"
02:53 < bartleby> counting like this I was only seeing First->True, First->False, Second->True, Second->False... 6, like a product
02:54 < Iceland_jack> You have to map all the values
02:54 < Iceland_jack> so the first function might be
02:54 < Iceland_jack>     f1 First  = False
02:54 < Iceland_jack>     f1 Second = False
02:54 < Iceland_jack>     f1 Third  = False
02:54 < Iceland_jack> And the second function might be
02:54 < Iceland_jack>     f2 First  = True
02:54 < Iceland_jack>     f2 Second = False
02:54 < Iceland_jack>     f2 Third  = False
02:54 < bartleby> yeah, I missed that. Thinking about combinations is easier IMO. True True True, True True False, ...
02:55 < bartleby> reminds me of truth tables :)
02:55 < Iceland_jack> writing False as 0 and True as 1 you get
02:55 < Iceland_jack>     Trio -> Bool = { 000, 001, 010, 011, 100, 101, 110, 111 }
02:55 < Iceland_jack> with
02:55 < Iceland_jack>       |Trio -> Bool|
02:56 < Iceland_jack>     = |Bool| ^ |Trio|
02:56 < dibblego> a function of the type X -> Y has Y^X possibilites
02:56 < Iceland_jack>     = 2 ^ 3 = 8
02:56 < Iceland_jack> right :)
02:57 < Iceland_jack> so a function from
02:57 < Iceland_jack>     Trio -> Bool
02:57 < Iceland_jack> has the following implementations
02:57 < Iceland_jack> > replicateM 3 [0, 1]
02:57 < lambdabot>  [[0,0,0],[0,0,1],[0,1,0],[0,1,1],[1,0,0],[1,0,1],[1,1,0],[1,1,1]]
02:58 < Iceland_jack> and
02:58 < Iceland_jack>     Quad -> Bool
02:58 < Iceland_jack> > replicateM 4 [0, 1] -- etc.
02:58 < lambdabot>  [[0,0,0,0],[0,0,0,1],[0,0,1,0],[0,0,1,1],[0,1,0,0],[0,1,0,1],[0,1,1,0],[0,1,...
02:58 < Iceland_jack> > [ length (replicateM domainSize [0,1]) | domainSize <- [0..6] ]
02:58 < lambdabot>  [1,2,4,8,16,32,64]
02:59 < Iceland_jack> > [ 2^domainSize | domainSize <- [0..6] ]
02:59 < lambdabot>  [1,2,4,8,16,32,64]
03:01 < bartleby> > replicateM 2 [0,1,2]
03:01 < lambdabot>  [[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]
03:01 < bartleby> so that's Bool -> Trio. nice
03:01 < Iceland_jack> Which has 3^2 = 9 elements not to put too fine a point on it
03:02  * bartleby is counting subarrays
03:02 < bartleby> yup, nine
03:02 < bartleby> now it makes sense, thanks
03:04 < spion> so basically, you want the number of the possible tables, rather than the number of items in a table?
03:04 < spion> :)
03:04 < dibblego> this is why you find there are 4 implementations of (Bool -> Bool)
03:05 < Iceland_jack> yes since you can interpret each table as a function definition
03:05 < Iceland_jack>     True | False
03:05 < Iceland_jack>     -----+------
03:05 < Iceland_jack>     a    | b
03:05 < spion> right
03:05 < Iceland_jack> and
03:05 < Iceland_jack>     replicateM (length xs) xs
03:05 < Iceland_jack> should always have n^n elements given n = length xs
03:06 < Iceland_jack> can also be rewritten as
03:06 < Iceland_jack>     (length >>= replicateM) xs
03:07 < Iceland_jack> > map (length . (length>>=replicateM) . flip replicate ()) [0..7]
03:07 < lambdabot>  [1,1,4,27,256,3125,46656,823543]
03:07 < Iceland_jack> > [ n^n | n <- [0..7] ]
03:07 < lambdabot>  [1,1,4,27,256,3125,46656,823543]
```

## Applicative and liftA2

```
02:42 < dibblego> > liftA2 (+) [1,2,3] [30,40,50]
02:42 < lambdabot>  [31,41,51,32,42,52,33,43,53]
02:42 < blueclaude> Thanks dibblego
02:42 < dibblego> ! [1+30,1+40,1+50,2+30,2+40,2+50,3+30,3+40,3+50]
02:43 < benzrf> blueclaude: (<*>) on the list applicative is cartesian
product, but applying the first item to the second
02:43 < benzrf> > [(++"foo"), (++"bar")] <*> ["test", "othertest", "more"]
02:43 < lambdabot>
["testfoo","othertestfoo","morefoo","testbar","othertestbar","morebar"]
02:44 < dibblego> > join (Just (Just 4))
02:44 < lambdabot>  Just 4
02:44 < dibblego> > join (Just Nothing)
02:44 < lambdabot>  Nothing
02:44 < benzrf> > join []
02:45 < lambdabot>  []
02:45 < damncabbage> > [(+ 1), (+ 2)] <*> [1,2,3]
02:45 < lambdabot>  [2,3,4,3,4,5]
02:45 < dibblego> Maybe is cosemimonad, but not a comonad
02:47 < dibblego> bitemyapp: [] is also cosemimonad but not comonad
```

```haskell
liftA2 :: Applicative f => (a -> b -> c) -> f a -> f b -> f c
(<*>) :: Applicative f => f (a -> b) -> f a -> f b
-- by itself, cosemimonad
class Functor w =>
extend :: (w a -> b) -> w a -> w b
```

## RankNTypes with CPS'y example

```haskell
myFunc :: (forall a. a -> (a -> a) -> a) -> Int
myFunc f = f 0 (+1)

-- won't work
-- otherFunc :: (a -> (a -> a) -> a) -> Int
-- otherFunc f = f 0 (+1)

-- use:
-- myFunc (flip ($))
```

```
22:42 < mm_freak_> because 'f' is polymorphic, myFunc gets to apply it
to its own choice of types
22:42 < mm_freak_> in particular it can make different choices in
different places
22:43 < mm_freak_> the "forall" really just means that the function
implicitly takes a type argument
22:44 < bitemyapp> mm_freak_: I think part of the problem is the difference between
22:44 < bitemyapp> (forall a. a -> (a -> a) -> a) -> Int
22:44 < bitemyapp> vs.
22:44 < bitemyapp> forall a. (a -> (a -> a) -> a) -> Int
22:44 < bitemyapp> yes?
22:44 < bitemyapp> the latter being implicitly the case in Haskell.
22:44 < mm_freak_> yes, but think about it…  think really really simple in this case
22:45 < mm_freak_> in the former case myFunc receives a polymorphic function, so myFunc
                   gets to choose the type
22:45 < mm_freak_> in the latter case myFunc itself is polymorphic, so the applier of
                   myFunc gets to choose it
22:45 < mm_freak_> notice that in the former case myFunc is
monomorphic!
22:46 < mm_freak_> yeah…  its type isn't quantified over any type
variables
22:46 < bitemyapp> mm_freak_: but the lambda passed to it is?
22:46 < mm_freak_> yeah
22:46 < bitemyapp> okay, yes.
22:46 < bitemyapp> so we're assigning/shifting around polymorphism
22:46 < bitemyapp> between the top level function the func arg
22:46 < bitemyapp> based on the ranks/nesting
22:46 < bitemyapp>  / scope'ish
```

## Epic Functor, algebra, Coyoneda discussion

* * * * *

bitemyapp edited 4 days ago | link | delete | reply

I realize this is partly because the examples are in Scala, but none
of this gets at what a Functor really is.

Functor is an algebra.

Functor is an algebra with one operation, usually called map.

That one operation has a type something like:

```haskell
(a -> b) -> f a -> f b
```

That one operation should respect identity:

```
map id = id
```

And that one operation should be associative:

```
map (p . q) = (map p) . (map q)
```

That’s it people. That’s it. Functor is a very weak structure. Many
things can be functor. Many of those things will not look anything
like a “list”, “collection”, or even a “data structure”.

Understanding free objects, free versions of these algebraic
structures, can lend a more faithful intuition for what these things
are.

Glancing at Coyoneda (the free functor) should give one some idea of
why you’re not dealing with something that has anything to do with
lists.

Want to know more?

You know the drill: https://github.com/bitemyapp/learnhaskell

Edit:

Since I take great satisfaction in excising misunderstandings, I’m
going to include a Functor instance that should help drop the
“collections” oriented view of what they are.

```haskell
-- (->) or -> is the type constructor for functions
-- a -> a, the identity function's type is a type of
-- -> taking two parameters of the same type (a and a)
-- (->) a a   analogous to   Either a b
instance Functor ((->) r) where
    map = (.)

-- (.) or .  is function composition
-- (.) :: (b -> c) -> (a -> b) -> a -> c
-- more on this Functor instance:
-- http://stackoverflow.com/questions/10294272/confused-about-function-as-instance-of-functor-in-haskell
```

Bonus round for upvoting me:

http://www.haskellforall.com/2012/09/the-functor-design-pattern.html
http://hackage.haskell.org/package/kan-extensions-3.7/docs/Data-Functor-Coyoneda.html
http://oleksandrmanzyuk.wordpress.com/2013/01/18/co-yoneda-lemma/
http://www.reddit.com/r/haskell/comments/17a33g/free_functors_the_reason_free_and_operational_are/c83p8k2
https://gist.github.com/thoughtpolice/5843762

* * * * *

tel 4 days ago | link | reply

```
Understanding free objects, free versions of these algebraic
structures, can lend a more faithful intuition for what these things
are.
```

This is a super great point—it also, meaningfully, applies to other
structures like Monads, Applicatives, or Monoids, Categories,
Arrows. Really quickly, here’s Yoneda and Coyoneda (the “two” free
functors)

```haskell
newtype Yoneda f a = Yoneda { runYoneda :: forall b . (a -> b) -> f b }
data Coyoneda f b where Coyoneda :: f a -> (a -> b) -> Coyoneda f b
```

In each case we see that functor tends to mean having a parametric
structure (the f) and a method of transforming the parameter to
something else (the functions a -> b). When we “collapse” this free
view of a functor we get to decide if, how, when, and why we combine
that structure and its mapping function. For lists we, well, map
it. For something like

```haskell
data Liar a = Liar -- note that `a` does not appear on the right side
```

we just throw the mapping function away.

(Another key point that’s a bit harder to see is that if you map the
Yoneda/Coyoneda formulation repeatedly it does not store each and
every mapping function but instead composes them all together and
retains only that composition. This ensures that functors cannot “see”
how many times fmap has been called. That would let you violate the
functor laws!)

* * * * *

gclaramunt 3 days ago | link | reply

Do you have any reference of functor being an algebra? I’m intrigued

Since we’re clarifying what a functor is, I guess is worth noting that
you’re talking about endofunctors in the (idealized) Hask category. In
category theory, a functor is defined by two mappings: one for objects
in the category and one for arrows, that must preserve identity and
composition (the laws you mention). Since the mapping of objects is
already given by the type constructor, here one needs to provide only
the mapping of functions but it kind of irks me when ppl. say a
functor is only defined by “map” :)

* * * * *

tel 2 days ago | link | reply

Functor is definitely an algebra. Its rules mean that it has tight
relation to certain functors in CT.

* * * * *

gclaramunt edited 2 days ago | link | reply

Interesting… any refereces I can read? Or you’re talking about
F-algebras?

* * * * *

tel 2 days ago | link | reply

I mean “algebra” as “set of operations and equalities”.

* * * * *

gclaramunt 2 days ago | link | reply

Ok. To be honest, I need to familiarize myself with the definition of
algebra, is just that I had never heard this before :)

* * * * *

tel 1 day ago | link | reply

It’s an incredibly overloaded term, tbh. In the context of abstract
algebra you’d probably want to think of a (G, L)-algebra as a set
inductively defined by generators G and laws L. For instance, here’s a
“free” monoid algebra (note that this isn’t a free monoid, but a “free
monoid algebra” or a “free algebra of the monoid type” or a “(monoid,
{})-algebra” maybe)

```haskell
data FMonoid where
  Fmempty :: FMonoid
  Fmappend :: FMonoid -> FMonoid -> FMonoid

class Monoid FMonoid where    -- this is wrong! doesn't follow laws!
  mempty = Fmempty
  mappend = Fmappend
```

note that it has all the “generators” of the typeclass Monoid but
follows none of the rules (mempty <> mempty != mempty). Typically we
also want to add a set of constants to form the smallest free algebra
over a set

```haskell
data FMonoid a where
  Embed :: a -> FMonoid a
  Fmempty :: FMonoid a
  Fmappend :: FMonoid a -> FMonoid a -> FMonoid a
```

* * * * *

gclaramunt 1 day ago | link | reply

Really interesting, thanks a lot! Now I’m trying to see how this ties
to the Functor typeclass: G are the instance constructors and the
functor laws make L ? I think I’m missing an important piece of the
puzzle here :)

* * * * *

tel 1 day ago | link | reply

You’re not, that’s basically it.

```haskell
data FFunctor f a where
  EmbedFunctor :: f a -> FFunctor f a
  Ffmap :: (a -> b) -> FFunctor f a -> FFunctor f b
```

This lets you build the free (Functor, {})-algebra over some initial
type f. If we translate it naively then it doesn’t follow the laws

```haskell
class Functor (FFunctor f) where -- wrong!
  fmap = Ffmap
```

but we can implement it properly if we’re a little more clever

```haskell
class Functor (FFunctor f) where
  fmap f x = case x of
    EmbedFunctor fa -> Ffmap f x
    Ffmap g fa -> Ffmap (f . g) fa
```

We need one more function, though, since we can’t use EmbedFunctor
directly without exposing information about whether or not we’ve ever
fmaped this functor (which shouldn’t be possible to access, that’s
what fmap id = id says)

```haskell
embed :: f a -> FFunctor f a
embed fa = Ffmap id (EmbedFunctor fa)
```

And now, if we think about it, we can see that every value of FFunctor
constructed using embed and fmap is of the form

```haskell
Ffmap fun (EmbedFunctor fa)
```

And so that EmbedFunctor constructor is totally superfluous. Let’s
remove it

```haskell
data FFunctor f a where
  Ffmap :: (a -> b) -> f a -> FFunctor f b

embed :: f a -> FFunctor f a
embed fa = Ffmap id fa
```

And—well—this is just CoYoneda again!

```haskell
lower :: Functor f => FFunctor f a -> f a
lower (Ffmap f fa) = fmap f fa
```

* * * * *

gclaramunt about 9 hours ago | link | reply

Nice Haven’t digested it properly but I see the trick is to capture
the functor with a datatype (is the same thing with free monads,
right?) Now is easier to see from where CoYoneda comes, thanks! (you
did show me an important piece of the puzzle :P )
