(defun sum (values)
    (if (eq values nil)
        0
        (+ (first values) (sum (rest values)))
))

(sum (quote (1 2 3 4 5)))