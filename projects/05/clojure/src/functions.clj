;;;; functions.clj have several functions with different uses. The functions are reversing fnctions, and other misc. functions.functions.clj displays a table of logarithms.
;;;;
;;;; Input: 
;;;; Precondition: 
;;;; Output: 
;;;; Completed by: Justin Voss
;;;; Date: 2/11/22
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns functions)                                 ; name the program

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; functions.clj have several functions with different uses. The functions are reversing fnctions, and other misc. functions.




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my-reverse reverses top elements of a sequence
;;; Input: a sequence, and an empty list
;;; Output: a printed reversed list
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn my-reverse [sequence & list]
    (if (empty? sequence )
        sequence
        (cons (last sequence) (my-reverse (butlast sequence)))
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;super-reverse reverses the whole list, including nested sublists and top level elements
;;; Input: a sequence
;;; Output: a reversed list
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn super-reverse [sequence]
    (if (empty? sequence)  ; if it is empty, it returns the final sequence
        sequence
        (if (list? (last sequence))  ; checks if the last member it is a list
            (cons (super-reverse (last sequence)) (super-reverse (butlast sequence)))  ; if it is a list, it will recursively call the last thing in the sequence, and add it to the recursively called rest of the sequence.
            (cons (last sequence) (super-reverse (butlast sequence)))  ; Otherwise, it returns the last element of the list, added to the recursively called rest of the list
        )
    )
) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; member? checks if an element is in a list
;;; Input: the first element (sequence1) and the list (sequence2)
;;; Output: a boolean statement, true or false, depending on if the element is in the list
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn member? [sequence1 sequence2] 
    (if (list? sequence2)  ; if i is a list, otherwise, print that it is not a list
        (if (empty? sequence2)  ; Checks if it has gone all the way through the list. If it has, then it means that the element is not in the sequence, so it is false
            false
            (if (= (first sequence2) sequence1) ; If they are equal, it means that the element is the same as the list. 
                                                ; If it is not exactly the same, we recur with the rest of the sequence until the list is only one element, which returns it as true.
                true
                (member? sequence1 (rest sequence2))
            )
    
        )
        (println "This is not a list")
    ) 
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; subsequence returns part of an input list starting at position i, for n elements. 
;;; Input: a sequence, a position number i, and a number of elements, n.
;;; Output: a sublist of the original list, based on the 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn subsequence [list i n & answer] 
    (if (not-empty list)
        (if (= i 0)
            (if (= n 0)
                (my-reverse answer)
                (recur (rest list) i (- n 1) (cons (first list) answer))
            )
            (recur (rest list) (- i 1) n answer)
        )
    )
)




;;; -main is a 'driver' for using the functions made in functions.clj
(defn -main []
    (println "Testing Reverse function: ") (flush)
    (println "Test '(): ")
    (println (my-reverse '()))
    (println "Test '(a b): ")
    (println (my-reverse '(a b)))
    (println "Test '(a b (c d) (e (f g))))): ")
    (println (my-reverse '(a b (c d) (e (f g)))))
    (println "Test '((a b c d) e f (g h i)))): ")
    (println (my-reverse '((a b c d) e f (g h i))))
    (println "")
    

    (println "Testing Super-Reverse function: ") (flush)
    (println "Test '(): ")
    (println (super-reverse '()))
    (println "Test '(a b): ")
    (println (super-reverse '(a b)))
    (println "Test '((a b)c): ")
    (println (super-reverse '((a b)c)))
    (println "Test '(a b (c d) (e (f g))): ")
    (println (super-reverse '(a b (c d) (e (f g)))))
    (println "Test '((a b) c (d e (f g h i j))): ")
    (println (super-reverse '((a b) c (d e (f g h i j)))))
    (println "")

    
    (println "Testing Member function: ") (flush)
    ; Checks for elements in the list
    (println "Check for elements in list (should return true): ") (flush)
    (println "Testing '(1 2 3 4) '((1 2 3 4) (5 6 7)):")
    (println (member? '(1 2 3 4) '((1 2 3 4) (5 6 7))))
    (println "Testing '((1 2) 3 (4 (5 6))):")
    (println (member? '(1 2) '((1 2) 3 (4 (5 6)))))
    (println "Testing 3 '((1 2) 3 (4 (5 6))):")
    (println (member? 3 '((1 2) 3 (4 (5 6)))))
    (println "Testing '(4 (5 6)) '((1 2) 3 (4 (5 6))):")
    (println (member? '(4 (5 6)) '((1 2) 3 (4 (5 6)))))
    ; Checks for something not in the list
    (println "Check for elements not in list (should return false): ") (flush)
    (println "Testing '(5) '(5 6):")
    (println (member? '(5) '(5 6)))
    (println "Testing '1 '((1 2) 3 (4 (5 6))):")
    (println(member? 1 '((1 2) 3 (4 (5 6)))))
    (println "Testing 2 '((1 2) 3 (4 (5 6))):")
    (println(member? 2 '((1 2) 3 (4 (5 6)))))
    (println "Testing 4 '((1 2) 3 (4 (5 6))):")
    (println(member? 4 '((1 2) 3 (4 (5 6)))))
    (println "")

    (println "Testing Subsequence function: ") (flush)
    (println "Testing '(1 2 (3 4) (5 (6 7))) 1 2):")
    (println(subsequence '(1 2 (3 4) (5 (6 7))) 1 2))
    (println "Testing '(1 2 3 4 5 6 7) 2 4)):")
    (println(subsequence '(1 2 3 4 5 6 7) 2 4))
    (println "Testing '(1 2 3 4 5 6 7 8 9 10) 4 7)) (should return nil):")
    (println(subsequence '(1 2 3 4 5 6 7 8 9 10) 4 7))
    (println "Testing '(() 1 2) (empty list, should return nil):")
    (println(subsequence '() 4 7))


)