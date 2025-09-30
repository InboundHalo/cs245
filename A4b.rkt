;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname A4b) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct node (left right key))

(define empty-node-5 (make-node empty empty 5))
(define empty-node-4 (make-node empty empty 4))
(check-expect (insert-bst empty-node-5 5) empty-node-5)
(check-expect (insert-bst empty-node-5 4) (make-node (make-node '() '() 4) '() 5))
(check-expect (insert-bst empty-node-5 6) (make-node '() (make-node '() '() 6) 5))

;; bst t and a number n.
;; If n is contained in t, insert-bst should return t.
;; If n is not contained in t, insert-bst should return a bst containing every number contained in t, and also n.
;; The number of steps to evaluate (insert-bst t n) should be linear in the height of t.
(define (insert-bst t n)
  (cond [(empty? t) (make-node empty empty n)]
        [(= (node-key t) n) t]
        [(> (node-key t) n)
         (if (empty? (node-left t))
             (make-node (make-node empty empty n) (node-right t) (node-key t)) ;; insert n in node
             (make-node (insert-bst (node-left t) n) (node-right t) (node-key t)) ;; call insert-bst and set the current node to it's result
             )]
        [else ;; <
         (if (empty? (node-right t))
             (make-node (node-left t) (make-node empty empty n) (node-key t)) ;; insert n in node
             (make-node (node-right t) (insert-bst (node-right t) n) (node-key t)) ;; call insert-bst and set the current node to it's result
             )]
        )
  )


;; bst t and a number n.
;; If n is not contained in t, delete-bst should return t.
;; If n is contained in t, delete-bst should return a bst containing every number contained in t, except n.
;; The number of steps to evaluate (delete-bst t n) should be linear in the height of t.
(define (delete-bst t n)
  (cond [(= (node-key t) n)
         (cond
           [(and (empty? (node-left t)) (empty? (node-right t))) empty]
           [(empty? (node-left t)) (node-right t)]
           [(empty? (node-right t)) (node-left t)]
           [else (make-node (delete-bst (node-left t) (highest-value-bst (node-left t))) (node-right t) (highest-value-bst (node-left t)))] ;; TODO 
           )]
        [(> (node-key t) n)
         (if (empty? (node-left t))
             t
             (make-node (insert-bst (node-left t) n) (node-right t) (node-key t)) ;; call insert-bst and set the current node to it's result
             )]
        [else ;; <
         (if (empty? (node-right t))
             t
             (make-node (node-right t) (insert-bst (node-right t) n) (node-key t)) ;; call insert-bst and set the current node to it's result
             )]
            
        )
  )

(define (highest-value-bst t)
  (if (empty? (node-right t)) (node-key t) (highest-value-bst (node-right t)))
  )

(check-expect (combine-bst empty-node-5 empty-node-4) (combine-bst empty-node-4 empty-node-5))
(check-expect (combine-bst empty-node-5 empty-node-4) (insert-bst empty-node-5 4))
(check-expect (combine-bst empty-node-5 empty-node-4) (insert-bst empty-node-4 5))

;; two bsts, t1 and t2, and returns a bst containing all numbers that are contained in t1 or t2.
(define (combine-bst t1 t2)
  (cond [(and (empty? (node-left t2)) (empty? (node-right t2))) (insert-bst t1 (node-key t2))]
        [(empty? (node-left t2)) (combine-bst t1 (node-right t2))]
        [(empty? (node-right t2)) (combine-bst t1 (node-left t2))]
        [else (combine-bst (combine-bst t1 (node-left t2)) (node-right t2))]
        ))