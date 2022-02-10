# Complete
# Take fron the append.lsp
(defun append(list0 list1)
    (if (eq list0 nil)
        list1
        (cons (first list0) (append (rest list0) list1))))

(defun flatten (expr)
# Check if first element is not list
    (if (atom expr)
        expr
# Check for nested loop
        (if (atom (first expr))
            (cons (first expr) (flatten (rest expr)))
            (append (flatten (first expr)) (flatten (rest expr))))))
    
(flatten nil )
(flatten 1 )
(flatten (quote (1 2 3 )))
(flatten (quote ((1 )(2 )(3 ))))
(flatten (quote (1 (7 8 (3 )(((4 ))(5 6 ))(9 10 0 (11 ))))))