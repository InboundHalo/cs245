;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname sumto) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(check-expect (sumto 0) 0)
(check-expect (sumto 5) 15)
(define (sumto n)
  (cond
    [(zero? n) 0]
    [else (+ n (sumto (sub1 n)))]))
