# aTempTester.rb tests class Temperature and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Justin Voss
# Date: 3/17/22
####################################################

require 'test/unit/assertions'
include Test::Unit::Assertions

#require './Temperature'
load './Temperature.rb' # used load to load a program



def testTemperature
        # referenced the Temperatures module
        aTemp = Temperatures::Temperature.new(32.0, 'F') 
        aTemp2 = Temperatures::Temperature.new(0.0, 'C') 
        aTemp3 = Temperatures::Temperature.new(273.15, 'K')

        baseTemp = Temperatures::Temperature.new(0.0, 'F')
        limitTemp = Temperatures::Temperature.new(0.0, 'F')

        assert aTemp.myDegrees == 32.0, 
                "first failed"
        assert aTemp.myScale == 'F',
                "middle failed"
        
        print "All tests passed!\n"

        baseTemp.readTemperature
        limitTemp.readTemperature
        puts "Enter a step value: "
        stepValue = gets.chomp.to_f
        
        baseTemp.makeTable(baseTemp,limitTemp,stepValue) # makes the table
end

testTemperature