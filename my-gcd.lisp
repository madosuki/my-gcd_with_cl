(defvar *quotient-list* (list nil))
(defvar *remainder-list* (list nil))

(defun my-gcd (a b)
  (if (= b 0)
      a
      (progn (let ((remainder (mod a b))
                   (quotient (floor (/ a (float b)))))
               (push quotient *quotient-list*)
               (push remainder *remainder-list*)
               (my-gcd b remainder)))))

(defmacro set-y (a b x y)
  `(- ,y (* (floor (/ (float ,a) ,b)) ,x)))

(defmacro swap-param (x y a b)
  (let ((tmp (gensym)))
    `(let ((,tmp ,y))
       (setq ,y ,x)
       (setq ,x ,tmp)
       (setq ,y (set-y ,a ,b ,x ,y)))))

(defvar *x* 0)
(defvar *y* 0)
(defun extend-gcd (a b)
  (if (= b 0)
      (progn
        (setq *x* 1)
        (setq *y* 0)
        a)
      (progn
        (let ((d (extend-gcd b (mod a b))))
          (declare (ignore d))
          (swap-param *x* *y* a b)
          (values *x* *y*)))))