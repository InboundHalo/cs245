;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname A3a) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct thing (a b))
(define u (make-thing 1 2))
(define v (make-thing (make-thing (make-thing 1 2) (make-thing 3 4))  
                      (make-thing (make-thing 5 6) (make-thing 7 8))))
(define w (make-thing 
           (make-thing 
            (make-thing 
             (make-thing 
              (make-thing 
               (make-thing 
                (make-thing 1 2) 3) 4) 5) 6) 7) 8))

(check-expect (sum-thing (+ 20 22)) 42)
(check-expect (sum-thing u) 3)
(check-expect (sum-thing w) 36)
(check-expect (sum-thing v) 36)
(define (sum-thing input) (if (thing? input) (+ (sum-thing (thing-a input)) (sum-thing (thing-b input))) input))
(check-expect (sum-thing (build-thing 1 256)) (sum-thing (build-thing-or-number 256)))


(check-expect (build-thing 1 8) w)
(define (build-thing from to) (build-thing-helper (+ from 2) to (make-thing from (add1 from))))

(define (build-thing-helper current-number number-to-go-to thing-being-made)
  (if (> current-number number-to-go-to) thing-being-made
    (build-thing-helper (add1 current-number) number-to-go-to (make-thing thing-being-made current-number))
   ))


(check-expect (build-thing-or-number 8) v)
(check-expect (build-thing-or-number 1) 1)
(define (build-thing-or-number number)
  (if (= number 1) 1
    (build-compact-thing 1 number)
  ))

(define (build-compact-thing low high)
  (if (= (add1 low) high) (make-thing low high)
      (call-helper-build-compact-thing low high (/ (+ low high) 2))
  ))

(define (call-helper-build-compact-thing low high mid)
  (make-thing (build-compact-thing low (- mid 0.5)) (build-compact-thing (+ mid 0.5) high))
  )


