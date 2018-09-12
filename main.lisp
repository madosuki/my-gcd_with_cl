(load "my-gcd")

(defun main ()
  (let ((a (read))
        (b (read)))
    (let ((result (multiple-value-list (extend-gcd a b))))
      (format t "~a * ~a + ~a * ~a = ~a~%" a (nth 0 result) b (nth 1 result) (my-gcd a b)))))
