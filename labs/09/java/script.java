Script started on 2022-03-16 13:25:34-04:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="74" LINES="24"]
]0;jav86@remotel2: ~/CS214/labs/09/java[01;32mjav86@remotel2[00m:[01;34m~/CS214/labs/09/java[00m$ cat NameTester.java
/* NameTester.java is a 'driver' to test class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Justin Voss
 * Date: 03/17/22
 ************************************************************/

public class NameTester  
{
  public static void main(String[] args)
  {
      Name aName = new Name("John", "Paul", "Jones");

      assert aName.getFirst().equals("John") ;
      assert aName.getMiddle().equals("Paul") ;
      assert aName.getLast().equals("Jones") ;

      System.out.println(aName);
      assert aName.toString().equals("John Paul Jones");

      System.out.println("All tests passed!");
  }
}

]0;jav86@remotel2: ~/CS214/labs/09/java[01;32mjav86@remotel2[00m:[01;34m~/CS214/labs/09/java[00m$ cat NameTester.java[4Pjava NameTesterc -deprecation NameTester.java
]0;jav86@remotel2: ~/CS214/labs/09/java[01;32mjav86@remotel2[00m:[01;34m~/CS214/labs/09/java[00m$ javac -deprecation NameTester.java[15Pcat NameTester.java[4Pjava NameTester
John Paul Jones
All tests passed!
]0;jav86@remotel2: ~/CS214/labs/09/java[01;32mjav86@remotel2[00m:[01;34m~/CS214/labs/09/java[00m$ exit

Script done on 2022-03-16 13:25:54-04:00 [COMMAND_EXIT_CODE="0"]
