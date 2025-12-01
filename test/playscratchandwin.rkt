

#lang racket

(require "scratchandwin.rkt")

(provide playgame)

;; (playgame n) draws as many cards as necessary to accumulate n
;;              distinct ones, and produces cardlist such that
;;              (collect-prize cardlist) produces 'prize

(define (playgame n) (expand-list-to-n empty n 1))

(define (expand-list-to-n list n iteration) (if (> iteration n) list (try-to-add-card (cons (drawcard n) list) list n iteration)))

(define (try-to-add-card list before-list n iteration) (if (valid list)
                                               (expand-list-to-n list n (add1 iteration)) ;; Go and add the next one
                                               (expand-list-to-n before-list n iteration))) ;; roll the dice again lmao

;; MY COLLECT PRIZE CODE BUT WITHOUT THE LENGTH LIMIT
;; valid: (listof Card) -> symbol
(define (valid cardlist) (cond
   [(empty? cardlist) true]
   [(is-fraud?
       (first (prize-list cardlist))
       (rest (prize-list cardlist)))
    false]
   [else true]))

;; prize-list (listof Card)
(define (prize-list cardlist)
   (map (λ (card) (car (scratch card)))
       cardlist))

;; is-fraud?: value (listof Any)s
(define (is-fraud? secret list)
  (cond [(eq? secret 'fraud) true]
        [(empty? list) false]
        [else (or
               (is-fraud? (first list) (rest list))
               (in-list? secret list))]))

;; in-list?: Any (listof Any) -> bool
(define (in-list? value list)
  (cond [(empty? list) false]
        [(eq? value (first list)) true]
        [else (in-list? value (rest list))]))