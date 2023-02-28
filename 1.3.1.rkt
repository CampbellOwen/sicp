#lang sicp


(define (sum min term max next)
  (if (> min max)
      0
      (+ (term min) (sum (next min) term max next))))


(define (cube x) (* x x x))

(define (integrate f a b n)
  (define h (/ (- b a) n))
  (define (coef i) (+ 2 (* 2 (remainder i 2))))
  (define (y_i i) (f (+ a (* i h))))
  (define (term i) (* (y_i i) (coef i)))
  (* (/ h 3) (+ (y_i 0) (sum 1 term (- n 1) inc) (y_i n))))


(define (sum-iter a term b next)
  (define (iter total i)
    (if (> i b)
        total
        (iter (+ total (term i)) (next i))))
  (iter 0 a))