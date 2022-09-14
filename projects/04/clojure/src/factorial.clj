;;;; factorial.clj uses a driver to print out factorial of a number
;;;;
;;;; Input: n, an integer, and i, an integer that keeps track of current state in recursion
;;;; Output: the factorial of n
;;;;
;;;; Usage: clojure -m factorial
;;;;

;;;; Completed by: Justin Voss
;;;; Date: 2/4/22
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns factorial)                    ; name the program


;;;; Recieve: n, an integer
;;;; Precondition: n is an integer, and i, an integer that keeps track of current state in recursion
;;;; Return: the factorial of n, printed out
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; gets passed a current state, i, and an integer n
(defn factorial [n i answer]
    (if (<= i n)              ;; checks if start is less than or equal to stop
        (do                   ;; do statement for multiple statements
        
                              ;; does recursive call of the factorial function
        (recur n (+ i 1) (* answer i))
        )
                              ;; if the current state is larger than the inputted number, it has succesfully computed the factorial.
    (if (>= i n)
      (print n "! = " answer "\n")
    )
  )
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -main() test-drives our factorial() function.
;;; Input: n, an integer
;;; Output: nothing (the output is printed in the factorial statement)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
 (print "\nTo compute n!, enter n:") (flush)
 (let
    [ n (int(read)) ]                ; read n (an integer)
    (factorial n 2 1)
 )
)