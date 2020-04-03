;;; starting version ;;;
(define (sqrt x)
    (define tolerance 0.00001)
    (define (good-enuf? y)
        (< (abs (- (* y y) x)) tolerance))
    (define (improve y)
        (average (/ x y) y))
    (define (try y)
        (if (good-enuf? y)
            y
            (try improve y)))

    (try 1))


;;; first improved version ;;;
(define (sqrt x)
  (fixed-point
    (lambda (y) (average (/ x y) y))
    1))

(define (fixed-point f start)
  (define tolerance 0.00001)
    (define (good-enuf? y)
        (< (abs (- (* y y) x)) tolerance))
  (define (iter old new)
    (if (close-enuf? old new)
        new
        (iter new (f new))))
  (iter start (f start)))

;;; second improved version ;;;
(define (fixed-point f start)
  (define tolerance 0.00001)
    (define (good-enuf? y)
        (< (abs (- (* y y) x)) tolerance))
  (define (iter old new)
    (if (close-enuf? old new)
        new
        (iter new (f new))))
  (iter start (f start)))

(define (average-damp f)
  (lambda (x) (average (f x) x)))

(define (sqrt x)
  (fixed-point
    (average-damp (lambda (y) (/ x y)))
    1))
