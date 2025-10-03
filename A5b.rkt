;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname A5b) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;(evens lst) which consumes a list of any type, and produces the list of all elements at "even" positions,
;assuming the first element in the list is at position 0. For example, (evens (list 0 1 2 3 4 5)) should produce (list 0 2 4).

(check-expect (evens (list 0 1 2 3 4 5)) (list 0 2 4))
(check-expect (evens empty) empty)
(define (evens lst)
  (if (< (length lst) 2) empty (cons (first lst) (evens (rest (rest lst))))
  ))

;(interleave lst1 lst2) which consumes two lists of any type of element, and produces one list with all elements interleaved.
;For example, if (interleave (list 'a 6 "boo") (list 'b 'x 'blue 'seven 8), then the function should produce
;(list 'a 'b 6 'x "boo" 'blue 'seven 8). Observe that if there is a longer list between lst1 and lst2, the elements from the longer list are added at the end of the produced list.