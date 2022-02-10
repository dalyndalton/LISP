# Complete
(defun find(item expr)
    (if (atom expr)
        (if (eq item expr)
            True
            False)
        (if (eq item (first expr))
            True
            (find item (rest expr))))
)

(find 1 nil )
(find True (cons False (cons False nil )))
(find 111111 (quote (1 2 3 4 6 )))
(find 555 (quote (6 555 67 545 )))