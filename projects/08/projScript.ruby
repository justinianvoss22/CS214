Script started on 2022-03-10 14:08:57-05:00 [TERM="xterm-256color" TTY="/dev/pts/2" COLUMNS="80" LINES="24"]
]0;jav86@gold20: ~/CS214/projects/08[01;32mjav86@gold20[00m:[01;34m~/CS214/projects/08[00m$ cat NameTester.rb
# NameTester.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Justin Voss
# Date: 3/10/22
####################################################

require 'test/unit/assertions'   # needed for assert
include Test::Unit::Assertions



class Name 
   # This function initializes the first, middle, and last names
   def initialize(first, middle, last)
      @first, @middle, @last = first, middle, last
    end

    # accessor method. By changing this to attr_accessor, it is now used for reading and writing
    attr_accessor :first, :middle, :last



    # This function concatenates the 3 parts of the name together
    def fullName
      @first + " " + @middle + " " + @last
    end

    # This function prints the name
    def print
      puts fullName # prints out the name
      fullName
    end

    # lfmi puts the name in last, first, middle initial format
    def lfmi
      return @last + ", " + @first + " " + @middle[0] + "."
    end

    # This function reads first, middle, last name from user input 
    def readName
      # gets.chomp gets a user inputted word
      @first = gets.chomp
      @middle = gets.chomp
      @last = gets.chomp
    end
end


def testName
   name = Name.new("John", "Paul", "Jones")

   assert name.first == "John", "first failed"
   assert name.middle == "Paul", "middle failed"
   assert name.last == "Jones", "last failed"
   assert name.fullName == "John Paul Jones", "fullName failed"
   assert name.print == "John Paul Jones", "print failed"

  # Testing Mutators
  name.first = "Chris"
  assert name.first == "Chris", "first failed"
  name.middle = "Robert"
  assert name.middle == "Robert", "first failed"
  name.last = "Evans"
  assert name.last == "Evans", "first failed"
  name.print
# Testing lfmi()
  puts name.lfmi
  assert name.lfmi == "Evans, Chris R.", "lfmi failed"
  print "All tests passed!\n"

  puts "Enter a first, middle, and last name: \n"
  name.readName
  name.print
end

testName

]0;jav86@gold20: ~/CS214/projects/08[01;32mjav86@gold20[00m:[01;34m~/CS214/projects/08[00m$ ruby NamTeseter       eTeseter    ter.rb
John Paul Jones
Chris Robert Evans
Evans, Chris R.
All tests passed!
Enter a first, middle, and last name: 
Justin
Andrew
Voss
Justin Andrew Voss
]0;jav86@gold20: ~/CS214/projects/08[01;32mjav86@gold20[00m:[01;34m~/CS214/projects/08[00m$ exit

Script done on 2022-03-10 14:09:30-05:00 [COMMAND_EXIT_CODE="0"]
