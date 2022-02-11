# Complete
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
    
(defun length (list)
    (if (eq list nil)
        0
        (+ 1 (length (rest list)))))

(defun slice (list idx)
    (if (atom list)
        list
        (if (eq 0 idx)
            (first list)
            (cons (first list) (cons (slice (rest list) (- idx 1)) nil)))))

(defun mget(list idx)
    (if (eq list nil)
        nil
        (if (eq 0 idx)
            list
            (mget (rest list) (- idx 1)))))

(defun mselect (list start end)
    (flatten (cons (slice (get list start) (- end (+ start 1))) nil)))

(defun sort (list0 list1)
    (if (eq list0 nil)
        list1
        (if (eq list1 nil)
            list0
            (if (< (first list0) (first list1))
                (cons (first list0) (sort (rest list0) list1))
                (cons (first list1) (sort (rest list1) list0))
                ))))


(defun mergeSort (list)
    (if (eq (length list) 1)
        list
        (sort
            (mergeSort (mselect list 0 (/ (length list) 2)))
            (mergeSort (mselect list (/ (length list) 2) (length list))))))


(mergeSort (quote (1 )))
(mergeSort (quote (4 3 1 )))
(mergeSort (quote (6 3 2 1 5 7 10 )))