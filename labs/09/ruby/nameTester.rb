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

