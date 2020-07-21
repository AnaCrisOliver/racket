#lang racket
;; A racket predicate is a function that returns either true
;;    or false, which are conventionally written as #t and #f
;; Examples:

"Predicate functions"
(zero? 1)
(symbol=? 'a 'b)

"Type predicates"
;; A structure definition also defines a predicate function.
;; Example:
(struct student (name id# dorm) #:transparent)
(define sophomore3 (student 'David 100234 'PG))
(student? 'a)
(student? sophomore3)
(student? (student-name sophomore3))
(student? (student 1 2 3))
(define lista (list (student 1 2 3) (student 4 5 6) empty))
(student? lista)
(student? (list (student 7 8 9) (student 10 11 12) empty))

;; Every built-in form of data comes with a type predicate:
"Other type predicates"
(number? 'a)
(string? "hello world")
(symbol? 'a)
;;(image? 10) --didn't work (why?)
(boolean? "false")

"Predicates for lists:"
(list? 'eh)
(cons? '(What is that aboot?))
(empty? 'a)

"Predicates for numbers:"
(real? 10)
(real? (sqrt -1))
(rational? 2/3)
(integer? 1.0)
(integer? 1)
(exact-integer? 1.0)

"Equality predicates:"

(symbol=? 'a 'b)
(= 1 2)
(boolean=? #f #f)
(string=? "hello world" "good bye")
(equal? (student 'David 100234 'PG) sophomore3)

;; The (equal?) predicate:
;;     It is a universal equality predicate. It means that equal?
;;     can compares numbers with lists, Booleans, strings and
;;     everything else.

"Conditionals"
"-IF"

(if (= (+ 1 2) 3)
    'yup
    'nope)

;; Everything that is not false is #t.
(if empty
    "yeah"
    "oh no")

;; IF with predicates
(if (odd? 5) 'odd-number 'even-number)

(define x 7)
(if (even? x)
    'even-number
    (if (= x 7)
        5
        'odd-number))

"Cond expression"
;; Many racket programmers consider it to be the one true Racket
;;     conditional form.

(define y 8)
(cond [(= y 7) 5]
      [(odd? y) 'odd-number]
      [else 'even-number])

;; The conditions in a cond form are always checked consecutively
;;     from top to bottom, meaning the first sucessful match drives
;;     the behavior.
;; It is a common cond idiom to use 'else' as the last branch
;;     because it ensures that the conditional will evaluate some branch.

(define z 4)
(cond [(even? z) 'even-number]
      [(= z 10) 10]
      [else 'odd-number])

"Recursion"
"List-eater"

(define (my-length a-list)
  (if (empty? a-list)
      0
      (add1 (my-length (rest a-list)))))

(my-length '(list with four symbols))
(my-length '(42))

"Conditionals AND and OR"
(define a 5)
(define b 7)
(define c 9)
(and (odd? a) (odd? b) (odd? c))

(define d 3)
(or (odd? d) (odd? a) (odd? b))

"Changing variables with conditionals"
(define is-it-even #f)
(or (odd? d) (set! is-it-even #t))
(and (even? d) (set! is-it-even #t))
     