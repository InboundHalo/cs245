;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname A2b) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; (define (k n) (if (= n 0) 1 (* n (k (- n 1)))))
;; n | steps
;; 0 | 3
;; 1 | 8
;; 2 | 13

(define (A2a-step-count-k n) (+ (* 5 n) 3))


;(define (l n) (if (= n 0) 1 (* n (l (- n 1)) (l (- n 1)))))
;; n | steps
;; 0 | 3
;; 1 | 12
;; 2 | 30
;; 3 | 66
;; 4 | 138

(define (A2a-step-count-l n) (- (* 9 (expt 2 n)) 6))

;(define (m n) (if (= n 0) 1 (* n (m (quotient n 2)))))
;; n | steps
;; 0 | 3
;; 1 | 8
;; 2 | 13
;; 3 | 13
;; 4 | 18

(define (A2a-step-count-m n) (if (= n 0) 3 (+ 5 (A2a-step-count-m (quotient n 2)))))


(define (A2a-step-count-n n) (A2a-step-count-m n))

;;(define (o n) (if (= n 0) 1 (* n (o (quotient n 2)) (o (quotient n 2)))))
;; n | steps
;; 0 | 3
;; 1 | 12
;; 2 | 30
;; 3 | 30
;; 4 | 66


(define (A2a-step-count-o n) (if (= n 0) 3 (+ 6 (* 2 (A2a-step-count-o (quotient n 2))))))

(define (fib n) (if (< n 2) n (+ (fib (- n 1)) (fib (- n 2)))))
;; n | steps
;; 0 | 3
;; 1 | 3
;; 2 | 12
;; 3 | 21
;; 4 | 39

(define (step-count-fib n) (if (< n 2) 3 (+ 6 (step-count-fib (- n 1)) (step-count-fib (- n 2)))))

(define (compare-numbers number1 number2) (cond
                                            [(<  number1 number2) 'fewer]
                                            [(>  number1 number2) 'more]
                                            [(=  number1 number2) 'same]
                                            ))

(define (compare-steps-k n) (compare-numbers (step-count-fib n) (A2a-step-count-k n)))
(define (compare-steps-l n) (compare-numbers (step-count-fib n) (A2a-step-count-l n)))
(define (compare-steps-m n) (compare-numbers (step-count-fib n) (A2a-step-count-m n)))
(define (compare-steps-n n) (compare-numbers (step-count-fib n) (A2a-step-count-n n)))
(define (compare-steps-o n) (compare-numbers (step-count-fib n) (A2a-step-count-o n)))

(define (step-count-t n) (+ (* 5 n) 4))