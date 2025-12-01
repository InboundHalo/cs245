#lang lazy

  ;; And 
  (λ(a b) ((;; Not And
            ((((a b) False) False) True)
            ;; Or
            ((a True) b)) False))


