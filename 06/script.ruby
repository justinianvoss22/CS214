Script started on 2022-02-17 13:15:15-05:00 [TERM="xterm-256color" TTY="/dev/pts/2" COLUMNS="80" LINES="24"]
]0;jav86@gold17: ~/CS214/labs/06[01;32mjav86@gold17[00m:[01;34m~/CS214/labs/06[00m$ cat split.rb
# split.rb splits a string into two substrings.
#
# Input: A string and an integer string position to split the string by.
# Precondition: The position integer is within the range of the string size.
# Output: The substrings aString(0, position - 1) and
#   aString(pos, length() - 1).
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: Justin Voss
# Date: 2/17/22
#################################################################


# split() splits a string into its two substrings.
# Receive: aString, the string to be split,       
#        pos, the split position.                  
# PRE: 0 <= pos < the length of aString.
# Return: the substring of aString before pos, and  
#         the substring of aString from pos onwards.
######################################################

def split(aString, position)
    split_string = [aString[0,position], aString[position, aString.size]]  # put the two separated strings into an array
  return split_string

end


def main
  print "To split a string, enter the string: "; 
  the_string = gets
  print "Enter the split position: "; 
  position = gets.to_i
  split_string = split(the_string, position)
  puts "The first part is: " << split_string[0]
  puts "and the second part is: " << split_string[1]
end

main
]0;jav86@gold17: ~/CS214/labs/06[01;32mjav86@gold17[00m:[01;34m~/CS214/labs/06[00m$ ruby split.rb
To split a string, enter the string: hellp o
Enter the split position: 3
The first part is: hel
and the second part is: lo
]0;jav86@gold17: ~/CS214/labs/06[01;32mjav86@gold17[00m:[01;34m~/CS214/labs/06[00m$ ruby split.rb
To split a string, enter the string: 0 hello
Enter the split position: 0
The first part is: 
and the second part is: hello
]0;jav86@gold17: ~/CS214/labs/06[01;32mjav86@gold17[00m:[01;34m~/CS214/labs/06[00m$ ruby split.rb
To split a string, enter the string: 5
Enter the split position: ugh
The first part is: 
and the second part is: 5
]0;jav86@gold17: ~/CS214/labs/06[01;32mjav86@gold17[00m:[01;34m~/CS214/labs/06[00m$ ruby split.rb
To split a string, enter the string: hello
Enter the split position: 5
The first part is: hello
and the second part is: 
]0;jav86@gold17: ~/CS214/labs/06[01;32mjav86@gold17[00m:[01;34m~/CS214/labs/06[00m$ s exit

Script done on 2022-02-17 13:16:13-05:00 [COMMAND_EXIT_CODE="0"]
