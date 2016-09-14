#lang racket

;;; Student Name: Shruti Iyer
;;;
;;; Check one:
;;; [X] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

;;; 1.  Create a calculator that takes one argument: a list that represents an expression.
#|
(define (calculate x)
  (if (empty? x)
      x
      (if (eq? (list-ref x 0) 'ADD)
          (+ (list-ref x 1) (list-ref x 2))
      (if (eq? (list-ref x 0) 'SUB)
          (- (list-ref x 1) (list-ref x 2))
      (if (eq? (list-ref x 0) 'MUL)
          (* (list-ref x 1) (list-ref x 2))
      (if (eq? (list-ref x 0) 'DIV)
          (/ (list-ref x 1) (list-ref x 2))
          0
          ))))))

(calculate '(ADD 3 4)) ;; --> 7
|#
;;; 2. Expand the calculator's operation to allow for arguments that are themselves well-formed arithmetic expressions.
#|
(define (calculate x)
  (if (empty? x)
      x
      (if (number? x)
          x
          (if (eq? (list-ref x 0) 'ADD)
              (+ (calculate (list-ref x 1)) (calculate (list-ref x 2)))
              (if (eq? (list-ref x 0) 'SUB)
                  (- (calculate (list-ref x 1)) (calculate (list-ref x 2)))
                  (if (eq? (list-ref x 0) 'MUL)
                      (* (calculate (list-ref x 1)) (calculate (list-ref x 2)))
                      (if (eq? (list-ref x 0) 'DIV)
                          (/ (calculate (list-ref x 1)) (calculate (list-ref x 2)))
                          0
                          )))))))

(calculate '(ADD 3 (MUL 4 5))) ;; --> 23   ;; what is the equivalent construction using list?
(calculate '(SUB (ADD 3 4) (MUL 5 6))) ;; --> -23
|#

(define (calculate x)
  (if (empty? x)
      x
      (if (number? x)
          x
          (if (eq? (list-ref x 0) 'ADD)
              (+ (calculate (list-ref x 1)) (calculate (list-ref x 2)))
              (if (eq? (list-ref x 0) 'SUB)
                  (- (calculate (list-ref x 1)) (calculate (list-ref x 2)))
                  (if (eq? (list-ref x 0) 'MUL)
                      (* (calculate (list-ref x 1)) (calculate (list-ref x 2)))
                      (if (eq? (list-ref x 0) 'DIV)
                          (/ (calculate (list-ref x 1)) (calculate (list-ref x 2)))
                          (if (eq? (list-ref x 0) 'GT)
                              (> (calculate (list-ref x 1)) (calculate (list-ref x 2)))
                              (if (eq? (list-ref x 0) 'LT)
                                  (< (calculate (list-ref x 1)) (calculate (list-ref x 2)))
                                  (if (eq? (list-ref x 0) 'GE)
                                      (>= (calculate (list-ref x 1)) (calculate (list-ref x 2)))
                                      (if (eq? (list-ref x 0) 'LE)
                                          (<= (calculate (list-ref x 1)) (calculate (list-ref x 2)))
                                          (if (eq? (list-ref x 0) 'ANND)
                                              (and (calculate (list-ref x 1)) (calculate (list-ref x 2)))
                                              (if (eq? (list-ref x 0) 'ORR)
                                                  (or (calculate (list-ref x 1)) (calculate (list-ref x 2)))
                                                  (if (eq? (list-ref x 0) 'NOTT)
                                                      (not (calculate (list-ref x 1)) (calculate (list-ref x 2)))
                                                      (if (eq? (list-ref x 0) 'IPH)
                                                          (if (calculate (list-ref x 1)) (calculate (list-ref x 2)) (calculate (list-ref x 3)))
                                                          0
                                                          )))))))))))))))

;;; 3. Add comparators returning booleans (*e.g.*, greater than, less than, …).
;; Note that each of these takes numeric arguments (or expressions that evaluate to produce numeric values),
;; but returns a boolean.  We suggest operators `GT`, `LT`, `GE`, `LE`, `EQ`, `NEQ`.

(calculate '(GT (ADD 3 4) (MUL 5 6))) ;; --> #f
(calculate '(LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6))))) ;; --> #t

;;; 4. Add boolean operations ANND, ORR, NOTT

(calculate '(ANND (GT (ADD 3 4) (MUL 5 6)) (GE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6)))))) ;; --> #f

;;; 5. Add IPH

(calculate '(IPH (GT (ADD 3 4) 7) (ADD 1 2) (ADD 1 3))) ;; -> 4
