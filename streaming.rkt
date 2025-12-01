#lang racket

(require "stream.rkt")
(provide stream-map)

(define (stream-map fn s) (stream-generate s
                                           (λ (x) (stream-empty? x))
                                           (λ (x) (stream-rest x))
                                           (λ (x) (fn (stream-first x)))))