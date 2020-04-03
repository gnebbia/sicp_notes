(define (walk-tree node
                   leaf? left right label
                   prefix infix-node infix-leaf suffix)

    (prefix node)
    (if (leaf? node)
        (infix-leaf node)
        (begin
         (walk-tree (left node) leaf? left right label prefix infix-node infix-leaf suffix)
         (infix-node node)
         (walk-tree (right node) leaf? left right label prefix infix-node infix-leaf suffix)))
  (suffix node))

(define (atom? x) (not (cons? x)))
(define (cons? x) (pair? x))

(walk-tree '(* (+ a b) (/ c 2))
           atom? cadr caddr car
           (lambda (n) (display "("))
           (lambda (n) (display (car n)))
           (lambda (n) (display n))
           (lambda (n) (display ")")))

prints: (((a)+(b))*((c)/(2)))

;;;; 
;; you may also have a look at:
;; http://groups.google.com/group/comp.lang.lisp/msg/0c66e597e08be90d
;; http://groups.google.com/group/comp.lang.lisp/msg/40efa5254dbfac4f
