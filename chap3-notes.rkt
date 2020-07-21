#lang racket
;; IN RACKET:
;; Symbols are case sensitive.
;; ? => boolean.
;; 1 and 1.0 are two different entities.
;; The decimal notation indicates an inexact
;;    number.
;; There are other string operations like substring , string-ref , string=? , and more, all
;; of which you can read about in Help Desk.
;; Lists are linked lists.
;; If x is the name for a cons cell, car extracts the left piece of data from x and cdr
;;    extracts the right one.
;; When you call cons, Racket allocates a small chunk of memory, the cons cell, to hold
;;    references to the objects being linked.
;; A chain of cons cells and a list are exactly the same thing.

"Numbers"
(zero? 1)
(symbol=? 'foo 'FoO)
(expt 2 8)
(/ 4 6)
(/ 4.0 6)

"Strings"
"tutti frutti"
(string-append "tutti" " " "frutti")

"Cons cells"
(cons 1 2)
(define cell (cons 'a 'b))
(car cell)
(cdr cell)

"Empty lists"
'()
(list)

"List functions"
(cons 'chicken empty)
(cons 'pork '(beef chicken))
;;first: returns the first element of a list
(first (cons 'pork (cons 'beef (cons 'chicken empty))))
;;rest: returs the list without the first element
(rest (list 'pork 'beef 'chicken))
(first (rest '(pork beef chicken)))

"Structures"
(struct student (name id# dorm))
(define freshman1 (student 'Joe 1234 'NewHall))
(student-name freshman1)
(student-id# freshman1)
(student-dorm freshman1)

;; Creating instances of a struct
(define mimi (student 'Mimi 1234 'NewHall))
(define nicole (student 'Nicole 5678 'NewHall))
(define rose (student 'Rose 8765 'NewHall))
(define eric (student 'Eric 4321 'NewHall))

"Creating a list of a struct"
(define in-class (list mimi nicole rose eric))

"Geting info from a struct's field in a list"
(student-id# (third in-class))
(student-name (first in-class))

"Creating a struct of lists"
(struct student-body (freshmen sophomores juniors seniors))
(define all-students
  (student-body (list freshman1 (student 'Mary 0101 'OldHall))
                (list (student 'Jeff 5678'OldHall))
                (list (student 'Bob 4321 'Apartment))
                empty))

(student-name (first (student-body-juniors all-students)))
(student-name (first (student-body-freshmen all-students)))
(student-name (second (student-body-freshmen all-students)))
(student-name (first (student-body-sophomores all-students)))

"Looking inside the struct"
(struct example2 (p q r) #:transparent)
(define ex2 (example2 9 8 7))
ex2