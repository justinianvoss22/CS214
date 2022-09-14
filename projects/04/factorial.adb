-- factorial.adb computes the factorial of an inputted number.
--
-- Input: an integer n
-- Precondition: the number n is an integer
-- Output: The factorial of the number n
--
-- Completed by: Justin Voss, 2/4/22
--------------------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Elementary_Functions;
use  Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Elementary_Functions;

procedure factorial is

    n : Integer;
    i : Integer;
    answer : Integer;
   
    -- this function computes the factorial
    function calculate_factorial (n : Integer) return Integer is

        begin
            i := 2;  
            answer := 1;       
            -- Using a for loop
            for i in 2 .. n loop
                answer := answer * i; -- times the current value * n
            end loop;
            return answer;
        end calculate_factorial;

        
    -- this block of code is used as the driver function to ask for user input
    begin
        i := 2;  
        answer := 1;                                       
        Put("To compute n!, enter n: ");    -- Prompt for input
        Get(n);
        Put(n);
        Put("! = ");
        Put(calculate_factorial(n));
end factorial;