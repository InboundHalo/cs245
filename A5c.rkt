;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname A5c) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct node (left right key))
;; A BST is either:
;;  * empty, or 
;;  * (make-node BST BST Int) such that:
;;       - all the keys in left are less than key
;;       - all the keys in right are greater than key
;;       - left and right are both BSTs

(define (empty-bst v) (make-node empty empty v))
(define invalid-bst (make-node (empty-bst 5) (empty-bst 3) 4))
(define valid-bst (make-node (empty-bst 3) (empty-bst 5) 4))
(check-expect (bst? valid-bst) true)
(check-expect (bst? invalid-bst) false)
(check-expect (bst? (empty-bst 4)) true)

;(bst? t) that consumes any type of element and produces true if t is a BST, and false otherwise.
;; bst?: bst -> bool
(define (bst? t)
  (cond [(empty? t) true]
        [(not (node? t)) false]
        [else (and (bst-left? (node-left t) (node-key t)) (bst-right? (node-right t) (node-key t)))]))

;; bst-left?: bst int -> bool
(define (bst-left? t v)
  (cond [(empty? t) true]
        [(not (node? t)) false]
        [(> (node-key t) v) false]
        [else (and (bst-left? (node-left t) (node-key t)) (bst-right? (node-right t) (node-key t)))]))

;; bst-right?: bst int -> bool
(define (bst-right? t v)
  (cond [(empty? t) true]
        [(not (node? t)) false]
        [(< (node-key t) v) false]
        [else (and (bst-left? (node-left t) (node-key t)) (bst-right? (node-right t) (node-key t)))]))


;(full? t) which consumes a bst t and produces true if t is full. Recall that a full binary tree has every node has zero or two children.
;; full?: bst -> bool
(define (full? t) (cond [(empty? t) true]
                        [(and (not (empty? (node-right t))) (not (empty? (node-left t)))) (and (full? (node-right t)) (full? (node-right t)))]
                        [else false]))

;(perfect? t) which consumes a bst t and produces true if t is perfect. Recall that a perfect tree is defined as the largest possible minimal height tree, for a given height.
;; perfect?: bst -> bool
(define (perfect? t) (and (full? t) (balanced? t)))

;(balanced? t) which consumes a bst t and produces true if t is balanced. For this assignment we consider a tree to be balanced if its left and right subtrees are balanced, and the number of elements in the left and right subtrees differ by at most 1.
(define (balanced? t) (if (empty? t) true
                          (<= (abs (- (size? (node-left t)) (size? (node-right t)))) 1)))

;; size?: bst -> int
(define (size? t) (cond [(empty? t) 0]
                        [(and (not (empty? (node-right t))) (not (empty? (node-left t)))) (+ 1 (size? (node-left t)) (size? (node-right t)))]
                        [(empty? (node-right t)) (+ 1 (size? (node-left t)))]
                        [(empty? (node-left t)) (+ 1 (size? (node-right t)))]
                        [else 1]))


