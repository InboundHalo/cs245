#lang racket

(define-struct baexp (op arg1 arg2) #:transparent)
(define-struct App (fst snd) #:transparent)
(define-struct Abs (par bdy) #:transparent)



(define (parse exp)
  (match exp
    ;; Abs
    [`(λ (,x) ,y) (Abs x (parse y))]
    [`(lambda (,x) ,y) (Abs x (parse y))]
    ;; App
    [`(,x ,y) (App x (parse y))]
    ;;
    
    [(list op arg1 arg2) (make-baexp op (parse arg1) (parse arg2))]
    [num num]))