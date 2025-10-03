;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname A5b) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;(evens lst) which consumes a list of any type, and produces the list of all elements at "even" positions,
;assuming the first element in the list is at position 0. For example, (evens (list 0 1 2 3 4 5)) should produce (list 0 2 4).

;(check-expect (evens (list 0 1 2 3 4 5)) (list 0 2 4))
;(check-expect (evens empty) empty)
;; evens (listof Any) -> (listof Any)
(define (evens lst)
  (if (< (length lst) 2) empty (cons (first lst) (evens (rest (rest lst))))
      ))

;(interleave lst1 lst2) which consumes two lists of any type of element, and produces one list with all elements interleaved.
;For example, if (interleave (list 'a 6 "boo") (list 'b 'x 'blue 'seven 8), then the function should produce
;(list 'a 'b 6 'x "boo" 'blue 'seven 8).
;Observe that if there is a longer list between lst1 and lst2,
;the elements from the longer list are added at the end of the
;produced list.
(check-expect (interleave (list 'a 6 "boo") (list 'b 'x 'blue 'seven 8)) (list 'a 'b 6 'x "boo" 'blue 'seven 8))
;; interleave (listof Any) (listof Any) -> (listof Any)
(define (interleave lst1 lst2) (cond [(and (empty? lst1) (empty? lst2)) empty]
                                     [(empty? lst1) lst2]
                                     [(empty? lst2) lst1]
                                     [else (interleave-1 lst1 lst2 empty)]))

;; Only gets called if lst1 has a length > 0
(define (interleave-1 lst1 lst2 lst)
  (if (empty? lst2) (combine-list lst lst1)
      (interleave-2 (rest lst1) lst2 (cons lst (first lst1)))))
;; Only gets called if lst2 has a length > 0
(define (interleave-2 lst1 lst2 lst)
  (if (empty? lst1) (combine-list lst lst2)
      (interleave-1 lst1 (rest lst2) (cons lst (first lst2)))))

; Puts list1 first then list2
(define (combine-list lst1 lst2) (if (<= (length lst2) 1) lst1 (combine-list (cons (first lst2) lst1) (rest lst2))))