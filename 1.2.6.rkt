#lang sicp

(define (is-divisor x y) (= 0 (remainder x y)))

(define (square x) (* x x))

(define (find-divisor x test)
  (cond
    ((> (square test) x) x)
    ((is-divisor x test) test)
    (else (find-divisor x (+ 1 test)))
    ))

(define (smallest-divisor x)
  (find-divisor x 2))

(define (prime? x)
  (= x (smallest-divisor x)))


(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      "nothing"))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


; ----------------------------------------


(define (search-for-primes min max)
  (cond
    ((> min max) (newline) (display "done"))
    (else (timed-prime-test min) (search-for-primes (+ 1 min) max))))