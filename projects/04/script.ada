Script started on 2022-02-04 14:18:53-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="90" LINES="24"]
]0;jav86@gold18: ~/CS214/projects/04[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/04[00m$ cat factorial.ada
cat: factorial.ada: No such file or directory
]0;jav86@gold18: ~/CS214/projects/04[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/04[00m$ cat factorial.adb
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
end factorial;]0;jav86@gold18: ~/CS214/projects/04[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/04[00m$ gnta  atmake factorial.adb
gnatmake: "factorial" up to date.
]0;jav86@gold18: ~/CS214/projects/04[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/04[00m$ ./factorial
To compute n!, enter n: 2
          2! =           2
]0;jav86@gold18: ~/CS214/projects/04[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/04[00m$ ./factorial
To compute n!, enter n: 3
          3! =           6
]0;jav86@gold18: ~/CS214/projects/04[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/04[00m$ ./factorial
To compute n!, enter n: 4
          4! =          24
]0;jav86@gold18: ~/CS214/projects/04[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/04[00m$ ./factorial
To compute n!, enter n: 5
          5! =         120
]0;jav86@gold18: ~/CS214/projects/04[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/04[00m$ exit
exit

Script done on 2022-02-04 14:19:33-05:00 [COMMAND_EXIT_CODE="0"]
