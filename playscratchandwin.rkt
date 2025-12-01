#lang racket

(require "scratchandwin.rkt")
(require "avl-cs145.rkt")

(provide playgame)

(define (playgame n) (expand-list-to-n empty n empty))

(define (expand-list-to-n list n numbers-done) (cond [(= (sizeavl numbers-done) n) list]
                                                  [else (dont-do-work-twice list n (generate-card-with n numbers-done))]))

(define (dont-do-work-twice list n list2) (expand-list-to-n (cons (first list2) list) n (second list2)))

(define (generate-card-with n numbers-done) (local [
                                                    (define card (drawcard n))
                                                    (define new-avl (insertavl numbers-done (first (scratch card))))]
  (cond [(= (sizeavl numbers-done) (sizeavl new-avl)) (generate-card-with n numbers-done)]
        [else (list card new-avl)])))