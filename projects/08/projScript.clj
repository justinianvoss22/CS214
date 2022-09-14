Script started on 2022-03-10 13:32:15-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="80" LINES="24"]
]0;jav86@gold20: ~/CS214/projects/08/clojure[01;32mjav86@gold20[00m:[01;34m~/CS214/projects/08/clojure[00m$ cd src
]0;jav86@gold20: ~/CS214/projects/08/clojure/src[01;32mjav86@gold20[00m:[01;34m~/CS214/projects/08/clojure/src[00m$ cat nameTester.clj
;;;; nameTester.clj creates and tests a clojure Name type.
;;;;
;;;; Output: results of testing Name functions.
;;;;
;;;; Usage: clojure -m nameTester
;;;;
;;;; Begun by: Dr. Adams, CS 214 at Calvin College.
;;;; Completed by: Justin Voss
;;;; Date: 3/10/22
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns nameTester)   ; program name

;;; define a Clojure record named Name 
;;; (which compiles to a Java class).

(defrecord Name [firstName middleName lastName] )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; make-Name constructs a Name from three strings. 
;;; Receive: firstN, middleN and lastN, three strings.
;;; Return: the Name (firstN middleN lastN). 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn make-Name [first middle last]
  (->Name first middle last)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getFirst() extracts the first name of a Name object.
;;; Receive: aName, a Name.
;;; Return: the firstName string in aName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn getFirst [^Name aName]
  (:firstName aName)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getMiddle() extracts the middle name of a name object.
;;; Receive: aName, a Name. 
;;; Return: the middleName string in aName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
(defn getMiddle [^Name aName]
  (:middleName aName)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getLast() extracts the last name of a name object.
;;; Receive: aName, a Name. 
;;; Return: the lastName string in aName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
(defn getLast [^Name aName]
  (:lastName aName)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; setFirst() sets the first name of a name object.
;;; Receive: aName, a Name. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
(defn setFirst [^Name aName first]
  ;; puts the first name as the first name given by the parameter
  (->Name first (:middleName aName) (:lastName aName))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; setMiddle() sets the middle name of a name object.
;;; Receive: aName, a Name. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
(defn setMiddle [^Name aName middle]
;; puts the middle name as the middle name given by the parameter
  (->Name (:firstName aName) middle (:lastName aName))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; setLast() sets the last name of a name object.
;;; Receive: aName, a Name. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;; puts the last name as the last name given by the parameter
(defn setLast [^Name aName last]
  (->Name (:firstName aName) (:middleName aName) last)
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getFullName() returns a full name in F-M-L order. 
;;; Receive: aName, a Name. 
;;; Return: firstName, middleName, lastName,
;;;           separated by spaces. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn toString [^Name aName]
; concatonates the whole name together
  (str (getFirst aName) " " (getMiddle aName) " " (getLast aName))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; printName() displays a name object.
;;; Receive: aName, a Name.
;;; Output: the strings in aName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
(defn printName [^Name aName]
  (print (toString aName)) ;; prints the string
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; lfmi() displays a name object in last first middle initial format.
;;; Receive: aName, a Name.
;;; Output: the name in lfmi format
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
(defn lfmi [^Name aName]
  ;; puts the lfmi all in a big string
  (str (getLast aName) ", " (getFirst aName) " " (first (getMiddle aName)) ".")
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; read() reads user input and puts it into first, middle last names
;;; Receive: aName, a Name.
;;; Output: the name in lfmi format
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
(defn readName []

  (let [
    first (read)
    middle (read)
    last (read)
  ]
    (make-Name first middle last)
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; A simple driver to test our Name functions. 
;;; Output: the result of testing our Name functions.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (let
    [                                          ; 3 ways to construct an object:
      name1 (make-Name "John" "Paul" "Jones")  ; -using our "make-" constructor
      name2 (->Name "Jane" "Penelope" "Jones") ; -invoking constructor directly
                                               ; -mapping field-names to values
      name3 (map->Name {:lastName "Jones" :firstName "Jinx" :middleName "Joy"})
    ]
    ;; ----- SECTION 1 -----
    (println)
    (print name1) (println)
    (assert (= (getFirst name1) "John") "getFirst(1) failed")
    (assert (= (getMiddle name1) "Paul") "getMiddle(1) failed")
    (assert (= (getLast name1) "Jones") "getLast(1) failed")
    (assert (= (toString name1) "John Paul Jones") "toString(1) failed")
    (printName name1) (println)
    ;; ----- SECTION 2 -----
    (println)
    (print name2) (println)
    (assert (= (getFirst name2) "Jane") "getFirst(2) failed")
    (assert (= (getMiddle name2) "Penelope") "getMiddle(2) failed")
    (assert (= (getLast name2) "Jones") "getLast(2) failed")
    (assert (= (toString name2) "Jane Penelope Jones") "toString(2) failed")
    (printName name2) (println)
    ;; ----- SECTION 3 -----
    (println)
    (print name3) (println)
    (assert (= (getFirst name3) "Jinx") "getFirst(3) failed")
    (assert (= (getMiddle name3) "Joy") "getMiddle(3) failed")
    (assert (= (getLast name3) "Jones") "getLast(3) failed")
    (assert (= (toString name3) "Jinx Joy Jones") "toString(3) failed")
    (printName name3) (println)
    ;; ----- SECTION 4 -----
    ;; testing mutator functions
    (let
    [                                          ; 3 ways to construct an object:
      ;; make 3 variables with names to set to a name object
      firstName2 "Chris"
      middleName2 "Robert"
      lastName2 "Evans"


      ;; set them to name objects
      name4 (setFirst name1 firstName2)
      name5 (setMiddle name1 middleName2)
      name6 (setLast name1 lastName2)

      name7 (make-Name firstName2 middleName2 lastName2)
    ]
    ;; check if the names were changed by using get methods
    (assert (= (getFirst name4) "Chris") "getFirst(3) failed")
    (assert (= (getMiddle name5) "Robert") "getMiddle(3) failed")
    (assert (= (getLast name6) "Evans") "getLast(3) failed")
    (println)

    ;; check lfmi function
    (println (lfmi name7))
    (assert (= (lfmi name7) (str lastName2 ", " firstName2 " " (first middleName2) ".")) "lfmi() failed")

    (println "\nAll tests passed!\n")

  ;; testing read function
    (println "Enter first, middle, and last name: ")
  ;; makes a variable name8 assigned to a user inputted name
    (let [name8 (readName)]
    ;; print out the name
      (printName name8) (println)
      )
    )
  )
)

]0;jav86@gold20: ~/CS214/projects/08/clojure/src[01;32mjav86@gold20[00m:[01;34m~/CS214/projects/08/clojure/src[00m$ c  d ..
]0;jav86@gold20: ~/CS214/projects/08/clojure[01;32mjav86@gold20[00m:[01;34m~/CS214/projects/08/clojure[00m$ clojure -m nameTeseter    ter

#nameTester.Name{:firstName John, :middleName Paul, :lastName Jones}
John Paul Jones

#nameTester.Name{:firstName Jane, :middleName Penelope, :lastName Jones}
Jane Penelope Jones

#nameTester.Name{:firstName Jinx, :middleName Joy, :lastName Jones}
Jinx Joy Jones

Evans, Chris R.

All tests passed!

Enter first, middle, and last name: 
Justin
Andrew
Voss
Justin Andrew Voss
]0;jav86@gold20: ~/CS214/projects/08/clojure[01;32mjav86@gold20[00m:[01;34m~/CS214/projects/08/clojure[00m$ exit

Script done on 2022-03-10 13:32:42-05:00 [COMMAND_EXIT_CODE="0"]
