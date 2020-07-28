#lang racket
;; You can find documentation for rackunit in Help Desk by pressing the “F1” key on most
;;    computers.
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

(define d 4)
(or (odd? d) (odd? a) (odd? b))

"Changing variables with conditionals"
(define is-it-even #f)
(or (odd? d) (set! is-it-even #t))
(and (even? d) (set! is-it-even #t))
#|

 Different ways, same stuff:
(and file-modified (ask-user-about-saving) (save-file))
------
(when (and file-modified (ask-user-about-saving))
(save-file))
------
 the last one is better because it separates the condition from the action.

(define filename "my-first-program.rkt")
(unless (ask-user-whether-to-keep-file filename)
(delete-file filename))
An unless form performs some action if its condition returns #f.

|#
"Unless form"
#|(define filename "my-first-program.rkt")
(unless (ask-user-whether-to-keep-file filename)
(delete-file filename))
|#

"Functions that Return More than Just the Truth"

;;member: checks for the membership of an iten in a list
(if (member 4 (list 3 4 1 5)) '4-is-in 'not-in)
;;but it also returns the tail of a list:
(member 1 '(3 4 1 5))

"More Equality Predicates"
(struct point (x y) #:transparent)
;;calculating the distance between two points:
(define (distance-to-origin p)
(sqrt (+ (sqr (point-x p)) (sqr (point-y p)))))
"equal? function"
(define pt1 (point -1 2))
(define pt2 (point -1 2))
;;try: (equal? pt1 pt2)
"eq? function"
;; it compares if both concrete structures were created by the same constructor.
(eq? pt1 pt2)
;; eq? recognizes that pt1 is equal to itself and so
;; is pt2, but pt1 and pt2 were created at different times.
"renaming the value:"
(define pt3 pt1)
;; try this now:
(eq? pt1 pt3)
"tests"
;; racket's library for testing: rackunit
;; if you need it, you require the library:
(require rackunit)
;; testing:
(check-equal? (add1 5) 6)
;; a failure looks like this:
;;(check-equal? (add1 5) 7)
;; for more testing facilities, check the page 70 