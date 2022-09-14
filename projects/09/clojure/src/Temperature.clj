;; Temperature.clj is a module for our 'Temperature' type-abstraction.
;;
;; Completed by: Justin Voss
;; Date: 03/17/22
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Create a record/struct type named Temperature
(defrecord Temperature [myDegrees myScale])


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; checkValid checks if an argument is valid
;; Receive: degrees and scale, a double and char
;; Return: true or false, based on if it is valid or not
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn checkValid [degrees scale]
    (if (or (and (= scale  "F") (>= degrees -459.67)) (and (= scale  "C") (>= degrees -273.15)) (and (= scale  "K") (>= degrees 0.0)))
      true
      false
    )
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; make-Temperature constructs a Temperature object.
;; Receive: degrees and scale, a double and char
;; Return: the Temperature (degrees scale). 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn make-Temperature [degrees scale]
    (if (checkValid degrees scale)
    (->Temperature degrees (clojure.string/upper-case scale)) ;; converts the letter to an uppercase
    (print "Invalid argument.")
  ))
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; getDegrees extracts the degrees of a Temperature object.
  ;; Receive: aTemp, a Temperature
  ;; Return: degrees of the Temperature object
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (defn getDegrees [aTemp]
    (:myDegrees aTemp)
  )
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; getDegrees extracts the scale of a Temperature object.
  ;; Receive: aTemp, a Temperature
  ;; Return: degrees of the Temperature object
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (defn getScale [aTemp]
    (:myScale aTemp)
  )
  
 
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; toFahrenheit converts a Temperature to a new Temperature in Fahrenheit
  ;; Receive: aTemp, a Temperature object
  ;; Returns: a Temperature object, in Fahrenheit
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (defn toFahrenheit [aTemp]
    (if (= (getScale aTemp) "C")
        (make-Temperature (+ (* (getDegrees aTemp) (/ 9.0 5.0)) 32) "F")
    (if (= (getScale aTemp) "K") 
            (make-Temperature (+ (* (- (getDegrees aTemp) 273.15) (/ 9.0 5.0)) 32) "F")
    (make-Temperature (getDegrees aTemp) (getScale aTemp))
        )
      )
  )

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; ;; toCelsius converts a Temperature to a new Temperature in Celsius
  ;; ;; Receive: aTemp, a Temperature object
  ;; ;; Returns: a Temperature object, in Celsius
  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (defn toCelsius [aTemp]
    (if (= (getScale aTemp) "F")
        (make-Temperature (* (- (getDegrees aTemp) 32) (/ 5.0 9.0)) "C")
    (if (= (getScale aTemp) "K") 
            (make-Temperature (- (getDegrees aTemp) 273.15) "C")
    (make-Temperature (getDegrees aTemp) (getScale aTemp))
        )
      )
  )

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; ;; toKelvin converts a Temperature to a new Temperature in Kelvin
  ;; ;; Receive: aTemp, a Temperature object
  ;; ;; Returns: a Temperature object, in Kelvin
  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (defn toKelvin [aTemp]
    (if (= (getScale aTemp) "F")
        (make-Temperature (+ (* (- (getDegrees aTemp) 32.0) (/ 5.0 9.0)) 273.15) "K")
    (if (= (getScale aTemp) "C") 
            (make-Temperature (+ (getDegrees aTemp) 273.15) "K")
    (make-Temperature (getDegrees aTemp) (getScale aTemp))
        )
      )
  )

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; readTemperature reads a Temperature object from user input
  ;; 
  ;; Returns: a Temperature object, from user input
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (defn readTemperature []
      (make-Temperature (read-string (read-line)) (read-line))
  )


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; printTemperature prints out a Temperature object
  ;; Receive: aTemp, a Temperature object
  ;; Returns: a Temperature object, in Fahrenheit
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (defn printTemperature [aTemp]
    (print (str (format "%.2f" (double (getDegrees aTemp)) ) "\t" (getScale aTemp) "\t"))
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; raise returns a Temperature with a degree amount higher than the Temperature received
  ;; Receive: aTemp, a Temperature object, and a double, moreDegrees
  ;; Returns: a Temperature object with a degree amount higher
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (defn raise [aTemp moreDegrees]
    (make-Temperature (+ (getDegrees aTemp) moreDegrees) (getScale aTemp))
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; lower returns a Temperature with a degree amount lower than the Temperature received
  ;; Receive: aTemp, a Temperature object, and a double, moreDegrees
  ;; Returns: a Temperature object with a degree amount lower
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (defn lower [aTemp moreDegrees]
    (make-Temperature (- (getDegrees aTemp) moreDegrees) (getScale aTemp))
  )


 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; equals Checks if two Temps are equal
  ;; Receive: aTemp, a Temperature object, and another Temperature object aTemp2
  ;;  Returns: true if they are equal, false if the are not
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (defn equals [aTemp aTemp2]
    (if (= (getScale aTemp) (getScale aTemp2))
      (= (getDegrees aTemp) (getDegrees aTemp2))
      (= (:myDegrees (toFahrenheit aTemp)) (:myDegrees (toFahrenheit aTemp2)))
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; lessThan checks if one temp is less than the other
  ;; Receive: aTemp, a Temperature object, and another Temperature object aTemp2
  ;;  Returns: true if left is less than, false if not
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (defn lessThan [aTemp aTemp2]
    (if (= (getScale aTemp) (getScale aTemp2))
      (< (getDegrees aTemp) (getDegrees aTemp2))
      (< (:myDegrees (toFahrenheit aTemp)) (:myDegrees (toFahrenheit aTemp2)))
    )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; lessThan checks if one temp is less than the other
  ;; Receive: aTemp, a Temperature object, and another Temperature object aTemp2
  ;;  Returns: true if left is less than, false if not
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn printTable [baseTemp limitTemp stepValue]
  (loop
    [base baseTemp
    limit limitTemp
    step stepValue]
    (if (lessThan base limit)
      (do
        (printTemperature (toFahrenheit base))
        (printTemperature (toCelsius base))
        (printTemperature (toKelvin base))
        (println)
        (recur (raise base step) limitTemp stepValue)
      )
    )

  )
  
  )
