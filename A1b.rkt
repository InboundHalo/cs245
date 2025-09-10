;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname A1b) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; six numbers x1, y1, x2, y2,x3, y3, where (x1, y1), (x2, y2) and (x3, y3) are distinct points on the Cartesian plane
;; will return true if all points fall in the same line
(define (collinear x1 y1 x2 y2 x3 y3) (= (slope x1 y1 x2 y2) (slope x2 y2 x3 y3)))

;; returns the slope of a line
(define (slope x1 y1 x2 y2) (/(- x2 x1) (- y2 y1)))
