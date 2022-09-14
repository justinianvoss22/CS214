Script started on 2022-02-23 11:34:14-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="80" LINES="24"]
]0;jav86@remotel1: ~/CS214/labs/07[01;32mjav86@remotel1[00m:[01;34m~/CS214/labs/07[00m$ cat Average.java
/* Average.java is a driver for method avg().
 *
 * Started by: Prof. Adams, for CS 214 at Calvin College
 *
 * Student Name: Justin Voss
 * Date: 2/24/22
 *
 * Precondition: theArray, is an array of double values.
 * Output: the average of the numbers in theArray.
 ***************************************************************/

import java.io.*;

public class Average
{
  public static void main(String[] args) {

    double[] array0 = null;
    double[] array1 = {9.0, 8.0, 7.0, 6.0};


      // output the average of the values in the arrays
     System.out.println("The first average is " + avg(array0));
     System.out.println("The second average is " + avg(array1));
  }
  

  /* sum() is a method that computes the sum of all the values
   * in an array of doubles.
   * Receive: anArray, an array of doubles.
   * Return: the sum of the values in anArray.
   ************************************************************/

  public static double sum(double[] theArray){ 
    double total = 0.0;
    for (int i = 0; i < theArray.length; i++){
        total += theArray[i];
    }
    return total;
}
  

  /* avg() is a method that computes the average of the values
   * in an array.
   * Receive: anArray, an array of doubles.
   * Return: the average of the values in anArray.
   **************************************************************/
  
  public static double avg(double anArray[])
  {
      if (anArray == null || anArray.length <= 0)
          return 0.0;
      else
          return sum(anArray) / anArray.length;
  }

}

]0;jav86@remotel1: ~/CS214/labs/07[01;32mjav86@remotel1[00m:[01;34m~/CS214/labs/07[00m$ cat Average.java[1Preadelf mysterycat Average.java[Kjavac -deprecation Average.java
]0;jav86@remotel1: ~/CS214/labs/07[01;32mjav86@remotel1[00m:[01;34m~/CS214/labs/07[00m$ ja  javac -deprecation Average.java[15Pcat Average.java[1Preadelf mysterycat Average.java                java Average
The first average is 0.0
The second average is 7.5
]0;jav86@remotel1: ~/CS214/labs/07[01;32mjav86@remotel1[00m:[01;34m~/CS214/labs/07[00m$ sc  exit

Script done on 2022-02-23 11:35:06-05:00 [COMMAND_EXIT_CODE="0"]
