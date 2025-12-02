#lang racket

(require "lambda-interp.rkt")

(define (uncurried-eval sexp)
  (match sexp
    [`(,function ,args ...)
     (foldl (lambda (arg acc) (App acc (parse arg))) 
            (parse function) 
            args)]))

(define (lambda-print ast)
  (match ast
    [(App fst snd) (list (lambda-print fst) (lambda-print snd))]
    [(Abs par bdy) (list 'λ (list par) (lambda-print bdy))]
    [(Var id) id]))

(lambda-print (uncurried-eval '((λ (x y) x) a b)))