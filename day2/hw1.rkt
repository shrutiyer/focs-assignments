#lang racket

;;; Student Name: Frankly Olin [change to your name]
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

;; 1.  WRITE FACTORIAL:  given n, returns n!
(define (fact n)
  your-code-here)

(display (fact 1)) (newline) ;; -> 1
(display (fact 2)) (newline) ;; -> 1

;; 2.  WRITE FIBONACCI:  given n, returns the nth fibonacci number as shown below
(define (fib n)
   your-code-here)

(display (fib 1)) (newline) ;; -> 1
(display (fib 2)) (newline) ;; -> 1
(display (fib 3)) (newline) ;; -> 2
(display (fib 4)) (newline) ;; -> 3
(display (fib 5)) (newline) ;; -> 5
(display (fib 6)) (newline) ;; -> 8

;; 3.  WRITE a procedure that takes a list of numbers and returns the sum of those numbers
(define (sum lst)
  your-code-here)

(display (sum '(1 2 3 4))) (newline) ;; -> 10
(display (sum '(1 20 300))) (newline) ;; -> 321

;; 4.  WRITE a procedure that takes a list of numbers and returns the largest one.
;;     While there are solutions using scheme's built-in max, we were actually hoping you'd do something else...
(define (my-max lst)
  your-code-here)

(display (my-max '(1 10 2 20 3))) (newline) ;; -> 20
