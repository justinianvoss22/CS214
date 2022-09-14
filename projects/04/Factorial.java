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
    
}