;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname A5a) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct node (left right key))
;; A BST is either:
;;  * empty, or 
;;  * (make-node BST BST Int) such that:
;;       - all the keys in left are less than key
;;       - all the keys in right are greater than key
;;       - left and right are both BSTs

(check-expect (take (list 1 2 3 4 5 6 7) 3) (list 1 2 3))
(check-expect (take (list 1 5 2 4 5 6 7) 3) (list 1 5 2))

(define (take lst n) (take-helper lst n empty))

(define (take-helper lst n output) (cond
                                     [(= n 0) output]
                                     [else (take-helper (rest lst) (sub1 n) (cons (first lst) output))]
                                     ))

;; add the first number to a list. Then continue until we are out of numbers to add

