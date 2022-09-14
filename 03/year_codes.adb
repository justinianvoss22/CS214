-- year_codes.adb converts academic year codes to corresponding years.
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Justin Voss, 02/17/22
-- Input: year, a string
-- Precondition: year is one of "freshman", "sophomore", "junior", "senior"
-- Output: The year code (1, 2, 3 or 4) corresponding to year.
----------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure year_codes is

   year : String(1..9) := "         ";
   charsRead : Natural;

   -- replace this comment with the definition of yearCode()
   function yearCode(year: string ) return Integer is

   begin
      if year = "freshman " then
         return 1;
      elsif year = "sophomore" then
        return 2;
      elsif year = "junior   " then
        return 3;
      elsif year = "senior   " then
        return 4;
      else
         return 0;
         end if;
   end YearCode;

   -- remember that string lengths are set lengths
begin                                          
   Put("Enter your academic year: ");           -- Prompt for input
   Get_Line(year, charsRead);                   -- Input
   Put( yearCode(year) );                       -- Convert and output
   New_Line;
end year_codes;

