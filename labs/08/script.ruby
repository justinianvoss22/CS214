Script started on 2022-03-08 23:40:10-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="74" LINES="24"]
]0;jav86@remotel3: ~/CS214/labs/08[01;32mjav86@remotel3[00m:[01;34m~/CS214/labs/08[00m$ cat script        NameTester.rb
# NameTester.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Justin Voss
# Date: 3/8/22
####################################################

require 'test/unit/assertions'   # needed for assert
include Test::Unit::Assertions



class Name 
   # This function initializes the first, middle, and last names
   def initialize(first, middle, last)
      @first, @middle, @last = first, middle, last
    end
    # accessor method
    attr_reader :first, :middle, :last

    # This funciton concatenates the 3 parts of the name together
    def fullName
      @first + " " + @middle + " " + @last
    end

    # This function prints the name
    def print
      puts fullName # prints out the name
      fullName
    end
end


def testName
   name = Name.new("John", "Paul", "Jones")

   assert name.first == "John", "first failed"
   assert name.middle == "Paul", "middle failed"
   assert name.last == "Jones", "last failed"
   assert name.fullName == "John Paul Jones", "fullName failed"
   assert name.print == "John Paul Jones", "print failed"
   
   print "All tests passed!\n"
end

testName

]0;jav86@remotel3: ~/CS214/labs/08[01;32mjav86@remotel3[00m:[01;34m~/CS214/labs/08[00m$ ruby NameTester.rb
John Paul Jones
All tests passed!
]0;jav86@remotel3: ~/CS214/labs/08[01;32mjav86@remotel3[00m:[01;34m~/CS214/labs/08[00m$ exit

Script done on 2022-03-08 23:40:36-05:00 [COMMAND_EXIT_CODE="0"]
