# Complete
(defun get(list idx)
    (if (eq list nil)
        nil
        (if (eq 0 idx)
            (first list)
            (get (rest list) (- idx 1)))))

(get nil 1 )
(get (cons 4 nil )0 )
(get (quote (1 b c d e ))3 )