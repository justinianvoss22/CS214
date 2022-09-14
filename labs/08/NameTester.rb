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

