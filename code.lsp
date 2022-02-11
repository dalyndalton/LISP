# Comments for this file existed, but due to a bug with the compiler
# Many of my inline comments broke, and any indentation with said comments
# Would also break, as well as break my OCD

# Append
(defun append(list0 list1)
    (if (eq list0 nil)
        list1
        (cons (first list0) (append (rest list0) list1))))

# Append Tests
(append nil nil )
(append nil (quote (5 8 10 1 )))
(append (cons 1 (cons 2 nil )) nil)
(append (quote (1 2 3 ))(quote (4 5 6 )))


# Helper function for reverseA
(defun reverse (list reverseList)
    (if (eq list nil)
        reverseList
        (reverse (rest list) (cons (first list) reverseList))))

# ReverseA
(defun reverseA(list)
    (reverse list nil))
    
# ReverseA Test
(reverseA (quote (1 3 7 10 15 3 2 7 )))
(reverseA (cons 8 (cons 5 (cons 2 nil ))))
(reverseA nil )

# length
(defun length (list)
    (if (eq list nil)
        0
        (+ 1 (length (rest list)))))

# Length Test
(length nil )
(length (cons True (cons False (cons False (cons False nil )))))
(length (quote (1 8 6 4 4 3 2 1 )))

# Flatten 
(defun flatten (expr)
# Check if first element is not list
    (if (atom expr)
        expr
# Check for nested loop
        (if (atom (first expr))
            (cons (first expr) (flatten (rest expr)))
            (append (flatten (first expr)) (flatten (rest expr))))))
    
# Flatten Tests
(flatten nil )
(flatten 1 )
(flatten (quote (1 2 3 )))
(flatten (quote ((1 )(2 )(3 ))))
(flatten (quote (1 (7 8 (3 )(((4 ))(5 6 ))(9 10 0 (11 ))))))

# Equal
(defun equal (part1 part2)
    (or (eq part1 part2)
        (if (or (atom part1) (atom part2))
            False
            (and (equal (first part1) (first part2))
                (equal (rest part1) (rest part2))))))

# Equal Test
(equal nil nil)
(equal nil 1)
(equal (quote (1 ))(quote (2 3 4 5 )))
(equal (quote (1 (7 8 (3 )(((4 ))(5 6 ))(9 10 0 (11 )))))(quote (1 (7 8 (3 )(((4 ))(5 6 ))(9 10 0 (11 ))))))

# Find
(defun find(item expr)
    (if (atom expr)
        (if (eq item expr)
            True
            False)
        (if (eq item (first expr))
            True
            (find item (rest expr))))
)

# Find Test
(find 1 nil )
(find True (cons False (cons False nil )))
(find 111111 (quote (1 2 3 4 6 )))
(find 555 (quote (6 555 67 545 )))

# Get
(defun get(list idx)
    (if (eq list nil)
        nil
        (if (eq 0 idx)
            (first list)
            (get (rest list) (- idx 1)))))

# Good Get, the get that all the function will use
(defun gget(list idx)
    (if (eq list nil)
        nil
        (if (eq 0 idx)
            list
            (gget (rest list) (- idx 1)))))
# Get Test
(get nil 1 )
(get (cons 4 nil )0 )
(get (quote (1 b c d e ))3 )

# Slicer to help with Select
(defun slice (list idx)
    (if (atom list)
        list
        (if (eq 0 idx)
            (first list)
            (cons (first list) (cons (slice (rest list) (- idx 1)) nil)))))

# Select
(defun select (list start end)
    (flatten (slice (gget list start) (- end (+ start 1)))))

# Select Test
(select (quote (0 1 2 3 4 5 6 7 8 )) 0 (/ (length (quote (0 1 2 3 4 5 6 7 8 ))) 2 ))
(select (quote (0 1 2 3 4 5 6 7 8 )) (/ (length (quote (0 1 2 3 4 5 6 7 8 ))) 2 )(length (quote (0 1 2 3 4 5 6 7 8 ))))

# MERGE SORT AHEAD
# MANY MANY FUNCTIONS

# Helper for mergeSort, modified select to always return a flattened list
(defun mselect (list start end)
    (flatten (cons (slice (gget list start) (- end (+ start 1))) nil)))

# Does the sorting part of merge sort
(defun sort (list0 list1)
    (if (eq list0 nil)
        list1
        (if (eq list1 nil)
            list0
            (if (< (first list0) (first list1))
                (cons (first list0) (sort (rest list0) list1))
                (cons (first list1) (sort (rest list1) list0))
                ))))

# Mergesort "the hard one"
(defun mergeSort (list)
    (if (eq (length list) 1)
        list
        (sort
            (mergeSort (mselect list 0 (/ (length list) 2)))
            (mergeSort (mselect list (/ (length list) 2) (length list))))))

# mergeSort tests
(mergeSort (quote (1 )))
(mergeSort (quote (4 3 1 )))
(mergeSort (quote (6 3 2 1 5 7 10 )))

# COUNT THROWS AHEAD
# JUST AS MANY FUNCTIONS HERE TOO
# countThrows
(defun countThrows (dice target)
    (if (eq dice 0)
        (if (eq target 0)
            1
            0)
        (expand dice target)))

# Helper for countThrows, counts 1 dice
# Decrements the dice and faces if not 1 dice
(defun countOne (dice target face)
    (if (eq dice 1)
        (if (eq target face)
            1
            0)
        (expand (- dice 1) (- target face))))

# Expands each dice into its faces 1-6
# We do this here so we don't have to write it out every time in countOne        
(defun expand (dice target) 
    (+ (countOne dice target 1) (+ (countOne dice target 2) (+ (countOne dice target 3) (+ (countOne dice target 4) (+ (countOne dice target 5) (countOne dice target 6)))))))

# Count Throws Test
(countThrows 0 0 )
(countThrows 1 0 )
(countThrows 1 3 )
(countThrows 2 7 )
(countThrows 2 12 )
(countThrows 4 10 )
(countThrows 3 16 )
(countThrows 3 1)
(countThrows 3 10)