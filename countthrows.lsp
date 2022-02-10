(defun countThrows (dice target)
    (if (eq dice 0)
        (if (eq target 0)
            1
            0)
        (expand dice target)))

(defun countOne (dice target face)
    (if (eq dice 1)
        (if (eq target face)
            1
            0)
        (expand (- dice 1) (- target face))))
        
(defun expand (dice target) 
    (+ (countOne dice target 1) (+ (countOne dice target 2) (+ (countOne dice target 3) (+ (countOne dice target 4) (+ (countOne dice target 5) (countOne dice target 6)))))))

(countThrows 0 0 )
(countThrows 1 0 )
(countThrows 1 3 )
(countThrows 2 7 )
(countThrows 2 12 )
(countThrows 4 10 )
(countThrows 3 16 )
(countThrows 3 1)
(countThrows 3 10)