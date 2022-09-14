;;;; letter_grade.clj is a driver for function letterGrade.
;;;;
;;;; Input: A score, an integer
;;;; Output: The grade, either A, B, C, D, or F.
;;;;
;;;; Usage: clojure -m year_codes
;;;;

;;;; Completed by: Justin Voss
;;;; Date: 1/28/22
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns letter_grade)                    ; name the program

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; letterGrade() returns the grade.
;;; Receive: score, an integer
;;; Precondition: it is an integer
;;; Return: the corresponding letter grade
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;; solution using the cond function
(defn letterGrade [score]
(let [score ( / score 10)]
  (cond
    (= score 10) "A"
    (= score 9)  "A"
    (= score 8)  "B"
    (= score 7)  "C"
    (= score 6)  "D"
    :else                "F"
  ))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -main() test-drives our letterGrade() function.
;;; Input: score, an integer
;;; Output: the corresponding letter grade
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
 (print "\nEnter score: ") (flush)
 (let
    [ score (int(read)) ]                ; read score (an integer)
    (println (letterGrade score) "\n")      ; display its grade
 )
)