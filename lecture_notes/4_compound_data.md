# Compound Data

Now we know how to build abstractions with functions, but we want to
be able to build abstractions with data.

In lisp as in many other languages we can create our own data types
to provide additional layers of abstractions.

For example we may have a data structure to represent rational number
and this can be built in the following way:

```scheme
; basic functions related to our data type (only the signature is reported)

; Constructor: builds our abstract data type
(define (make-rat n d))

; Selectors: gives a part of the rational number
(define (numer r))
(define (denom r))


; Procedures that operate on our data structure
(define (+rat r1 r2))
(define (*rat r1 r2))
```
The methodology of dividing the representation of data from its use by building
these procedures is called **data abstraction**.
Data abstraction can be seen as a methodology to separate the **use** from the
**representation** of data by setting up data objects by postulating
constructors and selectors.

Data abstraction represents a way to control complexity since it allows us to
build black-box abstractions that can be used without knowing details about
the internals.

Each abstract data type as we will see commonly is characterized by:
- a procedure (even more) to built the ADT called **constructor**;
- one or more procedures to get out the parts of the ADT called **selector**;
- other procedures that operate on the data structure;

The tool to build abstract data types in Lisp languages is provided through
the concept of **pair** which provides a primitive "glue" that we can use to
construct compound data objects. Pairs are built using the `cons` primitive
operation.
A common notation used to express pairs and many other abstract data types is
the so called **box and pointer notation**.
In this representation, each entity is shown as a pointer to a box. The
box for a primitive entity contains a representation of the object. For
example, the box for a number contains a numeral. The box for a pair is
actually a double box, the left part containing (a pointer to) the **car**
of the pair and the right part containing the **cdr**.

So each pair can be decomposed by taking its first element with the primitive
operation `car` or taking the second element with the primitive operation `cdr`.

So basically we can treat the **pair** already as an ADT, and see `cons` as its
constructor procedure while `car` and `cdr` are its selectors.

Let's go back to our rational numbers and let's build the ADT by completing
the whole procedures:
```scheme
; Constructor: builds our abstract data type
(define (make-rat n d)
    (cons n d))

; Selectors: gives a part of the rational number
(define (numer r)
    (car r))

(define (denom r)
    (cdr r))


; Procedures that operate on our data structure
(define (+rat r1 r2)
    (make-rat (+ (* (numer r1) (denom r2))
                 (* (numer r2) (denom r1)))
              (* (denom r1) (denom r2))))

(define (*rat r1 r2)
    (make-rat (* (numer r1) (numer r2))
              (* (denom r1) (denom r2))))
```

As we can see we defined the procedures that operate on our data
in terms of constructors and selectors, this is essential, since
our procedures are now general, and if we ever have to change
the data representation or how `numer` and `denom` work we still
will have functioning procedures operating on our data.

For example one day we may want to build our rational number but reducing
it to their lowest terms through the gcd, we may rewrite our constructor
with:
```scheme
(define (make-rat n d)
    (let ((g (gcd n d)))
        (cons (/ n g)
        (/ d g))))
```
And this is fine since it will not change how additions and multiplications
are performed, we still have a functioning system.

## Closure of the Means of Combination

One important concept when we talk about means of combinations is the
concept of **closure** (note this at the moment is not the same as far as I
know to the concept of closure in Functional Programming).

This means that if a mean of combination (e.g., `cons`) produces things
which can be combined again and again (infinitely) with the same
mean of combination, it means that it is characterized by a closure.

So a closure is a sort of quality test for a tool of combination.


## Using Compound Data in Design

Basically we want to build abstractions and use these abstractions to
build more complex abstractions, in order to have a layered systems.
This allows a sort of modularity whenever we have to make changes,
since we already know at what layer we must operate to change something,
without becoming crazy by chaing parts of the system here and there.

In general creating an abstraction allows us to **create names**, hence
allows us to control them, if they have a name we can control them, it
is like with spirits, if you know the name of the spirit you can evoke
it and control it.

Additionally, we have to remember that whenever we want to design an
abstract data we are basically satisfying a contract, this contract
can also be built with examples or a definition axiom.


## How are Pairs Built?

Actually it seems magic, but also pairs can be rebuilt, let's see
a simple implementation:
```scheme
; cons constructor for pair
(define (cons a b)
    (lambda (pick)
        (cond ((= pick 1) a)
              ((= pick 2) b))))

; car selector for pair
(define (car x) (x 1))

; cdr selector for pair
(define (cdr x) (x 2))
```
As we can see there is some magic here, because we have this blurred line
between procedures and data.
Our pair data structure it's not actually some kind of classical data structure
as we may have imagined it, on the contrary is built up with procedures returning
procedures, i.e., `cons`.
The procedure `cons` can be represented in terms of procedure although we think
about it as if it was data.

NOTE:
An important thing is that we have to stop thinking about procedures
only as the act of doing something! **Procedures are conceptual entities,
and can be thought of as objects**.

We don't need data at all to build data abstractions, we can build
everything starting from procedures.

