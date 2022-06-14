#lang racket

; sum function
(define (sum xs)
  (if (null? xs)
      0
      (+ (car xs) (sum (cdr xs)))))

(sum (list 4 5 6 1 23))


; Custom append function
(define (my-append xs ys)
  (if (null? xs)
      ys
      (cons (car xs) (my-append (cdr xs) ys))))


(my-append (list 1 3 5 6) (list 1 2 4))

; Custom map function
(define (my-map f xs)
  (if (null? xs)
      null
      (cons (f (car xs)) (my-map f (cdr xs)))))

(define foo (my-map (lambda (x) (+ x 1)) (list 4 3 2 1)))

