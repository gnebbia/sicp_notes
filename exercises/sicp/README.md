# How to do the exercises

We first need to install a scheme interpreter, one option is `racket`,
once racket is installed we need the `sicp` package, which can be installed
by doing:
```sh
raco pkg install sicp
```

Once the `sicp` package is installed we can run a SICP compatible repl
with our racket installation by issuing:
```sh
racket -l sicp --repl
```

We can also run the `racket` interpreter normally and then
type:
```racket
(require sicp)
```

