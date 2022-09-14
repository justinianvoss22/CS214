Script started on 2022-02-03 13:20:07-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="98" LINES="26"]
]0;jav86@gold18: ~/CS214/labs/04[01;32mjav86@gold18[00m:[01;34m~/CS214/labs/04[00m$ cat logTable.rb
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
]0;jav86@gold18: ~/CS214/labs/04[01;32mjav86@gold18[00m:[01;34m~/CS214/labs/04[00m$ ruby c lob gTable.rb
Enter the start value: 1
Enter the stop value: 10
Enter the increment value: 0.5
The logarithm of 1.0 is 0.0
The logarithm of 1.5 is 0.17609125905568124
The logarithm of 2.0 is 0.3010299956639812
The logarithm of 2.5 is 0.3979400086720376
The logarithm of 3.0 is 0.47712125471966244
The logarithm of 3.5 is 0.5440680443502757
The logarithm of 4.0 is 0.6020599913279624
The logarithm of 4.5 is 0.6532125137753437
The logarithm of 5.0 is 0.6989700043360189
The logarithm of 5.5 is 0.7403626894942439
The logarithm of 6.0 is 0.7781512503836436
The logarithm of 6.5 is 0.8129133566428556
The logarithm of 7.0 is 0.8450980400142568
The logarithm of 7.5 is 0.8750612633917001
The logarithm of 8.0 is 0.9030899869919435
The logarithm of 8.5 is 0.9294189257142927
The logarithm of 9.0 is 0.9542425094393249
The logarithm of 9.5 is 0.9777236052888477
The logarithm of 10.0 is 1.0
]0;jav86@gold18: ~/CS214/labs/04[01;32mjav86@gold18[00m:[01;34m~/CS214/labs/04[00m$ exit
exit

Script done on 2022-02-03 13:20:43-05:00 [COMMAND_EXIT_CODE="0"]
