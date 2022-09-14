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
    
}