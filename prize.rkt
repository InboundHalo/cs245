#lang racket

(require "scratchandwin.rkt")

(provide collect-prize)

 ;; (collect-prize cardlist) consumes a list of n cards, each created by (drawcard n),
  ;;                  where each card has a distinct secret number.  Produces 'prize
  ;;                  if cardlist is correct.  For any other input, regardless of
  ;;                  what it is, produces 'fraud.  That is, 
;; if cardlist is not a list,
  ;;                  or does not contain n elements, or the elements are not produced
  ;;                  by (drawcard n), or the secret numbers are not distinct.
;; for each element in the list
;; scratch if `fraud then return `fraud else store the secret value in a list
;; for each value in list of secrets check every other value infront of it
;; if any are the same return `fraud

;; collect-prize: (listof Card) -> symbol
(define (collect-prize cardlist) (local [(define n (length cardlist))] (cond [(not (list? cardlist)) `frauda]
                                       [(not (foldr (λ (a b) (and a (pair? (scratch b)) (= (second (scratch b)) n))) true cardlist)) `fraudb]
                                       [(contains-douplicates (sort (map (λ (a) (first (scratch a))) cardlist) (λ (a b) (< a b)))) `fraudc]
                                       [else 'prize])))

(define (contains-douplicates list)
  (cond [(or (empty? list) (empty? (rest list))) false]
        [(= (first list) (second list)) true]
        [else (contains-douplicates (rest list))]))

(define a (drawcard 2))
(scratch a)

(define b (drawcard 2))
(scratch b)

(collect-prize (list a b))