#lang racket


(require "generate.rkt")

(define (traverse t) (generate
                      (list t empty empty)
                      (lambda (x) (and (empty? (first x)) (empty? (second x))))
                      (lambda (x)
                        (if (not (empty? (first x)))
                            (list (bt-left (first x))
                                  (cons (first x) (second x))
                                  (third x))
                            (list (bt-right (first (second x)))
                                  (rest (second x))
                                  (cons (bt-dec (first (second x))) (third x)))))
                      (lambda (x)
                        (reverse (third x)))))