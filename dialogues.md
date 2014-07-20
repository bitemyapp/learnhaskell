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

## Contination passing style, CPS transform

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
