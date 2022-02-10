# Complete!
(defun equal (part1 part2)
    (or (eq part1 part2)
        (if (or (atom part1) (atom part2))
            False
            (and (equal (first part1) (first part2))
                (equal (rest part1) (rest part2))))))

(equal nil nil)
(equal nil 1)
(equal (quote (1 ))(quote (2 3 4 5 )))
(equal (quote (1 (7 8 (3 )(((4 ))(5 6 ))(9 10 0 (11 )))))(quote (1 (7 8 (3 )(((4 ))(5 6 ))(9 10 0 (11 ))))))
