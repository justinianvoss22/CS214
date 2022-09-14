Script started on 2022-01-27 12:31:56-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="80" LINES="24"]
]0;jav86@gold18: ~/CS214/labs/03[01;32mjav86@gold18[00m:[01;34m~/CS214/labs/03[00m$ cat YearCodes.java
/* YearCodes.java is a driver for function yearCode().
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Justin Voss, 1/27/22
 ****************************************************************/

import java.util.Scanner;

public class YearCodes {

   public static void main(String[] args) {
      Scanner keyboard = new Scanner(System.in);
      System.out.println("\nEnter your academic year: "); // prompt

      String year = keyboard.next();      // read year
      System.out.println(yearCode(year)); // display its code
   }

   

   /***************************************************************
    * yearCode() converts an academic year into its integer code.
    *
    * Receive: year, a string.
    * PRE: year is one of {freshman, sophomore, junior, or senior}.
    * Return: the integer code corresponding to year.
    */

    public static int yearCode(String year)
    {
       if (year.equals("freshman"))
          return 1;
    
       else if (year.equals("sophomore"))
          return 2;
       else if (year.equals("junior"))
          return 3;
       else if (year.equals("senior"))
          return 4;
       else
          return 0;
    }

}
]0;jav86@gold18: ~/CS214/labs/03[01;32mjav86@gold18[00m:[01;34m~/CS214/labs/03[00m$ cat YearCodes.javals[Kcd home/cs/232/current/jav86/copy..[Khome/cs/232/current/jav86/copy..[Khome/cs/232/current/jav86/copy..[Khome/cs/232/current/jav86/copy..[Khome/cs/232/current/jav86/copyls[Kcat YearCodes.java[Kcat YearCodes.javals[Kcat YearCodes.java[Kd jh  javac -deprecation YearCodes.java
]0;jav86@gold18: ~/CS214/labs/03[01;32mjav86@gold18[00m:[01;34m~/CS214/labs/03[00m$ java YearCodes

Enter your academic year: 
freshman
1
]0;jav86@gold18: ~/CS214/labs/03[01;32mjav86@gold18[00m:[01;34m~/CS214/labs/03[00m$ sophomore         java YearCodes

Enter your academic year: 
sophomore
2
]0;jav86@gold18: ~/CS214/labs/03[01;32mjav86@gold18[00m:[01;34m~/CS214/labs/03[00m$ java YearCodes

Enter your academic year: 
junior
3
]0;jav86@gold18: ~/CS214/labs/03[01;32mjav86@gold18[00m:[01;34m~/CS214/labs/03[00m$ java YearCodes

Enter your academic year: 
senior
4
]0;jav86@gold18: ~/CS214/labs/03[01;32mjav86@gold18[00m:[01;34m~/CS214/labs/03[00m$ exit    java YearCodes

Enter your academic year: 
uh oh
0
]0;jav86@gold18: ~/CS214/labs/03[01;32mjav86@gold18[00m:[01;34m~/CS214/labs/03[00m$ exit
exit

Script done on 2022-01-27 12:34:10-05:00 [COMMAND_EXIT_CODE="0"]
