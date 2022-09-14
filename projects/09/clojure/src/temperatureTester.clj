;; temperatureTester.clj tests a Clojure Name type,
;;  stored in Temperature.clj (in the src directory).
;;
;; Output: the results of testing the Temperature functions.
;;
;; Usage: clojure -m temperatureTester
;;
;; Completed by: Justin Voss
;; Date: 03/17/22
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns temperatureTester)

;;(load "Temperature")
(load-file "src/Temperature.clj")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; A simple driver to test our Temperature functions. 
;; Output: the results of testing our Temperature functions.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
    (let
        [
            temp1 (make-Temperature 32.0 "F")
            temp2 (make-Temperature 0.0 "C")
            temp3 (make-Temperature 273.15 "K")
            temp4 (make-Temperature 100.0 "F")
        ]
    
    ;; testing toFahrenheit
    (println "Testing converter methods...")
    (assert (= (toFahrenheit temp1) temp1) "toFahrenheit(1) failed")
    (assert (= (toFahrenheit temp2) temp1) "toFahrenheit(1) failed")
    (assert (= (toFahrenheit temp3) temp1) "toFahrenheit(1) failed")

    (assert (= (toCelsius temp1) temp2) "toCelsius(1) failed")
    (assert (= (toCelsius temp2) temp2) "toCelsius(1) failed")
    (assert (= (toCelsius temp3) temp2) "toCelsius(1) failed")

    (assert (= (toKelvin temp1) temp3) "toKelvin(1) failed")
    (assert (= (toKelvin temp2) temp3) "toKelvin(1) failed")
    (assert (= (toKelvin temp3) temp3) "toKelvin(1) failed")

    (assert (equals temp1 temp2) "equals(1) failed")
    (assert (lessThan temp1 temp4) "equals(1) failed")

    (println "\nAll tests passed!\n")
    (println "\n Enter degrees and scale for baseTemp, ")
    (println "\n enter degrees and scale for limitTemp, ")
    (println "\n then finally enter a step value:\n")
    (let [baseTemp (readTemperature)  ;; initializes base limit and step values
        limitTemp (readTemperature)
        stepValue (read-string (read-line))]
        
        (if (or (checkValid (getDegrees baseTemp) (getScale baseTemp)) (checkValid (getDegrees limitTemp) (getScale limitTemp)))  ;; checks if it is a valid temperature
            (do
                (if ( < (getDegrees baseTemp) (getDegrees limitTemp))  
                    (printTable baseTemp limitTemp stepValue)
                (println "Error: base temp has to be greater than limit temp.")  ;; if the base is bigger than the limit, it produces an error
                )
            )
        (println "Error. Invalid argument")
        )
        )
    )
)