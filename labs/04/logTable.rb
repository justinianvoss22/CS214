#! /usr/bin/ruby
# logTable.rb displays a table of logarithms
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: Justin Voss, 2/3/22
#
# Input:  The start, stop and increment values
# Precondition: The start value is less than the stop value, 
#     and the increment is greater than 0
# Output: A table of logarithms from start to stop, with increment
#     as the step value


if __FILE__ == $0
   print "Enter the start value: "
#### ADD CODE HERE TO GET THESE VALUES AS NUMBERS
   start = gets.to_f # gets input value
   print "Enter the stop value: "
####
   stop = gets.to_f # gets input value
   print "Enter the increment value: "
   increment = gets.to_f # gets input value
####   
   
#  Replace this line with a loop to display the log table 
# while loop
   while start <= stop
      puts "The logarithm of #{ start } is #{Math.log10(start)}" # prints out the statement
      start = start + increment # increments the start value
   end

end
