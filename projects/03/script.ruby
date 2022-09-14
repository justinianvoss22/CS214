Script started on 2022-01-28 14:15:43-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="80" LINES="24"]
]0;jav86@gold18: ~/CS214/projects/03[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/03[00m$ exit./letter_gradecat letter_grade.adb[6P./letter_gradeexit[K[Kexit./letter_gradecat letter_grade.adbgnatmake letter_gradeexit[K./letter_gradecat letter_grade.adb[6P./letter_gradeexit[Kgnatmake letter_grade[1Pcat letter_grade.adb[6P./letter_gradeexit[K[Kruby letter_grade.clj
[1mTraceback[m (most recent call last):
ruby: [1mNo such file or directory -- letter_grade.clj ([1;4mLoadError[m[1m)[m
]0;jav86@gold18: ~/CS214/projects/03[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/03[00m$ ruby letter_grade.clj   rb
Enter the score: 70  100   100
Grade is: A
]0;jav86@gold18: ~/CS214/projects/03[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/03[00m$ cat letter_grade.rb
#! /usr/bin/ruby
# letter_grade.rb translates a score into a grade
# Completed by Justin Voss, 1/28/22
################################################################

# Input:  A score
# Precondition: The score is an integer
# Output: The corresponding letter grade

#  Replace this line with the definition of function yearCode() 
def letterGrade(score)
   case (score/10)
   when 10
        "A"
   when 9
        "A"
   when 8
        "B"
   when 7
        "C"
   when 6
        "D"
   else 
        "F"
 end 
end 

 
 if __FILE__ == $0
    print "Enter the score: "
    score = gets.chomp.to_i  #turns the input into an integer
    print "Grade is: "
    puts letterGrade(score)
 end]0;jav86@gold18: ~/CS214/projects/03[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/03[00m$ cat letter_grade.rb                   ruby ci  letter_grade.rb
Enter the score: 100
Grade is: A
]0;jav86@gold18: ~/CS214/projects/03[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/03[00m$ ruby letter_grade.rb
Enter the score: 90
Grade is: A
]0;jav86@gold18: ~/CS214/projects/03[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/03[00m$ ruby letter_grade.rb
Enter the score: 80
Grade is: B
]0;jav86@gold18: ~/CS214/projects/03[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/03[00m$ ruby letter_grade.rb
Enter the score: 70
Grade is: C
]0;jav86@gold18: ~/CS214/projects/03[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/03[00m$ ruby letter_grade.rb60  
Enter the score: 60
Grade is: D
]0;jav86@gold18: ~/CS214/projects/03[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/03[00m$ ruby letter_grade.rb
Enter the score: 50
Grade is: F
]0;jav86@gold18: ~/CS214/projects/03[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/03[00m$ exit
exit

Script done on 2022-01-28 14:19:07-05:00 [COMMAND_EXIT_CODE="0"]
