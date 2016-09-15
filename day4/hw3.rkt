#lang racket

;;; Student Name: Shruti Iyer
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [X] I completed this assignment with assistance from Alison
;;;     and/or using these external resources: ___

;;;;;;;;;;;
;; 1. assq

;; `assq` is a function that takes a key and an association list.
;;
;; It returns the corresponding key/value pair from the list
;; (*i.e.*, the pair whose key is *eq?* to the one it is given).
;;
;; If the key is not found in the list, `assq` returns `#f`.

(define (massq key lst)
  (cond [(null? lst) #f]
        [(eq? key (first (first lst))) (first lst)]
        [else (massq key (rest lst))]))

;;;;;;;;;;;
;; 2. lookup-list

;; Add the ability to look up symbols to your evaluator.
;;
;; Add the `lookup-list` argument to your hw2 evaluator (or ours, from the solution set).
;; `(evaluate 'foo lookup-list)` should return whatever `'foo` is associated with in `lookup-list`.

;; Using the evaluator from hw2
(define (evaluate exp lst)
  (cond [(symbol? exp) (last (massq exp lst))]
        [(number? exp)  exp]
        [(boolean? exp) exp]
        [(eq? (list-ref exp 0) 'ADD)  (+ (evaluate (list-ref exp 1) lst) (evaluate (list-ref exp 2) lst))]
        [(eq? (list-ref exp 0) 'SUB)  (- (evaluate (list-ref exp 1) lst) (evaluate (list-ref exp 2) lst))]
        [(eq? (list-ref exp 0) 'MUL)  (* (evaluate (list-ref exp 1) lst) (evaluate (list-ref exp 2) lst))]
        [(eq? (list-ref exp 0) 'DIV)  (/ (evaluate (list-ref exp 1) lst) (evaluate (list-ref exp 2) lst))]
        [(eq? (list-ref exp 0) 'GT)   (> (evaluate (list-ref exp 1) lst) (evaluate (list-ref exp 2) lst))]
        [(eq? (list-ref exp 0) 'LT)   (< (evaluate (list-ref exp 1) lst) (evaluate (list-ref exp 2) lst))]
        [(eq? (list-ref exp 0) 'GE)   (>= (evaluate (list-ref exp 1) lst) (evaluate (list-ref exp 2) lst))]
        [(eq? (list-ref exp 0) 'LE)   (<= (evaluate (list-ref exp 1) lst) (evaluate (list-ref exp 2) lst))]
        [(eq? (list-ref exp 0) 'EQ)   (= (evaluate (list-ref exp 1) lst) (evaluate (list-ref exp 2) lst))]
        [(eq? (list-ref exp 0) 'NEQ)  (not (= (evaluate (list-ref exp 1) lst) (evaluate (list-ref exp 2) lst)))]
        [(eq? (list-ref exp 0) 'ANND) (and (evaluate (list-ref exp 1) lst) (evaluate (list-ref exp 2) lst))]
        [(eq? (list-ref exp 0) 'ORR)  (or (evaluate (list-ref exp 1) lst) (evaluate (list-ref exp 2) lst))]
        [(eq? (list-ref exp 0) 'NOTT) (not (evaluate (list-ref exp 1) lst))]
        [else (error "Don't know how to " (list-ref exp 0))]))

;;;;;;;;;;;
;; 3. testing the fuctions

(define operator-list
  (list (list 'ADD +)
        (list 'SUB -)
        (list 'MUL *)
        (list 'DIV /)
        (list 'GT >)
        (list 'LT <)
        (list 'GE >=)
        (list 'LE <=)
        (list 'EQ =)
        (list 'NEQ (lambda (x y) (not (= x y))))
        (list 'ANND (lambda (x y) (and x y)))
        (list 'ORR (lambda (x y) (or x y)))
        (list 'NOTT not)))

(massq 'ADD operator-list)  ;;--> '(ADD #<procedure:+>)
(massq 'ANND operator-list) ;;--> '(ANND #<procedure>)
(massq 'FOO operator-list)  ;;--> #f
(evaluate '(ADD x y) '((x 3) (y 2) (z -5))) ; --> 5