;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname A2c) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Write the Racket function coprime?
;; which consumes two positive integers and produces true if they are co-prime and false otherwise.
;; Two numbers are said to be co-prime if they do not share any common factors.
;; For example, 3 and 4 are co-prime, but 15 and 20 are not coprime.
;; Using check-expect, give two examples (other than the two given in this question)
;; along with at least 4 tests per function(including helper functions) to give some evidence that your code is working correctly.
;; Note that the built in gcd function in racket is disallowed for this question, and marmoset is configured to not accept any
;; solutions which use it.

(check-expect (coprime? 3 4) true)
(check-expect (coprime? 15 20) false)
(check-expect (coprime? 8 9) true)
(check-expect (coprime? 6 9) false)
(define (coprime? number1 number2)
  (check-coprime number1 number2 2)
  )

(check-expect (check-coprime 3 4 2) true)
(check-expect (check-coprime 15 20 6) true) ;; there should not be a common factor after 5
(check-expect (check-coprime 8 9 2) true)
(check-expect (check-coprime 6 9 3) false)
;; factor-to-check must be > 1 and < both number1 & number2
(define (check-coprime number1 number2 factor-to-check)
  (if (or (= factor-to-check number1) (= factor-to-check number2)) true
      (if (and (divides-number number1 factor-to-check) (divides-number number2 factor-to-check)) false
          (check-coprime number1 number2 (add1 factor-to-check))
      )))

(check-expect (divides-number 4 2) true)
(check-expect (divides-number 3 2) false)
(check-expect (divides-number 5 2) false)
(check-expect (divides-number 16 4) true)
(define (divides-number number dividor) (= (remainder number dividor) 0))