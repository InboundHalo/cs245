#lang lazy
;;Leaderboard f7

;; a stream of all non-negative integers in ascending order
(define Nats (InfiniteList 0))
(define (InfiniteList x) (cons x (InfiniteList (add1 x))))

;; remove all elements divisible by k from stream s
(define (Kill k s) (filter (λ (x) (< 0 (remainder x k))) s))

(define primes (next-prime-step 2 default-cache))

;; prime >= c
(define (next-prime-step c cache) (next-prime-step-helper c (is-prime? c cache)))
(define (next-prime-step-helper c prime) (if (first prime)
                                        (cons c (next-prime-step (add1 c) (second prime)))
                                (next-prime-step (add1 c) (second prime))))

;; Wilson's theorem
;; returns a list where first is the bool and second is the factorial cache
(define (is-prime? x factorial-cache) (is-prime-helper (sub1 x) x factorial-cache))
(define (is-prime-helper n x factorial-cache) (is-prime-helper2 n x (factorial-cached n factorial-cache)))
(define (is-prime-helper2 n x factorial) (list (= 1 (/ (remainder (factorial-cache-value factorial) x) n)) factorial))

(define (factorial x) (factorial-helper x 1))
(define (factorial-helper x acc) (if (= x 1) acc
                                     (factorial-helper (sub1 x) (* x acc))))

(define default-cache (make-factorial-cache 1 1))

(define twinprimes (next-twin-prime 3 default-cache))
(define (next-twin-prime c factorial-cache) (next-twin-prime-helper c (is-prime? (+ 2 c) factorial-cache)))
(define (next-twin-prime-helper c is-prime) (if (first is-prime)
                                (cons (cons c (cons (+ 2 c) empty)) (next-twin-prime (+ 2 c) (second is-prime)))
                                (next-twin-prime-caller (next-prime (+ c 3) (second is-prime)))))
;; Im too far deep now to change my ways lmao
(define (next-twin-prime-caller cache) (next-twin-prime
                                        (add1 (factorial-cache-key cache))
                                        cache))


;; Returns factorial-cache where (add1 (factorial-cache-key _)) is the next prime
;; Im too far gone at this point
(define (next-prime c cache) (next-prime-helper c (is-prime? c cache)))
(define (next-prime-helper c prime) (if (first prime)
                                        (second prime)
                                        (next-prime (add1 c) (second prime))))

;; If this is the first run cache must be (1 1)
;; Returns a valid factorial-cache with the key being x
(define (factorial-cached x cache) (make-factorial-cache x (factorial-cached-helper x 1 cache)))
;; Returns a number
(define (factorial-cached-helper x acc cache) (if (= (factorial-cache-key cache) x)
                                                  (* (factorial-cache-value cache) acc)
                                                (factorial-cached-helper (sub1 x) (* x acc) cache)))


;; Key being n
;; Value being x
;; n! = x
(define-struct factorial-cache (key value) #:transparent)