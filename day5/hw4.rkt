#lang racket

;;; Student Name: Shruti Iyer
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [X] I completed this assignment with assistance from Anne Loverso
;;;     and/or using these external resources: ___
;;; I could only successfully finish the first three parts. I couldn't get LAMBDA to evaluate.
;;; I spent ~4 hrs just on the Lambda problem. Couldn't get it to work.

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
        (list 'NOTT not)
        (list 'IPH (lambda (x y z) (if x y z)))))

(define (run-repl)
  (display "Welcome to my repl.") (newline)
  (display "Type some scheme-ish at the prompt.") (newline)
  (display "Type <return> after each expression:") (newline)
  (repl operator-list))

(define (repl env)
  (display "> ")
  (display (evaluate (read) env))
  (newline)
  (repl env))

(define (evaluate exp env)
  (cond
    [(number? exp) exp]
    
    [(boolean? exp) exp]
    
    [(symbol? exp) (second (assq exp env))]
    
    [(equal? (first exp) 'DEFINE)
     (repl (append (list (list (second exp) (evaluate (third exp) env))) env))]
    
    [(equal? (first exp) 'LAMBDA)
     (list 'lambda (second exp) (third exp) env)]

    [(list? exp)
     (
      (second (assq (first exp) env)) 
      (evaluate (second exp) env)
      (evaluate (third exp) env)
    )])
)

(run-repl)
