;;;; quad_roots.clj computes the roots of an equation given by values from the user.
;;;;
;;;; Input: integers a, b, c
;;;;    
;;;; Output: the roots of the equation
;;;;
;;;; Usage: clojure -m quad_roots
;;;;
;;;; Completed by: Justin Voss
;;;; Date: 02/17/22
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(ns quad_roots)      ; name the program


;; uses ints a, b and c to compute the roots of an equation from user inputted numbers
(defn quadratic_roots [a,b,c]
    (if (not= a 0) ;; if a is not 0
      (do
        (let [arg (- (Math/pow b 2) (* 4 a c))]  ;; the let statement allows us to put values to variables
          (if (>= arg 0) ;; compares arg and 0
            (do
              (let [root1( / (+ (- b) (Math/sqrt arg) ) (* 2 a))  ;; clojure operations for quad formula
                    root2 ( / (- (- b) (Math/sqrt arg) )  (* 2 a))]
                (vector root1 root2)) ;; puts the two roots into a vector
              )
            (do

              (let [root1 0 root2 0]  ;; if arg is less than 0, the roots are turned to zero and an error message is printed
                (vector root1 root2) 
                (print "\n*** quadraticRoots(): b^2 - 4ac is negative!\n"))))))

      (do
        
        (let [root1 0 root2 0]  ;; if a is zero, then the roots are set as zero, and an error message is returned
          (vector root1 root2)
          (print "\n*** QuadraticRoots(): a is zero!\n"))))
  
    
)



;;; main function
(defn -main []
    (print "Enter a: ") (flush)   ;; gets input values
    (let
        [ a (read) ]
        (print "Enter a: ") (flush)  
        (let
            [ b (read) ]
            (print "Enter a: ") (flush)  
            (let 
                [c (read)   ;; assigns the returned value of the quadradic_roots function to results. Then root1 and root2 get assigned values of result
                result (quadratic_roots a b c)
                root1 (get result 0)
                root2 (get result 1)]
              
              (if (not= root1 nil)
                (if (not= root2 nil)
                (printf (str "\nThe roots are  %s and %s \n")  ;; prints out the roots
                        root1 root2))
              )
            )
        )
    )
)
