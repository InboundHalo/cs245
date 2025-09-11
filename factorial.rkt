;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname factorial) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Examples
(check-expect (fact 0) 1)
(check-expect (fact 1) 1)
(check-expect (fact 2) 2)
(define (fact n)
  (cond
    [(zero? n) 1]
    [else (* n (fact (sub1 n)))]))
;; Tests
(check-expect (fact 2) 2)
