/* LogTable.java displays a table of logarithms.
 *
 * Input: start, stop and increment, three doubles.
 * PRE: start < stop && increment > 0.
 * Output: A table of logarithms from start to stop,
 *         with increment as the step value.
 * Begun by: Nelesen, for CS 214 at Calvin College.
 * Completed by: Justin Voss, 2/2/22
 ********************************************************/
import java.util.Scanner; 		// Get input

class LogTable{

  public static void main(String[] args){
    Scanner keyboard = new Scanner(System.in);
    System.out.println("To display a table of logarithms,");
    System.out.println("enter the start, stop and increment values: ");
    double start, stop, increment;
    start = keyboard.nextDouble();
    stop = keyboard.nextDouble();
    increment = keyboard.nextDouble();

    // add a while loop, using start, stop and increment.

    // start is less than or equal to stop, so it prints values, including the stop value.
    while (start <= stop){
      System.out.println("The logarithm of " + start + " is: " + Math.log10(start));
      
      // increments every time using the inputted increment value
      start += increment;
    }
     

  }
}

