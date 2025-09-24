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
  (cond [(are-both-trees-empty tree1 tree2) true]
        [(are-both-trees-full tree1 tree2) (and (tree-similar? (node-left tree1) (node-left tree2)) (tree-similar? (node-right tree1) (node-right tree2)))]
        [else false]
        ))


(check-expect (are-both-trees-empty empty-node empty-node) true)
(check-expect (are-both-trees-empty empty-node full-node) false)
(check-expect (are-both-trees-empty full-node empty-node) false)
(check-expect (are-both-trees-empty full-node full-node) false)
(define (are-both-trees-empty tree1 tree2) (and (is-tree-empty tree1) (is-tree-empty tree2)))

(check-expect (is-tree-empty empty-node) true)
(check-expect (is-tree-empty right-node) false)
(check-expect (is-tree-empty left-node) false)
(check-expect (is-tree-empty full-node) false)
(define (is-tree-empty tree) (and (empty? (node-left tree)) (empty? (node-right tree))))

(check-expect (are-both-trees-full empty-node empty-node) false)
(check-expect (are-both-trees-full empty-node full-node) false)
(check-expect (are-both-trees-full full-node empty-node) false)
(check-expect (are-both-trees-full full-node full-node) true)
(define (are-both-trees-full tree1 tree2) (and (not (is-tree-empty tree1)) (not (is-tree-empty tree2))))




(check-expect (tree-create 3) (make-node (make-node (make-node empty empty) empty) empty))
(check-expect (tree-create 2) (make-node (make-node empty empty) empty))
(check-expect (tree-create 1) (make-node empty empty))
(define (tree-create n) (tree-create-help n empty-node))

(define (tree-create-help nodes current-tree)
  (if (= nodes 1) current-tree
      (tree-create-help (sub1 nodes) (make-node current-tree empty))
      ))



(check-expect (tree-create-c 3) (make-node empty (make-node empty (make-node empty empty))))
(check-expect (tree-create-c 2) (make-node empty (make-node empty empty)))
(check-expect (tree-create-c 1) (make-node empty empty))
(define (tree-create-c n) (tree-create-c-help n empty-node))

(define (tree-create-c-help nodes current-tree)
  (if (= nodes 1) current-tree
      (tree-create-c-help (sub1 nodes) (make-node empty current-tree))
      ))



(check-expect (tree-create-d 3) (make-node (make-node empty (make-node empty empty)) empty))
(check-expect (tree-create-d 2) (make-node (make-node empty empty) empty))
(check-expect (tree-create-d 1) (make-node empty empty))
(define (tree-create-d n) (tree-create-d-help n empty-node))

(define (tree-create-d-help nodes current-tree)
  (cond [(= nodes 1) current-tree]
        [(even? nodes) (tree-create-d-help (sub1 nodes) (make-node current-tree empty))]
        [else (tree-create-d-help (sub1 nodes) (make-node empty current-tree))]
      ))

