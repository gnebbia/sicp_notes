# Using HOF as objects through closures to create a language

```scheme
(define (make-general-tag tag)
  (lambda attrs
    (lambda (contents)
      (call-with-output-string
        (lambda (port)
          (format port "<~a" tag)
          (let lp((next attrs))
            (cond
             ((null? next)
              (display ">\n" port)
              (display contents port)
              (newline port)
              (format port "</~a>" tag))
             (else
              (format port " ~a='~a'" (keyword->symbol (car next)) (cadr next))
              (lp (cddr attrs))))))))))

(define label-tag (make-general-tag 'label))
(define a-tag (make-general-tag 'a))
(define p-tag (make-general-tag 'p))
(define div-tag (make-general-tag 'div))
```

# Similar Example in Python

## Functional Approach
```python
def make_tag(name):
    def spec (content):
        return "<" + name + ">" + content + "</" + name + ">"
    return spec
```

## Example Usage
```python
div = make_tag("div")
div(div(div(p("ciao this is a paragraph!"))))
```

# Imperative Approach

```python
def html_content(name, content):
    return "<" + name + ">" + content + "</" + name + ">"
```

## Example Usage
```python
html_content("div", html_content("div", html_content("div", html_content("p","ciao this is a paragraph!"))))
```
