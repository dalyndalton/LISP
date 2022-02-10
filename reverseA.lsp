# Complete
(defun reverse (list reverseList)
    (if (eq list nil)
        reverseList
        (reverse (rest list) (cons (first list) reverseList))))

(defun reverseA(list)
    (reverse list nil))
    
(reverseA (quote (1 3 7 10 15 3 2 7 )))
(reverseA (cons 8 (cons 5 (cons 2 nil ))))
(reverseA nil )