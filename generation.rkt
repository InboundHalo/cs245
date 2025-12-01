#lang racket

(require "generate.rkt")

(provide generate prime? my-build-list my-foldl my-insert my-insertion-sort)

;; (prime? n) returns true if a non-negative integer n is prime; otherwise false. Running time must be O(sqrt n).
;; (my-build-list n f) has the same result and running time as (build-list n f). You may not use build-list.
;; (my-foldl f z l) has the same result and running time as (foldl f z l). You must not use foldl or foldr.
;; (my-insert e l <) inserts e into a nondecreasing list l. The running time must be O(length l).
;; Hint: You may use reverse but use caution as the running time of (reverse l) is O(length l).
;; (my-insertion-sort l <) has the same result as (sort l <) and running time O((length l)^2). You must not use sort or quicksort. You may use my-insert.

(define (prime? n) (generate
                    2
                    (λ(x) (or (> (* x x) n) (= 0 (remainder n x))))
                    (λ(x) (add1 x))
                    (λ(x) (and (>= n 2) (> (* x x) n)))
                    ))

(define (my-build-list n f) (generate
                             (list 0 empty)
                             (λ(x) (= (first x) n))
                             (λ(x) (list (add1 (first x)) (cons (f (first x)) (second x))))
                             (λ(x) (reverse (second x)))))

(define (my-foldl f z l) (generate (cons z l)
                                   (λ(x) (empty? (rest x)))
                                   (λ(x) (cons (f (second x) (first x)) (rest (rest x))))
                                   (λ(x) (first x))))

(define (my-insert e l <) (generate (list l empty) ;; l is old list empty is new list
                                    (λ(x) (empty? (first x)))
                                    (λ(x) (if (and (< e (first (first x))) (or (empty? (second x)) (not (< e (first (second x))))))
                                              (list (rest (first x)) (cons (first (first x))
                                                                           (cons e (second x))))
                                              (list (rest (first x)) (cons (first (first x)) (second x)))))
                                          ;; | At this point the list should be in reverse sorted order so lets fix that :)
                                    (λ(x) (reverse (if (= (length l) (length (second x)));; Fixes the problem if e is the largest element in l
                                                       (cons e (second x))
                                                       (second x))))))


(define (my-insertion-sort l <) (generate (list l empty) ;; l is unsorted empty is the sorted list
                                          (λ(x) (empty? (first x)))
                                          (λ(x) (list (rest (first x)) (my-insert (first (first x)) (second x) <)))
                                          (λ(x) (second x))
                                          ))