#lang racket

;define word is used to define variables and functions.
;It is thus possible that a function may have zero
;  arguments, but it must have at least one expression in its body.
;set! => changes the value of a variable

(define (start n m)
  (set! lower (min n m))
  (set! upper (max n m))
  (guess))

(define lower 1)
(define upper 100)

(define (guess)
  (quotient (+ lower upper) 2))

(define (smaller)
  (set! upper (max lower (sub1 (guess))))
  (guess))

(define (bigger)
  (set! lower (min upper (add1 (guess))))
  (guess))
  