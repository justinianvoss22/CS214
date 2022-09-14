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
 
