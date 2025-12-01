#lang racket

(require "generate.rkt")

(provide my-sort)

;; [ 1 4 5 9 3 8 ]
;; [ 1 ] [ 4 ] [ 5 ] [ 9 ] [ 3 ] [ 8 ]
;; [ 1 4 ] [ 5 9 ] [ 3 8 ]
;; 1 < 5 | 4 < 5
;; [ 1 4 5 9 ] [ 3 8 ]

(define (my-sort l <) (generate (list l empty)
                                (λ(x) (empty? (first x)))
                                (λ(x) (list (rest (first x)) (cons (list (first (first x))) (second x))))
                                (λ(x) (bottom-up (second x) <))))

;; l is list of lists of numbers
(define (bottom-up l <) (generate l
                                  (λ(x) (empty? (rest x)))
                                  (λ(x) (bottom-up-step x <))
                                  (λ(x) (first x))))

;; l is list of lists of numbers
(define (bottom-up-step l <) (generate (list l empty)
                                  (λ(x) (empty? (first x)))
                                  (λ(x) (if (empty? (rest (first x))) (list empty (cons (first (first x)) (second x)))
                                            (list (rest (rest (first x))) (cons (combine-two-sorted-lists (first (first x)) (first (rest (first x))) <) (second x)))))
                                  (λ(x) (second x))))

(define (combine-two-sorted-lists l1 l2 <) (generate (list l1 l2 empty)
                                      (λ(x) (and (empty? (first x)) (empty? (second x))))
                                      (λ(x) (if
                                                   (and (not (empty? (first x)))
                                                        (or (empty? (second x))
                                                            (< (first (first x)) (first (second x))))) (list (rest (first x)) (second x) (cons (first (first x)) (third x)))
                                                                                                   (list (first x) (rest (second x)) (cons (first (second x)) (third x)))))
                                      (λ(x) (reverse (third x)))))