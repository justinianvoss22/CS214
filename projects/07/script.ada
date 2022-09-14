Script started on 2022-02-25 13:42:47-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="80" LINES="24"]
]0;jav86@gold26: ~/CS214/projects/07[01;32mjav86@gold26[00m:[01;34m~/CS214/projects/07[00m$ cat array_o processing.adb
-- array_processing.adb "test-drives" functions print_array and read_array.
-- Precondition: anArray is an array of numbers.
-- Output: prints out the array given by the user
--
-- Completed by: Justin Voss
-- Date: 2/24/22
-----------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;  with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;         -- Put(String)
with Ada.Float_Text_IO; use Ada.Float_Text_IO; -- Put(Float)
with Ada.Containers; use Ada.Containers;

--
-- This process uses read_array and print_array functions to print out an array with user-inputted values
--
procedure array_processing is
    
    type Vector is array ( Positive range <>) of Float;  -- Declare Vector type
    input : Float := 0.0;                                -- Declares input variable

-- this function creates a new empty vector with a user-inputted size
-- Input: Nothing. The user inputs a size inside the function.
-- Output: An empty vector with a user-inputted size
    function create_vector return Vector is
        size : Integer;  
    begin
        Put("Enter Size: ");
        Get(size);  -- Gets the size from the user
        declare
            anArray : Vector(1..size) := (others => 0.0);  -- makes a vector/array with the user-inputted size with values of 0.0
            begin 
            return anArray;  -- returns the array
        end;
    end create_vector;

-- this function reads values from the user into an aray
-- Input: an empty array with a specefied size
-- Output: the vector gets filled in with values
    procedure read_array(theArray  : in out Vector ) is 
    begin
        for I in 1..theArray'Length loop  -- Goes through the length of the vector
            Put("Enter Value: ");  
            Get(input); 
            theArray(I) := input;        -- Puts the array values as the user-inputted value
        end loop;
    end read_array;

-- this function prints out an array
-- Input: a vector with float values
-- Output: prints out values of the array
    procedure print_array(theArray : in Vector) is
    begin
    Put_Line("Array: ");
    for I in 1..theArray'Length loop    -- Goes through the length of the vector/array
        Put(theArray(I));    -- Prints out the array
        New_Line;
       
    end loop;
    end print_array;

    
    array1 : Vector := create_vector;  -- an empty vector is initialized
begin
-- calls both functions
    read_array(array1);
    print_array(array1);

end array_processing;]0;jav86@gold26: ~/CS214/projects/07[01;32mjav86@gold26[00m:[01;34m~/CS214/projects/07[00m$ gnatmake arrayProc    _processing.adb
gnatmake: "array_processing" up to date.
]0;jav86@gold26: ~/CS214/projects/07[01;32mjav86@gold26[00m:[01;34m~/CS214/projects/07[00m$ ./arrau y_processing
Enter Size: 6
Enter Value: 1
Enter Value: 2
Enter Value: 3
Enter Value: 4
Enter Value: 5
Enter Value: 6
Array: 
 1.00000E+00
 2.00000E+00
 3.00000E+00
 4.00000E+00
 5.00000E+00
 6.00000E+00
]0;jav86@gold26: ~/CS214/projects/07[01;32mjav86@gold26[00m:[01;34m~/CS214/projects/07[00m$ exit

Script done on 2022-02-25 13:43:23-05:00 [COMMAND_EXIT_CODE="0"]
