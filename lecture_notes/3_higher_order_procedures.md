# Higher Order Procedures

Higher order procedures are useful for many things,
at the moment they can be used for:
- abstracting functions;
- generate other functions;

Think about the sum higher order function.  We have both a very general
function which can be used by itself but also a tool to generate other
more specific functions, for example functions generating very specific
series or sequences.


## Example of usage of Higher Order Functions

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
Let's try to generate the previous function starting from the new `(sum)` function.

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
