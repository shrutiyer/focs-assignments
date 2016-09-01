#lang racket

(define (apply-op op arg1 arg2)
  (cond [(eq? op '+) (+ arg1 arg2)]
        [(eq? op '-) (- arg1 arg2)]
        [(eq? op '*) (* arg1 arg2)]
        [(eq? op '/) (/ arg1 arg2)]))

(define (calc-as-you-go-helper arg1 input)
  (cond [(null? input) arg1]
        [else
         (calc-as-you-go-helper (apply-op (first input) arg1 (second input)) (list-tail input 2))]))

(define (calc-as-you-go input)
  (calc-as-you-go-helper (first input) (rest input)))

(write (calc-as-you-go '(1 + 2 * 3))) (newline)

(define (rpn-calc-helper input stack)
  (cond [(null? input)
         (first stack)]
        [(number? (first input))
         (rpn-calc-helper (rest input) (cons (first input) stack))]
        [else
         (rpn-calc-helper (rest input) (cons (apply-op (first input) (second stack) (first stack)) (list-tail stack 2)))]))

(define (rpn-calc input)
  (rpn-calc-helper input '()))

(write (rpn-calc '(1 2 + 3 *))) (newline)
(write (rpn-calc '(1 2 3 + *))) (newline)
