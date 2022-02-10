# Complete!
(defun append(list0 list1)
    (if (eq list0 nil)
        list1
        (cons (first list0) (append (rest list0) list1))))

(append nil nil )
(append nil (quote (5 8 10 1 )))
(append (cons 1 (cons 2 nil )) nil)
(append (quote (1 2 3 ))(quote (4 5 6 )))