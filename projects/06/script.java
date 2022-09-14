Script started on 2022-02-17 14:28:12-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="80" LINES="24"]
]0;jav86@gold17: ~/CS214/projects/06[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/06[00m$ cat QuadRoots.java
/* QuadRoots.java computes the roots of a quadratic equation. 
 * 
 * Completed by: Justin Voss, 02/17/22
 ***************************************************************/

import java.util.Scanner;

// java class Split
public class QuadRoots
{
  // main program that calls the quadratic root checker and prints out the roots
  public static void main(String[] args)
    {
      Scanner keyboard = new Scanner(System.in);
    
      System.out.println("\nEnter a: ");  // asks the user for input
      double a = keyboard.nextInt();
      
      System.out.println("\nEnter b: ");  // asks the user for input
      double b = keyboard.nextInt();

      System.out.println("\nEnter c: ");  // asks the user for input
      double c = keyboard.nextInt();

      double[] roots = new double [2];  // makes a new array of size 2 to store the roots
      
      if (quadraticRoots(a,b,c,roots)) { // if the function returns true
        System.out.println("The roots are " + roots[0] + " and " + roots[1]); // prints out the roots 

      }
      
    }
  
  /* quadraticRoots() 
   * Receive: 	doubles a, b, c, and a double array root
   * Return:		Returns a boolean depending on if the root is valid or not. Also updates the root array to the root value.
   *****************************************************/
    public static Boolean quadraticRoots(double a, double b, double c, double [] roots)
        {
            if (a != 0) {
                double arg = Math.pow(b, 2.0) - 4 * a * c;
                if (arg >= 0) {
                   roots[0] = (-b + Math.sqrt(arg))/(2*a);  // adds the value to the first spot in the array
                   roots[1] = (-b - Math.sqrt(arg))/(2*a);  // adds the value to the second spot in the array
                   return true;
                } else {
                    System.out.println("\n*** quadraticRoots(): b^2 - 4ac is negative!" ); // prints out and returns false if the values are not valid
                    roots[0] = roots[1] = 0.0;
                   return false;
                }
             } else {
                System.out.println("\n*** QuadraticRoots(): a is zero!" );  // prints out and returns false if the values are not valid
                roots[0] = roots[1] = 0.0;
                return false;
             }
        }
}
]0;jav86@gold17: ~/CS214/projects/06[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/06[00m$ javac -0 deprecation Quar dRoots.java
]0;jav86@gold17: ~/CS214/projects/06[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/06[00m$ java Quadroots     Roots

Enter a: 
1

Enter b: 
10

Enter c: 
30

*** quadraticRoots(): b^2 - 4ac is negative!
]0;jav86@gold17: ~/CS214/projects/06[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/06[00m$ java QuadRoots1
Error: Could not find or load main class QuadRoots1
Caused by: java.lang.ClassNotFoundException: QuadRoots1
]0;jav86@gold17: ~/CS214/projects/06[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/06[00m$ java QuadRoots1
Error: Could not find or load main class QuadRoots1
Caused by: java.lang.ClassNotFoundException: QuadRoots1
]0;jav86@gold17: ~/CS214/projects/06[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/06[00m$ java QuadRoots1 

Enter a: 
1

Enter b: 
20

Enter c: 
40
The roots are -2.254033307585166 and -17.745966692414832
]0;jav86@gold17: ~/CS214/projects/06[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/06[00m$ java QuadRoots  

Enter a: 
1

Enter b: 
25

Enter c: 
45
The roots are -1.952488445135506 and -23.047511554864492
]0;jav86@gold17: ~/CS214/projects/06[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/06[00m$ java QuadRoots

Enter a: 
1

Enter b: 
10

Enter c: 
20
The roots are -2.76393202250021 and -7.23606797749979
]0;jav86@gold17: ~/CS214/projects/06[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/06[00m$ exit

Script done on 2022-02-17 14:30:54-05:00 [COMMAND_EXIT_CODE="0"]
