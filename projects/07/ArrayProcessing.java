/* ArrayProcessing.java is a driver for method printArray() and readArray().
 *
 *
 * Student Name: Justin Voss
 * Date: 2/24/22
 *
 * Precondition: anArray, with values given from user input
 * Output: a printed out result of the array
 ***************************************************************/

import java.io.*;
import java.util.Scanner;

public class ArrayProcessing

// This is the main driver for the two functions. 
{
  public static void main(String[] args) {
    System.out.println("Number of values in the array: " ); // asks the user for the size of the array
    Scanner sc = new Scanner(System.in);

    double[] anArray = new double [sc.nextInt()];              // makes an array with the user inputted value as the size
    System.out.println("Enter values: ");                     // asks the user for the values
    readArray(anArray);  // calls the read function
    printArray(anArray); // calls the print function
  }

   /* readArray() gets an array, which was given a size from the user, and adds values from the user to the array.
   * in an array.
   * Receive: anArray, an array of doubles.
   * Return: the average of the values in anArray.
   **************************************************************/
  
  public static void readArray(double anArray[])
   {
    
    Scanner sc = new Scanner(System.in);
      for (int i = 0; i < anArray.length; i++) {  // goes through array
        
        double value = sc.nextInt();              // takes user input
         anArray[i] = value;                      // assigns the array value to the user inputted value
      }
   }
  

  /* printArray prints out the array that was made by readArray
   * Receive: anArray, an array of doubles.
   * Return: prints out the array
   ************************************************************/

  public static void printArray(double anArray[])
  {
    System.out.println("Array: ");
     for (int i = 0; i < anArray.length; i++) {   // goes through the array
        System.out.println(anArray[i]);       // prints out array
     }
                            
  }

}