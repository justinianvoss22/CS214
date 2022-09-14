Script started on 2022-02-23 12:38:41-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="80" LINES="24"]
]0;jav86@remotel1: ~/CS214/labs/07[01;32mjav86@remotel1[00m:[01;34m~/CS214/labs/07[00m$ cat ar verage.rb
# average.rb averages the values of an array of doubles.
# Precondition: theArray is an array of numbers
# Output: the average of the values in theArray
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by:: Justin Voss
# Date:   2/24/22
########################################################

###############################################
# sum() sums the values in an array
# Receive: anArray, an array of numbers
# Return: the sum of the values in anArray.
################################################

def sum(anArray)
   # initialize total as zero
   total = 0.0
   # for each item in the array, add the value to total
   anArray.each { |item| total = total + item}
   return total
end


###############################################
# average() gets the average of the values in an array
# Receive: anArray, an array of numbers
# Return: the average of the values in anArray.
################################################
def average(anArray)
   if anArray.empty? # if the array is empty, return 0.
      return 0.0
   end
   return sum(anArray) / anArray.size  # returns the average

end

def main
   # Define array0 as an Array containing no values
   array0 = Array.new
   # Define array1 as an Array containing 9.0, 8.0, 7.0, 6.0
   array1 = [9.0, 8.0, 7.0, 6.0]
   puts "sum 0 is: #{ sum(array0) }\n"
   puts "sum 1 is: #{ sum(array1) }\n"

   puts "average 0 is: #{ average(array0) }\n"
   puts "average 1 is: #{ average(array1) }\n"
end

main

]0;jav86@remotel1: ~/CS214/labs/07[01;32mjav86@remotel1[00m:[01;34m~/CS214/labs/07[00m$ j ruby average.rb
sum 0 is: 0.0
sum 1 is: 30.0
average 0 is: 0.0
average 1 is: 7.5
]0;jav86@remotel1: ~/CS214/labs/07[01;32mjav86@remotel1[00m:[01;34m~/CS214/labs/07[00m$ exit

Script done on 2022-02-23 12:39:00-05:00 [COMMAND_EXIT_CODE="0"]
