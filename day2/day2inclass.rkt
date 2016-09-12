#lang racket

(define (tree-add1 tree)
  (if (null? tree)
      tree
      (if (number? (first tree))
          (cons (+ (first tree) 1) (tree-add1 (rest tree)))
          (cons (tree-add1 (first tree)) (tree-add1 (rest tree))))))

;;(display (tree-add1 '(3 ( 1 4)))) (newline) ;; -> (4 (2 5))

(define (tree-max-depth tree)
  (if (null? tree)
      0
      (if (number? (first tree))
          (if (number? (rest tree))
              1
              (+ (tree-max-depth (rest tree)) 1))
          (max (tree-max-depth (first tree))
             (tree-max-depth (rest tree))))))
;; NINJA
;;(display (tree-max-depth '(3 (1 (4 1)) (5 (9 2))))) (newline) ;; -> 3

(define (tree-max-width tree)
  (if (null? tree)
      0
      (+ (tree-max-width (rest tree)) 1)))

;;(display (tree-max-width '(3 (1 (4 1))))) (newline) ;; -> 2
;;(display (tree-max-width '(3 1 (4 1)))) (newline) ;; -> 3
;;(display (tree-max-width '(3 (1 4 1)))) (newline) ;; -> 2

(define (tree-count-leaves tree)
  (if (null? tree)
      0
      (if (number? (first tree))
          (+ 1 (tree-count-leaves (rest tree)))
          (+ (tree-count-leaves (first tree))
             (tree-count-leaves (rest tree))))))

;;(display (tree-count-leaves '(3 (1 (4 1))))) (newline) ;; -> 4

(define (tree-map mfunc tree)
  (if (null? tree)
      tree
      (if (number? (first tree))
          (cons (mfunc (first tree)) (tree-map mfunc (rest tree)))
          (cons (tree-map mfunc (first tree)) (tree-map mfunc (rest tree))))))

;;(display (tree-map add1 '(3 (1 (2 6) 4)))) (newline) ;; -> (4 (2 (3 7) 5))

(define (tree-max tree)
  (if (null? tree)
      0
      (if (number? (first tree))
          (max (first tree) (tree-max (rest tree)))
          (max (tree-max (first tree)) (tree-max (rest tree))))))

;;(display (tree-max '(3 (1 4)))) (newline) ;; -> 4

(define (tree-min tree)
  (if (null? (rest tree))
      empty
      (if (number? (first tree))
          (min (first tree) (tree-min (rest tree)))
          (min (tree-min (first tree)) (tree-min (rest tree))))))
;;NINJA
;;(display (tree-min '(3 (1 4)))) (newline) ;; -> 1

(define (flatten tree)
  (cond ((null? tree) empty)
        ((pair? tree) (append (flatten (first tree)) (flatten (rest tree))))
        (else (list tree))))

(display (flatten '(2 (1 4) (5 2 (4 4))))) (newline) ;; -> (2 1 4 5 2 4 4)