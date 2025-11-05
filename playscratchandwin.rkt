#lang racket

(require "scratchandwin.rkt")

(provide playgame)

(define (playgame n) (expand-list-to-n empty n (build-list n add1)))

(define (expand-list-to-n list n numbers-not-done) (cond [(empty? numbers-not-done) list]
                                                  [else (dont-do-work-twice list n (generate-card-with empty n numbers-not-done))]))

(define (dont-do-work-twice list n list2) (expand-list-to-n (cons (first list2) list) n (rest list2)))

(define (generate-card-with card n numbers-not-done) (cond [(empty? card) (generate-card-with (drawcard n) n numbers-not-done)]
                                                           [(member (first (scratch card)) numbers-not-done)
                                                            (cons card
                                                             (remove (first (scratch card))
                                                                     numbers-not-done))]
                                                           [(generate-card-with (drawcard n) n numbers-not-done)]))

