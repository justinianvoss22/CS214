Script started on 2022-01-27 12:55:57-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="80" LINES="24"]
]0;jav86@gold18: ~/CS214/labs/03[01;32mjav86@gold18[00m:[01;34m~/CS214/labs/03[00m$ exitjava YearCodesexit[K[Kcat circle_area.adb
cat: circle_area.adb: No such file or directory
]0;jav86@gold18: ~/CS214/labs/03[01;32mjav86@gold18[00m:[01;34m~/CS214/labs/03[00m$ cat year_cor des.adb
-- year_codes.adb converts academic year codes to corresponding years.
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
--
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

]0;jav86@gold18: ~/CS214/labs/03[01;32mjav86@gold18[00m:[01;34m~/CS214/labs/03[00m$ cat year_codes.adb[1@circle_area.adbexit[Kjava YearCodesexit[Kcat circle_area.adb[1Pyear_codes.adb[Kgnatmake year_codes
gnatmake: "year_codes" up to date.
]0;jav86@gold18: ~/CS214/labs/03[01;32mjav86@gold18[00m:[01;34m~/CS214/labs/03[00m$ ./year_codes
Enter your academic year: freshman
          1
]0;jav86@gold18: ~/CS214/labs/03[01;32mjav86@gold18[00m:[01;34m~/CS214/labs/03[00m$ ./year_codes
Enter your academic year: sophomore
          2
]0;jav86@gold18: ~/CS214/labs/03[01;32mjav86@gold18[00m:[01;34m~/CS214/labs/03[00m$ ./year_codesjun   
Enter your academic year: jum nior
          3
]0;jav86@gold18: ~/CS214/labs/03[01;32mjav86@gold18[00m:[01;34m~/CS214/labs/03[00m$ ./year_codes[7@gnatmake year_codes[7P./year_codes
Enter your academic year: senior
          4
]0;jav86@gold18: ~/CS214/labs/03[01;32mjav86@gold18[00m:[01;34m~/CS214/labs/03[00m$ ./year_codes
Enter your academic year: haha
          0
]0;jav86@gold18: ~/CS214/labs/03[01;32mjav86@gold18[00m:[01;34m~/CS214/labs/03[00m$ s exit
exit

Script done on 2022-01-27 12:57:10-05:00 [COMMAND_EXIT_CODE="0"]
