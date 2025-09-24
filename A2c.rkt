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
  (= (greatest-common-denominator number1 number2) 1)
  )

(check-expect (greatest-common-denominator 3 4) 1)
(check-expect (greatest-common-denominator 15 20) 5)
(check-expect (greatest-common-denominator 8 9) 1)
(check-expect (greatest-common-denominator 6 9) 3)
;; Euclid's algorithm
(define (greatest-common-denominator number1 number2)
  (if (= number2 0) number1 (greatest-common-denominator number2 (remainder number1 number2))))
