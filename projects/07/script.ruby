Script started on 2022-02-24 13:18:50-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="80" LINES="24"]
]0;jav86@gold17: ~/CS214/projects/07[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/07[00m$ cat A array+_  _processing.rb
# array_processing.rb prints out an array that was inputted by the user
# Precondition: theArray is an array of numbers
# Output: the average of the values in theArray
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by:: Justin Voss
# Date:   2/24/22
########################################################

###############################################
# read_array() reads an array from the user
# Receive: anArray, an array of numbers, and size
# Return: the array, with filled in values
################################################

def read_array(anArray,size)
    for i in 0..size-1
        anArray[i] = gets.to_i  # gets values from the user
    end

 end
 
 
 ###############################################
 # print_array() prints out the array
 # Receive: anArray, an array of numbers
 # Return: prints out the array
 ################################################
 def print_array(anArray,size)
    for i in 0..size-1 
       puts anArray[i]  # prints the array
    end
  
 
 end
 
 if __FILE__ == $0
   
    puts "Enter array size: "
    size = gets.to_i
    array1 = Array.new(size)  # Define array1 as an Array with the size as the user inputted size
    puts "Enter array values: "
    read_array(array1,size)  # calls the read array function
    puts "Array: "
    print_array(array1,size) # calls the print array function
   
 
 end
 
]0;jav86@gold17: ~/CS214/projects/07[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/07[00m$ ruby array_processing.rb
Enter array size: 
4
Enter array values: 
1
2
3
4
Array: 
1
2
3
4
]0;jav86@gold17: ~/CS214/projects/07[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/07[00m$ exit

Script done on 2022-02-24 13:19:12-05:00 [COMMAND_EXIT_CODE="0"]
