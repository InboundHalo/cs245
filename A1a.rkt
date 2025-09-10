;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname A1a) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (median x y z) (cond
  [(is_median x y z) y]
  [(is_median y x z) x]
  [(is_median y z x) z]))

;; checks if the number in the middle is the median
(define (is_median x y z)
  (or
   (and (<= y z) (<= x y))
   (and (>= y z) (>= x y))
  )
)