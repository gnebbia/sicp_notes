# Procedures and Processes

In this section we analyze how procedures
that we write affect processes in a machine.
We learn about linear iteration, linear recursion
and tree recursion.
All these processes are all built using recursive
procedure since in lisp this is very natural and
a common approach.

In order to understand how procedures affect
processes we use the **substitution model** which
will accompany us for many excersises until we introduce
a more complex model to understand how procedures
are managed within a machine.

This model can be thought of as the classical mechanics
or ideality in physics, when we are ok with a simplistic
approximation.
Anyway for some other scenarios we will find out it is not
enough and will be forced to deal with a more complex model.

## Kinds of Expressions

Procedures are made of expressions, which can be of these types:
- Numbers
- Symbols
- Combinations
- Lambda Expressions (special form)
- Definitions        (special form)
- Conditionals       (special form)

Note that "special form" means that for that kind of expression
we have other specific rules.

## Substitution Model Rule

So to evaluate an application we should:
- evaluate the operator to get the procedure;
- evaluate the operands to get the arguments;
- apply the procedure to the arguments
    - copy the body of the procedure substituting
      the arguments supplied for the formal
      parameters of the procedure;
    - evaluate the resulting body;

## Example of Substitution Model Rule

Let's apply the substitution rule to the following
simple procedure.
```scheme
(define (+ x y)
    (if (= x 0)
        y
        (+ (dec x) (inc y))))
```
Now let's say the procedure gets called with:
```scheme
(+ 3 4)

Now to apply the substitution model we can just do:
```substitution
(+ 3 4)
(if (= 3 0) 4 (+ (dec 3) (inc 4)))
(+ (dec 3) (inc 4))
(+ (inc 3) 5)
(+ 2 5)
(if (= 2 0) 5 (+ (dec 2) (inc 5)))
(+ (dec 2) (inc 5))
(+ (dec 2) 6)
(+ 1 6)
(if (= 1 0) 6 (+ (dec 1) (inc 6)))
(+ (dec 1) (inc 6))
(+ (dec 1) 7)
(+ 0 7)
(if (= 0 0) 7 (+ (dec 0) (inc 7)))
7
```



# Procedures vs Processes

Let's start by analyzing two procedures which are
functionally the same thing, but produce a quite
different process.


# Peano Arithmetic Sum v1
 ```scm
(define (+ x y)
    (if (= x 0)
        y
        (+ (dec x) (inc y))))
```


# Peano Arithmetic Sum v2
 ```scm
(define (+ x y)
    (if (= x 0)
        y
        (inc (+ (dec x) y))))
```

Let's see the substitution model of these snippets to understand
how the process evolves.


# Peano Arithmetic Sum v1: Substitution Model
(+ 3 4)
(+ 2 5)
(+ 1 6)
(+ 0 7)
7


# Peano Arithmetic Sum v2: Substitution Model
(+ 3 4)
(inc (+ 2 4))
(inc (inc (+ 1 4)))
(inc (inc (inc (+ 0 4))))
(inc (inc (inc (4))))
(inc (inc 5))
(inc 6)
7

# Conclusion on Sum v1 Substitution Model

These processes have a very different shapes.
Note that the shape of the process is 2d and each dimension has a meaning.
The y axis is time, while the x axis is the space, so amount of things
I have to remember.

This v1 version has a time complexity of O(x) since the number of steps
on the y axis increases linearly with increasing x.
But has a constant complexity in space O(1).

A process which has a linear time complexity and a constant space complexity
is called **iteration process** (linear iteration).


These complexities put a bound, saying that every machine can perform
this procedure with this amount of resources at maximum.
Note that of course we are abstracting details such as how big is a number,
but it doesn't matter since we are at a different level of abstraction.
We could also consider that all the numbers take the same space.


# Conclusion on Sum v2 Substitution Model

This v1 version has a time complexity of O(x) since the number of steps
on the y axis increases linearly with increasing x.
And the same happens for space, if we increase x we have two more
lines, hence space complexity is also O(x).

A process which has both linear time complexity and space complexity
is called **recursion process** (or linear recursion).


## Additional Notes

Both the definition of iteration process and recursion process have been
made with recursive definition, since we call the function itself in the
studied function.
There is nothing special about this, we just have a recursive function leading
to two different process shapes (which have different names).

So the takeaway here is, expressed by the following note.
NOTE: we must be careful not to confuse the notion of a **recursive process**
with the notion of a **recursive procedure**.

## Tree Recursion

This happens everytime we have a recursive process where two or more calls to the
same function are performed. As an example the fibonacci sum can be computed
very naturally in this way. Although an iterative version would be more
efficient, the tree recursive way is more natural to design.

