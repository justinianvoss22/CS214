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
