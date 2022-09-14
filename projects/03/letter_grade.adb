-- letter_grade.adb converts scores to corresponding grades.
--
--
-- Input: score, an integer
-- Precondition: it is an integer
-- Output: The grade (A,B,C,D,F) corresponding to the score.
-- Justin Voss, 1/31/22
----------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure letter_grade is
    score : Integer;
    

   function letterGrade(score: Integer ) return string is

   begin
        case (score / 10) is
            when 10 => return "A";
            when 9 => return "A";
            when 8 => return "B";
            when 7 => return "C";
            when 6 => return "D";
            when others => return "F";
        end case;
        
   end letterGrade;

   
begin                                          
   Put("Enter your score: ");           -- Prompt for input
   Get(score);                   -- Input
   Put( letterGrade(score) );                       -- Convert and output
   New_Line;
end letter_grade;