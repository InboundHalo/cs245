#lang racket

(require "lambda-interp.rkt")

(define-struct Var (id) #:transparent)
(define-struct App (fst snd) #:transparent)
(define-struct Abs (par bdy) #:transparent)

(define (uncurried-eval sexp)
  (match sexp
    ;; Parse (λ (x y) x)
    [`(λ (,xs ...) ,y)
     (foldr (lambda (x acc) (Abs x acc)) 
            (uncurried-eval y) 
            xs)]
    
    ;; Parse ((...) x y)
    [`(,function ,args ...)
     (foldl (lambda (arg acc) (App acc (uncurried-eval arg))) 
            (uncurried-eval function) 
            args)]
    
    [x (Var x)]))

(define (reduce ast)
  (print "ast: ") (println ast)
  (match ast
    ;; TODO
    [x x]
    ))

(define (lambda-print ast)
  (match ast
    [(App fst snd) (list (lambda-print fst) (lambda-print snd))]
    [(Abs par bdy) (list 'λ (list par) (lambda-print bdy))]
    [(Var id) id]))

(uncurried-eval '((λ (x y) x) a b))
(lambda-print (uncurried-eval '((λ (x y) x) a b)))
(println "-")
(reduce (uncurried-eval '((λ (x y) x) a b)))
;;(println "-")
;;(lambda-print(reduce (uncurried-eval '((λ (x y) x) a b))))