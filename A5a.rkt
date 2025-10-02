;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname A5a) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(check-expect (take (list 1 2 3 4 5 6 7) 0) empty)
(check-expect (take (list 1 2 3 4 5 6 7) 3) (list 1 2 3))
(check-expect (take (list 1 5 2 4 5 6 7) 3) (list 1 5 2))
(check-expect (take (list 1 2 3) 4) (list 1 2 3))
;; take: (listof Any) Nat -> (listof Any)
(define (take lst n) (cond
                       [(<= n 0) empty]
                       [(empty? lst) empty]
                       [else (cons (first lst) (take (rest lst) (sub1 n)))]
                       ))

(check-expect (drop (list 1 2 3 4 5 6 7) 0) (list 1 2 3 4 5 6 7))
(check-expect (drop (list 1 2 3 4 5 6 7) 1) (list 2 3 4 5 6 7))
(check-expect (drop (list 1 2 3 4 5 6 7) 3) (list 4 5 6 7))
(check-expect (drop (list 1 5 2 4 5 6 7) 3) (list 4 5 6 7))
(check-expect (drop (list 1 2 3) 4) empty)
;; drop (listof Any) Nat -> (listof Any)
(define (drop lst n) (cond [(= n 0) lst]
                           [(empty? lst) empty]
                           [else (drop (rest lst) (sub1 n))]))
