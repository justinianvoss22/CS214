Script started on 2022-02-24 13:17:27-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="80" LINES="24"]
]0;jav86@gold17: ~/CS214/projects/07[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/07[00m$ cat ArrayProcessing.java
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

}]0;jav86@gold17: ~/CS214/projects/07[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/07[00m$ javac -e deprecation ArrayProcessing.java
]0;jav86@gold17: ~/CS214/projects/07[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/07[00m$ java r ArrayProcessing
Number of values in the array: 
4
Enter values: 
1
2
3
4
Array: 
1.0
2.0
3.0
4.0
]0;jav86@gold17: ~/CS214/projects/07[01;32mjav86@gold17[00m:[01;34m~/CS214/projects/07[00m$ exit

Script done on 2022-02-24 13:17:54-05:00 [COMMAND_EXIT_CODE="0"]
