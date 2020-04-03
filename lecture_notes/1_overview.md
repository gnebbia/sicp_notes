# Intro to Computer Science

Computer Science is about **imperative knowledge**, so the
practical "How-To" of mathematics.
This is the specular of geometry which deals with **declarative
knowledge** so what is true.

Actually "Computer Science" is a very bad name, since this field
is not about computers strictly, and it is not even a science but
more an engineering field or an art.

Many times people confuse computer science thinking that it is about
computers just because it is a relatively new field.
This happened with geometry too, when egyptians were using it to
understand what was the impact of Nile flooding.



# Computer Science/Engineering

Computer Engineering is a very abstract field, and can deal with
a huge amount of complexity. Hence we need ways to work with complexity.

The pillar **technigues for controlling and managing complexity** in
computer engineering are:
- Black-Box Abstraction;
- Conventional Interfaces;
- Metalinguistic Abstraction;

And these will be the macro section of the SICP course.

Black-Box abstractions allow us to treat something very complex in an
easy way without knowing all the low level details.
Conventional interfaces are like connectors and plugs we have in
electrical engineering.
Metalinguistic abstraction is used to create new languages to deal
with our domain (in a simpler way).


## Black-Box Abstraction

We have to make complexity simple.
We have to understand how to build black-box abstractions.
To do this we first have to understand what are the small pieces
we have available and how to put them together to build something
more complex.

In order to do this we have to understand:
- Primitive Objects
    - Primitive Procedures;
    - Primitive Data;
- Means of Combination 
    - Procedure Combination;
    - Construction of Compound Data;
- Means of Abstrction
    - Procedure Definition
    - Simple Data Abstraction
- Capturing Common Patterns
    - High Order Procedures
    - Data as Procedures

## Conventional Interfaces

- Generic Operations
    functions which have to work with different kind of data (e.g., +);
- Large-Scale Structure and Modularity
    how do we put together large programs;
    - Object-Oriented Programming, where the system is made by entities
      interacting with each other;
    - Operations on Aggregates, or streams, a way of designing
      similar to electrical engineering;

## Meta-Linguistic Abstractions

This is how we construct new languages.
We will look at:
- Interpretation (Apply/Eval)
- Logic Programming
- Register Machines



## Learning a Language

To learn a language we must understand:
- Primitive elements (primitive procedures and primitive data)
    examples are: `+`,`/`,`=`,`<`,`2.45`,`7`;
- Means of Combination (procedure combination and compound data)
    examples are: `()` composition, `if`, `cond`;
- Means of Abstraction (procedure definition and simple data abstraction)
    examples are: `define`;

We just used simple examples, but going on with the course will provide us
with the more complex examples.

## Computer Engineering vs Other Engineering Fields (Motivation for dealing with complexity)

Computer engineering differs from other engineering fields
since it managees abstract components.
Abstract components do not have physical limitations.
For example in electrical engineering we cannot implement
an amplifier with throusands amplifying blocks, because we
have difficulties the implementation such as noise,
temperature and so on. On the contrary, in computer science
this does not happen.
In computer engineering we ignore constraints imposed by reality.


## Black Box Abstraction

We can hide details in our function, constructing inner functions
which will be visible only by the square-root function.
This also has an additional advantage that it does not cause
namespace pollution.


```scheme
(define (square-root x)
    (define (step-try y)
            ... x y)
    (define (step-improve z)
            ... z)
    (define (step-guess s)
            ... x s)
    step-try 1)
```
