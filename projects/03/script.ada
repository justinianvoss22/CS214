Script started on 2022-01-28 13:41:42-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="80" LINES="24"]
]0;jav86@gold18: ~/CS214/projects/03[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/03[00m$ exit./letter_gradecat letter_grade.adbgnatmake letter_grade
gnatmake: "letter_grade" up to date.
]0;jav86@gold18: ~/CS214/projects/03[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/03[00m$ gnatmake letter_gradeexit[K./letter_gradecat letter_grade.adb
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
end letter_grade;]0;jav86@gold18: ~/CS214/projects/03[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/03[00m$ cat letter_grade.adbgnatmake letter_gradeexit[K./letter_grade
Enter your score: 100
A
]0;jav86@gold18: ~/CS214/projects/03[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/03[00m$ ./letter_grade
Enter your score: 90
A
]0;jav86@gold18: ~/CS214/projects/03[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/03[00m$ ./letter_grade80  
Enter your score: 80
B
]0;jav86@gold18: ~/CS214/projects/03[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/03[00m$ ./letter_grade
Enter your score: 70
C
]0;jav86@gold18: ~/CS214/projects/03[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/03[00m$ ./letter_grade
Enter your score: 60
D
]0;jav86@gold18: ~/CS214/projects/03[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/03[00m$ ./letter_grade
Enter your score: 50
F
]0;jav86@gold18: ~/CS214/projects/03[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/03[00m$ exit
exit

Script done on 2022-01-28 13:42:30-05:00 [COMMAND_EXIT_CODE="0"]
