Script started on 2022-02-04 12:35:48-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="80" LINES="24"]
]0;jav86@gold18: ~/CS214/projects/04[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/04[00m$ cat Factorial.java
/* factorial.java computes the factorial of a number.
 *
 * 
 * Justin Voss, 02/04/22
 ****************************************************************/

import java.util.Scanner;


   /***************************************************************
    *  factorial.java computes the factorial of a number
    *
    * Receive: int, n
    * PRE: n is an integer
    * Return: the factorial of n
    */


public class Factorial {

    public static void main(String[] args) {
        Scanner keyboard = new Scanner(System.in);
        System.out.println("\nTo compute n!, enter n: "); // prompt
  
        String n = keyboard.next();      // read n
        System.out.println(n + "! = " + factorial(Integer.parseInt(n))); // display its code
     }


    // This function uses a for loop to compute the factorial. 
    public static double factorial(int n) {
        double answer = 1.0;
  
        for (int i = 2; i <= n; i++) {
           answer *= i;
        }
  
        return answer;
     }
    
}]0;jav86@gold18: ~/CS214/projects/04[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/04[00m$ cat Factorial.javaugh[Kpython3 main.py               javac -deprels[Kjavac -deprecation fact    Fat ctorial.java
]0;jav86@gold18: ~/CS214/projects/04[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/04[00m$ java Factorial

To compute n!, enter n: 
1
1! = 1.0
]0;jav86@gold18: ~/CS214/projects/04[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/04[00m$ java Factorial

To compute n!, enter n: 
2
2! = 2.0
]0;jav86@gold18: ~/CS214/projects/04[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/04[00m$ java Factorial

To compute n!, enter n: 
3
3! = 6.0
]0;jav86@gold18: ~/CS214/projects/04[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/04[00m$ java Factorial

To compute n!, enter n: 
4
4! = 24.0
]0;jav86@gold18: ~/CS214/projects/04[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/04[00m$ java Factorial

To compute n!, enter n: 
5
5! = 120.0
]0;jav86@gold18: ~/CS214/projects/04[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/04[00m$ script      exit
exit

Script done on 2022-02-04 12:36:51-05:00 [COMMAND_EXIT_CODE="0"]
