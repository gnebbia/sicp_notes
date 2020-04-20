# Higher Order Functions

Higher Order Functions (or Procedures) are functions who do at least
one of the following:
- **takes one or more functions as arguments** (i.e. procedural parameters);
- **returns a function** as its result.

Higher order procedures are useful for many things, at the moment we
will use them for:
- abstracting functions;
- generate other functions;

As an example let's think about the summation symbol in mathematics as an
higher order function.  We have both a very general function which can be
used by itself but also a tool to generate other more specific functions,
for example functions generating very specific series or sequences.


## Example of Higher Order Function accepting functions as arguments

Let's say that we have these three functions:
```scheme
;; computes the sum of i (sum(i))
(define (sum-int a b)
    (if (> a b)
        0
        (+ a
           (sum-int (inc a) b))))
```

```scheme
;; computes the sum of squares of i (sum(i^2))
(define (sum-sq a b)
    (if (> a b)
        0
        (+ (square a)
           (sum-int (inc a) b))))
```

```scheme
;; computes the pi/7 approximation
;; which is sum( 1/( i(i+2) ) ) but the sum goes by 4 each step
(define (pi-sum a b)
    (if (> a b)
        0
        (+ (/ 1 (* a (+ a 2)))
           (pi-sum (+ a 4) b))))
```


These functions are almost identical, so basically there is
a pattern that can be summarized by a higher order function.
```scheme
;; computes the sum of anything we want :D  (sum(f(x)))
(define (sum a b next term)
    (if (> a b)
        0
        (+ (term a)
           (sum (next a)
                b
                next
                term))))
```
In this case next and term are functions which have to be passed.
We have somewhat captured the general pattern from the previous procedure.
At this point we can either use this abstraction or use it to generate functions.
Let's try to generate the previous functions starting from the new `sum` function.

```scheme
;; sum-int redefined using higher order function "sum"
(define (sum-int a b)
   (define (identity a) a)
    (sum a b inc identity))
```

```scheme
;; sum-sq redefined using higher order function "sum"
(define (sum-sq a b)
    (sum a b inc square))
```

```scheme
;; pi-sum redefined using higher order function "sum"
;; which is sum( 1/( i(i+2) ) ) but the sum goes by 4 each step
(define (sum-int a b)
    (sum a
         b  
         (lambda (i)(+ i 4))                ; we step by 4 step per time
         (lambda (i)(/ 1 (* i(+ i 2))))))
```

## Example of Higher Order Function returning functions

Let's try another alternative method to compute the square root
of a number by using the fixed-point concept.
The **fixed-point concept** is a concept by which we use the same function
over and over converging to a value and stop only when the difference
between subsequent values is below a certain threshold.
Some functions have this property that we can find their fixed point
if we iterate the function enough on any number (.e.,g f(f(f(f(f(f(f(x))))))) ).
For example the cosine function has this kind of behaviour, if we
for example take the cosine of the cosine of the cosine of the cosine...
of any number `x` we get a number close to `0.739`; and indeed if we
compute `cosine(0.739)` we exactly get `0.739`.

Basically the square root computed by Heron method is based on the fixed
point concept. Where our fixed point function was `f = (y + (x / y)) / 2`
or expressed in lisp terms `(/ (+ y (/ x y)) 2)`.
So using the heron method to compute the square is basically the same
as searching for the **fixed-point of the function f**.
Indeed if we compute (f(sqrt(x))) we get (sqrt(x)).

We can nicely express these ideas by building up abstractions using
higher order functions.

```scheme
(define (sqrt x)
    (fixed-point (lambda (y) (average (/ x y) y))
                 1))

;; iterative procedure to commpute the fixed point
(define (fixed-point f start)
    (define tolerance 0.00001)
    (define (close-enough? u v)
        (< (abs (- u v)) tolerance))
    (define (iter old new)
        (if (close-enough? old new)
            new
            (iter new (f new))))
    (iter start (f start)))

```
This can be expressed in a clearer way, if we consider as fixed-point
function for finding the square root `(/ x y)` indeed when `y` is
`sqrt(x)` then the function assumes the value `sqrt(x)`, there is just
one problem, that this function oscillates with certain values, and that's
why we previously were using the other adjusted fixed-point function.
Let's try to express this idea with functions.

```scheme
(define (sqrt x)
    (fixed-point
        (average-damp (lambda (y) (/ x y)))
        1))


;; now average-damp is a procedure which takes a procedure
;; as its argument and returns a procedure as its value
(define (average-damp f)
    (lambda (x) (average (f x) x))) 

;; this is the return of an anonymous function
;; we could have also returned a named function
;; by doing:
;; (define (foo x)
;;      (average (f x) x)
;;  foo)
```


## Functions as First-Class Citizens

Throughout this course we will support the ideas of Christopher Strachey,
one of the grandfathers of computer science who was a big advocate for
making functions first-class citizens in a programming language.
This means that functions have the following rights/privileges:
- to be named by variables;
- to be passed as arguments to procedures;
- to be returned as values of procedures;
- to be incorporated into data structures;
