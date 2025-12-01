#lang racket

(require "total-order.rkt")
(require "ordered-set.rkt")
(require "stream.rkt")

(provide count)
;; (stream-generate initial done? step final)
(define (count s)
  (stream-generate
   (list s os-empty) done?
   (λ (st) (define st2 (step st)) (list (first st2) (second st2)))
   (lambda (st) (define st2 (step st)) (final-out st2))))