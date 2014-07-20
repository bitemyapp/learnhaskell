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
