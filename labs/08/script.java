Script started on 2022-03-08 22:01:54-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="74" LINES="24"]
]0;jav86@remotel3: ~/CS214/labs/08[01;32mjav86@remotel3[00m:[01;34m~/CS214/labs/08[00m$ cat NameTester.javajava -ea NameTestercat NameTester.java
/* NameTester.java is a 'driver' to test class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Justin Voss
 * Date: 3/10/22
 ************************************************************/

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

      System.out.println("All tests passed!");
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
  };


]0;jav86@remotel3: ~/CS214/labs/08[01;32mjav86@remotel3[00m:[01;34m~/CS214/labs/08[00m$ cat NameTester.javajava -ea NameTester[10Pmake java
javac -deprecation NameTester.java
]0;jav86@remotel3: ~/CS214/labs/08[01;32mjav86@remotel3[00m:[01;34m~/CS214/labs/08[00m$ make java[10@cat NameTester.javajava -ea NameTester
John Paul Jones
All tests passed!
]0;jav86@remotel3: ~/CS214/labs/08[01;32mjav86@remotel3[00m:[01;34m~/CS214/labs/08[00m$ script      exit

Script done on 2022-03-08 22:02:17-05:00 [COMMAND_EXIT_CODE="0"]
