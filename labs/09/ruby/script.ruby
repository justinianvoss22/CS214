Script started on 2022-03-16 15:19:18-04:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="72" LINES="24"]
]0;jav86@remotel2: ~/CS214/labs/09/ruby[01;32mjav86@remotel2[00m:[01;34m~/CS214/labs/09/ruby[00m$ cat namTester      eTester.rb n Name.rb
# nameTester.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Justin Voss
# Date: 3/17/22
####################################################

require 'test/unit/assertions'
include Test::Unit::Assertions

#require './Name'
load './Name.rb' # used load to load a program



def testName
        # referenced the Names module
   name = Names::Name.new("John", "Paul", "Jones") 

   assert name.first == "John", 
           "first failed"
   assert name.middle == "Paul",
           "middle failed"
   assert name.last == "Jones",
           "last failed"
   assert name.fullName == "John Paul Jones",
           "fullName failed"
   assert name.print == "John Paul Jones",
           "print failed"
   
   print "All tests passed!\n"
end

testName

# Name.rb holds class Name and its operations
#
# Completed by: Justin Voss
# Date: 3/17/22
####################################################
module Names
    class Name

        def initialize(first, middle, last)
        @first, @middle, @last = first, middle, last
        end
    
        attr_reader :first, :middle, :last
    
        def fullName
        @first + " " + @middle + " " + @last
        end
    
        def print
        puts fullName
        fullName
        end
    end
end]0;jav86@remotel2: ~/CS214/labs/09/ruby[01;32mjav86@remotel2[00m:[01;34m~/CS214/labs/09/ruby[00m$ ruby nameTester.rb
John Paul Jones
All tests passed!
]0;jav86@remotel2: ~/CS214/labs/09/ruby[01;32mjav86@remotel2[00m:[01;34m~/CS214/labs/09/ruby[00m$ exit

Script done on 2022-03-16 15:19:43-04:00 [COMMAND_EXIT_CODE="0"]
