(load "my-gcd")

(defun main ()
  (let ((a (read))
        (b (read)))
    (let ((result (multiple-value-list (extend-gcd a b))))
      (format t "(~a * ~a) + (~a * ~a) = ~a~%" a (car result) b (cadr result) (my-gcd a b)))))
