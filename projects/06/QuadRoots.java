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
