Script started on 2022-01-13 13:14:00-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="80" LINES="24"]
]0;jav86@gold21: ~/CS214/labs/01[01;32mjav86@gold21[00m:[01;34m~/CS214/labs/01[00m$ c cat circle_area.adb
-- circle_area.adb computes the area of a circle.
--
-- Input: The radius of the circle.
-- Precondition: The radius is a positive number.
-- Output: The area of the circle.
--
-- Begun by: Prof. Adams, CS 214 at Calvin College.
-- Completed by: Justin Voss
-- Date: 1/13/22
----------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Float_Text_IO;

procedure circle_area is

   radius, area : float; 

   -- function circleArea computes a circle's area, given its radius
   -- Parameter: r, a float
   -- Precondition: r >= 0.0
   -- Return: the area of the circle whose radius is r
   ----------------------------------------------------
   function circleArea(r: in float) return float is -- has the parameter for a number r for the function circleArea
      PI : constant := 3.1415927; -- has the value of pi
   begin -- starts the code segment
      return PI * r ** 2; -- returns the value of the area, which is pi times radius squared
   end circleArea; -- ends the code segment

begin  -- begins the block of code                         
   New_Line; -- puts a blank line
   Put_Line("To compute the area of a circle,"); -- prints a line of text
   Put("enter its radius: "); -- prints a line of text
   Get(radius); -- asks the user for an input

   area := circleArea(radius); -- assigns the variable "area" as the function call of circleArea, using the user input

   New_Line; -- blank line
   Put("The circle's area is "); -- displays a line of text
   Put(area); -- displays the calculated area
   New_Line; New_Line; -- puts two blank lines

   Put("The circle's area is "); -- displays a line of text
   Put(area, 1, 15, 0); -- prints the area, with more parameters, making the decimal place go to 15 digits
   New_Line; New_Line; -- puts two blank lines
end circle_area; -- ends the block of code

-- Put line puts every thing in that text segment on one line, and then makes a new line after.
-- Put just displays the text, but then the next thing goes right next to that, instead of a new line.
-- You can adjust the precision by changing the paramaters after the variable. In this case, it was 15 digits after the decimal point.
]0;jav86@gold21: ~/CS214/labs/01[01;32mjav86@gold21[00m:[01;34m~/CS214/labs/01[00m$ gnatmake circle_area
x86_64-linux-gnu-gcc-7 -c circle_area.adb
x86_64-linux-gnu-gnatbind-7 -x circle_area.ali
x86_64-linux-gnu-gnatlink-7 circle_area.ali
]0;jav86@gold21: ~/CS214/labs/01[01;32mjav86@gold21[00m:[01;34m~/CS214/labs/01[00m$ circle      ./circle_area

To compute the area of a circle,
enter its radius: 1

The circle's area is  3.14159E+00

The circle's area is 3.141592741012573

]0;jav86@gold21: ~/CS214/labs/01[01;32mjav86@gold21[00m:[01;34m~/CS214/labs/01[00m$ ./circle_area

To compute the area of a circle,
enter its radius: 2

The circle's area is  1.25664E+01

The circle's area is 12.566370964050293

]0;jav86@gold21: ~/CS214/labs/01[01;32mjav86@gold21[00m:[01;34m~/CS214/labs/01[00m$ ./circle_area

To compute the area of a circle,
enter its radius: 2.5

The circle's area is  1.96350E+01

The circle's area is 19.634954452514648

]0;jav86@gold21: ~/CS214/labs/01[01;32mjav86@gold21[00m:[01;34m~/CS214/labs/01[00m$ 4.99999       ./circle_area

To compute the area of a circle,
enter its radius: 4.99999

The circle's area is  7.85395E+01

The circle's area is 78.539505004882813

]0;jav86@gold21: ~/CS214/labs/01[01;32mjav86@gold21[00m:[01;34m~/CS214/labs/01[00m$ exit
exit

Script done on 2022-01-13 13:15:32-05:00 [COMMAND_EXIT_CODE="0"]
