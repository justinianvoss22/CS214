Script started on 2022-02-23 12:09:13-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="80" LINES="24"]
]0;jav86@remotel1: ~/CS214/labs/07[01;32mjav86@remotel1[00m:[01;34m~/CS214/labs/07[00m$ cat avar  erage.adb
-- average.adb "test-drives" function Average.
-- Precondition: theArray is an array of numbers.
-- Output: the average of the numbers.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Justin Voss
-- Date: 2/24/22
-----------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;             -- Put(String)
with Ada.Float_Text_IO; use Ada.Float_Text_IO; -- Put(Float)

procedure average is

-- Declare Vector type
   type Vector is array ( Positive range <>) of Float;
   
-- Define array0 as an array containing no values
   array0 : Vector := (0.0, 0.0);

-- Define array1 as an array containing 9, 8, 7, 6
   array1 : Vector := (9.0, 8.0, 7.0, 6.0);
----------------------------------------------
-- sum() sums the values in an array           -
-- Receive: anArray, an array of numbers     -
-- Return: the sum of the values in anArray. -
----------------------------------------------

function sum(A: Vector) return Float is 
    Total : Float := 0.0; 
  begin 
  --    for I in A'Range 
   for i in A'First.. A'Last  -- using ConstrainedRange to get the values in the array
    loop 
      Total := Total + A(I);   
    end loop; 
    return Total; 
  end sum; 
   

-- average() returns the average of values in an array           -
-- Receive: anArray, an array of numbers     -
-- Return: the average of the values in anArray. -
----------------------------------------------
function average( theArray : Vector ) return Float is 
   begin
      if theArray'Length = 0 then    -- checks if the array is empty
         return 0.0;  -- returns 0 if the array is empty
      end if;
      return sum(theArray) / Float(theArray'Length);  -- returns the average


   end average;

begin
   Put(" average 0 is ");
   Put( average(array0) );
   New_line;
   Put(" average 1 is ");
   Put( average(array1) );
   New_line;
end average;

]0;jav86@remotel1: ~/CS214/labs/07[01;32mjav86@remotel1[00m:[01;34m~/CS214/labs/07[00m$ gnatme ake average.adb
x86_64-linux-gnu-gcc-7 -c average.adb
x86_64-linux-gnu-gnatbind-7 -x average.ali
x86_64-linux-gnu-gnatlink-7 average.ali
]0;jav86@remotel1: ~/CS214/labs/07[01;32mjav86@remotel1[00m:[01;34m~/CS214/labs/07[00m$ ./averg age
 average 0 is  0.00000E+00
 average 1 is  7.50000E+00
]0;jav86@remotel1: ~/CS214/labs/07[01;32mjav86@remotel1[00m:[01;34m~/CS214/labs/07[00m$ exit

Script done on 2022-02-23 12:09:36-05:00 [COMMAND_EXIT_CODE="0"]
