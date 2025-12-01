#lang lazy

(Y (λ (add1)
                  (λ (x)
                    (If (Z? x)
                        (Cons True Z)
                        (If (First x)
                            (Cons False (add1 (Rest x)))
                            (Cons True (Rest x)))))))
