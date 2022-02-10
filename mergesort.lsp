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

(defun get(list idx)
    (if (eq list nil)
        nil
        (if (eq 0 idx)
            list
            (get (rest list) (- idx 1)))))

(defun select (list start end)
    (flatten (slice (get list start) (- end (+ start 1)))))

(defun mergesort (list)
    mergesortH((select list 0 (/ (length list)2) (select list (/ (length list) 2) (length list)))
)

(defun mergesortH(list0 list1))