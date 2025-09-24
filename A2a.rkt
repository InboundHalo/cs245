;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname A2a) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; (define (k n) (if (= n 0) 1 (* n (k (- n 1)))))
;; n | steps
;; 0 | 3
;; 1 | 8
;; 2 | 13

(define (step-count-k n) (+ (* 5 n) 3))


;(define (l n) (if (= n 0) 1 (* n (l (- n 1)) (l (- n 1)))))
;; n | steps
;; 0 | 3
;; 1 | 12
;; 2 | 30
;; 3 | 66
;; 4 | 138

(check-expect (step-count-l 0) 3)
(check-expect (step-count-l 1) 12)
(check-expect (step-count-l 2) 30)
(check-expect (step-count-l 3) 66)
(check-expect (step-count-l 4) 138)
(define (step-count-l n) (- (* 9 (expt 2 n)) 6))

;(define (m n) (if (= n 0) 1 (* n (m (quotient n 2)))))
;; n | steps
;; 0 | 3
;; 1 | 8
;; 2 | 13
;; 3 | 13
;; 4 | 18

(check-expect (step-count-m 0) 3)
(check-expect (step-count-m 1) 8)
(check-expect (step-count-m 2) 13)
(check-expect (step-count-m 3) 13)
(check-expect (step-count-m 4) 18)
(define (step-count-m n) (if (= n 0) 3 (+ 5 (step-count-m (quotient n 2)))))


(define (step-count-n n) (step-count-m n))

;;(define (o n) (if (= n 0) 1 (* n (o (quotient n 2)) (o (quotient n 2)))))
;; n | steps
;; 0 | 3
;; 1 | 12
;; 2 | 30
;; 3 | 30
;; 4 | 66


(check-expect (step-count-o 0) 3)
(check-expect (step-count-o 1) 12)
(check-expect (step-count-o 2) 30)
(check-expect (step-count-o 3) 30)
(check-expect (step-count-o 4) 66)
(define (step-count-o n) (if (= n 0) 3 (+ 6 (* 2 (step-count-o (quotient n 2))))))