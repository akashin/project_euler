; If we list all the natural numbers below 10 that are multiples of 3 or 5,
; we get 3, 5, 6 and 9. The sum of these multiples is 23.
; Find the sum of all the multiples of 3 or 5 below 1000.

(define (myrange low high)
  (if (> low high)
      nil
      (cons low (myrange (+ low 1) high))))

(define (myfilter pred seq)
  (if (null? seq)
      nil
      (if (pred (car seq))
          (cons (car seq) (myfilter pred (cdr seq)))
          (myfilter pred (cdr seq)))))

(define (divisible_by? x div) (= 0 (remainder x div)))
(define (is_multiple x) (or (divisible_by? x 3) (divisible_by? x 5)))
(define (sum seq)
  (if (null? seq)
      0
      (+ (car seq) (sum (cdr seq)))))

(define (sum_of_multiples n) (sum (myfilter is_multiple (myrange 1 (- n 1)))))

(display (sum_of_multiples 10))
(newline)
(display (sum_of_multiples 1000))
