#lang lazy
;;Leaderboard f7

;; a stream of all non-negative integers in ascending order
(define Nats (InfiniteList 0))
(define (InfiniteList x) (cons x (InfiniteList (add1 x))))

;; remove all elements divisible by k from stream s
(define (Kill k s) (filter (λ (x) (< 0 (remainder x k))) s))

(define primes (next-prime-step 2))

;; prime >= c
(define (next-prime-step c) (if (is-prime? c) (cons c (next-prime-step (add1 c)))
                                (next-prime-step (add1 c))))

;; Wilson's theorem
(define (is-prime? x) (is-prime-helper (sub1 x) x))
(define (is-prime-helper n x) (= 1 (/ (remainder (factorial n) x) n)))

(define (factorial x) (factorial-helper x 1))
(define (factorial-helper x acc) (if (= x 1) acc
                                     (factorial-helper (sub1 x) (* x acc))))

(define twin-primes (next-twin-prime 3))
(define (next-twin-prime c) (if (is-prime? (+ 2 c))
                                (cons (cons c (cons (+ 2 c) empty)) (next-twin-prime (+ 2 c)))
                                (next-twin-prime (next-prime (+ c 3)))))

(define (next-prime c) (if (is-prime? c) c
                                (next-prime (add1 c))))

;; If this is the first run cache must be (1 1)
;; Returns a valid factorial-cache with the key being x
(define (factorial-cached x cache) (make-factorial-cache x (factorial-cached-helper x 1 cache)))
;; Returns a number
(define (factorial-cached-helper x acc cache) (if (= (factorial-cache-key cache) x)
                                                  (* (factorial-cache-value cache) acc)
                                                (factorial-cached-helper (sub1 x) (* x acc))))

;; Key being n
;; Value being x
;; n! = x
(define-struct factorial-cache (key value))

(require "IOStream.rkt")
(outstream (take 200 twin-primes))