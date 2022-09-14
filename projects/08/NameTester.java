/* NameTester.java is a 'driver' to test class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Justin Voss
 * Date: 3/10/22
 ************************************************************/
import java.io.*;
import java.util.Scanner;

public class NameTester  
{
  public static void main(String[] args)
  {
      Name aName = new Name("John", "Paul", "Jones");
//
      assert aName.getFirst().equals("John") ;
      assert aName.getMiddle().equals("Paul") ;
      assert aName.getLast().equals("Jones") ;
//
      System.out.println(aName);
      assert aName.toString().equals("John Paul Jones");


      // testing the mutators
      aName.setFirst("Chris");
      assert aName.getFirst().equals("Chris") ;

      aName.setMiddle("Robert");
      assert aName.getMiddle().equals("Robert") ;

      aName.setLast("Evans");
      assert aName.getLast().equals("Evans") ;
      System.out.println(aName);

      // testing the LFMI
      assert aName.lfmi().equals("Evans, Chris R");

      System.out.println("All tests passed!");

      // taking user input
      System.out.println("Enter a person's first, middle and last name:");
      aName.read();
      System.out.println(aName);

  }

}
  class Name
  {
     private String myFirst,
                    myMiddle,
                    myLast;

    public Name(String first, String middle, String last)
    {
        myFirst = first;
        myMiddle = middle;
        myLast = last;
    }

    public String getFirst()
   {
      return myFirst;
   }

   public String getMiddle()
   {
      return myMiddle;
   }

   public String getLast()
   {
      return myLast;
   }

   public String toString()
   {
      return myFirst + ' ' + myMiddle + ' ' + myLast;
   }
   // sets the first name
   void setFirst(String first)
   {
      myFirst = first;
   }
   // sets the middle name
   void setMiddle(String middle)
   {
      myMiddle = middle;
   }
   // sets the last name
   void setLast(String last)
   {
      myLast = last;
   }

   // this function puts the name in last, first, middle initial order
   String lfmi() 
   {
      return myLast + ", " + myFirst + " " + myMiddle.charAt(0); // charAt gets the character at an indexed location
   }

   // creates a new scanner for user input
   Scanner input = new Scanner(System.in);

   // this function reads user input and puts it into the name variables
   void read()
   {
      myFirst = input.nextLine(); // next line gets the next line of the user input
      myMiddle = input.nextLine();
      myLast = input.nextLine();
   }

  };


