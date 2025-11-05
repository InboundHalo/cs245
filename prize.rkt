#lang racket

(require "scratchandwin.rkt")

(provide collect-prize)

 ;; (collect-prize cardlist) consumes a list of n cards, each created by (drawcard n),
  ;;                  where each card has a distinct secret number.  Produces 'prize
  ;;                  if cardlist is correct.  For any other input, regardless of
  ;;                  what it is, produces 'fraud.  That is, if cardlist is not a list,
  ;;                  or does not contain n elements, or the elements are not produced
  ;;                  by (drawcard n), or the secret numbers are not distinct.

;; for each element in the list
;; scratch if `fraud then return `fraud else store the secret value in a list
;; for each value in list of secrets check every other value infront of it
;; if any are the same return `fraud



;; collect-prize: (listof Card) -> symbol
(define (collect-prize cardlist) (cond
   [(empty? cardlist) 'prize]
   [(is-fraud?
       (first (prize-list cardlist))
       (rest (prize-list cardlist)))
    'fraud]
   [(under-max-nat (length cardlist) cardlist) 'prize]
   [else 'fraud]))

(define (under-max-nat max list) (cond [(empty? list) true]
                                       [(<= (second (scratch (first list))) max) (under-max-nat max (rest list))]
                                       [else false]))
;; prize-list (listof Card)
(define (prize-list cardlist)
  (if (list? cardlist) (map (λ (card) (if (pair? (scratch card)) (car (scratch card)) 'fraud))
       cardlist) (list 'fraud)))
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