;; array_processing.clj "test-drives" function read_array() and print_array().
;;
;; Output: prints out array
;;
;; Usage: clojure -m array_processing
;;
;; Completed by: Justin Voss
;; Date: 2/24/22
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns array_processing)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; read_array() reads array values
;; Receive: aVec, a vector of numbers.
;; Return: the array, filled out with user inputted values
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn read_array [size aVec]
    (println "Enter array value: ")
  (if (= size 0)                                          ; if size is less than 0, the recursion ends, and the program returns the vector
    aVec
        (do
                (recur (- size 1) (conj  aVec (read))  )  ; recurs with the size minus one, to eventually get out of the loop when size = 0. 
        )                                                 ; the vec that is recurred is a list with a value from the user added each time
  )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; print_array() prints out an array
;; Receive: aVec, a vector of numbers. 
;; Return: prints out the vector
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn print_array [aVec]
    (if (not-empty aVec)            ; if the vector is not empty, then it prints and recurs
        (do 
            (println (first aVec))  ; prints the first value of the vector
            (recur (rest aVec))     ; recurs the rest of the list except the first value
        )
    )
)  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; main function to test functions read_array() and print_array()
;; Output: the sum and average of some test vectors.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
    (println "Enter size of array: ")
  (let
    [
        vec0 []                         ; makes an empty vector
        size (read)                     ; gets a size from the user
        vector1 (read_array size vec0)  ; adds the values to vector1, to be used later to print out the vector. The read_array function returns a vector
    ]
    (println "Array: ")
    (print_array vector1)               ; prints out the vector

    
  )
)