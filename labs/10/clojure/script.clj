Script started on 2022-03-24 13:03:28-04:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="80" LINES="24"]
]0;jav86@gold29: ~/CS214/labs/10/clojure[01;32mjav86@gold29[00m:[01;34m~/CS214/labs/10/clojure[00m$ cat Bird.clj birds.clj Duck.clj Goose.clj  Owl.clj
cat: Bird.clj: No such file or directory
cat: birds.clj: No such file or directory
cat: Duck.clj: No such file or directory
cat: Goose.clj: No such file or directory
cat: Owl.clj: No such file or directory
]0;jav86@gold29: ~/CS214/labs/10/clojure[01;32mjav86@gold29[00m:[01;34m~/CS214/labs/10/clojure[00m$ [Kcd src
]0;jav86@gold29: ~/CS214/labs/10/clojure/src[01;32mjav86@gold29[00m:[01;34m~/CS214/labs/10/clojure/src[00m$ cd srcat Bird.clj birds.clj Duck.clj Goose.cclj Owl.clj
;;;; Bird.clj provides a Bird "class".
;;;; 
;;;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;; Completed by: Justin Voss
;; Date: 03/24/22
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Define a Bird 'class' with one attribute, the Bird's name.
;(defrecord Bird [name])
(defrecord Bird [name])

;;; Bird constructors
;;; - default: no args
;;;   Postcondition: name == a default value.
;;; - explicit:
;;;   Receive: itsName, a String.
;;;   Postcondition: name == itsName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Replace this line with the definition of make-Bird()...
(defn make-Bird
    ([]        (->Bird "Ann Onymous"))
    ([itsName] (->Bird itsName))
  )

;;; accessor method for name attribute
;;; Receive: this, a Bird object.
;;; Return: this's name.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Replace this line with the definition of getName()...
(defn getName [^Bird this]
    (:name this)
  )

;; define getClass, getCall, and toString as polymorphic methods
;; Note: these must be defined using defmethod instead of defn.

; Replace this line with the declarations of getClass, getCall, toString as multimethods.
(defmulti getClass class)
(defmulti getCall  class)
(defmulti toString class)


;;; method to retrieve a Bird's class
;;; Receive: this, a Bird object.
;;; Return: "Bird".
;;; Note: 'subclasses' of Bird must define this method.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Replace this line with the definition of getClass()...
(defmethod getClass Bird [ _ ]
    "Bird"
  )


;;; method to retrieve a Bird's call
;;; Receive: this, a Bird object.
;;; Return: a default bird-call.
;;; Note: 'subclasses' of Bird must define this method.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Replace this line with the definition of getCall()...
(defmethod  getCall :default [ _ ]
    "Squaaaaawk!"
 )


;;; method to combine a Bird, its class and its call into a String.
;;; Receive: this, a Bird object.
;;; Return: a String representing this, its class, and its call.
;;; Note: getClass and getCall are polymorphic methods.
;;; Note also: the use of :default for its class means that
;;;        'subclasses' may but are not required to define it.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Replace this line with the definition of toString()...

(defmethod toString :default [aBird]
    (str (getName aBird) " " (getClass aBird) " says, \"" (getCall aBird) "\"")
  )
;; birds.clj illustrates inheritance and polymorphism in Clojure.
;;
;; Output: the results of testing the Bird functions.
;;
;; Usage: clojure -m birds
;;
;; Begun by: Prof. Adams, for CS 214 Lab 10 at Calvin College.
;; Completed by: Justin Voss
;; Date: 03/24/22
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns birds
  (:require
      [Bird]
      [Duck]
      [Goose]
      [Owl]
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -main tests the classes in the Bird hierarchy.
;;; Output: the results of testing the Bird functions.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (let
    [                              ;; Birds
      bird0 (make-Bird)            ; default Bird constructor
      bird1 (make-Bird "Hawkeye")  ; explicit Bird constructor
                                   ;; Ducks
      bird2 (make-Duck)            ; default Duck constructor
      bird3 (make-Duck  "Donald")  ; explicit Duck constructor
                                   ;; Geese
      bird4 (make-Goose)           ; default Goose constructor
      bird5 (make-Goose "Mother")  ; explicit Goose constructor
                                   ;; Owls
      bird6 (make-Owl)             ; default Owl constructor
      bird7 (make-Owl "Woodsey")   ; explicit Owl constructor
    ]

    (println "\nWelcome to the Bird Park!\n")
    (println (toString bird0))
    (println (toString bird1))
    (println)
    (println (toString bird2))
    (println (toString bird3))
    (println)
    (println (toString bird4))
    (println (toString bird5))
    (println)
    (println (toString bird6))
    (println (toString bird7))
    (println)
    (println "Goodbye, and come again!\n")
    (println)
  )
)
 
;;;; Duck.clj provides a Duck "class".
;;;; 
;;;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;; Completed by: Justin Voss
;; Date: 03/24/22
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; bring in 'Bird' (to be used as superclass) 
(load "Bird")

;; define 'Duck' as 'subclass' of Bird
(defrecord Duck [^Bird name] )

;;; constructors
;;; - default: takes no arguments
;;;   Postcondition: name is initialized to a default value
;;; - explicit: takes one parameter
;;;   Receive: itsName, a String
;;;   Postcondition: name == itsName
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn make-Duck
  ([]                (->Duck "Ann Onymous"))
  ([^String itsName] (->Duck itsName))
)

;;; method to retrieve a Duck's class
;;; Receive: this, a Duck object.
;;; Return: "Duck"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmethod getClass Duck [ _ ]
  "Duck"
)

;;; method to retrieve a Duck's call
;;; Receive: this, a Duck object.
;;; Return: "Quack!"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmethod getCall Duck [ _ ]
  "Quack!"
)

;;;; Goose.clj provides a Goose "class".
;;;; 
;;;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;; Completed by: Justin Voss
;; Date: 03/24/22
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; bring in 'Bird' (to be used as 'superclass')

; Replace this line with one that loads module "Bird"


;; define 'Goose' as 'subclass' of Bird

; Replace this line with one that declares a Goose record-type
(defrecord Goose [^Bird name] )

;;; Goose constructors
;;; - default: no args
;;;   Postcondition: name == a default value. 
;;; - explicit1:
;;;   Receive: itsName, a String
;;;   Postcondition: name == itsName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Replace this line with a definition of make-Goose()...
(defn make-Goose     
    ([]                (->Goose "Ann Onymous"))
    ([^String itsName] (->Goose itsName))
  )

;;; method to retrieve a Goose's class
;;; Receive: this, a Goose object.
;;; Return: "Goose".
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Replace this line with a definition of getClass() for a Goose...
(defmethod getClass Goose [ _ ]
    "Goose"
  )
;;; method to retrieve a Goose's call
;;; Receive: this, a Goose object.
;;; Return: "Honk!"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Replace this line with a definition of getCall() for a Goose...
(defmethod getCall Goose [ _ ]
    "Honk!"
  )

;;;; Owl.clj provides an Owl "class".
;;;; 
;;;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;; Completed by: Justin Voss
;; Date: 03/24/22
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 

;; bring in 'Bird' (to be used as 'superclass')

; Replace this line with one that loads module "Bird"


;; define 'Owl' as 'subclass' of Bird

; Replace this line with one that declares a Owl record-type
(defrecord Owl [^Bird name] )

;;; Owl constructors
;;; - default: no args
;;;   Postcondition: name == a default value. 
;;; - explicit1:
;;;   Receive: itsName, a String
;;;   Postcondition: name == itsName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Replace this line with a definition of make-Owl()...
(defn make-Owl     
    ([]                (->Owl "Ann Onymous"))
    ([^String itsName] (->Owl itsName))
  )

;;; method to retrieve a Owl's class
;;; Receive: this, a Owl object.
;;; Return: "Owl".
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Replace this line with a definition of getClass() for a Owl...
(defmethod getClass Owl [ _ ]
    "Owl"
  )
;;; method to retrieve a Owl's call
;;; Receive: this, a Owl object.
;;; Return: "Honk!"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Replace this line with a definition of getCall() for a Owl...
(defmethod getCall Owl [ _ ]
    "Honk!"
  )

]0;jav86@gold29: ~/CS214/labs/10/clojure/src[01;32mjav86@gold29[00m:[01;34m~/CS214/labs/10/clojure/src[00m$ [Kcd ..
]0;jav86@gold29: ~/CS214/labs/10/clojure[01;32mjav86@gold29[00m:[01;34m~/CS214/labs/10/clojure[00m$ clojure -m Bird    birds.c  

Welcome to the Bird Park!

Ann Onymous Bird says, "Squaaaaawk!"
Hawkeye Bird says, "Squaaaaawk!"

Ann Onymous Duck says, "Quack!"
Donald Duck says, "Quack!"

Ann Onymous Goose says, "Honk!"
Mother Goose says, "Honk!"

Ann Onymous Owl says, "Honk!"
Woodsey Owl says, "Honk!"

Goodbye, and come again!


]0;jav86@gold29: ~/CS214/labs/10/clojure[01;32mjav86@gold29[00m:[01;34m~/CS214/labs/10/clojure[00m$ exit

Script done on 2022-03-24 13:04:14-04:00 [COMMAND_EXIT_CODE="0"]
