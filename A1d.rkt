;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname A1d) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; (if (< (remainder 7757225868570123054024343915246065944579 1024) 512) (+ 1 2) (+ (+ 1 2) 3))
;; 4

(define step-count-f 4)

(define (g x) (if (< (remainder x 1024) 512) (+ 1 2) (+ (+ 1 2) 3)))


;; (g 7699365731799201686307097748709625820059)
;; 6
(define step-count-g 6)

(define (steps-in-iteration-of-g iteration) (cond [(< (remainder iteration 1024) 512) 5] [else 6]))

(define (steps-in-g iteration total-steps) (cond [(= iteration 0) total-steps]
                                                 [else (steps-in-g (- iteration 1) (+ (steps-in-iteration-of-g iteration) total-steps))]))
(define step-count-h (/ (steps-in-g 1000000 0) 1000000))

(define step-count-i (/ (+ 5 6) 2))
(define step-count-j
  (+
  ;; - number's remainder will be < 512
  (/ 5 2)
  (/ step-count-i 2)
  )
)
