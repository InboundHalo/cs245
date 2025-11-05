#lang racket

(provide drawcard scratch)

;; card: nat -> card
(define-struct card (max-value secret))

;; drawcard: nat -> card
(define (drawcard n) (make-card n (add1 (random n))))

;; scratch: card -> `(nat nat) or `fraud
(define (scratch card) (if (and (not (empty? card))
                                (card? card) (<= (card-secret card) (card-max-value card)))
                           (list (card-secret card)
                                 (card-max-value card))
                           'fraud))