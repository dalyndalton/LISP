# Complete!
(defun length (list)
    (if (eq list nil)
        0
        (+ 1 (length (rest list)))))

(length nil )
(length (cons True (cons False (cons False (cons False nil )))))
(length (quote (1 8 6 4 4 3 2 1 )))