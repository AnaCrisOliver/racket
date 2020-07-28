#lang racket
;; chapter 4 1/2

"Definitions"
"module-level definitions"
;; they are names that can be accessed anywhere in the module
"Variable Definitions"
(define WIDTH 100)
(define HEIGHT 200)
;; we use uppercase for the names of module-level definitions
(define X-CENTER (quotient WIDTH 2))
(define Y-CENTER (quotient HEIGHT 2))
;; To check that the constant is always appropriate, we can
;;     provide a section of code below the constant definition
;;     that will raise an error if the value we have provided is inappropriate:
(unless (> HEIGHT 0)
  (error 'guess-my-number "HEIGHT may not be negative"))

"Function Definitions"
(define SQR-COLOR "red")
(define SQR-SIZE 10)
(define (draw-square img x y)
  (place-image (square SQR-SIZE "solid" SQR-COLOR)
               x y
               img))
"Local Definitions"
#|These definitions exist only within the
pair of parentheses in which they are defined and cannot be
accessed anywhere else.|#

(struct posn (x y))
(struct rectangle (width height))
(define (inside-of-rectangle? r p)
  (define x (posn-x p))
  (define y (posn-y p))
  (define width (rectangle-width r))
  (define height (rectangle-height r))
  (and (<= 0 x) (< x width) (<= 0 y) (< y height)))

;;Local definitions even work within a cond:
(define (random-stars n)
  (cond
    [(zero? n) '()]
    [else (define location (random-location 200 300))
          (if (inside-moon? location)
              (random-stars n)
              (cons location (random-stars (sub1 n))))]))