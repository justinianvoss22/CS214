Script started on 2022-01-28 13:06:32-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="101" LINES="24"]
]0;jav86@gold11: ~/CS214/projects/03[01;32mjav86@gold11[00m:[01;34m~/CS214/projects/03[00m$ cat LetterGrade.java
/* GradeSelection.java uses selection to choose from a list of cases.
 *
 * 
 * Justin Voss, 1/28/22
 ****************************************************************/

import java.util.Scanner;




   /***************************************************************
    *  LetterGrade.java uses selection to choose from a list of cases.
    *
    * Receive: year, a string.
    * PRE: year is one of {freshman, sophomore, junior, or senior}.
    * Return: the integer code corresponding to year.
    */


public class LetterGrade {

    public static void main(String[] args) {
        Scanner keyboard = new Scanner(System.in);
        System.out.println("\nEnter your score out of 100: "); // prompt
  
        String score = keyboard.next();      // read year
        System.out.println(letterGrade(Integer.parseInt(score))); // display its code
     }


    // leterGrade uses switch to return a char value. 
    public static char letterGrade(int average)
    {
        switch (average / 10)
        {
            case 10: case 9:
                return 'A';
            case 8:
                return 'B';
            case 7:
                return 'C';
            case 6:
                return 'D';
            default:
                return 'F';
        }
    }
    
}]0;jav86@gold11: ~/CS214/projects/03[01;32mjav86@gold11[00m:[01;34m~/CS214/projects/03[00m$ cat LetterGrade.javaexit[K    depre     javac -deprea cation LetterGrade.java
]0;jav86@gold11: ~/CS214/projects/03[01;32mjav86@gold11[00m:[01;34m~/CS214/projects/03[00m$ java LetterGrade

Enter your score out of 100: 
100
A
]0;jav86@gold11: ~/CS214/projects/03[01;32mjav86@gold11[00m:[01;34m~/CS214/projects/03[00m$ java LetterGrade

Enter your score out of 100: 
90
A
]0;jav86@gold11: ~/CS214/projects/03[01;32mjav86@gold11[00m:[01;34m~/CS214/projects/03[00m$ java LetterGrade80
Error: Could not find or load main class LetterGrade80
Caused by: java.lang.ClassNotFoundException: LetterGrade80
]0;jav86@gold11: ~/CS214/projects/03[01;32mjav86@gold11[00m:[01;34m~/CS214/projects/03[00m$ java LetterGrade80  

Enter your score out of 100: 
80
B
]0;jav86@gold11: ~/CS214/projects/03[01;32mjav86@gold11[00m:[01;34m~/CS214/projects/03[00m$ java LetterGrade

Enter your score out of 100: 
70
C
]0;jav86@gold11: ~/CS214/projects/03[01;32mjav86@gold11[00m:[01;34m~/CS214/projects/03[00m$ java LetterGrade

Enter your score out of 100: 
709 
C
]0;jav86@gold11: ~/CS214/projects/03[01;32mjav86@gold11[00m:[01;34m~/CS214/projects/03[00m$ java LetterGrade

Enter your score out of 100: 
60
D
]0;jav86@gold11: ~/CS214/projects/03[01;32mjav86@gold11[00m:[01;34m~/CS214/projects/03[00m$ java LetterGrade

Enter your score out of 100: 
50
F
]0;jav86@gold11: ~/CS214/projects/03[01;32mjav86@gold11[00m:[01;34m~/CS214/projects/03[00m$ java LetterGrade

Enter your score out of 100: 
40
F
]0;jav86@gold11: ~/CS214/projects/03[01;32mjav86@gold11[00m:[01;34m~/CS214/projects/03[00m$ java LetterGrade

Enter your score out of 100: 
30
F
]0;jav86@gold11: ~/CS214/projects/03[01;32mjav86@gold11[00m:[01;34m~/CS214/projects/03[00m$ exit
exit

Script done on 2022-01-28 13:08:02-05:00 [COMMAND_EXIT_CODE="0"]
