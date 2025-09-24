;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname A3b) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct node (left right))

;; For testing
(define empty-node (make-node empty empty))
(define right-node (make-node empty empty-node))
(define left-node (make-node empty-node empty))
(define full-node (make-node empty-node empty-node))


(check-expect (tree-similar? empty-node empty-node) true)
(check-expect (tree-similar? empty-node full-node) false)
(check-expect (tree-similar? full-node empty-node) false)
(check-expect (tree-similar? full-node full-node) true)
(define (tree-similar? tree1 tree2)
  (cond [(tree-xnor tree1 tree2) true]
        [(not (and (node? tree1) (node? tree2))) false]
        [else (and (tree-similar? (node-left tree1) (node-right tree1)) (tree-similar? (node-left tree2) (node-right tree2)))]
        ))

(check-expect (tree-xnor empty-node empty-node) true)
(check-expect (tree-xnor empty-node full-node) false)
(check-expect (tree-xnor full-node empty-node) false)
(check-expect (tree-xnor full-node full-node) true)
(define (tree-xnor tree1 tree2) (xnor (is-tree-empty tree1) (is-tree-empty tree2)))

(check-expect (xnor true true) true)
(check-expect (xnor false false) true)
(check-expect (xnor true false) false)
(check-expect (xnor false true) false)
(define (xnor bool1 bool2)
  (cond [(and bool1 bool2) true]
        [(and (not bool1) (not bool2)) true]
        [else false]
        ))

(check-expect (is-tree-empty empty-node) true)
(check-expect (is-tree-empty right-node) false)
(check-expect (is-tree-empty left-node) false)
(check-expect (is-tree-empty full-node) false)
(define (is-tree-empty tree) (if (empty? tree) true (and (empty? (node-left tree)) (empty? (node-right tree)))))




;(define (tree- tree) 